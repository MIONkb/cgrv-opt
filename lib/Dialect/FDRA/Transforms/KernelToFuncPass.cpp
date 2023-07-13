//===- KernelToModulePass.cpp - Convert a kernel to a Module file which will be optimized -----------===//
#include "mlir/Dialect/Affine/IR/AffineOps.h"
#include "mlir/Dialect/Affine/Analysis/Utils.h"
#include "mlir/Dialect/Affine/Analysis/AffineAnalysis.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Dialect/SCF/IR/SCF.h"
#include "mlir/Dialect/MemRef/IR/MemRef.h"
#include "mlir/Dialect/ControlFlow/IR/ControlFlowOps.h"
// #include "mlir/Dialect/LLVMIR/LLVMDialect.h"

#include "mlir/Support/LLVM.h"
#include "mlir/Support/FileUtilities.h"
#include "mlir/Parser/Parser.h"
#include "mlir/IR/AffineExprVisitor.h"
#include "mlir/IR/BlockAndValueMapping.h"
#include "mlir/IR/Builders.h"
#include "mlir/IR/SymbolTable.h"
#include "mlir/IR/Location.h"
#include "mlir/IR/OpImplementation.h"
#include "mlir/Transforms/RegionUtils.h"

#include <iostream>
// #include <fstream>
#include <filesystem>
#include <string>

#include "llvm/ADT/ArrayRef.h"
#include "llvm/ADT/Twine.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/FileSystem.h"

#include "RAAA/Dialect/FDRA/IR/FDRA.h"
#include "RAAA/Dialect/FDRA/Transforms/Passes.h"
#include "./PassDetail.h"

using namespace llvm; // for llvm.errs()
using namespace mlir;
using namespace mlir::FDRA;

//===----------------------------------------------------------------------===//
// KERNELToFunc
//===----------------------------------------------------------------------===//

namespace
{

  // A pass that traverses Kernels in the function and extracts them to
  // individual Func/Module.
  struct KernelToFuncPass : public ExtractKernelToFuncBase<KernelToFuncPass>
  {
  public:
    void runOnOperation() override;

    //// Following functions are for pass option "kernel-explicit-datablock-trans"
    // getMemrefHeadAndFootprint(Kernel);
    void ExplicitKernelDataBLockLoadStore(FDRA::KernelOp Kernel);
    void EliminateOuterLoopAffineTrans(FDRA::KernelOp Kernel);
    AffineExpr getConstPartofAffineExpr(AffineExpr &expr);
  };
} // namespace


