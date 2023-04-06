//===-- TestBase.td - Test dialect definitions ---------------*- tablegen -*-===//
//===----------------------------------------------------------------------===//
//
// Defines the Test dialect
// 
//===----------------------------------------------------------------------===//

#ifndef MyTest_BASE
#define MyTest_BASE

include "mlir/IR/OpBase.td"
include "mlir/IR/BuiltinDialect.td"
include "mlir/IR/BuiltinTypeInterfaces.td"

//===----------------------------------------------------------------------===//
// Test Dialect.
//===----------------------------------------------------------------------===//

def MyTest_Dialect : Dialect {
  let name = "mytest";
  let cppNamespace = "::mlir::mytest";

  let description = [{
    "Just a test dialect for HLS course"
  }];

  let dependentDialects = [
    "arith::ArithmeticDialect"
  ];
}

#endif // Test_BASE
