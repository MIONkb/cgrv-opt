//===- Print.cpp - Simple print to terminal for `snn` dialect ops ---------===//
//===----------------------------------------------------------------------===//
//
// This file implements a print to terminal for `snn` dialect ops
//
//===----------------------------------------------------------------------===//

#include "mlir/Dialect/Arith/IR/Arith.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/IR/Builders.h"
#include "mlir/IR/SymbolTable.h"
#include "mlir/Support/LLVM.h"
#include <iostream>
#include "soda/Dialect/MyTest/IR/MyTest.h"
#include "PassDetail.h"
#include "soda/Dialect/MyTest/Transforms/Passes.h"

// For op transformation
#include "mlir/IR/Operation.h"
#include "mlir/Pass/Pass.h"
using namespace mlir;

namespace {
class GetMACPass : public GetMACBase<GetMACPass> {
  void runOnOperation() override {
    std::cout << "[test] HELLO! " << std::endl;
    mlir::Operation *oper = getOperation();
    mlir::Operation *mulop = 0;
    oper->walk([&](arith::MulFOp tempop) { // ADDF ::mlir::arith::Arith_Op
      mulop = tempop;
    });
    if (mulop) {
      oper->walk([&](arith::AddFOp addop) { // ADDF ::mlir::arith::Arith_Op
        mlir::Operation *Lop = addop.getLhs().getDefiningOp();
        mlir::Operation *Rop = addop.getRhs().getDefiningOp();
        llvm::outs()
            << "[test] addOp: " << addop << "\ngetLhs:"
            << *Lop
            // << "\nParent:" << MUl.getOperationName()
            // << " getLhs:"  << MUl.getLhs()<<", getRhs:" <<MUl.getRhs()
            << "\ngetRhs:" << *Rop << "\ngetResult:" << addop.getResult()
            << "\n";
        if (Lop->getName() == mulop->getName()) {
          llvm::outs() << "[test] Left match!\n";

          mytest::MulAccum ma;                          
          mlir::OpBuilder replacer(addop);
          ma = replacer.create<mytest::MulAccum, Type, Value, Value, Value>
          (addop.getLoc(), addop.getResult().getType(), 
            Rop->getOperand(0), Rop->getOperand(1), addop.getLhs());

          oper->walk([&](mlir::Operation* tempop) { // ADDF ::mlir::arith::Arith_Op
            unsigned OperandsNum = tempop->getNumOperands();
            for(unsigned OprCnt = 0; OprCnt < OperandsNum; OprCnt++){
              if(addop.getResult() == tempop->getOperand(OprCnt)){
                tempop->setOperand(OprCnt, ma.getResult());
              }
            }
          });
          
          addop.erase();  
          Lop->erase(); 
        } else if (Rop->getName() == mulop->getName()) {
          llvm::outs() << "[test] Right match!\n";

          mytest::MulAccum ma;                            
          mlir::OpBuilder replacer(addop);
          ma = replacer.create<mytest::MulAccum, Type, Value, Value, Value>
          (addop.getLoc(), addop.getResult().getType(), 
            Rop->getOperand(0), Rop->getOperand(1), addop.getLhs());
          
          oper->walk([&](mlir::Operation* tempop) { // ADDF ::mlir::arith::Arith_Op
            unsigned OperandsNum = tempop->getNumOperands();
            for(unsigned OprCnt = 0; OprCnt < OperandsNum; OprCnt++){
              if(addop.getResult() == tempop->getOperand(OprCnt)){
                tempop->setOperand(OprCnt, ma.getResult());
              }
            }
          });

          addop.erase();
          Rop->erase();   
        }
      });
    }
  }
};
} // namespace

std::unique_ptr<OperationPass<>> mlir::mytest::createGetMACPass() {
  return std::make_unique<GetMACPass>();
}
