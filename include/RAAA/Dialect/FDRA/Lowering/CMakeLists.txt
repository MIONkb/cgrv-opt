add_mlir_doc(LowerPasses FDRALowerPasses ./ -gen-pass-doc)

set(LLVM_TARGET_DEFINITIONS LowerPasses.td)
mlir_tablegen(LowerPasses.h.inc -gen-pass-decls -name FDRALower)
add_public_tablegen_target(FDRALowerPassIncGen)

