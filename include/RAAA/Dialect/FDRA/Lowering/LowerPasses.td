//===-- Passes.td - FDRA pass definition file --------------*- tablegen -*-===//
//===----------------------------------------------------------------------===//
//
// Defines the FDRA Lowering Passes
//
//===----------------------------------------------------------------------===//
#ifndef FDRA_LOWERING_PASSES
#define FDRA_LOWERING_PASSES      
include "RAAA/Dialect/FDRA/IR/FDRABase.td"
include "mlir/Pass/PassBase.td"

def ConvertKernelCallToLLVM : Pass<"fdra-convert-kernelcall-to-llvm", "ModuleOp"> {
  let summary = "lower fdra's kernelcall op to LLVM dialect";
  let description = [{
    Convert Func dialect operations into the LLVM IR dialect operations.
    Note: This pass must be used after "--finalize-memref-to-llvm". 
    Also, we recommend use "--cse --canonicalize" to simplify mlir after use this pass.
    So a recommended pass pipeline is:
    """
    --arith-expand --memref-expand  \
    -normalize-memrefs --expand-strided-metadata  --affine-simplify-structures \
    -lower-affine --scf-for-loop-canonicalization  -convert-scf-to-cf\
    --convert-math-to-llvm --convert-math-to-libm\
    --convert-arith-to-llvm \
    --finalize-memref-to-llvm \
    --fdra-convert-kernelcall-to-llvm \
    -convert-func-to-llvm=use-bare-ptr-memref-call-conv \
    --cse --canonicalize
    """

    #### Input invariant

    -   no `tensor` types;
    -   all `vector` are one-dimensional;
    -   all blocks are reachable by following the successors of the first basic
        block;

    If other operations are present and their results are required by the LLVM
    IR dialect operations, the pass will fail.  Any LLVM IR operations or types
    already present in the IR will be kept as is.

    #### Output IR

    Functions converted to LLVM IR. Function arguments types are converted
    one-to-one. Function results are converted one-to-one and, in case more than
    1 value is returned, packed into an LLVM IR struct type. Function calls and
    returns are updated accordingly. Block argument types are updated to use
    LLVM IR types.
  }];
  let constructor = "createConvertKernelCallToLLVMPass()";
  let dependentDialects = ["LLVM::LLVMDialect","::mlir::FDRA::FDRADialect"];
}

def ConvertFDRAToSCF : Pass<"fdra-convert-loadstore-to-scf", "ModuleOp"> {
  let summary = "lower fdra's blockload/store op to SCF dialect";
  let description = [{
    Convert FDRA dialect operations into the scf dialect operations.

  }];
  let constructor = "createConvertFDRAToSCFPass()";
  let dependentDialects = ["scf::SCFDialect","::mlir::FDRA::FDRADialect"];
}

def ApproximateMathWithArith : Pass<"fdra-approximate-math", "ModuleOp"> {
  let summary = "Approximate math op with a combination of simple arith ops";
  let description = [{
  Approximate/Lower math op with a combination of arith ops.
  Note: Please use this pass before "-arith-expand" pass.

  math.rsqrt:
  """
  %y = math.rsqrt %x : f32
  """
  lower to
  """
  %cst_1_2 = arith.const 0.5 : f32
  %x2 = arith.mulf %x, %cst_1/2 : f32

  %i0 = arith.bitcast %x : f32  to i32
  %cst_1i = arith.const 1 : i32
  %i1 = arith.shrui %i0, %cst_1i : i32
  %cst_magic = arith.const 1597463007 : i32 // 0x5f3759df
  %i2 = arith.subi %cst_magic, %i1 : i32
  %f0 = arith.bitcast %i2 : i32 to f32

  %cst_3_2 = arith.const 1.5 : f32
  %f1 = arith.mulf %f0, %f0 : f32
  %f2 = arith.mulf %f1, %x2 : f32
  %f3 = arith.subf %cst_3_2, %f2 : f32
  %y = arith.mulf %f3, %f1: f32
  """

  arith.max/arith.min

  }];
  let constructor = "createApproximateMathWithArithPass()";
  let dependentDialects = ["math::MathDialect","arith::ArithDialect"];
}

#endif // FDRA_DIALECT_PASSES
