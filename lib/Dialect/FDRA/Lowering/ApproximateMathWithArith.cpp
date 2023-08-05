//===- FuncToLLVM.cpp - Func to LLVM dialect conversion -------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file implements a pass to convert MLIR Func and builtin dialects
// into the LLVM IR dialect.
//
//===----------------------------------------------------------------------===//


#include "mlir/Analysis/DataLayoutAnalysis.h"
#include "mlir/Conversion/LLVMCommon/ConversionTarget.h"
#include "mlir/Conversion/LLVMCommon/Pattern.h"
#include "mlir/Conversion/LLVMCommon/VectorPattern.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Dialect/LLVMIR/FunctionCallUtils.h"
#include "mlir/Dialect/LLVMIR/LLVMDialect.h"
#include "mlir/Dialect/Utils/StaticValueUtils.h"
#include "mlir/IR/Attributes.h"
// #include "mlir/IR/BlockAndValueMapping.h"
#include "mlir/IR/Builders.h"
#include "mlir/IR/BuiltinOps.h"
#include "mlir/IR/PatternMatch.h"
#include "mlir/IR/TypeUtilities.h"
#include "mlir/Support/LogicalResult.h"
#include "mlir/Support/MathExtras.h"
#include "mlir/Support/LLVM.h"
#include "mlir/Transforms/DialectConversion.h"
#include "mlir/Transforms/Passes.h"
#include "llvm/ADT/TypeSwitch.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Type.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/FormatVariadic.h"

#include <iostream>
#include <algorithm>
#include <functional>

#include "./LowerPassDetail.h"
#include "RAAA/Dialect/FDRA/Lowering/LowerPasses.h"
#include "RAAA/Dialect/FDRA/IR/FDRA.h"


// using namespace llvm; // for llvm.errs()
using namespace mlir;
using namespace mlir::FDRA;
// using Value = mlir::Value;

#define PASS_NAME "fdra-approximate-math"



// struct FDRAFuncOpConversionBase : public ConvertOpToLLVMPattern<func::FuncOp> {
// protected:
//   using ConvertOpToLLVMPattern<func::FuncOp>::ConvertOpToLLVMPattern;

//   // Convert input FuncOp to LLVMFuncOp by using the LLVMTypeConverter provided
//   // to this legalization pattern.
//   LLVM::LLVMFuncOp
//   convertFuncOpToLLVMFuncOp(func::FuncOp funcOp,
//                             ConversionPatternRewriter &rewriter) const {
//     // Convert the original function arguments. They are converted using the
//     // LLVMTypeConverter provided to this legalization pattern.
//     auto varargsAttr = funcOp->getAttrOfType<BoolAttr>("func.varargs");
//     TypeConverter::SignatureConversion result(funcOp.getNumArguments());
//     auto llvmType = getTypeConverter()->convertFunctionSignature(
//         funcOp.getFunctionType(), varargsAttr && varargsAttr.getValue(),
//         shouldUseBarePtrCallConv(funcOp, getTypeConverter()), result);
//     if (!llvmType)
//       return nullptr;

