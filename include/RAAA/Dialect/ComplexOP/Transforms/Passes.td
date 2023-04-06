//===-- Passes.td - SNN pass definition file --------------*- tablegen -*-===//
//===----------------------------------------------------------------------===//
//
// Defines the SNN Passes
//
//===----------------------------------------------------------------------===//

#ifndef MLIR_DIALECT_ComplexOP_PASSES
#define MLIR_DIALECT_ComplexOP_PASSES

include "mlir/Pass/PassBase.td"
// include "Passes.h"

def CombineMulAccumPass : Pass<"Combine-Mul-Accum", "ModuleOp"> {
  let summary = "Combine Mul and Accumulation Ops ";
  let constructor = "mlir::ComplexOP::createCombineMulAccumPass()";
  let dependentDialects = [
    "func::FuncDialect"
  ];
}

#endif // MLIR_DIALECT_SNN_PASSES
