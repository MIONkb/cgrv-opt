//===- Passes.td - Pattern Match Optimizations for FDRA -*- tablegen -*----===//
//===----------------------------------------------------------------------===//
//
// Defines language-specific pattern match optimizations for FDRA using
// Declarative Rewrite Rules (DRR) specified using TableGen records.
//
//===----------------------------------------------------------------------===//

#ifndef FDRA_MISC_PASSES
#define FDRA_MISC_PASSES

include "mlir/Pass/PassBase.td"

//===----------------------------------------------------------------------===//
// Basic analysis passes
//===----------------------------------------------------------------------===//

def TestPrintOpNesting : Pass<"fdra-test-print-nesting"> {
  let summary = "Print op nesting information";
  let description = [{
      Print nested intructure and metadata info associated with mlir operations.
  }];
  let constructor = "mlir::FDRA::createTestPrintOpNestingPass()";
  let options = [
    Option<"varName", "option-name", "uint64_t", /*default=*/"512",
           "Description of the option">,
  ];
}


//===----------------------------------------------------------------------===//
// Pattern-Match and Rewrite with Constraints
//===----------------------------------------------------------------------===//

#endif // FDRA_MISC_PASSES
