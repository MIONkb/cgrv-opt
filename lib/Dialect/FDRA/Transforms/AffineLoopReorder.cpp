//===-  AffineLoopReorder.cpp -===//
#include "mlir/Dialect/Affine/IR/AffineOps.h"
#include "mlir/Dialect/Affine/Analysis/AffineAnalysis.h"
#include "mlir/Dialect/Affine/Analysis/Utils.h"
#include "mlir/Dialect/Affine/Analysis/AffineAnalysis.h"
#include "mlir/Dialect/Affine/Analysis/AffineStructures.h" 
#include "mlir/Dialect/Affine/Analysis/LoopAnalysis.h"
#include "mlir/Dialect/Affine/LoopUtils.h"
#include "mlir/Dialect/MemRef/IR/MemRef.h"
#include "mlir/Transforms/RegionUtils.h"
// #include "mlir/Transforms/LoopUtils.h"  
// #include "mlir/IR/AffineExpr.h"

#include "mlir/Support/LLVM.h"
#include "RAAA/Dialect/FDRA/IR/FDRA.h"
#include "RAAA/Dialect/FDRA/Transforms/Passes.h"
#include "./PassDetail.h"
#include "llvm/Support/Debug.h"
#include "llvm/ADT/DenseMap.h"
#include "llvm/ADT/ArrayRef.h"
#include "llvm/ADT/Twine.h"

// #include "stdc++.h"

using namespace llvm;
using namespace mlir;
using namespace mlir::affine;
using namespace mlir::FDRA;

#define DEBUG_TYPE "affine-loop-reorder"

/// TODO: support to pass in permutation map.

namespace {
struct AffineLoopReorder : public AffineLoopReorderBase<AffineLoopReorder> {
  AffineLoopReorder() = default;

  SmallVector<SmallVector<unsigned>> findValidLoopPermutations(AffineForOp forOp);
  template <typename LoadOrStoreOpPointer>
    SmallVector<SmallVector<int>> getAccessMatrix(LoadOrStoreOpPointer memoryOp);
  SmallDenseMap<unsigned, SmallVector<SmallVector<Operation* >> > getReuseGroupsForEachLoop(AffineForOp forOp);
  template <typename LoadOrStoreOpPointer>
    bool hasGroupSpatialReuse(LoadOrStoreOpPointer srcOpInst, LoadOrStoreOpPointer dstOpInst);
  template <typename LoadOrStoreOpPointer>
    bool hasGroupTemporalReuse(LoadOrStoreOpPointer srcOpInst, LoadOrStoreOpPointer dstOpInst, unsigned loop);
  
  LogicalResult ReorderOnAffineForOp(AffineForOp forOp);
  SmallVector<int64_t> GetAccessShapeAtThisLevel(AffineForOp ForLevel, SmallVector<Operation*> MemAccessOps);
  SmallVector<Operation*> Corresponding_MemAccessOps(AffineForOp forOp);
  void runOnOperation() override {
    func::FuncOp func = getOperation();
    // llvm::errs() << "func:\n" << func << "\n";
    SmallVector<AffineForOp, 4> loops; // stores forOps from outermost to innermost
    func.walk([&](AffineForOp forOp) {
      if (getNestingDepth(forOp) == 0) {
        loops.insert(loops.begin(), forOp);
        // llvm::outs() << "For loop\n";
        // for(auto it=loops.begin();it!=loops.end();it++) { (*it).dump(); }
        ArrayRef<AffineForOp> loops_arrayRef = llvm::makeArrayRef(loops);
        if (isPerfectlyNested(loops_arrayRef)) {
          ReorderOnAffineForOp(forOp);
        }
        else {
          // llvm::outs() << "Loops are not perfectly nested\n";
        }
        loops.clear();
        // if(loops.empty()) { llvm::outs() << "loops is empty\n"; }
      }
      else {
        loops.insert(loops.begin(), forOp);
      }
    });
  }
};
} // namespace

