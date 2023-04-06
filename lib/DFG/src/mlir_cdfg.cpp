
#include "../inc/mlir_cdfg.h"
//#include "cgra.h"

LLVMCDFGNode* LLVMCDFG::node(mlir::Operation *op)
{
    if(_opNodeMap.count(op)){
        return _opNodeMap[op];
    }
    return NULL;
}

LLVMCDFGNode* LLVMCDFG::node_lpidx(int level)
{
    if(_lpidxNodeMap.count(level)){
        return _lpidxNodeMap[level];
    }
    return NULL;
}

LLVMCDFGNode* LLVMCDFG::node_lparg(int level)
{
    if(_lpargNodeMap.count(level)){
        return _lpargNodeMap[level];
    }
    return NULL;
}

LLVMCDFGNode* LLVMCDFG::addNode(mlir::Operation *op)
{
    if(_opNodeMap.count(op)){
        return _opNodeMap[op];
    }
    // create new node
    errs() <<"[ADDNodes!] StringRef:" << op->getName().getStringRef();
      
    std::string TypeName = _OpNameCovertMap[op->getName().getStringRef().str()];
    LLVMCDFGNode *node = new LLVMCDFGNode(op, TypeName, this);
    int id = 0;
    if(!_nodes.empty()){
        id = _nodes.rbegin()->first + 1;
    }
    node->setId(id);
    // node->setBB(ins->getParent());
    _nodes[id] = node;
    _opNodeMap[op] = node;

    node->operation()->dump();    
    return node;
}

LLVMCDFGNode* LLVMCDFG::addNode(mlir::Block* block, int level)
{
    // if( ){
    //     return _opNodeMap[op];
    // }
    assert(!_lpidxNodeMap.count(level) && "Loop index of this level already exists!");
    // create new node

    /// A scf.for contains a loop index arg, and an iteration arg occationally.
    LLVMCDFGNode *lpidx_node = new LLVMCDFGNode(block, level, "Loop index", this);
    int id = 0;
    if(!_nodes.empty()){
        id = _nodes.rbegin()->first + 1;
    }
    lpidx_node->setId(id);
    _nodes[id] = lpidx_node;
    _lpidxNodeMap[level] = lpidx_node;
    errs() <<"[ADDNodes!] for loop index:" << level <<" \n"; 
    
    /// iteration arg occationally.
    if(block->getNumArguments() == 2){
        LLVMCDFGNode *lparg_node = new LLVMCDFGNode(block, level, "Loop arg", this);
        id++;
        lparg_node->setId(id);
        _nodes[id] = lparg_node;
        _lpargNodeMap[level] = lparg_node;
        errs() <<"[ADDNodes!] for loop arg:" << level <<" \n"; 
    }   
    /// did not return the lparg_node 
    return lpidx_node;
}



LLVMCDFGEdge* LLVMCDFG::addEdge(LLVMCDFGNode *src, LLVMCDFGNode *dst)
{
  int eid = 0;
  if(!_edges.empty()){
    eid = _edges.rbegin()->first + 1;
  }
    
  LLVMCDFGEdge *edge = new LLVMCDFGEdge(eid, EDGE_TYPE_DATA, src, dst);
  _edges[eid] = edge;
  src->addOutputEdge(eid);
  dst->addInputEdge(eid);
  return edge;
}

LLVMCDFG::LLVMCDFG(llvm::StringRef name, std::string OpNameFile): _name(name){
  /// Read in op name file to convert arith/memref/scf dialect to low-level hardware op
  std::ifstream infile(OpNameFile);
  if (!infile.is_open()) {
    std::cerr << "No OpName File!!\n";
    return;
  }
  
  std::string line;

  while (std::getline(infile, line)) {
    // skip annotation and blank
    if (line.empty() || line.front() == '/' || line.front() == '#' ) {
      continue;
    }

    // store to 
    std::istringstream iss(line);
    std::string key, value;
    iss >> key >> value;
    _OpNameCovertMap[key] = value;
  }
//   for(auto itr = _OpNameCovertMap.begin(); itr != _OpNameCovertMap.end(); itr++){
//     errs() << (*itr).first <<": " << (*itr).second << " \n";
//   }

//   infile.close();
}

void LLVMCDFG::CDFGtoDOT(std::string fileName) {
	std::ofstream ofs;
	ofs.open(fileName.c_str());
    ofs << "Digraph G {\n";
    std::string colors[4] = {"black", "purple", "blue", "yellow"};
    // nodes
	assert(_nodes.size() != 0);
    for(auto &elem : _nodes){
        int node_id = elem.first;
        LLVMCDFGNode* node = elem.second;
        std::string TypeName = node->getTypeName();
        mlir::Operation* op = node->operation();
        ofs << node_id << "[label = \"" << node_id << TypeName;
        //add address name of LSU
        // if(ins != NULL){
        //     if(dyn_cast<LoadInst>(ins) || dyn_cast<StoreInst>(ins))
        //     ofs << ", ArrayName=" << node->getLSArrayName();
        //     //errs() << "sueecss land\n";
        // }
        // if(node->isLSaffine()){
        //     ofs << ", Stride=[ ";
        //     auto stride = node->getLSstride();
        //     for(int i = 0; i < stride.size(); i++){
        //         ofs << i<< ", " << stride[i] <<"; ";
        //     }
        //     ofs << "], Bounds=[ ";
        //     auto LSbounds = node->getLSbounds();
        //     for(int dim = 0; dim < LSbounds.size(); dim++){
        //         ofs << "(" << LSbounds[dim][0]<<", "<<LSbounds[dim][1]<<")*"<<LSbounds[dim][2]<<"; ";
        //     }
        //     ofs << "]";
        // }
        // if(node->hasConst()){
        //     ofs << ", Const=" << node->constVal();
        // }
        ofs << "\", shape = box,";
        ofs << " color = " << colors[node->getLoopLevel() % 4] << "];\n";
    }
	// edges
    std::map<std::pair<LLVMCDFGNode*, LLVMCDFGNode*>, int> edgestack;    
    for(auto &elem : _edges){
        auto edge = elem.second;
        auto srcName = edge->src()->getName();
        auto dstName = edge->dst()->getName();
        ofs << srcName << " -> " << dstName;
        auto type = edge->type();
        if(type == EDGE_TYPE_CTRL){
            ofs << "[color = red";
        }else if(type == EDGE_TYPE_MEM){
            ofs << "[color = blue";
        }else{
            ofs << "[color = black";
        }
        bool isBackEdge = edge->src()->isOutputBackEdge(edge->dst());
        if(isBackEdge){
            ofs << ", style = dashed";
        }else{
            ofs << ", style = bold";
        }
        int opIdx = edge->dst()->getInputIdx(edge->src());
        auto pair = std::make_pair(edge->src(), edge->dst());
        if(edgestack.count(pair)){
            opIdx = 1 - edgestack[pair];
        }else{
            edgestack[pair] = opIdx;
        }
        ofs << ", label = \"Op=" << opIdx;
        if(type == EDGE_TYPE_MEM){
            ofs << ", DepDist = " << edge->dst()->getSrcDep(edge->src()).distance;
        }
        ofs << "\"];\n";
    }
	ofs << "}\n";
	ofs.close();
}