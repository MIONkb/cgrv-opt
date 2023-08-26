//===- Utility.cpp - Some utility tools -----------===//
#include "mlir/Dialect/Affine/Analysis/LoopAnalysis.h"
#include "mlir/Dialect/Affine/Analysis/Utils.h"
#include "mlir/Dialect/Affine/IR/AffineOps.h"
#include "mlir/Dialect/Affine/LoopUtils.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Dialect/SCF/IR/SCF.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Dialect/MemRef/IR/MemRef.h"
#include "mlir/Dialect/ControlFlow/IR/ControlFlowOps.h"
#include "mlir/Transforms/DialectConversion.h"
#include "mlir/Transforms/RegionUtils.h"
#include "mlir/Support/LLVM.h"
// #include "mlir/IR/BlockAndValueMapping.h"

#include "llvm/Support/CommandLine.h"
#include "llvm/ADT/ArrayRef.h"


#include <iostream>
#include <filesystem>
#include <fstream>
#include <regex>

#include "RAAA/Dialect/FDRA/IR/FDRA.h"
#include "RAAA/Dialect/FDRA/Transforms/Passes.h"
#include "RAAA/Dialect/FDRA/Transforms/DSE.h"
#include "./PassDetail.h"


using namespace llvm; // for llvm.errs()
using namespace mlir;
using namespace mlir::FDRA;

//===----------------------------------------------------------------------===//
// eraseKERNEL
//===----------------------------------------------------------------------===//

mlir::Operation* mlir::FDRA::eraseKernel(func::FuncOp& TopFunc, FDRA::KernelOp& Kernel){
  /// return the corresponding first op of kernel
  mlir::Operation* return_op;
  bool IsFirstOp = true;
  /// traverse every operation in TopFunc
  // errs()<<"TopFunc :\n";TopFunc.dump();
  TopFunc.walk([&](mlir::Operation* op){
    // errs()<<"op :" << op->getName().getStringRef() << "\n";
    if(op->getName().getStringRef()== FDRA::KernelOp::getOperationName()){
      /// Found a kernel op
      FDRA::KernelOp Kernel_captured = dyn_cast<FDRA::KernelOp>(op);
      if(Kernel_captured == Kernel){
        /// Found the kernel we need to handle
        /// traverse every op of every block
        for(auto blk_itr=Kernel.getBody().begin(); blk_itr!=Kernel.getBody().end(); blk_itr++){
          for(auto op_itr=(*blk_itr).begin(); op_itr!=(*blk_itr).end(); op_itr++){
            if(op_itr->getName().getStringRef()== FDRA::TerminatorOp::getOperationName()){
              /// "FDRA.terminator" do not need to be replicated
              continue;
            }
            /// clone a new op and move it to the following loc of "FDRA.kernel"
            mlir::Operation* newop = (*op_itr).clone();
            blk_itr->push_back(newop);
            newop->moveBefore(op);

            /// return the 1st newop
            if(IsFirstOp){
              return_op = newop;
              IsFirstOp = false;
            }
          }
        }
      }
    }
  });
  /// erase "FDRA.kernel"
  Kernel.erase();
  /// return the corresponding first op of kernel after erase
  return return_op;
}
 

//===----------------------------------------------------------------------===//
// SpecifiedAffineFortoKernel
//===----------------------------------------------------------------------===//
OpTable TramUnsupportOpTable = 
{
  /// math dialect
  ::mlir::math::ExpOp::getOperationName(), // math.exp
  ::mlir::math::ErfOp::getOperationName(), // math.erf
  /// arith dialect
  // ::mlir::arith::CmpFOp::getOperationName() // arith.cmpf
};
LogicalResult mlir::FDRA::SpecifiedAffineFortoKernel(mlir::affine::AffineForOp& kernelforOp){
  /// Walk every op in this forop to check whether unsupport op is contained
  auto WalkResult = kernelforOp.getBody()->walk([&](mlir::Operation* op){
    StringRef opname = op->getName().getStringRef();
    if(TramUnsupportOpTable.count(opname)){ /// unsupported op is contained by forop
      return WalkResult::interrupt();
    }
    return WalkResult::advance();
  });
  if(WalkResult.wasInterrupted()){
    llvm::errs() << "[Info] Containing unsupported operations.\n" ;
    return LogicalResult::failure();
  }

  // errs()<<"    op :" << op->getName().getStringRef() << "\n";
  OpBuilder builder(kernelforOp.getOperation());

  // Create a kernel op and move the body region of the innermost loop into it
  Location loc = kernelforOp.getLoc();
  auto KernelOp = builder.create<FDRA::KernelOp>(loc);
  builder.setInsertionPointToEnd(&KernelOp.getBody().front());
  builder.create<FDRA::TerminatorOp>(loc);
  builder.setInsertionPointToStart(&KernelOp.getBody().front());

  // Copy root loop and its operations into the Kernel
  auto &ops = kernelforOp.getBody()->getOperations();
  KernelOp.getBody().front().getOperations().splice(
  KernelOp.getBody().front().begin(), ops, Block::iterator(kernelforOp));

  return LogicalResult::success();
}

