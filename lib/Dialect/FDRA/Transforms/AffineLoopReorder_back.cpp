//===-  AffineLoopReorder.cpp -===//
#include "mlir/Dialect/Affine/IR/AffineOps.h"
#include "mlir/Dialect/Affine/Analysis/AffineAnalysis.h"
#include "mlir/Dialect/Affine/Analysis/Utils.h"
#include "mlir/Dialect/Affine/Analysis/AffineAnalysis.h"
#include "mlir/Dialect/Affine/Analysis/AffineStructures.h" 
#include "mlir/Dialect/Affine/Analysis/LoopAnalysis.h"
#include "mlir/Dialect/Affine/LoopUtils.h"

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

/// Optimize loop order. Loops associated with memory access dependencies are
/// moved to an as outer as possible location of the input loop band. If
/// "reverse" is true, as inner as possible.
// bool scalehls::applyAffineLoopOrderOpt(AffineLoopBand &band,
//                                        ArrayRef<unsigned> permMap,
//                                        bool reverse) {
//   LLVM_DEBUG(llvm::dbgs() << "Loop order opt ";);
//   assert(!band.empty() && "no loops provided");

//   if (!isPerfectlyNested(band))
//     return false;

//   auto &loopBlock = *band.back().getBody();
//   auto bandDepth = band.size();

//   if (!permMap.empty() && isValidLoopInterchangePermutation(band, permMap)) {
//     auto newRoot = band[permuteLoops(band, permMap)];
//     band.clear();
//     getLoopBandFromOutermost(newRoot, band);
//     band.resize(bandDepth);
//     return true;
//   }

//   // Collect all load and store operations for each memory in the loop block,
//   // and calculate the number of common surrouding loops for later uses.
//   MemAccessesMap loadStoresMap;
//   getMemAccessesMap(loopBlock, loadStoresMap);
//   auto commonLoopDepth = getNumCommonSurroundingLoops(
//       *loopBlock.begin(), *std::next(loopBlock.begin()));

//   // A map of dependency distances indexed by the loop in the band.
//   SmallVector<AffineForOp, 8> targetLoops;
//   llvm::SmallDenseMap<Operation *, unsigned, 8> distanceMap;

//   //  Only the loops in the loop band will be checked.
//   unsigned startDepth = commonLoopDepth - bandDepth + 1;
//   for (unsigned depth = startDepth; depth < commonLoopDepth + 1; ++depth) {
//     auto loop = band[depth - startDepth];
//     unsigned minDistance = UINT_MAX;

//     // Traverse all memories in the loop block and find all dependencies
//     // associated to each memory.
//     for (auto pair : loadStoresMap) {
//       auto loadStores = pair.second;

//       int64_t dstIndex = 1;
//       for (auto dstOp : loadStores) {
//         for (auto srcOp : llvm::drop_begin(loadStores, dstIndex)) {
//           MemRefAccess dstAccess(dstOp);
//           MemRefAccess srcAccess(srcOp);

//           FlatAffineValueConstraints depConstrs;
//           SmallVector<DependenceComponent, 2> depComps;

//           DependenceResult result = checkMemrefAccessDependence(
//               srcAccess, dstAccess, depth, &depConstrs, &depComps);

//           if (hasDependence(result)) {
//             auto depComp = depComps[depth - 1];
//             assert(loop == depComp.op && "unexpected dependency");

//             // Only positive distance will be recorded.
//             if (depComp.ub.value() > 0) {
//               unsigned distance = std::max(depComp.lb.value(), (int64_t)1);
//               minDistance = std::min(minDistance, distance);
//             }
//           }
//         }
//         ++dstIndex;
//       }
//     }

//     // Collect all candidate loops into an ordered SmallVector. Loop with the
//     // smallest distance will appear in the front.
//     if (minDistance < UINT_MAX) {
//       distanceMap[loop] = minDistance;

//       for (auto it = targetLoops.begin(); it <= targetLoops.end(); ++it)
//         if (it == targetLoops.end()) {
//           targetLoops.push_back(loop);
//           break;
//         } else if (minDistance < distanceMap[*it]) {
//           targetLoops.insert(it, loop);
//           break;
//         }
//     }
//   }

//   distanceMap.clear();

