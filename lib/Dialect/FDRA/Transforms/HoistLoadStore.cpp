//===- KernelToModulePass.cpp - Convert a kernel to a Module file which will be optimized -----------===//
#include "mlir/Dialect/Affine/IR/AffineOps.h"
// #include "mlir/Dialect/Affine/Analysis/Utils.h"
// #include "mlir/Dialect/Affine/Analysis/AffineAnalysis.h"
// #include "mlir/Dialect/Func/IR/FuncOps.h"
// #include "mlir/Dialect/SCF/IR/SCF.h"
#include "mlir/Dialect/MemRef/IR/MemRef.h"
// #include "mlir/Dialect/LLVMIR/LLVMDialect.h"

#include "mlir/Support/LLVM.h"
// #include "mlir/Support/FileUtilities.h"
#include "mlir/Parser/Parser.h"
#include "mlir/IR/AffineExprVisitor.h"
#include "mlir/IR/Builders.h"
#include "mlir/IR/SymbolTable.h"
#include "mlir/IR/Location.h"
#include "mlir/IR/OpImplementation.h"
#include "mlir/Transforms/RegionUtils.h"
// #include "mlir/Transforms/RegionUtils.h"
// #include "mlir/Transforms/DialectConversion.h"

// #include <iostream>
// #include <fstream>
// #include <filesystem>
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
using namespace mlir::affine;
using namespace mlir::FDRA;

//===----------------------------------------------------------------------===//
// HoistLoadStoreInLoopNest
//===----------------------------------------------------------------------===//

namespace
{
  enum class PositionRelationInLoop { SameLevel, LhsOuter, RhsOuter, NotInSameLoopNest}; 
    /// Relative position of 2 operations in loop nested
    ///  SameLevel : lhs and rhs are in same level
    ///  LhsOuter : lhs is in outer loop level
    ///  RhsOuter : rhs is in outer loop level
    ///  NotInSameLoopNest : rhs and lhs is not in the same loop-nest
  struct HoistLoadStoreInLoopNestPass : public HoistLoadStoreInLoopNestBase<HoistLoadStoreInLoopNestPass>
  {
  public:
    static bool LoadStoreSameMemAddr(AffineLoadOp loadop, AffineStoreOp storeop);
    PositionRelationInLoop getPositionRelationship(Operation* lhs, Operation* rhs); 
    void runOnOperation() override;

  };
} // namespace

#define PASS_NAME "fdra-hoist-loadstore"

/// @brief check whether the loadop and storeop are accessing the same memref
///        and the same address
/// @param loadop 
/// @param storeop 
/// @return 
bool HoistLoadStoreInLoopNestPass::
      LoadStoreSameMemAddr(AffineLoadOp loadop, AffineStoreOp storeop)
{


    Value loadMemref = loadop.getMemref();
    AffineMapAttr loadMapAttr = loadop.getAffineMapAttr();
    Operation::operand_range loadIndices = loadop.getIndices();
    
    Value storeMemref = storeop.getMemref();
    AffineMapAttr storeMapAttr = storeop.getAffineMapAttr(); 
    Operation::operand_range storeIndices = storeop.getIndices();  

    // llvm::errs() << "[info] loadop: " << loadop << "\n";   
    // llvm::errs() << "[info] loadMemref: " << loadMemref << "\n";   
    // llvm::errs() << "[info] loadMapAttr: " << loadMapAttr << "\n";   

    // llvm::errs() << "[info] storeop: " << storeop << "\n"; 
    // llvm::errs() << "[info] storeMemref: " << storeMemref << "\n"; 
    // llvm::errs() << "[info] storeMapAttr: " << storeMapAttr << "\n"; 
   
    if(loadMemref == storeMemref && loadMapAttr == storeMapAttr
              && loadIndices.size() == storeIndices.size())
    {
      for(unsigned i = 0; i < loadIndices.size(); i++){
        if(loadIndices[i] != storeIndices[i])
          return false;
      }
      return true;
    }
    else{
      return false;
    }
}


PositionRelationInLoop HoistLoadStoreInLoopNestPass::
      getPositionRelationship(Operation* lhs, Operation* rhs)
{
  Operation* lhs_parent = lhs->getParentOp();
  Operation* rhs_parent = rhs->getParentOp();  
  if( lhs_parent->getName().getStringRef() != AffineForOp::getOperationName() ||
      rhs_parent->getName().getStringRef() != AffineForOp::getOperationName())
    return PositionRelationInLoop::NotInSameLoopNest;

  AffineForOp lhsParentForOp = dyn_cast<AffineForOp>(*lhs_parent);
  AffineForOp rhsParentForOp = dyn_cast<AffineForOp>(*rhs_parent);

  /// lhs and rhs are in AffineForOp region
  if(lhsParentForOp == rhsParentForOp){
    return PositionRelationInLoop::SameLevel;
  }
  else {
    WalkResult result = lhsParentForOp.walk([&](Operation* op) -> WalkResult {
      // llvm::errs() << "[info] op name: "  << op->getName() <<"\n";
      if(op == rhs)
        return WalkResult::interrupt();
      return WalkResult::advance(); });

    if(result == WalkResult::interrupt()){
      /// Found rhs in region of lhs's parent forop,
      /// which means lhs is in outer level than rhs is.
      return PositionRelationInLoop::LhsOuter;
    }
    
    result = rhsParentForOp.walk([&](Operation* op) -> WalkResult {
      if(op == lhs)
        return WalkResult::interrupt();
      return WalkResult::advance();
    });
    if(result == WalkResult::interrupt()){
      /// Found lhs in region of rhs's parent forop,
      /// which means rhs is in outer level than lhs is.
      return PositionRelationInLoop::RhsOuter;
    }
  }
  
  return PositionRelationInLoop::NotInSameLoopNest;
}

