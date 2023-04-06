add_mlir_doc(Passes FDRAPasses ./ -gen-pass-doc)

set(LLVM_TARGET_DEFINITIONS Passes.td)
mlir_tablegen(Passes.h.inc -gen-pass-decls -name FDRA)
add_public_tablegen_target(FDRAPassIncGen)

