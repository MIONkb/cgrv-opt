// -----// IR Dump After ArithExpandOps (arith-expand) //----- //
module {
  func.func @forward_kernel_2(%arg0: memref<1x3x230x230xf32>, %arg1: memref<64x3x7x7xf32>, %arg2: memref<1x64x112x112xf32>, %arg3: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_2} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    affine.for %arg4 = 0 to 8 {
      affine.for %arg5 = 0 to 3 {
        affine.for %arg6 = 0 to 7 {
          affine.for %arg7 = 0 to 7 {
            %0 = affine.load %arg0[0, %arg5, %arg6, %arg4 * 2 + %arg7] : memref<1x3x230x230xf32>
            %1 = affine.load %arg1[0, %arg5, %arg6, %arg7] : memref<64x3x7x7xf32>
            %2 = affine.load %arg2[0, 0, 0, %arg4] : memref<1x64x112x112xf32>
            %3 = arith.mulf %0, %1 : f32
            %4 = arith.addf %2, %3 : f32
            affine.store %4, %arg3[0, 0, 0, %arg4] : memref<1x64x112x112xf32>
          }
        }
      }
    }
    return
  }
}


// -----// IR Dump After ExpandOps (memref-expand) //----- //
module {
  func.func @forward_kernel_2(%arg0: memref<1x3x230x230xf32>, %arg1: memref<64x3x7x7xf32>, %arg2: memref<1x64x112x112xf32>, %arg3: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_2} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    affine.for %arg4 = 0 to 8 {
      affine.for %arg5 = 0 to 3 {
        affine.for %arg6 = 0 to 7 {
          affine.for %arg7 = 0 to 7 {
            %0 = affine.load %arg0[0, %arg5, %arg6, %arg4 * 2 + %arg7] : memref<1x3x230x230xf32>
            %1 = affine.load %arg1[0, %arg5, %arg6, %arg7] : memref<64x3x7x7xf32>
            %2 = affine.load %arg2[0, 0, 0, %arg4] : memref<1x64x112x112xf32>
            %3 = arith.mulf %0, %1 : f32
            %4 = arith.addf %2, %3 : f32
            affine.store %4, %arg3[0, 0, 0, %arg4] : memref<1x64x112x112xf32>
          }
        }
      }
    }
    return
  }
}


// -----// IR Dump After ConvertAffineToStandard (lower-affine) //----- //
module {
  func.func @forward_kernel_2(%arg0: memref<1x3x230x230xf32>, %arg1: memref<64x3x7x7xf32>, %arg2: memref<1x64x112x112xf32>, %arg3: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_2} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    %c0 = arith.constant 0 : index
    %c8 = arith.constant 8 : index
    %c1 = arith.constant 1 : index
    scf.for %arg4 = %c0 to %c8 step %c1 {
      %c0_0 = arith.constant 0 : index
      %c3 = arith.constant 3 : index
      %c1_1 = arith.constant 1 : index
      scf.for %arg5 = %c0_0 to %c3 step %c1_1 {
        %c0_2 = arith.constant 0 : index
        %c7 = arith.constant 7 : index
        %c1_3 = arith.constant 1 : index
        scf.for %arg6 = %c0_2 to %c7 step %c1_3 {
          %c0_4 = arith.constant 0 : index
          %c7_5 = arith.constant 7 : index
          %c1_6 = arith.constant 1 : index
          scf.for %arg7 = %c0_4 to %c7_5 step %c1_6 {
            %c0_7 = arith.constant 0 : index
            %c2 = arith.constant 2 : index
            %0 = arith.muli %arg4, %c2 : index
            %1 = arith.addi %0, %arg7 : index
            %2 = memref.load %arg0[%c0_7, %arg5, %arg6, %1] : memref<1x3x230x230xf32>
            %c0_8 = arith.constant 0 : index
            %3 = memref.load %arg1[%c0_8, %arg5, %arg6, %arg7] : memref<64x3x7x7xf32>
            %c0_9 = arith.constant 0 : index
            %c0_10 = arith.constant 0 : index
            %c0_11 = arith.constant 0 : index
            %4 = memref.load %arg2[%c0_9, %c0_10, %c0_11, %arg4] : memref<1x64x112x112xf32>
            %5 = arith.mulf %2, %3 : f32
            %6 = arith.addf %4, %5 : f32
            %c0_12 = arith.constant 0 : index
            %c0_13 = arith.constant 0 : index
            %c0_14 = arith.constant 0 : index
            memref.store %6, %arg3[%c0_12, %c0_13, %c0_14, %arg4] : memref<1x64x112x112xf32>
          }
        }
      }
    }
    return
  }
}


