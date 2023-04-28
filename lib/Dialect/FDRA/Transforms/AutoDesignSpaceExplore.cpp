//===- AutoDesignSpaceExplore.cpp - design space explore for application frontend optimization -----------===//

#include "mlir/Dialect/Affine/Analysis/LoopAnalysis.h"
#include "mlir/Dialect/Affine/Analysis/Utils.h"
#include "mlir/Dialect/Affine/IR/AffineOps.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Transforms/DialectConversion.h"
#include "mlir/Support/LLVM.h"
#include <iostream>
#include "mlir/Support/FileUtilities.h"
// #include "scalehls/Transforms/Explorer.h"
// #include "scalehls/Transforms/Passes.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/MemoryBuffer.h"
#include "llvm/Support/ToolOutputFile.h"
#include <numeric>

#include "RAAA/Dialect/FDRA/IR/FDRA.h"
#include "RAAA/Dialect/FDRA/Transforms/Passes.h"
#include "RAAA/Dialect/FDRA/Transforms/DSE.h"
#include "./PassDetail.h"


using namespace llvm; // for llvm.errs()
using namespace mlir;
using namespace mlir::FDRA;


/********** 
Steps to achieve the DSE process:
a. Define the design space: Identify the 
relevant parameters and constraints

b. Develop optimization techniques: Implement 
the frontend optimizations mentioned in point 
1, tailored for the target architecture. 

c. Create a performance model: Develop a model 
to predict the performance of different configurations 
within the design space. d. Explore the design space: 
Use search algorithms, such as genetic algorithms, 
simulated annealing, or other heuristics, to navigate 
the design space and find the optimal configuration. 

e. Validate the results: Implement the chosen 
configuration and measure the performance on 
the target hardware. Adjust the performance model 
if necessary and iterate on the exploration process.

This process can be implemented using MLIR's 
flexible infrastructure for representing, 
optimizing, and transforming code, as well 
as its support for various hardware architectures.
***/

namespace {
struct AutoDesignSpaceExplorer : public AutoDesignSpaceExploreBase<AutoDesignSpaceExplorer> {
  AutoDesignSpaceExplorer() = default;
//   AppDesignSpaceExplore(std::string dseTargetSpec) { targetSpec = dseTargetSpec; }
  SmallVector<FDRA::ForNode> createAffineForTree(func::FuncOp topfunc);
  void runOnOperation() override; 

};
} // namespace

SmallVector<FDRA::ForNode> AutoDesignSpaceExplorer::
                      createAffineForTree(func::FuncOp topfunc){
  auto TopForOps = topfunc.getOps<AffineForOp>();
  auto targetLoops =
      SmallVector<AffineForOp, 4>(TopForOps.begin(), TopForOps.end());
   SmallVector<FDRA::ForNode, 4> rootForNodes;
  // SmallVector<AffineForOp, 4> RootAffineFor;
  for (AffineForOp loop : targetLoops) {
    FDRA::ForNode newForNode(&loop);
    rootForNodes.push_back(newForNode);
  }
  return rootForNodes;
}

void AutoDesignSpaceExplorer::runOnOperation(){
  auto topmodule = getOperation();
  unsigned func_cnt = 0;
  for (auto func : topmodule.getOps<func::FuncOp>()) {
    SmallVector<FDRA::ForNode, 2> rootForNodes = createAffineForTree(func);
    func_cnt++;
  }
  assert(func_cnt == 1 && "Can't handle subfunctions.");
//     // Read target specification JSON file.
//     std::string errorMessage;
//     auto configFile = mlir::openInputFile(targetSpec, &errorMessage);
//     if (!configFile) {
//       llvm::errs() << errorMessage << "\n";
//       return signalPassFailure();
//     }

//     // Parse JSON file into memory.
//     auto config = llvm::json::parse(configFile->getBuffer());
//     if (!config) {
//       llvm::errs() << "failed to parse the target spec json file\n";
//       return signalPassFailure();
//     }
//     auto configObj = config.get().getAsObject();
//     if (!configObj) {
//       llvm::errs() << "support an object in the target spec json file, found "
//                       "something else\n";
//       return signalPassFailure();
//     }

//     // Collect DSE configurations.
//     unsigned outputNum = configObj->getInteger("output_num").value_or(30);

//     unsigned maxInitParallel =
//         configObj->getInteger("max_init_parallel").value_or(32);
//     unsigned maxExplParallel =
//         configObj->getInteger("max_expl_parallel").value_or(1024);
//     unsigned maxLoopParallel =
//         configObj->getInteger("max_loop_parallel").value_or(128);

//     assert(maxInitParallel <= maxExplParallel &&
//            maxLoopParallel <= maxExplParallel &&
//            "invalid configuration of DSE");

//     unsigned maxIterNum = configObj->getInteger("max_iter_num").value_or(30);
//     float maxDistance = configObj->getNumber("max_distance").value_or(3.0);

//     bool directiveOnly =
//         configObj->getBoolean("directive_only").value_or(false);
//     bool resourceConstr =
//         configObj->getBoolean("resource_constr").value_or(true);

//     // Collect profiling latency and DSP usage data, where default values are
//     // based on Xilinx PYNQ-Z1 board.
//     llvm::StringMap<int64_t> latencyMap;
//     getLatencyMap(configObj, latencyMap);
//     llvm::StringMap<int64_t> dspUsageMap;
//     getDspUsageMap(configObj, dspUsageMap);

//     unsigned maxDspNum = ceil(configObj->getInteger("dsp").value_or(220) * 1.1);
//     if (!resourceConstr)
//       maxDspNum = UINT_MAX;

//     // Initialize an performance and resource estimator.
//     auto estimator = ScaleHLSEstimator(latencyMap, dspUsageMap, true);
//     auto explorer = ScaleHLSExplorer(estimator, outputNum, maxDspNum,
//                                      maxInitParallel, maxExplParallel,
//                                      maxLoopParallel, maxIterNum, maxDistance);

//     // Optimize the top function.
//     // TODO: Support to contain sub-functions.
//     for (auto func : module.getOps<func::FuncOp>()) {
//       if (hasTopFuncAttr(func))
//         explorer.applyDesignSpaceExplore(func, directiveOnly, outputPath,
//                                          csvPath);
//     }
}

std::unique_ptr<OperationPass<ModuleOp>> mlir::FDRA::createAutoDesignSpaceExplorePass(/*std::string dseTargetSpec*/) {
  return std::make_unique<AutoDesignSpaceExplorer>(/*dseTargetSpec*/);
}
