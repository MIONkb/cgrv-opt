//===-- FDRAOps.td - FDRA dialect operation definitions ------*- tablegen -*-===//
//===----------------------------------------------------------------------===//
//
// Defines some operations of the FDRA dialect.
//
//===----------------------------------------------------------------------===//

#ifndef FDRA_OPS
#define FDRA_OPS

include "RAAA/Dialect/FDRA/IR/FDRABase.td"
include "mlir/Pass/PassBase.td"
include "mlir/IR/EnumAttr.td"
include "mlir/IR/SymbolInterfaces.td"
include "mlir/Dialect/LLVMIR/LLVMOpBase.td"
// include "mlir/Dialect/Func/IR/FuncOps.td"
// include "mlir/Dialect/Func/IR/FuncOps.h"
include "mlir/Interfaces/CallInterfaces.td"
include "mlir/Interfaces/SideEffectInterfaces.td"
include "mlir/Interfaces/InferTypeOpInterface.td"
// #include "mlir/Dialect/Func/IR/FuncOps.h"
//===----------------------------------------------------------------------===//
// FDRA Dialect operations.
//===----------------------------------------------------------------------===//
class FDRA_Op<string mnemonic, list<Trait> traits = []> :
    Op<FDRA_Dialect, mnemonic, traits>;


//===----------------------------------------------------------------------===//
// kernel Operations for offload HW code
//===----------------------------------------------------------------------===//

def FDRA_KernelOp : FDRA_Op<"kernel">,
    Arguments<(ins)>,
    Results<(outs)> {
  let summary = "FDRA KernelOp contains a kernel";

  let description = [{
    FDRA.kernel define a region that the body of the rigion
    is a kernel which generated from a affine.for/scf.for/linalg.generic
  }];

  let regions = (region AnyRegion:$body);

  let skipDefaultBuilders = 1;

  let builders = [
    OpBuilder<(ins)>,
    OpBuilder<(ins "std::string":$KernelName)>
  ];
  
  let extraClassDeclaration = [{

    /// The number of launch configuration operands, placed at the leading
    /// positions of the operand list.
    /// Legacy from copying GPU dialect.
    static constexpr unsigned kNumConfigOperands = 0;

    /// The number of region attributes containing the launch configuration,
    /// placed in the leading positions of the argument list.
    /// Legacy from copying GPU dialect.
    static constexpr unsigned kNumConfigRegionAttributes = 0;
    // unsigned kernel_Count = 0;

    static StringRef getKernelNameAttrStr() { return "KernelName"; }
    void setKernelName(std::string s) {
      StringAttr KernelNameAttr = StringAttr::get(getOperation()->getContext(),s);
      getOperation()->setAttr(getKernelNameAttrStr(), KernelNameAttr);
    }
    std::string getKernelName(){
      return getOperation()->getAttr("KernelName")
        .cast<StringAttr>().str();
    }


  }];

  let hasCustomAssemblyFormat = 1;
  let hasVerifier = 1;
}



def FDRA_TerminatorOp : FDRA_Op<"terminator", [HasParent<"KernelOp">,
                                              Terminator]>,
    Arguments<(ins)>, Results<(outs)> {
  let summary = "Terminator for FDRA_KernelOp regions.";
  let description = [{
    A terminator operation for regions that appear in the body of FDRA_KernelOp
    operation.  These regions are not expected to return any value so the
    terminator takes no operands.
  }];

  let assemblyFormat = "attr-dict";
}


//===----------------------------------------------------------------------===//
// Explicit Data Block Movement Operation (Load and Store)
//===----------------------------------------------------------------------===//

