//===-- Passes.td - SNN pass definition file --------------*- tablegen -*-===//
//===----------------------------------------------------------------------===//
//
// Defines the SNN Passes
//
//===----------------------------------------------------------------------===//

#ifndef MLIR_DIALECT_MyTest_PASSES
#define MLIR_DIALECT_MyTest_PASSES

include "mlir/Pass/PassBase.td"
include "soda/Dialect/MyTest/IR/MyTestBase.td"

def GetMAC : Pass<"mytest-get-mac", ""> {
  let summary = "Just a test pass to get the MAC(Mutiply-Accumulate) operation";
  let constructor = "mlir::mytest::createGetMACPass()";
  let dependentDialects = [
    "func::FuncDialect",
    "arith::ArithmeticDialect",
    "::mlir::mytest::MyTestDialect"
  ];
}

#endif // MLIR_DIALECT_SNN_PASSES