//   // Permute the target loops one by one.
//   // TODO: a more comprehensive permution strategy search.
//   for (auto loop : targetLoops) {
//     unsigned targetLoopLoc =
//         std::find(band.begin(), band.end(), loop) - band.begin();

//     if (!reverse)
//       // Permute the target loop to an as outer as possible location.
//       for (unsigned dstLoc = 0; dstLoc < targetLoopLoc; ++dstLoc) {
//         SmallVector<unsigned, 4> permMap;

//         // Construct permutation map.
//         for (unsigned loc = 0; loc < bandDepth; ++loc) {
//           if (loc < dstLoc)
//             permMap.push_back(loc);
//           else if (loc < targetLoopLoc)
//             permMap.push_back(loc + 1);
//           else if (loc == targetLoopLoc)
//             permMap.push_back(dstLoc);
//           else
//             permMap.push_back(loc);
//         }

//         // Check the validation of the current permutation.
//         if (isValidLoopInterchangePermutation(band, permMap)) {
//           LLVM_DEBUG(llvm::dbgs() << "(";);
//           LLVM_DEBUG(for (unsigned i = 0, e = permMap.size(); i < e; ++i) {
//             llvm::dbgs() << permMap[i];
//             if (i != e - 1)
//               llvm::dbgs() << ",";
//           });
//           LLVM_DEBUG(llvm::dbgs() << ") ";);

//           auto newRoot = band[permuteLoops(band, permMap)];
//           band.clear();
//           getLoopBandFromOutermost(newRoot, band);
//           band.resize(bandDepth);
//           break;
//         }
//       }
//     else
//       // Permute the target loop to an as inner as possible location.
//       for (unsigned dstLoc = targetLoopLoc + 1; dstLoc < bandDepth; ++dstLoc) {
//         SmallVector<unsigned, 4> permMap;

//         // Construct permutation map.
//         for (unsigned loc = 0; loc < bandDepth; ++loc) {
//           if (loc < targetLoopLoc)
//             permMap.push_back(loc);
//           else if (loc == targetLoopLoc)
//             permMap.push_back(dstLoc);
//           else if (loc <= dstLoc)
//             permMap.push_back(loc - 1);
//           else
//             permMap.push_back(loc);
//         }

//         // Check the validation of the current permutation.
//         if (isValidLoopInterchangePermutation(band, permMap)) {
//           auto newRoot = band[permuteLoops(band, permMap)];
//           band.clear();
//           getLoopBandFromOutermost(newRoot, band);
//           band.resize(bandDepth);
//           break;
//         }
//       }
//   }

//   LLVM_DEBUG(llvm::dbgs() << "\n";);
//   return true;
// }

