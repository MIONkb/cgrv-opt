//===- FDRAOps.cpp - Operations of the FDRA dialect -------------------------===//
//===----------------------------------------------------------------------===//
#include "mlir/Dialect/Affine/IR/AffineOps.h"
// #include "mlir/Dialect/Affine/IR/AffineValueMap.h"
#include "mlir/IR/BlockAndValueMapping.h"
#include "mlir/IR/Builders.h"
#include "mlir/IR/Matchers.h"
#include "mlir/IR/PatternMatch.h"
#include "mlir/IR/TypeUtilities.h"

#include "llvm/ADT/STLExtras.h"
#include "RAAA/Dialect/FDRA/IR/FDRA.h"

#include "RAAA/Dialect/FDRA/IR/FDRAOps.h.inc"


using namespace mlir;
using namespace mlir::FDRA;
using namespace mlir::func;

//===----------------------------------------------------------------------===//
// KernelOp
//===----------------------------------------------------------------------===//
void KernelOp::build(OpBuilder &builder, OperationState &result) {

  // Add the data operands.

  // This is a good area to add static operands.

  // Create a kernel body region with kNumConfigRegionAttributes + N arguments,
  // where the first kNumConfigRegionAttributes arguments have `index` type and
  // the rest have the same types as the data operands.
  Region *kernelRegion = result.addRegion();
  Block *body = new Block();
  for (unsigned i = 0; i < kNumConfigRegionAttributes; ++i)
    body->addArgument(builder.getIndexType(), result.location);
  kernelRegion->push_back(body);
}

void KernelOp::build(OpBuilder &builder, OperationState &result, std::string KernelName) {
  auto KernelNameAttr = builder.getStringAttr(KernelName);
  result.addAttribute(getKernelNameAttrStr(), KernelNameAttr);
  build(builder, result);
}

// void KernelOp::getCanonicalizationPatterns(RewritePatternSet &results,
//                                           MLIRContext *context) {
// }
LogicalResult KernelOp::verify() {
  //  Include this code if Kernel launch takes KNumConfigOperands leading
  //  operands for grid/block sizes and transforms them into
  //  kNumConfigRegionAttributes region arguments for block/thread identifiers
  //  and grid/block sizes.
  // if (!op.body().empty()) {
  //   if (op.body().getNumArguments() !=
  //       LaunchOp::kNumConfigOperands + op.getNumOperands())
  //     return op.emitOpError("unexpected number of region arguments");
  // }

  // Block terminators without successors are expected to exit the kernel region
  // and must be `soda.terminator`.
  /// To Fix
  for (Block &block : body()) {
    if (block.empty())
      continue;
    if (block.back().getNumSuccessors() != 0)
      continue;
    // if (!isa<soda::TerminatorOp>(&block.back())) {
    //   return block.back()
    //       .emitError()
    //       .append("expected '", soda::TerminatorOp::getOperationName(),
    //               "' or a terminator with successors")
    //       .attachNote(getLoc())
    //       .append("in '", LaunchOp::getOperationName(), "' body region");
    // }
  }
  
  Region& knRegion = body();
  /// A kernel should only contain 1 region
  /// and this region should only contain 1 block
  if(knRegion.getBlocks().size() != 1)
    return emitOpError(
        "Kernel Region should only get 1 Block.");
  Block& knBlock = knRegion.front();
  /// this kernel Block should only contain 2 Op(a forOp and a terminatorOp)
  /// To fix: maybe not a forOp
  if(knBlock.getOperations().size() != 2 )
    return emitOpError(
        "kernel Block should only get 2 Ops.");
  return success();
}

void KernelOp::print(OpAsmPrinter &printer) {
  printer << ' ';
  printer.printRegion(body(), /*printEntryBlockArgs=*/true,/*printBlockTerminators=*/true);
  printer.printOptionalAttrDict((*this)->getAttrs());
}

