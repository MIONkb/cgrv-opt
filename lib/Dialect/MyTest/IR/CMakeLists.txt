add_mlir_dialect_library(MLIRMyTestOps
  MyTestDialect.cpp
  MyTestOps.cpp

  ADDITIONAL_HEADER_DIRS
  ${PROJ_INCLUDE_DIR}/soda/Dialect/MyTest

  DEPENDS
  MLIRMyTestOpsIncGen
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