//     // Propagate argument/result attributes to all converted arguments/result
//     // obtained after converting a given original argument/result.
//     SmallVector<NamedAttribute, 4> attributes;
//     filterFuncAttributes(funcOp, /*filterArgAndResAttrs=*/true, attributes);
//     if (ArrayAttr resAttrDicts = funcOp.getAllResultAttrs()) {
//       assert(!resAttrDicts.empty() && "expected array to be non-empty");
//       auto newResAttrDicts =
//           (funcOp.getNumResults() == 1)
//               ? resAttrDicts
//               : rewriter.getArrayAttr(rewriter.getDictionaryAttr({}));
//       attributes.push_back(
//           rewriter.getNamedAttr(funcOp.getResAttrsAttrName(), newResAttrDicts));
//     }
//     if (ArrayAttr argAttrDicts = funcOp.getAllArgAttrs()) {
//       SmallVector<Attribute, 4> newArgAttrs(
//           cast<LLVM::LLVMFunctionType>(llvmType).getNumParams());
//       for (unsigned i = 0, e = funcOp.getNumArguments(); i < e; ++i) {
//         // Some LLVM IR attribute have a type attached to them. During FuncOp ->
//         // LLVMFuncOp conversion these types may have changed. Account for that
//         // change by converting attributes' types as well.
//         SmallVector<NamedAttribute, 4> convertedAttrs;
//         auto attrsDict = cast<DictionaryAttr>(argAttrDicts[i]);
//         convertedAttrs.reserve(attrsDict.size());
//         for (const NamedAttribute &attr : attrsDict) {
//           const auto convert = [&](const NamedAttribute &attr) {
//             return TypeAttr::get(getTypeConverter()->convertType(
//                 cast<TypeAttr>(attr.getValue()).getValue()));
//           };
//           if (attr.getName().getValue() ==
//               LLVM::LLVMDialect::getByValAttrName()) {
//             convertedAttrs.push_back(rewriter.getNamedAttr(
//                 LLVM::LLVMDialect::getByValAttrName(), convert(attr)));
//           } else if (attr.getName().getValue() ==
//                      LLVM::LLVMDialect::getByRefAttrName()) {
//             convertedAttrs.push_back(rewriter.getNamedAttr(
//                 LLVM::LLVMDialect::getByRefAttrName(), convert(attr)));
//           } else if (attr.getName().getValue() ==
//                      LLVM::LLVMDialect::getStructRetAttrName()) {
//             convertedAttrs.push_back(rewriter.getNamedAttr(
//                 LLVM::LLVMDialect::getStructRetAttrName(), convert(attr)));
//           } else if (attr.getName().getValue() ==
//                      LLVM::LLVMDialect::getInAllocaAttrName()) {
//             convertedAttrs.push_back(rewriter.getNamedAttr(
//                 LLVM::LLVMDialect::getInAllocaAttrName(), convert(attr)));
//           } else {
//             convertedAttrs.push_back(attr);
//           }
//         }
//         auto mapping = result.getInputMapping(i);
//         assert(mapping && "unexpected deletion of function argument");
//         // Only attach the new argument attributes if there is a one-to-one
//         // mapping from old to new types. Otherwise, attributes might be
//         // attached to types that they do not support.
//         if (mapping->size == 1) {
//           newArgAttrs[mapping->inputNo] =
//               DictionaryAttr::get(rewriter.getContext(), convertedAttrs);
//           continue;
//         }
//         // TODO: Implement custom handling for types that expand to multiple
//         // function arguments.
//         for (size_t j = 0; j < mapping->size; ++j)
//           newArgAttrs[mapping->inputNo + j] =
//               DictionaryAttr::get(rewriter.getContext(), {});
//       }
//       attributes.push_back(rewriter.getNamedAttr(
//           funcOp.getArgAttrsAttrName(), rewriter.getArrayAttr(newArgAttrs)));
//     }

//     // Create an LLVM function, use external linkage by default until MLIR
//     // functions have linkage.
//     LLVM::Linkage linkage = LLVM::Linkage::External;
//     if (funcOp->hasAttr(linkageAttrName)) {
//       auto attr =
//           dyn_cast<mlir::LLVM::LinkageAttr>(funcOp->getAttr(linkageAttrName));
//       if (!attr) {
//         funcOp->emitError() << "Contains " << linkageAttrName
//                             << " attribute not of type LLVM::LinkageAttr";
//         return nullptr;
//       }
//       linkage = attr.getLinkage();
//     }

//     // Create a memory effect attribute corresponding to readnone.
//     StringRef readnoneAttrName = LLVM::LLVMDialect::getReadnoneAttrName();
//     LLVM::MemoryEffectsAttr memoryAttr = {};
//     if (funcOp->hasAttr(readnoneAttrName)) {
//       auto attr = funcOp->getAttrOfType<UnitAttr>(readnoneAttrName);
//       if (!attr) {
//         funcOp->emitError() << "Contains " << readnoneAttrName
//                             << " attribute not of type UnitAttr";
//         return nullptr;
//       }
//       memoryAttr = LLVM::MemoryEffectsAttr::get(rewriter.getContext(),
//                                                 {LLVM::ModRefInfo::NoModRef,
//                                                  LLVM::ModRefInfo::NoModRef,
//                                                  LLVM::ModRefInfo::NoModRef});
//     }
//     auto newFuncOp = rewriter.create<LLVM::LLVMFuncOp>(
//         funcOp.getLoc(), funcOp.getName(), llvmType, linkage,
//         /*dsoLocal=*/false, /*cconv=*/LLVM::CConv::C, /*comdat=*/nullptr,
//         attributes);
//     // If the memory attribute was created, add it to the function.
//     if (memoryAttr)
//       newFuncOp.setMemoryAttr(memoryAttr);
//     rewriter.inlineRegionBefore(funcOp.getBody(), newFuncOp.getBody(),
//                                 newFuncOp.end());
//     if (failed(rewriter.convertRegionTypes(&newFuncOp.getBody(), *typeConverter,
//                                            &result)))
//       return nullptr;

//     return newFuncOp;
//   }
// };

/// FuncOp legalization pattern that converts MemRef arguments to bare pointers
/// to the MemRef element type. This will impact the calling convention and ABI.
// struct KernelFuncOpConversion : public FDRAFuncOpConversionBase {
//   using FDRAFuncOpConversionBase::FDRAFuncOpConversionBase;
//   SmallVector<::llvm::StringRef, 8> KernelNameVec;

