add_mlir_dialect_library(MLIRFDRATransforms
  DFGgen.cpp
  AffineForToKernelPass.cpp
  KernelToFuncPass.cpp
  AutoDesignSpaceExplore.cpp
  AdjustMemoryFootprint.cpp
  Utility.cpp

  ADDITIONAL_HEADER_DIRS
  ${PROJ_INCLUDE_DIR}/RAAA/Dialect/FDRA/Transforms
  ${PROJ_INCLUDE_DIR}/RAAA/Dialect/FDRA/IR
  ${PROJ_INCLUDE_DIR}/lib/DFG/inc

  DEPENDS
  FDRAPassIncGen
  GeneralCDFGGen

  LINK_LIBS PUBLIC
  MLIRIR
  MLIRPass
  MLIRTransforms
  MLIRSCFDialect
  GeneralCDFGGen
  MLIRAffineDialect
  MLIRAffineToStandard
  )

set(LIBS
  GeneralCDFGGen
)