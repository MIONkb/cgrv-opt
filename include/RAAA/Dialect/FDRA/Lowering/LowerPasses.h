//===- ConvertKernelCallToLLVMPass.h - Pass entrypoint ----------------*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef FDRA_CONVERSION_KERNELCALLTOLLVM_H_
#define FDRA_CONVERSION_KERNELCALLTOLLVM_H_

#include <memory>

namespace mlir {
class LowerToLLVMOptions;
class ModuleOp;
template <typename T>
class OperationPass;
class Pass;
namespace FDRA {

/// Creates a pass to convert the Func dialect into the LLVMIR dialect.
std::unique_ptr<OperationPass<ModuleOp>> createConvertKernelCallToLLVMPass();
std::unique_ptr<OperationPass<ModuleOp>> createConvertFDRAToSCFPass();
std::unique_ptr<OperationPass<ModuleOp>> createApproximateMathWithArithPass();
// std::unique_ptr<OperationPass<ModuleOp>>
// createConvertKernelCallToLLVMPass(const LowerToLLVMOptions &options);
#define GEN_PASS_REGISTRATION
#include "RAAA/Dialect/FDRA/Lowering/LowerPasses.h.inc"
}
} // namespace mlir

#endif // FDRA_CONVERSION_KERNELCALLTOLLVM_H_