//   LogicalResult
//   matchAndRewrite(func::FuncOp funcOp, OpAdaptor adaptor,
//                   ConversionPatternRewriter &rewriter) const override {
  
//     // TODO: bare ptr conversion could be handled by argument materialization
//     // and most of the code below would go away. But to do this, we would need a
//     // way to distinguish between FuncOp and other regions in the
//     // addArgumentMaterialization hook.

//         // ::llvm::StringRef NameToFind = funcop.getSymName();
//     //   // llvm::errs() <<"\nfuncop :" << NameToFind;
//     //   auto it = std::find(KernelNameVec.begin(), KernelNameVec.end(), NameToFind);
//     //   if (it != KernelNameVec.end()) { // FuncOp is a kernel
//     //     llvm::errs() << "[debug] found a kernel func:\n";
//     //     funcop.dump();
//     //   } 
  

//     // llvm::errs() << "[debug] found a kernel func:\n";
//     // funcOp.dump();

//     // Store the type of memref-typed arguments before the conversion so that we
//     // can promote them to MemRef descriptor at the beginning of the function.
//     SmallVector<Type, 8> oldArgTypes =
//         llvm::to_vector<8>(funcOp.getFunctionType().getInputs());

//     auto newFuncOp = convertFuncOpToLLVMFuncOp(funcOp, rewriter);
//     if (!newFuncOp)
//       return failure();
//     if (newFuncOp.getBody().empty()) {
//       rewriter.eraseOp(funcOp);
//       return success();
//     }

//     // Promote bare pointers from memref arguments to memref descriptors at the
//     // beginning of the function so that all the memrefs in the function have a
//     // uniform representation.
//     Block *entryBlock = &newFuncOp.getBody().front();
//     auto blockArgs = entryBlock->getArguments();
//     assert(blockArgs.size() == oldArgTypes.size() &&
//            "The number of arguments and types doesn't match");

//     OpBuilder::InsertionGuard guard(rewriter);
//     rewriter.setInsertionPointToStart(entryBlock);
//     for (auto it : llvm::zip(blockArgs, oldArgTypes)) {
//       BlockArgument arg = std::get<0>(it);
//       Type argTy = std::get<1>(it);

//       // Unranked memrefs are not supported in the bare pointer calling
//       // convention. We should have bailed out before in the presence of
//       // unranked memrefs.
//       assert(!argTy.isa<UnrankedMemRefType>() &&
//              "Unranked memref is not supported");
//       auto memrefTy = argTy.dyn_cast<MemRefType>();
//       if (!memrefTy)
//         continue;

//       // Replace barePtr with a placeholder (undef), promote barePtr to a ranked
//       // or unranked memref descriptor and replace placeholder with the last
//       // instruction of the memref descriptor.
//       // TODO: The placeholder is needed to avoid replacing barePtr uses in the
//       // MemRef descriptor instructions. We may want to have a utility in the
//       // rewriter to properly handle this use case.
//       Location loc = funcOp.getLoc();
//       auto placeholder = rewriter.create<LLVM::UndefOp>(
//           loc, getTypeConverter()->convertType(memrefTy));
//       rewriter.replaceUsesOfBlockArgument(arg, placeholder);

//       Value desc = MemRefDescriptor::fromStaticShape(
//           rewriter, loc, *getTypeConverter(), memrefTy, arg);
//       rewriter.replaceOp(placeholder, {desc});
//     }
//     // replaceOpWithIf
//     rewriter.eraseOp(funcOp);
//     return success();
//   }
// };


namespace {

TypedAttr getConstantAttr(Type type, int64_t value, PatternRewriter &rewriter) {
  if (auto shapedTy = dyn_cast<ShapedType>(type)) {
    Type eTy = shapedTy.getElementType();
    APInt valueInt(eTy.getIntOrFloatBitWidth(), value);
    return DenseIntElementsAttr::get(shapedTy, valueInt);
  }

  return rewriter.getIntegerAttr(type, value);
}


Value getConstantValue(Location loc, Type type, int64_t value,
                       PatternRewriter &rewriter) {
  return rewriter.create<arith::ConstantOp>(
      loc, getConstantAttr(type, value, rewriter));
}

class RsqrtConverter : public OpRewritePattern<math::RsqrtOp> {
  /**=================================
   * Convert math.rsqrt with following algorithm:
   * 
   * float Q_rsqrt( float number )
  {
	  long i;
	  float x2, y;
	  const float threehalfs = 1.5F;

	  x2 = number * 0.5F;
	  y  = number;
	  i  = * ( long * ) &y;                       // evil floating point bit level hacking
	  i  = 0x5f3759df - ( i >> 1 );               // what the fuck? 
	  y  = * ( float * ) &i;
	  y  = y * ( threehalfs - ( x2 * y * y ) );   // 1st iteration
    //	y  = y * ( threehalfs - ( x2 * y * y ) );   // 2nd iteration, this can be removed

	  return y;
  }
   * 
   * 
  ===================================*/
  
public:
  using OpRewritePattern<math::RsqrtOp>::OpRewritePattern;