// Parses a Launch operation.
// operation ::= `gpu.launch` region attr-dict?
// ssa-reassignment ::= `(` ssa-id `=` ssa-use (`,` ssa-id `=` ssa-use)* `)`
ParseResult KernelOp::parse(OpAsmParser &parser, OperationState &result) {

  // Region arguments to be created.
  SmallVector<OpAsmParser::UnresolvedOperand, 16> regionArgs(
      KernelOp::kNumConfigRegionAttributes);
  MutableArrayRef<OpAsmParser::UnresolvedOperand> regionArgsRef(regionArgs);

  // Introduce the body region and parse it. The region has
  // kNumConfigRegionAttributes arguments that correspond to
  // block/thread identifiers and grid/block sizes, all of the `index` type.
  Type index = parser.getBuilder().getIndexType();
  SmallVector<Type, KernelOp::kNumConfigRegionAttributes> dataTypes(
      KernelOp::kNumConfigRegionAttributes, index);

  SmallVector<OpAsmParser::Argument> regionArguments;
  for (auto ssaValueAndType : llvm::zip(regionArgs, dataTypes)) {
    OpAsmParser::Argument arg;
    arg.ssaName = std::get<0>(ssaValueAndType);
    arg.type = std::get<1>(ssaValueAndType);
    regionArguments.push_back(arg);
  }

  Region *body = result.addRegion();
  if (parser.parseRegion(*body, regionArguments) ||
      parser.parseOptionalAttrDict(result.attributes)) {
    return failure();
  }
  return success();
}


//===----------------------------------------------------------------------===//
// DataBlockLoadOp
//===----------------------------------------------------------------------===//

void DataBlockLoadOp::build(OpBuilder &builder, OperationState &result,
                            Value OriginalMemref, AffineMap map, ValueRange mapOperands, 
                            MemRefType resultType, std::string KernelName) {
  assert(map.getNumInputs() == mapOperands.size() && "inconsistent index info");
  result.addOperands(OriginalMemref);
  result.addOperands(mapOperands);

  result.addAttribute(getMapAttrStr(), AffineMapAttr::get(map));

  auto KernelNameAttr = builder.getStringAttr(KernelName);
  result.addAttribute(getKernelNameAttrStr(), KernelNameAttr);

  result.types.push_back(resultType);
}

void DataBlockLoadOp::build(OpBuilder &builder, OperationState &result,
                            Value OriginalMemref, AffineMap map, ValueRange mapOperands, 
                            MemRefType resultType) {
  assert(map.getNumInputs() == mapOperands.size() && "inconsistent index info");
  std::string KernelName = ""/*"UnknownKernel"*/;
  build(builder, result, OriginalMemref, map, mapOperands, resultType, KernelName);
}

// static bool addKernelNameAttrInParse
//               (OperationState &result, Builder &builder, const std::string KernelName){
//   result.addAttribute(DataBlockLoadOp::getKernelNameAttrStr(), builder.getStringAttr(KernelName));
//   return true;
// }

ParseResult DataBlockLoadOp::parse(OpAsmParser &parser, OperationState &result) {
  /// example:
  /// %0 = FDRA.BlockLoad %arg1 [%arg9, 0] : memref<32x32xf32> -> memref<1x32xf32> {three_mm_32_kernel_0}
  auto &builder = parser.getBuilder();
  auto indexTy = builder.getIndexType();

  MemRefType memrefType, resultType;
  OpAsmParser::UnresolvedOperand memrefInfo;
  AffineMapAttr mapAttr;
  StringAttr KernelNameAttr;
  // std::string* KernelName = nullptr;
  SmallVector<OpAsmParser::UnresolvedOperand, 1> mapOperands;

  return failure(
      parser.parseOperand(memrefInfo) ||
      parser.parseAffineMapOfSSAIds(mapOperands, mapAttr,
                                    getMapAttrStr(),
                                    result.attributes) ||
      parser.parseColon() || parser.parseType(memrefType) ||
      parser.parseArrow() || parser.parseType(resultType) ||
      parser.resolveOperand(memrefInfo, memrefType, result.operands) ||
      parser.resolveOperands(mapOperands, indexTy, result.operands) ||
      parser.addTypeToList(resultType, result.types) ||
      parser.parseLBrace() || 
      parser.parseAttribute(KernelNameAttr, builder.getNoneType(), "KernelName", result.attributes)||
      // parser.parseOptionalAttrDict(result.attributes) ||
      // parser.parseOptionalKeywordOrString(KernelName) || 
      // addKernelNameAttrInParse(result, builder, *KernelName) ||
      parser.parseOptionalRBrace()
  );
}

