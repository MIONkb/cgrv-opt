//===- AdjustToCachesize.cpp - Adjust(Partition) Kernel according to a customized Cachesize -----------===//
#include "mlir/Dialect/Affine/IR/AffineOps.h"
#include "mlir/Dialect/Affine/Analysis/Utils.h"
#include "mlir/Dialect/Affine/Analysis/LoopAnalysis.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Dialect/SCF/IR/SCF.h"
#include "mlir/Dialect/MemRef/IR/MemRef.h"
#include "mlir/Dialect/ControlFlow/IR/ControlFlowOps.h"
#include "mlir/Dialect/LLVMIR/LLVMDialect.h"

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
// #include <filesystem>
#include <string>

#include "llvm/ADT/ArrayRef.h"
#include "llvm/ADT/Twine.h"
#include "llvm/ADT/SmallPtrSet.h"
#include "llvm/Support/CommandLine.h"
// #include "llvm/Support/raw_ostream.h"
// #include "llvm/Support/FileSystem.h"

#include "RAAA/Dialect/FDRA/IR/FDRA.h"
#include "RAAA/Dialect/FDRA/Transforms/Passes.h"
#include "./PassDetail.h"

using namespace llvm; // for llvm.errs()
using namespace mlir;
using namespace mlir::FDRA;

//===----------------------------------------------------------------------===//
// AdjustKernelMemoryFootprint to meet cachesize
//===----------------------------------------------------------------------===//

namespace
{

  // A pass that traverses Kernels in the Module and
  // Adjust or Partition Kernel according to a customized Cachesize
  struct AdjustMemoryFootprintPass : public AdjustKernelMemoryFootprintBase<AdjustMemoryFootprintPass>
  {
  public:
    void runOnOperation() override;
    uint64_t excessFactor_toCachesize(FDRA::KernelOp &Kernel);
    FDRA::KernelOp check_AllKernelMemoryFootprint(func::FuncOp topFunc, unsigned &Part_Factor);
    void outloop_partition(func::FuncOp Func, FDRA::KernelOp &Kernel, unsigned Part_Factor);
    Optional<int64_t> getSingleMemrefFootprintBytes(AffineForOp forOp);  
    void simplifyAffileLoopLevel(func::FuncOp topFunc);
    /// Utilities
    mlir::AffineForOp constructOuterLoopNest(mlir::AffineForOp &OriginforOp);
  };
} // namespace


Optional<int64_t> AdjustMemoryFootprintPass::
    getSingleMemrefFootprintBytes(AffineForOp forOp){
  auto *forInst = forOp.getOperation();
  Block &block = *forInst->getBlock();
  Block::iterator start = Block::iterator(forInst);
  Block::iterator end = std::next(Block::iterator(forInst));
  SmallDenseMap<mlir::Value, std::unique_ptr<MemRefRegion>, 4> regions;
  // Walk this 'affine.for' operation to gather all memory regions.
  auto result = block.walk(start, end, [&](Operation *opInst) -> WalkResult {
    if (!isa<AffineReadOpInterface, AffineWriteOpInterface>(opInst)) {
      // Neither load nor a store op.
      return WalkResult::advance();
    }

    // Compute the memref region symbolic in any IVs enclosing this block.
    auto region = std::make_unique<MemRefRegion>(opInst->getLoc());
    if (failed(
            region->compute(opInst,
                            /*loopDepth=*/getNestingDepth(&*block.begin())))) {
      return opInst->emitError("error obtaining memory region\n");
    }

    auto it = regions.find(region->memref);
    if (it == regions.end()) {
      regions[region->memref] = std::move(region);
    } else if (failed(it->second->unionBoundingBox(*region))) {
      return opInst->emitWarning(
          "getMemoryFootprintBytes: unable to perform a union on a memory "
          "region");
    }
    return WalkResult::advance();
  });
  if (result.wasInterrupted())
    return None;

  int64_t MaxSizeInBytes = 0;
  for (const auto &region : regions) {
    Optional<int64_t> size = region.second->getRegionSize();
    // errs() << " [debug] size:" << size.value() << "\n";
    if (!size.has_value())
      return None;
    MaxSizeInBytes = std::max(size.value(), MaxSizeInBytes);
  }
  return MaxSizeInBytes;

}

