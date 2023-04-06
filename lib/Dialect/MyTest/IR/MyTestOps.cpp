//===- SNNOps.cpp - Operations of the SNN dialect -------------------------===//
//===----------------------------------------------------------------------===//

#include "mlir/IR/BlockAndValueMapping.h"
#include "mlir/IR/Builders.h"
#include "mlir/IR/Matchers.h"
#include "mlir/IR/PatternMatch.h"
#include "mlir/IR/TypeUtilities.h"
#include "soda/Dialect/MyTest/IR/MyTest.h"
#include "llvm/ADT/STLExtras.h"

using namespace mlir;
using namespace mlir::mytest;

//===----------------------------------------------------------------------===//
// DummyOp
//===----------------------------------------------------------------------===//
// void DummyOp::getCanonicalizationPatterns(RewritePatternSet &results,
//                                           MLIRContext *context) {
//   //   results.add<SimplifyDummyOp<DummyOp>>(context);
// }

// void EncodeSpikeTrainOp::getCanonicalizationPatterns(RewritePatternSet &results,
//                                           MLIRContext *context) {
// }
void MulAccum::getCanonicalizationPatterns(RewritePatternSet &results,
                                          MLIRContext *context) {
}


//===----------------------------------------------------------------------===//
// TableGen'd op method definitions
//===----------------------------------------------------------------------===//

#define GET_OP_CLASSES
#include "soda/Dialect/MyTest/IR/MyTestOps.cpp.inc"
