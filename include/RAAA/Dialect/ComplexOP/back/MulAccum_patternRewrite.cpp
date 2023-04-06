//===- ToyCombine.cpp - Toy High Level Optimizer --------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file implements a set of simple combiners for optimizing operations in
// the Toy dialect.
//
//===----------------------------------------------------------------------===//
#include <iostream>
#include "mlir/IR/Matchers.h"
#include "mlir/IR/PatternMatch.h"

#include "mlir/Dialect/Arithmetic/Transforms/Passes.h"
// #include "mlir/Dialect/Arithmetic/IR/Arithmetic.h"
#include "mlir/Dialect/Arithmetic/IR/ArithmeticOpsDialect.h.inc"
#include <numeric>

#include "soda/Dialect/ComplexOP/IR/ComplexOP.h.inc"

using namespace mlir;
// using namespace ComplexOP;
using namespace mlir::arith;
// sdfsfsfsd
namespace {
/// Include the patterns defined in the Declarative Rewrite framework.
#include "mlir/Dialect/Arithmetic/IR/ArithmeticOpsDialect.h.inc"
} // namespace

/// This is an example of a c++ rewrite pattern for the TransposeOp. It
/// optimizes the following scenario: transpose(transpose(x)) -> x
struct CombineMulAccum  : public mlir::OpRewritePattern<addf> {
  /// We register this pattern to match every toy.transpose in the IR.
  /// The "benefit" is used by the framework to order the patterns and process
  /// them in order of profitability.
  CombineMulAccum(mlir::MLIRContext *context)
      : OpRewritePattern<addf>(context, /*benefit=*/1) {}

  /// This method attempts to match a pattern and rewrite it. The rewriter
  /// argument is the orchestrator of the sequence of rewrites. The pattern is
  /// expected to interact with it to perform any changes to the IR from here.
  mlir::LogicalResult
  matchAndRewrite(arith::addf op,
                  mlir::PatternRewriter &rewriter) const override {
    // Look through the input of the current transpose.
    mlir::Value addInput = op.getOperand();
    arith::addf addInputOp = addInput.getDefiningOp<arith::mulf>();

    // Input defined by another transpose? If not, no match.
    if (!addInputOp){
      std::cout << "[test] Unmatched! "<< std::endl;
      return failure();
    }


    // Otherwise, we have a redundant transpose. Use the rewriter.
    std::cout << "[test] matched! "<< std::endl;
    // rewriter.replaceOp(op, {transposeInputOp.getOperand()});
    return success();
  }
};

/// Register our patterns as "canonicalization" patterns on the TransposeOp so
/// that they can be picked up by the Canonicalization framework.
void CombineMulAccum::getCanonicalizationPatterns(RewritePatternSet &results,
                                              MLIRContext *context) {
  results.add<CombineMulAccum>(context);
}

// /// Register our patterns as "canonicalization" patterns on the ReshapeOp so
// /// that they can be picked up by the Canonicalization framework.
// void ReshapeOp::getCanonicalizationPatterns(RewritePatternSet &results,
//                                             MLIRContext *context) {
//   results.add<ReshapeReshapeOptPattern, RedundantReshapeOptPattern,
//               FoldConstantReshapeOptPattern>(context);
// }