/// @brief traverse all lopps and fuse 2 levels if possible
/// @param topFunc 
void AdjustMemoryFootprintPass::simplifyAffileLoopLevel(func::FuncOp topFunc){
  errs()<<"top func:\n"; topFunc.dump();
  topFunc.walk([&](mlir::Operation *op)
  {
    // errs()<<"  op :"; op->dump();
    if(op->getName().getStringRef()== FDRA::KernelOp::getOperationName()){
      return WalkResult::advance();
    }
    else if(op->getName().getStringRef()== mlir::AffineForOp::getOperationName()){
      mlir::AffineForOp for_outer = dyn_cast<mlir::AffineForOp>(op);
      assert(for_outer.getLoopBody().getBlocks().size() == 1 
                && "for_outer should only get 1 region with only 1 block!");
      // errs()<<"          size:" << for_outer.getLoopBody().front().getOperations().size();

      if(for_outer.getLoopBody().front().getOperations().size() == 2 // 1 affineForOp and 1 affineYieldOp 
           && for_outer.getLoopBody().front().front().getName().getStringRef() == mlir::AffineForOp::getOperationName()){ 
              //1st .front() get 1st block and 2nt .front() get 1st operation
        mlir::AffineForOp for_inner = dyn_cast<mlir::AffineForOp>(for_outer.getLoopBody().front().front());

        if(for_inner.getLowerBoundOperands().size() == 1 && 
           for_inner.getUpperBoundOperands().size() == 1 &&
           *(for_inner.getLowerBoundOperands().begin()) == for_outer.getInductionVar() &&
           *(for_inner.getUpperBoundOperands().begin()) == for_outer.getInductionVar()){
          /// This 2 levels' affine.for can be simplified to 1
          AffineExpr Expr;
          AffineMap Map;
          int64_t step;
          ///////////////
          /// construct an identical loop with simplified level
          ///////////////

          /// Step 1: construct another loop to forOp
          // Loop bounds will be set later.
          Operation* new_op = for_inner.clone();
          op->getBlock()->push_back(new_op);
          new_op->moveAfter(for_outer);
          AffineForOp simpleLoop = dyn_cast<AffineForOp>(*new_op);
          // llvm::errs() << "[debug] Step 1:\n";Kernel.dump();

          /// Step 2: Change simpleLoop's lower/upper bound
          OpBuilder b(for_inner.getOperation());
          if (for_outer.hasConstantLowerBound()) ///lower bound
          {
            Expr = b.getAffineConstantExpr(for_outer.getConstantLowerBound());
            Map = AffineMap::get(0, 0, Expr);
            simpleLoop.setLowerBound({}, Map);
          }
          else
          {
            Expr = b.getAffineDimExpr(0);
            Map = AffineMap::get(1, 0, Expr);
            simpleLoop.setLowerBound(for_outer.getLowerBoundOperands(), Map);
          }

          if (for_outer.hasConstantUpperBound()) ///upper bound 
          {
            Expr = b.getAffineConstantExpr(for_outer.getConstantUpperBound());
            Map = AffineMap::get(0, 0, Expr);
            simpleLoop.setUpperBound({}, Map);
          }
          else
          {
            Expr = b.getAffineDimExpr(0);
            Map = AffineMap::get(1, 0, Expr);
            simpleLoop.setUpperBound(for_outer.getUpperBoundOperands(), Map);
          }

          /// Step 3: Set new step for simplified loop
          assert(for_outer.getStep() % for_inner.getStep() == 0 && "Step of inner loop should be a divisor of step of outer!");
          step = for_outer.getStep() / for_inner.getStep();
          simpleLoop.setStep(step);
          
          for_outer.erase();
        }
      }
    }
    return WalkResult::advance(); 
  });  
  
  return;
}



