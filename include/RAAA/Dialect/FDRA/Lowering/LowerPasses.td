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
  let summary = "lower fdra's op to LLVM dialect";
  let description = [{
    Convert Func dialect operations into the LLVM IR dialect operations.

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
  let constructor = "mlir::FDRA::createConvertKernelCallToLLVMPass()";
  let dependentDialects = ["LLVM::LLVMDialect","::mlir::FDRA::FDRADialect"];
  // let options = [
  //   // Option<"useBarePtrCallConv", "use-bare-ptr-memref-call-conv", "bool",
  //   //        /*default=*/"false",
  //   //        "Replace FuncOp's MemRef arguments with bare pointers to the MemRef "
  //   //        "element types">,
  //   // Option<"indexBitwidth", "index-bitwidth", "unsigned",
  //   //        /*default=kDeriveIndexBitwidthFromDataLayout*/"0",
  //   //        "Bitwidth of the index type, 0 to use size of machine word">,
  //   // Option<"dataLayout", "data-layout", "std::string",
  //   //        /*default=*/"\"\"",
  //   //        "String description (LLVM format) of the data layout that is "
  //   //        "expected on the produced module">
  // ];
}

#endif // FDRA_DIALECT_PASSES
