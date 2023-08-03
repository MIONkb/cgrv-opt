//===- AutoDesignSpaceExplore.cpp - design space explore for application frontend optimization -----------===//

#include "mlir/Dialect/Affine/Analysis/LoopAnalysis.h"
#include "mlir/Dialect/Affine/Analysis/Utils.h"
#include "mlir/Dialect/Affine/IR/AffineOps.h"
#include "mlir/Dialect/Affine/LoopUtils.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/IR/BuiltinOps.h"
#include "mlir/Transforms/DialectConversion.h"
#include "mlir/Parser/Parser.h"

#include "llvm/Support/SourceMgr.h"
#include "mlir/Support/LLVM.h"
#include "mlir/Support/FileUtilities.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/MemoryBuffer.h"
#include "llvm/Support/ToolOutputFile.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/JSON.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/GraphWriter.h"

#include <numeric>
#include <iostream>
#include <filesystem>
#include <fstream>
#include <regex>
#include <stack>

#include "RAAA/Dialect/FDRA/IR/FDRA.h"
#include "RAAA/Dialect/FDRA/Transforms/Passes.h"
#include "RAAA/Dialect/FDRA/Transforms/DSE.h"
#include "./PassDetail.h"


using namespace llvm; // for llvm.errs()
using namespace mlir;
using namespace mlir::affine;
using namespace mlir::FDRA;


/********** 
 * TODO: modify this
Steps to achieve the DSE process:

***/

namespace {
using DesignPoint = SmallVector<unsigned,12>;

struct AutoDesignSpaceExplorer : public AutoDesignSpaceExploreBase<AutoDesignSpaceExplorer> {
  AutoDesignSpaceExplorer() = default;

  /* Class define */
  class DFGInfo { 
    public: int Num_ALU = 0 , Num_LSU = 0;
  };

  /* Function define */
  FDRA::ForNode* findTargetLoopNode(SmallVector<FDRA::ForNode>& NodeVec, mlir::affine::AffineForOp forop);
  void NestedGenTree(FDRA::ForNode*, SmallVector<FDRA::ForNode>&);
  SmallVector<FDRA::ForNode> createAffineForTree(func::FuncOp topfunc);
  SmallVector<unsigned> FindUnrollingFactors(FDRA::ForNode& Node); 
  SmallVector<DesignPoint> ExpandTilingAndUnrollingFactors(FDRA::ForNode Node, SmallVector<DesignPoint> CurrentDesignSpace);
  SmallVector<DesignPoint> ConstructTilingUnrollSpace(SmallVector<FDRA::ForNode> ForNodes);
  std::string GenDFGfromAffinewithCMD(std::string KernelsDir, std::string kernelFnName);
  DFGInfo GetDFGinfo(std::string DFGPath);
  void runOnOperation() override; 

};
} // namespace

