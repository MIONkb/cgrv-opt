//===- soda-opt.cpp ---------------------------------------------*- C++ -*-===//
//===----------------------------------------------------------------------===//

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
#include "RAAA/Dialect/FDRA/Lowering/ConvertKernelCallToLLVMPass.h"
#include "RAAA/Misc/Passes.h"

// #include "soda/Conversion/Passes.h"
// #include "soda/Dialect/SNN/IR/SNN.h"
// #include "soda/Dialect/SNN/Transforms/Passes.h"
// #include "soda/Dialect/SODA/Passes.h"
// #include "soda/Dialect/SODA/SODADialect.h"

// // my add
// #include "soda/Dialect/ComplexOP/IR/ComplexOP.h"
// #include "soda/Dialect/ComplexOP/Transforms/Passes.h"
// #include "soda/Dialect/MyTest/IR/MyTest.h"
// #include "soda/Dialect/MyTest/Transforms/Passes.h"
// // #include "soda/Dialect/ComplexOP/IR/ComplexOP.h.inc"
// // #include "soda/Dialect/ComplexOP/IR/ComplexOPDialect.h.inc"

// #include "soda/Misc/Passes.h"
// #include "soda/Misc/Pipelines.h"

#include "mlir/Dialect/Arithmetic/Transforms/Passes.h"
#include "mlir/Dialect/Func/Transforms/Passes.h"

// Defined in the test directory, no public header.
namespace mlir {
void registerTestLoopPermutationPass();
namespace test {

int registerTestLinalgCodegenStrategy();
} // namespace test
} // namespace mlir

// Register important linalg passes
inline void registerLinalgPassesForSoda() {

  mlir::registerLinalgPasses();
}

// Register important affine passes
inline void registerAffinePassesForFDRA() {

  mlir::registerAffineDataCopyGenerationPass();
  mlir::registerAffineLoopInvariantCodeMotionPass();
  mlir::registerAffineLoopTilingPass();
  mlir::registerAffineLoopFusionPass();
  mlir::registerAffineLoopUnrollPass();
  mlir::registerAffineScalarReplacementPass();

  // my add
  mlir::registerAffineLoopUnrollAndJamPass();
  mlir::registerAffineLoopNormalizePass();
  mlir::registerSimplifyAffineStructuresPass();

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

  registerLinalgPassesForSoda();
  registerAffinePassesForFDRA();
  mlir::bufferization::registerPromoteBuffersToStackPass();

  mlir::registerConvertLinalgToStandardPass();
  // mlir::registerConvertLinalgToLLVMPass(); // This pass maps linalg to blas
  mlir::registerLinalgLowerToAffineLoopsPass();
  mlir::registerConvertFuncToLLVMPass();
  mlir::registerConvertMemRefToLLVMPass();
  mlir::registerSCFToControlFlowPass();
  mlir::registerConvertAffineToStandardPass();
  mlir::registerConvertMathToLLVMPass();
  mlir::registerConvertMathToLibmPass();
  mlir::registerConvertArithmeticToLLVMPass();
  mlir::arith::registerArithmeticExpandOpsPass();
  mlir::memref::registerExpandOpsPass();
  mlir::memref::registerNormalizeMemRefsPass();
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
                  mlir::arith::ArithmeticDialect,
                  mlir::AffineDialect,
                  mlir::DLTIDialect>();
  // clang-format on
  // mlir::registerAllDialects(registry);

  //===--------------------------------------------------------------------===//
  // Register SODA dialects and passes
  //===--------------------------------------------------------------------===//

  // Dialects
  // registry.insert<mlir::soda::SODADialect>();
  // registry.insert<mlir::snn::SNNDialect>();
  // registry.insert<mlir::mytest::MyTestDialect>();
  registry.insert<mlir::FDRA::FDRADialect>();
  // registry.insert<mlir::ComplexOP::ComplexOPDialect>();

  // ----- My Dialect -----
  // mlir::mytest::registerGetMACPass();
  mlir::FDRA::registerFDRALoopCdfgGenPass();
  mlir::FDRA::registerExtractAffineForToKernelPass();
  mlir::FDRA::registerAdjustKernelMemoryFootprintPass();
  mlir::FDRA::registerExtractKernelToFuncPass();
  mlir::FDRA::registerAutoDesignSpaceExplorePass();
  mlir::FDRA::registerTestPrintOpNestingPass();
  mlir::FDRA::registerConvertKernelCallToLLVMPass();

  mlir::registerSCFForLoopCanonicalizationPass();
  
  // ----- SODA -----
  // Misc passes
  // mlir::soda::registerTestPrintOpNestingPass();
  // mlir::soda::registerTestArgumentsToXMLPass();
  // mlir::soda::registerEraseMemrefDeallocPass();
  // mlir::soda::registerForwardMemrefAllocPass();
  // mlir::soda::registerForwardLinalgFillPass();
  // mlir::soda::registerForwardMemrefCopyPass();

  // // SODA Passes
  // mlir::soda::registerSodaKernelOutliningPass();
  // mlir::soda::registerSodaKernelGenerationPass();
  // mlir::soda::registerSodaHostGenerationPass();
  // mlir::soda::registerSodaAsyncRegionPassPass();

  // // Outlining passes
  // mlir::soda::registerConvertAllToSODAPass();
  // mlir::soda::registerConvertOperationToSODAPass();
  // mlir::soda::registerConvertAffineForToSODAPass();
  // mlir::soda::registerConvertSCFForToSODAPass();
  // mlir::soda::registerConvertLinalgDotToSODAPass();
  // mlir::soda::registerConvertLinalgMatmulToSODAPass();
  // mlir::soda::registerConvertLinalgConvToSODAPass();
  // mlir::soda::registerConvertLinalgGenericToSODAPass();

  // // Optimization passes
  // mlir::soda::registerPassManagerMiscPass();
  // mlir::soda::registerSimpleLoweringPass();
  // mlir::soda::registerOptimizedForBambuPass();
  // mlir::soda::registerOptimizedForVitisHLSPass();

  // // Conversion passes

  // // ----- SNN -----
  // mlir::snn::registerSNNPrintPass();

  return failed(
      mlir::MlirOptMain(argc, argv, "SODA optimizer driver\n", registry));
}
