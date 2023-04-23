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
#include "mlir/Transforms/DialectConversion.h"

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
    static bool isSinkingBeneficiary(Operation *op);
    static bool extractBeneficiaryOps(Operation *op, llvm::SetVector<Value> existingDependencies,
                                      llvm::SetVector<Operation *> &beneficiaryOps, llvm::SmallPtrSetImpl<Value> &availableValues);
    LogicalResult sinkOperationsIntoKernelOp(FDRA::KernelOp kernelOp);
    func::FuncOp GenKernelFunc(FDRA::KernelOp KernelOp, llvm::SetVector<Value> &operands);
    //// Following functions are for pass option "kernel-explicit-datablock-trans"
    // getMemrefHeadAndFootprint(Kernel);
    void ExplicitKernelDataBLockLoadStore(FDRA::KernelOp Kernel);
    void EliminateOuterLoopAffineTrans(FDRA::KernelOp Kernel);
    AffineExpr getConstPartofAffineExpr(AffineExpr &expr);
  };
} // namespace

//===----------------------------------------------------------------------===//
// Utilities
//===----------------------------------------------------------------------===//

/// Identifies operations that are beneficial to sink into kernels. These
/// operations may not have side-effects, as otherwise sinking (and hence
/// duplicating them) is not legal.
bool KernelToFuncPass::isSinkingBeneficiary(Operation *op)
{
  return isa<arith::ConstantOp, func::ConstantOp, memref::DimOp,
             arith::SelectOp, arith::CmpIOp>(op);
}

/***
 * The purpose of this function is to determine whether
 * it is beneficial to sink an operation op into a kernel.
 * An operation can be sunk if doing so does not
 * introduce new kernel arguments.
 *
 * The function recursively checks whether each operand
 * of op can be made available via sinking or is already
 * a dependency. If all operands of op can be made available,
 * op is added to beneficiaryOps and its results are
 * marked as now available in availableValues. If an operand
 * cannot be made available via sinking or is not
 * already a dependency, the function returns false.
 *
 * The isSinkingBeneficiary function is used to check
 * whether an operation is a candidate for sinking.
 * This function returns true if the operation is one
 * of arith::ConstantOp, func::ConstantOp, memref::DimOp,
 * arith::SelectOp, or arith::CmpIOp.
 *
 *
 */
bool KernelToFuncPass::extractBeneficiaryOps(Operation *op,
                                             llvm::SetVector<Value> existingDependencies,
                                             llvm::SetVector<Operation *> &beneficiaryOps,
                                             llvm::SmallPtrSetImpl<Value> &availableValues)
{
  if (beneficiaryOps.count(op))
    return true;

  if (!isSinkingBeneficiary(op))
    return false;

  for (Value operand : op->getOperands())
  {
    // It is already visible in the kernel, keep going.
    if (availableValues.count(operand))
      continue;
    // Else check whether it can be made available via sinking or already is a
    // dependency.
    Operation *definingOp = operand.getDefiningOp();
    if ((!definingOp ||
         !extractBeneficiaryOps(definingOp, existingDependencies,
                                beneficiaryOps, availableValues)) &&
        !existingDependencies.count(operand))
      return false;
  }
  // We will sink the operation, mark its results as now available.
  beneficiaryOps.insert(op);
  for (Value result : op->getResults())
    availableValues.insert(result);
  return true;
}

LogicalResult KernelToFuncPass::sinkOperationsIntoKernelOp(FDRA::KernelOp kernelOp)
{
  Region &KernelOpBody = kernelOp.body();

  // Identify uses from values defined outside of the scope of the launch
  // operation.
  llvm::SetVector<Value> sinkCandidates;
  getUsedValuesDefinedAbove(KernelOpBody, sinkCandidates);

  llvm::SetVector<Operation *> toBeSunk;
  llvm::SmallPtrSet<Value, 4> availableValues;
  for (Value operand : sinkCandidates)
  {
    Operation *operandOp = operand.getDefiningOp();
    if (!operandOp)
      continue;
    extractBeneficiaryOps(operandOp, sinkCandidates, toBeSunk, availableValues);
  }

  // Insert operations so that the defs get cloned before uses.
  BlockAndValueMapping map;
  OpBuilder builder(KernelOpBody);
  for (Operation *op : toBeSunk)
  {
    Operation *clonedOp = builder.clone(*op, map);
    // Only replace uses within the launch op.
    for (auto pair : llvm::zip(op->getResults(), clonedOp->getResults()))
      replaceAllUsesInRegionWith(std::get<0>(pair), std::get<1>(pair),
                                 kernelOp.body());
  }
  return success();
}

//===----------------------------------------------------------------------===//
// Extract a kernel to a outlined func
//===----------------------------------------------------------------------===//