/// @brief check whether a FDRA.kernel meets the limits of cachesize
/// @param Kernel
/// @return a excessFactor that how many
///           times larger memory footprint is compared to cacheSize
uint64_t AdjustMemoryFootprintPass::
    excessFactor_toCachesize(FDRA::KernelOp &Kernel)
{
  unsigned Toploop_cnt = 0;
  uint64_t excessFactor;
  for (mlir::AffineForOp forOp : Kernel.getOps<mlir::AffineForOp>())
  {
    // errs()<<"[Info] Found a forOP:\n"; forOp.dump();
    /// get memory footprint of this kernel
    Optional<int64_t> fp_totalMem = mlir::getMemoryFootprintBytes(forOp);
    Optional<int64_t> fp_singleMem = AdjustMemoryFootprintPass::getSingleMemrefFootprintBytes(forOp);

    /// get how many times larger memory footprint is compared to cacheSize
    uint64_t cacheSizeBytes = Cachesize_Kib * 1024;
    uint64_t singleArraySizeBytes;

    if(SingleArray_Size == 0){
      singleArraySizeBytes = cacheSizeBytes;
    }
    else{
      singleArraySizeBytes = SingleArray_Size * 1024;
    }

    excessFactor = std::max(llvm::divideCeil(*fp_totalMem, cacheSizeBytes)
                              ,llvm::divideCeil(*fp_singleMem, singleArraySizeBytes));
    Toploop_cnt++;
  }
  assert(Toploop_cnt == 1 && "Kernel have only 1 top-loop!");
  return excessFactor;
}

/// @brief traverse all kernels and check whether it meets the limits of cachesize
/// @param Func
/// @return return a kernel whose mem footprint is larger than cachesize
FDRA::KernelOp AdjustMemoryFootprintPass::
    check_AllKernelMemoryFootprint(func::FuncOp topFunc, unsigned &Part_Factor)
{
  // for (auto Kernel : topFunc.getOps<FDRA::KernelOp>()) {
  FDRA::KernelOp Kernel = NULL;
  topFunc.walk([&](mlir::Operation *op)
  {
    // errs()<<"op :" << op->getName().getStringRef() << "\n";
    if(op->getName().getStringRef()== FDRA::KernelOp::getOperationName()){
      Kernel = dyn_cast<FDRA::KernelOp>(op);
      uint64_t excessFactor = excessFactor_toCachesize(Kernel);
      Part_Factor = 1;
      if(excessFactor > 1){
        Part_Factor = excessFactor;
        return WalkResult::interrupt();
      }
    }
    return WalkResult::advance(); });

  return Kernel;
}

