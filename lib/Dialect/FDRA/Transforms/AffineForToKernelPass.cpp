//===- SCFToKernelPass.cpp - Convert a loop nest to a kernel to be accelerated -----------===//
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
// AffineToKERNEL
//===----------------------------------------------------------------------===//

namespace {
  
// A pass that traverses top-level loops in the function and converts them to
// FDRA Kernel operations.  
struct AffineForKernelCaptor: public ExtractAffineForToKernelBase<AffineForKernelCaptor> {
  AffineForKernelCaptor() = default;
  void runOnOperation() override {
    for (Operation &op : llvm::make_early_inc_range(getOperation().getOps())) {
      if (auto forOp = dyn_cast<AffineForOp>(&op)) {
        FDRA::SpecifiedAffineFortoKernel(forOp);
      }
    }
  }
};

} // namespace

std::unique_ptr<OperationPass<func::FuncOp>> mlir::FDRA::createExtractAffineForToKernelPass() {
  return std::make_unique<AffineForKernelCaptor>();
}


