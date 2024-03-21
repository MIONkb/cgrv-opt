#include "mlir/IR/Dialect.h"
#include "mlir/IR/MLIRContext.h"
#include "mlir/InitAllDialects.h"
#include "mlir/InitAllPasses.h"
#include "mlir/Pass/Pass.h"
#include "mlir/Pass/PassManager.h"
#include "mlir/Support/FileUtilities.h"
#include "mlir/Tools/mlir-opt/MlirOptMain.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/InitLLVM.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/ToolOutputFile.h"
#include "llvm/Support/ToolOutputFile.h"

#include "RAAA/Dialect/FDRA/IR/FDRA.h"
#include "RAAA/Dialect/FDRA/Transforms/Passes.h"
#include "RAAA/Dialect/FDRA/Lowering/LowerPasses.h"
#include "RAAA/Misc/Passes.h"

#include "mlir/Dialect/Arith/Transforms/Passes.h"
#include "mlir/Dialect/Func/Transforms/Passes.h"

// Defined in the test directory, no public header.
namespace mlir {
void registerTestLoopPermutationPass();
namespace test {

int registerTestLinalgCodegenStrategy();
} // namespace test
} // namespace mlir

// Register important affine passes
inline void registerAffinePassesForFDRA() {

  mlir::affine::registerAffineDataCopyGenerationPass();
  mlir::affine::registerAffineLoopInvariantCodeMotionPass();
  mlir::affine::registerAffineLoopTilingPass();
  mlir::affine::registerAffineLoopFusionPass();
  mlir::affine::registerAffineLoopUnrollPass();
  mlir::affine::registerAffineScalarReplacementPass();

  // my add
  mlir::affine::registerAffineLoopUnrollAndJamPass();
  mlir::affine::registerAffineLoopNormalizePass();
  mlir::affine::registerSimplifyAffineStructuresPass();

  // Test passes
  mlir::registerTestLoopPermutationPass();
}

int main(int argc, char **argv) {
  // mlir::registerAllDialects();
  // mlir::registerAllPasses();
  mlir::DialectRegistry registry;

  //===--------------------------------------------------------------------===//
  // Register mlir dialects and passes
  //===--------------------------------------------------------------------===//

  mlir::registerInlinerPass();
  mlir::registerCanonicalizerPass();
  mlir::registerCSEPass();
  mlir::registerLinalgPasses();

  registerAffinePassesForFDRA();
  mlir::bufferization::registerPromoteBuffersToStackPass();

  mlir::registerConvertLinalgToStandardPass();
  // mlir::registerConvertLinalgToLLVMPass(); // This pass maps linalg to blas
  mlir::registerLinalgLowerToAffineLoopsPass();
  mlir::registerConvertFuncToLLVMPass();

  mlir::registerFinalizeMemRefToLLVMConversionPass();
  // mlir::registerExpandStridedMetadata();
  // mlir::memref::registerExpandOpsPass();
  // mlir::memref::registerNormalizeMemRefsPass();
  mlir::memref::registerMemRefPasses();

  mlir::registerSCFToControlFlowPass();
  mlir::registerConvertAffineToStandardPass();
  mlir::registerConvertMathToLLVMPass();
  mlir::registerConvertMathToLibmPass();
  mlir::registerArithToLLVMConversionPass();
  mlir::arith::registerArithExpandOpsPass();

  mlir::registerReconcileUnrealizedCastsPass();

  // Add the following to selectively include the necessary dialects. You only
  // need to register dialects that will be *parsed* by the tool, not the one
  // generated
  // clang-format off
  registry.insert<mlir::func::FuncDialect,
                  mlir::memref::MemRefDialect,
                  mlir::LLVM::LLVMDialect,
                  mlir::linalg::LinalgDialect,
                  mlir::math::MathDialect,
                  mlir::scf::SCFDialect,
                  mlir::cf::ControlFlowDialect,
                  mlir::vector::VectorDialect,
                  mlir::arith::ArithDialect,
                  mlir::affine::AffineDialect,
                  mlir::DLTIDialect,
                  mlir::ml_program::MLProgramDialect,
                  mlir::tensor::TensorDialect,
                  mlir::bufferization::BufferizationDialect>();
  // clang-format on

  // Dialects
  registry.insert<mlir::FDRA::FDRADialect>();

  // ----- My Dialect -----
  mlir::FDRA::registerFDRALoopCdfgGenPass();
  mlir::FDRA::registerExtractAffineForToKernelPass();
  mlir::FDRA::registerAdjustKernelMemoryFootprintPass();
  mlir::FDRA::registerExtractKernelToFuncPass();
  mlir::FDRA::registerAutoDesignSpaceExplorePass();
  mlir::FDRA::registerTestPrintOpNestingPass();
  mlir::FDRA::registerHoistLoadStoreInLoopNestPass();
  mlir::FDRA::registerFDRAAffineLoopUnroll();
  mlir::FDRA::registerAffineLoopReorder();

  mlir::FDRA::registerConvertKernelCallToLLVMPass();
  mlir::FDRA::registerConvertFDRAToSCFPass();
  mlir::FDRA::registerApproximateMathWithArith();

  mlir::registerSCFForLoopCanonicalizationPass();
  

  return failed(
      mlir::MlirOptMain(argc, argv, "Fail\n", registry));
}
