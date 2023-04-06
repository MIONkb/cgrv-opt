add_mlir_dialect(FDRAOps FDRA)
add_mlir_doc(FDRAOps FDRAOps Dialects/ -gen-op-doc )

set(LLVM_TARGET_DEFINITIONS FDRABase.td)
mlir_tablegen(FDRAOpInterfaces.h.inc -gen-op-interface-decls)
mlir_tablegen(FDRAOpInterfaces.cpp.inc -gen-op-interface-defs)
add_public_tablegen_target(MLIRFDRAOpInterfacesIncGen)

set(LLVM_TARGET_DEFINITIONS FDRAOps.td)
mlir_tablegen(FDRAOpsEnums.h.inc -gen-enum-decls)
mlir_tablegen(FDRAOpsEnums.cpp.inc -gen-enum-defs)
add_public_tablegen_target(MLIRFDRAOpsEnumsGen)

set(LLVM_TARGET_DEFINITIONS FDRAOps.td)
mlir_tablegen(FDRAOpsAttributes.h.inc -gen-attrdef-decls -attrdefs-dialect=FDRA)
mlir_tablegen(FDRAOpsAttributes.cpp.inc -gen-attrdef-defs -attrdefs-dialect=FDRA)
add_public_tablegen_target(MLIRFDRAOpsAttributesIncGen)