//===-- Passes.td - FDRA pass definition file --------------*- tablegen -*-===//
//===----------------------------------------------------------------------===//
//
// Defines the FDRA Passes
//
//===----------------------------------------------------------------------===//
#ifndef FDRA_DIALECT_PASSES
#define FDRA_DIALECT_PASSESa      
include "RAAA/Dialect/FDRA/IR/FDRABase.td"
include "mlir/Pass/PassBase.td"
include "mlir/IR/BuiltinDialect.td"
include "mlir/Dialect/SCF/IR/SCFOps.td"
include "mlir/Dialect/Affine/IR/AffineOps.td"

//===----------------------------------------------------------------------===//
// CDFGgen for FDRA
//===----------------------------------------------------------------------===//
def FDRALoopCdfgGen : Pass<"fdra-loop-dfg-gen", ""> {
  let summary = "Generate cdfg of FDRA from a for-loop";
  let constructor = "mlir::FDRA::createFDRALoopCdfgGenPass()";
  let dependentDialects = [
    "arith::ArithmeticDialect",
    "::mlir::FDRA::FDRADialect",
    "::mlir::scf::SCFDialect"
  ];
}

//===----------------------------------------------------------------------===//
// Affine To kernel
//===----------------------------------------------------------------------===//

def ExtractAffineForToKernel : Pass<"extract-affine-for-to-kernel", "func::FuncOp"> {
  let summary = "Extract all AffineFor in a FuncOp to a FDRA.KernelOp";
  let constructor = "mlir::FDRA::createExtractAffineForToKernelPass()";
  let dependentDialects = [
    "::mlir::FDRA::FDRADialect"
    // "arith::AffineDialect"
  ];
}

//===----------------------------------------------------------------------===//
// Adjust(Partition) Kernel according to a customized Cachesize
//===----------------------------------------------------------------------===//
def AdjustKernelMemoryFootprint : Pass<"adjust-kernel-mem-footprint", "ModuleOp"> {
  let summary = "Adjust(partition) kernels' memory footprint to apply to customized cachesize";
  let constructor = "mlir::FDRA::createAdjustKernelMemoryFootprintPass()";
  let dependentDialects = [
    "::mlir::FDRA::FDRADialect"
    // "arith::AffineDialect"
  ];
  let options = [
    Option<"Cachesize_Kib", "cachesize", "unsigned", /*default=*/"512",
           "Set a cachesize(Kib) for kernel to be iterated">,
  ];
}

//===----------------------------------------------------------------------===//
// Kernel to independent mlir Func
//===----------------------------------------------------------------------===//
def ExtractKernelToFunc : Pass<"extract-kernel-to-function", "ModuleOp"> {
  let summary = "Extract all FDRA.KernelOp and its region to a single module file with a single func";
  let constructor = "mlir::FDRA::createExtractKernelToFuncPass()";
  let dependentDialects = [
    "::mlir::FDRA::FDRADialect"
    // "arith::AffineDialect"
  ];
  let options = [
    Option<"KernelGenDir", "kernel-gen-dir", "std::string", /*default=*/"",
           "Kernels will not be generated unless the dir path is set">,
  ];
}

#endif // FDRA_DIALECT_PASSES