// -----// IR Dump After SCFForLoopCanonicalization (scf-for-loop-canonicalization) //----- //
module {
  func.func @forward_kernel_2(%arg0: memref<1x3x230x230xf32>, %arg1: memref<64x3x7x7xf32>, %arg2: memref<1x64x112x112xf32>, %arg3: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_2} {
    %c2 = arith.constant 2 : index
    %c7 = arith.constant 7 : index
    %c3 = arith.constant 3 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    %c0 = arith.constant 0 : index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    scf.for %arg4 = %c0 to %c8 step %c1 {
      scf.for %arg5 = %c0 to %c3 step %c1 {
        scf.for %arg6 = %c0 to %c7 step %c1 {
          scf.for %arg7 = %c0 to %c7 step %c1 {
            %0 = arith.muli %arg4, %c2 : index
            %1 = arith.addi %0, %arg7 : index
            %2 = memref.load %arg0[%c0, %arg5, %arg6, %1] : memref<1x3x230x230xf32>
            %3 = memref.load %arg1[%c0, %arg5, %arg6, %arg7] : memref<64x3x7x7xf32>
            %4 = memref.load %arg2[%c0, %c0, %c0, %arg4] : memref<1x64x112x112xf32>
            %5 = arith.mulf %2, %3 : f32
            %6 = arith.addf %4, %5 : f32
            memref.store %6, %arg3[%c0, %c0, %c0, %arg4] : memref<1x64x112x112xf32>
          }
        }
      }
    }
    return
  }
}


// -----// IR Dump After SCFToControlFlow (convert-scf-to-cf) //----- //
module {
  func.func @forward_kernel_2(%arg0: memref<1x3x230x230xf32>, %arg1: memref<64x3x7x7xf32>, %arg2: memref<1x64x112x112xf32>, %arg3: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_2} {
    %c2 = arith.constant 2 : index
    %c7 = arith.constant 7 : index
    %c3 = arith.constant 3 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    %c0 = arith.constant 0 : index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%c0 : index)
  ^bb2(%0: index):  // 2 preds: ^bb1, ^bb12
    %1 = arith.cmpi slt, %0, %c8 : index
    cf.cond_br %1, ^bb3, ^bb13
  ^bb3:  // pred: ^bb2
    cf.br ^bb4(%c0 : index)
  ^bb4(%2: index):  // 2 preds: ^bb3, ^bb11
    %3 = arith.cmpi slt, %2, %c3 : index
    cf.cond_br %3, ^bb5, ^bb12
  ^bb5:  // pred: ^bb4
    cf.br ^bb6(%c0 : index)
  ^bb6(%4: index):  // 2 preds: ^bb5, ^bb10
    %5 = arith.cmpi slt, %4, %c7 : index
    cf.cond_br %5, ^bb7, ^bb11
  ^bb7:  // pred: ^bb6
    cf.br ^bb8(%c0 : index)
  ^bb8(%6: index):  // 2 preds: ^bb7, ^bb9
    %7 = arith.cmpi slt, %6, %c7 : index
    cf.cond_br %7, ^bb9, ^bb10
  ^bb9:  // pred: ^bb8
    %8 = arith.muli %0, %c2 : index
    %9 = arith.addi %8, %6 : index
    %10 = memref.load %arg0[%c0, %2, %4, %9] : memref<1x3x230x230xf32>
    %11 = memref.load %arg1[%c0, %2, %4, %6] : memref<64x3x7x7xf32>
    %12 = memref.load %arg2[%c0, %c0, %c0, %0] : memref<1x64x112x112xf32>
    %13 = arith.mulf %10, %11 : f32
    %14 = arith.addf %12, %13 : f32
    memref.store %14, %arg3[%c0, %c0, %c0, %0] : memref<1x64x112x112xf32>
    %15 = arith.addi %6, %c1 : index
    cf.br ^bb8(%15 : index)
  ^bb10:  // pred: ^bb8
    %16 = arith.addi %4, %c1 : index
    cf.br ^bb6(%16 : index)
  ^bb11:  // pred: ^bb6
    %17 = arith.addi %2, %c1 : index
    cf.br ^bb4(%17 : index)
  ^bb12:  // pred: ^bb4
    %18 = arith.addi %0, %c1 : index
    cf.br ^bb2(%18 : index)
  ^bb13:  // pred: ^bb2
    return
  }
}


