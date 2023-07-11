//===- AutoDesignSpaceExplore.cpp - design space explore for application frontend optimization -----------===//

#include "mlir/Dialect/Affine/Analysis/LoopAnalysis.h"
#include "mlir/Dialect/Affine/Analysis/Utils.h"
#include "mlir/Dialect/Affine/IR/AffineOps.h"
#include "mlir/Dialect/Affine/LoopUtils.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/IR/BuiltinOps.h"
#include "mlir/Transforms/DialectConversion.h"

#include "mlir/Support/LLVM.h"
#include "mlir/Support/FileUtilities.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/MemoryBuffer.h"
#include "llvm/Support/ToolOutputFile.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/JSON.h"
#include "llvm/Support/FileSystem.h"

#include <numeric>
#include <iostream>
#include <filesystem>
#include <fstream>

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

***/

namespace {
using DesignPoint = SmallVector<unsigned,12>;

struct AutoDesignSpaceExplorer : public AutoDesignSpaceExploreBase<AutoDesignSpaceExplorer> {
  AutoDesignSpaceExplorer() = default;

  /* Function define */
//   AppDesignSpaceExplore(std::string dseTargetSpec) { targetSpec = dseTargetSpec; }
  FDRA::ForNode* findTargetLoopNode(SmallVector<FDRA::ForNode>& NodeVec, mlir::AffineForOp forop);
  void NestedGenTree(FDRA::ForNode*, SmallVector<FDRA::ForNode>&);
  SmallVector<FDRA::ForNode> createAffineForTree(func::FuncOp topfunc);
  SmallVector<unsigned> FindUnrollingFactors(FDRA::ForNode& Node); 
  SmallVector<DesignPoint> ExpandTilingAndUnrollingFactors(FDRA::ForNode Node, SmallVector<DesignPoint> CurrentDesignSpace);
  SmallVector<DesignPoint> ConstructTilingUnrollSpace(SmallVector<FDRA::ForNode> ForNodes);
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
  // SmallVector<unsigned> validFactors;
  unsigned factor = 1;
  unsigned tripCount = optionalTripCount.value();
  while (factor <= tripCount) {
    /// Push back the current factor.
    /// unrolling factor = 1 means no unrolling applied
    Node.UnrollFactors.push_back(factor);

    // Find the next possible size.
    ++factor;
    while (factor <= tripCount && tripCount % factor != 0)
      ++factor;
  }
  // Node.UnrollFactors = std::move(validFactors);
  return Node.UnrollFactors;
}

/// @brief 
/// @param Node 
/// @param CurrentDesignSpace 
/// @return An updated DesignSpace depending on this Node
SmallVector<DesignPoint> AutoDesignSpaceExplorer::
        ExpandTilingAndUnrollingFactors(FDRA::ForNode Node, SmallVector<DesignPoint> CurrentDesignSpace){
  SmallVector<DesignPoint> NewAllDesignSpace;
  
  // Design Space is empty
  if(CurrentDesignSpace.size()==0){
    DesignPoint emptypoint;
    CurrentDesignSpace.push_back(emptypoint);
  }

  for(DesignPoint point : CurrentDesignSpace){
    // for( unsigned tilingFactor : Node.TilingFactors )
    /// TODO: Tiling is not considered right now. 
    point.push_back(1); // No tiling right now
    if(Node.UnrollFactors.size()==0){
      point.push_back(1);
      NewAllDesignSpace.push_back(point);
    }
    for(unsigned UnrollFactor : Node.UnrollFactors ){
      DesignPoint newpoint = point;
      newpoint.push_back(UnrollFactor);
      NewAllDesignSpace.push_back(newpoint);
    }
  }
  return NewAllDesignSpace;
}



/// @brief A design point is a number sequence:
///        tilefactor(loop0),unrollfactor(loop0),tilefactor(loop1),unrollfactor(loop1).......
/// for example:
///       (1,1),(1,1),(1,3) represents a 3-level nested loop and the innermost loop is unrolled by 3
/// @param ForNodes All for loops
/// @return A SmallVector containing all design point
SmallVector<DesignPoint> AutoDesignSpaceExplorer::
            ConstructTilingUnrollSpace(SmallVector<FDRA::ForNode> ForNodes){
  SmallVector<DesignPoint> AllDesignSpace;
  DesignPoint point;
  unsigned point_num = 1;
  for (FDRA::ForNode Node : ForNodes) {
    AllDesignSpace = ExpandTilingAndUnrollingFactors(Node, AllDesignSpace);
    point_num *= Node.UnrollFactors.size();
  }

  /*** Print Design Space ***/
  llvm::errs() <<"//-----------  Design Space  ----------//\n";
  llvm::errs() <<"Loop-nested structure:\n";
  for (FDRA::ForNode Node : ForNodes) {
    if (!Node.HasParentFor())/// outermost loop
      Node.dumpTree();
  }

  llvm::errs() <<"Design Space:\n";
  for(DesignPoint point : AllDesignSpace){
    bool bracket_flag = 1;
    for(unsigned factor : point){
      if(bracket_flag) 
        llvm::errs() << "(";

      llvm::errs() << factor;

      if(bracket_flag) 
        llvm::errs() << ",";
      else 
        llvm::errs() << ")";

      bracket_flag = !bracket_flag;
    }
    llvm::errs() << "\n";
  }

  llvm::errs() <<"//-------------------------------------//\n";
  return AllDesignSpace;
}


/// @brief 
void AutoDesignSpaceExplorer::runOnOperation(){
  ModuleOp topmodule = getOperation();
  auto originmodule = topmodule.getOperation()->clone();
  unsigned func_cnt = 0;
  SmallVector<DesignPoint> AllDesignSpace;
  SmallVector<std::string> DesignSpacePaths;
  for (auto func : topmodule.getOps<func::FuncOp>()) {
    SmallVector<FDRA::ForNode> ForNodes = createAffineForTree(func);

    /** construct design space **/
    for (FDRA::ForNode& Node : ForNodes) {
      /* tiling if perfect */
      /// TODO: Tiling
      // if (Node.IsThisLevelPerfect()){
      // }
      /* unrolling if innermost */
      if (Node.IsInnermost()){
        FindUnrollingFactors(Node);
      }
    }

    // construct design space through all possible unroll factors
    AllDesignSpace = ConstructTilingUnrollSpace(ForNodes);

    func_cnt++;
  }
  assert(func_cnt == 1 && "Can't handle subfunctions.");

  /** Make a directory to contain all design points **/
  // Get current path
  std::filesystem::path currentPath = std::filesystem::current_path();

  // make a new dir
  std::string folderName = "DesignSpace";
  std::filesystem::path folderPath = currentPath / folderName;
  std::filesystem::create_directory(folderPath);

  /** Traverse the whole design space **/
  for(DesignPoint point : AllDesignSpace){
    topmodule = cast<ModuleOp>(originmodule->clone());
    func_cnt = 0;
    for (auto func : topmodule.getOps<func::FuncOp>()) {
      SmallVector<FDRA::ForNode> ForNodes = createAffineForTree(func);
      std::string fileName = func.getName().str();
      for(unsigned node_cnt = 0; node_cnt < ForNodes.size(); node_cnt++){
        /// update filename 
        fileName += "_" + std::to_string(point[2 * node_cnt]) 
                  + "_" + std::to_string(point[2 * node_cnt+1]);
        // llvm::errs() <<"filename:" << fileName << "\n";
        /// Skip the tiling factor
        
        /// Apply unroling by this factor
        unsigned unrollfactor = point[2 * node_cnt + 1];
        FDRA::ForNode NodeToUnroll = ForNodes[node_cnt];
        if(unrollfactor > 1){
          if(failed(loopUnrollByFactor(NodeToUnroll.getForOp(), 
                unrollfactor, /*annotateFn=*/nullptr, /*cleanUpUnroll=*/false))){
            llvm::errs() << "Unroll failed!!!\n";
            return signalPassFailure();
          }
        }
        // llvm::errs() << "[debug] new for:\n";
        // NodeToUnroll.dumpForOp();
      }

      /// create a new mlir file
      std::string filePath = folderPath.string() + "/" + fileName + ".mlir";
      std::error_code ec;
      llvm::raw_fd_ostream outputFile(filePath, ec, sys::fs::FA_Write);
      if (ec) {
        llvm::errs() << "Error opening file: " << ec.message() << filePath << "\n";
        return signalPassFailure();
      }
      DesignSpacePaths.push_back(filePath);

      topmodule.print(outputFile);
      llvm::errs() << "[Info] design point " << fileName << ":\n";
      topmodule.dump();

      func_cnt++;
    }
    assert(func_cnt == 1 && "Can't handle subfunctions.");
  }

  //////////////////////////
  /// Find the best unrolling factor for every kernel if CGRA ADG and 
  /// llvm DFG generator shared library(.so) is specified. 
  //////////////////////////
  if(CGRAadg == "noDefine"){
    llvm::errs() << "[Info]No cgra-adg specified. Generate design space only.\n";
    return;
  }
  if(llvmCDFGPass == "noDefine"){
    llvm::errs() << "[Info]No DFG generator shared library(.so) specified." 
                  << " Generate design space only.\n";
    return;
  }

  // Read target adg JSON file.
  std::string errorMessage;
  auto ADGFile = mlir::openInputFile(CGRAadg, &errorMessage);
  if (!ADGFile) {
    llvm::errs() << errorMessage << "\n";
    return signalPassFailure();
  }

  // Parse JSON file into memory.
  auto ADGjson = llvm::json::parse(ADGFile->getBuffer());
  if (!ADGjson) {
    llvm::errs() << "failed to parse the target cgra adg json file\n";
    return signalPassFailure();
  }
  auto ADGObj = ADGjson.get().getAsObject();
  if (!ADGObj) {
    llvm::errs() << "support an object in the target spec json file, found "
                  <<    "something else\n";
    return signalPassFailure();
  }

  // ADG adg;

  // unsigned SizeSpadBank = ADGObj->getInteger("iob_spad_bank_size").value_or(8192);
  ///TODO: Size Scratchpad 
  unsigned NumGPE = 0;
  unsigned NumIOB = 0;  
  auto instances = ADGObj->getArray("instances");   
  for(auto insJson : *instances){
    auto insJsonObj = insJson.getAsObject();
    auto insType = insJsonObj->getString("type").value();
    // llvm::errs() << "[info] type:" << insType << "\n";      
    if(insType == "GPE")
      NumGPE++;
    else if(insType == "IOB")
      NumIOB++;
  }

  for(auto DesignPointFile : DesignSpacePaths){
    std::error_code ec;
    llvm::raw_fd_ostream outputFile(DesignPointFile, ec, sys::fs::FA_Read);
    if (ec) {
      llvm::errs() << "Error opening file: " << ec.message() << DesignPointFile << "\n";
      return signalPassFailure();
    }
  }

  // for(auto& nodeJson : adgJson["sub_modules"]){
  //   ADGNode* node = parseADGNode(nodeJson);
  //   modules[node->id()] = std::make_pair(node, false);
  // }
  // for(auto& nodeJson : adgJson["instances"]){
  //   ADGNode* node = parseADGNode(nodeJson, modules);
  //   int nodeId = nodeJson["id"].get<int>();
  //   if(node){ // not store sub-module of "This" type
  //     adg->addNode(nodeId, node);
  //   }else{ // "This" sub-module
  //     adg->setId(nodeId);
  //   }
  // }
  // unsigned NumGPE = configObj->getArray("instances");
  // for(auto obj : )

  // unsigned maxInitParallel =
  //       configObj->getInteger("max_init_parallel").value_or(32);
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


std::unique_ptr<OperationPass<ModuleOp>> 
        mlir::FDRA::createAutoDesignSpaceExplorePass(/*std::string dseTargetSpec*/) {
  return std::make_unique<AutoDesignSpaceExplorer>(/*dseTargetSpec*/);
}