//1. For each loop l, compute number of memory accesses made when l is the innermost loop.
//        For innermost Loop, number of memory accesses = {
//            1 , when reference is loop invariant;
//            (tripCount/cacheLineSize), when reference has spatial reuse for loop l;
//            (tripCount), otherwise
//       }
//        a. For each reference group, choose a reference R.
//            i. if R has spatial reuse on loop l, add (tripCount/cacheLineSize) to number of memory accesses.
//            ii. else, if R has temporal reuse on loop l, add 1 to number of memory accesses.
//            iii. else, (add tripCount) to number of memory accesses.
//        b. Multiple the result of number of memory accesses by the tripCount of all the remaining loops.
// 2. Choose the loop with least number of memory accesses as the innermost loop, say it is L.
// 3. Find the valid loop permutation which has loop L as the innermost loop.
// 4. Find the loops which are parallel, does not carry any loop dependence.
// 5. For each loop permutation found in step 5, calculate the cost of synchronization.
//        Cost of synchronization is calculated for each parallel loop.
//        For a loop, synchronization cost = product of tripCounts of all loops which are at outer positions to this loop.
//6. Choose the permutation with the least synchronization cost as the best permutation.
LogicalResult AffineLoopReorder::ReorderOnAffineForOp(AffineForOp forOp) {
  // SmallDenseMap<unsigned, SmallVector<SmallVector<Operation *>> > loop_refGroups = getReuseGroupsForEachLoop(forOp);

  AffineForOp rootForOp = forOp;
  SmallVector<AffineForOp, 4> loops;
  getPerfectlyNestedLoops(loops, rootForOp);
  unsigned loopDepth = loops.size();
  if(loopDepth == 1){
    return LogicalResult::success();
  }
  SmallVector<unsigned> loopPermMap(loopDepth), OriginloopPerm(loopDepth);

  bool Interchangable = true;
  while(Interchangable){
    Interchangable = false;

    for (unsigned d=0;d < loopDepth - 1;d++) {
      loops.clear();
      getPerfectlyNestedLoops(loops, rootForOp);
      if(Interchangable) 
        break;/// traverse from root for op again
      
      /// initialize permutation map
      for (unsigned i = 0; i < loopDepth; i++) {
        OriginloopPerm[i] = i;
        if(i == d)
          loopPermMap[i] = d + 1; 
        else if(i == d + 1)
          loopPermMap[i] = d;
        else
          loopPermMap[i] = i;
      }

      AffineForOp OuterFor = loops[d];
      AffineForOp InnerFor = loops[d + 1];
      llvm::errs() << "Outer:\n"  << OuterFor 
                    << "Inner:\n" << InnerFor;
      /***
       * Step1: check whether two loop can be interchanged
      */
      ArrayRef<AffineForOp> loops_arrayRef = llvm::makeArrayRef(loops);
      ArrayRef<unsigned> loopPermMap_arrayRef = llvm::makeArrayRef(loopPermMap);
      if ( isValidLoopInterchangePermutation(loops_arrayRef,loopPermMap_arrayRef) ) {
        llvm::errs() << "Valid interchange\n"; 
        /***
        * Step2: Find corresponding load and store operations
        */
        SmallVector<Operation*> MemAccessOps = Corresponding_MemAccessOps(InnerFor);

        /***
        * Step3: compare the shapes of memory access before and after interchanging
        */        
        /// Before interchanging
        SmallVector<int64_t> Shape_before = GetAccessShapeAtThisLevel(/*level=*/InnerFor, MemAccessOps);

        /// After interchanging
        unsigned NewRootIndex = permuteLoops(loops, loopPermMap);
        SmallVector<int64_t> Shape_after = GetAccessShapeAtThisLevel(/*level=*/OuterFor, MemAccessOps);
        llvm::errs() << "Shape_before:";
        for(auto d : Shape_before){
          llvm::errs() << d << " ";
        }
        llvm::errs() << ";\n";
        llvm::errs() << "Shape_after:";
        for(auto d : Shape_after){
          llvm::errs() << d << " ";
        }
        llvm::errs() << ";\n";

        for(unsigned d = 0; d < Shape_after.size() || d < Shape_before.size(); d++){
          /* We want deliver as more data to accelerator's local memory as possible,
          * so we want the last dimmension(lowest) of the shape is larger.
          */ 
          if(Shape_before[Shape_before.size()-1-d] < Shape_after[Shape_after.size()-1-d]){
            Interchangable = true;
            break;
          }
          else if(Shape_before[Shape_before.size()-1-d] > Shape_after[Shape_after.size()-1-d]){
            Interchangable = false;
            break;
          }
        }
        rootForOp = loops[NewRootIndex];
        if(!Interchangable){
          /// permute to original nested-loop levels
          loops.clear();
          getPerfectlyNestedLoops(loops, rootForOp);
          NewRootIndex = permuteLoops(loops, loopPermMap);
          rootForOp = loops[NewRootIndex];
          /// Don't interchange, check the next loop level
        }
      }
    }
  }

  return success();
}

