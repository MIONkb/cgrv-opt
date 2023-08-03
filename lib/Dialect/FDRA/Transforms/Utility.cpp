//===- Utility.cpp - Some utility tools -----------===//
#include "mlir/Dialect/Affine/IR/AffineOps.h"
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
  ::mlir::arith::CmpFOp::getOperationName() // arith.cmpf
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
  if (auto loadOp = dyn_cast<AffineLoadOp>(op)){
    map = loadOp.getAffineMap();
    mapOperands = loadOp.getIndices();
  }
  else if (auto storeOp = dyn_cast<AffineStoreOp>(op)){
    map = storeOp.getAffineMap();
    mapOperands = storeOp.getIndices();
  }
  else
    assert("Operation to eliminate unused indices should be AffineStoreOp or AffineLoadOp.");
  // Get the operands for the operation.

  // Find which indices are used by checking which dimensions appear in the affine map.
  SmallVector<bool, 8> usedIndices(mapOperands.size(), false);
  // llvm::errs() << "[debug] map:" << map <<"\n";
  
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
  SmallVector<AffineExpr, 4> dimReplacements(map.getNumDims());
  unsigned j = 0;
  for (unsigned i = 0; i < mapOperands.size(); ++i) {
    if (usedIndices[i]){
      newIndexList.push_back(mapOperands[i]);
      dimReplacements[i] = getAffineDimExpr(j++, map.getContext());
    }
    else{
      dimReplacements[i] = getAffineConstantExpr(0, map.getContext());
    }
  }

  // auto newMap = AffineMap::get(newIndexList.size(), map.getNumSymbols(), map.getResults(), op->getContext());
  map = map.replaceDimsAndSymbols(dimReplacements, {}, j, map.getNumSymbols());
  // llvm::errs() << "[debug] map after replace:" << map <<"\n";

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
/// @return ValueRange
SmallVector<Value> mlir::FDRA::getOperandInRank(Operation* op, unsigned rank){
  // Get the affine map for the operation.
  AffineMap map;
  ValueRange mapOperands;
  SmallVector<Value> usedOperands;
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
  // llvm::errs() << "[debug] map:" << map <<"\n";
  
  assert(map.getNumInputs() == mapOperands.size() && "map.getNumInputs() should be equal to operands.size().");
  auto result = map.getResult(rank);
  for (unsigned input = 0; input < map.getNumInputs(); ++input) {
    if(result.isFunctionOfDim(input)){
      usedOperands.push_back(std::move(mapOperands[input]));
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