void DataBlockLoadOp::print(OpAsmPrinter &p) {
  p << " " << getOriginalMemref() << " [";
  if (AffineMapAttr mapAttr =
          (*this)->getAttrOfType<AffineMapAttr>(getMapAttrStr()))
    p.printAffineMapOfSSAIds(mapAttr, getMapOperands());
  p << "]";
  p << " : " << getOriginalMemrefType() ;
  p << " -> " << getResultType() << " ";
  p << "{\""  << getKernelName() << "\"}";
  // p.printOptionalAttrDict((*this)->getAttrs(),
  //                         /*elidedAttrs=*/{getMapAttrStr()});
  
}

// Returns true if 'value' is a valid index to an affine operation (e.g.
// affine.load, affine.store, affine.dma_start, affine.dma_wait) where
// `region` provides the polyhedral symbol scope. Returns false otherwise.
static bool isValidAffineIndexOperand(Value value, Region *region) {
  return isValidDim(value, region) || isValidSymbol(value, region);
}

/// Verify common indexing invariants of affine.load, affine.store,
/// affine.vector_load and affine.vector_store.
static LogicalResult
verifyMemoryOpIndexing(Operation *op, AffineMapAttr mapAttr,
                       Operation::operand_range mapOperands,
                       MemRefType memrefType, unsigned numIndexOperands) {
  if (mapAttr) {
    AffineMap map = mapAttr.getValue();
    if (map.getNumResults() != memrefType.getRank())
      return op->emitOpError("affine map num results must equal memref rank");
    if (map.getNumInputs() != numIndexOperands)
      return op->emitOpError("expects as many subscripts as affine map inputs");
  } else {
    if (memrefType.getRank() != numIndexOperands)
      return op->emitOpError(
          "expects the number of subscripts to be equal to memref rank");
  }

  Region *scope = getAffineScope(op);
  for (auto idx : mapOperands) {
    if (!idx.getType().isIndex())
      return op->emitOpError("index to load must have 'index' type");
    if (!isValidAffineIndexOperand(idx, scope))
      return op->emitOpError("index must be a dimension or symbol identifier");
  }

  return success();
}

LogicalResult DataBlockLoadOp::verify() {
  MemRefType memrefType = getOriginalMemrefType();
  if (failed(verifyMemoryOpIndexing(
          getOperation(),
          (*this)->getAttrOfType<AffineMapAttr>(getMapAttrStr()),
          getMapOperands(), memrefType,
          /*numIndexOperands=*/getNumOperands() - 1)))
    return failure();

  if (getOriginalMemrefType().getElementType() != getResultType().getElementType())
    return emitOpError(
        "requires 2 memref types of the same elemental type");

  return success();
}

//===----------------------------------------------------------------------===//
// DataBlockStoreOp
//===----------------------------------------------------------------------===//

void DataBlockStoreOp::build(OpBuilder &builder, OperationState &result,
                            Value SourceMemref, Value TargetMemref, 
                            AffineMap map, ValueRange mapOperands, 
                            std::string KernelName) {
  assert(map.getNumInputs() == mapOperands.size() && "inconsistent index info");
  result.addOperands(SourceMemref);
  result.addOperands(TargetMemref);

  result.addOperands(mapOperands);
  result.addAttribute(getMapAttrStr(), AffineMapAttr::get(map));

  auto KernelNameAttr = builder.getStringAttr(KernelName);
  result.addAttribute(getKernelNameAttrStr(), KernelNameAttr);
}

void DataBlockStoreOp::build(OpBuilder &builder, OperationState &result,
                            Value SourceMemref, Value TargetMemref, 
                            AffineMap map, ValueRange mapOperands) {
  assert(map.getNumInputs() == mapOperands.size() && "inconsistent index info");
  std::string KernelName = ""/*"UnknownKernel"*/;
  build(builder, result, SourceMemref, TargetMemref, map, mapOperands, KernelName);
}