def FDRA_DataBlockLoadOp: FDRA_Op<"BlockLoad", []>{
  let summary = "Load a part of the whole array data block to a faster memory where HW accelerator can access.";
  let description = [{
    This operation takes in an array memref,a header index of the data block which will be moved, and the block size.
    Returns the new memref from the buffer given certain header index and size.
    This operation will corporate with BlockStore and Call of KernelFunc. 

    Example: To fix !!!
    ```mlir
     %0 = FDRA.BlockLoad %arg1 [%arg9, 0] : memref<32x32xf32> -> memref<1x32xf32> {three_mm_32_kernel_0} 
     %1 = FDRA.BlockLoad %arg2 [0, %arg10] : memref<32x32xf32> -> memref<32x16xf32> {three_mm_32_kernel_0}
    ```
  }];
  
  let builders = [   
    /// Builds an affine load op with the specified map and operands.
    // OpBuilder<(ins "AffineMap":$map, "ValueRange":$operands, "unsigned":$BlockLen)>,
    /// Builds an affine load op with an identity map and operands.
    // OpBuilder<(ins "Value":$DataBlock, "ValueRange":$operands, "unsigned":$BlockLen)>,
    /// Builds a block load op with the specified map and its operands.
    OpBuilder<(ins "Value":$DataBlock, "AffineMap":$map, "ValueRange":$operands, 
                   "MemRefType":$resultType , "std::string":$KernelName )>,
    // OpBuilder<(ins "Value":$DataBlock, "AffineMap":$map, "ValueRange":$operands, 
    //                 "int64_t":$BlockLen, "std::string":$KernelName )>,
    // /// Builds an block load op without KernelName.
    OpBuilder<(ins "Value":$DataBlock, "AffineMap":$map, "ValueRange":$operands, 
                   "MemRefType":$resultType)>,
  ];
  
	//Ignore Variadic<Index>:$offset at this moment
  let arguments = (ins Arg<AnyMemRef, "the reference to load from", [MemRead]>:$OriginalMemref
                  , Variadic<Index>:$indices);
  
  let results = (outs AnyStaticShapeMemRef: $result);
  let extraClassDeclaration = [{
    // unsigned int BlockLen = 0;
    // void setBlockLen(unsigned l){ BlockLen = l;};
    // unsigned int getBlockLen(){ return BlockLen;};
    // Value getOriginalMemref(){ return OriginalMemref();};

    static StringRef getMapAttrStr() { return "map"; }
    static StringRef getKernelNameAttrStr() { return "KernelName"; }
    // static StringRef getBlockLenAttrStr() { return "BlockLen"; }

    // int32_t getBlockLen() {
    //   return this->getOperation()->getAttr("BlockLen")
    //     .cast<IntegerAttr>().getValue().getSExtValue();
    // }
    StringRef getKernelName() {
      Attribute KnNameAttr = this->getOperation()->getAttr("KernelName");
      if(KnNameAttr == nullptr)
        return "";
      else
        return KnNameAttr.cast<StringAttr>().strref();
    }
    void setKernelName(std::string s) {
      StringAttr KernelNameAttr = StringAttr::get(getOperation()->getContext(),s);
      getOperation()->setAttr(getKernelNameAttrStr(), KernelNameAttr);
    }

    MemRefType getOriginalMemrefType() {
      return getOriginalMemref().getType().cast<MemRefType>();
    }
    MemRefType getResultType() {
      return getResult().getType().cast<MemRefType>();
    }
    MemRefType getMemRefType() {
      return getOriginalMemrefType();
    }
    operand_range getMapOperands() {
      return {operand_begin() + 1, operand_end()};
    }

    /// Returns the affine map used to index the memref for this operation.
    AffineMap getAffineMap() { return getAffineMapAttr().getValue(); }
    AffineMapAttr getAffineMapAttr() {
      return (*this)->getAttr(getMapAttrStr()).cast<AffineMapAttr>();
    }

  }];

  let hasCustomAssemblyFormat = 1;
  let hasVerifier = 1;
}


