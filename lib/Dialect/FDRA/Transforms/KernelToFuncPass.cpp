//===- KernelToModulePass.cpp - Convert a kernel to a Module file which will be optimized -----------===//
#include "mlir/Dialect/Affine/IR/AffineOps.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Dialect/SCF/IR/SCF.h"
#include "mlir/Dialect/MemRef/IR/MemRef.h"
#include "mlir/Dialect/ControlFlow/IR/ControlFlowOps.h"
// #include "mlir/Dialect/LLVMIR/LLVMDialect.h"

#include "mlir/Support/LLVM.h"
#include "mlir/Support/FileUtilities.h"
#include "mlir/Parser/Parser.h"
#include "mlir/IR/BlockAndValueMapping.h"
#include "mlir/IR/Builders.h"
#include "mlir/IR/SymbolTable.h"
#include "mlir/IR/Location.h"
#include "mlir/IR/OpImplementation.h"
#include "mlir/Transforms/RegionUtils.h"
#include "mlir/Transforms/DialectConversion.h"

#include <iostream>
// #include <fstream>
#include <filesystem>
#include <string>

#include "llvm/ADT/ArrayRef.h"
#include "llvm/ADT/Twine.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/FileSystem.h"

#include "RAAA/Dialect/FDRA/IR/FDRA.h"
#include "RAAA/Dialect/FDRA/Transforms/Passes.h"
#include "./PassDetail.h"


using namespace llvm; // for llvm.errs()
using namespace mlir;
using namespace mlir::FDRA;






//===----------------------------------------------------------------------===//
// KERNELToFunc
//===----------------------------------------------------------------------===//

namespace {
  
// A pass that traverses Kernels in the function and extracts them to 
// individual Func/Module.  
struct KernelToFuncPass: public ExtractKernelToFuncBase<KernelToFuncPass> {
public:
  void runOnOperation() override;
  static bool isSinkingBeneficiary(Operation *op);
  static bool extractBeneficiaryOps(Operation *op, llvm::SetVector<Value> existingDependencies,
                      llvm::SetVector<Operation *> &beneficiaryOps, llvm::SmallPtrSetImpl<Value> &availableValues);
  LogicalResult sinkOperationsIntoKernelOp(FDRA::KernelOp kernelOp);
  func::FuncOp GenKernelFunc(FDRA::KernelOp KernelOp, std::string kernelFnName, 
                      llvm::SetVector<Value>& operands);
  
};
} // namespace

//===----------------------------------------------------------------------===//
// Utilities
//===----------------------------------------------------------------------===//

/// Identifies operations that are beneficial to sink into kernels. These
/// operations may not have side-effects, as otherwise sinking (and hence
/// duplicating them) is not legal.
bool KernelToFuncPass::isSinkingBeneficiary(Operation *op) {
  return isa<arith::ConstantOp, func::ConstantOp, memref::DimOp,
             arith::SelectOp, arith::CmpIOp>(op);
}


/***
 * The purpose of this function is to determine whether 
 * it is beneficial to sink an operation op into a kernel. 
 * An operation can be sunk if  * doing so does not 
 * introduce new kernel arguments.
 * 
 * The function recursively checks whether each operand 
 * of op can be made available via sinking or is already 
 * a dependency. If all operands of op can be made available, 
 * op is added to beneficiaryOps and its results are 
 * marked as now available in availableValues. If an operand 
 * cannot be made available via sinking or is not 
 * already a dependency, the function returns false.
 * 
 * The isSinkingBeneficiary function is used to check
 * whether an operation is a candidate for sinking.
 * This function returns true if the operation is one 
 * of arith::ConstantOp, func::ConstantOp, memref::DimOp, 
 * arith::SelectOp, or arith::CmpIOp.
 * 
 * 
*/
bool KernelToFuncPass::extractBeneficiaryOps(Operation *op,
                      llvm::SetVector<Value> existingDependencies,
                      llvm::SetVector<Operation *> &beneficiaryOps,
                      llvm::SmallPtrSetImpl<Value> &availableValues) {
  if (beneficiaryOps.count(op))
    return true;

  if (!isSinkingBeneficiary(op))
    return false;

  for (Value operand : op->getOperands()) {
    // It is already visible in the kernel, keep going.
    if (availableValues.count(operand))
      continue;
    // Else check whether it can be made available via sinking or already is a
    // dependency.
    Operation *definingOp = operand.getDefiningOp();
    if ((!definingOp ||
         !extractBeneficiaryOps(definingOp, existingDependencies,
                                beneficiaryOps, availableValues)) &&
        !existingDependencies.count(operand))
      return false;
  }
  // We will sink the operation, mark its results as now available.
  beneficiaryOps.insert(op);
  for (Value result : op->getResults())
    availableValues.insert(result);
  return true;
}