SmallVector<Operation*> AffineLoopReorder::Corresponding_MemAccessOps(AffineForOp forOp){
  SmallVector<Operation *> loadAndStoreOpInsts;
  // llvm::errs() << "forOp: " << forOp << "\n";
  forOp.getOperation()->walk([&](Operation *opInst) {
    SmallVector<SmallVector<int> > AccessMatrix;
    unsigned arrayDimension;
    if (auto store = dyn_cast<AffineStoreOp>(opInst)) {
      auto memRefType = store.getMemRef().getType().template cast<MemRefType> ();
      arrayDimension = memRefType.getRank();
    }
    else if (auto load = dyn_cast<AffineLoadOp>(opInst)) {
      auto memRefType = load.getMemRef().getType().template cast<MemRefType> ();
      arrayDimension = memRefType.getRank();
    }
    else{
      return WalkResult::advance();
    }

    AccessMatrix = getAccessMatrix(opInst);
    for(unsigned i = 0; i <  arrayDimension; i++){
      if(AccessMatrix[i][getNestingDepth(forOp)] != 0){
        loadAndStoreOpInsts.push_back(opInst);
        // llvm::errs() << "Corresponfing: " << *opInst << "\n";
        break;
      }
    }

    return WalkResult::advance();
  });

  return loadAndStoreOpInsts;
}


SmallVector<int64_t> AffineLoopReorder::GetAccessShapeAtThisLevel(
      AffineForOp ForLevel, SmallVector<Operation*> AccessOps){
  SmallVector <int64_t> CriticalShape;
  std::optional<int64_t> BiggestSize;  
  MemRefRegion CriticalRegion(AccessOps[0]->getLoc());
  for(Operation* AccessOp : AccessOps){
    auto region = std::make_unique<MemRefRegion>(AccessOp->getLoc());
    if (failed(region->compute(AccessOp,
                  /*loopDepth=*/getNestingDepth(ForLevel)))) {
      assert(1 && "[Error] error obtaining memory region\n");
      // return AccessOp->emitError("error obtaining memory region\n");
    }
    SmallVector <int64_t> shape;
    // llvm::errs() << "region:\n";
    // region->dump();
    region->getConstantBoundingSizeAndShape(/*shape=*/&shape/*, lbs= , lbDivisors=*/);
    llvm::errs() << "op:"; AccessOp->dump();
    llvm::errs() << "shape:";
    for(auto d : shape){
      llvm::errs() << d << " ";
    }
    llvm::errs() << ";\n";
    std::optional<int64_t> size = region->getRegionSize();
    llvm::errs() << "size: "<< size <<"\n";

    if(size > BiggestSize){
      BiggestSize = size;
      CriticalShape = shape;
    }
  }
  return CriticalShape;

}