ParseResult DataBlockStoreOp::parse(OpAsmParser &parser, OperationState &result) {
  /// example: To fix
  /// %0 = FDRA.BlockLoad %arg1 [%arg9, 0] : memref<32x32xf32> -> memref<1x32xf32> {three_mm_32_kernel_0}
  auto &builder = parser.getBuilder();
  auto indexTy = builder.getIndexType();

  MemRefType sourceType, targetType;
  OpAsmParser::UnresolvedOperand sourceInfo;
  OpAsmParser::UnresolvedOperand targetInfo;
  AffineMapAttr mapAttr;
  StringAttr KernelNameAttr;
  SmallVector<OpAsmParser::UnresolvedOperand, 1> mapOperands;
  return failure(
      parser.parseOperand(sourceInfo) || parser.parseComma() ||
      parser.parseOperand(targetInfo) ||
      parser.parseAffineMapOfSSAIds(mapOperands, mapAttr,
                                    getMapAttrStr(),
                                    result.attributes) ||
      parser.parseOptionalAttrDict(result.attributes) ||
      parser.parseColon() || parser.parseType(sourceType) ||
      parser.parseArrow() || parser.parseType(targetType) ||
      parser.resolveOperand(sourceInfo, sourceType, result.operands) ||
      parser.resolveOperand(targetInfo, targetType, result.operands) ||
      parser.resolveOperands(mapOperands, indexTy, result.operands)  ||
      parser.parseLBrace() ||
      parser.parseAttribute(KernelNameAttr, "KernelName", result.attributes)||
      parser.parseOptionalRBrace()) ;
}


void DataBlockStoreOp::print(OpAsmPrinter &p) {
  p << " " << getSourceMemref() << ", ";
  p << " " << getTargetMemref() << " [";
  if (AffineMapAttr mapAttr =
          (*this)->getAttrOfType<AffineMapAttr>(getMapAttrStr()))
    p.printAffineMapOfSSAIds(mapAttr, getMapOperands());
  p << "]";
  p << " : " << getSourceMemrefType() ;
  p << " -> " << getTargetMemrefType() << " ";
  p << "{\""  << getKernelName() << "\"}";
  // p.printOptionalAttrDict((*this)->getAttrs(),
  //                         /*elidedAttrs=*/{getMapAttrStr()});
}


LogicalResult DataBlockStoreOp::verify() {
  MemRefType memrefType = getTargetMemrefType();
  if (failed(verifyMemoryOpIndexing(
          getOperation(),
          (*this)->getAttrOfType<AffineMapAttr>(getMapAttrStr()),
          getMapOperands(), memrefType,
          /*numIndexOperands=*/getNumOperands() - 2)))
    return failure();

  if (getTargetMemrefType().getElementType() != getSourceMemrefType().getElementType())
    return emitOpError(
        "requires source and target memref types of the same elemental type");

  return success();
}




// void AffineLoadOp::getCanonicalizationPatterns(RewritePatternSet &results,
//                                                MLIRContext *context) {
//   results.add<SimplifyAffineOp<AffineLoadOp>>(context);
// }
//===----------------------------------------------------------------------===//
// TableGen'd op method definitions
//===----------------------------------------------------------------------===//


//===----------------------------------------------------------------------===//
// KernelCallOp
//===----------------------------------------------------------------------===//

LogicalResult KernelCallOp::verifySymbolUses(SymbolTableCollection &symbolTable) {
  // Check that the callee attribute was specified.
  auto fnAttr = (*this)->getAttrOfType<FlatSymbolRefAttr>("callee");
  if (!fnAttr)
    return emitOpError("requires a 'callee' symbol reference attribute");
  FuncOp fn = symbolTable.lookupNearestSymbolFrom<FuncOp>(*this, fnAttr);
  if (!fn)
    return LogicalResult::success();

  // Verify that the operand and result types match the callee.
  auto fnType = fn.getFunctionType();
  if (fnType.getNumInputs() != getNumOperands())
    return emitOpError("incorrect number of operands for callee");

  for (unsigned i = 0, e = fnType.getNumInputs(); i != e; ++i)
    if (getOperand(i).getType() != fnType.getInput(i))
      return emitOpError("operand type mismatch: expected operand type ")
             << fnType.getInput(i) << ", but provided "
             << getOperand(i).getType() << " for operand number " << i;

  if (fnType.getNumResults() != getNumResults())
    return emitOpError("incorrect number of results for callee");

  for (unsigned i = 0, e = fnType.getNumResults(); i != e; ++i)
    if (getResult(i).getType() != fnType.getResult(i)) {
      auto diag = emitOpError("result type mismatch at index ") << i;
      diag.attachNote() << "      op result types: " << getResultTypes();
      diag.attachNote() << "function result types: " << fnType.getResults();
      return diag;
    }

  return success();
}

FunctionType KernelCallOp::getCalleeType() {
  return FunctionType::get(getContext(), getOperandTypes(), getResultTypes());
}


#define GET_OP_CLASSES
#include "RAAA/Dialect/FDRA/IR/FDRAOps.cpp.inc"
