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
 * TODO: modify this
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
  FDRA::ForNode* findTargetLoopNode(SmallVector<FDRA::ForNode>& NodeVec, mlir::AffineForOp forop);
  void NestedGenTree(FDRA::ForNode*, SmallVector<FDRA::ForNode>&);
  SmallVector<FDRA::ForNode> createAffineForTree(func::FuncOp topfunc);
  SmallVector<unsigned> FindUnrollingFactors(FDRA::ForNode& Node); 
  void runOnOperation() override; 

};
} // namespace


/// @brief 
/// @param NodeVec a small vector which contains all For Node
/// @param forop a target loop we want to find 
/// @return the pointer to the target Loop Node which is the for op we want to find
FDRA::ForNode* AutoDesignSpaceExplorer::
              findTargetLoopNode(SmallVector<FDRA::ForNode>& NodeVec, mlir::AffineForOp forop)
{
  ForNode* ib = NodeVec.begin();
  ForNode* ie = NodeVec.end();
  for(; ib != ie; ib++){
    if(ib->getForOp() == forop)
      return ib;
  }
  return nullptr;
}

/// @brief Add relationship between parent and child nodes
/// @param rootNode A parent node whose children have not been set
/// @param NodeVec A small vector which contains all For Node
void AutoDesignSpaceExplorer::
                      NestedGenTree(FDRA::ForNode* rootNode, SmallVector<FDRA::ForNode>& NodeVec){
  unsigned Level = rootNode->getLevel() + 1;

  AffineForOp For = rootNode->getForOp();
  llvm::SmallVector<ForNode*> ChildrenVec;
  auto ib = For.getLoopBody().front().begin();
  auto ie = For.getLoopBody().front().end();
  for(; ib != ie; ib ++ ){
    if(ib->getName().getStringRef() == mlir::AffineForOp::getOperationName())
    {
      mlir::AffineForOp NestFor = dyn_cast<AffineForOp>(ib);
      // FDRA::ForNode ChildForNode(NestFor, /*Level=*/Level);
      FDRA::ForNode* ChildForNode = findTargetLoopNode(NodeVec, NestFor);
      ChildForNode->setParent(rootNode);
      ChildForNode->setLevel(Level);
      NestedGenTree(ChildForNode, NodeVec);
      ChildrenVec.push_back(ChildForNode);
    } 
    if(ib->getName().getStringRef() == FDRA::KernelOp::getOperationName())
    {
      FDRA::KernelOp NestKernel = dyn_cast<FDRA::KernelOp>(ib);
      auto kn_ib = NestKernel.body().front().begin();
      auto kn_ie = NestKernel.body().front().end();
      for(; kn_ib != kn_ie; kn_ib ++ ){
        /// search nested loop in KernelOp
        if(ib->getName().getStringRef() == mlir::AffineForOp::getOperationName())
        {
          mlir::AffineForOp NestFor = dyn_cast<AffineForOp>(ib);
          FDRA::ForNode* ChildForNode = findTargetLoopNode(NodeVec, NestFor);
          ChildForNode->setParent(rootNode);
          ChildForNode->setLevel(Level);
          NestedGenTree(ChildForNode, NodeVec);
          ChildrenVec.push_back(ChildForNode);
        }
      }
    } 
  }

  rootNode->setChildren(ChildrenVec);
}

/// @brief construct a AffineForTree with for-nodes and set the parent-child relationship
/// @param topfunc 
/// @return all for-nodes
SmallVector<FDRA::ForNode> AutoDesignSpaceExplorer::
                      createAffineForTree(func::FuncOp topfunc){
  SmallVector<FDRA::ForNode> ForNodeVec;
  topfunc.walk([&](mlir::Operation* op){
    if(op->getName().getStringRef()== mlir::AffineForOp::getOperationName()){
      mlir::AffineForOp forop = dyn_cast<AffineForOp>(op);
      assert(forop != NULL);
      FDRA::ForNode newForNode(forop);
      ForNodeVec.push_back(newForNode);
    }
  });

  auto TopForOps = topfunc.getOps<AffineForOp>();
  auto targetLoops =
      SmallVector<AffineForOp, 4>(TopForOps.begin(), TopForOps.end());
  for (AffineForOp loop : targetLoops) {
      FDRA::ForNode* rootForNode = findTargetLoopNode(ForNodeVec, loop);
      rootForNode->setLevel(0);
      NestedGenTree(rootForNode, ForNodeVec);
  }

  return ForNodeVec;
}

/// @brief find all unrolling factors (which divides trip count)
/// @param Node a ForNode in loop-nest tree
/// @return vector which contains all unrolling factors
SmallVector<unsigned> AutoDesignSpaceExplorer::FindUnrollingFactors(FDRA::ForNode& Node){
  assert(Node.IsInnermost()&&"Only innermost loop-nest can be unrolled.");
  auto optionalTripCount = getConstantTripCount(Node.getForOp());
  assert(optionalTripCount&&"Variable loop bound!");
  SmallVector<unsigned> validFactors;
  unsigned factor = 1;
  unsigned tripCount = optionalTripCount.value();
  while (factor <= tripCount) {
    /// Push back the current factor.
    /// unrolling factor = 1 means no unrolling applied
    validFactors.push_back(factor);

    // Find the next possible size.
    ++factor;
    while (factor <= tripCount && tripCount % factor != 0)
      ++factor;
  }
  Node.UnrollFactors = validFactors;
  return validFactors;
}

/// @brief 
void AutoDesignSpaceExplorer::runOnOperation(){
  auto topmodule = getOperation();
  unsigned func_cnt = 0;
  for (auto func : topmodule.getOps<func::FuncOp>()) {
    SmallVector<FDRA::ForNode, 2> ForNodes = createAffineForTree(func);
    for (FDRA::ForNode Node : ForNodes) {
      if (!Node.HasParentFor())/// outermost loop
        Node.dumpTree();
    }

    /** construct design space **/
    for (FDRA::ForNode Node : ForNodes) {
      /* tiling if perfect */
      /// TODO: Tiling
      // if (Node.IsThisLevelPerfect()){

      // }
      /* unrolling if innermost */
      if (Node.IsInnermost()){
        FindUnrollingFactors(Node);
      }
    }

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