/// @brief KERNELToFunc
/// @param KernelOp
/// @param kernelFnName
/// @param operands
/// @return
func::FuncOp KernelToFuncPass::
    GenKernelFunc(FDRA::KernelOp KernelOp, llvm::SetVector<Value> &operands)
{
  Location loc = KernelOp.getLoc();
  // Create a builder with no insertion point, insertion will happen separately
  // due to symbol table manipulation
  OpBuilder builder(KernelOp.body().getContext());
  // Contains the region of code that will be outlined
  Region &KernelOpBody = KernelOp.body();
  std::string kernelFnName = KernelOp.getKernelName();

  // errs() << kernelFnName << ":\n";
  // KernelOp.dump();
  // Identify uses from values defined outside of the scope of the launch
  // operation.
  getUsedValuesDefinedAbove(KernelOpBody, operands);

  // Create the func.func operation.
  SmallVector<Type, 4> kernelOperandTypes;
  kernelOperandTypes.reserve(operands.size());
  for (Value operand : operands)
  {
    errs()  << "  operands:"; operand.dump();
    kernelOperandTypes.push_back(operand.getType());
  }
  FunctionType type =
      FunctionType::get(KernelOp.getContext(), kernelOperandTypes, {});
  func::FuncOp KernelFunc = builder.create<func::FuncOp>(loc, kernelFnName, type);
  //  std::cout << "[debug] after create:\n"; KernelFunc.dump();
  KernelFunc->setAttr(kernelFnName, builder.getUnitAttr());

  /// Pass func arguements outside of KernelOp
  Block *entryBlock = new Block;
  for (Type argTy : type.getInputs())
  {
    entryBlock->addArgument(argTy, loc);
  }

  KernelFunc.getBody().getBlocks().push_back(entryBlock);

  BlockAndValueMapping mapping;
  // Block &entryBlock = KernelFunc.getBody().front();
  for (unsigned index = 0; index < operands.size(); index++)
  {
    // errs()  << "  operands:" << operands[index] <<"\n";
    mapping.map(operands[index], entryBlock->getArgument(index));
  }
  KernelOpBody.cloneInto(&KernelFunc.getBody(), mapping);

  // Branch from entry of the soda.func operation to the block that is cloned
  // from the entry block of the gpu.launch operation
  Block &KernelOpEntry = KernelOpBody.front();
  Block *clonedKernelOpEntry = mapping.lookup(&KernelOpEntry);
  builder.setInsertionPointToEnd(entryBlock);
  builder.create<cf::BranchOp>(loc, clonedKernelOpEntry);

  KernelFunc.walk([](FDRA::TerminatorOp op)
                  {
    OpBuilder replacer(op);
    replacer.create<func::ReturnOp>(op.getLoc());
    op.erase(); });

  return KernelFunc;
}

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
      // llvm::errs() << "[debug] After replace Kernel: ";Kernel.dump();


      /////////
      /// Step 4 : Change index of loadop according to the new BlockLoadOp
      /////////
      
      // llvm::errs() << "[debug] memIVmap: " << memIVmap << "\n";
      // llvm::errs() << "[debug] BlockLoad: " << BlockLoad << "\n";
      
      /** 
       * Complete a conversion for load op's index, here is an example:
       * BlockLoadOp:
       *   %0 = FDRA.BlockLoad %arg1 [%arg9, 0] : memref<32x32xf32> -> memref<1x32xf32> 
       * LoadOp in kernel region:
       *   %2 = affine.load %arg1[%arg9 + %arg11, %arg12] : memref<1x32xf32>
       * 
       * %arg1 become %0,  %arg9 + %arg11 = %arg9 + %arg11 - %arg9 = %arg11
       * LoadOp after conversion should be:
       *   %2 = affine.load %0[%arg11, %arg12] : memref<1x32xf32>
       * 
       * This adjustment is caused by the change of head position of the memref 
       * 
      */
      assert(memExprs.size() == rank && "Each rank should have its own affine expr.");
      SmallVector<AffineExpr, 4> LoadExprs;
      AffineMap LoadMap = loadop.getAffineMapAttr().getValue();
      for (unsigned r = 0; r < rank; r++) {
        AffineExpr LoadExpr = LoadMap.getResult(r);
        // llvm::errs() << "[debug] before remove LoadExpr: " << LoadExpr << "\n";
        // operand_range LoadOperands = loadop.getMapOperands();
        AffineExpr BlockLoadExpr = memExprs[r];
        assert((BlockLoadExpr.getKind() == AffineExprKind::DimId ||
                BlockLoadExpr.getKind() == AffineExprKind::Add   ||
                BlockLoadExpr.getKind() == AffineExprKind::Constant) &&
                "Only handle '%arg9' or '%arg9 + 32' like index for BlockLoadExpr right now.");
        
        if(BlockLoadExpr.getKind() == AffineExprKind::Constant){
          LoadExpr = LoadExpr - BlockLoadExpr; /// forward the head position of LoadOp by a const value
        }
        else { 
          /// If BlockLoadExpr is : "%arg9" or "%arg9 + 32", we need to judge whether loadOp's 
          /// index contains a reference of "%arg9" first. If so, LoadExpr = LoadExpr - BlockLoadExpr
          // check(LoadExpr )
          for( unsigned dim = 0; dim < BlockLoad.getMapOperands().size(); dim++){
            if(BlockLoadExpr.isFunctionOfDim(dim) 
             &&LoadExpr.isFunctionOfDim(dim) ){
              LoadExpr = LoadExpr - BlockLoadExpr;
            }
          }
        }
        
        LoadExprs.push_back(LoadExpr);
        // llvm::errs() << "[debug] after remove LoadExpr: " << LoadExpr << "\n";
      }
      AffineMap newLoadMap = AffineMap::get(LoadMap.getNumDims(),LoadMap.getNumSymbols(),LoadExprs,builder.getContext()); 
      loadop.getOperation()->setAttr(AffineLoadOp::getMapAttrStrName(),AffineMapAttr::get(newLoadMap));
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
    /// Step 4 :Create DataBlockLoadOp 
    /////////
    AffineMap memIVmap = AffineMap::get(IVs.size(), /*symbolCount=*/0, memExprs, builder.getContext());   /// stores corresponding AffineMap of above memIVs
    MemRefType newMemRef = MemRefType::get( (ArrayRef<int64_t>)newMemRefShape, memRefType.getElementType());
    FDRA::DataBlockLoadOp BlockLoad = builder.create<FDRA::DataBlockLoadOp>\
                (Kernel.getLoc(), memref, memIVmap, IVs, newMemRef);
    Kernel.getOperation()->getBlock()->push_back(BlockLoad);
    BlockLoad.getOperation()->moveBefore(Kernel);
    BlockLoad.setKernelName(Kernel.getKernelName());

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
                    BlockLoadExpr.getKind() == AffineExprKind::Constant) &&
                    "Only handle '%arg9' or '%arg9 + 32' like index for BlockLoadExpr right now.");
        
            if(BlockLoadExpr.getKind() == AffineExprKind::Constant){
              StoreExpr = StoreExpr - BlockLoadExpr; /// forward the head position of LoadOp by a const value
            }
            else { 
              /// If BlockLoadExpr is : "%arg9" or "%arg9 + 32", we need to judge whether loadOp's 
              /// index contains a reference of "%arg9" first. If so, StoreExpr = StoreExpr - BlockLoadExpr;
              // check(LoadExpr )
              for( unsigned dim = 0; dim < BlockLoad.getMapOperands().size(); dim++){
                if(BlockLoadExpr.isFunctionOfDim(dim) 
                  &&StoreExpr.isFunctionOfDim(dim) ){
                  StoreExpr = StoreExpr - BlockLoadExpr;
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
  Kernel.walk([&](AffineLoadOp loadop)
  {
    // llvm::errs() << "[debug] loadop: ";loadop.dump();
    if (succeeded(memrefRegion.compute(loadop,
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
      // assert(IVs.size() <= 1  /// To fix: if IVs.size() > 1 ?
      //       && " This kernel should only have 1 outer IV as input arguments.");

      // if(IVs.size()==1){
      //   AffineForOp iv = getForInductionVarOwner(IVs.front());
      //   memIVs.insert(iv.getInductionVar());
      // }
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
  // for (auto Kernel : topFunc.getOps<FDRA::KernelOp>())
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
      


      // ////Test
      // Region &KernelOpBody = Kernel.body();
      // getUsedValuesDefinedAbove(KernelOpBody, operands);
      // // Create the func.func operation.
      // SmallVector<Type, 4> kernelOperandTypes;
      // kernelOperandTypes.reserve(operands.size());
      // errs()  << "[debug] topFunc:\n"; topFunc.dump();
      // for (Value operand : operands)
      // {
      //   errs()  << "  operands:"; operand.dump();
      //   kernelOperandTypes.push_back(operand.getType());
      // }
      // ////Test


      ///////////////
      /// Generate explicit data block movement (load/store) for kernel to consume
      ///////////////
      if(ExplicitDataTrans==true){
        // getMemrefHeadAndFootprint(Kernel);
        ExplicitKernelDataBLockLoadStore(Kernel);
        /// Eliminate the affine transformation of the upper/lower bound 
        /// of most-out loop in Kernel{...}
        EliminateOuterLoopAffineTrans(Kernel);
        llvm::errs() << "[debug] after ExplicitKernelDataBLockLoadStore: \n";
        topFunc.dump();
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
        NewKernelFunc.print(file);
      }
      /// Convert FDRA.Kernel{ ... } to func.call
      OpBuilder builder(op);
      builder.create<func::CallOp>(op.getLoc(), NewKernelFunc, operands.getArrayRef());
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
