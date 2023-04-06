//===-- SNNOps.td - SNN dialect operation definitions ------*- tablegen -*-===//
//===----------------------------------------------------------------------===//
//
// Defines some operations of the SNN dialect.
//
//===----------------------------------------------------------------------===//

#ifndef MyTest_OPS
#define MyTest_OPS

include "soda/Dialect/MyTest/IR/MyTestBase.td"
include "mlir/Pass/PassBase.td"

// include "soda/Dialect/Test/IR/TestTypesBase.td"
include "mlir/Dialect/LLVMIR/LLVMOpBase.td"
include "mlir/IR/SymbolInterfaces.td"
include "mlir/Interfaces/SideEffectInterfaces.td"

//===----------------------------------------------------------------------===//
// SNN Dialect operations.
//===----------------------------------------------------------------------===//

class MyTestOP<string mnemonic, list<Trait> traits = []> :
    Op<MyTest_Dialect, mnemonic, traits>;

//===----------------------------------------------------------------------===//
// Toy Operations
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
// ConstantOp
//===----------------------------------------------------------------------===//

// We define a toy operation by inheriting from our base 'Toy_Op' class above.
// Here we provide the mnemonic and a list of traits for the operation. The
// constant operation is marked as 'NoSideEffect' as it is a pure operation
// and may be removed if dead.
def MulAccum : MyTestOP<"MulAccum", [NoSideEffect]> {
  // Provide a summary and description for this operation. This can be used to
  // auto-generate documentation of the operations within our dialect.
  let summary = "Multiply and Accumulate";
  let description = [{"
    MulAccum(MAC) operation is a combination of Multiply and accumulate which
    are common in Digital-Signal-Processing. MulAccum takes in two multipilers
    and one sum-up number, and output a MAC result.
    For example:

    ```mlir
      %4 = MyTest.MulAccum %1 MulF %2 AddF %0: f32
    ```
    "
  }];

  // The MulAccum operation takes 3 attribute as the only input.
  let arguments = (ins F32:$MUL1, F32:$MUL2,  F32:$ADDEND);

  // The MulAccum operation returns a single value of TensorType.
  let results = (outs F32:$Result);

  // Indicate that the operation has a custom parser and printer method.
//   let hasCustomAssemblyFormat = 1;
  let assemblyFormat = [{$MUL1` ``MulF` ` `$MUL2` ` `AddF` ` `$ADDEND` ``:`` `type($Result) attr-dict}] ;
  // Allow building an MulAccum with from the 3 input operands.
  // let builders = [ ];

  // Indicate that additional verification for this operation is necessary.
  let hasCanonicalizer = 1;
  let hasVerifier = 0;
}

#endif // SNN_OPS