void AdjustMemoryFootprintPass::
    outloop_partition(func::FuncOp topFunc, FDRA::KernelOp &Kernel, unsigned Part_Factor)
{
  assert(Part_Factor >= 1 && "Part_Factor is a integer larger than 1!");
  /// Tofix:
  /// Partition a loop through its outest loop may not be right
  // assert(Kernel.getOps<mlir::AffineForOp>().size() == 1 && "Part_Factor is a integer larger than 1!");
  mlir::AffineForOp forOp = *(Kernel.getOps<mlir::AffineForOp>().begin());

  // errs() << "forop: \n"<< forOp << "\n";
  int64_t largestDiv = getLargestDivisorOfTripCount(forOp);
  Optional<uint64_t> mayBeConstantCount = getConstantTripCount(forOp);

  mlir::AffineForOp OutforOp;
  OpBuilder b(forOp.getOperation());

  if (mayBeConstantCount && Part_Factor >= mayBeConstantCount.value())
  {
    /// tripcount of outloop is less than part factor:
    /// move FDRA.kernel{...} to inner loop
    // assert(forOp.hasConstantLowerBound() && forOp.hasConstantUpperBound() &&
    //       "We don't support Variable LowerBound now!");/// Todo : Variable LoopBound
    ///////////////
    /// adjust "FDRA.kernel" location
    ///////////////

    /// Step 1: erase old KernelOp and get corresponding op of kernel after erasing
    mlir::Operation *new_OutforOp = FDRA::eraseKernel(topFunc, Kernel);
    // llvm::errs() << "[debug] After erase:\n";topFunc.dump();

    /// Step 2: get forOp from inner for-loop of new_OutforOp
    OutforOp = dyn_cast<AffineForOp>(*new_OutforOp);

    std::vector<AffineForOp> AffineForOpVec;
    for (AffineForOp innerforOp : OutforOp.getOps<AffineForOp>())
    {
      AffineForOpVec.push_back(innerforOp);
    }

    /// Step 3: create new KernelOp
    for (AffineForOp innerforOp : AffineForOpVec)
    {
      FDRA::SpecifiedAffineFortoKernel(innerforOp);
    }
  }
  else {
    AffineExpr Expr;
    AffineMap Map;
    int64_t step;

    if (largestDiv % Part_Factor != 0)
    {
      /// Need to handle isolated loop
      // Intra-tile loop ii goes from i to min(i + tileSize * stepSize, ub_i).
      // Construct the upper bound map; the operands are the original operands
      // with 'i' (tile-space loop) appended to it. Isolation bound is needed to get.

      ///////////////
      /// construct an identical loop and get isolation bound
      ///////////////

      /// Step 1: construct an identical loop to forOp
      // Loop bounds will be set later.
      Operation* new_op = forOp.clone();
      Kernel.body().begin()->push_back(new_op);
      new_op->moveAfter(forOp);
      AffineForOp IslatedLoop = dyn_cast<AffineForOp>(*new_op);
      // llvm::errs() << "[debug] Step 1:\n";Kernel.dump();

      /// Step 2: get isolation bound
      int64_t Isolation_count = largestDiv - largestDiv % Part_Factor;

      /// Step 3: Set lower bound of Isolation loop and 
      ///  Upper bound of original loop 
      ///  = Isolation_count * Step + lower bound;
      ///  other 2 bounds remains.
      step = forOp.getStep();
      if (forOp.hasConstantLowerBound())
      {
        Expr = b.getAffineConstantExpr(forOp.getConstantLowerBound())+step*Isolation_count;
        Map = AffineMap::get(0, 0, Expr);
        IslatedLoop.setLowerBound({}, Map);
        forOp.setUpperBound({}, Map);
      }
      else
      {
        Expr = b.getAffineDimExpr(0)+step*Isolation_count;
        /// Tofix : "0" Here we assume that forOp.LowerBound() has only 1 Dim for affine
        Map = AffineMap::get(1, 0, Expr);
        IslatedLoop.setLowerBound(forOp.getLowerBoundOperands(), Map);
        forOp.setUpperBound(forOp.getLowerBoundOperands(), Map);
      }
      // llvm::errs() << "[debug] Step 3:\n";Kernel.dump();

      ///////////////
      /// Move position of "Kernel" Op
      ///////////////
      /// Step 4: create new KernelOp and erase old KernelOp
      FDRA::SpecifiedAffineFortoKernel(forOp);
      FDRA::SpecifiedAffineFortoKernel(IslatedLoop);
      new_op = FDRA::eraseKernel(topFunc, Kernel);
      Kernel = dyn_cast<FDRA::KernelOp>(*new_op);
      forOp = *(Kernel.getOps<mlir::AffineForOp>().begin()); /// one Kernel should only have one top for
      largestDiv = Isolation_count;
      /// Following handling is general for both largestDiv % Part_Factor ==0 or !=0 
    }

    /// Following handling is general for both largestDiv % Part_Factor ==0 or !=0 
    /// largestDiv % Part_Factor == 0
    /// No need of the min expression.
    // llvm::errs() << "[debug] Before construct:\n";Kernel.dump();forOp.dump();
    OutforOp = constructOuterLoopNest(forOp);

    ///////////////
    /// adjust "new" top loop index
    ///////////////
    // assert(forOp.hasConstantLowerBound() && forOp.hasConstantUpperBound() &&
    //       "We don't support Variable LowerBound now!");/// Todo : Variable LoopBound

    /// Step 1: adjust lower bound to original loop lower bound
    // llvm::errs() << "[debug] Before Step 1:\n";Kernel.dump();
    if (forOp.hasConstantLowerBound())
    {
      Expr = b.getAffineConstantExpr(forOp.getConstantLowerBound());
      Map = AffineMap::get(0, 0, Expr);
      OutforOp.setLowerBound({}, Map);
    }
    else
    {
      Map = forOp.getLowerBoundMap();
      OutforOp.setLowerBound(forOp.getLowerBoundOperands(), Map);
    }
    // llvm::errs() << "[debug] Step 1:\n";Kernel.dump();

    /// Step 2: adjust upper bound to original loop upper bound (= lower_bound + strip_count)
    if (forOp.hasConstantUpperBound())
    {
      Expr = b.getAffineConstantExpr(forOp.getConstantUpperBound());
      Map = AffineMap::get(0, 0, Expr);
      OutforOp.setUpperBound({}, Map);
    }
    else
    {
      Map = forOp.getUpperBoundMap();
      OutforOp.setUpperBound(forOp.getLowerBoundOperands(), Map);
    }
    // llvm::errs() << "[debug] Step 2:\n";Kernel.dump();

    /// Step 3: adjust step = strip_count / Part_Factor
    step = llvm::divideCeil(largestDiv, Part_Factor);
    OutforOp.setStep(step);
    // llvm::errs() << "[debug] Step 3:\n";Kernel.dump();

    ///////////////
    /// adjust "original" loop index
    ///////////////

    /// Step 4: adjust lower bound to new outer loop lower index value
    Expr = b.getAffineDimExpr(0);
    Map = AffineMap::get(1, 0, Expr);
    // newIntraTileLoop.setLowerBound(lbOperands, lbMap);
    forOp.setLowerBound(OutforOp.getInductionVar(), Map);
    // llvm::errs() << "[debug] Step 4:\n";Kernel.dump();

    /// Step 5: adjust upper bound = lower_bound + step
    Map = AffineMap::get(1, 0, Expr + step);
    forOp.setUpperBound(OutforOp.getInductionVar(), Map);
    // llvm::errs() << "[debug] Step 5:\n";Kernel.dump();

    /// Note: Step of original forOp remains

    ///////////////
    /// adjust "FDRA.kernel" location
    ///////////////

    /// Step 6: erase old KernelOp and get corresponding op of kernel after erasing
    mlir::Operation *new_OutforOp = FDRA::eraseKernel(topFunc, Kernel);
    // llvm::errs() << "[debug] After erase:\n";topFunc.dump();

    /// Step 7: get forOp from inner for-loop of new_OutforOp
    OutforOp = dyn_cast<AffineForOp>(*new_OutforOp);
    forOp = dyn_cast<AffineForOp>(OutforOp.getBody()->begin());

    /// Step 8: create new KernelOp
    FDRA::SpecifiedAffineFortoKernel(forOp);
    // llvm::errs() << "[debug] After create:\n";topFunc.dump();
  }

  // forOp.erase();
  return;
}