// Function to display the array 
void display(unsigned a[], unsigned n) 
{ 
   for (unsigned i = 0; i < n; i++) { 
       llvm::errs() << a[i] << "  "; 
   } 
   llvm::errs()  << "\n"; 
} 

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
  
  LogicalResult runOnAffineForOp(AffineForOp forOp);
  void runOnOperation() override {
    func::FuncOp func = getOperation();
    llvm::errs() << "func:\n" << func << "\n";
    SmallVector<AffineForOp, 4> loops; // stores forOps from outermost to innermost
    func.walk([&](AffineForOp forOp) {
      if (getNestingDepth(forOp) == 0) {
        loops.insert(loops.begin(), forOp);
        // llvm::outs() << "For loop\n";
        // for(auto it=loops.begin();it!=loops.end();it++) { (*it).dump(); }
        ArrayRef<AffineForOp> loops_arrayRef = llvm::makeArrayRef(loops);
        if (isPerfectlyNested(loops_arrayRef)) {
          runOnAffineForOp(forOp);
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
LogicalResult AffineLoopReorder::runOnAffineForOp(AffineForOp forOp) {
  SmallDenseMap<unsigned, SmallVector<SmallVector<Operation *>> > loop_refGroups = getReuseGroupsForEachLoop(forOp);

  SmallVector<AffineForOp, 4> loops;
  getPerfectlyNestedLoops(loops, forOp);
  unsigned loopDepth = loops.size();

  // tripCount of each loop
  SmallVector<unsigned long long> tripCount(loopDepth, INT_MAX);
  for (int d=0;d<loopDepth;d++) {
    auto maybeConstantCount = getConstantTripCount(loops[d]);
    if (maybeConstantCount)
      tripCount[d] = maybeConstantCount.value_or(0); 
  }

  // // find valid permutations
  SmallVector<SmallVector<unsigned>> validLoopPerm;
  validLoopPerm = findValidLoopPermutations(forOp);
  if (validLoopPerm.size() <= 1) return success();

  SmallVector<int> validInnerLoop(loopDepth, 0);
  for(int i=0;i<validLoopPerm.size();i++) {
    SmallVector<unsigned> loopPerm = validLoopPerm[i];
    int innerLoop = loopPerm[loopPerm.size()-1];
    validInnerLoop[innerLoop] = 1;
  }

  // SmallVector<unsigned long long> numMemAccess(loopDepth, 0);
  // for(unsigned d=0;d<loopDepth;d++) { 
  //   // proceeds only for valid innermost loops
  //   //  if not valid then set numMemAccess[d] to LONG_LONG_MAX
  //   if (!validInnerLoop[d]) {
  //     numMemAccess[d] = LONG_LONG_MAX;
  //     continue;
  //   }
  //   unsigned long long trip = tripCount[d];  //get trip count
  //   // considering d as the innermost loop
  //   // using the ref groups calculated for this loop
  //   SmallVector<SmallVector<Operation *>> refGroup = loop_refGroups[d];
  //   int sz = refGroup.size();
  //   for(int i=0;i<sz;i++) {
  //     SmallVector<Operation*> currGroup = refGroup[i];
  //     // take one member of this group and do numMemAcceses calculation based on that.
  //     Operation *opInst = currGroup[0];
  //     // cost function for innermost loop: {
  //     // 1            ,for loop invariant references,
  //     // (trip/cls)   ,for references with spatial reuse for this loop,
  //     // (trip)       ,otherwise.
  //     // }
  //     if (hasSelfTemporalReuse(opInst, d))
  //       numMemAccess[d] += 1;
  //     else if (hasSelfSpatialReuse(opInst, d)) 
  //       numMemAccess[d] += (trip/cacheLineSize);
  //     else
  //       numMemAccess[d] += trip;
  //   }
  //   // to get correct numMemAccess: multiply numMemAccess[d] by tripCounts of
  //   // all remaining loops
  //   for (unsigned dd=0;dd<loopDepth;dd++) {
  //     if (dd == d) {
  //       continue;
  //     }
  //     numMemAccess[d] *= tripCount[dd];
  //   }
  // }
  // step 1: choose the loop with least number of memory accesses (numMemAccess)
  // as innermost Loop. 
  // step 2: compute synchronization cost for parallel loops.

  // // choose the least cost loop as innermost Loop.
  // unsigned long long leastCost1 = numMemAccess[0]; 
  // unsigned leastCostLoop = 0;
  // for (unsigned d=0;d<loopDepth;d++) {
  //   if (numMemAccess[d]<leastCost1) {
  //     leastCost1 = numMemAccess[d];
  //     leastCostLoop = d;
  //   }
  // }
  // // print
  // // llvm::outs() << "least cost loop = " << leastCostLoop << "\n";

  // // get the valid permutations which has leastCostLoop as innermost
  // SmallVector<SmallVector<unsigned> > validPerms;
  // for(int i=0;i<validLoopPerm.size();i++) {
  //   SmallVector<unsigned> loopPerm = validLoopPerm[i];
  //   int innerLoop = loopPerm[loopPerm.size()-1];
  //   if (innerLoop == leastCostLoop) {
  //     validPerms.push_back(loopPerm);
  //   }
  // }
  
  // int totalPerm = validPerms.size();
  // // getParallelLoops returns an array of size loopDepth where each entry is either 0 or 1. 0 - not parallel, 1 - parallel loop
  // SmallVector<unsigned> parallelLoopMap = getParallelLoops(forOp);

  // // print
  // // llvm::outs() << "parallel loops = ";
  // // for (int i=0;i<parallelLoopMap.size();i++) {
  // //   if (parallelLoopMap[i])
  // //     llvm::outs() << i << " ";
  // // }
  // // llvm::outs() << "\n";

  // // computing synchronization Cost for each valid permutation with
  // // leastCostLoop as innermost loop. Synchronization cost for a parallel loop l
  // // = product of tripcount of loops which are at outer positions than loop l.
  // SmallVector<unsigned long long> syncCost(totalPerm, 0);
  // for (int v=0; v < totalPerm; v++) {
  //   SmallVector<unsigned> loopPerm = validPerms[v];
  //   for (unsigned i=0;i<parallelLoopMap.size();i++) {
  //     if (parallelLoopMap[i]) {
  //       // loop i is parallel
  //       unsigned long long cost = 1;
  //       unsigned parallelLoop = i;
  //       if (parallelLoop == leastCostLoop) continue;
  //       for(int j=0;j<loopPerm.size()-1;j++) {
  //         if (loopPerm[j] != parallelLoop) {
  //           cost *= tripCount[loopPerm[j]];
  //         }
  //         else if (loopPerm[j] == parallelLoop) {
  //           break;
  //         }
  //       }
  //       if (cost != 1) {
  //         syncCost[v] += cost;
  //       }
  //     }
  //   }
  // }

  // // step 3: Choose best loop permutation to be the one with least
  // // synchronization cost. print llvm::outs() << "synCost = \n";
  // unsigned leastSyncCostPerm = 0;
  // unsigned leastSyncCost = syncCost[0];
  // for(unsigned v=0;v<totalPerm;v++) {
  //   // for(int i=0;i<validPerms[v].size();i++) {
  //   // llvm::outs() << validPerms[v][i] << " ";
  //   // }
  //   // llvm::outs() << " => " << syncCost[v];
  //   // llvm::outs() << "\n";
  //   if (syncCost[v] < leastSyncCost) {
  //     leastSyncCostPerm = v;
  //     leastSyncCost = syncCost[v];
  //   }
  // }

  // SmallVector<unsigned> bestPerm = validPerms[leastSyncCostPerm];
  // // print best perm
  // // llvm::outs() << "best permutation = ";
  // // for(int i=0;i<bestPerm.size();i++) {
  // //   llvm::outs() << bestPerm[i] << " ";
  // // }
  // // llvm::outs() << "\n";

  // // step 4: create permutation map
  // SmallVector<unsigned, 4> loopPermMap(loopDepth);
  // for (int j=0;j<bestPerm.size();j++) {
  //   loopPermMap[bestPerm[j]] = j;
  // }

  // // llvm::outs() << "loopPermMap =";
  // // for (int j=0;j<loopPermMap.size();j++) {
  // //   llvm::outs() << loopPermMap[j] << " ";
  // // }
  // // llvm::outs() << "\n";
  // // Perform loop interchange according to permutation 'loopPermMap'.
  // unsigned loopNestRootIndex = permuteLoops(loops, loopPermMap);
  // return success();
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
      display(arr,maxLoopDepth);
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
  memoryOp->dump();

  MemRefAccess Access(memoryOp);
  FlatAffineRelation Rel;
  if (failed(Access.getAccessRelation(Rel)))
    assert(1 && "Should not run here.");
  unsigned loopDepth = getNestingDepth(memoryOp); // num of columns
  // checkMemrefAccessDependence(Access, Access, loopDepth, &accessConstraints,/*dependenceComponents=*/nullptr);
  FlatAffineValueConstraints accessConstraints = Rel.getDomainSet();
  // getAccessConstraints(memoryOp, memoryOp, &accessConstraints);
  memoryOp->dump();
  accessConstraints.dump(); // printing

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


// +//===- LoopInterchange.cpp - loop interchange pass  driven by an analytical cost model that
// +//     optimizes for locality (spatial, temporal - both self and group) and parallelism
// +//     for multicores (so as to minimize the frequence of synchronization)---------===//
// +//
// +// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// +// See https://llvm.org/LICENSE.txt for license information.
// +// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
// +//
// +//===----------------------------------------------------------------------===//
// +#include "PassDetail.h"
// +#include "mlir/Dialect/Affine/Passes.h"
// +#include "mlir/IR/AffineMap.h"
// +#include "mlir/IR/BlockAndValueMapping.h"
// +#include "mlir/IR/Builders.h"
// +#include "llvm/ADT/DenseMap.h"
// +#include "llvm/Support/CommandLine.h"
// +#include "mlir/Analysis/AffineAnalysis.h"
// +#include "mlir/Dialect/Affine/IR/AffineOps.h" 
// +#include "mlir/Transforms/LoopUtils.h"  
// +#include "mlir/IR/AffineExpr.h"
// +#include "mlir/Analysis/AffineStructures.h" 
// +#include "mlir/Analysis/LoopAnalysis.h" 
// +#include "mlir/Dialect/Affine/IR/AffineValueMap.h"
// +#include "mlir/IR/Types.h"
// +#include "mlir/IR/OpImplementation.h"
// +#include "mlir/Analysis/Utils.h"
// +#include "mlir/IR/Operation.h"
// +#include "llvm/Support/Debug.h"
// +#include "llvm/Support/raw_ostream.h"
// +#include "mlir/Support/LLVM.h"
// +#include <bits/stdc++.h>
// +
// +using namespace mlir;
// +using namespace std;
// +
// +#define DEBUG_TYPE "affine-loop-interchange"
// +
// +namespace {
// +struct LoopInterchange : public AffineLoopInterchangeBase<LoopInterchange> {
// +  // Chosen cache line size for evaluating cost model.
// +  int cacheLineSize = 8;
// +
// +  void runOnFunction() override;
// +  LogicalResult runOnAffineForOp(AffineForOp forOp);
// +
// +  SmallVector<SmallVector<unsigned>> findValidLoopPermutations(AffineForOp);
// +
// +  template <typename LoadOrStoreOpPointer>
// +  SmallVector<SmallVector<int>> getAccessMatrix(LoadOrStoreOpPointer memoryOp);
// +
// +  map<unsigned, SmallVector<SmallVector<Operation *>>>
// +  getReuseGroupsForEachLoop(AffineForOp forOp);
// +  SmallVector<unsigned> getSpatialReuse(SmallVector<SmallVector<int>> accessMatrix);
// +  SmallVector<unsigned> getTemporalReuse(SmallVector<SmallVector<int>> accessMatrix);
// +  SmallVector<unsigned> getParallelLoops(AffineForOp forOp);
// +
// +  template <typename LoadOrStoreOpPointer>
// +  bool hasGroupSpatialReuse(LoadOrStoreOpPointer srcOpInst,
// +                            LoadOrStoreOpPointer dstOpInst);
// +  template <typename LoadOrStoreOpPointer>
// +  bool hasGroupTemporalReuse(LoadOrStoreOpPointer srcOpInst,
// +                             LoadOrStoreOpPointer dstOpInst, unsigned loop);
// +  template <typename LoadOrStoreOpPointer>
// +  bool hasSelfSpatialReuse(LoadOrStoreOpPointer memoryOp, unsigned loop);
// +  template <typename LoadOrStoreOpPointer>
// +  bool hasSelfTemporalReuse(LoadOrStoreOpPointer memoryOp, unsigned loop);
// +};
// +} // end anonymous namespace
// +
// +std::unique_ptr<OperationPass<FuncOp>> mlir::createLoopInterchangePass() {
// +  return std::make_unique<LoopInterchange>();
// +}

// +
// +
// +template <typename LoadOrStoreOpPointer>
// +bool LoopInterchange::hasSelfTemporalReuse(LoadOrStoreOpPointer memoryOp, unsigned loop) {
// +  SmallVector<SmallVector<int>> accessMatrix = getAccessMatrix(memoryOp);
// +  SmallVector<unsigned> temporalReuseMap = getTemporalReuse(accessMatrix);
// +  if (temporalReuseMap[loop] == 1)
// +    return true;
// +  return false;
// +}
// +
// +template <typename LoadOrStoreOpPointer>
// +bool LoopInterchange::hasSelfSpatialReuse(LoadOrStoreOpPointer memoryOp, unsigned loop) {
// +  SmallVector<SmallVector<int>> accessMatrix = getAccessMatrix(memoryOp);
// +  SmallVector<unsigned> spatialReuseMap = getSpatialReuse(accessMatrix);
// +  if (spatialReuseMap[loop] == 1)
// +    return true;
// +  return false;
// +}
// +
// +// Returns a SmallVector of size loopDepth, index i corresponds to loop i.
// +// For a given accessMatrix, 0 indicates access is invariant to loop i.
// +// 1 indicates access is variant to loop i.
// +SmallVector<unsigned> LoopInterchange::getTemporalReuse(SmallVector<SmallVector<int>> accessMatrix) {
// +  // find zero columns
// +  int numRows = accessMatrix.size();
// +  int numCols = accessMatrix[0].size();
// +  SmallVector<unsigned> temporalReuseMap(numCols, 0);
// +
// +  for (int c = 0; c < numCols; c++) {
// +    for (int r = 0; r < numRows; r++) {
// +      if (accessMatrix[r][c] != 0) {
// +        break;
// +      }
// +      else if ( (r == (numRows-1)) && (accessMatrix[r][c] == 0)) {
// +        temporalReuseMap[c] = 1;
// +      }
// +    }
// +  }
// +  return temporalReuseMap;
// +}
// +
// +// Returns a SmallVector of size loopDepth, index i corresponds to loop i.
// +// For a given accessMatrix, 0 indicates absence of spatial reuse for loop i.
// +// 1 indicates presence of spatial reuse for loop i.
// +SmallVector<unsigned> LoopInterchange::getSpatialReuse(SmallVector<SmallVector<int>> accessMatrix) {
// +  // find if there is a column in access matrix such that only last entry is
// +  // non-zero and small. [0,0,0,....,c] int cacheLineSize = 8;
// +  int numRows = accessMatrix.size();
// +  int numCols = accessMatrix[0].size();
// +  SmallVector<unsigned> spatialReuseMap(numCols, 0);
// +
// +  for (int c = 0; c < numCols; c++) {
// +    for (int r = 0; r < numRows; r++) {
// +      if ((r != (numRows-1)) && (accessMatrix[r][c] != 0)) {
// +        break;
// +      }
// +      else if ( (r == (numRows-1)) && (accessMatrix[r][c] != 0) && (accessMatrix[r][c] < cacheLineSize)) {
// +        spatialReuseMap[c] = 1;
// +      }
// +    }
// +  }
// +  return spatialReuseMap;
// +}
// +

// +
// +
// +
// +// returns a SmallVector in which for an index i, 0 indicates loop i is not parallel and 1 indicates loop i is parallel.
// +// A loop is parallel if it does not carry any dependence.
// +SmallVector<unsigned> LoopInterchange::getParallelLoops(AffineForOp forOp) {
// +  SmallVector<AffineForOp, 4> loops;
// +  getPerfectlyNestedLoops(loops,forOp);
// +  unsigned maxLoopDepth = loops.size();
// +
// +  SmallVector<unsigned> parallelLoops(maxLoopDepth, 1); // initially all parallel
// +
// +  SmallVector<SmallVector<DependenceComponent, 2>> depCompsVec;
// +  getDependenceComponents(loops[0], maxLoopDepth, &depCompsVec);
// +  for (unsigned i = 0, e = depCompsVec.size(); i < e; ++i) {
// +     SmallVector<DependenceComponent, 2> &depComps = depCompsVec[i];
// +     assert(depComps.size() >= maxLoopDepth);
// +     for (unsigned j = 0; j < maxLoopDepth; ++j) {
// +       DependenceComponent &depComp = depComps[j];
// +       assert(depComp.lb.hasValue() && depComp.ub.hasValue());
// +       if (depComp.lb.getValue() != 0 || depComp.ub.getValue() != 0)
// +       {
// +         parallelLoops[j] = 0;
// +         break;
// +       }
// +     }
// +   }
// +
// +   // print
// +   // llvm::outs() << "depCompsVec: \n";
// +   // for (unsigned i = 0, e = depCompsVec.size(); i < e; ++i) {
// +   //   std::cout << "depCompsVec[" << i << "] = ";
// +   //   SmallVector<DependenceComponent, 2> &depComps = depCompsVec[i];
// +   //   assert(depComps.size() >= maxLoopDepth);
// +   //   for (unsigned j = 0; j < maxLoopDepth; ++j) {
// +   //     DependenceComponent &depComp = depComps[j];
// +   //     assert(depComp.lb.hasValue() && depComp.ub.hasValue());
// +   //     //depComp.op->dump();
// +   //     std::cout << "(" << depComp.lb.getValue() << ", " <<
// +   //     depComp.ub.getValue() << ") ";
// +   //   }
// +   //   std::cout << "\n";
// +   // }
// +
// +   return parallelLoops;
// +}