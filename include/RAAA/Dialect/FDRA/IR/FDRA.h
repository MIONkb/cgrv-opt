//===- Test.h - Test dialect --------------------------------------*- C++ -*-===//
//===----------------------------------------------------------------------===//

#ifndef CGRAOPT_DIALECT_FDRA_IR_Test_H_
#define CGRAOPT_DIALECT_FDRA_IR_Test_H_

#include "mlir/Dialect/Tensor/IR/Tensor.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Dialect/Affine/IR/AffineOps.h"
#include "mlir/Dialect/Arith/IR/Arith.h"
#include "mlir/Dialect/Math/IR/Math.h"

#include "mlir/IR/BuiltinTypes.h"
#include "mlir/IR/Dialect.h"
#include "mlir/IR/OpDefinition.h"
#include "mlir/IR/OpImplementation.h"
#include "mlir/Interfaces/CastInterfaces.h"
#include "mlir/Interfaces/ControlFlowInterfaces.h"
#include "mlir/Interfaces/InferTypeOpInterface.h"
#include "mlir/Interfaces/SideEffectInterfaces.h"
#include "mlir/Interfaces/ViewLikeInterface.h"

// #include "llvm/ADT/DenseMap.h"
#include "llvm/ADT/ArrayRef.h"
#include "llvm/ADT/Twine.h"

// #include "llvm/ADT/SmallSet.h" /// use std::unordered_set instead of std::list
#include<set>
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
/// AdjustMemoryFootprint.cpp
///////////////
std::optional<int64_t> getSingleMemrefAccessSpace(::mlir::affine::AffineForOp forOp);


///////////////
/// Utilities.cpp
///////////////
// Define supported affine operations on CGRA
typedef std::set<StringRef> OpTable;

mlir::Operation* eraseKernel(::mlir::func::FuncOp& TopFunc, FDRA::KernelOp& Kernel);
LogicalResult SpecifiedAffineFortoKernel(::mlir::affine::AffineForOp& forOp);
AffineExpr getConstPartofAffineExpr(AffineExpr& expr);
signed MultiplicatorOfDim(const AffineExpr& expr, const unsigned dim);
// void removeUnusedRegionArgs(Region &region);
void eliminateUnusedIndices(Operation *op);
::llvm::SmallDenseMap<mlir::Value, unsigned> getOperandInRank(Operation *op, unsigned rank);

///// following 4 functions are defined to help extract kernel function
// bool isSinkingBeneficiary(Operation *op);
// static bool extractBeneficiaryOps(Operation *op, llvm::SetVector<Value> existingDependencies,
//       llvm::SetVector<Operation *> &beneficiaryOps, llvm::SmallPtrSetImpl<Value> &availableValues);
LogicalResult sinkOperationsIntoKernelOp(FDRA::KernelOp kernelOp);
func::FuncOp GenKernelFunc(FDRA::KernelOp KernelOp, llvm::SetVector<Value> &operands);

//===----------------------------------------------------------------------===//
// For DFG
//===----------------------------------------------------------------------===//
/* Class define */
class DFGInfo { 
  public: int Num_ALU = 0 , Num_LSU = 0;
};
std::string GenDFGfromAffinewithCMD
    (std::string KernelsDir, std::string kernelFnName, std::string llvmCDFGPass);
DFGInfo GetDFGinfo(std::string DFGPath);


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
