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