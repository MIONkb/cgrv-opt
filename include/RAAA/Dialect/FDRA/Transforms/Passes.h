//===- Passes.h - Pass Entrypoints ------------------------------*- C++ -*-===//
//===----------------------------------------------------------------------===//
//
// This header file defines prototypes that expose pass constructors.
//
//===----------------------------------------------------------------------===//

#ifndef FDRA_DIALECT_PASSES_H_
#define FDRA_DIALECT_PASSES_H_

#include "mlir/Pass/Pass.h"


namespace mlir {
namespace FDRA {

// CDFG generate Pass
std::unique_ptr<OperationPass<>> createFDRALoopCdfgGenPass();
std::unique_ptr<OperationPass<func::FuncOp>> createExtractAffineForToKernelPass();
std::unique_ptr<OperationPass<ModuleOp>> createAdjustKernelMemoryFootprintPass();
std::unique_ptr<OperationPass<ModuleOp>> createExtractKernelToFuncPass();
std::unique_ptr<OperationPass<ModuleOp>> createAutoDesignSpaceExplorePass();
std::unique_ptr<OperationPass<func::FuncOp>> createHoistLoadStoreInLoopNestPass();

//===----------------------------------------------------------------------===//
// Registration
//===----------------------------------------------------------------------===//
// Generate the code for registering passes.
#define GEN_PASS_REGISTRATION
#include "RAAA/Dialect/FDRA/Transforms/Passes.h.inc"

} // namespace FDRA
} // namespace mlir

#endif // FDRA_DIALECT_PASSES_H_