/// @brief Generate Explicit Kernel Data BLock
///        Load/Store of the call of kernel.
/// @param Kernel
/// Steps to create a DataBlockLoad Op:
///   Step1: when find a LoadOp, we traverse every dim(rank) of its original memref,
///    Get InductionVar(IV) of this memrefRegion
///
///   Step2: Get Lower And Upper Bound in this rank and get the lpMap and upMap 
///    that determines the min size of space. The size should be constant.
///
///   Step3: Create DataBlockLoadOp and replace original Memref in loadOp.
///
///   Step4: Change index of loadop according to the new BlockLoadOp.
///
/// Steps to create a DataBlockStore Op:
///
void KernelToFuncPass::ExplicitKernelDataBLockLoadStore(FDRA::KernelOp Kernel)
{
  MemRefRegion memrefRegion(Kernel.getLoc());
  Value memref;
  SmallVector<Value, 4> IVs;
  mlir::OpBuilder builder(Kernel.body().getContext());

  // Tofix:
  // If dependency within iteration
  // typedef SmallDenseMap<std::unique_ptr<MemRefRegion>, SmallVector<Value, 4>, 4>  RegionToLSop_t;
  // RegionToLSop_t RegionToLSMap;

  //////////
  /// Generate BlockLoadOp
  //////////
  Kernel.walk([&](AffineLoadOp loadop)
  {
    llvm::errs() << "[debug] loadop: ";loadop.dump();
    if(succeeded(memrefRegion.compute(loadop, 
                /*loopDepth=*/getNestingDepth(Kernel.getOperation())))){ /// Bind loadop and memrefRegion through compute()
      memref = memrefRegion.memref; /// original memref Op of this loadOP
      MemRefType memRefType = memref.getType().cast<MemRefType>(); /// contains shape info of original memref
      unsigned rank = memRefType.getRank(); /// dim number of original memref
      assert(rank == memrefRegion.cst.getNumDimVars() && "inconsistent memref region");      
      
      /// To fix: memIVs should be a setVector??
      // SmallVector<Value, 4> memIVs; /// stores the Interation Variables out of kernel that determined load bound
      SmallVector<AffineExpr, 4> memExprs;
      SmallVector<int64_t, 4> newMemRefShape; /// stores the new dim shape of blockloadOp which will replace oringinal memref

      /////////////
      /// Step1: Get InductionVar(IV) of this memrefRegion
      /////////////

      memrefRegion.cst.getValues(memrefRegion.cst.getNumDimVars(),
          memrefRegion.cst.getNumDimAndSymbolVars(), &IVs);
      // assert(IVs.size() <= 1  /// To fix: if IVs.size() > 1 ?
      //       && " This kernel should only have 1 outer IV as input arguments.");

      // if(IVs.size()==1){
      //   AffineForOp iv = getForInductionVarOwner(IVs.front());
      //   memIVs.push_back(iv.getInductionVar());          
      // }

      /// For different dim of original memref
      for (unsigned r = 0; r < rank; r++) {
        AffineExpr lbExpr_minspace, ubExpr_minspace;

        /////////////
        /// Step2: Get Lower And Upper Bound in this rank and get the lpMap and upMap 
        /// that determines the min size of space. The size should be constant.
        /////////////
        AffineMap lbMap, ubMap;
        memrefRegion.getLowerAndUpperBound(r, lbMap, ubMap);
        assert(lbMap.getNumDims() == IVs.size() && ubMap.getNumDims() == IVs.size()\
              && " Num of bound's dim should be the same with num of IVs!");
        // llvm::errs() << "[debug] lbMap: " << lbMap << " , ubMap: "<< ubMap << "\n";
        int64_t min_space = -1;
        for(AffineExpr lbExpr : lbMap.getResults()){
          for(AffineExpr ubExpr : ubMap.getResults()){
            AffineExpr diffExpr = ubExpr - lbExpr;
            diffExpr = simplifyAffineExpr(diffExpr, lbMap.getNumDims(), lbMap.getNumSymbols());
            if(diffExpr.isSymbolicOrConstant()){
              /// Found a Constant diff
              AffineConstantExpr diffExpr_const=diffExpr.dyn_cast<AffineConstantExpr>();
              if(diffExpr_const.getValue()==memRefType.getNumElements() && min_space==-1){
                /// This upper and lowerbound is constrained by 
                /// original memref's size and a smaller min_space
                /// is not found yet.
                lbExpr_minspace = lbExpr;
                ubExpr_minspace = ubExpr;
                min_space = diffExpr_const.getValue();
              }
              else if(diffExpr_const.getValue() < min_space || min_space==-1){
                /// Found a smaller memory space, store the Affine Expr of lb and ub
                lbExpr_minspace = lbExpr;
                ubExpr_minspace = ubExpr;
                min_space = diffExpr_const.getValue();
              }
            }
          }
        }
        assert(min_space != -1 && 
                  " The memory space this L/S op access has different size in different Iterations!");

        memExprs.push_back(lbExpr_minspace);
        newMemRefShape.push_back(min_space);
      }
      
      /////////
      /// Step 3 :Create DataBlockLoadOp and replace original Memref in loadOp 
      /////////
      AffineMap memIVmap = AffineMap::get(IVs.size(), /*symbolCount=*/0, memExprs, builder.getContext());   /// stores corresponding AffineMap of above memIVs
      MemRefType newMemRef = MemRefType::get( (ArrayRef<int64_t>)newMemRefShape, memRefType.getElementType());
      FDRA::DataBlockLoadOp BlockLoad = builder.create<FDRA::DataBlockLoadOp>\
                (Kernel.getLoc(), memref, memIVmap, IVs, newMemRef);
      Kernel.getOperation()->getBlock()->push_back(BlockLoad);
      BlockLoad.getOperation()->moveBefore(Kernel);
      BlockLoad.setKernelName(Kernel.getKernelName());

      // llvm::errs() << "[debug] Before replace Kernel: ";Kernel.dump();
      loadop.getOperation()->replaceUsesOfWith(memref, BlockLoad.result());
      // llvm::errs() << "[debug] BlockLoad: " << BlockLoad << "\n";
      /////////
      /// Step 4 : Change index of loadop according to the new BlockLoadOp
      /////////
      
      llvm::errs() << "[debug] memIVmap: " << memIVmap << "\n";
      llvm::errs() << "[debug] BlockLoad: " << BlockLoad << "\n";
      
      /** 
       * Complete a conversion for load op's index, here is an example:
       * BlockLoadOp:
       *   %0 = FDRA.BlockLoad %arg1 [%arg9, 0] : memref<32x32xf32> -> memref<1x32xf32> 
       * LoadOp in kernel region:
       *   %2 = affine.load %arg1[%arg9 + %arg11, %arg12] : memref<32x32xf32>
       * 
       * %arg1 become %0,  %arg9 + %arg11 = %arg9 + %arg11 - %arg9 = %arg11
       * LoadOp after conversion should be:
       *   %2 = affine.load %0[%arg11, %arg12] : memref<1x32xf32>
       * 
       * This adjustment is caused by the change of head position of the memref.
       * 
       * But for another example:
       * 
       * BlockLoadOp:
       *   %0 = FDRA.BlockLoad %arg1 [%arg9, 0] : memref<32x32xf32> -> memref<8x32xf32> 
       * LoadOp in kernel region:
       *   %2 = affine.load %arg1[%arg10, %arg12] : memref<32x32xf32>
       * 
       * 
      */
      assert(memExprs.size() == rank && "Each rank should have its own affine expr.");
      SmallVector<AffineExpr, 4> LoadExprs;
      AffineMap LoadMap = loadop.getAffineMapAttr().getValue();
      for (unsigned r = 0; r < rank; r++) {
        AffineExpr LoadExpr = LoadMap.getResult(r);
        llvm::errs() << "[debug] before remove LoadExpr: " << LoadExpr << "\n";
        // operand_range LoadOperands = loadop.getMapOperands();
        AffineExpr BlockLoadExpr = memExprs[r];
        llvm::errs() << "[debug] BlockLoadExpr: " << BlockLoadExpr << "\n";       
        // llvm::errs() << "[debug] BlockLoadExpr.getKind(): " << BlockLoadExpr.getKind() << "\n";    
        assert((BlockLoadExpr.getKind() == AffineExprKind::DimId ||     // like: d0
                BlockLoadExpr.getKind() == AffineExprKind::Add   ||     // like: d0 + 32
                BlockLoadExpr.getKind() == AffineExprKind::Mul   ||     // like: d0 * 32
                BlockLoadExpr.getKind() == AffineExprKind::Constant) && // like: 32
                "Only handle '%arg9' or '%arg9 + 32' like index for BlockLoadExpr right now.");
        
        if(BlockLoadExpr.getKind() == AffineExprKind::Constant){
          LoadExpr = LoadExpr - BlockLoadExpr; /// forward the head position of LoadOp by a const value
        }
        else { 
          /// If BlockLoadExpr is : "%arg9" or "%arg9 + 32", we need to judge whether loadOp's 
          /// index contains a reference of "%arg9" first. If so, LoadExpr = LoadExpr - BlockLoadExpr
          // check(LoadExpr )

          SmallVector<Value, 1> BlkLoadOperands = getOperandInRank(BlockLoad, r);
          SmallVector<Value, 4> LoadOperands = getOperandInRank(loadop, r);
          assert(BlkLoadOperands.size() == 1 && "BlockLoadExpr could only contain one dim.");
          Value BlkLoadOperand = BlkLoadOperands[0];

          /// check whether the block Load Operand is contained by Load Operands
          unsigned input;
          for(input = 0; input < LoadOperands.size(); input++){
            if(LoadOperands[input] == BlkLoadOperand)
              break;
          }

          /// Tofix: maybe in different dim
          if(input != LoadOperands.size()){ /// find the block Load Operand in operand of loadOp
            for(unsigned dim = 0; dim < BlockLoad.getMapOperands().size(); dim++){
              if(BlockLoadExpr.isFunctionOfDim(dim) 
                &&LoadExpr.isFunctionOfDim(dim) ){
                LoadExpr = LoadExpr - BlockLoadExpr;
              }
            }
          }
        }
        LoadExprs.push_back(LoadExpr);
        llvm::errs() << "[debug] after remove LoadExpr: " << LoadExpr << "\n";
      }
      AffineMap newLoadMap = AffineMap::get(LoadMap.getNumDims(),LoadMap.getNumSymbols(),LoadExprs,builder.getContext()); 
      loadop.getOperation()->setAttr(AffineLoadOp::getMapAttrStrName(),AffineMapAttr::get(newLoadMap));
      llvm::errs() << "[debug] After replace Kernel: \n";Kernel.dump();
    } 
  });


  //////////
  /// Generate BlockStoreOp
  //////////
  SmallDenseMap<AffineStoreOp, Value, 4> StoreToMem; 
  SmallDenseMap<Value, std::unique_ptr<MemRefRegion>, 4> MemToRegion; 
  Kernel.walk([&](AffineStoreOp storeop)-> WalkResult
  {
    //////////
    /// Step 1: Get the memref region of store op. What should be noted is:
    ///  2 accesses to an identical store memref should compute their unionBoundingBox region.
    //////////
    llvm::errs() << "[debug] storeop: ";storeop.dump();
    auto region = std::make_unique<MemRefRegion>(storeop.getLoc());
    if(failed(region->compute(storeop, 
                /*loopDepth=*/getNestingDepth(Kernel.getOperation())))){ /// Bind loadop and memrefRegion through compute()
      return storeop->emitError("error obtaining memory region\n");
    }
    StoreToMem[storeop] = std::move(region->memref);

    auto it = MemToRegion.find(region->memref);
    if (it == MemToRegion.end()) {
      MemToRegion[region->memref] = std::move(region);
    } else if (failed(it->second->unionBoundingBox(*region))) {
      return storeop.getOperation()->emitWarning(
          "getMemoryFootprintBytes: unable to perform a union on a memory "
          "region");
    }
    return WalkResult::advance();
  });

  for (const auto &MemAndRegion : MemToRegion) {
    memrefRegion = *(MemAndRegion.getSecond());
    memref = memrefRegion.memref;
    // llvm::errs() << "[debug] memref: " << MemAndRegion.getFirst();
    // llvm::errs() << ", region: \n"; memrefRegion.dump();
    

    // Value SourceMemref = memrefRegion.memref; /// original memref Op of this loadOP
    MemRefType memRefType = memref.getType().cast<MemRefType>(); /// contains shape info of original memref
    unsigned rank = memRefType.getRank(); /// dim number of original memref
    assert(rank == memrefRegion.cst.getNumDimVars() && "inconsistent memref region");      
      
    /// To fix: memIVs should be a setVector??
    // SmallVector<Value, 4> memIVs; /// stores the Interation Variables out of kernel that determined load bound
    SmallVector<AffineExpr, 4> memExprs;
    SmallVector<int64_t, 4> newMemRefShape; /// stores the new dim shape of blockloadOp which will replace oringinal memref

    ////////////
    /// Step2: Get InductionVar(IV) of this memrefRegion
    /////////////

    memrefRegion.cst.getValues(memrefRegion.cst.getNumDimVars(),
        memrefRegion.cst.getNumDimAndSymbolVars(), &IVs);
    // assert(IVs.size() <= 1  /// To fix: if IVs.size() > 1 ?
    //       && " This kernel should only have 1 outer IV as input arguments.");

    /// For different dim of original memref
    for (unsigned r = 0; r < rank; r++) {
      AffineExpr lbExpr_minspace, ubExpr_minspace;

      /////////////
      /// Step3: Get Lower And Upper Bound in this rank and get the lpMap and upMap 
      /// that determines the min size of space. The size should be constant.
      /////////////
      AffineMap lbMap, ubMap;
      memrefRegion.getLowerAndUpperBound(r, lbMap, ubMap);
      assert(lbMap.getNumDims() == IVs.size() && ubMap.getNumDims() == IVs.size()\
            && " Num of bound's dim should be the same with num of IVs!");
      // llvm::errs() << "[debug] lbMap: " << lbMap << " , ubMap: "<< ubMap << "\n";
      int64_t min_space = -1;
      for(AffineExpr lbExpr : lbMap.getResults()){
        for(AffineExpr ubExpr : ubMap.getResults()){
          AffineExpr diffExpr = ubExpr - lbExpr;
          // llvm::errs() << "[debug] diffExpr: " << diffExpr << "\n";
          if(diffExpr.isSymbolicOrConstant()){
            /// Found a Constant diff
            AffineConstantExpr diffExpr_const=diffExpr.dyn_cast<AffineConstantExpr>();
            if(diffExpr_const.getValue()==memRefType.getNumElements() && min_space==-1){
              /// This upper and lowerbound is constrained by 
              /// original memref's size and a smaller min_space
              /// is not found yet.
              lbExpr_minspace = lbExpr;
              ubExpr_minspace = ubExpr;
              min_space = diffExpr_const.getValue();
            }
            else if(diffExpr_const.getValue() < min_space || min_space==-1){
              /// Found a smaller memory space, store the Affine Expr of lb and ub
              lbExpr_minspace = lbExpr;
              ubExpr_minspace = ubExpr;
              min_space = diffExpr_const.getValue();
            }
          }
          assert(min_space != -1 && 
                " The memory space this L/S op access has different size in different Iterations!");
        }
      }
      memExprs.push_back(lbExpr_minspace);
      newMemRefShape.push_back(min_space);
    }
      
    /////////
    /// Step 4 :Create DataBlockLoadOp and DataBlockStoreOp
    /////////
    AffineMap memIVmap = AffineMap::get(IVs.size(), /*symbolCount=*/0, memExprs, builder.getContext());   /// stores corresponding AffineMap of above memIVs
    MemRefType newMemRef = MemRefType::get( (ArrayRef<int64_t>)newMemRefShape, memRefType.getElementType());

    /// DataBlockLoadOp which is coupled with following DataBlockStoreOp
    FDRA::DataBlockLoadOp BlockLoad = builder.create<FDRA::DataBlockLoadOp>\
                (Kernel.getLoc(), memref, memIVmap, IVs, newMemRef);
    Kernel.getOperation()->getBlock()->push_back(BlockLoad);
    BlockLoad.getOperation()->moveBefore(Kernel);
    BlockLoad.setKernelName(Kernel.getKernelName());

    /// DataBlockStoreOp which is coupled with above DataBlockLoadOp
    FDRA::DataBlockStoreOp BlockStore = builder.create<FDRA::DataBlockStoreOp>\
                (Kernel.getLoc(), BlockLoad.result(), memref, memIVmap, IVs);
    Kernel.getOperation()->getBlock()->push_back(BlockStore);
    BlockStore.getOperation()->moveAfter(Kernel);
    BlockStore.setKernelName(Kernel.getKernelName());

    /////////
    /// Step 5 : replace original Memref in storeOp and Change index of storeop according to the new BlockLoadOp
    /////////
    for(auto StoreAndMem : StoreToMem){
      if(StoreAndMem.getSecond() == MemAndRegion.getFirst()){
        StoreAndMem.getFirst().getOperation()->replaceUsesOfWith(memref, BlockLoad.result());
        AffineStoreOp storeop =  StoreAndMem.getFirst();
        /** 
          * Complete a conversion for load op's index, here is an example:
          * BlockLoadOp:
          *   %0 = FDRA.BlockLoad %arg1 [%arg9, 0] : memref<32x32xf32> -> memref<1x32xf32> 
          * StoreOp in kernel region:
          *   %2 = affine.store %1, %arg1[%arg9 + %arg11, %arg12] : memref<32x32xf32>
          * 
          * %arg1 become %0,  %arg9 + %arg11 = %arg9 + %arg11 - %arg9 = %arg11
          * StoreOp after conversion should be:
          *   %2 = affine.store %1 ,%0[%arg11, %arg12] : memref<1x32xf32>
          * 
          * This adjustment is caused by the change of head position of the memref 
          * 
          */
        assert(memExprs.size() == rank && "Each rank should have its own affine expr.");
        SmallVector<AffineExpr, 4> StoreExprs;
        AffineMap StoreMap = storeop.getAffineMapAttr().getValue();
        for (unsigned r = 0; r < rank; r++) {
          AffineExpr StoreExpr = StoreMap.getResult(r);
          // llvm::errs() << "[debug] before remove LoadExpr: " << LoadExpr << "\n";
          // operand_range LoadOperands = loadop.getMapOperands();
          AffineExpr BlockLoadExpr = memExprs[r];
          assert((BlockLoadExpr.getKind() == AffineExprKind::DimId ||
                  BlockLoadExpr.getKind() == AffineExprKind::Add   ||
                  BlockLoadExpr.getKind() == AffineExprKind::Mul   ||
                  BlockLoadExpr.getKind() == AffineExprKind::Constant) &&
                  "Only handle '%arg9' or '%arg9 + 32' like index for BlockLoadExpr right now.");
        
          if(BlockLoadExpr.getKind() == AffineExprKind::Constant){
            StoreExpr = StoreExpr - BlockLoadExpr; /// forward the head position of LoadOp by a const value
          }
          else { 
            /// If BlockLoadExpr is : "%arg9" or "%arg9 + 32", we need to judge whether loadOp's 
            /// index contains a reference of "%arg9" first. If so, StoreExpr = StoreExpr - BlockLoadExpr;
            // check(LoadExpr )

            SmallVector<Value, 1> BlkLoadOperands = getOperandInRank(BlockLoad, r);
            SmallVector<Value, 4> StoreOperands = getOperandInRank(storeop, r);
            assert(BlkLoadOperands.size() == 1 && "BlockLoadExpr could only contain one dim.");
            Value BlkLoadOperand = BlkLoadOperands[0];

            /// check whether the block Load Operand is contained by Load Operands
            unsigned input;
            for(input = 0; input < StoreOperands.size(); input++){
              if(StoreOperands[input] == BlkLoadOperand)
                break;
            }

            /// Tofix: maybe in different dim
            if(input != StoreOperands.size()){ /// find the block Load Operand in operand of loadOp
              for( unsigned dim = 0; dim < BlockLoad.getMapOperands().size(); dim++){
                if(BlockLoadExpr.isFunctionOfDim(dim) 
                  &&StoreExpr.isFunctionOfDim(dim) ){
                  StoreExpr = StoreExpr - BlockLoadExpr;
                }
              }
            }
          }
          StoreExprs.push_back(StoreExpr);
        }
        AffineMap newStoreMap = AffineMap::get(StoreMap.getNumDims(),StoreMap.getNumSymbols(),StoreExprs,builder.getContext()); 
        storeop.getOperation()->setAttr(AffineStoreOp::getMapAttrStrName(),AffineMapAttr::get(newStoreMap));      
      }
    }
  }
}

