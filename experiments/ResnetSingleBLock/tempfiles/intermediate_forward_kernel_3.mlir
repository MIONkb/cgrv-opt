// -----// IR Dump After ArithExpandOps (arith-expand) //----- //
module {
  func.func @forward_kernel_3(%arg0: memref<1x64x56x56xf32>, %arg1: memref<1x64x114x114xf32>, %arg2: memref<1x64x56x56xf32>) attributes {Kernel, forward_kernel_3} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    affine.for %arg3 = 0 to 4 {
      affine.for %arg4 = 0 to 56 {
        %0 = affine.load %arg0[0, 0, %arg3, %arg4] : memref<1x64x56x56xf32>
        %1 = affine.for %arg5 = 0 to 3 iter_args(%arg6 = %0) -> (f32) {
          %2 = affine.for %arg7 = 0 to 3 iter_args(%arg8 = %arg6) -> (f32) {
            %3 = affine.load %arg1[0, 0, %arg3 * 2 + %arg5, %arg4 * 2 + %arg7] : memref<1x64x114x114xf32>
            %4 = arith.cmpf ugt, %arg8, %3 : f32
            %5 = arith.select %4, %arg8, %3 : f32
            affine.yield %5 : f32
          }
          affine.yield %2 : f32
        }
        affine.store %1, %arg2[0, 0, %arg3, %arg4] : memref<1x64x56x56xf32>
      }
    }
    return
  }
}


// -----// IR Dump After ExpandOps (memref-expand) //----- //
module {
  func.func @forward_kernel_3(%arg0: memref<1x64x56x56xf32>, %arg1: memref<1x64x114x114xf32>, %arg2: memref<1x64x56x56xf32>) attributes {Kernel, forward_kernel_3} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    affine.for %arg3 = 0 to 4 {
      affine.for %arg4 = 0 to 56 {
        %0 = affine.load %arg0[0, 0, %arg3, %arg4] : memref<1x64x56x56xf32>
        %1 = affine.for %arg5 = 0 to 3 iter_args(%arg6 = %0) -> (f32) {
          %2 = affine.for %arg7 = 0 to 3 iter_args(%arg8 = %arg6) -> (f32) {
            %3 = affine.load %arg1[0, 0, %arg3 * 2 + %arg5, %arg4 * 2 + %arg7] : memref<1x64x114x114xf32>
            %4 = arith.cmpf ugt, %arg8, %3 : f32
            %5 = arith.select %4, %arg8, %3 : f32
            affine.yield %5 : f32
          }
          affine.yield %2 : f32
        }
        affine.store %1, %arg2[0, 0, %arg3, %arg4] : memref<1x64x56x56xf32>
      }
    }
    return
  }
}


// -----// IR Dump After SimplifyAffineStructures (affine-simplify-structures) //----- //
func.func @forward_kernel_3(%arg0: memref<1x64x56x56xf32>, %arg1: memref<1x64x114x114xf32>, %arg2: memref<1x64x56x56xf32>) attributes {Kernel, forward_kernel_3} {
  cf.br ^bb1
^bb1:  // pred: ^bb0
  affine.for %arg3 = 0 to 4 {
    affine.for %arg4 = 0 to 56 {
      %0 = affine.load %arg0[0, 0, %arg3, %arg4] : memref<1x64x56x56xf32>
      %1 = affine.for %arg5 = 0 to 3 iter_args(%arg6 = %0) -> (f32) {
        %2 = affine.for %arg7 = 0 to 3 iter_args(%arg8 = %arg6) -> (f32) {
          %3 = affine.load %arg1[0, 0, %arg3 * 2 + %arg5, %arg4 * 2 + %arg7] : memref<1x64x114x114xf32>
          %4 = arith.cmpf ugt, %arg8, %3 : f32
          %5 = arith.select %4, %arg8, %3 : f32
          affine.yield %5 : f32
        }
        affine.yield %2 : f32
      }
      affine.store %1, %arg2[0, 0, %arg3, %arg4] : memref<1x64x56x56xf32>
    }
  }
  return
}

// -----// IR Dump After ConvertAffineToStandard (lower-affine) //----- //
module {
  func.func @forward_kernel_3(%arg0: memref<1x64x56x56xf32>, %arg1: memref<1x64x114x114xf32>, %arg2: memref<1x64x56x56xf32>) attributes {Kernel, forward_kernel_3} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %c1 = arith.constant 1 : index
    scf.for %arg3 = %c0 to %c4 step %c1 {
      %c0_0 = arith.constant 0 : index
      %c56 = arith.constant 56 : index
      %c1_1 = arith.constant 1 : index
      scf.for %arg4 = %c0_0 to %c56 step %c1_1 {
        %c0_2 = arith.constant 0 : index
        %c0_3 = arith.constant 0 : index
        %0 = memref.load %arg0[%c0_2, %c0_3, %arg3, %arg4] : memref<1x64x56x56xf32>
        %c0_4 = arith.constant 0 : index
        %c3 = arith.constant 3 : index
        %c1_5 = arith.constant 1 : index
        %1 = scf.for %arg5 = %c0_4 to %c3 step %c1_5 iter_args(%arg6 = %0) -> (f32) {
          %c0_8 = arith.constant 0 : index
          %c3_9 = arith.constant 3 : index
          %c1_10 = arith.constant 1 : index
          %2 = scf.for %arg7 = %c0_8 to %c3_9 step %c1_10 iter_args(%arg8 = %arg6) -> (f32) {
            %c0_11 = arith.constant 0 : index
            %c0_12 = arith.constant 0 : index
            %c2 = arith.constant 2 : index
            %3 = arith.muli %arg3, %c2 : index
            %4 = arith.addi %3, %arg5 : index
            %c2_13 = arith.constant 2 : index
            %5 = arith.muli %arg4, %c2_13 : index
            %6 = arith.addi %5, %arg7 : index
            %7 = memref.load %arg1[%c0_11, %c0_12, %4, %6] : memref<1x64x114x114xf32>
            %8 = arith.cmpf ugt, %arg8, %7 : f32
            %9 = arith.select %8, %arg8, %7 : f32
            scf.yield %9 : f32
          }
          scf.yield %2 : f32
        }
        %c0_6 = arith.constant 0 : index
        %c0_7 = arith.constant 0 : index
        memref.store %1, %arg2[%c0_6, %c0_7, %arg3, %arg4] : memref<1x64x56x56xf32>
      }
    }
    return
  }
}


