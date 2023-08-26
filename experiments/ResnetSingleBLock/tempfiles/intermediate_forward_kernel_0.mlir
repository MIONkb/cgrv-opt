// -----// IR Dump After ArithExpandOps (arith-expand) //----- //
module {
  func.func @forward_kernel_0(%arg0: memref<1x64x112x112xf32>, %arg1: memref<1x3x230x230xf32>, %arg2: memref<64x3x7x7xf32>, %arg3: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_0} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    affine.for %arg4 = 0 to 8 {
      %0 = affine.load %arg0[0, 0, 0, %arg4] : memref<1x64x112x112xf32>
      %1 = affine.for %arg5 = 0 to 3 iter_args(%arg6 = %0) -> (f32) {
        %2 = affine.for %arg7 = 0 to 7 iter_args(%arg8 = %arg6) -> (f32) {
          %3 = affine.for %arg9 = 0 to 7 iter_args(%arg10 = %arg8) -> (f32) {
            %4 = affine.load %arg1[0, %arg5, %arg7, %arg4 * 2 + %arg9] : memref<1x3x230x230xf32>
            %5 = affine.load %arg2[0, %arg5, %arg7, %arg9] : memref<64x3x7x7xf32>
            %6 = arith.mulf %4, %5 : f32
            %7 = arith.addf %arg10, %6 : f32
            affine.yield %7 : f32
          }
          affine.yield %3 : f32
        }
        affine.yield %2 : f32
      }
      affine.store %1, %arg3[0, 0, 0, %arg4] : memref<1x64x112x112xf32>
    }
    return
  }
}


// -----// IR Dump After ExpandOps (memref-expand) //----- //
module {
  func.func @forward_kernel_0(%arg0: memref<1x64x112x112xf32>, %arg1: memref<1x3x230x230xf32>, %arg2: memref<64x3x7x7xf32>, %arg3: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_0} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    affine.for %arg4 = 0 to 8 {
      %0 = affine.load %arg0[0, 0, 0, %arg4] : memref<1x64x112x112xf32>
      %1 = affine.for %arg5 = 0 to 3 iter_args(%arg6 = %0) -> (f32) {
        %2 = affine.for %arg7 = 0 to 7 iter_args(%arg8 = %arg6) -> (f32) {
          %3 = affine.for %arg9 = 0 to 7 iter_args(%arg10 = %arg8) -> (f32) {
            %4 = affine.load %arg1[0, %arg5, %arg7, %arg4 * 2 + %arg9] : memref<1x3x230x230xf32>
            %5 = affine.load %arg2[0, %arg5, %arg7, %arg9] : memref<64x3x7x7xf32>
            %6 = arith.mulf %4, %5 : f32
            %7 = arith.addf %arg10, %6 : f32
            affine.yield %7 : f32
          }
          affine.yield %3 : f32
        }
        affine.yield %2 : f32
      }
      affine.store %1, %arg3[0, 0, 0, %arg4] : memref<1x64x112x112xf32>
    }
    return
  }
}


// -----// IR Dump After SimplifyAffineStructures (affine-simplify-structures) //----- //
func.func @forward_kernel_0(%arg0: memref<1x64x112x112xf32>, %arg1: memref<1x3x230x230xf32>, %arg2: memref<64x3x7x7xf32>, %arg3: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_0} {
  cf.br ^bb1
^bb1:  // pred: ^bb0
  affine.for %arg4 = 0 to 8 {
    %0 = affine.load %arg0[0, 0, 0, %arg4] : memref<1x64x112x112xf32>
    %1 = affine.for %arg5 = 0 to 3 iter_args(%arg6 = %0) -> (f32) {
      %2 = affine.for %arg7 = 0 to 7 iter_args(%arg8 = %arg6) -> (f32) {
        %3 = affine.for %arg9 = 0 to 7 iter_args(%arg10 = %arg8) -> (f32) {
          %4 = affine.load %arg1[0, %arg5, %arg7, %arg4 * 2 + %arg9] : memref<1x3x230x230xf32>
          %5 = affine.load %arg2[0, %arg5, %arg7, %arg9] : memref<64x3x7x7xf32>
          %6 = arith.mulf %4, %5 : f32
          %7 = arith.addf %arg10, %6 : f32
          affine.yield %7 : f32
        }
        affine.yield %3 : f32
      }
      affine.yield %2 : f32
    }
    affine.store %1, %arg3[0, 0, 0, %arg4] : memref<1x64x112x112xf32>
  }
  return
}

// -----// IR Dump After ConvertAffineToStandard (lower-affine) //----- //
module {
  func.func @forward_kernel_0(%arg0: memref<1x64x112x112xf32>, %arg1: memref<1x3x230x230xf32>, %arg2: memref<64x3x7x7xf32>, %arg3: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_0} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    %c0 = arith.constant 0 : index
    %c8 = arith.constant 8 : index
    %c1 = arith.constant 1 : index
    scf.for %arg4 = %c0 to %c8 step %c1 {
      %c0_0 = arith.constant 0 : index
      %c0_1 = arith.constant 0 : index
      %c0_2 = arith.constant 0 : index
      %0 = memref.load %arg0[%c0_0, %c0_1, %c0_2, %arg4] : memref<1x64x112x112xf32>
      %c0_3 = arith.constant 0 : index
      %c3 = arith.constant 3 : index
      %c1_4 = arith.constant 1 : index
      %1 = scf.for %arg5 = %c0_3 to %c3 step %c1_4 iter_args(%arg6 = %0) -> (f32) {
        %c0_8 = arith.constant 0 : index
        %c7 = arith.constant 7 : index
        %c1_9 = arith.constant 1 : index
        %2 = scf.for %arg7 = %c0_8 to %c7 step %c1_9 iter_args(%arg8 = %arg6) -> (f32) {
          %c0_10 = arith.constant 0 : index
          %c7_11 = arith.constant 7 : index
          %c1_12 = arith.constant 1 : index
          %3 = scf.for %arg9 = %c0_10 to %c7_11 step %c1_12 iter_args(%arg10 = %arg8) -> (f32) {
            %c0_13 = arith.constant 0 : index
            %c2 = arith.constant 2 : index
            %4 = arith.muli %arg4, %c2 : index
            %5 = arith.addi %4, %arg9 : index
            %6 = memref.load %arg1[%c0_13, %arg5, %arg7, %5] : memref<1x3x230x230xf32>
            %c0_14 = arith.constant 0 : index
            %7 = memref.load %arg2[%c0_14, %arg5, %arg7, %arg9] : memref<64x3x7x7xf32>
            %8 = arith.mulf %6, %7 : f32
            %9 = arith.addf %arg10, %8 : f32
            scf.yield %9 : f32
          }
          scf.yield %3 : f32
        }
        scf.yield %2 : f32
      }
      %c0_5 = arith.constant 0 : index
      %c0_6 = arith.constant 0 : index
      %c0_7 = arith.constant 0 : index
      memref.store %1, %arg3[%c0_5, %c0_6, %c0_7, %arg4] : memref<1x64x112x112xf32>
    }
    return
  }
}


