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

#include "mlir/Pass/Pass.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Dialect/LLVMIR/LLVMDialect.h"
#include "mlir/Dialect/MemRef/IR/MemRef.h"
#include "mlir/IR/BlockAndValueMapping.h"
#include "mlir/Dialect/Arithmetic/IR/Arithmetic.h"
#include "mlir/IR/Builders.h"
#include "mlir/IR/FunctionInterfaces.h"
#include "mlir/IR/SymbolTable.h"
#include "mlir/Support/LLVM.h"
#include "mlir/Transforms/RegionUtils.h"

// #include "PassDetail.h"

#include "soda/Dialect/ComplexOP/IR/ComplexOP.h.inc"
#include "soda/Dialect/ComplexOP/IR/ComplexOPDialect.h.inc"

#include "soda/Dialect/ComplexOP/Transforms/Passes.h"
// #include "soda/Dialect/ComplexOP/Transforms/Passes.h.inc"
#include "mlir/Dialect/Arithmetic/IR/ArithmeticOps.h.inc"
using namespace mlir;
// using namespace ComplexOP;
using namespace mlir::arith;
// namespace {
/// Include the patterns defined in the Declarative Rewrite framework.
// #include "mlir/Dialect/Arithmetic/IR/ArithmeticOpsDialect.h.inc"
// } // namespace


namespace {

class CombineMulAccumPass
    : public mlir::PassWrapper<CombineMulAccumPass, OperationPass<ModuleOp>> {
public:
  void runOnOperation() override;
};
} // namespace




void CombineMulAccumPass::runOnOperation() {
    std::cout << "[test] In CombineMulAccumPass! "<< std::endl;
}


std::unique_ptr<OperationPass<ModuleOp>>
mlir::ComplexOP::createCombineMulAccumPass() {
  return std::make_unique<CombineMulAccumPass>();
}

