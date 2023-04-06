//===- Passes.h - Pass Entrypoints ------------------------------*- C++ -*-===//
//===----------------------------------------------------------------------===//
//
// This header file defines prototypes that expose pass constructors.
//
//===----------------------------------------------------------------------===//

#ifndef MLIR_DIALECT_ComplexOP_PASSES_H_
#define MLIR_DIALECT_ComplexOP_PASSES_H_

#include "mlir/Pass/Pass.h"

namespace mlir {
namespace ComplexOP {

/// Print ops from the SNN dialect
// #include "soda/Dialect/ComplexOP/Transforms/Passes.h.inc"
std::unique_ptr<OperationPass<ModuleOp>> createCombineMulAccumPass();

//===----------------------------------------------------------------------===//
// Registration
//===----------------------------------------------------------------------===//

// Generate the code for registering passes.
#define GEN_PASS_REGISTRATION
#include "soda/Dialect/ComplexOP/Transforms/Passes.h.inc"

} // namespace snn
} // namespace mlir

#endif // MLIR_DIALECT_SNN_PASSES_H_
