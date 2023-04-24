//===- Utility.cpp - Some utility tools -----------===//
#include "mlir/Dialect/Affine/IR/AffineOps.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Dialect/SCF/IR/SCF.h"
#include "mlir/Transforms/DialectConversion.h"
#include "mlir/Support/LLVM.h"
#include <iostream>

#include "llvm/ADT/ArrayRef.h"
#include "llvm/Support/CommandLine.h"

#include "RAAA/Dialect/FDRA/IR/FDRA.h"
#include "RAAA/Dialect/FDRA/Transforms/Passes.h"
#include "./PassDetail.h"


using namespace llvm; // for llvm.errs()
using namespace mlir;
using namespace mlir::FDRA;

//===----------------------------------------------------------------------===//
// eraseKERNEL
//===----------------------------------------------------------------------===//

mlir::Operation* mlir::FDRA::eraseKernel(func::FuncOp& TopFunc, FDRA::KernelOp& Kernel){
  /// return the corresponding first op of kernel
  mlir::Operation* return_op;
  bool IsFirstOp = true;
  /// traverse every operation in TopFunc
  // errs()<<"TopFunc :\n";TopFunc.dump();
  TopFunc.walk([&](mlir::Operation* op){
    // errs()<<"op :" << op->getName().getStringRef() << "\n";
    if(op->getName().getStringRef()== FDRA::KernelOp::getOperationName()){
      /// Found a kernel op
      FDRA::KernelOp Kernel_captured = dyn_cast<FDRA::KernelOp>(op);
      if(Kernel_captured == Kernel){
        /// Found the kernel we need to handle
        /// traverse every op of every block
        for(auto blk_itr=Kernel.body().begin(); blk_itr!=Kernel.body().end(); blk_itr++){
          for(auto op_itr=(*blk_itr).begin(); op_itr!=(*blk_itr).end(); op_itr++){
            if(op_itr->getName().getStringRef()== FDRA::TerminatorOp::getOperationName()){
              /// "FDRA.terminator" do not need to be replicated
              continue;
            }
            /// clone a new op and move it to the following loc of "FDRA.kernel"
            mlir::Operation* newop = (*op_itr).clone();
            blk_itr->push_back(newop);
            newop->moveBefore(op);

            /// return the 1st newop
            if(IsFirstOp){
              return_op = newop;
              IsFirstOp = false;
            }
          }
        }
      }
    }
  });
  /// erase "FDRA.kernel"
  Kernel.erase();
  /// return the corresponding first op of kernel after erase
  return return_op;
}
 

//===----------------------------------------------------------------------===//
// SpecifiedAffineFortoKernel
//===----------------------------------------------------------------------===//
void mlir::FDRA::SpecifiedAffineFortoKernel(mlir::AffineForOp& kernelforOp){
  /// traverse every operation in TopFunc
  // errs()<<"    op :" << op->getName().getStringRef() << "\n";
  OpBuilder builder(kernelforOp.getOperation());

  // Create a kernel op and move the body region of the innermost loop into it
  Location loc = kernelforOp.getLoc();
  auto KernelOp = builder.create<FDRA::KernelOp>(loc);
  builder.setInsertionPointToEnd(&KernelOp.body().front());
  builder.create<FDRA::TerminatorOp>(loc);
  builder.setInsertionPointToStart(&KernelOp.body().front());

  // Copy root loop and its operations into the Kernel
  auto &ops = kernelforOp.getBody()->getOperations();
  KernelOp.body().front().getOperations().splice(
  KernelOp.body().front().begin(), ops, Block::iterator(kernelforOp));
}

//===----------------------------------------------------------------------===//
// getConstPartofAffineExpr(Is associated with Affine Dialect)
//===----------------------------------------------------------------------===//
/// @brief 
/// @param expr 
/// @return the constant part of this AffineExpr
AffineExpr mlir::FDRA::getConstPartofAffineExpr(AffineExpr& expr){
  AffineExpr constantpart;
  switch (expr.getKind())
  {
  case AffineExprKind::DimId :
    constantpart = getAffineConstantExpr(0, expr.getContext());
    break;

  case AffineExprKind::Add :
    constantpart = expr.dyn_cast<AffineBinaryOpExpr>().getRHS();
    // llvm::errs() << "[debug] const:"<< constantpart <<"\n"; 
    break;
  
  default:
    assert(0 && "We just support 2 kinds of expr: DimId, ADD right now!");
    break;
  }
  return constantpart;
}


//===----------------------------------------------------------------------===//
// removeUnusedRegionArgs
//===----------------------------------------------------------------------===//
// void mlir::FDRA::removeUnusedRegionArgs(Region &region){
//   SmallVector<BlockArgument, 4> args(region.getArguments().begin(),
//                                      region.getArguments().end());
//   for (auto arg : args) {
//     // Check if the argument is used in the region
//     llvm::errs() << "[debug] arg:" << arg <<"\n";
//     bool used = false;
//     region.walk([&](Operation* op) {
//       llvm::errs() << "[debug] op:" << *op <<"\n";
//       for (auto operand : op->getOperands()) {
//         llvm::errs() << "[debug] operand:" << operand <<"\n";
//         if (operand == arg){
//           used = true;
//         }
//       }
//     });
//     if (!used)
//       region.eraseArgument(arg.getArgNumber());
//   }
// }


