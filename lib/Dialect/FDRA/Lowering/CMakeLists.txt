add_mlir_conversion_library(MLIRFDRALowerings
  KernelCallToLLVM.cpp

  ADDITIONAL_HEADER_DIRS
  ${PROJ_INCLUDE_DIR}/RAAA/Dialect/FDRA/Lowering
  ${PROJ_INCLUDE_DIR}/RAAA/Dialect/FDRA/IR

  DEPENDS
  FDRALowerPassIncGen
  MLIRFDRAOps

  LINK_LIBS PUBLIC
  MLIRIR
  MLIRPass
  MLIRTransforms
  MLIRAnalysis
  MLIRFuncDialect
  MLIRLLVMCommonConversion
  MLIRLLVMDialect
  MLIRTransformUtils
  )