// -----// IR Dump After SCFForLoopCanonicalization (scf-for-loop-canonicalization) //----- //
module {
  func.func @forward_kernel_0(%arg0: memref<1x64x112x112xf32>, %arg1: memref<1x3x230x230xf32>, %arg2: memref<64x3x7x7xf32>, %arg3: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_0} {
    %c2 = arith.constant 2 : index
    %c7 = arith.constant 7 : index
    %c3 = arith.constant 3 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    %c0 = arith.constant 0 : index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    scf.for %arg4 = %c0 to %c8 step %c1 {
      %0 = memref.load %arg0[%c0, %c0, %c0, %arg4] : memref<1x64x112x112xf32>
      %1 = scf.for %arg5 = %c0 to %c3 step %c1 iter_args(%arg6 = %0) -> (f32) {
        %2 = scf.for %arg7 = %c0 to %c7 step %c1 iter_args(%arg8 = %arg6) -> (f32) {
          %3 = scf.for %arg9 = %c0 to %c7 step %c1 iter_args(%arg10 = %arg8) -> (f32) {
            %4 = arith.muli %arg4, %c2 : index
            %5 = arith.addi %4, %arg9 : index
            %6 = memref.load %arg1[%c0, %arg5, %arg7, %5] : memref<1x3x230x230xf32>
            %7 = memref.load %arg2[%c0, %arg5, %arg7, %arg9] : memref<64x3x7x7xf32>
            %8 = arith.mulf %6, %7 : f32
            %9 = arith.addf %arg10, %8 : f32
            scf.yield %9 : f32
          }
          scf.yield %3 : f32
        }
        scf.yield %2 : f32
      }
      memref.store %1, %arg3[%c0, %c0, %c0, %arg4] : memref<1x64x112x112xf32>
    }
    return
  }
}


// -----// IR Dump After SCFToControlFlow (convert-scf-to-cf) //----- //
module {
  func.func @forward_kernel_0(%arg0: memref<1x64x112x112xf32>, %arg1: memref<1x3x230x230xf32>, %arg2: memref<64x3x7x7xf32>, %arg3: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_0} {
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
    %2 = memref.load %arg0[%c0, %c0, %c0, %0] : memref<1x64x112x112xf32>
    cf.br ^bb4(%c0, %2 : index, f32)
  ^bb4(%3: index, %4: f32):  // 2 preds: ^bb3, ^bb11
    %5 = arith.cmpi slt, %3, %c3 : index
    cf.cond_br %5, ^bb5, ^bb12
  ^bb5:  // pred: ^bb4
    cf.br ^bb6(%c0, %4 : index, f32)
  ^bb6(%6: index, %7: f32):  // 2 preds: ^bb5, ^bb10
    %8 = arith.cmpi slt, %6, %c7 : index
    cf.cond_br %8, ^bb7, ^bb11
  ^bb7:  // pred: ^bb6
    cf.br ^bb8(%c0, %7 : index, f32)
  ^bb8(%9: index, %10: f32):  // 2 preds: ^bb7, ^bb9
    %11 = arith.cmpi slt, %9, %c7 : index
    cf.cond_br %11, ^bb9, ^bb10
  ^bb9:  // pred: ^bb8
    %12 = arith.muli %0, %c2 : index
    %13 = arith.addi %12, %9 : index
    %14 = memref.load %arg1[%c0, %3, %6, %13] : memref<1x3x230x230xf32>
    %15 = memref.load %arg2[%c0, %3, %6, %9] : memref<64x3x7x7xf32>
    %16 = arith.mulf %14, %15 : f32
    %17 = arith.addf %10, %16 : f32
    %18 = arith.addi %9, %c1 : index
    cf.br ^bb8(%18, %17 : index, f32)
  ^bb10:  // pred: ^bb8
    %19 = arith.addi %6, %c1 : index
    cf.br ^bb6(%19, %10 : index, f32)
  ^bb11:  // pred: ^bb6
    %20 = arith.addi %3, %c1 : index
    cf.br ^bb4(%20, %7 : index, f32)
  ^bb12:  // pred: ^bb4
    memref.store %4, %arg3[%c0, %c0, %c0, %0] : memref<1x64x112x112xf32>
    %21 = arith.addi %0, %c1 : index
    cf.br ^bb2(%21 : index)
  ^bb13:  // pred: ^bb2
    return
  }
}