SmallVector<int64_t> AffineLoopReorder::GetAccessCountsAtThisLevel(
      AffineForOp ForLevel, SmallVector<Operation*> AccessOps){
  SmallVector <int64_t> CriticalShape;
  std::optional<int64_t> BiggestSize;  
  MemRefRegion CriticalRegion(AccessOps[0]->getLoc());
  for(Operation* AccessOp : AccessOps){
    auto region = std::make_unique<MemRefRegion>(AccessOp->getLoc());
    if (failed(region->compute(AccessOp,
                  /*loopDepth=*/getNestingDepth(ForLevel)))) {
      assert(1 && "[Error] error obtaining memory region\n");
      // return AccessOp->emitError("error obtaining memory region\n");
    }
    SmallVector <int64_t> shape;
    // llvm::errs() << "region:\n";
    // region->dump();
    region->getConstantBoundingSizeAndShape(/*shape=*/&shape/*, lbs= , lbDivisors=*/);
    llvm::errs() << "op:"; AccessOp->dump();
    llvm::errs() << "shape:";
    for(auto d : shape){
      llvm::errs() << d << " ";
    }
    llvm::errs() << ";\n";
    std::optional<int64_t> size = region->getRegionSize();
    llvm::errs() << "size: "<< size <<"\n";

    if(size > BiggestSize){
      BiggestSize = size;
      CriticalShape = shape;
    }
  }
  return CriticalShape;

}

// Given a forOp, returns all the loop permutations which have lexicographically positive dependence vectors.
SmallVector<SmallVector<unsigned>> AffineLoopReorder::findValidLoopPermutations(AffineForOp forOp) {
  SmallVector<AffineForOp, 4> loops;
  getPerfectlyNestedLoops(loops,forOp);
  SmallVector<SmallVector<unsigned>> validLoopPerm;
  if (loops.size() < 2)
    return validLoopPerm;  
  unsigned maxLoopDepth = loops.size();
  unsigned arr[maxLoopDepth];
  for(unsigned i=0; i<maxLoopDepth; i++) {
    arr[i] = i;
  }
  SmallVector<unsigned> loopPermMap(maxLoopDepth);
  SmallVector<unsigned> loopPerm(maxLoopDepth);
  do {
    for (unsigned i = 0; i < maxLoopDepth; ++i) {
      loopPermMap[arr[i]] = i; // inverted, referred sinkSequentialLoops func
      loopPerm[i] = arr[i];    // not inverted
    }
    ArrayRef<AffineForOp> loops_arrayRef = llvm::makeArrayRef(loops);
    ArrayRef<unsigned> loopPermMap_arrayRef = llvm::makeArrayRef(loopPermMap);
    if ( isValidLoopInterchangePermutation(loops_arrayRef,loopPermMap_arrayRef) ) {
      // display(arr,maxLoopDepth);
      validLoopPerm.push_back(loopPerm); // not loopPermMap
    }
  } while(std::next_permutation(arr,arr+maxLoopDepth));
  return validLoopPerm;
}


bool equalMatrices(SmallVector<SmallVector<int>> srcAccessMatrix,SmallVector<SmallVector<int>> dstAccessMatrix) {
  int numRows = srcAccessMatrix.size();
  int numCols = srcAccessMatrix[0].size();
  if ((numRows != dstAccessMatrix.size()) || (numCols != dstAccessMatrix[0].size())) 
    return false;

  for( int r=0;r<numRows;r++) {
    for(int c=0;c<numCols;c++) {
      if (srcAccessMatrix[r][c] != dstAccessMatrix[r][c])
        return false;
    }
  }
  return true;
}