// -----// IR Dump After FinalizeMemRefToLLVMConversionPass (finalize-memref-to-llvm) //----- //
module {
  func.func @forward_kernel_2(%arg0: memref<1x3x230x230xf32>, %arg1: memref<64x3x7x7xf32>, %arg2: memref<1x64x112x112xf32>, %arg3: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_2} {
    %0 = builtin.unrealized_conversion_cast %arg0 : memref<1x3x230x230xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %1 = builtin.unrealized_conversion_cast %arg1 : memref<64x3x7x7xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %2 = builtin.unrealized_conversion_cast %arg2 : memref<1x64x112x112xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %3 = builtin.unrealized_conversion_cast %arg3 : memref<1x64x112x112xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %c2 = arith.constant 2 : index
    %c7 = arith.constant 7 : index
    %c3 = arith.constant 3 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    %c0 = arith.constant 0 : index
    %4 = builtin.unrealized_conversion_cast %c0 : index to i64
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%c0 : index)
  ^bb2(%5: index):  // 2 preds: ^bb1, ^bb12
    %6 = builtin.unrealized_conversion_cast %5 : index to i64
    %7 = arith.cmpi slt, %5, %c8 : index
    cf.cond_br %7, ^bb3, ^bb13
  ^bb3:  // pred: ^bb2
    cf.br ^bb4(%c0 : index)
  ^bb4(%8: index):  // 2 preds: ^bb3, ^bb11
    %9 = builtin.unrealized_conversion_cast %8 : index to i64
    %10 = arith.cmpi slt, %8, %c3 : index
    cf.cond_br %10, ^bb5, ^bb12
  ^bb5:  // pred: ^bb4
    cf.br ^bb6(%c0 : index)
  ^bb6(%11: index):  // 2 preds: ^bb5, ^bb10
    %12 = builtin.unrealized_conversion_cast %11 : index to i64
    %13 = arith.cmpi slt, %11, %c7 : index
    cf.cond_br %13, ^bb7, ^bb11
  ^bb7:  // pred: ^bb6
    cf.br ^bb8(%c0 : index)
  ^bb8(%14: index):  // 2 preds: ^bb7, ^bb9
    %15 = builtin.unrealized_conversion_cast %14 : index to i64
    %16 = arith.cmpi slt, %14, %c7 : index
    cf.cond_br %16, ^bb9, ^bb10
  ^bb9:  // pred: ^bb8
    %17 = arith.muli %5, %c2 : index
    %18 = arith.addi %17, %14 : index
    %19 = builtin.unrealized_conversion_cast %18 : index to i64
    %20 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %21 = llvm.mlir.constant(158700 : index) : i64
    %22 = llvm.mul %4, %21  : i64
    %23 = llvm.mlir.constant(52900 : index) : i64
    %24 = llvm.mul %9, %23  : i64
    %25 = llvm.add %22, %24  : i64
    %26 = llvm.mlir.constant(230 : index) : i64
    %27 = llvm.mul %12, %26  : i64
    %28 = llvm.add %25, %27  : i64
    %29 = llvm.add %28, %19  : i64
    %30 = llvm.getelementptr %20[%29] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %31 = llvm.load %30 : !llvm.ptr -> f32
    %32 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %33 = llvm.mlir.constant(147 : index) : i64
    %34 = llvm.mul %4, %33  : i64
    %35 = llvm.mlir.constant(49 : index) : i64
    %36 = llvm.mul %9, %35  : i64
    %37 = llvm.add %34, %36  : i64
    %38 = llvm.mlir.constant(7 : index) : i64
    %39 = llvm.mul %12, %38  : i64
    %40 = llvm.add %37, %39  : i64
    %41 = llvm.add %40, %15  : i64
    %42 = llvm.getelementptr %32[%41] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %43 = llvm.load %42 : !llvm.ptr -> f32
    %44 = llvm.extractvalue %2[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %45 = llvm.mlir.constant(802816 : index) : i64
    %46 = llvm.mul %4, %45  : i64
    %47 = llvm.mlir.constant(12544 : index) : i64
    %48 = llvm.mul %4, %47  : i64
    %49 = llvm.add %46, %48  : i64
    %50 = llvm.mlir.constant(112 : index) : i64
    %51 = llvm.mul %4, %50  : i64
    %52 = llvm.add %49, %51  : i64
    %53 = llvm.add %52, %6  : i64
    %54 = llvm.getelementptr %44[%53] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %55 = llvm.load %54 : !llvm.ptr -> f32
    %56 = arith.mulf %31, %43 : f32
    %57 = arith.addf %55, %56 : f32
    %58 = llvm.extractvalue %3[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %59 = llvm.mlir.constant(802816 : index) : i64
    %60 = llvm.mul %4, %59  : i64
    %61 = llvm.mlir.constant(12544 : index) : i64
    %62 = llvm.mul %4, %61  : i64
    %63 = llvm.add %60, %62  : i64
    %64 = llvm.mlir.constant(112 : index) : i64
    %65 = llvm.mul %4, %64  : i64
    %66 = llvm.add %63, %65  : i64
    %67 = llvm.add %66, %6  : i64
    %68 = llvm.getelementptr %58[%67] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %57, %68 : f32, !llvm.ptr
    %69 = arith.addi %14, %c1 : index
    cf.br ^bb8(%69 : index)
  ^bb10:  // pred: ^bb8
    %70 = arith.addi %11, %c1 : index
    cf.br ^bb6(%70 : index)
  ^bb11:  // pred: ^bb6
    %71 = arith.addi %8, %c1 : index
    cf.br ^bb4(%71 : index)
  ^bb12:  // pred: ^bb4
    %72 = arith.addi %5, %c1 : index
    cf.br ^bb2(%72 : index)
  ^bb13:  // pred: ^bb2
    return
  }
}