// -----// IR Dump After SCFForLoopCanonicalization (scf-for-loop-canonicalization) //----- //
module {
  func.func @forward_kernel_3(%arg0: memref<1x64x56x56xf32>, %arg1: memref<1x64x114x114xf32>, %arg2: memref<1x64x56x56xf32>) attributes {Kernel, forward_kernel_3} {
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %c56 = arith.constant 56 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c0 = arith.constant 0 : index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    scf.for %arg3 = %c0 to %c4 step %c1 {
      scf.for %arg4 = %c0 to %c56 step %c1 {
        %0 = memref.load %arg0[%c0, %c0, %arg3, %arg4] : memref<1x64x56x56xf32>
        %1 = scf.for %arg5 = %c0 to %c3 step %c1 iter_args(%arg6 = %0) -> (f32) {
          %2 = scf.for %arg7 = %c0 to %c3 step %c1 iter_args(%arg8 = %arg6) -> (f32) {
            %3 = arith.muli %arg3, %c2 : index
            %4 = arith.addi %3, %arg5 : index
            %5 = arith.muli %arg4, %c2 : index
            %6 = arith.addi %5, %arg7 : index
            %7 = memref.load %arg1[%c0, %c0, %4, %6] : memref<1x64x114x114xf32>
            %8 = arith.cmpf ugt, %arg8, %7 : f32
            %9 = arith.select %8, %arg8, %7 : f32
            scf.yield %9 : f32
          }
          scf.yield %2 : f32
        }
        memref.store %1, %arg2[%c0, %c0, %arg3, %arg4] : memref<1x64x56x56xf32>
      }
    }
    return
  }
}


// -----// IR Dump After SCFToControlFlow (convert-scf-to-cf) //----- //
module {
  func.func @forward_kernel_3(%arg0: memref<1x64x56x56xf32>, %arg1: memref<1x64x114x114xf32>, %arg2: memref<1x64x56x56xf32>) attributes {Kernel, forward_kernel_3} {
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %c56 = arith.constant 56 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c0 = arith.constant 0 : index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%c0 : index)
  ^bb2(%0: index):  // 2 preds: ^bb1, ^bb12
    %1 = arith.cmpi slt, %0, %c4 : index
    cf.cond_br %1, ^bb3, ^bb13
  ^bb3:  // pred: ^bb2
    cf.br ^bb4(%c0 : index)
  ^bb4(%2: index):  // 2 preds: ^bb3, ^bb11
    %3 = arith.cmpi slt, %2, %c56 : index
    cf.cond_br %3, ^bb5, ^bb12
  ^bb5:  // pred: ^bb4
    %4 = memref.load %arg0[%c0, %c0, %0, %2] : memref<1x64x56x56xf32>
    cf.br ^bb6(%c0, %4 : index, f32)
  ^bb6(%5: index, %6: f32):  // 2 preds: ^bb5, ^bb10
    %7 = arith.cmpi slt, %5, %c3 : index
    cf.cond_br %7, ^bb7, ^bb11
  ^bb7:  // pred: ^bb6
    cf.br ^bb8(%c0, %6 : index, f32)
  ^bb8(%8: index, %9: f32):  // 2 preds: ^bb7, ^bb9
    %10 = arith.cmpi slt, %8, %c3 : index
    cf.cond_br %10, ^bb9, ^bb10
  ^bb9:  // pred: ^bb8
    %11 = arith.muli %0, %c2 : index
    %12 = arith.addi %11, %5 : index
    %13 = arith.muli %2, %c2 : index
    %14 = arith.addi %13, %8 : index
    %15 = memref.load %arg1[%c0, %c0, %12, %14] : memref<1x64x114x114xf32>
    %16 = arith.cmpf ugt, %9, %15 : f32
    %17 = arith.select %16, %9, %15 : f32
    %18 = arith.addi %8, %c1 : index
    cf.br ^bb8(%18, %17 : index, f32)
  ^bb10:  // pred: ^bb8
    %19 = arith.addi %5, %c1 : index
    cf.br ^bb6(%19, %9 : index, f32)
  ^bb11:  // pred: ^bb6
    memref.store %6, %arg2[%c0, %c0, %0, %2] : memref<1x64x56x56xf32>
    %20 = arith.addi %2, %c1 : index
    cf.br ^bb4(%20 : index)
  ^bb12:  // pred: ^bb4
    %21 = arith.addi %0, %c1 : index
    cf.br ^bb2(%21 : index)
  ^bb13:  // pred: ^bb2
    return
  }
}


