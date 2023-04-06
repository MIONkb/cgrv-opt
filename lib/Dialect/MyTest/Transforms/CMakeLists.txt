add_mlir_dialect_library(MLIRMyTestTransforms
  GetMAC.cpp

  ADDITIONAL_HEADER_DIRS
  ${PROJ_INCLUDE_DIR}/soda/Dialect/MyTest/Transforms

  DEPENDS
  MLIRMyTestTransformsIncGen

  LINK_LIBS PUBLIC
  MLIRIR
  MLIRPass
  MLIRTransforms
  )