template <typename LoadOrStoreOpPointer>
bool AffineLoopReorder::hasGroupSpatialReuse(LoadOrStoreOpPointer srcOpInst, LoadOrStoreOpPointer dstOpInst) {
  // int cacheLineSize = 8;
  // FlatAffineConstraints accessConstraints;
  // getAccessConstraints(srcOpInst, dstOpInst, &accessConstraints);
  // accessConstraints.dump();
  MemRefAccess SrcAccess(srcOpInst);
  MemRefAccess DstAccess(dstOpInst);
  FlatAffineValueConstraints accessConstraints;
  unsigned loopDepth = getNestingDepth(srcOpInst); // num of columns
  assert(loopDepth == getNestingDepth(dstOpInst));
  checkMemrefAccessDependence(SrcAccess, DstAccess, loopDepth, &accessConstraints,/*dependenceComponents=*/nullptr);
  // getAccessConstraints(srcOpInst, dstOpInst, &accessConstraints);
  // srcOpInst->dump(); //print
  // dstOpInst->dump();
  // accessConstraints.dump();

  unsigned numCols = accessConstraints.getNumCols();
  unsigned arrayDimension; // num of rows
  if (auto load = dyn_cast<AffineLoadOp>(srcOpInst)) {
    auto memRefType = load.getMemRef().getType().template cast<MemRefType> ();
    arrayDimension = memRefType.getRank();
  }
  else if (auto store = dyn_cast<AffineStoreOp>(srcOpInst)) {
    auto memRefType = store.getMemRef().getType().template cast<MemRefType> ();
    arrayDimension = memRefType.getRank();
  }
  // true if constant term differs in only last dimension
  for(unsigned r=0;r<arrayDimension;r++) {
    if ((r < (arrayDimension-1)) && int64_t(accessConstraints.atEq(r,numCols-1)) != 0)
      return false;
          // TODO: No regard of cacheLineSize
    // if ( (r == (arrayDimension-1)) && accessConstraints.atEq(r,numCols-1) < cacheLineSize)
    // if ( (r == (arrayDimension-1)) /*&& accessConstraints.atEq(r,numCols-1) < cacheLineSize*/)
    //   return true;
  }
  return true; // Check this.
  // return false;
}

template <typename LoadOrStoreOpPointer>
bool AffineLoopReorder::hasGroupTemporalReuse(LoadOrStoreOpPointer srcOpInst, LoadOrStoreOpPointer dstOpInst, unsigned loop) {
  // int cacheLineSize = 8;
  MemRefAccess SrcAccess(srcOpInst);
  MemRefAccess DstAccess(dstOpInst);
  FlatAffineValueConstraints accessConstraints;
  unsigned loopDepth = getNestingDepth(srcOpInst); // num of columns
  assert(loopDepth == getNestingDepth(dstOpInst));
  checkMemrefAccessDependence(SrcAccess, DstAccess, loopDepth, &accessConstraints,/*dependenceComponents=*/nullptr);
  // getAccessConstraints(srcOpInst, dstOpInst, &accessConstraints);
  // srcOpInst->dump(); //print
  // dstOpInst->dump();
  // accessConstraints.dump();
  unsigned numCols = accessConstraints.getNumCols();
  unsigned arrayDimension; // num of rows
  if (auto load = dyn_cast<AffineLoadOp>(srcOpInst)) {
    auto memRefType = load.getMemRef().getType().template cast<MemRefType> ();
    arrayDimension = memRefType.getRank();
  }
  else if (auto store = dyn_cast<AffineStoreOp>(srcOpInst)) {
    auto memRefType = store.getMemRef().getType().template cast<MemRefType> ();
    arrayDimension = memRefType.getRank();
  }
  // find array dimension which is not invariant to loop: 
  // these are the rows of access Matrix which has non-zero entries in loop column.

  // unsigned loopDepth = getNestingDepth(srcOpInst); // num of columns
  SmallVector< SmallVector<int> > accessMatrix;
  for (unsigned p=0;p<arrayDimension;p++) {
    SmallVector<int> tmp;
    for (unsigned q=0;q<loopDepth;q++) {
          tmp.push_back(int64_t(accessConstraints.atEq(p,q)));
    }
    accessMatrix.push_back(tmp);
  }

  SmallVector<int> loopVariantDims(arrayDimension,0);
  for (unsigned r=0;r<arrayDimension;r++) {
    if (accessMatrix[r][loop] != 0) 
      loopVariantDims[r] = 1;
  }

  // since access matrices are same, return true if constant terms differ in only loopVariantDims.
  for(unsigned r=0;r<arrayDimension;r++) {
    if (loopVariantDims[r] == 0 && accessConstraints.atEq(r,numCols-1) != 0)
      return false;
      //TODO:
    // if (loopVariantDims[r] == 1 && accessConstraints.atEq(r,numCols-1) > cacheLineSize)
    //   return false;
  }
  return true;
}