/// @brief  Eliminate the affine transformation of the upper/lower bound
///       of most-out loop in Kernel{ }
/// @param Kernel
void KernelToFuncPass::EliminateOuterLoopAffineTrans(FDRA::KernelOp Kernel)
{
  MemRefRegion memrefRegion(Kernel.getLoc());
  Value memref;
  // Block& knBlock = Kernel.body().front(); /// kernel block
  mlir::OpBuilder builder(Kernel.body().getContext());
  // llvm::SetVector<Value> memIVs;
  llvm::SmallVector<Value, 4> IVs;

  /// Step 1:
  /// Check: whether the affine transformation of most-out loop can be eliminated.
  /// Get the IV which is out of kernel and is used in Kernel
  Kernel.walk([&](Operation *op)
  { 
    if((op->getName().getStringRef()== AffineLoadOp::getOperationName()  ||
        op->getName().getStringRef()== AffineStoreOp::getOperationName())&&
        succeeded(memrefRegion.compute(op,
                                       /*loopDepth=*/getNestingDepth(Kernel.getOperation()))))
    { /// Bind loadop and memrefRegion through compute()
      memref = memrefRegion.memref;
      MemRefType memRefType = memref.getType().cast<MemRefType>();

      unsigned rank = memRefType.getRank();
      assert(rank == memrefRegion.cst.getNumDimVars() && "inconsistent memref region");

      /////////////
      /// Get InductionVar(IV) of this memrefRegion
      /////////////

      memrefRegion.cst.getValues(memrefRegion.cst.getNumDimVars(),
                                 memrefRegion.cst.getNumDimAndSymbolVars(), &IVs);
      
      /// eliminate unused indices of load or store op
      /// Note: It is inappropriate to eliminate unused indices right after
      /// function "ExplicitKernelDataBLockLoadStore" because we can't locate
      /// the affine transformation in for bound index which can be eliminated
      /// in that way.
      eliminateUnusedIndices(op);
    } 
  });

  /// Only the bound of outer-most loop in kernel can be
  /// the affine transformation of the memIVs outside kernel
  Kernel.walk([&](AffineForOp forop)
  {
    if(forop.getOperation()->getParentOp() == Kernel.getOperation()){
      /// Get an outer-most ForOp
      if(forop.hasConstantBounds())
        return WalkResult::advance();
      /// if bound is an affine transformation of outer memIVs
      /// then the transormation can be eliminated
      ValueRange lboperands= forop.getLowerBoundOperands();
      ValueRange upoperands= forop.getUpperBoundOperands();
      assert(lboperands.size() == 1 && upoperands.size() == 1
              && "Only support the situation that both lower and upper bounds contain 1 operand.");
      
      Value operand = lboperands.front();      
      assert(lboperands.front() == upoperands.front()
              && "Outermost loop should take in only 1 operand!");
      
      AffineExpr lbExpr, ubExpr;
      AffineMap Map;
      if(FDRA::findElement(IVs, operand)!=-1){
        /// Operand is out of kernel so elimination is legal
        lbExpr = forop.getLowerBoundMap().getResult(0);
        ubExpr = forop.getUpperBoundMap().getResult(0);
        // llvm::errs() << "[debug] lbExpr: " << lbExpr << ", ubExpr: "<< ubExpr <<"\n";
        AffineExpr ConstantExpr;
        ConstantExpr = ::mlir::FDRA::getConstPartofAffineExpr(lbExpr);
        // llvm::errs() << "[debug] Constant: " << ConstantExpr<<"\n";
        Map = AffineMap::get(0, 0, ConstantExpr);
        forop.setLowerBound({}, Map);

        ConstantExpr = ::mlir::FDRA::getConstPartofAffineExpr(ubExpr);
        // llvm::errs() << "[debug] Constant: " << ConstantExpr<<"\n";
        Map = AffineMap::get(0, 0, ConstantExpr);
        forop.setUpperBound({}, Map);
      }
    }
    return WalkResult::advance(); 
  });
}