//===----------------------------------------------------------------------===//
// removeUnusedRegionArgs
//===----------------------------------------------------------------------===//
// This function takes a `loadOp` or `storeOp` and eliminates unused indices in its
// index list.
void mlir::FDRA::eliminateUnusedIndices(Operation *op) {
  // Get the affine map for the operation.
  AffineMap map;
  ValueRange mapOperands;
  if (auto loadOp = dyn_cast<AffineLoadOp>(op)){
    map = loadOp.getAffineMap();
    mapOperands = loadOp.getIndices();
  }
  else if (auto storeOp = dyn_cast<AffineStoreOp>(op)){
    map = storeOp.getAffineMap();
    mapOperands = storeOp.getIndices();
  }
  else
    assert("Operation to eliminate unused indices should be AffineStoreOp or AffineLoadOp.");
  // Get the operands for the operation.

  // Find which indices are used by checking which dimensions appear in the affine map.
  SmallVector<bool, 8> usedIndices(mapOperands.size(), false);
  // llvm::errs() << "[debug] map:" << map <<"\n";
  
  assert(map.getNumInputs() == mapOperands.size() && "map.getNumInputs() should be equal to operands.size().");
  for (unsigned input = 0; input < map.getNumInputs(); ++input) {
    unsigned index;
    auto results = map.getResults();
    for( index = 0; index < results.size(); index++){
      AffineExpr result = results[index];
      if(result.isFunctionOfDim(input))
        break;
    }
    if(index == results.size()){
      /// This input is not a operand of the load
      usedIndices[input] = false;
    }
    else{
      usedIndices[input] = true;
    }
  }

  SmallVector<Value, 4> newIndexList;
  SmallVector<AffineExpr, 4> dimReplacements(map.getNumDims());
  unsigned j = 0;
  for (unsigned i = 0; i < mapOperands.size(); ++i) {
    if (usedIndices[i]){
      newIndexList.push_back(mapOperands[i]);
      dimReplacements[i] = getAffineDimExpr(j++, map.getContext());
    }
    else{
      dimReplacements[i] = getAffineConstantExpr(0, map.getContext());
    }
  }

  // auto newMap = AffineMap::get(newIndexList.size(), map.getNumSymbols(), map.getResults(), op->getContext());
  map = map.replaceDimsAndSymbols(dimReplacements, {}, j, map.getNumSymbols());
  // llvm::errs() << "[debug] map after replace:" << map <<"\n";

  // Set the new affine map and index list for the operation.
  if (auto loadOp = dyn_cast<AffineLoadOp>(op)){
    newIndexList.insert(newIndexList.begin(),loadOp.getMemref());
    loadOp.getOperation()->setAttr(AffineLoadOp::getMapAttrStrName(),AffineMapAttr::get(map));  
    loadOp.getOperation()->setOperands(newIndexList);
  }

  else if (auto storeOp = dyn_cast<AffineStoreOp>(op)){
    newIndexList.insert(newIndexList.begin(),storeOp.getMemref());
    newIndexList.insert(newIndexList.begin(),storeOp.getValue());
    storeOp.getOperation()->setAttr(AffineStoreOp::getMapAttrStrName(),AffineMapAttr::get(map)); 
    storeOp.getOperation()->setOperands(newIndexList);  
  }
}



//===----------------------------------------------------------------------===//
// getOperandInRank
//===----------------------------------------------------------------------===//

/// @brief return the AffineMap operand used in the rank 
/// @param op AffineLoadOp or AffineStoreOp or FDRA.BlockLoadOp
/// @param rank the result rank of the affine map 
/// @return ValueRange
SmallVector<Value> mlir::FDRA::getOperandInRank(Operation* op, unsigned rank){
  // Get the affine map for the operation.
  AffineMap map;
  ValueRange mapOperands;
  SmallVector<Value, 4> usedOperands;
  if (auto loadOp = dyn_cast<AffineLoadOp>(op)){
    map = loadOp.getAffineMap();
    mapOperands = loadOp.getIndices();
  }
  else if (auto storeOp = dyn_cast<AffineStoreOp>(op)){
    map = storeOp.getAffineMap();
    mapOperands = storeOp.getIndices();
  }
  else if (auto BlockLoad = dyn_cast<FDRA::DataBlockLoadOp>(op)){
    map = BlockLoad.getAffineMap();
    mapOperands = BlockLoad.indices();
  }
  else
    assert("Operation should be AffineStoreOp, AffineLoadOp or BlockLoadOp.");

  // Find which indices are used by checking which dimensions appear in the affine map.
  SmallVector<bool, 8> usedIndices(mapOperands.size(), false);
  // llvm::errs() << "[debug] map:" << map <<"\n";
  
  assert(map.getNumInputs() == mapOperands.size() && "map.getNumInputs() should be equal to operands.size().");
  auto result = map.getResult(rank);
  for (unsigned input = 0; input < map.getNumInputs(); ++input) {
    if(result.isFunctionOfDim(input)){
      usedOperands.push_back(std::move(mapOperands[input]));
    }
  }

  return usedOperands;
}