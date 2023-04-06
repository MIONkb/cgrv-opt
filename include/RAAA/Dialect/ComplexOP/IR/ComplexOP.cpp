//===- SNNOps.cpp - Operations of the SNN dialect -------------------------===//
//===----------------------------------------------------------------------===//

#include "mlir/IR/BlockAndValueMapping.h"
#include "mlir/IR/Builders.h"
#include "mlir/IR/Matchers.h"
#include "mlir/IR/PatternMatch.h"
#include "mlir/IR/TypeUtilities.h"
#include "soda/Dialect/ComplexOP/IR/ComplexOP.h"
#include "llvm/ADT/STLExtras.h"

using namespace mlir;
using namespace mlir::ComplexOP;

//===----------------------------------------------------------------------===//
// DummyOp
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
// TableGen'd op method definitions
//===----------------------------------------------------------------------===//

#define GET_OP_CLASSES
#include "soda/Dialect/ComplexOP/IR/ComplexOP.cpp.inc"
