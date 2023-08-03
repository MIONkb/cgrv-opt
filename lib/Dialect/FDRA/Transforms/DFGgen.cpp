//===----------------------------------------------------------------------===//
//
// This file implements a print to terminal for `snn` dialect ops
//
//===----------------------------------------------------------------------===//

#include "mlir/Dialect/Arith/IR/Arith.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Dialect/SCF/IR/SCF.h"
#include "mlir/IR/Builders.h"
#include "mlir/IR/SymbolTable.h"
#include "mlir/IR/OperationSupport.h"
#include "mlir/Support/LLVM.h"
#include <iostream>
#include "RAAA/Dialect/FDRA/IR/FDRA.h"
#include "PassDetail.h"
#include "RAAA/Dialect/FDRA/Transforms/Passes.h"

// For Block handle 
// #include "mlir/IR/BlockAndValueMapping.h"
#include "mlir/IR/MLIRContext.h"
#include "mlir/IR/Verifier.h"

// For op transformation
#include "mlir/IR/Operation.h"
#include "mlir/Pass/Pass.h"

// DFG
#include "../../../DFG/inc/mlir_cdfg.h"

using namespace mlir;

namespace
{
  class FDRALoopCdfgGenPass : public FDRALoopCdfgGenBase<FDRALoopCdfgGenPass>
  {
    void runOnOperation() override;
  };
} // namespace

void FDRALoopCdfgGenPass::runOnOperation()
{
  std::map<scf::ForOp, int> For_loop_level;
  std::map<mlir::Block*, int> loop_block_level;
  mlir::Operation *oper = getOperation();
  // std::cout << "[test] HELLO! " ; oper->dump() ;
  // Get loop level from scf ForOP
  int level = 0, level_total;
  oper->walk([&](scf::ForOp forop)
  {
    // mlir::Region for_region = tempop->getRegion();
    // std::cout << "----------------------"  <<std::endl;
    // forop->dump();
    int Innermost = 1;
    forop->walk([&](scf::ForOp temp_forop)
    { 
      if(For_loop_level.count(temp_forop) == 0 && temp_forop != forop){ // Don't count the scf::For itself
        Innermost = 0;
      // std::cout << "Not innermost"  <<std::endl;    
      } 
    });
    if (Innermost)
    {
      For_loop_level[forop] = level;
      level++;
    }
    // for_region.viewGraph();
  });
  level_total = level;
  scf::ForOp scf_for;
  LLVMCDFG *CDFG = new LLVMCDFG("gemm", GeneralOpNameFile);
  for (level = 0; level < level_total; level++)
  {
    /// Find the scf_for body in current level
    for (auto op : For_loop_level)
    {
      if (op.second == level)
        scf_for = op.first;
    }
    errs() << "level:" << level << "\n";
    scf_for.dump();
    

    /*** Add Nodes ***/
    mlir::Region *for_region = &scf_for.getLoopBody();
    /// index and iter_args in scf_for
    int block_cnt = 0;
    for (auto itr=for_region->begin(); itr!=for_region->end(); itr++, block_cnt++)
    {
      mlir::Block* for_block = &(*itr);
      errs() << "Block:" << for_block <<"\n";
      loop_block_level[for_block] = level;
      CDFG->addNode(for_block, level); 
    }
    assert(block_cnt == 1 && "Region in scf.for should only contain 1 block !");

    for_region->walk([&](mlir::Operation *op)
    { 
      // errs() << "Node:"; op->dump();
      LLVMCDFGNode* node = CDFG->addNode(op); 
      node->setLoopLevel(level);
      if(op->getName().getStringRef() == "scf.for"){
        node->setisSCFForOp(true);
      }
    });
  }

  /*** Add Edges ***/
  for (auto nodepair : CDFG->nodes())
  {
    // int id = nodepair.first;
    LLVMCDFGNode *SuccNode = nodepair.second;

    /// Skip Loop index and arg node because it don't get operands 
    if(SuccNode->getTypeName() == "Loop index" 
            || SuccNode->getTypeName() == "Loop arg")
    { 
      errs() << nodepair.first << ".Node:" << SuccNode->getTypeName() <<"\n";
      continue;
    }

    mlir::Operation *op = SuccNode->operation();
    errs() << nodepair.first << ".Node:";
    op->dump();
    for (unsigned operand_idx = 0; operand_idx < op->getNumOperands(); operand_idx++)
    {
      LLVMCDFGNode *AnceNode = NULL;
      bool isBackEdge = false;
      mlir::Value _v = op->getOperand(operand_idx);
      if (_v.isa<BlockArgument>()) {
        /// Operands is a loop index or loop arg
        mlir::BlockArgument arg = _v.cast<BlockArgument>();
        mlir::Block * owner = arg.getOwner();
        int blk_level = loop_block_level[owner];
        switch (arg.getArgNumber())
        {
        case 0: /// loop index
          AnceNode = CDFG->node_lpidx(blk_level);
          errs() << "   Loop index,level:" << blk_level << ", " <<_v << ", owner:" << owner <<"\n";
          break;
        case 1: /// loop iteration args
          AnceNode = CDFG->node_lparg(blk_level);
          errs() << "   Loop arg,level:" << blk_level << ", " <<_v << ", owner:" << owner <<"\n";
          break;
        default:
          assert( 0 && "The node of BlockArgument has not been stored into DFG !");
          break;
        }
      }
      else{
        mlir::Operation *ance_op = op->getOperand(operand_idx).getDefiningOp();
        errs() << "   Operands Node:";ance_op->dump();
        AnceNode = CDFG->node(ance_op);
        if(AnceNode == NULL){ /// AnceNode is outside loop
          if(ance_op->getName().getStringRef() == "arith.constant"){
            AnceNode = CDFG->addNode(ance_op);
          }
          else if(ance_op->getName().getStringRef() == "memref.get_global"){
            /// Tofix
            // AnceNode = CDFG->addNode(ance_op);
            continue;
          }
        }
      }
      AnceNode->addOutputNode(SuccNode, isBackEdge);
      SuccNode->addInputNode(AnceNode, operand_idx, isBackEdge);
      CDFG->addEdge(AnceNode, SuccNode); //To fix: Edge Type
    }
  }

  CDFG->CDFGtoDOT("0_"+CDFG->name_str()+"_CDFG.dot");
}

std::unique_ptr<OperationPass<>> mlir::FDRA::createFDRALoopCdfgGenPass()
{
  return std::make_unique<FDRALoopCdfgGenPass>();
}
