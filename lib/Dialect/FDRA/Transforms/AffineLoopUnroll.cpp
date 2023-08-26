//===- AffineLoopUnroll.cpp - customed loop unroll -----------===//

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
#define PASS_NAME "fdra-affine-loop-unroll"
namespace {
struct FDRAAffineLoopUnrollPass : public FDRAAffineLoopUnrollBase<FDRAAffineLoopUnrollPass> {
  FDRAAffineLoopUnrollPass() = default;

  /* Function define */
  SmallVector<DesignPoint> ConstructTilingUnrollSpace(SmallVector<FDRA::ForNode> ForNodes);
  void runOnOperation() override; 

};
} // namespace

/// @brief A design point is a number sequence:
///        tilefactor(loop0),unrollfactor(loop0),tilefactor(loop1),unrollfactor(loop1).......
/// for example:
///       (1,1),(1,1),(1,3) represents a 3-level nested loop and the innermost loop is unrolled by 3
/// @param ForNodes All for loops
/// @return A SmallVector containing all design point
SmallVector<DesignPoint> FDRAAffineLoopUnrollPass::
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
void FDRAAffineLoopUnrollPass::runOnOperation(){
  ModuleOp topmodule = getOperation();
  MLIRContext* context = topmodule.getContext();
  auto originmodule = topmodule.getOperation()->clone();
  int func_cnt = 0;
  for (auto _ : topmodule.getOps<func::FuncOp>()) {
    func_cnt++;
  }
  assert(func_cnt == 1 && "A kernel module can only contain 1 function.");

  func::FuncOp topfunc = *(topmodule.getOps<func::FuncOp>().begin());
  SmallVector<DesignPoint> AllDesignSpace;
  SmallVector<std::string> DesignSpaceFiles;

  //////////////////////////
  /// Find the best unrolling factor for  kernel if CGRA ADG and 
  /// llvm DFG generator shared library(.so) is specified. 
  //////////////////////////
  unsigned NumGPE = 0;
  unsigned NumIOB = 0; 
  if(CGRAadg == "notdefined"){
    NumGPE = 32;
    NumIOB = 16;
  }
  else{
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

    // unsigned SizeSpadBank = ADGObj->getInteger("iob_spad_bank_size").value_or(8192);
    ///TODO: Size Scratchpad 
 
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
  }
  // ADG adg;

  if(llvmCDFGPass == "notdefined"){
    llvm::errs() << "[Info]No DFG generator shared library(.so) specified." 
                  << " Generate design space only.\n";
    return;
  }

  // make a new dir
  std::filesystem::path currentPath = std::filesystem::current_path();
  std::string folderName = "DesignSpace";
  std::filesystem::path DesignSpacefolderPath = currentPath / folderName;
  std::filesystem::create_directory(DesignSpacefolderPath);
  
  SmallVector<FDRA::ForNode> ForNodes = createAffineForTree(topfunc);

  /** construct design space **/
  for (FDRA::ForNode& Node : ForNodes) {
    /* unrolling if innermost */
    if (Node.IsInnermost()){
      FindUnrollingFactors(Node);
    }
  }

  // construct design space through all possible unroll factors
  AllDesignSpace = ConstructTilingUnrollSpace(ForNodes);
  // unsigned cnt = 0;

  /** Traverse the whole design space **/
  for(DesignPoint point : AllDesignSpace){
    topmodule = cast<ModuleOp>(originmodule->clone());
    func::FuncOp func = *(topmodule.getOps<func::FuncOp>().begin());

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
    // llvm::errs() << "filePath: " << filePath << "\n";
    std::error_code ec;
    llvm::raw_fd_ostream outputFile(filePath, ec, sys::fs::FA_Write);
    if (ec) {
      llvm::errs() << "Error opening file: " << ec.message() << filePath << "\n";
      return signalPassFailure();
    }
    DesignSpaceFiles.push_back(fileName);

    topmodule.print(outputFile);
    // llvm::errs() << "[Info] design point " << fileName << ":\n";
    topmodule.dump();
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
    // func::FuncOp func = *(moduleop.getOps<func::FuncOp>().begin());
    // llvm::errs() << "module:" << moduleop << "\n";

    /// Generate DFG with linux system command
    std::string DFGPath = GenDFGfromAffinewithCMD(DesignSpacefolderPath.string(), DesignPointFile, llvmCDFGPass);
    if(DFGPath.empty()){
      llvm::errs() << "[Error] Generate DFG failed!";
      assert(0);
    }

    /// Read in DFG from dot
    FDRA::DFGInfo dfginfo = GetDFGinfo(DFGPath);          
  }
}


std::unique_ptr<OperationPass<ModuleOp>> 
        mlir::FDRA::createFDRAAffineLoopUnrollPass() {
  return std::make_unique<FDRAAffineLoopUnrollPass>();
}