template <typename LoadOrStoreOpPointer>
SmallVector<SmallVector<int>> AffineLoopReorder::getAccessMatrix(LoadOrStoreOpPointer memoryOp) {
  MemRefAccess Access(memoryOp);
  FlatAffineRelation Rel;
  if (failed(Access.getAccessRelation(Rel)))
    assert(1 && "Should not run here.");
  unsigned loopDepth = getNestingDepth(memoryOp); // num of columns
  // checkMemrefAccessDependence(Access, Access, loopDepth, &accessConstraints,/*dependenceComponents=*/nullptr);
  FlatAffineValueConstraints accessConstraints = Rel.getDomainSet();
  // getAccessConstraints(memoryOp, memoryOp, &accessConstraints);
  // memoryOp->dump();
  // accessConstraints.dump(); // printing

  unsigned arrayDimension; // num of rows
  auto load = dyn_cast<AffineLoadOp>(memoryOp);
  auto store = dyn_cast<AffineStoreOp>(memoryOp);
  if (load) {
    auto memRefType = load.getMemRef().getType().template cast<MemRefType> ();
    arrayDimension = memRefType.getRank();
  }
  else if (store) {
    auto memRefType = store.getMemRef().getType().template cast<MemRefType> ();
    arrayDimension = memRefType.getRank();
  }
  // llvm::outs() << "AccessMatrix:\n";
  SmallVector< SmallVector<int> > accessMatrix;
  for (unsigned p=0;p<arrayDimension;p++) {
    SmallVector<int> tmp;
    for (unsigned q=0;q<loopDepth;q++) {
          tmp.push_back(int64_t(accessConstraints.atEq(p,q)));
          // llvm::outs() << accessConstraints.atEq(p,q) << " ";
    }
    accessMatrix.push_back(tmp);
    // llvm::outs() << "\n";
  }
  return accessMatrix;
}

