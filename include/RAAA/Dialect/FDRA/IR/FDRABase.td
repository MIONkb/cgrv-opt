//===-- FDRA_BASE.td - Test dialect definitions ---------------*- tablegen -*-===//
//===----------------------------------------------------------------------===//
//
// Defines the FDRA dialect
// 
//===----------------------------------------------------------------------===//

#ifndef FDRA_BASE
#define FDRA_BASE

include "mlir/IR/OpBase.td"
include "mlir/IR/BuiltinDialect.td"
include "mlir/IR/BuiltinTypeInterfaces.td"

//===----------------------------------------------------------------------===//
// FDRA Dialect.
//===----------------------------------------------------------------------===//

def FDRA_Dialect : Dialect {
  let name = "FDRA";
  let cppNamespace = "::mlir::FDRA";

  let description = [{
    "a dialect for cgra compiler-fdra"
  }];

  let dependentDialects = [
    // "scf::SCFDialect"
  ];

  // let hasOperationAttrVerify = 1;
}

#endif // FDRA_BASE