  LogicalResult matchAndRewrite(math::RsqrtOp op,
                                PatternRewriter &rewriter) const final {
    Location loc = op.getLoc();
    Type valueTy = rewriter.getF32Type();
    Value cst_1_2 = getConstantValue(loc, valueTy, 0.5, rewriter);
// typeConverter.convertType(builder.getIndexType()),
//         builder.getIntegerAttr(builder.getIndexType(), 1));
    // rewriter.replaceOpWithNewOp<arith::ConstantOp>(op, op.getValue());
    rewriter.replaceOp(op, cst_1_2);
    return success();
  }
};

/// A pass to lower math operations 
struct ApproximateMathWithArithPass
    : public ApproximateMathWithArithBase<ApproximateMathWithArithPass> {
  ApproximateMathWithArithPass() = default;

  void runOnOperation() override {

    // if (failed(LLVM::LLVMDialect::verifyDataLayoutString(
    //         this->dataLayout, [this](const Twine &message) {
    //           getOperation().emitError() << message.str();
    //         }))) {
    //   signalPassFailure();
    //   return;
    // // }
    RewritePatternSet patterns(&getContext());
    ConversionTarget target(getContext());
    // target.addIllegalOp<tosa::ConstOp>();
    target.addLegalDialect<arith::ArithDialect>();
    patterns.add<RsqrtConverter>(patterns.getContext());
    // ModuleOp m = getOperation();

    // m.walk([this](FDRA::KernelCallOp callop) {
    //   // llvm::errs() <<"[debug] Callee: "<<callop.callee()<< "\n";
    //   KernelNameVec.push_back(callop.callee());
    // });


    // const auto &dataLayoutAnalysis = getAnalysis<DataLayoutAnalysis>();

    // LowerToLLVMOptions options(&getContext(),
    //                            dataLayoutAnalysis.getAtOrAbove(m));
    // options.useBarePtrCallConv = true;
    // // if (indexBitwidth != kDeriveIndexBitwidthFromDataLayout)
    // //   options.overrideIndexBitwidth(indexBitwidth);
    // // options.dataLayout = llvm::DataLayout(this->dataLayout);

    // LLVMTypeConverter typeConverter(&getContext(), options,
    //                                 &dataLayoutAnalysis);

    // RewritePatternSet patterns(&getContext());
    // patterns.add<KernelCallOpLowering>(typeConverter);
    // patterns.add<KernelFuncOpConversion>(typeConverter);
    // patterns.add<ReturnOpLowering>(typeConverter);
    // // populateFuncToLLVMFuncOpConversionPattern(typeConverter, patterns);
    // // populateFuncToLLVMConversionPatterns(typeConverter, patterns);

    // // TODO: Remove these in favor of their dedicated conversion passes.
    // arith::populateArithToLLVMConversionPatterns(typeConverter, patterns);
    // cf::populateControlFlowToLLVMConversionPatterns(typeConverter, patterns);

    // LLVMConversionTarget target(getContext());

    // // m.walk([this, &m](func::FuncOp funcop) {
    // //   ::llvm::StringRef NameToFind = funcop.getSymName();
    // //   // llvm::errs() <<"\nfuncop :" << NameToFind;
    // //   auto it = std::find(KernelNameVec.begin(), KernelNameVec.end(), NameToFind);
    // //   if (it != KernelNameVec.end()) { // FuncOp is a kernel
    // //     llvm::errs() << "[debug] found a kernel func:\n";
    // //     funcop.dump();

    // //     LLVM::LLVMFuncOp newFuncOp = convertFuncOpToLLVMFuncAndEraseBody(funcop);
    // //     llvm::errs() << "[debug] newFuncOp:\n";
    // //     newFuncOp.dump();

    // //     funcop.erase();

    // //     llvm::errs() << "[debug] whole module:\n";
    // //     m.dump();
    // //   } 
    // // });

    if (failed(applyPartialConversion(getOperation(), target,
                                      std::move(patterns))))
      signalPassFailure();
    // // m->setAttr(LLVM::LLVMDialect::getDataLayoutAttrName(),
    // //            StringAttr::get(m.getContext(), this->dataLayout));
  }
};
} // namespace

std::unique_ptr<OperationPass<ModuleOp>> mlir::FDRA::createApproximateMathWithArithPass() {
  return std::make_unique<ApproximateMathWithArithPass>();
}