// -----// IR Dump After FinalizeMemRefToLLVMConversionPass (finalize-memref-to-llvm) //----- //
module {
  func.func @forward_kernel_3(%arg0: memref<1x64x56x56xf32>, %arg1: memref<1x64x114x114xf32>, %arg2: memref<1x64x56x56xf32>) attributes {Kernel, forward_kernel_3} {
    %0 = builtin.unrealized_conversion_cast %arg0 : memref<1x64x56x56xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %1 = builtin.unrealized_conversion_cast %arg1 : memref<1x64x114x114xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %2 = builtin.unrealized_conversion_cast %arg2 : memref<1x64x56x56xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %c56 = arith.constant 56 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c0 = arith.constant 0 : index
    %3 = builtin.unrealized_conversion_cast %c0 : index to i64
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%c0 : index)
  ^bb2(%4: index):  // 2 preds: ^bb1, ^bb12
    %5 = builtin.unrealized_conversion_cast %4 : index to i64
    %6 = arith.cmpi slt, %4, %c4 : index
    cf.cond_br %6, ^bb3, ^bb13
  ^bb3:  // pred: ^bb2
    cf.br ^bb4(%c0 : index)
  ^bb4(%7: index):  // 2 preds: ^bb3, ^bb11
    %8 = builtin.unrealized_conversion_cast %7 : index to i64
    %9 = arith.cmpi slt, %7, %c56 : index
    cf.cond_br %9, ^bb5, ^bb12
  ^bb5:  // pred: ^bb4
    %10 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %11 = llvm.mlir.constant(200704 : index) : i64
    %12 = llvm.mul %3, %11  : i64
    %13 = llvm.mlir.constant(3136 : index) : i64
    %14 = llvm.mul %3, %13  : i64
    %15 = llvm.add %12, %14  : i64
    %16 = llvm.mlir.constant(56 : index) : i64
    %17 = llvm.mul %5, %16  : i64
    %18 = llvm.add %15, %17  : i64
    %19 = llvm.add %18, %8  : i64
    %20 = llvm.getelementptr %10[%19] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %21 = llvm.load %20 : !llvm.ptr -> f32
    cf.br ^bb6(%c0, %21 : index, f32)
  ^bb6(%22: index, %23: f32):  // 2 preds: ^bb5, ^bb10
    %24 = arith.cmpi slt, %22, %c3 : index
    cf.cond_br %24, ^bb7, ^bb11
  ^bb7:  // pred: ^bb6
    cf.br ^bb8(%c0, %23 : index, f32)
  ^bb8(%25: index, %26: f32):  // 2 preds: ^bb7, ^bb9
    %27 = arith.cmpi slt, %25, %c3 : index
    cf.cond_br %27, ^bb9, ^bb10
  ^bb9:  // pred: ^bb8
    %28 = arith.muli %4, %c2 : index
    %29 = arith.addi %28, %22 : index
    %30 = builtin.unrealized_conversion_cast %29 : index to i64
    %31 = arith.muli %7, %c2 : index
    %32 = arith.addi %31, %25 : index
    %33 = builtin.unrealized_conversion_cast %32 : index to i64
    %34 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %35 = llvm.mlir.constant(831744 : index) : i64
    %36 = llvm.mul %3, %35  : i64
    %37 = llvm.mlir.constant(12996 : index) : i64
    %38 = llvm.mul %3, %37  : i64
    %39 = llvm.add %36, %38  : i64
    %40 = llvm.mlir.constant(114 : index) : i64
    %41 = llvm.mul %30, %40  : i64
    %42 = llvm.add %39, %41  : i64
    %43 = llvm.add %42, %33  : i64
    %44 = llvm.getelementptr %34[%43] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %45 = llvm.load %44 : !llvm.ptr -> f32
    %46 = arith.cmpf ugt, %26, %45 : f32
    %47 = arith.select %46, %26, %45 : f32
    %48 = arith.addi %25, %c1 : index
    cf.br ^bb8(%48, %47 : index, f32)
  ^bb10:  // pred: ^bb8
    %49 = arith.addi %22, %c1 : index
    cf.br ^bb6(%49, %26 : index, f32)
  ^bb11:  // pred: ^bb6
    %50 = llvm.extractvalue %2[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %51 = llvm.mlir.constant(200704 : index) : i64
    %52 = llvm.mul %3, %51  : i64
    %53 = llvm.mlir.constant(3136 : index) : i64
    %54 = llvm.mul %3, %53  : i64
    %55 = llvm.add %52, %54  : i64
    %56 = llvm.mlir.constant(56 : index) : i64
    %57 = llvm.mul %5, %56  : i64
    %58 = llvm.add %55, %57  : i64
    %59 = llvm.add %58, %8  : i64
    %60 = llvm.getelementptr %50[%59] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %23, %60 : f32, !llvm.ptr
    %61 = arith.addi %7, %c1 : index
    cf.br ^bb4(%61 : index)
  ^bb12:  // pred: ^bb4
    %62 = arith.addi %4, %c1 : index
    cf.br ^bb2(%62 : index)
  ^bb13:  // pred: ^bb2
    return
  }
}


// -----// IR Dump After ConvertMathToLLVMPass (convert-math-to-llvm) //----- //
module {
  func.func @forward_kernel_3(%arg0: memref<1x64x56x56xf32>, %arg1: memref<1x64x114x114xf32>, %arg2: memref<1x64x56x56xf32>) attributes {Kernel, forward_kernel_3} {
    %0 = builtin.unrealized_conversion_cast %arg0 : memref<1x64x56x56xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %1 = builtin.unrealized_conversion_cast %arg1 : memref<1x64x114x114xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %2 = builtin.unrealized_conversion_cast %arg2 : memref<1x64x56x56xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %c56 = arith.constant 56 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c0 = arith.constant 0 : index
    %3 = builtin.unrealized_conversion_cast %c0 : index to i64
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%c0 : index)
  ^bb2(%4: index):  // 2 preds: ^bb1, ^bb12
    %5 = builtin.unrealized_conversion_cast %4 : index to i64
    %6 = arith.cmpi slt, %4, %c4 : index
    cf.cond_br %6, ^bb3, ^bb13
  ^bb3:  // pred: ^bb2
    cf.br ^bb4(%c0 : index)
  ^bb4(%7: index):  // 2 preds: ^bb3, ^bb11
    %8 = builtin.unrealized_conversion_cast %7 : index to i64
    %9 = arith.cmpi slt, %7, %c56 : index
    cf.cond_br %9, ^bb5, ^bb12
  ^bb5:  // pred: ^bb4
    %10 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %11 = llvm.mlir.constant(200704 : index) : i64
    %12 = llvm.mul %3, %11  : i64
    %13 = llvm.mlir.constant(3136 : index) : i64
    %14 = llvm.mul %3, %13  : i64
    %15 = llvm.add %12, %14  : i64
    %16 = llvm.mlir.constant(56 : index) : i64
    %17 = llvm.mul %5, %16  : i64
    %18 = llvm.add %15, %17  : i64
    %19 = llvm.add %18, %8  : i64
    %20 = llvm.getelementptr %10[%19] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %21 = llvm.load %20 : !llvm.ptr -> f32
    cf.br ^bb6(%c0, %21 : index, f32)
  ^bb6(%22: index, %23: f32):  // 2 preds: ^bb5, ^bb10
    %24 = arith.cmpi slt, %22, %c3 : index
    cf.cond_br %24, ^bb7, ^bb11
  ^bb7:  // pred: ^bb6
    cf.br ^bb8(%c0, %23 : index, f32)
  ^bb8(%25: index, %26: f32):  // 2 preds: ^bb7, ^bb9
    %27 = arith.cmpi slt, %25, %c3 : index
    cf.cond_br %27, ^bb9, ^bb10
  ^bb9:  // pred: ^bb8
    %28 = arith.muli %4, %c2 : index
    %29 = arith.addi %28, %22 : index
    %30 = builtin.unrealized_conversion_cast %29 : index to i64
    %31 = arith.muli %7, %c2 : index
    %32 = arith.addi %31, %25 : index
    %33 = builtin.unrealized_conversion_cast %32 : index to i64
    %34 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %35 = llvm.mlir.constant(831744 : index) : i64
    %36 = llvm.mul %3, %35  : i64
    %37 = llvm.mlir.constant(12996 : index) : i64
    %38 = llvm.mul %3, %37  : i64
    %39 = llvm.add %36, %38  : i64
    %40 = llvm.mlir.constant(114 : index) : i64
    %41 = llvm.mul %30, %40  : i64
    %42 = llvm.add %39, %41  : i64
    %43 = llvm.add %42, %33  : i64
    %44 = llvm.getelementptr %34[%43] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %45 = llvm.load %44 : !llvm.ptr -> f32
    %46 = arith.cmpf ugt, %26, %45 : f32
    %47 = arith.select %46, %26, %45 : f32
    %48 = arith.addi %25, %c1 : index
    cf.br ^bb8(%48, %47 : index, f32)
  ^bb10:  // pred: ^bb8
    %49 = arith.addi %22, %c1 : index
    cf.br ^bb6(%49, %26 : index, f32)
  ^bb11:  // pred: ^bb6
    %50 = llvm.extractvalue %2[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %51 = llvm.mlir.constant(200704 : index) : i64
    %52 = llvm.mul %3, %51  : i64
    %53 = llvm.mlir.constant(3136 : index) : i64
    %54 = llvm.mul %3, %53  : i64
    %55 = llvm.add %52, %54  : i64
    %56 = llvm.mlir.constant(56 : index) : i64
    %57 = llvm.mul %5, %56  : i64
    %58 = llvm.add %55, %57  : i64
    %59 = llvm.add %58, %8  : i64
    %60 = llvm.getelementptr %50[%59] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %23, %60 : f32, !llvm.ptr
    %61 = arith.addi %7, %c1 : index
    cf.br ^bb4(%61 : index)
  ^bb12:  // pred: ^bb4
    %62 = arith.addi %4, %c1 : index
    cf.br ^bb2(%62 : index)
  ^bb13:  // pred: ^bb2
    return
  }
}


