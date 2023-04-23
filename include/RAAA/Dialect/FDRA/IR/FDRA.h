//===- Test.h - Test dialect --------------------------------------*- C++ -*-===//
//===----------------------------------------------------------------------===//

#ifndef CGRAOPT_DIALECT_FDRA_IR_Test_H_
#define CGRAOPT_DIALECT_FDRA_IR_Test_H_

#include "mlir/Dialect/Tensor/IR/Tensor.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Dialect/Affine/IR/AffineOps.h"

#include "mlir/IR/BuiltinTypes.h"
#include "mlir/IR/Dialect.h"
#include "mlir/IR/OpDefinition.h"
#include "mlir/IR/OpImplementation.h"
#include "mlir/Interfaces/CastInterfaces.h"
#include "mlir/Interfaces/ControlFlowInterfaces.h"
#include "mlir/Interfaces/InferTypeOpInterface.h"
#include "mlir/Interfaces/SideEffectInterfaces.h"
#include "mlir/Interfaces/ViewLikeInterface.h"

//===----------------------------------------------------------------------===//
// Test Dialect
//===----------------------------------------------------------------------===//

#include "RAAA/Dialect/FDRA/IR/FDRAOpsDialect.h.inc"

//===----------------------------------------------------------------------===//
// Test Dialect Operations
//===----------------------------------------------------------------------===//

#define GET_OP_CLASSES
#include "RAAA/Dialect/FDRA/IR/FDRAOps.h.inc"

#include "RAAA/Dialect/FDRA/IR/FDRAOpsTypes.h.inc"
//===----------------------------------------------------------------------===//
// FDRA Dialect Helpers
//===----------------------------------------------------------------------===//

namespace mlir {
namespace FDRA {

///////////////
/// Utilities.cpp
///////////////
mlir::Operation* eraseKernel(::mlir::func::FuncOp& TopFunc, FDRA::KernelOp& Kernel);
void SpecifiedAffineFortoKernel(::mlir::AffineForOp& forOp);
AffineExpr getConstPartofAffineExpr(AffineExpr& expr);

//===----------------------------------------------------------------------===//
// A templated find func for smallvector
//===----------------------------------------------------------------------===//
template <typename T, unsigned N>
inline int findElement(const llvm::SmallVector<T, N>& vec, const T& elem) {
  for (unsigned i = 0; i < vec.size(); ++i) {
    if (vec[i] == elem) {
      return i;
    }
  }
  return -1;
}
} // namespace fdra
} // namespace mlir

#endif //CGRAOPT_DIALECT_FDRA_IR_Test_H_
