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
using namespace mlir::affine;
using namespace llvm;

namespace mlir {
namespace FDRA {

class ForNode
{
private:
  /* data */
  mlir::affine::AffineForOp ForOp;
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

  mlir::affine::AffineForOp& getForOp() {return ForOp;}

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


// class ADG : public Graph
// {
// private:
//     int _numGpeNodes;
//     int _numIobNodes;
//     // int _cfgDataWidth;
//     // int _cfgAddrWidth;
//     // int _cfgBlkOffset;
//     // int _cfgSpadDataWidth; // data width of the config spad
//     // int _loadLatency;
//     // int _storeLatency;
//     // int _cfgSpadSize; // size of scratchpad for config
//     // int _iobAgNestLevels; // AG nested levels in IOB
//     int _iobSpadBankSize; // size of each scratchpad bank for IOB
//     // std::map<int, std::vector<int>> _iobToSpadBanks; // the scratchpad banks connected to each IOB, <iob-index, <banks>>
//     // std::vector<uint64_t> _cfgBits;

//     // std::map<int, ADGNode*> _nodes;   // <node-id, node>
//     // std::map<int, ADGEdge*> _edges;   // <edge-id, edge>

//     ADG(const ADG&) = delete; // disable the default copy construct function

// public:
//     ADG();
//     ~ADG();
//     int numGpeNodes(){ return _numGpeNodes; }
//     void setNumGpeNodes(int numGpeNodes){ _numGpeNodes = numGpeNodes; }
//     int numIobNodes(){ return _numIobNodes; }
//     void setNumIobNodes(int numIobNodes){ _numIobNodes = numIobNodes; }
//     // int cfgDataWidth(){ return _cfgDataWidth; }
//     // void setCfgDataWidth(int cfgDataWidth){ _cfgDataWidth = cfgDataWidth; }
//     // int cfgAddrWidth(){ return _cfgAddrWidth; }
//     // void setCfgAddrWidth(int cfgAddrWidth){ _cfgAddrWidth = cfgAddrWidth; }
//     // int cfgBlkOffset(){ return _cfgBlkOffset; }
//     // void setCfgBlkOffset(int cfgBlkOffset){ _cfgBlkOffset = cfgBlkOffset; }
//     // int cfgSpadDataWidth(){ return _cfgSpadDataWidth; }
//     // void setCfgSpadDataWidth(int cfgSpadDataWidth){ _cfgSpadDataWidth = cfgSpadDataWidth; }
//     // int loadLatency(){ return _loadLatency; }
//     // void setLoadLatency(int lat){ _loadLatency = lat; }
//     // int storeLatency(){ return _storeLatency; }
//     // void setStoreLatency(int lat){ _storeLatency = lat; }
//     // int iobAgNestLevels(){ return _iobAgNestLevels; }
//     // void setIobAgNestLevels(int levels){ _iobAgNestLevels = levels; }
//     // int cfgSpadSize(){ return _cfgSpadSize; }
//     // void setCfgSpadSize(int size){ _cfgSpadSize = size; }
//     int iobSpadBankSize(){ return _iobSpadBankSize; }
//     void setIobSpadBankSize(int size){ _iobSpadBankSize = size; }
//     // const std::map<int, std::vector<int>>& iobToSpadBanks(){ return _iobToSpadBanks; }
//     // const std::vector<int>& iobToSpadBanks(int iobId){ return _iobToSpadBanks[iobId]; }
//     // void setIobToSpadBanks(int iobId, std::vector<int> banks){ _iobToSpadBanks[iobId] = banks; }

//     // const std::map<int, ADGNode*>& nodes(){ return _nodes; }
//     // const std::map<int, ADGEdge*>& edges(){ return _edges; }
//     // ADGNode* node(int id);
//     // ADGEdge* edge(int id);
//     // void addNode(int id, ADGNode* node);
//     // void addEdge(int id, ADGEdge* edge);
//     // void delNode(int id);
//     // void delEdge(int id);

//     // ADG& operator=(const ADG& that);

//     // void print();
    
// };


} // namespace fdra
} // namespace mlir



#endif //FDRA_CGRA_OPT_DSE_H