// -----// IR Dump After ConvertMathToLibm (convert-math-to-libm) //----- //
module {
  func.func @forward_kernel_3(%arg0: memref<1x64x56x56xf32>, %arg1: memref<1x64x114x114xf32>, %arg2: memref<1x64x56x56xf32>) attributes {Kernel, forward_kernel_3} {
    %0 = builtin.unrealized_conversion_cast %arg0 : memref<1x64x56x56xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %1 = builtin.unrealized_conversion_cast %arg1 : memref<1x64x114x114xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %2 = builtin.unrealized_conversion_cast %arg2 : memref<1x64x56x56xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %c56 = arith.constant 56 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c0 = arith.constant 0 : index
    %3 = builtin.unrealized_conversion_cast %c0 : index to i64
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%c0 : index)
  ^bb2(%4: index):  // 2 preds: ^bb1, ^bb12
    %5 = builtin.unrealized_conversion_cast %4 : index to i64
    %6 = arith.cmpi slt, %4, %c4 : index
    cf.cond_br %6, ^bb3, ^bb13
  ^bb3:  // pred: ^bb2
    cf.br ^bb4(%c0 : index)
  ^bb4(%7: index):  // 2 preds: ^bb3, ^bb11
    %8 = builtin.unrealized_conversion_cast %7 : index to i64
    %9 = arith.cmpi slt, %7, %c56 : index
    cf.cond_br %9, ^bb5, ^bb12
  ^bb5:  // pred: ^bb4
    %10 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %11 = llvm.mlir.constant(200704 : index) : i64
    %12 = llvm.mul %3, %11  : i64
    %13 = llvm.mlir.constant(3136 : index) : i64
    %14 = llvm.mul %3, %13  : i64
    %15 = llvm.add %12, %14  : i64
    %16 = llvm.mlir.constant(56 : index) : i64
    %17 = llvm.mul %5, %16  : i64
    %18 = llvm.add %15, %17  : i64
    %19 = llvm.add %18, %8  : i64
    %20 = llvm.getelementptr %10[%19] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %21 = llvm.load %20 : !llvm.ptr -> f32
    cf.br ^bb6(%c0, %21 : index, f32)
  ^bb6(%22: index, %23: f32):  // 2 preds: ^bb5, ^bb10
    %24 = arith.cmpi slt, %22, %c3 : index
    cf.cond_br %24, ^bb7, ^bb11
  ^bb7:  // pred: ^bb6
    cf.br ^bb8(%c0, %23 : index, f32)
  ^bb8(%25: index, %26: f32):  // 2 preds: ^bb7, ^bb9
    %27 = arith.cmpi slt, %25, %c3 : index
    cf.cond_br %27, ^bb9, ^bb10
  ^bb9:  // pred: ^bb8
    %28 = arith.muli %4, %c2 : index
    %29 = arith.addi %28, %22 : index
    %30 = builtin.unrealized_conversion_cast %29 : index to i64
    %31 = arith.muli %7, %c2 : index
    %32 = arith.addi %31, %25 : index
    %33 = builtin.unrealized_conversion_cast %32 : index to i64
    %34 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %35 = llvm.mlir.constant(831744 : index) : i64
    %36 = llvm.mul %3, %35  : i64
    %37 = llvm.mlir.constant(12996 : index) : i64
    %38 = llvm.mul %3, %37  : i64
    %39 = llvm.add %36, %38  : i64
    %40 = llvm.mlir.constant(114 : index) : i64
    %41 = llvm.mul %30, %40  : i64
    %42 = llvm.add %39, %41  : i64
    %43 = llvm.add %42, %33  : i64
    %44 = llvm.getelementptr %34[%43] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %45 = llvm.load %44 : !llvm.ptr -> f32
    %46 = arith.cmpf ugt, %26, %45 : f32
    %47 = arith.select %46, %26, %45 : f32
    %48 = arith.addi %25, %c1 : index
    cf.br ^bb8(%48, %47 : index, f32)
  ^bb10:  // pred: ^bb8
    %49 = arith.addi %22, %c1 : index
    cf.br ^bb6(%49, %26 : index, f32)
  ^bb11:  // pred: ^bb6
    %50 = llvm.extractvalue %2[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %51 = llvm.mlir.constant(200704 : index) : i64
    %52 = llvm.mul %3, %51  : i64
    %53 = llvm.mlir.constant(3136 : index) : i64
    %54 = llvm.mul %3, %53  : i64
    %55 = llvm.add %52, %54  : i64
    %56 = llvm.mlir.constant(56 : index) : i64
    %57 = llvm.mul %5, %56  : i64
    %58 = llvm.add %55, %57  : i64
    %59 = llvm.add %58, %8  : i64
    %60 = llvm.getelementptr %50[%59] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %23, %60 : f32, !llvm.ptr
    %61 = arith.addi %7, %c1 : index
    cf.br ^bb4(%61 : index)
  ^bb12:  // pred: ^bb4
    %62 = arith.addi %4, %c1 : index
    cf.br ^bb2(%62 : index)
  ^bb13:  // pred: ^bb2
    return
  }
}