/// @brief 
/// @param NodeVec a small vector which contains all For Node
/// @param forop a target loop we want to find 
/// @return the pointer to the target Loop Node which is the for op we want to find
FDRA::ForNode* AutoDesignSpaceExplorer::
              findTargetLoopNode(SmallVector<FDRA::ForNode>& NodeVec, mlir::affine::AffineForOp forop)
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
    if(ib->getName().getStringRef() == mlir::affine::AffineForOp::getOperationName())
    {
      mlir::affine::AffineForOp NestFor = dyn_cast<AffineForOp>(ib);
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
      auto kn_ib = NestKernel.getBody().front().begin();
      auto kn_ie = NestKernel.getBody().front().end();
      for(; kn_ib != kn_ie; kn_ib ++ ){
        /// search nested loop in KernelOp
        if(ib->getName().getStringRef() == mlir::affine::AffineForOp::getOperationName())
        {
          mlir::affine::AffineForOp NestFor = dyn_cast<AffineForOp>(ib);
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
    if(op->getName().getStringRef()== mlir::affine::AffineForOp::getOperationName()){
      mlir::affine::AffineForOp forop = dyn_cast<AffineForOp>(op);
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

/// @brief This function is to generate DFG from a kernel in affine dialect
///        with linux command.
///        Users need to contain path of cgra-opt, mlir-translate and 
///        LLVM opt in linux system's search path, for example:
///        modify ~/.bashrc:        
///         $PATH="~/fdra/app-compiler/cgra-opt/build/bin:$PATH"
///         $PATH="~/llvm16-project/build/bin:$PATH"
/// @param KernelsDir  The directory containing the kernel to generate DFG
/// @param kernelFnName The kernel to generate DFG
/// @return Absolute path of DFG
std::string AutoDesignSpaceExplorer::
          GenDFGfromAffinewithCMD(std::string KernelsDir, std::string kernelFnName)
{
  /// Set cmd execute paths
  std::filesystem::path oldPath = std::filesystem::current_path();
  std::filesystem::current_path(KernelsDir);

  /// Lower to llvm dialect
  std::string sys_cmd = \
    "cgra-opt --arith-expand --memref-expand\
      -lower-affine --scf-for-loop-canonicalization  -convert-scf-to-cf\
      -convert-memref-to-llvm  --convert-math-to-llvm --convert-math-to-libm\
      --convert-arith-to-llvm\
      --affine-simplify-structures\
      -convert-func-to-llvm=use-bare-ptr-memref-call-conv\
      -reconcile-unrealized-casts "
      + KernelsDir+"/"+ kernelFnName + ".mlir"
      + " -o " + KernelsDir+"/"+ kernelFnName + "_ll.mlir";

  int result = system(sys_cmd.c_str());
  if(result != 0){
    assert(false && "[Error] Lowering to LLVM dialect with cgra-opt falied! ");
    return "";
  }

  /// mlir-translate *_ll.mlir to llvm IR
  sys_cmd = \
    "mlir-translate --mlir-to-llvmir "
    + KernelsDir+"/"+ kernelFnName + "_ll.mlir" 
    + " -o " 
    + KernelsDir+"/"+ kernelFnName + ".ll";

  result = system(sys_cmd.c_str());
  if(result != 0){
    assert(false && "[Error] Fail to translate to LLVM IR with mlir-translate! ");
    return "";
  }     

  /// Generate optimized LLVM IR
  sys_cmd = \
    "opt \
      --loop-rotate -gvn -mem2reg -memdep -memcpyopt -lcssa -loop-simplify \
      -licm -loop-deletion -indvars -simplifycfg\
      -mergereturn -indvars -instnamer "
      + KernelsDir + "/" + kernelFnName + ".ll" \
      + " -S -o " 
      + KernelsDir + "/" + kernelFnName + "_gvn.ll";

  result = system(sys_cmd.c_str());
  if(result != 0){
    assert(false && "[Error] Optimizing LLVM IR with LLVM opt falied! ");
    return "";
  }       

  /// Generate DFG
  sys_cmd = \
    "opt -load "
      + llvmCDFGPass + " \"-mapping-all=true\" "
      + " --cdfg "
      + KernelsDir + "/" + kernelFnName + "_gvn.ll"
      + " -S -o " 
      + KernelsDir + "/" + kernelFnName + "_cdfg.ll" 
      + " -enable-new-pm=0";
      
  result = system(sys_cmd.c_str());
  if(result != 0){
    assert(false && "[Error] Generating DFG with llvmCDFGPass.so falied! ");
    return "";
  }       

  /// Get DFG Path
  std::string affinedot = KernelsDir + "/affine.dot";
  if(!std::filesystem::exists(affinedot)){
    assert(false && "[Error] Generating affine.dot failed! ");
    return "";
  }
  std::filesystem::rename(affinedot, KernelsDir + "/" + kernelFnName +".dot");
  std::filesystem::current_path(oldPath);  // Come back to old path
  return KernelsDir + "/" + kernelFnName +".dot";
}

/// @brief 
/// @param DFGPath Absolute path of dot file
/// @return ALU and LSU number of DFG
AutoDesignSpaceExplorer::DFGInfo AutoDesignSpaceExplorer::GetDFGinfo(std::string DFGPath)
{
  DFGInfo dfginfo;
  std::ifstream  DFGdotStream;  

  DFGdotStream.open(DFGPath);
  if (!DFGdotStream.is_open()) {
    assert(0 && "DFG .dot can not be open.");
  } 

 	std::stringstream  DFGStrstream;
  DFGStrstream << DFGdotStream.rdbuf();
  DFGdotStream.close();
  std::string strline;
  std::smatch match;

  std::regex node_pattern("([a-zA-Z0-9]+)\\[opcode=([a-zA-Z0-9]+)"); //eg. FACC3283[opcode=FACC32, acc_params="0, 4, 1, 12", acc_first=1];
  std::regex edge_pattern("([a-zA-Z0-9]+) -> ([a-zA-Z0-9]+)\\[operand = ([0-9]+)"); //eg. const1->sub3[operand=0];
  /// read in every line
  while (getline(DFGStrstream, strline)){
    std::cout << "strline:" << strline << std::endl;
    bool found = regex_search(strline, match, node_pattern);
    /**** Found a node ****/
    if(found){ 
      std::string opcode;
      opcode = match.str(2);
      if(opcode == "Input" || opcode == "Output"){
        dfginfo.Num_LSU ++;
      }
      else{
        dfginfo.Num_ALU ++;
      }
    }
    // found = regex_search(strline, match, edge_pattern);
    // /**** Found an edge ****/
    // if(found){
    // }
  }
      	// DFGdotstr = DFGStrstream.str();
      	// std::cout<<DFGdotstr<<std::endl
  return dfginfo;
}       


/// @brief 
void AutoDesignSpaceExplorer::runOnOperation(){
  ModuleOp topmodule = getOperation();
  MLIRContext* context = topmodule.getContext();
  auto originmodule = topmodule.getOperation()->clone();
  unsigned func_cnt = 0;
  SmallVector<DesignPoint> AllDesignSpace;
  SmallVector<std::string> DesignSpaceFiles;
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
  std::filesystem::path DesignSpacefolderPath = currentPath / folderName;
  std::filesystem::create_directory(DesignSpacefolderPath);

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
      std::string filePath = DesignSpacefolderPath.string() + "/" + fileName + ".mlir";
      llvm::errs() << "filePath: " << filePath << "\n";
      std::error_code ec;
      llvm::raw_fd_ostream outputFile(filePath, ec, sys::fs::FA_Write);
      if (ec) {
        llvm::errs() << "Error opening file: " << ec.message() << filePath << "\n";
        return signalPassFailure();
      }
      DesignSpaceFiles.push_back(fileName);

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
  if(CGRAadg == "notdefined"){
    llvm::errs() << "[Info]No cgra-adg specified. Generate design space only.\n";
    return;
  }
  if(llvmCDFGPass == "notdefined"){
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

  for(auto DesignPointFile : DesignSpaceFiles){
    std::string FilePath = DesignSpacefolderPath.string() 
                                    + "/" + DesignPointFile + ".mlir";
    // llvm::errs() << "FilePath:" << FilePath << "\n";
    // llvm::StringRef FileName = DesignPointFile;
    // Set up the input file.
    std::string errorMessage;
    auto file = openInputFile(FilePath, &errorMessage);
    if (!file) {
      llvm::errs() << errorMessage << "\n";
      assert(0);
    }

    llvm::SourceMgr sourceMgr;
    sourceMgr.AddNewSourceBuffer(std::move(file), SMLoc());
    mlir::OwningOpRef<mlir::ModuleOp> m = parseSourceFile<ModuleOp>(sourceMgr, context); 
    mlir::ModuleOp moduleop = m.get();
    SymbolTable symbolTable(moduleop.getOperation());
    // llvm::errs() << "module:" << moduleop << "\n";

    //////////////////
    /// Extract all affine-for kernel
    //////////////////
    unsigned cnt = 0;
    for (auto func : moduleop.getOps<func::FuncOp>()) {
      for (Operation &op : llvm::make_early_inc_range(func.getOps())) {
        if (auto forOp = dyn_cast<AffineForOp>(&op)) {
          (void)FDRA::SpecifiedAffineFortoKernel(forOp);
        }
      }

      func.walk([&](FDRA::KernelOp Kernel)
      {
        // Insert just after the function.
        // Block::iterator insertPt(Kernel.getOperation()->getNextNode());
        auto KernelWalkResult = Kernel.walk([&](FDRA::KernelOp op) 
        {
          llvm::SetVector<Value> operands;
          std::string kernelFnName = "kernel_"+std::to_string(cnt);
          Kernel.setKernelName(kernelFnName);
          // Pull in instructions that can be sunk
          if (failed(sinkOperationsIntoKernelOp(op)))
            return WalkResult::interrupt();
      
          // ///////////////
          // /// Generate explicit data block movement (load/store) for kernel to consume
          // ///////////////
          // if(ExplicitDataTrans==true){
          //   /// generate explicit data movement around Kernel{...}
          //   // llvm::errs() << "[dubug] Before ExplicitKernelDataBLockLoadStore: \n";topFunc.dump();
          //   ExplicitKernelDataBLockLoadStore(Kernel);
          //   // llvm::errs() << "[dubug] After ExplicitKernelDataBLockLoadStore: \n";topFunc.dump();
        
          //   /// Eliminate the affine transformation of the upper/lower bound 
          //   /// of most-out loop in Kernel{...}
          //   EliminateOuterLoopAffineTrans(Kernel);
          // }

          func::FuncOp NewKernelFunc = GenKernelFunc(op, operands);
          symbolTable.insert(NewKernelFunc);

          /// If option "kernel-gen-dir" is set
          OpBuilder builder(NewKernelFunc);
          std::string KernelsDir = DesignSpacefolderPath.string() 
                                      + "/"+ DesignPointFile + "_kernels";

          std::filesystem::create_directory(KernelsDir);
          std::string KernelFilePath_str = KernelsDir+"/"+ kernelFnName + ".mlir";
          std::error_code ec;
          llvm::raw_fd_ostream file(KernelFilePath_str, ec, sys::fs::FA_Write);
          if (ec) {
            llvm::errs() << "Error opening file: " << ec.message() << KernelFilePath_str << "\n";
            return WalkResult::advance();
          }
          llvm::errs() << "Kernel:"  << kernelFnName << "\n";
          NewKernelFunc.dump();
          // NewKernelFunc.print(llvm::errs());
          NewKernelFunc.print(file);
          file.close();
          NewKernelFunc.erase();
          
          /// Generate DFG with linux system command
          std::string DFGPath = GenDFGfromAffinewithCMD(KernelsDir, kernelFnName);
          if(DFGPath.empty()){
            llvm::errs() << "[Error] Generate DFG failed!";
            return WalkResult::interrupt();
          }

          /// Read in DFG from dot
          DFGInfo dfginfo = GetDFGinfo(DFGPath);          

          /// Convert FDRA.Kernel{ ... } to func.call
          // OpBuilder builder(op);
          // builder.create<FDRA::KernelCallOp>(op.getLoc(), NewKernelFunc, operands.getArrayRef());
          return WalkResult::advance();
        });
        if (KernelWalkResult.wasInterrupted())
          return signalPassFailure();
        llvm::errs() << "module:" << moduleop << "\n";

        //////////////////
        /// Run lowering with linux system command
        /// TODO: use nested pass manager??
        //////////////////
        // mlir::PassManager nestedPM(&getContext());
        // nestedPM.addPass(std::make_unique<MyFirstPass>());
        // nestedPM.addPass(std::make_unique<MySecondPass>());

        // if (failed(nestedPM.run(getModule()))) {
        //   llvm::errs() << "Nested pipeline failed to run!\n";
        // }        

        // cnt_to_KernelOP[cnt] = Kernel;
        cnt++;
      });

    }

    llvm::errs() << "module:" << moduleop << "\n";
  }
}


std::unique_ptr<OperationPass<ModuleOp>> 
        mlir::FDRA::createAutoDesignSpaceExplorePass(/*std::string dseTargetSpec*/) {
  return std::make_unique<AutoDesignSpaceExplorer>(/*dseTargetSpec*/);
}