//===----------------------------------------------------------------------===//
// Utilities
//===----------------------------------------------------------------------===//
mlir::AffineForOp AdjustMemoryFootprintPass::
    constructOuterLoopNest(mlir::AffineForOp &OriginforOp)
{
  Location loc = OriginforOp.getLoc();

  // The outermost loops we add
  OpBuilder b(OriginforOp);

  // Loop bounds will be set later.
  AffineForOp OuterLoop = b.create<AffineForOp>(loc, 0, 0);
  // b.setInsertionPointToStart(OuterLoop.getBody());
  OuterLoop.getBody()->getOperations().splice(
      OuterLoop.getBody()->begin(), OriginforOp.getBody()->getOperations(),
      Block::iterator(OriginforOp));

  // adjust loop bounds
  // errs() << "[constructOuterLoopNest()] after OriginforOp:\n"; OriginforOp.dump();
  // errs() << "[constructOuterLoopNest()] after OuterLoop:\n"; OuterLoop.dump();
  return OuterLoop;
}

void AdjustMemoryFootprintPass::runOnOperation()
{
  func::FuncOp topFunc;
  unsigned cnt = 0;
  for (auto FuncOp : getOperation().getOps<func::FuncOp>())
  {
    cnt++;
    topFunc = FuncOp;
  }
  assert(cnt == 1 && "There should be only 1 topFunc in IR Module.");

  unsigned part_factor = 1; /// A kernel shoule be parted to partition_factor subkernels

  FDRA::KernelOp KernelToPart = check_AllKernelMemoryFootprint(topFunc, part_factor);
  while (part_factor != 1)
  { // KernelToPart != NULL
    // errs() << "\n[debug]topFunc:\n";
    topFunc.dump();
    outloop_partition(topFunc, KernelToPart, part_factor);
    KernelToPart = check_AllKernelMemoryFootprint(topFunc, part_factor);
    // break; ///for debug
  }
  
  /// simplify loop levels if possible
  simplifyAffileLoopLevel(topFunc);
}

std::unique_ptr<OperationPass<ModuleOp>>
mlir::FDRA::createAdjustKernelMemoryFootprintPass()
{
  return std::make_unique<AdjustMemoryFootprintPass>();
}
