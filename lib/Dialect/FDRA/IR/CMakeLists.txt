add_mlir_dialect_library(MLIRFDRAOps
  FDRADialect.cpp
  FDRAOps.cpp

  ADDITIONAL_HEADER_DIRS
  ${PROJ_INCLUDE_DIR}/RAAA/Dialect/FDRA

  DEPENDS
  #MLIRSNNOpInterfacesIncGen
  MLIRFDRAOpInterfacesIncGen
  MLIRFDRAOpsEnumsGen
  MLIRFDRAOpsAttributesIncGen

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
