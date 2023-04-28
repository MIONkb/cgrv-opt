//===- DSE.h --------------------- --------------------*- C++ -*-===//
//===----------------------------------------------------------------------===//
#ifndef FDRA_CGRA_OPT_DSE_H
#define FDRA_CGRA_OPT_DSE_H

#include "mlir/Dialect/Affine/IR/AffineOps.h"
#include "mlir/Dialect/Affine/Analysis/Utils.h"
#include "mlir/Dialect/Affine/Analysis/AffineAnalysis.h"


#include "llvm/ADT/ArrayRef.h"
#include "llvm/ADT/Twine.h"

#include "RAAA/Dialect/FDRA/IR/FDRA.h"
#include "RAAA/Dialect/FDRA/Transforms/Passes.h"
// #include "./PassDetail.h"

using namespace std;
using namespace mlir;
using namespace llvm;

namespace mlir {
namespace FDRA {

class ForNode
{
private:
  /* data */
  mlir::AffineForOp* ForOp;
  ForNode* ParentNode;
  llvm::SmallVector<ForNode*> ChildrenNodes;

public:
  ForNode(AffineForOp* For);

  mlir::AffineForOp* getForOp() {return ForOp;}

  void setChildren(llvm::SmallVector<ForNode*>& Children){ ChildrenNodes = Children;}
  llvm::SmallVector<ForNode*> getChildren() const {return ChildrenNodes;}

  void setParent(ForNode* Parent){ ParentNode = Parent;}
  ForNode* getParent() const {return ParentNode;}

  bool IsInnermost();
  bool HasParentFor(){ return ParentNode != nullptr;}
  bool IsThisLevelPerfect();
};

} // namespace fdra
} // namespace mlir



#endif //FDRA_CGRA_OPT_DSE_H