LogicalResult KernelToFuncPass::sinkOperationsIntoKernelOp(FDRA::KernelOp kernelOp) {
  Region &KernelOpBody = kernelOp.body();

  // Identify uses from values defined outside of the scope of the launch
  // operation.
  llvm::SetVector<Value> sinkCandidates;
  getUsedValuesDefinedAbove(KernelOpBody, sinkCandidates);

  llvm::SetVector<Operation *> toBeSunk;
  llvm::SmallPtrSet<Value, 4> availableValues;
  for (Value operand : sinkCandidates) {
    Operation *operandOp = operand.getDefiningOp();
    if (!operandOp)
      continue;
    extractBeneficiaryOps(operandOp, sinkCandidates, toBeSunk, availableValues);
  }

  // Insert operations so that the defs get cloned before uses.
  BlockAndValueMapping map;
  OpBuilder builder(KernelOpBody);
  for (Operation *op : toBeSunk) {
    Operation *clonedOp = builder.clone(*op, map);
    // Only replace uses within the launch op.
    for (auto pair : llvm::zip(op->getResults(), clonedOp->getResults()))
      replaceAllUsesInRegionWith(std::get<0>(pair), std::get<1>(pair),
                                 kernelOp.body());
  }
  return success();
}



//===----------------------------------------------------------------------===//
// KERNELToFunc
//===----------------------------------------------------------------------===//


func::FuncOp KernelToFuncPass::GenKernelFunc(FDRA::KernelOp KernelOp,
           std::string kernelFnName, llvm::SetVector<Value>& operands){
  Location loc = KernelOp.getLoc();
  // Create a builder with no insertion point, insertion will happen separately
  // due to symbol table manipulation
  OpBuilder builder(KernelOp.body().getContext());
  // Contains the region of code that will be outlined
  Region &KernelOpBody = KernelOp.body();


  errs()  << kernelFnName << ":\n"; KernelOp.dump();
  // Identify uses from values defined outside of the scope of the launch
  // operation.
  getUsedValuesDefinedAbove(KernelOpBody, operands);

  // Create the func.func operation.
  SmallVector<Type, 4> kernelOperandTypes;
  kernelOperandTypes.reserve(operands.size());
  for (Value operand : operands) {
    // errs()  << "  operands:"; operand.dump();
    kernelOperandTypes.push_back(operand.getType());
  }
  FunctionType type =
      FunctionType::get(KernelOp.getContext(), kernelOperandTypes, {});
  func::FuncOp KernelFunc = builder.create<func::FuncOp>(loc, kernelFnName, type);
  //  std::cout << "[debug] after create:\n"; KernelFunc.dump();
  KernelFunc->setAttr(kernelFnName, builder.getUnitAttr());
  
  /// Pass func arguements outside of KernelOp
  Block *entryBlock = new Block;
  for (Type argTy : type.getInputs()){
    entryBlock->addArgument(argTy, loc);
  }

  KernelFunc.getBody().getBlocks().push_back(entryBlock);

  BlockAndValueMapping mapping;
  // Block &entryBlock = KernelFunc.getBody().front();
  for (unsigned index = 0; index < operands.size(); index++) {
    errs()  << "  operands:" << operands[index] <<"\n";
    mapping.map(operands[index], entryBlock->getArgument(index));
  }
  KernelOpBody.cloneInto(&KernelFunc.getBody(),mapping);

  // Branch from entry of the soda.func operation to the block that is cloned
  // from the entry block of the gpu.launch operation
  Block &KernelOpEntry = KernelOpBody.front();
  Block *clonedKernelOpEntry = mapping.lookup(&KernelOpEntry);
  builder.setInsertionPointToEnd(entryBlock);
  builder.create<cf::BranchOp>(loc, clonedKernelOpEntry);

  KernelFunc.walk([](FDRA::TerminatorOp op) {
    OpBuilder replacer(op);
    replacer.create<func::ReturnOp>(op.getLoc());
    op.erase();
  });

  return KernelFunc;
}