void KernelToFuncPass::runOnOperation()
{
  SymbolTable symbolTable(getOperation());
  // bool modified = false;
  unsigned cnt = 0;
  func::FuncOp topFunc;
  for (auto FuncOp : getOperation().getOps<func::FuncOp>())
  {
    cnt++;
    topFunc = FuncOp;
  }
  assert(cnt == 1 && "There should be only 1 topFunc in IR Module.");
  std::map<unsigned, FDRA::KernelOp> cnt_to_KernelOP;
  cnt = 0;

  topFunc.walk([&](FDRA::KernelOp Kernel)
  {
    // Insert just after the function.
    // Block::iterator insertPt(Kernel.getOperation()->getNextNode());
    auto KernelWalkResult = Kernel.walk([&](FDRA::KernelOp op) {
      llvm::SetVector<Value> operands;
      std::string kernelFnName =\
          Twine(op->getParentOfType<func::FuncOp>().getName()).concat("_kernel_"+std::to_string(cnt)).str();
      Kernel.setKernelName(kernelFnName);
      // Pull in instructions that can be sunk
      if (failed(sinkOperationsIntoKernelOp(op)))
        return WalkResult::interrupt();
      
      ///////////////
      /// Generate explicit data block movement (load/store) for kernel to consume
      ///////////////
      if(ExplicitDataTrans==true){
        /// generate explicit data movement around Kernel{...}
        // llvm::errs() << "[dubug] Before ExplicitKernelDataBLockLoadStore: \n";topFunc.dump();
        ExplicitKernelDataBLockLoadStore(Kernel);
        // llvm::errs() << "[dubug] After ExplicitKernelDataBLockLoadStore: \n";topFunc.dump();
        
        /// Eliminate the affine transformation of the upper/lower bound 
        /// of most-out loop in Kernel{...}
        EliminateOuterLoopAffineTrans(Kernel);

        // llvm::errs() << "[dubug] After ExplicitKernelDataBLockLoadStore, Kernel: \n";Kernel.dump();
        /// Remove unused arguments of Kernel's region
        // Kernel.walk([&](Region *region){ removeUnusedRegionArgs(*region); });
      }

      func::FuncOp NewKernelFunc = GenKernelFunc(op, operands);
      symbolTable.insert(NewKernelFunc);

      /// If option "kernel-gen-dir" is set
      if(KernelGenDir != ""){ 
        OpBuilder builder(NewKernelFunc);
        std::filesystem::create_directory(KernelGenDir+"/kernels");
        std::string KernelFilePath_str = KernelGenDir+"/kernels/"+ kernelFnName + ".mlir";
        std::error_code ec;
        llvm::raw_fd_ostream file(KernelFilePath_str, ec, sys::fs::FA_Write);
        if (ec) {
          llvm::errs() << "Error opening file: " << ec.message() << KernelFilePath_str << "\n";
          return WalkResult::advance();
        }
        llvm::errs() << "Kernel:"  << kernelFnName << "\n";
        NewKernelFunc.dump();
        // NewKernelFunc.print(llvm::errs());
        NewKernelFunc.print(file);
      }
      /// Convert FDRA.Kernel{ ... } to func.call
      OpBuilder builder(op);
      builder.create<FDRA::KernelCallOp>(op.getLoc(), NewKernelFunc, operands.getArrayRef());
      return WalkResult::advance();
    });
    if (KernelWalkResult.wasInterrupted())
      return signalPassFailure();

    
    cnt_to_KernelOP[cnt] = Kernel;
    cnt++;
  });
  unsigned kernel_num = cnt;
  for (cnt = 0; cnt < kernel_num; cnt++)
  {
    assert(cnt_to_KernelOP[cnt] && "Counter and Kernel did not match!");
    cnt_to_KernelOP[cnt].erase();
  }
  // std::cout << "[debug] after erase:\n"; topFunc.dump();
}

std::unique_ptr<OperationPass<ModuleOp>> mlir::FDRA::createExtractKernelToFuncPass()
{
  return std::make_unique<KernelToFuncPass>();
}