// -----// IR Dump After ArithToLLVMConversionPass (convert-arith-to-llvm) //----- //
module {
  func.func @forward_kernel_3(%arg0: memref<1x64x56x56xf32>, %arg1: memref<1x64x114x114xf32>, %arg2: memref<1x64x56x56xf32>) attributes {Kernel, forward_kernel_3} {
    %0 = builtin.unrealized_conversion_cast %arg0 : memref<1x64x56x56xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %1 = builtin.unrealized_conversion_cast %arg1 : memref<1x64x114x114xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %2 = builtin.unrealized_conversion_cast %arg2 : memref<1x64x56x56xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %3 = llvm.mlir.constant(2 : index) : i64
    %4 = llvm.mlir.constant(3 : index) : i64
    %5 = llvm.mlir.constant(56 : index) : i64
    %6 = llvm.mlir.constant(1 : index) : i64
    %7 = llvm.mlir.constant(4 : index) : i64
    %8 = llvm.mlir.constant(0 : index) : i64
    %9 = builtin.unrealized_conversion_cast %8 : i64 to index
    %10 = builtin.unrealized_conversion_cast %9 : index to i64
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%9 : index)
  ^bb2(%11: index):  // 2 preds: ^bb1, ^bb12
    %12 = builtin.unrealized_conversion_cast %11 : index to i64
    %13 = builtin.unrealized_conversion_cast %11 : index to i64
    %14 = llvm.icmp "slt" %12, %7 : i64
    cf.cond_br %14, ^bb3, ^bb13
  ^bb3:  // pred: ^bb2
    cf.br ^bb4(%9 : index)
  ^bb4(%15: index):  // 2 preds: ^bb3, ^bb11
    %16 = builtin.unrealized_conversion_cast %15 : index to i64
    %17 = builtin.unrealized_conversion_cast %15 : index to i64
    %18 = llvm.icmp "slt" %16, %5 : i64
    cf.cond_br %18, ^bb5, ^bb12
  ^bb5:  // pred: ^bb4
    %19 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %20 = llvm.mlir.constant(200704 : index) : i64
    %21 = llvm.mul %10, %20  : i64
    %22 = llvm.mlir.constant(3136 : index) : i64
    %23 = llvm.mul %10, %22  : i64
    %24 = llvm.add %21, %23  : i64
    %25 = llvm.mlir.constant(56 : index) : i64
    %26 = llvm.mul %13, %25  : i64
    %27 = llvm.add %24, %26  : i64
    %28 = llvm.add %27, %17  : i64
    %29 = llvm.getelementptr %19[%28] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %30 = llvm.load %29 : !llvm.ptr -> f32
    cf.br ^bb6(%9, %30 : index, f32)
  ^bb6(%31: index, %32: f32):  // 2 preds: ^bb5, ^bb10
    %33 = builtin.unrealized_conversion_cast %31 : index to i64
    %34 = llvm.icmp "slt" %33, %4 : i64
    cf.cond_br %34, ^bb7, ^bb11
  ^bb7:  // pred: ^bb6
    cf.br ^bb8(%9, %32 : index, f32)
  ^bb8(%35: index, %36: f32):  // 2 preds: ^bb7, ^bb9
    %37 = builtin.unrealized_conversion_cast %35 : index to i64
    %38 = llvm.icmp "slt" %37, %4 : i64
    cf.cond_br %38, ^bb9, ^bb10
  ^bb9:  // pred: ^bb8
    %39 = llvm.mul %12, %3  : i64
    %40 = llvm.add %39, %33  : i64
    %41 = builtin.unrealized_conversion_cast %40 : i64 to index
    %42 = builtin.unrealized_conversion_cast %41 : index to i64
    %43 = llvm.mul %16, %3  : i64
    %44 = llvm.add %43, %37  : i64
    %45 = builtin.unrealized_conversion_cast %44 : i64 to index
    %46 = builtin.unrealized_conversion_cast %45 : index to i64
    %47 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %48 = llvm.mlir.constant(831744 : index) : i64
    %49 = llvm.mul %10, %48  : i64
    %50 = llvm.mlir.constant(12996 : index) : i64
    %51 = llvm.mul %10, %50  : i64
    %52 = llvm.add %49, %51  : i64
    %53 = llvm.mlir.constant(114 : index) : i64
    %54 = llvm.mul %42, %53  : i64
    %55 = llvm.add %52, %54  : i64
    %56 = llvm.add %55, %46  : i64
    %57 = llvm.getelementptr %47[%56] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %58 = llvm.load %57 : !llvm.ptr -> f32
    %59 = llvm.fcmp "ugt" %36, %58 : f32
    %60 = llvm.select %59, %36, %58 : i1, f32
    %61 = llvm.add %37, %6  : i64
    %62 = builtin.unrealized_conversion_cast %61 : i64 to index
    cf.br ^bb8(%62, %60 : index, f32)
  ^bb10:  // pred: ^bb8
    %63 = llvm.add %33, %6  : i64
    %64 = builtin.unrealized_conversion_cast %63 : i64 to index
    cf.br ^bb6(%64, %36 : index, f32)
  ^bb11:  // pred: ^bb6
    %65 = llvm.extractvalue %2[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %66 = llvm.mlir.constant(200704 : index) : i64
    %67 = llvm.mul %10, %66  : i64
    %68 = llvm.mlir.constant(3136 : index) : i64
    %69 = llvm.mul %10, %68  : i64
    %70 = llvm.add %67, %69  : i64
    %71 = llvm.mlir.constant(56 : index) : i64
    %72 = llvm.mul %13, %71  : i64
    %73 = llvm.add %70, %72  : i64
    %74 = llvm.add %73, %17  : i64
    %75 = llvm.getelementptr %65[%74] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %32, %75 : f32, !llvm.ptr
    %76 = llvm.add %16, %6  : i64
    %77 = builtin.unrealized_conversion_cast %76 : i64 to index
    cf.br ^bb4(%77 : index)
  ^bb12:  // pred: ^bb4
    %78 = llvm.add %12, %6  : i64
    %79 = builtin.unrealized_conversion_cast %78 : i64 to index
    cf.br ^bb2(%79 : index)
  ^bb13:  // pred: ^bb2
    return
  }
}


