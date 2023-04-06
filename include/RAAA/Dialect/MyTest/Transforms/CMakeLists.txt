set(LLVM_TARGET_DEFINITIONS Passes.td)
mlir_tablegen(Passes.h.inc -gen-pass-decls -name MyTest)
add_public_tablegen_target(MLIRMyTestTransformsIncGen)

add_mlir_doc(Passes Passes ./)
