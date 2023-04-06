/// This is the definition of the Toy dialect. A dialect inherits from
/// mlir::Dialect and registers custom attributes, operations, and types. It can
/// also override virtual methods to change some general behavior, which will be
/// demonstrated in later chapters of the tutorial.
//===- Ops.td - Toy dialect operation definitions ----------*- tablegen -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// Defines the operations of the Toy dialect.
//
//===----------------------------------------------------------------------===//

#ifndef ComplexOPS
#define ComplexOPS

include "mlir/IR/OpBase.td"
include "mlir/IR/FunctionInterfaces.td"
include "mlir/IR/SymbolInterfaces.td"
include "mlir/Interfaces/SideEffectInterfaces.td"

// Provide a definition of the 'toy' dialect in the ODS framework so that we
// can define our operations.
def ComplexOPDialect : Dialect {
  let name = "ComplexOP";
  let cppNamespace = "::mlir::ComplexOP";
  let emitAccessorPrefix = kEmitAccessorPrefix_Prefixed;
}

// Base class for ComplexOPS dialect operations. This operation inherits from the base
// `Op` class in OpBase.td, and provides:
//   * The parent dialect of the operation.
//   * The mnemonic for the operation, or the name without the dialect prefix.
//   * A list of traits for the operation.
class ComplexOP<string mnemonic, list<Trait> traits = []> :
    Op<ComplexOPDialect, mnemonic, traits>;

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
def MulAccum : ComplexOP<"MulAccum", [NoSideEffect]> {
  // Provide a summary and description for this operation. This can be used to
  // auto-generate documentation of the operations within our dialect.
  let summary = "Multi and Accumulate";
  let description = [{
    MulAccum(MAC) operation is a combination of Multiply and accumulate which
    are common in Digital-Signal-Processing. MulAccum takes in two multipilers
    and one sum-up number, and output a MAC result.
    For example:

    ```mlir
      %4 = ComplexOP.MulAccum %1, %2, %0: f32
    ```
  }];

  // The MulAccum operation takes 3 attribute as the only input.
  let arguments = (ins F32:$MUL1, F32:$MUL2,  F32:$ADDEND);

  // The MulAccum operation returns a single value of TensorType.
  let results = (outs F32);

  // Indicate that the operation has a custom parser and printer method.
  let hasCustomAssemblyFormat = 1;

  // Allow building an MulAccum with from the 3 input operands.
  let builders = [
    OpBuilder<(ins "Value":$MUL1, "Value":$MUL2, "Value":$ADDEND)>
  ];

  // Indicate that additional verification for this operation is necessary.
  let hasVerifier = 1;
}


#endif // ComplexOPS
