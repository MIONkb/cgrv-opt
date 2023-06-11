//===- PassDetail.h --------------------- --------------------*- C++ -*-===//
//===----------------------------------------------------------------------===//

#ifndef DIALECT_FDRA_LOWERING_PASSDETAIL_Test_H_
#define DIALECT_FDRA_LOWERING_PASSDETAIL_Test_H_

#include "mlir/IR/BuiltinOps.h"
#include "mlir/Pass/Pass.h"
#include "mlir/Dialect/LLVMIR/LLVMDialect.h"
#include "RAAA/Dialect/FDRA/IR/FDRA.h"

namespace mlir {
// namespace FDRA {
// #include "soda/Dialect/MyTest/IR/MyTest.h"
#define GEN_PASS_CLASSES
#include "RAAA/Dialect/FDRA/Lowering/LowerPasses.h.inc"
// }
} // end namespace mlir

#endif // DIALECT_FDRA_LOWERING_PASSDETAIL_Test_H_
