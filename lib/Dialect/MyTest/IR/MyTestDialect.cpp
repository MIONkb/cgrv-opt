//===- SNNDialect.cpp - MLIR Dialect for SNN Kernels implementation -------===//
//===----------------------------------------------------------------------===//
//
// This file implements the SNN kernel-related dialect and its operations.
//
//===----------------------------------------------------------------------===//

#include "soda/Dialect/MyTest/IR/MyTest.h"
#include "mlir/Dialect/Tensor/IR/Tensor.h"
#include "mlir/Dialect/Arith/IR/Arith.h"

using namespace mlir;
using namespace mlir::mytest;

#include "soda/Dialect/MyTest/IR/MyTestOpsDialect.cpp.inc"

//===----------------------------------------------------------------------===//
// SNNDialect
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
// SNNDialect Methods
//===----------------------------------------------------------------------===//

void MyTestDialect::initialize() {
  addOperations<
#define GET_OP_LIST
#include "soda/Dialect/MyTest/IR/MyTestOps.cpp.inc"
      >();
}