void HoistLoadStoreInLoopNestPass::runOnOperation()
{
  /////////
  ///  TODO:
  ///  1. if load and store in if-else region ?
  ///  2. what if the load-store pair become (1 load and 2 stores) or (2 loads with 1 store) ?
  /////////
  func::FuncOp Func = getOperation();

  bool NoChange = 0;
  while(!NoChange){ // Keep walking the func until no change occurs in this func
    NoChange = 1;
    SmallVector<AffineLoadOp,  4> ToHoistLoads;
    SmallVector<AffineStoreOp, 4> ToHoistStores;
    /////////
    /// Step 1 : Get all loads op to be hoisted
    /////////
    Func.walk([&](AffineLoadOp loadop)
    {
      Operation* ParentOp = loadop.getOperation()->getParentOp();
      if(ParentOp->getName().getStringRef() == AffineForOp::getOperationName() )
      { 
        AffineForOp ParentForOp = dyn_cast<AffineForOp>(*ParentOp);
        // MemRefRegion memrefRegion(Func.getLoc());
        // Value memref;
        // SmallVector<Value, 4> IVs;
        for(Value index : loadop.getIndices()){
          if(index == ParentForOp.getInductionVar()){
            // This load op can't be hoisted because it is constrained by loop of its level. 
            return WalkResult::advance();
          }
        }
        // This load op can be hoisted because it is not constrained by IV of its parent fopOp. 
        ToHoistLoads.push_back(loadop);
        // llvm::errs() << "[info] move: " << loadop << "\n";
      }
      return WalkResult::advance();
    });

    /////////
    /// Step 2 : Get all stores op to be hoisted
    /////////
    Func.walk([&](AffineStoreOp storeop)
    {
      // llvm::errs() << "[info] -----------------------------------\n";
      // llvm::errs() << "[info] func: \n" << Func << "\n";      
      // llvm::errs() << "[info] storeop: " << storeop << "\n";
      Operation* ParentOp = storeop.getOperation()->getParentOp();
      if(ParentOp->getName().getStringRef() == AffineForOp::getOperationName() )
      { 
        AffineForOp ParentForOp = dyn_cast<AffineForOp>(*ParentOp);
        // MemRefRegion memrefRegion(Func.getLoc());
        // Value memref;
        // SmallVector<Value, 4> IVs;
        for(Value index : storeop.getIndices()){
          if(index == ParentForOp.getInductionVar()){
            // This store op can't be hoisted because it is constrained by loop of its level. 
            return WalkResult::advance();
          }
        }
        // This storeop can be hoisted because it is not constrained by IV of its parent fopOp. 
        // construct a loop-carried varaible
        ToHoistStores.push_back(storeop);
      }
      return WalkResult::advance();
    });

    /////////
    /// Step 3 : Do hoists for load-store pairs
    /////////
    SmallVector<AffineLoadOp,  4> ToHoistLoads_copy = ToHoistLoads;
    SmallVector<AffineStoreOp, 4> ToHoistStores_copy = ToHoistStores;
    for(AffineLoadOp loadop : ToHoistLoads_copy){
      /// Check whether this load occurs with a corresponding store which have
      /// the same memref and address to access. 
      /// If so, this load-store pair 
      /// should be hoisted while construct a loop-carried variable.
      for(AffineStoreOp storeop : ToHoistStores_copy){
        llvm::errs() << "[info] loadop: " << loadop << "\n";   
        llvm::errs() << "[info] storeop: " << storeop << "\n";    
        if(LoadStoreSameMemAddr(loadop, storeop)){
          AffineLoadOp* it_ld;
          AffineStoreOp* it_st;   
          PositionRelationInLoop PosRelation =
                getPositionRelationship(loadop.getOperation(), storeop.getOperation());
          switch (PosRelation)
          {
          case PositionRelationInLoop::SameLevel :
          {
            // Loadop and store op are in same level so 
            // both should be hoisted.
            NoChange = 0;

            /// Get value to be yielded
            Value toYield = storeop.getValue();

            /// Get ValueRanges of old for op
            SmallVector<Value, 4> dupIterOperands, dupIterArgs, dupYieldOperands;
            Operation* ParentOp = loadop.getOperation()->getParentOp();
            AffineForOp oldForOp = dyn_cast<AffineForOp>(*ParentOp);
            OpBuilder builder(oldForOp.getContext());
            ValueRange oldIterOperands = oldForOp.getIterOperands();
            ValueRange oldIterArgs = oldForOp.getRegionIterArgs();
            ValueRange oldYieldOperands =
                cast<AffineYieldOp>(oldForOp.getBody()->getTerminator()).getOperands();
            dupIterOperands.append(oldIterOperands.begin(), oldIterOperands.end());
            dupIterArgs.append(oldIterArgs.begin(), oldIterArgs.end());
            dupYieldOperands.append(oldYieldOperands.begin(), oldYieldOperands.end());

            /// Add new value to be yielded to dupIterOperands and dupYieldOperands
            dupIterOperands.push_back(toYield);
            dupIterArgs.push_back(toYield);
            dupYieldOperands.push_back(toYield);

            // Create a new loop with additional iterOperands, iter_args and yield
            // operands. This new loop will take the loop body of the original loop.
            AffineForOp newForOp = replaceForOpWithNewYields(
                builder, oldForOp, dupIterOperands, dupYieldOperands, dupIterArgs); 
            oldForOp.getOperation()->erase();
 
            // Move load-store pair
            loadop.getOperation()->moveBefore(newForOp);           
            storeop.getOperation()->moveAfter(newForOp);
      
            // Change the input of the new forop
            unsigned newOperandIndex = newForOp.getOperation()->getNumOperands() - 1;
            newForOp.getOperation()->setOperand(newOperandIndex, loadop);

            // Replace all uses of loadop with new iter_arg of forop
            replaceAllUsesInRegionWith( loadop.getResult(), 
                                        newForOp.getRegionIterArgs()[newOperandIndex],
                                        newForOp.getRegion());

            // Change the input of the store op
            unsigned newResultIndex = newForOp.getOperation()->getNumResults() - 1;
            Value newForResult = newForOp.getOperation()->getResult(newResultIndex);
            storeop.getOperation()
                      ->setOperand(storeop.getStoredValOperandIndex(),newForResult);
            // llvm::errs() << "[info] -----------------------------------\n";
            // llvm::errs() << "[info] after move func: \n" << Func << "\n";   
            // llvm::errs() << "[info] after newForOp: \n" << newForOp << "\n";     

            // Remove hoisted load/store ops from to-check vector
            it_ld = std::find(ToHoistLoads.begin(), ToHoistLoads.end(), loadop);
            assert(it_ld != ToHoistLoads.end());
            ToHoistLoads.erase(it_ld);
            it_st = std::find(ToHoistStores.begin(), ToHoistStores.end(), storeop);
            assert(it_st != ToHoistStores.end());
            ToHoistStores.erase(it_st);
            break;
          }

          case PositionRelationInLoop::LhsOuter :
          {
            /// load op is in outer level
            /// hoist store op only
            NoChange = 0;
            Operation* storeParentOp = storeop.getOperation()->getParentOp();
            storeop.getOperation()->moveAfter(storeParentOp);
            
            // Remove hoisted load/store ops from to-check vector
            it_ld = std::find(ToHoistLoads.begin(), ToHoistLoads.end(), loadop);
            assert(it_ld != ToHoistLoads.end());
            ToHoistLoads.erase(it_ld);
            it_st = std::find(ToHoistStores.begin(), ToHoistStores.end(), storeop);
            assert(it_st != ToHoistStores.end());
            ToHoistStores.erase(it_st);
            break;
          }

          case PositionRelationInLoop::RhsOuter : 
          {
            /// store op is in outer level
            /// hoist load op only
            NoChange = 0;
            Operation* loadopParentOp = loadop.getOperation()->getParentOp();
            loadop.getOperation()->moveBefore(loadopParentOp);

            // Remove hoisted load/store ops from to-check vector
            it_ld = std::find(ToHoistLoads.begin(), ToHoistLoads.end(), loadop);
            assert(it_ld != ToHoistLoads.end());
            ToHoistLoads.erase(it_ld);
            it_st = std::find(ToHoistStores.begin(), ToHoistStores.end(), storeop);
            assert(it_st != ToHoistStores.end());
            ToHoistStores.erase(it_st);
            break;
          }
          
          default:
            break;
          }
        }
      }
    }

    /////////
    /// Step 4 : Do hoists for remaining load/store 
    /////////
    for(AffineLoadOp loadop : ToHoistLoads){
      /// If the loadop has no corresponding store then just hoist.
      Operation* ParentOp = loadop.getOperation()->getParentOp();
      assert(ParentOp->getName().getStringRef() == AffineForOp::getOperationName());
      NoChange = 0;
      loadop.getOperation()->moveBefore(ParentOp);
    }    
    for(AffineStoreOp storeop : ToHoistStores){
      Operation* ParentOp = storeop.getOperation()->getParentOp();
      assert(ParentOp->getName().getStringRef() == AffineForOp::getOperationName());
      NoChange = 0;
      storeop.getOperation()->moveAfter(ParentOp);
    }
  }
}

std::unique_ptr<OperationPass<func::FuncOp>> mlir::FDRA::createHoistLoadStoreInLoopNestPass()
{
  return std::make_unique<HoistLoadStoreInLoopNestPass>();
}