def FDRA_DataBlockStoreOp: FDRA_Op<"BlockStore", []>{
  let summary = "Store a smaller memref to a bigger memref at a specified position.";
  let description = [{
    This operation takes in a source array memref which comes from a BlockLoad Op. After the excution 
    of the kernel, this array memref is changed.
    This operation take in another target array memref and a header index of the data block pointing the place
    the source memref will be placed.
    No return value exists for BlockStoreOp.
    This operation will corporate with BlockLoad and Call of KernelFunc. 

    Example: To fix !!!
    ```mlir
    %value = "FDRA.BlockLoad" (%buffer, %j):(memref<10xf32>, index, index) -> memref<5xf32> 
    ```
  }];

  let builders = [   
    OpBuilder<(ins "Value":$SourceMemref, "Value":$TargetMemref, 
                   "AffineMap":$map, "ValueRange":$operands, 
                   "std::string":$KernelName )>,
    // /// Builds an block load op without KernelName.
    OpBuilder<(ins "Value":$SourceMemref, "Value":$TargetMemref, 
                   "AffineMap":$map, "ValueRange":$operands)>,
  ];

	//Ignore Variadic<Index>:$offset at this moment
  let arguments = (ins Arg<AnyMemRef, "A memref from a BlockLoad Op", [MemWrite]>:$SourceMemref
                  , Arg<AnyMemRef, "the reference to store to", [MemWrite]>:$TargetMemref
                  , Variadic<Index>:$indices);
  // let results = (outs AnyStaticShapeMemRef: $result); /// No results for 
  let extraClassDeclaration = [{
    // unsigned int BlockLen = 0;
    // void setBlockLen(unsigned l){ BlockLen = l;};
    // unsigned int getBlockLen(){ return BlockLen;};
    // Value getSourceMemref(){ return SourceMemref();};    
    // Value getTargetMemref(){ return TargetMemref();};

    static StringRef getMapAttrStr() { return "map"; }
    static StringRef getKernelNameAttrStr() { return "KernelName"; }
    // static StringRef getBlockLenAttrStr() { return "BlockLen"; }

    // int32_t getBlockLen() {
    //   return this->getOperation()->getAttr("BlockLen")
    //     .cast<IntegerAttr>().getValue().getSExtValue();
    // }
    StringRef getKernelName() {
      return this->getOperation()->getAttr("KernelName")
        .cast<StringAttr>().strref();
    }
    void setKernelName(std::string s) {
      StringAttr KernelNameAttr = StringAttr::get(getOperation()->getContext(),s);
      getOperation()->setAttr(getKernelNameAttrStr(), KernelNameAttr);
    }

    MemRefType getSourceMemrefType() {
      return getSourceMemref().getType().cast<MemRefType>();
    }
    MemRefType getTargetMemrefType() {
      return getTargetMemref().getType().cast<MemRefType>();
    }
    MemRefType getMemRefType() {
      return getSourceMemrefType();
    }
    operand_range getMapOperands() {
      return {operand_begin() + 2, operand_end()}; // + 2 or + 1?
    }

  }];

  let hasCustomAssemblyFormat = 1;
  let hasVerifier = 1;
}



//===----------------------------------------------------------------------===//
// KernelCallOp
//===----------------------------------------------------------------------===//

def KernelCallOp : FDRA_Op<"KernelCall",
    [CallOpInterface, MemRefsNormalizable,
     DeclareOpInterfaceMethods<SymbolUserOpInterface>]> {
  let summary = "call operation(different from call in func)";
  let description = [{
    The `func.call` operation represents a direct call to a function that is
    within the same symbol scope as the call. The operands and result types of
    the call must match the specified function type. The callee is encoded as a
    symbol reference attribute named "callee".

    Example:

    ```mlir
    %2 = fdra.kernelcall @my_add(%0, %1) : (f32, f32) -> f32
    ```
  }];

  let arguments = (ins FlatSymbolRefAttr:$callee, Variadic<AnyType>:$operands);
  let results = (outs Variadic<AnyType>);

  let builders = [
    OpBuilder<(ins "func::FuncOp":$callee, CArg<"ValueRange", "{}">:$operands), [{
      $_state.addOperands(operands);
      $_state.addAttribute("callee", SymbolRefAttr::get(callee));
      $_state.addTypes(callee.getFunctionType().getResults());
    }]>,
    OpBuilder<(ins "SymbolRefAttr":$callee, "TypeRange":$results,
      CArg<"ValueRange", "{}">:$operands), [{
      $_state.addOperands(operands);
      $_state.addAttribute("callee", callee);
      $_state.addTypes(results);
    }]>,
    OpBuilder<(ins "StringAttr":$callee, "TypeRange":$results,
      CArg<"ValueRange", "{}">:$operands), [{
      build($_builder, $_state, SymbolRefAttr::get(callee), results, operands);
    }]>,
    OpBuilder<(ins "StringRef":$callee, "TypeRange":$results,
      CArg<"ValueRange", "{}">:$operands), [{
      build($_builder, $_state, StringAttr::get($_builder.getContext(), callee),
            results, operands);
    }]>];

  let extraClassDeclaration = [{
    FunctionType getCalleeType();

    /// Get the argument operands to the called function.
    operand_range getArgOperands() {
      return {arg_operand_begin(), arg_operand_end()};
    }

    operand_iterator arg_operand_begin() { return operand_begin(); }
    operand_iterator arg_operand_end() { return operand_end(); }

    /// Return the callee of this operation.
    CallInterfaceCallable getCallableForCallee() {
      return (*this)->getAttrOfType<SymbolRefAttr>("callee");
    }
    void setCalleeFromCallable(CallInterfaceCallable callee) {
      (*this)->setAttr("callee", callee.get<SymbolRefAttr>());
    }

  }];

  let assemblyFormat = [{
    $callee `(` $operands `)` attr-dict `:` functional-type($operands, results)
  }];
}

#endif // FDRA_OPS
