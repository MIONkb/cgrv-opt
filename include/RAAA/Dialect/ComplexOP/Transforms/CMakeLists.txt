set(LLVM_TARGET_DEFINITIONS Passes.td)
mlir_tablegen(Passes.h.inc -gen-pass-decls -name MulAccum)
add_public_tablegen_target(MulAccumTransformsIncGen)

# add_dependencies(MLIRTableGenTests MLIRTableGenStructAttrIncGen)
 
# target_link_libraries(MLIRTableGenTest LLVMMLIRTableGen MLIRIR)


add_mlir_dialect_library(MulAccum
  MulAccum.cpp

  ADDITIONAL_HEADER_DIRS
  ${PROJ_INCLUDE_DIR}/soda/Dialect/MyTest/IR

  # DEPENDS
  # MLIRSNNTransformsIncGen


  LINK_LIBS PUBLIC
  MLIRTransforms
  MLIRSODAOps
  MLIRIR
  MLIRPass
  MLIRSCFDialect
  MLIRFuncDialect
  MLIRSupport
  MLIRTransformUtils
  )

message("[test] Transformation complete")
