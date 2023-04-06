//===- FDRADialect.cpp - MLIR Dialect for FDRA Kernels implementation -------===//
//===----------------------------------------------------------------------===//
//
// This file implements the FDRA kernel-related dialect and its operations.
//
//===----------------------------------------------------------------------===//

#include "RAAA/Dialect/FDRA/IR/FDRA.h"
#include "mlir/Dialect/Tensor/IR/Tensor.h"
#include "mlir/Dialect/Arithmetic/IR/Arithmetic.h"

using namespace mlir;
using namespace mlir::FDRA;

#include "RAAA/Dialect/FDRA/IR/FDRAOpsDialect.cpp.inc"

void FDRADialect::initialize() {
  addOperations<
#define GET_OP_LIST
#include "RAAA/Dialect/FDRA/IR/FDRAOps.cpp.inc"
      >();
}