//===----------------------------------------------------------------------===//
// getConstPartofAffineExpr(Is associated with Affine Dialect)
//===----------------------------------------------------------------------===//
/// @brief 
/// @param expr 
/// @return the constant part of this AffineExpr
AffineExpr mlir::FDRA::getConstPartofAffineExpr(AffineExpr& expr){
  AffineExpr constantpart;
  switch (expr.getKind())
  {
  case AffineExprKind::DimId :
    constantpart = getAffineConstantExpr(0, expr.getContext());
    break;

  case AffineExprKind::Add :
    constantpart = expr.dyn_cast<AffineBinaryOpExpr>().getRHS();
    // llvm::errs() << "[debug] const:"<< constantpart <<"\n"; 
    break;
  
  default:
    assert(0 && "We just support 2 kinds of expr: DimId, ADD right now!");
    break;
  }
  return constantpart;
}


//===----------------------------------------------------------------------===//
// MultiplicatorOfDim
//===----------------------------------------------------------------------===//

signed mlir::FDRA::MultiplicatorOfDim(const AffineExpr& expr, const unsigned dim){
  if(!expr.isFunctionOfDim(dim))
    return 0;

  llvm::outs() << "expr: " << expr << "\n";
  signed Multiplicator = 0;
  expr.walk([&](AffineExpr subExpr){
    llvm::outs() << "Sub-expression: " << subExpr << "\n";
    if(subExpr.isFunctionOfDim(dim)){
      switch (subExpr.getKind())
      {
      case AffineExprKind::DimId : // d1
        if(Multiplicator==0)
          Multiplicator = 1;
        break;

      case AffineExprKind::Mul : // d1 * 2 or 2 * d1
        if(subExpr.dyn_cast<AffineBinaryOpExpr>().getLHS()==getAffineDimExpr(dim, expr.getContext()) 
        && subExpr.dyn_cast<AffineBinaryOpExpr>().getRHS().getKind() == AffineExprKind::Constant)
        {/// if LHS of this subexpr is d1, then the multiplicattor is LHS
          
          Multiplicator = subExpr.dyn_cast<AffineBinaryOpExpr>().getRHS()
                            .dyn_cast<AffineConstantExpr>().getValue();
        }
        // constantpart = expr.dyn_cast<AffineBinaryOpExpr>().getRHS();
        // llvm::errs() << "[debug] const:"<< constantpart <<"\n"; 
        break;
  
      default:
        // assert(0 && "We just support 2 kinds of expr: DimId, ADD right now!");
        break;
      }
      llvm::outs() << "Multiplicator of dim "<< dim << " :"  << Multiplicator << "\n";
    }
    return WalkResult::advance(); // 返回 true，继续遍历子表达式
  });

  return Multiplicator;
}
//===----------------------------------------------------------------------===//
// removeUnusedRegionArgs
//===----------------------------------------------------------------------===//
// void mlir::FDRA::removeUnusedRegionArgs(Region &region){
//   SmallVector<BlockArgument, 4> args(region.getArguments().begin(),
//                                      region.getArguments().end());
//   for (auto arg : args) {
//     // Check if the argument is used in the region
//     llvm::errs() << "[debug] arg:" << arg <<"\n";
//     bool used = false;
//     region.walk([&](Operation* op) {
//       llvm::errs() << "[debug] op:" << *op <<"\n";
//       for (auto operand : op->getOperands()) {
//         llvm::errs() << "[debug] operand:" << operand <<"\n";
//         if (operand == arg){
//           used = true;
//         }
//       }
//     });
//     if (!used)
//       region.eraseArgument(arg.getArgNumber());
//   }
// }


