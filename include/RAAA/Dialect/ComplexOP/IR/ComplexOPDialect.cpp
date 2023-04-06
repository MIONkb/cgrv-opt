//===- SNNDialect.cpp - MLIR Dialect for SNN Kernels implementation -------===//
//===----------------------------------------------------------------------===//
//
// This file implements the SNN kernel-related dialect and its operations.
//
//===----------------------------------------------------------------------===//

#include "soda/Dialect/ComplexOP/IR/ComplexOP.h"


using namespace mlir;
using namespace mlir::ComplexOP;

#include "soda/Dialect/ComplexOP/IR/ComplexOPDialect.cpp.inc"

//===----------------------------------------------------------------------===//
// SNNDialect
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
// SNNDialect Methods
//===----------------------------------------------------------------------===//

void ComplexOPDialect::initialize() {
  addOperations<
#define GET_OP_LIST
#include "soda/Dialect/ComplexOP/IR/ComplexOP.cpp.inc"
      >();
}