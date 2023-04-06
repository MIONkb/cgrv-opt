
add_mlir_dialect(ComplexOP ComplexOP)
add_mlir_doc(ComplexOP ComplexOP Dialects/ -gen-op-doc )

# set(LLVM_TARGET_DEFINITIONS ComplexOP.td)
message("[test] Before tablegen")
# mlir_tablegen(ComplexOP.h.inc)





# set(LLVM_TARGET_DEFINITIONS ComplexOP.td)
# mlir_tablegen(ComplexOPEnums.h -gen-enum-decls)
# # mlir_tablegen(ComplexOPEnums.cpp.inc -gen-enum-defs)
# add_public_tablegen_target(ComplexOPOpsEnumsGen)

# set(LLVM_TARGET_DEFINITIONS ComplexOP.td)
# mlir_tablegen(ComplexOPAttributes.h.inc -gen-attrdef-decls -attrdefs-dialect=MyTest)
# mlir_tablegen(ComplexOPAttributes.cpp.inc -gen-attrdef-defs -attrdefs-dialect=MyTest)
# add_public_tablegen_target(ComplexOPAttributesIncGen)





add_mlir_dialect_library(MLIRComplexOPs
  ComplexOPDialect.cpp
  ComplexOP.cpp

  ADDITIONAL_HEADER_DIRS
  ${PROJ_INCLUDE_DIR}/soda/Dialect/ComplexOP

  DEPENDS
#   MLIRSNNOpsIncGen
  #MLIRSNNOpInterfacesIncGen

  LINK_COMPONENTS
  Core

  LINK_LIBS PUBLIC
  MLIRDialectUtils
  MLIRIR
  MLIRTensorDialect
  MLIRInferTypeOpInterface
  MLIRSideEffectInterfaces
  MLIRSupport
  MLIRFuncDialect
  MLIRViewLikeInterface
  )
  message("[test] IR complete")
  # add_public_tablegen_target(MLIRComplexOPIncGen)