//===----------------------------------------------------------------------===//
// removeUnusedRegionArgs
//===----------------------------------------------------------------------===//
// This function takes a `loadOp` or `storeOp` and eliminates unused indices in its
// index list.
void mlir::FDRA::eliminateUnusedIndices(Operation *op) {
  // Get the affine map for the operation.
  AffineMap map;
  ValueRange mapOperands;
  ::llvm::ArrayRef<int64_t> memrefShape;
  if (auto loadOp = dyn_cast<AffineLoadOp>(op)){
    map = loadOp.getAffineMap();
    mapOperands = loadOp.getIndices();
    memrefShape = loadOp.getMemref().getType().getShape();
  }
  else if (auto storeOp = dyn_cast<AffineStoreOp>(op)){
    map = storeOp.getAffineMap();
    mapOperands = storeOp.getIndices();
    memrefShape = storeOp.getMemref().getType().getShape();
  }
  else
    assert("Operation to eliminate unused indices should be AffineStoreOp or AffineLoadOp.");
  llvm::errs() << "[debug] op:" << *op <<"\n";
  // assert(memrefShape.size() == mapOperands.size());

  // llvm::errs() << "[debug] map:" << map <<"\n";
  // llvm::errs() << "[debug] map.getNumInputs():" << map.getNumInputs() <<"\n";
  // llvm::errs() << "[debug] mapOperands.size():" << mapOperands.size() <<"\n";
  // If one dim of the shape is 1, then set the index of this dim to be constant index 0]
  SmallVector<AffineExpr, 4> dimReplacements(memrefShape.size());
  unsigned j = 0;
  for (unsigned dim = 0; dim < memrefShape.size(); dim++) {
    if(memrefShape[dim] == 1){
      dimReplacements[dim] = getAffineConstantExpr(0, map.getContext());
    }
    else{
      dimReplacements[dim] = getAffineDimExpr(dim, map.getContext());
    }
    llvm::errs() << "[debug] dimReplacements:" << dimReplacements[dim] <<"\n";
  }
  // auto newMap = AffineMap::get(newIndexList.size(), map.getNumSymbols(), map.getResults(), op->getContext());
  map = map.replaceDimsAndSymbols(dimReplacements, {}, map.getNumDims(), map.getNumSymbols());

  // Get the operands for the operation.
  // Find which indices are used by checking which dimensions appear in the affine map.
  SmallVector<bool, 8> usedIndices(mapOperands.size(), false);
  // llvm::errs() << "[debug] map:" << map <<"\n";
  // llvm::errs() << "[debug] map.getNumInputs():" << map.getNumInputs() <<"\n";
  // llvm::errs() << "[debug] mapOperands.size():" << mapOperands.size() <<"\n";
  
  assert(map.getNumInputs() == mapOperands.size() && "map.getNumInputs() should be equal to operands.size().");
  for (unsigned input = 0; input < map.getNumInputs(); ++input) {
    unsigned index;
    auto results = map.getResults();
    for( index = 0; index < results.size(); index++){
      AffineExpr result = results[index];
      if(result.isFunctionOfDim(input))
        break;
    }
    if(index == results.size()){
      /// This input is not a operand of the load
      usedIndices[input] = false;
    }
    else{
      usedIndices[input] = true;
    }
  }

  SmallVector<Value, 4> newIndexList;
  SmallVector<AffineExpr, 4> dimReplacements2(map.getNumDims());
  j = 0;
  for (unsigned i = 0; i < mapOperands.size(); ++i) {
    if (usedIndices[i]){
      newIndexList.push_back(mapOperands[i]);
      dimReplacements2[i] = getAffineDimExpr(j++, map.getContext());
    }
    else{
      dimReplacements2[i] = getAffineConstantExpr(0, map.getContext());
    }
  }

  // auto newMap = AffineMap::get(newIndexList.size(), map.getNumSymbols(), map.getResults(), op->getContext());
  map = map.replaceDimsAndSymbols(dimReplacements2, {}, j, map.getNumSymbols());
  // llvm::errs() << "[debug] map after replace:" << map <<"\n";
  // llvm::errs() << "[debug] map:" << map <<"\n";
  // llvm::errs() << "[debug] map.getNumInputs():" << map.getNumInputs() <<"\n";
  // llvm::errs() << "[debug] mapOperands.size():" << mapOperands.size() <<"\n";
  // Set the new affine map and index list for the operation.
  if (auto loadOp = dyn_cast<AffineLoadOp>(op)){
    newIndexList.insert(newIndexList.begin(),loadOp.getMemref());
    loadOp.getOperation()->setAttr(AffineLoadOp::getMapAttrStrName(),AffineMapAttr::get(map));  
    loadOp.getOperation()->setOperands(newIndexList);
  }

  else if (auto storeOp = dyn_cast<AffineStoreOp>(op)){
    newIndexList.insert(newIndexList.begin(),storeOp.getMemref());
    newIndexList.insert(newIndexList.begin(),storeOp.getValue());
    storeOp.getOperation()->setAttr(AffineStoreOp::getMapAttrStrName(),AffineMapAttr::get(map)); 
    storeOp.getOperation()->setOperands(newIndexList);  
  }
}