// -----// IR Dump After FinalizeMemRefToLLVMConversionPass (finalize-memref-to-llvm) //----- //
module {
  func.func @forward_kernel_0(%arg0: memref<1x64x112x112xf32>, %arg1: memref<1x3x230x230xf32>, %arg2: memref<64x3x7x7xf32>, %arg3: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_0} {
    %0 = builtin.unrealized_conversion_cast %arg0 : memref<1x64x112x112xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %1 = builtin.unrealized_conversion_cast %arg1 : memref<1x3x230x230xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %2 = builtin.unrealized_conversion_cast %arg2 : memref<64x3x7x7xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
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
    %8 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %9 = llvm.mlir.constant(802816 : index) : i64
    %10 = llvm.mul %4, %9  : i64
    %11 = llvm.mlir.constant(12544 : index) : i64
    %12 = llvm.mul %4, %11  : i64
    %13 = llvm.add %10, %12  : i64
    %14 = llvm.mlir.constant(112 : index) : i64
    %15 = llvm.mul %4, %14  : i64
    %16 = llvm.add %13, %15  : i64
    %17 = llvm.add %16, %6  : i64
    %18 = llvm.getelementptr %8[%17] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %19 = llvm.load %18 : !llvm.ptr -> f32
    cf.br ^bb4(%c0, %19 : index, f32)
  ^bb4(%20: index, %21: f32):  // 2 preds: ^bb3, ^bb11
    %22 = builtin.unrealized_conversion_cast %20 : index to i64
    %23 = arith.cmpi slt, %20, %c3 : index
    cf.cond_br %23, ^bb5, ^bb12
  ^bb5:  // pred: ^bb4
    cf.br ^bb6(%c0, %21 : index, f32)
  ^bb6(%24: index, %25: f32):  // 2 preds: ^bb5, ^bb10
    %26 = builtin.unrealized_conversion_cast %24 : index to i64
    %27 = arith.cmpi slt, %24, %c7 : index
    cf.cond_br %27, ^bb7, ^bb11
  ^bb7:  // pred: ^bb6
    cf.br ^bb8(%c0, %25 : index, f32)
  ^bb8(%28: index, %29: f32):  // 2 preds: ^bb7, ^bb9
    %30 = builtin.unrealized_conversion_cast %28 : index to i64
    %31 = arith.cmpi slt, %28, %c7 : index
    cf.cond_br %31, ^bb9, ^bb10
  ^bb9:  // pred: ^bb8
    %32 = arith.muli %5, %c2 : index
    %33 = arith.addi %32, %28 : index
    %34 = builtin.unrealized_conversion_cast %33 : index to i64
    %35 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %36 = llvm.mlir.constant(158700 : index) : i64
    %37 = llvm.mul %4, %36  : i64
    %38 = llvm.mlir.constant(52900 : index) : i64
    %39 = llvm.mul %22, %38  : i64
    %40 = llvm.add %37, %39  : i64
    %41 = llvm.mlir.constant(230 : index) : i64
    %42 = llvm.mul %26, %41  : i64
    %43 = llvm.add %40, %42  : i64
    %44 = llvm.add %43, %34  : i64
    %45 = llvm.getelementptr %35[%44] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %46 = llvm.load %45 : !llvm.ptr -> f32
    %47 = llvm.extractvalue %2[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %48 = llvm.mlir.constant(147 : index) : i64
    %49 = llvm.mul %4, %48  : i64
    %50 = llvm.mlir.constant(49 : index) : i64
    %51 = llvm.mul %22, %50  : i64
    %52 = llvm.add %49, %51  : i64
    %53 = llvm.mlir.constant(7 : index) : i64
    %54 = llvm.mul %26, %53  : i64
    %55 = llvm.add %52, %54  : i64
    %56 = llvm.add %55, %30  : i64
    %57 = llvm.getelementptr %47[%56] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %58 = llvm.load %57 : !llvm.ptr -> f32
    %59 = arith.mulf %46, %58 : f32
    %60 = arith.addf %29, %59 : f32
    %61 = arith.addi %28, %c1 : index
    cf.br ^bb8(%61, %60 : index, f32)
  ^bb10:  // pred: ^bb8
    %62 = arith.addi %24, %c1 : index
    cf.br ^bb6(%62, %29 : index, f32)
  ^bb11:  // pred: ^bb6
    %63 = arith.addi %20, %c1 : index
    cf.br ^bb4(%63, %25 : index, f32)
  ^bb12:  // pred: ^bb4
    %64 = llvm.extractvalue %3[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %65 = llvm.mlir.constant(802816 : index) : i64
    %66 = llvm.mul %4, %65  : i64
    %67 = llvm.mlir.constant(12544 : index) : i64
    %68 = llvm.mul %4, %67  : i64
    %69 = llvm.add %66, %68  : i64
    %70 = llvm.mlir.constant(112 : index) : i64
    %71 = llvm.mul %4, %70  : i64
    %72 = llvm.add %69, %71  : i64
    %73 = llvm.add %72, %6  : i64
    %74 = llvm.getelementptr %64[%73] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %21, %74 : f32, !llvm.ptr
    %75 = arith.addi %5, %c1 : index
    cf.br ^bb2(%75 : index)
  ^bb13:  // pred: ^bb2
    return
  }
}


// -----// IR Dump After ConvertMathToLLVMPass (convert-math-to-llvm) //----- //
module {
  func.func @forward_kernel_0(%arg0: memref<1x64x112x112xf32>, %arg1: memref<1x3x230x230xf32>, %arg2: memref<64x3x7x7xf32>, %arg3: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_0} {
    %0 = builtin.unrealized_conversion_cast %arg0 : memref<1x64x112x112xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %1 = builtin.unrealized_conversion_cast %arg1 : memref<1x3x230x230xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %2 = builtin.unrealized_conversion_cast %arg2 : memref<64x3x7x7xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
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
    %8 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %9 = llvm.mlir.constant(802816 : index) : i64
    %10 = llvm.mul %4, %9  : i64
    %11 = llvm.mlir.constant(12544 : index) : i64
    %12 = llvm.mul %4, %11  : i64
    %13 = llvm.add %10, %12  : i64
    %14 = llvm.mlir.constant(112 : index) : i64
    %15 = llvm.mul %4, %14  : i64
    %16 = llvm.add %13, %15  : i64
    %17 = llvm.add %16, %6  : i64
    %18 = llvm.getelementptr %8[%17] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %19 = llvm.load %18 : !llvm.ptr -> f32
    cf.br ^bb4(%c0, %19 : index, f32)
  ^bb4(%20: index, %21: f32):  // 2 preds: ^bb3, ^bb11
    %22 = builtin.unrealized_conversion_cast %20 : index to i64
    %23 = arith.cmpi slt, %20, %c3 : index
    cf.cond_br %23, ^bb5, ^bb12
  ^bb5:  // pred: ^bb4
    cf.br ^bb6(%c0, %21 : index, f32)
  ^bb6(%24: index, %25: f32):  // 2 preds: ^bb5, ^bb10
    %26 = builtin.unrealized_conversion_cast %24 : index to i64
    %27 = arith.cmpi slt, %24, %c7 : index
    cf.cond_br %27, ^bb7, ^bb11
  ^bb7:  // pred: ^bb6
    cf.br ^bb8(%c0, %25 : index, f32)
  ^bb8(%28: index, %29: f32):  // 2 preds: ^bb7, ^bb9
    %30 = builtin.unrealized_conversion_cast %28 : index to i64
    %31 = arith.cmpi slt, %28, %c7 : index
    cf.cond_br %31, ^bb9, ^bb10
  ^bb9:  // pred: ^bb8
    %32 = arith.muli %5, %c2 : index
    %33 = arith.addi %32, %28 : index
    %34 = builtin.unrealized_conversion_cast %33 : index to i64
    %35 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %36 = llvm.mlir.constant(158700 : index) : i64
    %37 = llvm.mul %4, %36  : i64
    %38 = llvm.mlir.constant(52900 : index) : i64
    %39 = llvm.mul %22, %38  : i64
    %40 = llvm.add %37, %39  : i64
    %41 = llvm.mlir.constant(230 : index) : i64
    %42 = llvm.mul %26, %41  : i64
    %43 = llvm.add %40, %42  : i64
    %44 = llvm.add %43, %34  : i64
    %45 = llvm.getelementptr %35[%44] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %46 = llvm.load %45 : !llvm.ptr -> f32
    %47 = llvm.extractvalue %2[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %48 = llvm.mlir.constant(147 : index) : i64
    %49 = llvm.mul %4, %48  : i64
    %50 = llvm.mlir.constant(49 : index) : i64
    %51 = llvm.mul %22, %50  : i64
    %52 = llvm.add %49, %51  : i64
    %53 = llvm.mlir.constant(7 : index) : i64
    %54 = llvm.mul %26, %53  : i64
    %55 = llvm.add %52, %54  : i64
    %56 = llvm.add %55, %30  : i64
    %57 = llvm.getelementptr %47[%56] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %58 = llvm.load %57 : !llvm.ptr -> f32
    %59 = arith.mulf %46, %58 : f32
    %60 = arith.addf %29, %59 : f32
    %61 = arith.addi %28, %c1 : index
    cf.br ^bb8(%61, %60 : index, f32)
  ^bb10:  // pred: ^bb8
    %62 = arith.addi %24, %c1 : index
    cf.br ^bb6(%62, %29 : index, f32)
  ^bb11:  // pred: ^bb6
    %63 = arith.addi %20, %c1 : index
    cf.br ^bb4(%63, %25 : index, f32)
  ^bb12:  // pred: ^bb4
    %64 = llvm.extractvalue %3[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %65 = llvm.mlir.constant(802816 : index) : i64
    %66 = llvm.mul %4, %65  : i64
    %67 = llvm.mlir.constant(12544 : index) : i64
    %68 = llvm.mul %4, %67  : i64
    %69 = llvm.add %66, %68  : i64
    %70 = llvm.mlir.constant(112 : index) : i64
    %71 = llvm.mul %4, %70  : i64
    %72 = llvm.add %69, %71  : i64
    %73 = llvm.add %72, %6  : i64
    %74 = llvm.getelementptr %64[%73] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %21, %74 : f32, !llvm.ptr
    %75 = arith.addi %5, %c1 : index
    cf.br ^bb2(%75 : index)
  ^bb13:  // pred: ^bb2
    return
  }
}


// -----// IR Dump After ConvertMathToLibm (convert-math-to-libm) //----- //
module {
  func.func @forward_kernel_0(%arg0: memref<1x64x112x112xf32>, %arg1: memref<1x3x230x230xf32>, %arg2: memref<64x3x7x7xf32>, %arg3: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_0} {
    %0 = builtin.unrealized_conversion_cast %arg0 : memref<1x64x112x112xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %1 = builtin.unrealized_conversion_cast %arg1 : memref<1x3x230x230xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %2 = builtin.unrealized_conversion_cast %arg2 : memref<64x3x7x7xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
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
    %8 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %9 = llvm.mlir.constant(802816 : index) : i64
    %10 = llvm.mul %4, %9  : i64
    %11 = llvm.mlir.constant(12544 : index) : i64
    %12 = llvm.mul %4, %11  : i64
    %13 = llvm.add %10, %12  : i64
    %14 = llvm.mlir.constant(112 : index) : i64
    %15 = llvm.mul %4, %14  : i64
    %16 = llvm.add %13, %15  : i64
    %17 = llvm.add %16, %6  : i64
    %18 = llvm.getelementptr %8[%17] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %19 = llvm.load %18 : !llvm.ptr -> f32
    cf.br ^bb4(%c0, %19 : index, f32)
  ^bb4(%20: index, %21: f32):  // 2 preds: ^bb3, ^bb11
    %22 = builtin.unrealized_conversion_cast %20 : index to i64
    %23 = arith.cmpi slt, %20, %c3 : index
    cf.cond_br %23, ^bb5, ^bb12
  ^bb5:  // pred: ^bb4
    cf.br ^bb6(%c0, %21 : index, f32)
  ^bb6(%24: index, %25: f32):  // 2 preds: ^bb5, ^bb10
    %26 = builtin.unrealized_conversion_cast %24 : index to i64
    %27 = arith.cmpi slt, %24, %c7 : index
    cf.cond_br %27, ^bb7, ^bb11
  ^bb7:  // pred: ^bb6
    cf.br ^bb8(%c0, %25 : index, f32)
  ^bb8(%28: index, %29: f32):  // 2 preds: ^bb7, ^bb9
    %30 = builtin.unrealized_conversion_cast %28 : index to i64
    %31 = arith.cmpi slt, %28, %c7 : index
    cf.cond_br %31, ^bb9, ^bb10
  ^bb9:  // pred: ^bb8
    %32 = arith.muli %5, %c2 : index
    %33 = arith.addi %32, %28 : index
    %34 = builtin.unrealized_conversion_cast %33 : index to i64
    %35 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %36 = llvm.mlir.constant(158700 : index) : i64
    %37 = llvm.mul %4, %36  : i64
    %38 = llvm.mlir.constant(52900 : index) : i64
    %39 = llvm.mul %22, %38  : i64
    %40 = llvm.add %37, %39  : i64
    %41 = llvm.mlir.constant(230 : index) : i64
    %42 = llvm.mul %26, %41  : i64
    %43 = llvm.add %40, %42  : i64
    %44 = llvm.add %43, %34  : i64
    %45 = llvm.getelementptr %35[%44] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %46 = llvm.load %45 : !llvm.ptr -> f32
    %47 = llvm.extractvalue %2[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %48 = llvm.mlir.constant(147 : index) : i64
    %49 = llvm.mul %4, %48  : i64
    %50 = llvm.mlir.constant(49 : index) : i64
    %51 = llvm.mul %22, %50  : i64
    %52 = llvm.add %49, %51  : i64
    %53 = llvm.mlir.constant(7 : index) : i64
    %54 = llvm.mul %26, %53  : i64
    %55 = llvm.add %52, %54  : i64
    %56 = llvm.add %55, %30  : i64
    %57 = llvm.getelementptr %47[%56] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %58 = llvm.load %57 : !llvm.ptr -> f32
    %59 = arith.mulf %46, %58 : f32
    %60 = arith.addf %29, %59 : f32
    %61 = arith.addi %28, %c1 : index
    cf.br ^bb8(%61, %60 : index, f32)
  ^bb10:  // pred: ^bb8
    %62 = arith.addi %24, %c1 : index
    cf.br ^bb6(%62, %29 : index, f32)
  ^bb11:  // pred: ^bb6
    %63 = arith.addi %20, %c1 : index
    cf.br ^bb4(%63, %25 : index, f32)
  ^bb12:  // pred: ^bb4
    %64 = llvm.extractvalue %3[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %65 = llvm.mlir.constant(802816 : index) : i64
    %66 = llvm.mul %4, %65  : i64
    %67 = llvm.mlir.constant(12544 : index) : i64
    %68 = llvm.mul %4, %67  : i64
    %69 = llvm.add %66, %68  : i64
    %70 = llvm.mlir.constant(112 : index) : i64
    %71 = llvm.mul %4, %70  : i64
    %72 = llvm.add %69, %71  : i64
    %73 = llvm.add %72, %6  : i64
    %74 = llvm.getelementptr %64[%73] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %21, %74 : f32, !llvm.ptr
    %75 = arith.addi %5, %c1 : index
    cf.br ^bb2(%75 : index)
  ^bb13:  // pred: ^bb2
    return
  }
}


// -----// IR Dump After ArithToLLVMConversionPass (convert-arith-to-llvm) //----- //
module {
  func.func @forward_kernel_0(%arg0: memref<1x64x112x112xf32>, %arg1: memref<1x3x230x230xf32>, %arg2: memref<64x3x7x7xf32>, %arg3: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_0} {
    %0 = builtin.unrealized_conversion_cast %arg0 : memref<1x64x112x112xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %1 = builtin.unrealized_conversion_cast %arg1 : memref<1x3x230x230xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %2 = builtin.unrealized_conversion_cast %arg2 : memref<64x3x7x7xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %3 = builtin.unrealized_conversion_cast %arg3 : memref<1x64x112x112xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %4 = llvm.mlir.constant(2 : index) : i64
    %5 = llvm.mlir.constant(7 : index) : i64
    %6 = llvm.mlir.constant(3 : index) : i64
    %7 = llvm.mlir.constant(1 : index) : i64
    %8 = llvm.mlir.constant(8 : index) : i64
    %9 = llvm.mlir.constant(0 : index) : i64
    %10 = builtin.unrealized_conversion_cast %9 : i64 to index
    %11 = builtin.unrealized_conversion_cast %10 : index to i64
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%10 : index)
  ^bb2(%12: index):  // 2 preds: ^bb1, ^bb12
    %13 = builtin.unrealized_conversion_cast %12 : index to i64
    %14 = builtin.unrealized_conversion_cast %12 : index to i64
    %15 = llvm.icmp "slt" %13, %8 : i64
    cf.cond_br %15, ^bb3, ^bb13
  ^bb3:  // pred: ^bb2
    %16 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %17 = llvm.mlir.constant(802816 : index) : i64
    %18 = llvm.mul %11, %17  : i64
    %19 = llvm.mlir.constant(12544 : index) : i64
    %20 = llvm.mul %11, %19  : i64
    %21 = llvm.add %18, %20  : i64
    %22 = llvm.mlir.constant(112 : index) : i64
    %23 = llvm.mul %11, %22  : i64
    %24 = llvm.add %21, %23  : i64
    %25 = llvm.add %24, %14  : i64
    %26 = llvm.getelementptr %16[%25] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %27 = llvm.load %26 : !llvm.ptr -> f32
    cf.br ^bb4(%10, %27 : index, f32)
  ^bb4(%28: index, %29: f32):  // 2 preds: ^bb3, ^bb11
    %30 = builtin.unrealized_conversion_cast %28 : index to i64
    %31 = builtin.unrealized_conversion_cast %28 : index to i64
    %32 = llvm.icmp "slt" %30, %6 : i64
    cf.cond_br %32, ^bb5, ^bb12
  ^bb5:  // pred: ^bb4
    cf.br ^bb6(%10, %29 : index, f32)
  ^bb6(%33: index, %34: f32):  // 2 preds: ^bb5, ^bb10
    %35 = builtin.unrealized_conversion_cast %33 : index to i64
    %36 = builtin.unrealized_conversion_cast %33 : index to i64
    %37 = llvm.icmp "slt" %35, %5 : i64
    cf.cond_br %37, ^bb7, ^bb11
  ^bb7:  // pred: ^bb6
    cf.br ^bb8(%10, %34 : index, f32)
  ^bb8(%38: index, %39: f32):  // 2 preds: ^bb7, ^bb9
    %40 = builtin.unrealized_conversion_cast %38 : index to i64
    %41 = builtin.unrealized_conversion_cast %38 : index to i64
    %42 = llvm.icmp "slt" %40, %5 : i64
    cf.cond_br %42, ^bb9, ^bb10
  ^bb9:  // pred: ^bb8
    %43 = llvm.mul %13, %4  : i64
    %44 = llvm.add %43, %40  : i64
    %45 = builtin.unrealized_conversion_cast %44 : i64 to index
    %46 = builtin.unrealized_conversion_cast %45 : index to i64
    %47 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %48 = llvm.mlir.constant(158700 : index) : i64
    %49 = llvm.mul %11, %48  : i64
    %50 = llvm.mlir.constant(52900 : index) : i64
    %51 = llvm.mul %31, %50  : i64
    %52 = llvm.add %49, %51  : i64
    %53 = llvm.mlir.constant(230 : index) : i64
    %54 = llvm.mul %36, %53  : i64
    %55 = llvm.add %52, %54  : i64
    %56 = llvm.add %55, %46  : i64
    %57 = llvm.getelementptr %47[%56] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %58 = llvm.load %57 : !llvm.ptr -> f32
    %59 = llvm.extractvalue %2[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %60 = llvm.mlir.constant(147 : index) : i64
    %61 = llvm.mul %11, %60  : i64
    %62 = llvm.mlir.constant(49 : index) : i64
    %63 = llvm.mul %31, %62  : i64
    %64 = llvm.add %61, %63  : i64
    %65 = llvm.mlir.constant(7 : index) : i64
    %66 = llvm.mul %36, %65  : i64
    %67 = llvm.add %64, %66  : i64
    %68 = llvm.add %67, %41  : i64
    %69 = llvm.getelementptr %59[%68] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %70 = llvm.load %69 : !llvm.ptr -> f32
    %71 = llvm.fmul %58, %70  : f32
    %72 = llvm.fadd %39, %71  : f32
    %73 = llvm.add %40, %7  : i64
    %74 = builtin.unrealized_conversion_cast %73 : i64 to index
    cf.br ^bb8(%74, %72 : index, f32)
  ^bb10:  // pred: ^bb8
    %75 = llvm.add %35, %7  : i64
    %76 = builtin.unrealized_conversion_cast %75 : i64 to index
    cf.br ^bb6(%76, %39 : index, f32)
  ^bb11:  // pred: ^bb6
    %77 = llvm.add %30, %7  : i64
    %78 = builtin.unrealized_conversion_cast %77 : i64 to index
    cf.br ^bb4(%78, %34 : index, f32)
  ^bb12:  // pred: ^bb4
    %79 = llvm.extractvalue %3[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %80 = llvm.mlir.constant(802816 : index) : i64
    %81 = llvm.mul %11, %80  : i64
    %82 = llvm.mlir.constant(12544 : index) : i64
    %83 = llvm.mul %11, %82  : i64
    %84 = llvm.add %81, %83  : i64
    %85 = llvm.mlir.constant(112 : index) : i64
    %86 = llvm.mul %11, %85  : i64
    %87 = llvm.add %84, %86  : i64
    %88 = llvm.add %87, %14  : i64
    %89 = llvm.getelementptr %79[%88] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %29, %89 : f32, !llvm.ptr
    %90 = llvm.add %13, %7  : i64
    %91 = builtin.unrealized_conversion_cast %90 : i64 to index
    cf.br ^bb2(%91 : index)
  ^bb13:  // pred: ^bb2
    return
  }
}


// -----// IR Dump After ConvertFuncToLLVMPass (convert-func-to-llvm) //----- //
module attributes {llvm.data_layout = ""} {
  llvm.func @forward_kernel_0(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr, %arg3: !llvm.ptr) attributes {Kernel, forward_kernel_0} {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %5 = llvm.mlir.constant(1 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %7 = llvm.mlir.constant(802816 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %9 = llvm.mlir.constant(64 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %11 = llvm.mlir.constant(12544 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %13 = llvm.mlir.constant(112 : index) : i64
    %14 = llvm.insertvalue %13, %12[3, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %15 = llvm.mlir.constant(112 : index) : i64
    %16 = llvm.insertvalue %15, %14[4, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %17 = llvm.mlir.constant(112 : index) : i64
    %18 = llvm.insertvalue %17, %16[3, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %19 = llvm.mlir.constant(1 : index) : i64
    %20 = llvm.insertvalue %19, %18[4, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %21 = builtin.unrealized_conversion_cast %20 : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> to memref<1x64x112x112xf32>
    %22 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %23 = llvm.insertvalue %arg1, %22[0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %24 = llvm.insertvalue %arg1, %23[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %25 = llvm.mlir.constant(0 : index) : i64
    %26 = llvm.insertvalue %25, %24[2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %27 = llvm.mlir.constant(1 : index) : i64
    %28 = llvm.insertvalue %27, %26[3, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %29 = llvm.mlir.constant(158700 : index) : i64
    %30 = llvm.insertvalue %29, %28[4, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %31 = llvm.mlir.constant(3 : index) : i64
    %32 = llvm.insertvalue %31, %30[3, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %33 = llvm.mlir.constant(52900 : index) : i64
    %34 = llvm.insertvalue %33, %32[4, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %35 = llvm.mlir.constant(230 : index) : i64
    %36 = llvm.insertvalue %35, %34[3, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %37 = llvm.mlir.constant(230 : index) : i64
    %38 = llvm.insertvalue %37, %36[4, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %39 = llvm.mlir.constant(230 : index) : i64
    %40 = llvm.insertvalue %39, %38[3, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %41 = llvm.mlir.constant(1 : index) : i64
    %42 = llvm.insertvalue %41, %40[4, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %43 = builtin.unrealized_conversion_cast %42 : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> to memref<1x3x230x230xf32>
    %44 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %45 = llvm.insertvalue %arg2, %44[0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %46 = llvm.insertvalue %arg2, %45[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %47 = llvm.mlir.constant(0 : index) : i64
    %48 = llvm.insertvalue %47, %46[2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %49 = llvm.mlir.constant(64 : index) : i64
    %50 = llvm.insertvalue %49, %48[3, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %51 = llvm.mlir.constant(147 : index) : i64
    %52 = llvm.insertvalue %51, %50[4, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %53 = llvm.mlir.constant(3 : index) : i64
    %54 = llvm.insertvalue %53, %52[3, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %55 = llvm.mlir.constant(49 : index) : i64
    %56 = llvm.insertvalue %55, %54[4, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %57 = llvm.mlir.constant(7 : index) : i64
    %58 = llvm.insertvalue %57, %56[3, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %59 = llvm.mlir.constant(7 : index) : i64
    %60 = llvm.insertvalue %59, %58[4, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %61 = llvm.mlir.constant(7 : index) : i64
    %62 = llvm.insertvalue %61, %60[3, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %63 = llvm.mlir.constant(1 : index) : i64
    %64 = llvm.insertvalue %63, %62[4, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %65 = builtin.unrealized_conversion_cast %64 : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> to memref<64x3x7x7xf32>
    %66 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %67 = llvm.insertvalue %arg3, %66[0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %68 = llvm.insertvalue %arg3, %67[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %69 = llvm.mlir.constant(0 : index) : i64
    %70 = llvm.insertvalue %69, %68[2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %71 = llvm.mlir.constant(1 : index) : i64
    %72 = llvm.insertvalue %71, %70[3, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %73 = llvm.mlir.constant(802816 : index) : i64
    %74 = llvm.insertvalue %73, %72[4, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %75 = llvm.mlir.constant(64 : index) : i64
    %76 = llvm.insertvalue %75, %74[3, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %77 = llvm.mlir.constant(12544 : index) : i64
    %78 = llvm.insertvalue %77, %76[4, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %79 = llvm.mlir.constant(112 : index) : i64
    %80 = llvm.insertvalue %79, %78[3, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %81 = llvm.mlir.constant(112 : index) : i64
    %82 = llvm.insertvalue %81, %80[4, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %83 = llvm.mlir.constant(112 : index) : i64
    %84 = llvm.insertvalue %83, %82[3, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %85 = llvm.mlir.constant(1 : index) : i64
    %86 = llvm.insertvalue %85, %84[4, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %87 = builtin.unrealized_conversion_cast %86 : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> to memref<1x64x112x112xf32>
    %88 = builtin.unrealized_conversion_cast %21 : memref<1x64x112x112xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %89 = builtin.unrealized_conversion_cast %43 : memref<1x3x230x230xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %90 = builtin.unrealized_conversion_cast %65 : memref<64x3x7x7xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %91 = builtin.unrealized_conversion_cast %87 : memref<1x64x112x112xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %92 = llvm.mlir.constant(2 : index) : i64
    %93 = llvm.mlir.constant(7 : index) : i64
    %94 = llvm.mlir.constant(3 : index) : i64
    %95 = llvm.mlir.constant(1 : index) : i64
    %96 = llvm.mlir.constant(8 : index) : i64
    %97 = llvm.mlir.constant(0 : index) : i64
    %98 = builtin.unrealized_conversion_cast %97 : i64 to index
    %99 = builtin.unrealized_conversion_cast %98 : index to i64
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%97 : i64)
  ^bb2(%100: i64):  // 2 preds: ^bb1, ^bb12
    %101 = builtin.unrealized_conversion_cast %100 : i64 to index
    %102 = builtin.unrealized_conversion_cast %101 : index to i64
    %103 = builtin.unrealized_conversion_cast %101 : index to i64
    %104 = llvm.icmp "slt" %102, %96 : i64
    llvm.cond_br %104, ^bb3, ^bb13
  ^bb3:  // pred: ^bb2
    %105 = llvm.extractvalue %88[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %106 = llvm.mlir.constant(802816 : index) : i64
    %107 = llvm.mul %99, %106  : i64
    %108 = llvm.mlir.constant(12544 : index) : i64
    %109 = llvm.mul %99, %108  : i64
    %110 = llvm.add %107, %109  : i64
    %111 = llvm.mlir.constant(112 : index) : i64
    %112 = llvm.mul %99, %111  : i64
    %113 = llvm.add %110, %112  : i64
    %114 = llvm.add %113, %103  : i64
    %115 = llvm.getelementptr %105[%114] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %116 = llvm.load %115 : !llvm.ptr -> f32
    llvm.br ^bb4(%97, %116 : i64, f32)
  ^bb4(%117: i64, %118: f32):  // 2 preds: ^bb3, ^bb11
    %119 = builtin.unrealized_conversion_cast %117 : i64 to index
    %120 = builtin.unrealized_conversion_cast %119 : index to i64
    %121 = builtin.unrealized_conversion_cast %119 : index to i64
    %122 = llvm.icmp "slt" %120, %94 : i64
    llvm.cond_br %122, ^bb5, ^bb12
  ^bb5:  // pred: ^bb4
    llvm.br ^bb6(%97, %118 : i64, f32)
  ^bb6(%123: i64, %124: f32):  // 2 preds: ^bb5, ^bb10
    %125 = builtin.unrealized_conversion_cast %123 : i64 to index
    %126 = builtin.unrealized_conversion_cast %125 : index to i64
    %127 = builtin.unrealized_conversion_cast %125 : index to i64
    %128 = llvm.icmp "slt" %126, %93 : i64
    llvm.cond_br %128, ^bb7, ^bb11
  ^bb7:  // pred: ^bb6
    llvm.br ^bb8(%97, %124 : i64, f32)
  ^bb8(%129: i64, %130: f32):  // 2 preds: ^bb7, ^bb9
    %131 = builtin.unrealized_conversion_cast %129 : i64 to index
    %132 = builtin.unrealized_conversion_cast %131 : index to i64
    %133 = builtin.unrealized_conversion_cast %131 : index to i64
    %134 = llvm.icmp "slt" %132, %93 : i64
    llvm.cond_br %134, ^bb9, ^bb10
  ^bb9:  // pred: ^bb8
    %135 = llvm.mul %102, %92  : i64
    %136 = llvm.add %135, %132  : i64
    %137 = builtin.unrealized_conversion_cast %136 : i64 to index
    %138 = builtin.unrealized_conversion_cast %137 : index to i64
    %139 = llvm.extractvalue %89[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %140 = llvm.mlir.constant(158700 : index) : i64
    %141 = llvm.mul %99, %140  : i64
    %142 = llvm.mlir.constant(52900 : index) : i64
    %143 = llvm.mul %121, %142  : i64
    %144 = llvm.add %141, %143  : i64
    %145 = llvm.mlir.constant(230 : index) : i64
    %146 = llvm.mul %127, %145  : i64
    %147 = llvm.add %144, %146  : i64
    %148 = llvm.add %147, %138  : i64
    %149 = llvm.getelementptr %139[%148] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %150 = llvm.load %149 : !llvm.ptr -> f32
    %151 = llvm.extractvalue %90[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %152 = llvm.mlir.constant(147 : index) : i64
    %153 = llvm.mul %99, %152  : i64
    %154 = llvm.mlir.constant(49 : index) : i64
    %155 = llvm.mul %121, %154  : i64
    %156 = llvm.add %153, %155  : i64
    %157 = llvm.mlir.constant(7 : index) : i64
    %158 = llvm.mul %127, %157  : i64
    %159 = llvm.add %156, %158  : i64
    %160 = llvm.add %159, %133  : i64
    %161 = llvm.getelementptr %151[%160] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %162 = llvm.load %161 : !llvm.ptr -> f32
    %163 = llvm.fmul %150, %162  : f32
    %164 = llvm.fadd %130, %163  : f32
    %165 = llvm.add %132, %95  : i64
    %166 = builtin.unrealized_conversion_cast %165 : i64 to index
    llvm.br ^bb8(%165, %164 : i64, f32)
  ^bb10:  // pred: ^bb8
    %167 = llvm.add %126, %95  : i64
    %168 = builtin.unrealized_conversion_cast %167 : i64 to index
    llvm.br ^bb6(%167, %130 : i64, f32)
  ^bb11:  // pred: ^bb6
    %169 = llvm.add %120, %95  : i64
    %170 = builtin.unrealized_conversion_cast %169 : i64 to index
    llvm.br ^bb4(%169, %124 : i64, f32)
  ^bb12:  // pred: ^bb4
    %171 = llvm.extractvalue %91[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %172 = llvm.mlir.constant(802816 : index) : i64
    %173 = llvm.mul %99, %172  : i64
    %174 = llvm.mlir.constant(12544 : index) : i64
    %175 = llvm.mul %99, %174  : i64
    %176 = llvm.add %173, %175  : i64
    %177 = llvm.mlir.constant(112 : index) : i64
    %178 = llvm.mul %99, %177  : i64
    %179 = llvm.add %176, %178  : i64
    %180 = llvm.add %179, %103  : i64
    %181 = llvm.getelementptr %171[%180] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %118, %181 : f32, !llvm.ptr
    %182 = llvm.add %102, %95  : i64
    %183 = builtin.unrealized_conversion_cast %182 : i64 to index
    llvm.br ^bb2(%182 : i64)
  ^bb13:  // pred: ^bb2
    llvm.return
  }
}


// -----// IR Dump After ReconcileUnrealizedCasts (reconcile-unrealized-casts) //----- //
module attributes {llvm.data_layout = ""} {
  llvm.func @forward_kernel_0(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr, %arg3: !llvm.ptr) attributes {Kernel, forward_kernel_0} {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %5 = llvm.mlir.constant(1 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %7 = llvm.mlir.constant(802816 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %9 = llvm.mlir.constant(64 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %11 = llvm.mlir.constant(12544 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %13 = llvm.mlir.constant(112 : index) : i64
    %14 = llvm.insertvalue %13, %12[3, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %15 = llvm.mlir.constant(112 : index) : i64
    %16 = llvm.insertvalue %15, %14[4, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %17 = llvm.mlir.constant(112 : index) : i64
    %18 = llvm.insertvalue %17, %16[3, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %19 = llvm.mlir.constant(1 : index) : i64
    %20 = llvm.insertvalue %19, %18[4, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %21 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %22 = llvm.insertvalue %arg1, %21[0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %23 = llvm.insertvalue %arg1, %22[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %24 = llvm.mlir.constant(0 : index) : i64
    %25 = llvm.insertvalue %24, %23[2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %26 = llvm.mlir.constant(1 : index) : i64
    %27 = llvm.insertvalue %26, %25[3, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %28 = llvm.mlir.constant(158700 : index) : i64
    %29 = llvm.insertvalue %28, %27[4, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %30 = llvm.mlir.constant(3 : index) : i64
    %31 = llvm.insertvalue %30, %29[3, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %32 = llvm.mlir.constant(52900 : index) : i64
    %33 = llvm.insertvalue %32, %31[4, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %34 = llvm.mlir.constant(230 : index) : i64
    %35 = llvm.insertvalue %34, %33[3, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %36 = llvm.mlir.constant(230 : index) : i64
    %37 = llvm.insertvalue %36, %35[4, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %38 = llvm.mlir.constant(230 : index) : i64
    %39 = llvm.insertvalue %38, %37[3, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %40 = llvm.mlir.constant(1 : index) : i64
    %41 = llvm.insertvalue %40, %39[4, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %42 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %43 = llvm.insertvalue %arg2, %42[0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %44 = llvm.insertvalue %arg2, %43[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %45 = llvm.mlir.constant(0 : index) : i64
    %46 = llvm.insertvalue %45, %44[2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %47 = llvm.mlir.constant(64 : index) : i64
    %48 = llvm.insertvalue %47, %46[3, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %49 = llvm.mlir.constant(147 : index) : i64
    %50 = llvm.insertvalue %49, %48[4, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %51 = llvm.mlir.constant(3 : index) : i64
    %52 = llvm.insertvalue %51, %50[3, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %53 = llvm.mlir.constant(49 : index) : i64
    %54 = llvm.insertvalue %53, %52[4, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %55 = llvm.mlir.constant(7 : index) : i64
    %56 = llvm.insertvalue %55, %54[3, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %57 = llvm.mlir.constant(7 : index) : i64
    %58 = llvm.insertvalue %57, %56[4, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %59 = llvm.mlir.constant(7 : index) : i64
    %60 = llvm.insertvalue %59, %58[3, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %61 = llvm.mlir.constant(1 : index) : i64
    %62 = llvm.insertvalue %61, %60[4, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %63 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %64 = llvm.insertvalue %arg3, %63[0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %65 = llvm.insertvalue %arg3, %64[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %66 = llvm.mlir.constant(0 : index) : i64
    %67 = llvm.insertvalue %66, %65[2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %68 = llvm.mlir.constant(1 : index) : i64
    %69 = llvm.insertvalue %68, %67[3, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %70 = llvm.mlir.constant(802816 : index) : i64
    %71 = llvm.insertvalue %70, %69[4, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %72 = llvm.mlir.constant(64 : index) : i64
    %73 = llvm.insertvalue %72, %71[3, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %74 = llvm.mlir.constant(12544 : index) : i64
    %75 = llvm.insertvalue %74, %73[4, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %76 = llvm.mlir.constant(112 : index) : i64
    %77 = llvm.insertvalue %76, %75[3, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %78 = llvm.mlir.constant(112 : index) : i64
    %79 = llvm.insertvalue %78, %77[4, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %80 = llvm.mlir.constant(112 : index) : i64
    %81 = llvm.insertvalue %80, %79[3, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %82 = llvm.mlir.constant(1 : index) : i64
    %83 = llvm.insertvalue %82, %81[4, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %84 = llvm.mlir.constant(2 : index) : i64
    %85 = llvm.mlir.constant(7 : index) : i64
    %86 = llvm.mlir.constant(3 : index) : i64
    %87 = llvm.mlir.constant(1 : index) : i64
    %88 = llvm.mlir.constant(8 : index) : i64
    %89 = llvm.mlir.constant(0 : index) : i64
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%89 : i64)
  ^bb2(%90: i64):  // 2 preds: ^bb1, ^bb12
    %91 = llvm.icmp "slt" %90, %88 : i64
    llvm.cond_br %91, ^bb3, ^bb13
  ^bb3:  // pred: ^bb2
    %92 = llvm.extractvalue %20[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %93 = llvm.mlir.constant(802816 : index) : i64
    %94 = llvm.mul %89, %93  : i64
    %95 = llvm.mlir.constant(12544 : index) : i64
    %96 = llvm.mul %89, %95  : i64
    %97 = llvm.add %94, %96  : i64
    %98 = llvm.mlir.constant(112 : index) : i64
    %99 = llvm.mul %89, %98  : i64
    %100 = llvm.add %97, %99  : i64
    %101 = llvm.add %100, %90  : i64
    %102 = llvm.getelementptr %92[%101] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %103 = llvm.load %102 : !llvm.ptr -> f32
    llvm.br ^bb4(%89, %103 : i64, f32)
  ^bb4(%104: i64, %105: f32):  // 2 preds: ^bb3, ^bb11
    %106 = llvm.icmp "slt" %104, %86 : i64
    llvm.cond_br %106, ^bb5, ^bb12
  ^bb5:  // pred: ^bb4
    llvm.br ^bb6(%89, %105 : i64, f32)
  ^bb6(%107: i64, %108: f32):  // 2 preds: ^bb5, ^bb10
    %109 = llvm.icmp "slt" %107, %85 : i64
    llvm.cond_br %109, ^bb7, ^bb11
  ^bb7:  // pred: ^bb6
    llvm.br ^bb8(%89, %108 : i64, f32)
  ^bb8(%110: i64, %111: f32):  // 2 preds: ^bb7, ^bb9
    %112 = llvm.icmp "slt" %110, %85 : i64
    llvm.cond_br %112, ^bb9, ^bb10
  ^bb9:  // pred: ^bb8
    %113 = llvm.mul %90, %84  : i64
    %114 = llvm.add %113, %110  : i64
    %115 = llvm.extractvalue %41[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %116 = llvm.mlir.constant(158700 : index) : i64
    %117 = llvm.mul %89, %116  : i64
    %118 = llvm.mlir.constant(52900 : index) : i64
    %119 = llvm.mul %104, %118  : i64
    %120 = llvm.add %117, %119  : i64
    %121 = llvm.mlir.constant(230 : index) : i64
    %122 = llvm.mul %107, %121  : i64
    %123 = llvm.add %120, %122  : i64
    %124 = llvm.add %123, %114  : i64
    %125 = llvm.getelementptr %115[%124] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %126 = llvm.load %125 : !llvm.ptr -> f32
    %127 = llvm.extractvalue %62[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %128 = llvm.mlir.constant(147 : index) : i64
    %129 = llvm.mul %89, %128  : i64
    %130 = llvm.mlir.constant(49 : index) : i64
    %131 = llvm.mul %104, %130  : i64
    %132 = llvm.add %129, %131  : i64
    %133 = llvm.mlir.constant(7 : index) : i64
    %134 = llvm.mul %107, %133  : i64
    %135 = llvm.add %132, %134  : i64
    %136 = llvm.add %135, %110  : i64
    %137 = llvm.getelementptr %127[%136] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %138 = llvm.load %137 : !llvm.ptr -> f32
    %139 = llvm.fmul %126, %138  : f32
    %140 = llvm.fadd %111, %139  : f32
    %141 = llvm.add %110, %87  : i64
    llvm.br ^bb8(%141, %140 : i64, f32)
  ^bb10:  // pred: ^bb8
    %142 = llvm.add %107, %87  : i64
    llvm.br ^bb6(%142, %111 : i64, f32)
  ^bb11:  // pred: ^bb6
    %143 = llvm.add %104, %87  : i64
    llvm.br ^bb4(%143, %108 : i64, f32)
  ^bb12:  // pred: ^bb4
    %144 = llvm.extractvalue %83[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %145 = llvm.mlir.constant(802816 : index) : i64
    %146 = llvm.mul %89, %145  : i64
    %147 = llvm.mlir.constant(12544 : index) : i64
    %148 = llvm.mul %89, %147  : i64
    %149 = llvm.add %146, %148  : i64
    %150 = llvm.mlir.constant(112 : index) : i64
    %151 = llvm.mul %89, %150  : i64
    %152 = llvm.add %149, %151  : i64
    %153 = llvm.add %152, %90  : i64
    %154 = llvm.getelementptr %144[%153] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %105, %154 : f32, !llvm.ptr
    %155 = llvm.add %90, %87  : i64
    llvm.br ^bb2(%155 : i64)
  ^bb13:  // pred: ^bb2
    llvm.return
  }
}


// -----// IR Dump After Canonicalizer (canonicalize) //----- //
module attributes {llvm.data_layout = ""} {
  llvm.func @forward_kernel_0(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr, %arg3: !llvm.ptr) attributes {Kernel, forward_kernel_0} {
    %0 = llvm.mlir.constant(8 : index) : i64
    %1 = llvm.mlir.constant(2 : index) : i64
    %2 = llvm.mlir.constant(7 : index) : i64
    %3 = llvm.mlir.constant(49 : index) : i64
    %4 = llvm.mlir.constant(147 : index) : i64
    %5 = llvm.mlir.constant(230 : index) : i64
    %6 = llvm.mlir.constant(52900 : index) : i64
    %7 = llvm.mlir.constant(3 : index) : i64
    %8 = llvm.mlir.constant(158700 : index) : i64
    %9 = llvm.mlir.constant(112 : index) : i64
    %10 = llvm.mlir.constant(12544 : index) : i64
    %11 = llvm.mlir.constant(802816 : index) : i64
    %12 = llvm.mlir.constant(1 : index) : i64
    %13 = llvm.mlir.constant(0 : index) : i64
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%13 : i64)
  ^bb2(%14: i64):  // 2 preds: ^bb1, ^bb12
    %15 = llvm.icmp "slt" %14, %0 : i64
    llvm.cond_br %15, ^bb3, ^bb13
  ^bb3:  // pred: ^bb2
    %16 = llvm.mul %13, %11  : i64
    %17 = llvm.mul %13, %10  : i64
    %18 = llvm.add %16, %17  : i64
    %19 = llvm.mul %13, %9  : i64
    %20 = llvm.add %18, %19  : i64
    %21 = llvm.add %20, %14  : i64
    %22 = llvm.getelementptr %arg0[%21] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %23 = llvm.load %22 : !llvm.ptr -> f32
    llvm.br ^bb4(%13, %23 : i64, f32)
  ^bb4(%24: i64, %25: f32):  // 2 preds: ^bb3, ^bb11
    %26 = llvm.icmp "slt" %24, %7 : i64
    llvm.cond_br %26, ^bb5, ^bb12
  ^bb5:  // pred: ^bb4
    llvm.br ^bb6(%13, %25 : i64, f32)
  ^bb6(%27: i64, %28: f32):  // 2 preds: ^bb5, ^bb10
    %29 = llvm.icmp "slt" %27, %2 : i64
    llvm.cond_br %29, ^bb7, ^bb11
  ^bb7:  // pred: ^bb6
    llvm.br ^bb8(%13, %28 : i64, f32)
  ^bb8(%30: i64, %31: f32):  // 2 preds: ^bb7, ^bb9
    %32 = llvm.icmp "slt" %30, %2 : i64
    llvm.cond_br %32, ^bb9, ^bb10
  ^bb9:  // pred: ^bb8
    %33 = llvm.mul %14, %1  : i64
    %34 = llvm.add %33, %30  : i64
    %35 = llvm.mul %13, %8  : i64
    %36 = llvm.mul %24, %6  : i64
    %37 = llvm.add %35, %36  : i64
    %38 = llvm.mul %27, %5  : i64
    %39 = llvm.add %37, %38  : i64
    %40 = llvm.add %39, %34  : i64
    %41 = llvm.getelementptr %arg1[%40] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %42 = llvm.load %41 : !llvm.ptr -> f32
    %43 = llvm.mul %13, %4  : i64
    %44 = llvm.mul %24, %3  : i64
    %45 = llvm.add %43, %44  : i64
    %46 = llvm.mul %27, %2  : i64
    %47 = llvm.add %45, %46  : i64
    %48 = llvm.add %47, %30  : i64
    %49 = llvm.getelementptr %arg2[%48] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %50 = llvm.load %49 : !llvm.ptr -> f32
    %51 = llvm.fmul %42, %50  : f32
    %52 = llvm.fadd %31, %51  : f32
    %53 = llvm.add %30, %12  : i64
    llvm.br ^bb8(%53, %52 : i64, f32)
  ^bb10:  // pred: ^bb8
    %54 = llvm.add %27, %12  : i64
    llvm.br ^bb6(%54, %31 : i64, f32)
  ^bb11:  // pred: ^bb6
    %55 = llvm.add %24, %12  : i64
    llvm.br ^bb4(%55, %28 : i64, f32)
  ^bb12:  // pred: ^bb4
    %56 = llvm.mul %13, %11  : i64
    %57 = llvm.mul %13, %10  : i64
    %58 = llvm.add %56, %57  : i64
    %59 = llvm.mul %13, %9  : i64
    %60 = llvm.add %58, %59  : i64
    %61 = llvm.add %60, %14  : i64
    %62 = llvm.getelementptr %arg3[%61] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %25, %62 : f32, !llvm.ptr
    %63 = llvm.add %14, %12  : i64
    llvm.br ^bb2(%63 : i64)
  ^bb13:  // pred: ^bb2
    llvm.return
  }
}