void KernelToFuncPass::runOnOperation()
{
  SymbolTable symbolTable(getOperation());
  // bool modified = false;
  unsigned cnt = 0;
  func::FuncOp topFunc;
  for (auto FuncOp : getOperation().getOps<func::FuncOp>()) 
  {
    cnt++;
    topFunc = FuncOp;
  }
  assert(cnt == 1 && "There should be only 1 topFunc in IR Module.");
  std::map<unsigned, FDRA::KernelOp> cnt_to_KernelOP;
  cnt = 0;
  // for (auto Kernel : topFunc.getOps<FDRA::KernelOp>()) 
  topFunc.walk([&](FDRA::KernelOp Kernel){
    // Insert just after the function.
    // Block::iterator insertPt(Kernel.getOperation()->getNextNode());
    auto KernelWalkResult = Kernel.walk([&](FDRA::KernelOp op) {
      llvm::SetVector<Value> operands;
      std::string kernelFnName =\
          Twine(op->getParentOfType<func::FuncOp>().getName()).concat("_kernel_"+std::to_string(cnt)).str();
      // Pull in instructions that can be sunk
      if (failed(sinkOperationsIntoKernelOp(op)))
        return WalkResult::interrupt();
      
      func::FuncOp NewKernelFunc = GenKernelFunc(op, kernelFnName, operands);
      symbolTable.insert(NewKernelFunc);

      /// If option "kernel-gen-dir" is set
      if(KernelGenDir != ""){ 
        OpBuilder builder(NewKernelFunc);
        std::filesystem::create_directory(KernelGenDir+"/kernels");
        std::string KernelFilePath_str = KernelGenDir+"/kernels/"+ kernelFnName + ".mlir";
        // mlir::StringRef KernelFilePath = KernelGenDir+"/kernels/"+ kernelFnName + ".mlir";
        // mlir::StringAttr KernelFilePath_Attr = builder.getStringAttr(KernelFilePath);
        // // Create a new operation at the desired location.
        // // builder.setInsertionPointToStart(newBlock);
        // auto loc = mlir::FileLineColLoc::get(KernelFilePath_Attr, 1, 1); // 1, 1: line, column
        // func::FuncOp FileFunc = builder.create<func::FuncOp>(loc, kernelFnName, NewKernelFunc.getFunctionType());
        // // state.addAttributes(NewKernelFunc->getAttrs());
        // FileFunc.getRegion().takeBody(NewKernelFunc.getBody());
        // std::cout << "[debug] after takeBody:\n";FileFunc.dump();

        std::error_code ec;
        llvm::raw_fd_ostream file(KernelFilePath_str, ec, sys::fs::FA_Write);
        if (ec) {
          llvm::errs() << "Error opening file: " << ec.message() << KernelFilePath_str << "\n";
          return WalkResult::advance();
        }
        NewKernelFunc.print(file);
      }
      /// Convert FDRA.Kernel{ ... } to func.call
      OpBuilder builder(op);
      builder.create<func::CallOp>(op.getLoc(), NewKernelFunc, operands.getArrayRef());
      return WalkResult::advance();
    });
    if (KernelWalkResult.wasInterrupted())
      return signalPassFailure();
    
    cnt_to_KernelOP[cnt] = Kernel;
    cnt++;
  });
  unsigned kernel_num = cnt;
  for (cnt = 0; cnt < kernel_num; cnt++) {
    assert(cnt_to_KernelOP[cnt] && "Counter and Kernel did not match!");
    cnt_to_KernelOP[cnt].erase();
  }
  std::cout << "[debug] after erase:\n"; topFunc.dump();
}


std::unique_ptr<OperationPass<ModuleOp>> mlir::FDRA::createExtractKernelToFuncPass() {
  return std::make_unique<KernelToFuncPass>();
}
