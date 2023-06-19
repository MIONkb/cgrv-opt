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
  mlir::AffineForOp ForOp;
  ForNode* ParentNode = nullptr;
  llvm::SmallVector<ForNode*> ChildrenNodes;
  unsigned Level;

public:
  /*** Type define ***/
  using FactorList = SmallVector<unsigned>;

  /* tiling factor */
  FactorList TilingFactors;
  /* unroll factor */
  FactorList UnrollFactors;

  /// builder function for class FDRA::ForNode
  ForNode(AffineForOp For): ForOp(For){};
  ForNode(AffineForOp For, unsigned level): ForOp(For), Level(level){};
  // ~ForNode();

  mlir::AffineForOp& getForOp() {return ForOp;}

  void setChildren(llvm::SmallVector<ForNode*>& Children){ ChildrenNodes = Children;}
  llvm::SmallVector<ForNode*> getChildren() const {return ChildrenNodes;}

  void setParent(ForNode* Parent){ ParentNode = Parent;}
  ForNode* getParent() const {return ParentNode;}

  void setLevel(const unsigned l){ Level = l;}
  unsigned getLevel() const {return Level;}

  bool IsInnermost();
  bool HasParentFor(){ return ParentNode != nullptr;}
  bool IsThisLevelPerfect();

  //////////////
  /// dump functions 
  //////////////
  void dumpNode(){
    for(unsigned cnt = 0; cnt < Level; cnt++)
      llvm::errs() << " ";     
    llvm::errs() << Level << ":";
    if(!HasParentFor())
      llvm::errs() << " outermost";
    else{
      if(IsThisLevelPerfect())
        llvm::errs() << " perfect";
      else 
        llvm::errs() << " imperfect";
    }
    
    if(IsInnermost())
      llvm::errs() <<", innermost";
    
    if(UnrollFactors.size()!=0){
      llvm::errs() <<", unroll factor: ";
      for(auto ft : UnrollFactors)
        llvm::errs() << ft << " ";
    }

    llvm::errs() << "\n";
  }
  void dumpForOp(){
    this->getForOp().dump();
  }
  void dumpTree(){
    // dumpForOp();
    for(ForNode* Child : ChildrenNodes){
      Child->dumpTree();
    }

    dumpNode();
  }

};

} // namespace fdra
} // namespace mlir



#endif //FDRA_CGRA_OPT_DSE_H