//===----------------------------------------------------------------------===//
// getOperandInRank
//===----------------------------------------------------------------------===//

/// @brief return the AffineMap operand used in the rank 
/// @param op AffineLoadOp or AffineStoreOp or FDRA.BlockLoadOp
/// @param rank the result rank of the affine map 
/// @return SmallDenseMap<mlir::Value, unsigned> : < implemented arguments of dim, dim>
SmallDenseMap<mlir::Value, unsigned> mlir::FDRA::getOperandInRank(Operation* op, unsigned rank){
  // Get the affine map for the operation.
  AffineMap map;
  ValueRange mapOperands;
  SmallDenseMap<mlir::Value, unsigned> usedOperands;
  if (auto loadOp = dyn_cast<AffineLoadOp>(op)){
    map = loadOp.getAffineMap();
    mapOperands = loadOp.getIndices();
  }
  else if (auto storeOp = dyn_cast<AffineStoreOp>(op)){
    map = storeOp.getAffineMap();
    mapOperands = storeOp.getIndices();
  }
  else if (auto BlockLoad = dyn_cast<FDRA::DataBlockLoadOp>(op)){
    map = BlockLoad.getAffineMap();
    mapOperands = BlockLoad.getIndices();
  }
  else
    assert("Operation should be AffineStoreOp, AffineLoadOp or BlockLoadOp.");

  // Find which indices are used by checking which dimensions appear in the affine map.
  SmallVector<bool, 8> usedIndices(mapOperands.size(), false);
  llvm::errs() << "[debug] map:" << map <<"\n";
  
  assert(map.getNumInputs() == mapOperands.size() && "map.getNumInputs() should be equal to operands.size().");
  auto result = map.getResult(rank);
  llvm::errs() << "[debug] result:" << result <<"\n";
  for (unsigned input = 0; input < map.getNumInputs(); ++input) {
    if(result.isFunctionOfDim(input)){
      // usedOperands.push_back(std::move(mapOperands[input]));
      usedOperands[std::move(mapOperands[input])] = input;
      llvm::errs() << "[debug] mapOperands[input]:" << mapOperands[input] << ",input:" << input <<"\n";
    }
  }

  return usedOperands;
}

//===----------------------------------------------------------------------===//
// Class FDRA::ForNode
//===----------------------------------------------------------------------===//
/// public function for class FDRA::ForNode
bool FDRA::ForNode::IsInnermost(){
  /// Check whether another for Op exists inside this forop's region
  // llvm::errs() << "[debug] forop:\n";  
  // ForOp.dump();
  auto WalkResult = ForOp.getBody()->walk([&](mlir::Operation* op){
    if(op->getName().getStringRef()== mlir::affine::AffineForOp::getOperationName()){
      mlir::affine::AffineForOp forop = dyn_cast<AffineForOp>(op);
      assert(forop != NULL);
      return WalkResult::interrupt();
    }
    return WalkResult::advance();
  });
  if (WalkResult.wasInterrupted())
    return false;
  else
    return true;
}

