add_mlir_dialect_library(MLIRFDRAMisc
    MiscPasses.cpp

    ADDITIONAL_HEADER_DIRS
    ${PROJECT_SOURCE_DIR}/include/

    DEPENDS
    MLIRFDRAMiscPassesIncGen

	LINK_LIBS PUBLIC
	MLIRIR
    MLIRPass
	)