// -----// IR Dump After ConvertFuncToLLVMPass (convert-func-to-llvm) //----- //
module attributes {llvm.data_layout = ""} {
  llvm.func @forward_kernel_3(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr) attributes {Kernel, forward_kernel_3} {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %5 = llvm.mlir.constant(1 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %7 = llvm.mlir.constant(200704 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %9 = llvm.mlir.constant(64 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %11 = llvm.mlir.constant(3136 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %13 = llvm.mlir.constant(56 : index) : i64
    %14 = llvm.insertvalue %13, %12[3, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %15 = llvm.mlir.constant(56 : index) : i64
    %16 = llvm.insertvalue %15, %14[4, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %17 = llvm.mlir.constant(56 : index) : i64
    %18 = llvm.insertvalue %17, %16[3, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %19 = llvm.mlir.constant(1 : index) : i64
    %20 = llvm.insertvalue %19, %18[4, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %21 = builtin.unrealized_conversion_cast %20 : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> to memref<1x64x56x56xf32>
    %22 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %23 = llvm.insertvalue %arg1, %22[0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %24 = llvm.insertvalue %arg1, %23[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %25 = llvm.mlir.constant(0 : index) : i64
    %26 = llvm.insertvalue %25, %24[2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %27 = llvm.mlir.constant(1 : index) : i64
    %28 = llvm.insertvalue %27, %26[3, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %29 = llvm.mlir.constant(831744 : index) : i64
    %30 = llvm.insertvalue %29, %28[4, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %31 = llvm.mlir.constant(64 : index) : i64
    %32 = llvm.insertvalue %31, %30[3, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %33 = llvm.mlir.constant(12996 : index) : i64
    %34 = llvm.insertvalue %33, %32[4, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %35 = llvm.mlir.constant(114 : index) : i64
    %36 = llvm.insertvalue %35, %34[3, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %37 = llvm.mlir.constant(114 : index) : i64
    %38 = llvm.insertvalue %37, %36[4, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %39 = llvm.mlir.constant(114 : index) : i64
    %40 = llvm.insertvalue %39, %38[3, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %41 = llvm.mlir.constant(1 : index) : i64
    %42 = llvm.insertvalue %41, %40[4, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %43 = builtin.unrealized_conversion_cast %42 : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> to memref<1x64x114x114xf32>
    %44 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %45 = llvm.insertvalue %arg2, %44[0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %46 = llvm.insertvalue %arg2, %45[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %47 = llvm.mlir.constant(0 : index) : i64
    %48 = llvm.insertvalue %47, %46[2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %49 = llvm.mlir.constant(1 : index) : i64
    %50 = llvm.insertvalue %49, %48[3, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %51 = llvm.mlir.constant(200704 : index) : i64
    %52 = llvm.insertvalue %51, %50[4, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %53 = llvm.mlir.constant(64 : index) : i64
    %54 = llvm.insertvalue %53, %52[3, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %55 = llvm.mlir.constant(3136 : index) : i64
    %56 = llvm.insertvalue %55, %54[4, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %57 = llvm.mlir.constant(56 : index) : i64
    %58 = llvm.insertvalue %57, %56[3, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %59 = llvm.mlir.constant(56 : index) : i64
    %60 = llvm.insertvalue %59, %58[4, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %61 = llvm.mlir.constant(56 : index) : i64
    %62 = llvm.insertvalue %61, %60[3, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %63 = llvm.mlir.constant(1 : index) : i64
    %64 = llvm.insertvalue %63, %62[4, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %65 = builtin.unrealized_conversion_cast %64 : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> to memref<1x64x56x56xf32>
    %66 = builtin.unrealized_conversion_cast %21 : memref<1x64x56x56xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %67 = builtin.unrealized_conversion_cast %43 : memref<1x64x114x114xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %68 = builtin.unrealized_conversion_cast %65 : memref<1x64x56x56xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %69 = llvm.mlir.constant(2 : index) : i64
    %70 = llvm.mlir.constant(3 : index) : i64
    %71 = llvm.mlir.constant(56 : index) : i64
    %72 = llvm.mlir.constant(1 : index) : i64
    %73 = llvm.mlir.constant(4 : index) : i64
    %74 = llvm.mlir.constant(0 : index) : i64
    %75 = builtin.unrealized_conversion_cast %74 : i64 to index
    %76 = builtin.unrealized_conversion_cast %75 : index to i64
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%74 : i64)
  ^bb2(%77: i64):  // 2 preds: ^bb1, ^bb12
    %78 = builtin.unrealized_conversion_cast %77 : i64 to index
    %79 = builtin.unrealized_conversion_cast %78 : index to i64
    %80 = builtin.unrealized_conversion_cast %78 : index to i64
    %81 = llvm.icmp "slt" %79, %73 : i64
    llvm.cond_br %81, ^bb3, ^bb13
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%74 : i64)
  ^bb4(%82: i64):  // 2 preds: ^bb3, ^bb11
    %83 = builtin.unrealized_conversion_cast %82 : i64 to index
    %84 = builtin.unrealized_conversion_cast %83 : index to i64
    %85 = builtin.unrealized_conversion_cast %83 : index to i64
    %86 = llvm.icmp "slt" %84, %71 : i64
    llvm.cond_br %86, ^bb5, ^bb12
  ^bb5:  // pred: ^bb4
    %87 = llvm.extractvalue %66[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %88 = llvm.mlir.constant(200704 : index) : i64
    %89 = llvm.mul %76, %88  : i64
    %90 = llvm.mlir.constant(3136 : index) : i64
    %91 = llvm.mul %76, %90  : i64
    %92 = llvm.add %89, %91  : i64
    %93 = llvm.mlir.constant(56 : index) : i64
    %94 = llvm.mul %80, %93  : i64
    %95 = llvm.add %92, %94  : i64
    %96 = llvm.add %95, %85  : i64
    %97 = llvm.getelementptr %87[%96] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %98 = llvm.load %97 : !llvm.ptr -> f32
    llvm.br ^bb6(%74, %98 : i64, f32)
  ^bb6(%99: i64, %100: f32):  // 2 preds: ^bb5, ^bb10
    %101 = builtin.unrealized_conversion_cast %99 : i64 to index
    %102 = builtin.unrealized_conversion_cast %101 : index to i64
    %103 = llvm.icmp "slt" %102, %70 : i64
    llvm.cond_br %103, ^bb7, ^bb11
  ^bb7:  // pred: ^bb6
    llvm.br ^bb8(%74, %100 : i64, f32)
  ^bb8(%104: i64, %105: f32):  // 2 preds: ^bb7, ^bb9
    %106 = builtin.unrealized_conversion_cast %104 : i64 to index
    %107 = builtin.unrealized_conversion_cast %106 : index to i64
    %108 = llvm.icmp "slt" %107, %70 : i64
    llvm.cond_br %108, ^bb9, ^bb10
  ^bb9:  // pred: ^bb8
    %109 = llvm.mul %79, %69  : i64
    %110 = llvm.add %109, %102  : i64
    %111 = builtin.unrealized_conversion_cast %110 : i64 to index
    %112 = builtin.unrealized_conversion_cast %111 : index to i64
    %113 = llvm.mul %84, %69  : i64
    %114 = llvm.add %113, %107  : i64
    %115 = builtin.unrealized_conversion_cast %114 : i64 to index
    %116 = builtin.unrealized_conversion_cast %115 : index to i64
    %117 = llvm.extractvalue %67[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %118 = llvm.mlir.constant(831744 : index) : i64
    %119 = llvm.mul %76, %118  : i64
    %120 = llvm.mlir.constant(12996 : index) : i64
    %121 = llvm.mul %76, %120  : i64
    %122 = llvm.add %119, %121  : i64
    %123 = llvm.mlir.constant(114 : index) : i64
    %124 = llvm.mul %112, %123  : i64
    %125 = llvm.add %122, %124  : i64
    %126 = llvm.add %125, %116  : i64
    %127 = llvm.getelementptr %117[%126] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %128 = llvm.load %127 : !llvm.ptr -> f32
    %129 = llvm.fcmp "ugt" %105, %128 : f32
    %130 = llvm.select %129, %105, %128 : i1, f32
    %131 = llvm.add %107, %72  : i64
    %132 = builtin.unrealized_conversion_cast %131 : i64 to index
    llvm.br ^bb8(%131, %130 : i64, f32)
  ^bb10:  // pred: ^bb8
    %133 = llvm.add %102, %72  : i64
    %134 = builtin.unrealized_conversion_cast %133 : i64 to index
    llvm.br ^bb6(%133, %105 : i64, f32)
  ^bb11:  // pred: ^bb6
    %135 = llvm.extractvalue %68[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %136 = llvm.mlir.constant(200704 : index) : i64
    %137 = llvm.mul %76, %136  : i64
    %138 = llvm.mlir.constant(3136 : index) : i64
    %139 = llvm.mul %76, %138  : i64
    %140 = llvm.add %137, %139  : i64
    %141 = llvm.mlir.constant(56 : index) : i64
    %142 = llvm.mul %80, %141  : i64
    %143 = llvm.add %140, %142  : i64
    %144 = llvm.add %143, %85  : i64
    %145 = llvm.getelementptr %135[%144] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %100, %145 : f32, !llvm.ptr
    %146 = llvm.add %84, %72  : i64
    %147 = builtin.unrealized_conversion_cast %146 : i64 to index
    llvm.br ^bb4(%146 : i64)
  ^bb12:  // pred: ^bb4
    %148 = llvm.add %79, %72  : i64
    %149 = builtin.unrealized_conversion_cast %148 : i64 to index
    llvm.br ^bb2(%148 : i64)
  ^bb13:  // pred: ^bb2
    llvm.return
  }
}


// -----// IR Dump After ReconcileUnrealizedCasts (reconcile-unrealized-casts) //----- //
module attributes {llvm.data_layout = ""} {
  llvm.func @forward_kernel_3(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr) attributes {Kernel, forward_kernel_3} {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %5 = llvm.mlir.constant(1 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %7 = llvm.mlir.constant(200704 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %9 = llvm.mlir.constant(64 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %11 = llvm.mlir.constant(3136 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %13 = llvm.mlir.constant(56 : index) : i64
    %14 = llvm.insertvalue %13, %12[3, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %15 = llvm.mlir.constant(56 : index) : i64
    %16 = llvm.insertvalue %15, %14[4, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %17 = llvm.mlir.constant(56 : index) : i64
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
    %28 = llvm.mlir.constant(831744 : index) : i64
    %29 = llvm.insertvalue %28, %27[4, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %30 = llvm.mlir.constant(64 : index) : i64
    %31 = llvm.insertvalue %30, %29[3, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %32 = llvm.mlir.constant(12996 : index) : i64
    %33 = llvm.insertvalue %32, %31[4, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %34 = llvm.mlir.constant(114 : index) : i64
    %35 = llvm.insertvalue %34, %33[3, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %36 = llvm.mlir.constant(114 : index) : i64
    %37 = llvm.insertvalue %36, %35[4, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %38 = llvm.mlir.constant(114 : index) : i64
    %39 = llvm.insertvalue %38, %37[3, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %40 = llvm.mlir.constant(1 : index) : i64
    %41 = llvm.insertvalue %40, %39[4, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %42 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %43 = llvm.insertvalue %arg2, %42[0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %44 = llvm.insertvalue %arg2, %43[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %45 = llvm.mlir.constant(0 : index) : i64
    %46 = llvm.insertvalue %45, %44[2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %47 = llvm.mlir.constant(1 : index) : i64
    %48 = llvm.insertvalue %47, %46[3, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %49 = llvm.mlir.constant(200704 : index) : i64
    %50 = llvm.insertvalue %49, %48[4, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %51 = llvm.mlir.constant(64 : index) : i64
    %52 = llvm.insertvalue %51, %50[3, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %53 = llvm.mlir.constant(3136 : index) : i64
    %54 = llvm.insertvalue %53, %52[4, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %55 = llvm.mlir.constant(56 : index) : i64
    %56 = llvm.insertvalue %55, %54[3, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %57 = llvm.mlir.constant(56 : index) : i64
    %58 = llvm.insertvalue %57, %56[4, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %59 = llvm.mlir.constant(56 : index) : i64
    %60 = llvm.insertvalue %59, %58[3, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %61 = llvm.mlir.constant(1 : index) : i64
    %62 = llvm.insertvalue %61, %60[4, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %63 = llvm.mlir.constant(2 : index) : i64
    %64 = llvm.mlir.constant(3 : index) : i64
    %65 = llvm.mlir.constant(56 : index) : i64
    %66 = llvm.mlir.constant(1 : index) : i64
    %67 = llvm.mlir.constant(4 : index) : i64
    %68 = llvm.mlir.constant(0 : index) : i64
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%68 : i64)
  ^bb2(%69: i64):  // 2 preds: ^bb1, ^bb12
    %70 = llvm.icmp "slt" %69, %67 : i64
    llvm.cond_br %70, ^bb3, ^bb13
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%68 : i64)
  ^bb4(%71: i64):  // 2 preds: ^bb3, ^bb11
    %72 = llvm.icmp "slt" %71, %65 : i64
    llvm.cond_br %72, ^bb5, ^bb12
  ^bb5:  // pred: ^bb4
    %73 = llvm.extractvalue %20[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %74 = llvm.mlir.constant(200704 : index) : i64
    %75 = llvm.mul %68, %74  : i64
    %76 = llvm.mlir.constant(3136 : index) : i64
    %77 = llvm.mul %68, %76  : i64
    %78 = llvm.add %75, %77  : i64
    %79 = llvm.mlir.constant(56 : index) : i64
    %80 = llvm.mul %69, %79  : i64
    %81 = llvm.add %78, %80  : i64
    %82 = llvm.add %81, %71  : i64
    %83 = llvm.getelementptr %73[%82] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %84 = llvm.load %83 : !llvm.ptr -> f32
    llvm.br ^bb6(%68, %84 : i64, f32)
  ^bb6(%85: i64, %86: f32):  // 2 preds: ^bb5, ^bb10
    %87 = llvm.icmp "slt" %85, %64 : i64
    llvm.cond_br %87, ^bb7, ^bb11
  ^bb7:  // pred: ^bb6
    llvm.br ^bb8(%68, %86 : i64, f32)
  ^bb8(%88: i64, %89: f32):  // 2 preds: ^bb7, ^bb9
    %90 = llvm.icmp "slt" %88, %64 : i64
    llvm.cond_br %90, ^bb9, ^bb10
  ^bb9:  // pred: ^bb8
    %91 = llvm.mul %69, %63  : i64
    %92 = llvm.add %91, %85  : i64
    %93 = llvm.mul %71, %63  : i64
    %94 = llvm.add %93, %88  : i64
    %95 = llvm.extractvalue %41[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %96 = llvm.mlir.constant(831744 : index) : i64
    %97 = llvm.mul %68, %96  : i64
    %98 = llvm.mlir.constant(12996 : index) : i64
    %99 = llvm.mul %68, %98  : i64
    %100 = llvm.add %97, %99  : i64
    %101 = llvm.mlir.constant(114 : index) : i64
    %102 = llvm.mul %92, %101  : i64
    %103 = llvm.add %100, %102  : i64
    %104 = llvm.add %103, %94  : i64
    %105 = llvm.getelementptr %95[%104] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %106 = llvm.load %105 : !llvm.ptr -> f32
    %107 = llvm.fcmp "ugt" %89, %106 : f32
    %108 = llvm.select %107, %89, %106 : i1, f32
    %109 = llvm.add %88, %66  : i64
    llvm.br ^bb8(%109, %108 : i64, f32)
  ^bb10:  // pred: ^bb8
    %110 = llvm.add %85, %66  : i64
    llvm.br ^bb6(%110, %89 : i64, f32)
  ^bb11:  // pred: ^bb6
    %111 = llvm.extractvalue %62[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %112 = llvm.mlir.constant(200704 : index) : i64
    %113 = llvm.mul %68, %112  : i64
    %114 = llvm.mlir.constant(3136 : index) : i64
    %115 = llvm.mul %68, %114  : i64
    %116 = llvm.add %113, %115  : i64
    %117 = llvm.mlir.constant(56 : index) : i64
    %118 = llvm.mul %69, %117  : i64
    %119 = llvm.add %116, %118  : i64
    %120 = llvm.add %119, %71  : i64
    %121 = llvm.getelementptr %111[%120] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %86, %121 : f32, !llvm.ptr
    %122 = llvm.add %71, %66  : i64
    llvm.br ^bb4(%122 : i64)
  ^bb12:  // pred: ^bb4
    %123 = llvm.add %69, %66  : i64
    llvm.br ^bb2(%123 : i64)
  ^bb13:  // pred: ^bb2
    llvm.return
  }
}


// -----// IR Dump After Canonicalizer (canonicalize) //----- //
module attributes {llvm.data_layout = ""} {
  llvm.func @forward_kernel_3(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr) attributes {Kernel, forward_kernel_3} {
    %0 = llvm.mlir.constant(4 : index) : i64
    %1 = llvm.mlir.constant(3 : index) : i64
    %2 = llvm.mlir.constant(2 : index) : i64
    %3 = llvm.mlir.constant(114 : index) : i64
    %4 = llvm.mlir.constant(12996 : index) : i64
    %5 = llvm.mlir.constant(831744 : index) : i64
    %6 = llvm.mlir.constant(56 : index) : i64
    %7 = llvm.mlir.constant(3136 : index) : i64
    %8 = llvm.mlir.constant(200704 : index) : i64
    %9 = llvm.mlir.constant(1 : index) : i64
    %10 = llvm.mlir.constant(0 : index) : i64
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%10 : i64)
  ^bb2(%11: i64):  // 2 preds: ^bb1, ^bb12
    %12 = llvm.icmp "slt" %11, %0 : i64
    llvm.cond_br %12, ^bb3, ^bb13
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%10 : i64)
  ^bb4(%13: i64):  // 2 preds: ^bb3, ^bb11
    %14 = llvm.icmp "slt" %13, %6 : i64
    llvm.cond_br %14, ^bb5, ^bb12
  ^bb5:  // pred: ^bb4
    %15 = llvm.mul %10, %8  : i64
    %16 = llvm.mul %10, %7  : i64
    %17 = llvm.add %15, %16  : i64
    %18 = llvm.mul %11, %6  : i64
    %19 = llvm.add %17, %18  : i64
    %20 = llvm.add %19, %13  : i64
    %21 = llvm.getelementptr %arg0[%20] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %22 = llvm.load %21 : !llvm.ptr -> f32
    llvm.br ^bb6(%10, %22 : i64, f32)
  ^bb6(%23: i64, %24: f32):  // 2 preds: ^bb5, ^bb10
    %25 = llvm.icmp "slt" %23, %1 : i64
    llvm.cond_br %25, ^bb7, ^bb11
  ^bb7:  // pred: ^bb6
    llvm.br ^bb8(%10, %24 : i64, f32)
  ^bb8(%26: i64, %27: f32):  // 2 preds: ^bb7, ^bb9
    %28 = llvm.icmp "slt" %26, %1 : i64
    llvm.cond_br %28, ^bb9, ^bb10
  ^bb9:  // pred: ^bb8
    %29 = llvm.mul %11, %2  : i64
    %30 = llvm.add %29, %23  : i64
    %31 = llvm.mul %13, %2  : i64
    %32 = llvm.add %31, %26  : i64
    %33 = llvm.mul %10, %5  : i64
    %34 = llvm.mul %10, %4  : i64
    %35 = llvm.add %33, %34  : i64
    %36 = llvm.mul %30, %3  : i64
    %37 = llvm.add %35, %36  : i64
    %38 = llvm.add %37, %32  : i64
    %39 = llvm.getelementptr %arg1[%38] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %40 = llvm.load %39 : !llvm.ptr -> f32
    %41 = llvm.fcmp "ugt" %27, %40 : f32
    %42 = llvm.select %41, %27, %40 : i1, f32
    %43 = llvm.add %26, %9  : i64
    llvm.br ^bb8(%43, %42 : i64, f32)
  ^bb10:  // pred: ^bb8
    %44 = llvm.add %23, %9  : i64
    llvm.br ^bb6(%44, %27 : i64, f32)
  ^bb11:  // pred: ^bb6
    %45 = llvm.mul %10, %8  : i64
    %46 = llvm.mul %10, %7  : i64
    %47 = llvm.add %45, %46  : i64
    %48 = llvm.mul %11, %6  : i64
    %49 = llvm.add %47, %48  : i64
    %50 = llvm.add %49, %13  : i64
    %51 = llvm.getelementptr %arg2[%50] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %24, %51 : f32, !llvm.ptr
    %52 = llvm.add %13, %9  : i64
    llvm.br ^bb4(%52 : i64)
  ^bb12:  // pred: ^bb4
    %53 = llvm.add %11, %9  : i64
    llvm.br ^bb2(%53 : i64)
  ^bb13:  // pred: ^bb2
    llvm.return
  }
}