/// public function for class FDRA::ForNode
bool FDRA::ForNode::IsThisLevelPerfect(){
  /// Check whether other Op exists in the same nested level of this for opn
  assert(this->HasParentFor() && "Parent loop of this loop has not been set.");
  AffineForOp* ParentFor = &(this->getParent()->getForOp());
  // ParentFor->dump();
  unsigned OpCount = 0;
  auto ib = ParentFor->getLoopBody().front().begin();
  auto ie = ParentFor->getLoopBody().front().end();
  for(; ib != ie; ib ++ ){
    if(ib->getName().getStringRef() == mlir::affine::AffineForOp::getOperationName() ||
       ib->getName().getStringRef() == FDRA::KernelOp::getOperationName() ||
       ib->getName().getStringRef() == mlir::affine::AffineYieldOp::getOperationName())
    {
      OpCount++;
    } 
    else
      return false; /// Find other Op whose type is not AffineFor/Kernel/Yield
  }
  assert(OpCount >= 2 && "Region of parent for op contain at least 2 op (a for/kernel and a yiled).");
  if(OpCount == 2){
    return true;
  }
  else{
    return false;
  }
}


/// Identifies operations that are beneficial to sink into kernels. These
/// operations may not have side-effects, as otherwise sinking (and hence
/// duplicating them) is not legal.
static bool isSinkingBeneficiary(Operation *op)
{
  return isa<arith::ConstantOp, func::ConstantOp, memref::DimOp,
             arith::SelectOp, arith::CmpIOp>(op);
}