// For each loop l, compute groups of array references.
//        Two references ref1 and ref2 belong to same group with respect to loop
//        l if:
//            a. they refer to the same array and has exactly same access
//            function. b. or, they refer to the same array and differ only in
//            lth dimension by atmost cacheLineSize. c. or, they refer to the
//            same array and differ by at most cacheLineSize in the last
//            dimension.
// conditions (a) and (b) corresponds to group temporal reuse, (c) corresponds
// to group spatial reuse.
SmallDenseMap<unsigned, SmallVector<SmallVector<Operation* >> > AffineLoopReorder::getReuseGroupsForEachLoop(AffineForOp forOp) {
  // get all load and store operations
  SmallVector<Operation *, 8> loadAndStoreOpInsts;
  SmallDenseMap<Operation *, bool> visitedOp;
  forOp.getOperation()->walk([&](Operation *opInst) {
    if (isa<AffineLoadOp>(opInst) || isa<AffineStoreOp>(opInst)) {
      loadAndStoreOpInsts.push_back(opInst);
      visitedOp[opInst] = false;
    }
  });
  SmallVector<AffineForOp, 4> loops;
  getPerfectlyNestedLoops(loops, forOp);
  unsigned loopDepth = loops.size();

  // get groups of loadAndStoreOpInsts for each loop
  SmallDenseMap<unsigned, SmallVector<SmallVector<Operation* >> > loop_refGroups; 
  /* SmallDenseMap: key is loop (e.g.if loop  = i,j,k then key = 0 for i, key = 1 for j, key = 2 for k)
    value is collection of refGroups for the loop
  */
  for (unsigned d = 0; d < loopDepth; d++) {
    SmallVector<SmallVector<Operation* >> refGroups;
    unsigned numOps = loadAndStoreOpInsts.size();
    // mark all ops as unvisited;
    for (unsigned i = 0; i < numOps; i++) {
      visitedOp[loadAndStoreOpInsts[i]] = false;
    }
    for (unsigned i = 0; i < numOps; ++i) {
      auto *srcOpInst = loadAndStoreOpInsts[i];
      llvm::errs() << "srcopinst:"; srcOpInst->dump();
      if (visitedOp[srcOpInst]) continue; //already added to a group
      // create a group and mark visited
      visitedOp[srcOpInst] = true;
      SmallVector<Operation *> currGroup;
      currGroup.push_back(srcOpInst);
      Value srcArray; // src array name
      if (auto store = dyn_cast<AffineStoreOp>(srcOpInst)) {
        srcArray = srcOpInst->getOperand(1);
      }
      else if (auto load = dyn_cast<AffineLoadOp>(srcOpInst)) {
        srcArray = srcOpInst->getOperand(0);
      }
      for (unsigned j = 0; j < numOps; ++j) {
        auto *dstOpInst = loadAndStoreOpInsts[j];
        llvm::errs() << "dstOpInst:"; dstOpInst->dump();
        if ((i == j) || visitedOp[dstOpInst] == true) {
          // same operation or already added to group
          continue;
        }
        Value dstArray; // dst array name
        if (auto store = dyn_cast<AffineStoreOp>(dstOpInst)) {
          dstArray = dstOpInst->getOperand(1);
        }
        else if (auto load = dyn_cast<AffineLoadOp>(dstOpInst)) {
          dstArray = dstOpInst->getOperand(0);
        }
        if (srcArray != dstArray) {
          continue;
        }
        else {
          // refer to same array and dstOpInst is not visited
          // check 1: they have same access matrix
          // check 2: check 1 && has group temporal reuse for loop d if they only differ in subscript having loop d by a small constant (< cache line size).
          // check 3: check 1 && has group spatial reuse if they differ in only last dimension
          // if check 2 or check 3 is satisfied, add this op to currGroup and mark it visited.
          SmallVector<SmallVector<int> > srcAccessMatrix = getAccessMatrix(srcOpInst);
          SmallVector<SmallVector<int> > dstAccessMatrix = getAccessMatrix(dstOpInst);
          if (equalMatrices(srcAccessMatrix, dstAccessMatrix)) {
            // group spatial reuse
            if (hasGroupSpatialReuse(srcOpInst, dstOpInst) || hasGroupTemporalReuse(srcOpInst, dstOpInst, d)) {
              // hasGroupSpatialReuse handles the case when array references are exactly same. (eg. A[i,j] and A[i,j])
              llvm::errs() << "pushed!:" << "\n";
              currGroup.push_back(dstOpInst);
              visitedOp[dstOpInst] = true;
            }
          }
        }
      } 
      llvm::errs() << "pushed!d:" << d << "\n";
      refGroups.push_back(currGroup);
    }
    loop_refGroups[d] = refGroups;
  }
  return loop_refGroups;
}


std::unique_ptr<OperationPass<func::FuncOp>> mlir::FDRA::createAffineLoopReorderPass() {
  return std::make_unique<AffineLoopReorder>();
}
