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

  return success();
}

void KernelOp::print(OpAsmPrinter &printer) {
  printer << ' ';
  printer.printRegion(body(), /*printEntryBlockArgs=*/false);
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
                         Value memref, AffineMap map,  ValueRange mapOperands) {
  assert(map.getNumInputs() == mapOperands.size() && "inconsistent index info");
  result.addOperands(memref);
  result.addOperands(mapOperands);
  auto memrefType = memref.getType().cast<MemRefType>();
  result.addAttribute(getMapAttrStr(), AffineMapAttr::get(map));
  result.types.push_back(memrefType.getElementType());
}

void DataBlockLoadOp::build(OpBuilder &builder, OperationState &result,
                         Value memref, ValueRange indices) {
  auto memrefType = memref.getType().cast<MemRefType>();
  // result.addOperands(memref);
  int64_t rank = memrefType.getRank();
  // Create identity map for memrefs with at least one dimension or () -> ()
  // for zero-dimensional memrefs.
  auto map =
      rank ? builder.getMultiDimIdentityMap(rank) : builder.getEmptyAffineMap();
  build(builder, result, memref, map, indices);
}

void DataBlockLoadOp::build(OpBuilder &builder, OperationState &result,
                         AffineMap map, ValueRange operands) {
  assert(operands.size() == 1 + map.getNumInputs() && "inconsistent operands");
  // result.addOperands(operands);
  if (map)
    result.addAttribute(getMapAttrStr(), AffineMapAttr::get(map));
  auto memrefType = operands[0].getType().cast<MemRefType>();
  result.types.push_back(memrefType.getElementType());
}

ParseResult DataBlockLoadOp::parse(OpAsmParser &parser, OperationState &result) {
  auto &builder = parser.getBuilder();
  auto indexTy = builder.getIndexType();

  MemRefType type;
  OpAsmParser::UnresolvedOperand memrefInfo;
  AffineMapAttr mapAttr;
  SmallVector<OpAsmParser::UnresolvedOperand, 1> mapOperands;
  return failure(
      parser.parseOperand(memrefInfo) ||
      parser.parseAffineMapOfSSAIds(mapOperands, mapAttr,
                                    AffineLoadOp::getMapAttrStrName(),
                                    result.attributes) ||
      parser.parseOptionalAttrDict(result.attributes) ||
      parser.parseColonType(type) ||
      parser.resolveOperand(memrefInfo, type, result.operands) ||
      parser.resolveOperands(mapOperands, indexTy, result.operands) ||
      parser.addTypeToList(type.getElementType(), result.types));
}


void DataBlockLoadOp::print(OpAsmPrinter &p) {
  p << " " << getOriginalArray() << '[';
  if (AffineMapAttr mapAttr =
          (*this)->getAttrOfType<AffineMapAttr>(getMapAttrStr()))
    p.printAffineMapOfSSAIds(mapAttr, getOperands());
  p << ']';
  p.printOptionalAttrDict((*this)->getAttrs(),
                          /*elidedAttrs=*/{getMapAttrStr()});
  p << " : " << getOriginalArray().getType().cast<MemRefType>();
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
  /// Tofix: fix verify()
  auto memrefType = getOriginalArray().getType().cast<MemRefType>();
  if (getType() != memrefType.getElementType())
    return emitOpError("result type must match element type of memref");

  if (failed(verifyMemoryOpIndexing(
          getOperation(),
          (*this)->getAttrOfType<AffineMapAttr>(getMapAttrStr()),
          getOperands(), memrefType,
          /*numIndexOperands=*/getNumOperands() - 1)))
    return failure();

  return success();
}
// void AffineLoadOp::getCanonicalizationPatterns(RewritePatternSet &results,
//                                                MLIRContext *context) {
//   results.add<SimplifyAffineOp<AffineLoadOp>>(context);
// }
//===----------------------------------------------------------------------===//
// TableGen'd op method definitions
//===----------------------------------------------------------------------===//

#define GET_OP_CLASSES
#include "RAAA/Dialect/FDRA/IR/FDRAOps.cpp.inc"