/***
 * The purpose of this function is to determine whether
 * it is beneficial to sink an operation op into a kernel.
 * An operation can be sunk if doing so does not
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
static bool extractBeneficiaryOps(Operation *op,
                              llvm::SetVector<Value> existingDependencies,
                              llvm::SetVector<Operation *> &beneficiaryOps,
                              llvm::SmallPtrSetImpl<Value> &availableValues)
{
  if (beneficiaryOps.count(op))
    return true;

  if (!isSinkingBeneficiary(op))
    return false;

  for (Value operand : op->getOperands())
  {
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


/// @brief A tool function to sink operations into kernel op
/// @param kernelOp 
/// @return 
LogicalResult mlir::FDRA::sinkOperationsIntoKernelOp(FDRA::KernelOp kernelOp)
{
  Region &KernelOpBody = kernelOp.getBody();

  // Identify uses from values defined outside of the scope of the launch
  // operation.
  llvm::SetVector<Value> sinkCandidates;
  getUsedValuesDefinedAbove(KernelOpBody, sinkCandidates);

  llvm::SetVector<Operation *> toBeSunk;
  llvm::SmallPtrSet<Value, 4> availableValues;
  for (Value operand : sinkCandidates)
  {
    Operation *operandOp = operand.getDefiningOp();
    if (!operandOp)
      continue;
    extractBeneficiaryOps(operandOp, sinkCandidates, toBeSunk, availableValues);
  }

  // Insert operations so that the defs get cloned before uses.
  mlir::IRMapping map;
  OpBuilder builder(KernelOpBody);
  for (Operation *op : toBeSunk)
  {
    Operation *clonedOp = builder.clone(*op, map);
    // Only replace uses within the launch op.
    for (auto pair : llvm::zip(op->getResults(), clonedOp->getResults()))
      replaceAllUsesInRegionWith(std::get<0>(pair), std::get<1>(pair),
                                 kernelOp.getBody());
  }
  return success();
}


//===----------------------------------------------------------------------===//
// Extract a kernel to a outlined func
//===----------------------------------------------------------------------===//

/// @brief KERNELToFunc
/// @param KernelOp
/// @param kernelFnName
/// @param operands
/// @return
func::FuncOp mlir::FDRA::
    GenKernelFunc(FDRA::KernelOp KernelOp, llvm::SetVector<Value> &operands)
{
  Location loc = KernelOp.getLoc();
  // Create a builder with no insertion point, insertion will happen separately
  // due to symbol table manipulation
  OpBuilder builder(KernelOp.getBody().getContext());
  // Contains the region of code that will be outlined
  Region &KernelOpBody = KernelOp.getBody();
  std::string kernelFnName = KernelOp.getKernelName();

  // errs() << kernelFnName << ":\n";
  // KernelOp.dump();
  // Identify uses from values defined outside of the scope of the launch
  // operation.
  getUsedValuesDefinedAbove(KernelOpBody, operands);

  // Create the func.func operation.
  SmallVector<Type, 4> kernelOperandTypes;
  kernelOperandTypes.reserve(operands.size());
  for (Value operand : operands)
  {
    // errs()  << "  operands:"; operand.dump();
    kernelOperandTypes.push_back(operand.getType());
  }
  FunctionType type =
      FunctionType::get(KernelOp.getContext(), kernelOperandTypes, {});
  func::FuncOp KernelFunc = builder.create<func::FuncOp>(loc, kernelFnName, type);
  //  std::cout << "[debug] after create:\n"; KernelFunc.dump();
  KernelFunc->setAttr(kernelFnName, builder.getUnitAttr());
  KernelFunc->setAttr("Kernel", builder.getUnitAttr());

  /// Pass func arguements outside of KernelOp
  Block *entryBlock = new Block;
  for (Type argTy : type.getInputs())
  {
    entryBlock->addArgument(argTy, loc);
  }

  KernelFunc.getBody().getBlocks().push_back(entryBlock);

  mlir::IRMapping mapping;
  // Block &entryBlock = KernelFunc.getBody().front();
  for (unsigned index = 0; index < operands.size(); index++)
  {
    // errs()  << "  operands:" << operands[index] <<"\n";
    mapping.map(operands[index], entryBlock->getArgument(index));
  }
  KernelOpBody.cloneInto(&KernelFunc.getBody(), mapping);

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




//===----------------------------------------------------------------------===//
// For loop unroll and dse
//===----------------------------------------------------------------------===//
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
std::string mlir::FDRA::GenDFGfromAffinewithCMD
    (std::string KernelsDir, std::string kernelFnName, std::string llvmCDFGPass)
{
  /// Set cmd execute paths
  std::filesystem::path oldPath = std::filesystem::current_path();
  std::filesystem::current_path(KernelsDir);

  /// Lower to llvm dialect
  std::string sys_cmd = \
    "cgra-opt \
        --arith-expand --memref-expand\
        --affine-simplify-structures\
        -lower-affine --scf-for-loop-canonicalization  -convert-scf-to-cf\
        --finalize-memref-to-llvm=use-opaque-pointers \
        --convert-math-to-llvm --convert-math-to-libm\
        --convert-arith-to-llvm\
        -convert-func-to-llvm=use-bare-ptr-memref-call-conv\
        -reconcile-unrealized-casts \
        --canonicalize "
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
      -O2  --disable-loop-unrolling "
      + KernelsDir + "/" + kernelFnName + ".ll" \
      + " -S -o " 
      + KernelsDir + "/" + kernelFnName + "_opt.ll";

  result = system(sys_cmd.c_str());
  if(result != 0){
    assert(false && "[Error] Optimizing LLVM IR with LLVM opt falied! ");
    return "";
  }       

  sys_cmd = \
    "opt \
      --loop-rotate -gvn -mem2reg -memdep -memcpyopt -lcssa -loop-simplify \
      -licm -loop-deletion -indvars -simplifycfg\
      -mergereturn -indvars -instnamer "
      + KernelsDir + "/" + kernelFnName + "_opt.ll" \
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
FDRA::DFGInfo mlir::FDRA::GetDFGinfo(std::string DFGPath)
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
/// @param Node 
/// @param CurrentDesignSpace 
/// @return An updated DesignSpace depending on this Node
SmallVector<DesignPoint> mlir::FDRA::
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

/// @brief find all unrolling factors (which divides trip count)
/// @param Node a ForNode in loop-nest tree
/// @return vector which contains all unrolling factors
SmallVector<unsigned> FDRA::FindUnrollingFactors(FDRA::ForNode& Node){
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


/// @brief construct a AffineForTree with for-nodes and set the parent-child relationship
/// @param topfunc 
/// @return all for-nodes
SmallVector<FDRA::ForNode> mlir::FDRA::createAffineForTree(func::FuncOp topfunc){
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


/// @brief 
/// @param NodeVec a small vector which contains all For Node
/// @param forop a target loop we want to find 
/// @return the pointer to the target Loop Node which is the for op we want to find
FDRA::ForNode* mlir::FDRA::findTargetLoopNode(SmallVector<FDRA::ForNode>& NodeVec, mlir::affine::AffineForOp forop)
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
void mlir::FDRA::NestedGenTree(FDRA::ForNode* rootNode, SmallVector<FDRA::ForNode>& NodeVec){
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