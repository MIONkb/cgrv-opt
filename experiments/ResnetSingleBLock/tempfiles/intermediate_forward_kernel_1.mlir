// -----// IR Dump After ArithExpandOps (arith-expand) //----- //
module {
  func.func @forward_kernel_1(%arg0: memref<64xf32>, %arg1: memref<64xf32>, %arg2: memref<64xf32>, %arg3: memref<64xf32>, %arg4: memref<1x64x112x112xf32>, %arg5: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_1} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    %cst = arith.constant 1.000000e-05 : f64
    affine.for %arg6 = 0 to 16 {
      %0 = affine.load %arg0[0] : memref<64xf32>
      %1 = affine.load %arg1[0] : memref<64xf32>
      %2 = affine.load %arg2[0] : memref<64xf32>
      %3 = affine.load %arg3[0] : memref<64xf32>
      affine.for %arg7 = 0 to 112 {
        %4 = affine.load %arg4[0, 0, %arg6, %arg7] : memref<1x64x112x112xf32>
        %5 = arith.truncf %cst : f64 to f32
        %6 = arith.addf %3, %5 : f32
        %cst_0 = arith.constant 5.000000e-01 : f32
        %7 = arith.mulf %6, %cst_0 : f32
        %8 = arith.bitcast %6 : f32 to i32
        %c1_i32 = arith.constant 1 : i32
        %9 = arith.shrui %8, %c1_i32 : i32
        %c1597463007_i32 = arith.constant 1597463007 : i32
        %10 = arith.subi %c1597463007_i32, %9 : i32
        %11 = arith.bitcast %10 : i32 to f32
        %cst_1 = arith.constant 1.500000e+00 : f32
        %12 = arith.mulf %11, %11 : f32
        %13 = arith.mulf %12, %7 : f32
        %14 = arith.subf %cst_1, %13 : f32
        %15 = arith.mulf %14, %12 : f32
        %16 = arith.subf %4, %2 : f32
        %17 = arith.mulf %16, %15 : f32
        %18 = arith.mulf %17, %0 : f32
        %19 = arith.addf %18, %1 : f32
        affine.store %19, %arg5[0, 0, %arg6, %arg7] : memref<1x64x112x112xf32>
      }
    }
    return
  }
}


// -----// IR Dump After ExpandOps (memref-expand) //----- //
module {
  func.func @forward_kernel_1(%arg0: memref<64xf32>, %arg1: memref<64xf32>, %arg2: memref<64xf32>, %arg3: memref<64xf32>, %arg4: memref<1x64x112x112xf32>, %arg5: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_1} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    %cst = arith.constant 1.000000e-05 : f64
    affine.for %arg6 = 0 to 16 {
      %0 = affine.load %arg0[0] : memref<64xf32>
      %1 = affine.load %arg1[0] : memref<64xf32>
      %2 = affine.load %arg2[0] : memref<64xf32>
      %3 = affine.load %arg3[0] : memref<64xf32>
      affine.for %arg7 = 0 to 112 {
        %4 = affine.load %arg4[0, 0, %arg6, %arg7] : memref<1x64x112x112xf32>
        %5 = arith.truncf %cst : f64 to f32
        %6 = arith.addf %3, %5 : f32
        %cst_0 = arith.constant 5.000000e-01 : f32
        %7 = arith.mulf %6, %cst_0 : f32
        %8 = arith.bitcast %6 : f32 to i32
        %c1_i32 = arith.constant 1 : i32
        %9 = arith.shrui %8, %c1_i32 : i32
        %c1597463007_i32 = arith.constant 1597463007 : i32
        %10 = arith.subi %c1597463007_i32, %9 : i32
        %11 = arith.bitcast %10 : i32 to f32
        %cst_1 = arith.constant 1.500000e+00 : f32
        %12 = arith.mulf %11, %11 : f32
        %13 = arith.mulf %12, %7 : f32
        %14 = arith.subf %cst_1, %13 : f32
        %15 = arith.mulf %14, %12 : f32
        %16 = arith.subf %4, %2 : f32
        %17 = arith.mulf %16, %15 : f32
        %18 = arith.mulf %17, %0 : f32
        %19 = arith.addf %18, %1 : f32
        affine.store %19, %arg5[0, 0, %arg6, %arg7] : memref<1x64x112x112xf32>
      }
    }
    return
  }
}


// -----// IR Dump After SimplifyAffineStructures (affine-simplify-structures) //----- //
func.func @forward_kernel_1(%arg0: memref<64xf32>, %arg1: memref<64xf32>, %arg2: memref<64xf32>, %arg3: memref<64xf32>, %arg4: memref<1x64x112x112xf32>, %arg5: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_1} {
  cf.br ^bb1
^bb1:  // pred: ^bb0
  %cst = arith.constant 1.000000e-05 : f64
  affine.for %arg6 = 0 to 16 {
    %0 = affine.load %arg0[0] : memref<64xf32>
    %1 = affine.load %arg1[0] : memref<64xf32>
    %2 = affine.load %arg2[0] : memref<64xf32>
    %3 = affine.load %arg3[0] : memref<64xf32>
    affine.for %arg7 = 0 to 112 {
      %4 = affine.load %arg4[0, 0, %arg6, %arg7] : memref<1x64x112x112xf32>
      %5 = arith.truncf %cst : f64 to f32
      %6 = arith.addf %3, %5 : f32
      %cst_0 = arith.constant 5.000000e-01 : f32
      %7 = arith.mulf %6, %cst_0 : f32
      %8 = arith.bitcast %6 : f32 to i32
      %c1_i32 = arith.constant 1 : i32
      %9 = arith.shrui %8, %c1_i32 : i32
      %c1597463007_i32 = arith.constant 1597463007 : i32
      %10 = arith.subi %c1597463007_i32, %9 : i32
      %11 = arith.bitcast %10 : i32 to f32
      %cst_1 = arith.constant 1.500000e+00 : f32
      %12 = arith.mulf %11, %11 : f32
      %13 = arith.mulf %12, %7 : f32
      %14 = arith.subf %cst_1, %13 : f32
      %15 = arith.mulf %14, %12 : f32
      %16 = arith.subf %4, %2 : f32
      %17 = arith.mulf %16, %15 : f32
      %18 = arith.mulf %17, %0 : f32
      %19 = arith.addf %18, %1 : f32
      affine.store %19, %arg5[0, 0, %arg6, %arg7] : memref<1x64x112x112xf32>
    }
  }
  return
}

// -----// IR Dump After ConvertAffineToStandard (lower-affine) //----- //
module {
  func.func @forward_kernel_1(%arg0: memref<64xf32>, %arg1: memref<64xf32>, %arg2: memref<64xf32>, %arg3: memref<64xf32>, %arg4: memref<1x64x112x112xf32>, %arg5: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_1} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    %cst = arith.constant 1.000000e-05 : f64
    %c0 = arith.constant 0 : index
    %c16 = arith.constant 16 : index
    %c1 = arith.constant 1 : index
    scf.for %arg6 = %c0 to %c16 step %c1 {
      %c0_0 = arith.constant 0 : index
      %0 = memref.load %arg0[%c0_0] : memref<64xf32>
      %c0_1 = arith.constant 0 : index
      %1 = memref.load %arg1[%c0_1] : memref<64xf32>
      %c0_2 = arith.constant 0 : index
      %2 = memref.load %arg2[%c0_2] : memref<64xf32>
      %c0_3 = arith.constant 0 : index
      %3 = memref.load %arg3[%c0_3] : memref<64xf32>
      %c0_4 = arith.constant 0 : index
      %c112 = arith.constant 112 : index
      %c1_5 = arith.constant 1 : index
      scf.for %arg7 = %c0_4 to %c112 step %c1_5 {
        %c0_6 = arith.constant 0 : index
        %c0_7 = arith.constant 0 : index
        %4 = memref.load %arg4[%c0_6, %c0_7, %arg6, %arg7] : memref<1x64x112x112xf32>
        %5 = arith.truncf %cst : f64 to f32
        %6 = arith.addf %3, %5 : f32
        %cst_8 = arith.constant 5.000000e-01 : f32
        %7 = arith.mulf %6, %cst_8 : f32
        %8 = arith.bitcast %6 : f32 to i32
        %c1_i32 = arith.constant 1 : i32
        %9 = arith.shrui %8, %c1_i32 : i32
        %c1597463007_i32 = arith.constant 1597463007 : i32
        %10 = arith.subi %c1597463007_i32, %9 : i32
        %11 = arith.bitcast %10 : i32 to f32
        %cst_9 = arith.constant 1.500000e+00 : f32
        %12 = arith.mulf %11, %11 : f32
        %13 = arith.mulf %12, %7 : f32
        %14 = arith.subf %cst_9, %13 : f32
        %15 = arith.mulf %14, %12 : f32
        %16 = arith.subf %4, %2 : f32
        %17 = arith.mulf %16, %15 : f32
        %18 = arith.mulf %17, %0 : f32
        %19 = arith.addf %18, %1 : f32
        %c0_10 = arith.constant 0 : index
        %c0_11 = arith.constant 0 : index
        memref.store %19, %arg5[%c0_10, %c0_11, %arg6, %arg7] : memref<1x64x112x112xf32>
      }
    }
    return
  }
}


// -----// IR Dump After SCFForLoopCanonicalization (scf-for-loop-canonicalization) //----- //
module {
  func.func @forward_kernel_1(%arg0: memref<64xf32>, %arg1: memref<64xf32>, %arg2: memref<64xf32>, %arg3: memref<64xf32>, %arg4: memref<1x64x112x112xf32>, %arg5: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_1} {
    %cst = arith.constant 1.500000e+00 : f32
    %c1597463007_i32 = arith.constant 1597463007 : i32
    %c1_i32 = arith.constant 1 : i32
    %cst_0 = arith.constant 5.000000e-01 : f32
    %c112 = arith.constant 112 : index
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c0 = arith.constant 0 : index
    %cst_1 = arith.constant 1.000000e-05 : f64
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    scf.for %arg6 = %c0 to %c16 step %c1 {
      %0 = memref.load %arg0[%c0] : memref<64xf32>
      %1 = memref.load %arg1[%c0] : memref<64xf32>
      %2 = memref.load %arg2[%c0] : memref<64xf32>
      %3 = memref.load %arg3[%c0] : memref<64xf32>
      scf.for %arg7 = %c0 to %c112 step %c1 {
        %4 = memref.load %arg4[%c0, %c0, %arg6, %arg7] : memref<1x64x112x112xf32>
        %5 = arith.truncf %cst_1 : f64 to f32
        %6 = arith.addf %3, %5 : f32
        %7 = arith.mulf %6, %cst_0 : f32
        %8 = arith.bitcast %6 : f32 to i32
        %9 = arith.shrui %8, %c1_i32 : i32
        %10 = arith.subi %c1597463007_i32, %9 : i32
        %11 = arith.bitcast %10 : i32 to f32
        %12 = arith.mulf %11, %11 : f32
        %13 = arith.mulf %12, %7 : f32
        %14 = arith.subf %cst, %13 : f32
        %15 = arith.mulf %14, %12 : f32
        %16 = arith.subf %4, %2 : f32
        %17 = arith.mulf %16, %15 : f32
        %18 = arith.mulf %17, %0 : f32
        %19 = arith.addf %18, %1 : f32
        memref.store %19, %arg5[%c0, %c0, %arg6, %arg7] : memref<1x64x112x112xf32>
      }
    }
    return
  }
}


// -----// IR Dump After SCFToControlFlow (convert-scf-to-cf) //----- //
module {
  func.func @forward_kernel_1(%arg0: memref<64xf32>, %arg1: memref<64xf32>, %arg2: memref<64xf32>, %arg3: memref<64xf32>, %arg4: memref<1x64x112x112xf32>, %arg5: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_1} {
    %cst = arith.constant 1.500000e+00 : f32
    %c1597463007_i32 = arith.constant 1597463007 : i32
    %c1_i32 = arith.constant 1 : i32
    %cst_0 = arith.constant 5.000000e-01 : f32
    %c112 = arith.constant 112 : index
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c0 = arith.constant 0 : index
    %cst_1 = arith.constant 1.000000e-05 : f64
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%c0 : index)
  ^bb2(%0: index):  // 2 preds: ^bb1, ^bb6
    %1 = arith.cmpi slt, %0, %c16 : index
    cf.cond_br %1, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    %2 = memref.load %arg0[%c0] : memref<64xf32>
    %3 = memref.load %arg1[%c0] : memref<64xf32>
    %4 = memref.load %arg2[%c0] : memref<64xf32>
    %5 = memref.load %arg3[%c0] : memref<64xf32>
    cf.br ^bb4(%c0 : index)
  ^bb4(%6: index):  // 2 preds: ^bb3, ^bb5
    %7 = arith.cmpi slt, %6, %c112 : index
    cf.cond_br %7, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %8 = memref.load %arg4[%c0, %c0, %0, %6] : memref<1x64x112x112xf32>
    %9 = arith.truncf %cst_1 : f64 to f32
    %10 = arith.addf %5, %9 : f32
    %11 = arith.mulf %10, %cst_0 : f32
    %12 = arith.bitcast %10 : f32 to i32
    %13 = arith.shrui %12, %c1_i32 : i32
    %14 = arith.subi %c1597463007_i32, %13 : i32
    %15 = arith.bitcast %14 : i32 to f32
    %16 = arith.mulf %15, %15 : f32
    %17 = arith.mulf %16, %11 : f32
    %18 = arith.subf %cst, %17 : f32
    %19 = arith.mulf %18, %16 : f32
    %20 = arith.subf %8, %4 : f32
    %21 = arith.mulf %20, %19 : f32
    %22 = arith.mulf %21, %2 : f32
    %23 = arith.addf %22, %3 : f32
    memref.store %23, %arg5[%c0, %c0, %0, %6] : memref<1x64x112x112xf32>
    %24 = arith.addi %6, %c1 : index
    cf.br ^bb4(%24 : index)
  ^bb6:  // pred: ^bb4
    %25 = arith.addi %0, %c1 : index
    cf.br ^bb2(%25 : index)
  ^bb7:  // pred: ^bb2
    return
  }
}


// -----// IR Dump After FinalizeMemRefToLLVMConversionPass (finalize-memref-to-llvm) //----- //
module {
  func.func @forward_kernel_1(%arg0: memref<64xf32>, %arg1: memref<64xf32>, %arg2: memref<64xf32>, %arg3: memref<64xf32>, %arg4: memref<1x64x112x112xf32>, %arg5: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_1} {
    %0 = builtin.unrealized_conversion_cast %arg0 : memref<64xf32> to !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %1 = builtin.unrealized_conversion_cast %arg1 : memref<64xf32> to !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %2 = builtin.unrealized_conversion_cast %arg2 : memref<64xf32> to !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %3 = builtin.unrealized_conversion_cast %arg3 : memref<64xf32> to !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %4 = builtin.unrealized_conversion_cast %arg4 : memref<1x64x112x112xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %5 = builtin.unrealized_conversion_cast %arg5 : memref<1x64x112x112xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %cst = arith.constant 1.500000e+00 : f32
    %c1597463007_i32 = arith.constant 1597463007 : i32
    %c1_i32 = arith.constant 1 : i32
    %cst_0 = arith.constant 5.000000e-01 : f32
    %c112 = arith.constant 112 : index
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c0 = arith.constant 0 : index
    %6 = builtin.unrealized_conversion_cast %c0 : index to i64
    %cst_1 = arith.constant 1.000000e-05 : f64
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%c0 : index)
  ^bb2(%7: index):  // 2 preds: ^bb1, ^bb6
    %8 = builtin.unrealized_conversion_cast %7 : index to i64
    %9 = arith.cmpi slt, %7, %c16 : index
    cf.cond_br %9, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    %10 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %11 = llvm.getelementptr %10[%6] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %12 = llvm.load %11 : !llvm.ptr -> f32
    %13 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %14 = llvm.getelementptr %13[%6] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %15 = llvm.load %14 : !llvm.ptr -> f32
    %16 = llvm.extractvalue %2[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %17 = llvm.getelementptr %16[%6] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %18 = llvm.load %17 : !llvm.ptr -> f32
    %19 = llvm.extractvalue %3[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %20 = llvm.getelementptr %19[%6] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %21 = llvm.load %20 : !llvm.ptr -> f32
    cf.br ^bb4(%c0 : index)
  ^bb4(%22: index):  // 2 preds: ^bb3, ^bb5
    %23 = builtin.unrealized_conversion_cast %22 : index to i64
    %24 = arith.cmpi slt, %22, %c112 : index
    cf.cond_br %24, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %25 = llvm.extractvalue %4[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %26 = llvm.mlir.constant(802816 : index) : i64
    %27 = llvm.mul %6, %26  : i64
    %28 = llvm.mlir.constant(12544 : index) : i64
    %29 = llvm.mul %6, %28  : i64
    %30 = llvm.add %27, %29  : i64
    %31 = llvm.mlir.constant(112 : index) : i64
    %32 = llvm.mul %8, %31  : i64
    %33 = llvm.add %30, %32  : i64
    %34 = llvm.add %33, %23  : i64
    %35 = llvm.getelementptr %25[%34] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %36 = llvm.load %35 : !llvm.ptr -> f32
    %37 = arith.truncf %cst_1 : f64 to f32
    %38 = arith.addf %21, %37 : f32
    %39 = arith.mulf %38, %cst_0 : f32
    %40 = arith.bitcast %38 : f32 to i32
    %41 = arith.shrui %40, %c1_i32 : i32
    %42 = arith.subi %c1597463007_i32, %41 : i32
    %43 = arith.bitcast %42 : i32 to f32
    %44 = arith.mulf %43, %43 : f32
    %45 = arith.mulf %44, %39 : f32
    %46 = arith.subf %cst, %45 : f32
    %47 = arith.mulf %46, %44 : f32
    %48 = arith.subf %36, %18 : f32
    %49 = arith.mulf %48, %47 : f32
    %50 = arith.mulf %49, %12 : f32
    %51 = arith.addf %50, %15 : f32
    %52 = llvm.extractvalue %5[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %53 = llvm.mlir.constant(802816 : index) : i64
    %54 = llvm.mul %6, %53  : i64
    %55 = llvm.mlir.constant(12544 : index) : i64
    %56 = llvm.mul %6, %55  : i64
    %57 = llvm.add %54, %56  : i64
    %58 = llvm.mlir.constant(112 : index) : i64
    %59 = llvm.mul %8, %58  : i64
    %60 = llvm.add %57, %59  : i64
    %61 = llvm.add %60, %23  : i64
    %62 = llvm.getelementptr %52[%61] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %51, %62 : f32, !llvm.ptr
    %63 = arith.addi %22, %c1 : index
    cf.br ^bb4(%63 : index)
  ^bb6:  // pred: ^bb4
    %64 = arith.addi %7, %c1 : index
    cf.br ^bb2(%64 : index)
  ^bb7:  // pred: ^bb2
    return
  }
}


// -----// IR Dump After ConvertMathToLLVMPass (convert-math-to-llvm) //----- //
module {
  func.func @forward_kernel_1(%arg0: memref<64xf32>, %arg1: memref<64xf32>, %arg2: memref<64xf32>, %arg3: memref<64xf32>, %arg4: memref<1x64x112x112xf32>, %arg5: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_1} {
    %0 = builtin.unrealized_conversion_cast %arg0 : memref<64xf32> to !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %1 = builtin.unrealized_conversion_cast %arg1 : memref<64xf32> to !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %2 = builtin.unrealized_conversion_cast %arg2 : memref<64xf32> to !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %3 = builtin.unrealized_conversion_cast %arg3 : memref<64xf32> to !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %4 = builtin.unrealized_conversion_cast %arg4 : memref<1x64x112x112xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %5 = builtin.unrealized_conversion_cast %arg5 : memref<1x64x112x112xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %cst = arith.constant 1.500000e+00 : f32
    %c1597463007_i32 = arith.constant 1597463007 : i32
    %c1_i32 = arith.constant 1 : i32
    %cst_0 = arith.constant 5.000000e-01 : f32
    %c112 = arith.constant 112 : index
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c0 = arith.constant 0 : index
    %6 = builtin.unrealized_conversion_cast %c0 : index to i64
    %cst_1 = arith.constant 1.000000e-05 : f64
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%c0 : index)
  ^bb2(%7: index):  // 2 preds: ^bb1, ^bb6
    %8 = builtin.unrealized_conversion_cast %7 : index to i64
    %9 = arith.cmpi slt, %7, %c16 : index
    cf.cond_br %9, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    %10 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %11 = llvm.getelementptr %10[%6] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %12 = llvm.load %11 : !llvm.ptr -> f32
    %13 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %14 = llvm.getelementptr %13[%6] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %15 = llvm.load %14 : !llvm.ptr -> f32
    %16 = llvm.extractvalue %2[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %17 = llvm.getelementptr %16[%6] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %18 = llvm.load %17 : !llvm.ptr -> f32
    %19 = llvm.extractvalue %3[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %20 = llvm.getelementptr %19[%6] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %21 = llvm.load %20 : !llvm.ptr -> f32
    cf.br ^bb4(%c0 : index)
  ^bb4(%22: index):  // 2 preds: ^bb3, ^bb5
    %23 = builtin.unrealized_conversion_cast %22 : index to i64
    %24 = arith.cmpi slt, %22, %c112 : index
    cf.cond_br %24, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %25 = llvm.extractvalue %4[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %26 = llvm.mlir.constant(802816 : index) : i64
    %27 = llvm.mul %6, %26  : i64
    %28 = llvm.mlir.constant(12544 : index) : i64
    %29 = llvm.mul %6, %28  : i64
    %30 = llvm.add %27, %29  : i64
    %31 = llvm.mlir.constant(112 : index) : i64
    %32 = llvm.mul %8, %31  : i64
    %33 = llvm.add %30, %32  : i64
    %34 = llvm.add %33, %23  : i64
    %35 = llvm.getelementptr %25[%34] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %36 = llvm.load %35 : !llvm.ptr -> f32
    %37 = arith.truncf %cst_1 : f64 to f32
    %38 = arith.addf %21, %37 : f32
    %39 = arith.mulf %38, %cst_0 : f32
    %40 = arith.bitcast %38 : f32 to i32
    %41 = arith.shrui %40, %c1_i32 : i32
    %42 = arith.subi %c1597463007_i32, %41 : i32
    %43 = arith.bitcast %42 : i32 to f32
    %44 = arith.mulf %43, %43 : f32
    %45 = arith.mulf %44, %39 : f32
    %46 = arith.subf %cst, %45 : f32
    %47 = arith.mulf %46, %44 : f32
    %48 = arith.subf %36, %18 : f32
    %49 = arith.mulf %48, %47 : f32
    %50 = arith.mulf %49, %12 : f32
    %51 = arith.addf %50, %15 : f32
    %52 = llvm.extractvalue %5[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %53 = llvm.mlir.constant(802816 : index) : i64
    %54 = llvm.mul %6, %53  : i64
    %55 = llvm.mlir.constant(12544 : index) : i64
    %56 = llvm.mul %6, %55  : i64
    %57 = llvm.add %54, %56  : i64
    %58 = llvm.mlir.constant(112 : index) : i64
    %59 = llvm.mul %8, %58  : i64
    %60 = llvm.add %57, %59  : i64
    %61 = llvm.add %60, %23  : i64
    %62 = llvm.getelementptr %52[%61] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %51, %62 : f32, !llvm.ptr
    %63 = arith.addi %22, %c1 : index
    cf.br ^bb4(%63 : index)
  ^bb6:  // pred: ^bb4
    %64 = arith.addi %7, %c1 : index
    cf.br ^bb2(%64 : index)
  ^bb7:  // pred: ^bb2
    return
  }
}


// -----// IR Dump After ConvertMathToLibm (convert-math-to-libm) //----- //
module {
  func.func @forward_kernel_1(%arg0: memref<64xf32>, %arg1: memref<64xf32>, %arg2: memref<64xf32>, %arg3: memref<64xf32>, %arg4: memref<1x64x112x112xf32>, %arg5: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_1} {
    %0 = builtin.unrealized_conversion_cast %arg0 : memref<64xf32> to !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %1 = builtin.unrealized_conversion_cast %arg1 : memref<64xf32> to !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %2 = builtin.unrealized_conversion_cast %arg2 : memref<64xf32> to !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %3 = builtin.unrealized_conversion_cast %arg3 : memref<64xf32> to !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %4 = builtin.unrealized_conversion_cast %arg4 : memref<1x64x112x112xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %5 = builtin.unrealized_conversion_cast %arg5 : memref<1x64x112x112xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %cst = arith.constant 1.500000e+00 : f32
    %c1597463007_i32 = arith.constant 1597463007 : i32
    %c1_i32 = arith.constant 1 : i32
    %cst_0 = arith.constant 5.000000e-01 : f32
    %c112 = arith.constant 112 : index
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c0 = arith.constant 0 : index
    %6 = builtin.unrealized_conversion_cast %c0 : index to i64
    %cst_1 = arith.constant 1.000000e-05 : f64
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%c0 : index)
  ^bb2(%7: index):  // 2 preds: ^bb1, ^bb6
    %8 = builtin.unrealized_conversion_cast %7 : index to i64
    %9 = arith.cmpi slt, %7, %c16 : index
    cf.cond_br %9, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    %10 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %11 = llvm.getelementptr %10[%6] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %12 = llvm.load %11 : !llvm.ptr -> f32
    %13 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %14 = llvm.getelementptr %13[%6] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %15 = llvm.load %14 : !llvm.ptr -> f32
    %16 = llvm.extractvalue %2[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %17 = llvm.getelementptr %16[%6] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %18 = llvm.load %17 : !llvm.ptr -> f32
    %19 = llvm.extractvalue %3[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %20 = llvm.getelementptr %19[%6] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %21 = llvm.load %20 : !llvm.ptr -> f32
    cf.br ^bb4(%c0 : index)
  ^bb4(%22: index):  // 2 preds: ^bb3, ^bb5
    %23 = builtin.unrealized_conversion_cast %22 : index to i64
    %24 = arith.cmpi slt, %22, %c112 : index
    cf.cond_br %24, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %25 = llvm.extractvalue %4[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %26 = llvm.mlir.constant(802816 : index) : i64
    %27 = llvm.mul %6, %26  : i64
    %28 = llvm.mlir.constant(12544 : index) : i64
    %29 = llvm.mul %6, %28  : i64
    %30 = llvm.add %27, %29  : i64
    %31 = llvm.mlir.constant(112 : index) : i64
    %32 = llvm.mul %8, %31  : i64
    %33 = llvm.add %30, %32  : i64
    %34 = llvm.add %33, %23  : i64
    %35 = llvm.getelementptr %25[%34] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %36 = llvm.load %35 : !llvm.ptr -> f32
    %37 = arith.truncf %cst_1 : f64 to f32
    %38 = arith.addf %21, %37 : f32
    %39 = arith.mulf %38, %cst_0 : f32
    %40 = arith.bitcast %38 : f32 to i32
    %41 = arith.shrui %40, %c1_i32 : i32
    %42 = arith.subi %c1597463007_i32, %41 : i32
    %43 = arith.bitcast %42 : i32 to f32
    %44 = arith.mulf %43, %43 : f32
    %45 = arith.mulf %44, %39 : f32
    %46 = arith.subf %cst, %45 : f32
    %47 = arith.mulf %46, %44 : f32
    %48 = arith.subf %36, %18 : f32
    %49 = arith.mulf %48, %47 : f32
    %50 = arith.mulf %49, %12 : f32
    %51 = arith.addf %50, %15 : f32
    %52 = llvm.extractvalue %5[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %53 = llvm.mlir.constant(802816 : index) : i64
    %54 = llvm.mul %6, %53  : i64
    %55 = llvm.mlir.constant(12544 : index) : i64
    %56 = llvm.mul %6, %55  : i64
    %57 = llvm.add %54, %56  : i64
    %58 = llvm.mlir.constant(112 : index) : i64
    %59 = llvm.mul %8, %58  : i64
    %60 = llvm.add %57, %59  : i64
    %61 = llvm.add %60, %23  : i64
    %62 = llvm.getelementptr %52[%61] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %51, %62 : f32, !llvm.ptr
    %63 = arith.addi %22, %c1 : index
    cf.br ^bb4(%63 : index)
  ^bb6:  // pred: ^bb4
    %64 = arith.addi %7, %c1 : index
    cf.br ^bb2(%64 : index)
  ^bb7:  // pred: ^bb2
    return
  }
}


// -----// IR Dump After ArithToLLVMConversionPass (convert-arith-to-llvm) //----- //
module {
  func.func @forward_kernel_1(%arg0: memref<64xf32>, %arg1: memref<64xf32>, %arg2: memref<64xf32>, %arg3: memref<64xf32>, %arg4: memref<1x64x112x112xf32>, %arg5: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_1} {
    %0 = builtin.unrealized_conversion_cast %arg0 : memref<64xf32> to !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %1 = builtin.unrealized_conversion_cast %arg1 : memref<64xf32> to !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %2 = builtin.unrealized_conversion_cast %arg2 : memref<64xf32> to !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %3 = builtin.unrealized_conversion_cast %arg3 : memref<64xf32> to !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %4 = builtin.unrealized_conversion_cast %arg4 : memref<1x64x112x112xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %5 = builtin.unrealized_conversion_cast %arg5 : memref<1x64x112x112xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %6 = llvm.mlir.constant(1.500000e+00 : f32) : f32
    %7 = llvm.mlir.constant(1597463007 : i32) : i32
    %8 = llvm.mlir.constant(1 : i32) : i32
    %9 = llvm.mlir.constant(5.000000e-01 : f32) : f32
    %10 = llvm.mlir.constant(112 : index) : i64
    %11 = llvm.mlir.constant(1 : index) : i64
    %12 = llvm.mlir.constant(16 : index) : i64
    %13 = llvm.mlir.constant(0 : index) : i64
    %14 = builtin.unrealized_conversion_cast %13 : i64 to index
    %15 = builtin.unrealized_conversion_cast %14 : index to i64
    %16 = llvm.mlir.constant(1.000000e-05 : f64) : f64
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%14 : index)
  ^bb2(%17: index):  // 2 preds: ^bb1, ^bb6
    %18 = builtin.unrealized_conversion_cast %17 : index to i64
    %19 = builtin.unrealized_conversion_cast %17 : index to i64
    %20 = llvm.icmp "slt" %18, %12 : i64
    cf.cond_br %20, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    %21 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %22 = llvm.getelementptr %21[%15] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %23 = llvm.load %22 : !llvm.ptr -> f32
    %24 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %25 = llvm.getelementptr %24[%15] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %26 = llvm.load %25 : !llvm.ptr -> f32
    %27 = llvm.extractvalue %2[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %28 = llvm.getelementptr %27[%15] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %29 = llvm.load %28 : !llvm.ptr -> f32
    %30 = llvm.extractvalue %3[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %31 = llvm.getelementptr %30[%15] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %32 = llvm.load %31 : !llvm.ptr -> f32
    cf.br ^bb4(%14 : index)
  ^bb4(%33: index):  // 2 preds: ^bb3, ^bb5
    %34 = builtin.unrealized_conversion_cast %33 : index to i64
    %35 = builtin.unrealized_conversion_cast %33 : index to i64
    %36 = llvm.icmp "slt" %34, %10 : i64
    cf.cond_br %36, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %37 = llvm.extractvalue %4[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %38 = llvm.mlir.constant(802816 : index) : i64
    %39 = llvm.mul %15, %38  : i64
    %40 = llvm.mlir.constant(12544 : index) : i64
    %41 = llvm.mul %15, %40  : i64
    %42 = llvm.add %39, %41  : i64
    %43 = llvm.mlir.constant(112 : index) : i64
    %44 = llvm.mul %19, %43  : i64
    %45 = llvm.add %42, %44  : i64
    %46 = llvm.add %45, %35  : i64
    %47 = llvm.getelementptr %37[%46] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %48 = llvm.load %47 : !llvm.ptr -> f32
    %49 = llvm.fptrunc %16 : f64 to f32
    %50 = llvm.fadd %32, %49  : f32
    %51 = llvm.fmul %50, %9  : f32
    %52 = llvm.bitcast %50 : f32 to i32
    %53 = llvm.lshr %52, %8  : i32
    %54 = llvm.sub %7, %53  : i32
    %55 = llvm.bitcast %54 : i32 to f32
    %56 = llvm.fmul %55, %55  : f32
    %57 = llvm.fmul %56, %51  : f32
    %58 = llvm.fsub %6, %57  : f32
    %59 = llvm.fmul %58, %56  : f32
    %60 = llvm.fsub %48, %29  : f32
    %61 = llvm.fmul %60, %59  : f32
    %62 = llvm.fmul %61, %23  : f32
    %63 = llvm.fadd %62, %26  : f32
    %64 = llvm.extractvalue %5[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %65 = llvm.mlir.constant(802816 : index) : i64
    %66 = llvm.mul %15, %65  : i64
    %67 = llvm.mlir.constant(12544 : index) : i64
    %68 = llvm.mul %15, %67  : i64
    %69 = llvm.add %66, %68  : i64
    %70 = llvm.mlir.constant(112 : index) : i64
    %71 = llvm.mul %19, %70  : i64
    %72 = llvm.add %69, %71  : i64
    %73 = llvm.add %72, %35  : i64
    %74 = llvm.getelementptr %64[%73] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %63, %74 : f32, !llvm.ptr
    %75 = llvm.add %34, %11  : i64
    %76 = builtin.unrealized_conversion_cast %75 : i64 to index
    cf.br ^bb4(%76 : index)
  ^bb6:  // pred: ^bb4
    %77 = llvm.add %18, %11  : i64
    %78 = builtin.unrealized_conversion_cast %77 : i64 to index
    cf.br ^bb2(%78 : index)
  ^bb7:  // pred: ^bb2
    return
  }
}


// -----// IR Dump After ConvertFuncToLLVMPass (convert-func-to-llvm) //----- //
module attributes {llvm.data_layout = ""} {
  llvm.func @forward_kernel_1(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr, %arg3: !llvm.ptr, %arg4: !llvm.ptr, %arg5: !llvm.ptr) attributes {Kernel, forward_kernel_1} {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %5 = llvm.mlir.constant(64 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %7 = llvm.mlir.constant(1 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %9 = builtin.unrealized_conversion_cast %8 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> to memref<64xf32>
    %10 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %11 = llvm.insertvalue %arg1, %10[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %12 = llvm.insertvalue %arg1, %11[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %13 = llvm.mlir.constant(0 : index) : i64
    %14 = llvm.insertvalue %13, %12[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %15 = llvm.mlir.constant(64 : index) : i64
    %16 = llvm.insertvalue %15, %14[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %17 = llvm.mlir.constant(1 : index) : i64
    %18 = llvm.insertvalue %17, %16[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %19 = builtin.unrealized_conversion_cast %18 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> to memref<64xf32>
    %20 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %21 = llvm.insertvalue %arg2, %20[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %22 = llvm.insertvalue %arg2, %21[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %23 = llvm.mlir.constant(0 : index) : i64
    %24 = llvm.insertvalue %23, %22[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %25 = llvm.mlir.constant(64 : index) : i64
    %26 = llvm.insertvalue %25, %24[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %27 = llvm.mlir.constant(1 : index) : i64
    %28 = llvm.insertvalue %27, %26[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %29 = builtin.unrealized_conversion_cast %28 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> to memref<64xf32>
    %30 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %31 = llvm.insertvalue %arg3, %30[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %32 = llvm.insertvalue %arg3, %31[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %33 = llvm.mlir.constant(0 : index) : i64
    %34 = llvm.insertvalue %33, %32[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %35 = llvm.mlir.constant(64 : index) : i64
    %36 = llvm.insertvalue %35, %34[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %37 = llvm.mlir.constant(1 : index) : i64
    %38 = llvm.insertvalue %37, %36[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %39 = builtin.unrealized_conversion_cast %38 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> to memref<64xf32>
    %40 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %41 = llvm.insertvalue %arg4, %40[0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %42 = llvm.insertvalue %arg4, %41[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %43 = llvm.mlir.constant(0 : index) : i64
    %44 = llvm.insertvalue %43, %42[2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %45 = llvm.mlir.constant(1 : index) : i64
    %46 = llvm.insertvalue %45, %44[3, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %47 = llvm.mlir.constant(802816 : index) : i64
    %48 = llvm.insertvalue %47, %46[4, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %49 = llvm.mlir.constant(64 : index) : i64
    %50 = llvm.insertvalue %49, %48[3, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %51 = llvm.mlir.constant(12544 : index) : i64
    %52 = llvm.insertvalue %51, %50[4, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %53 = llvm.mlir.constant(112 : index) : i64
    %54 = llvm.insertvalue %53, %52[3, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %55 = llvm.mlir.constant(112 : index) : i64
    %56 = llvm.insertvalue %55, %54[4, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %57 = llvm.mlir.constant(112 : index) : i64
    %58 = llvm.insertvalue %57, %56[3, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %59 = llvm.mlir.constant(1 : index) : i64
    %60 = llvm.insertvalue %59, %58[4, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %61 = builtin.unrealized_conversion_cast %60 : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> to memref<1x64x112x112xf32>
    %62 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %63 = llvm.insertvalue %arg5, %62[0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %64 = llvm.insertvalue %arg5, %63[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %65 = llvm.mlir.constant(0 : index) : i64
    %66 = llvm.insertvalue %65, %64[2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %67 = llvm.mlir.constant(1 : index) : i64
    %68 = llvm.insertvalue %67, %66[3, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %69 = llvm.mlir.constant(802816 : index) : i64
    %70 = llvm.insertvalue %69, %68[4, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %71 = llvm.mlir.constant(64 : index) : i64
    %72 = llvm.insertvalue %71, %70[3, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %73 = llvm.mlir.constant(12544 : index) : i64
    %74 = llvm.insertvalue %73, %72[4, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %75 = llvm.mlir.constant(112 : index) : i64
    %76 = llvm.insertvalue %75, %74[3, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %77 = llvm.mlir.constant(112 : index) : i64
    %78 = llvm.insertvalue %77, %76[4, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %79 = llvm.mlir.constant(112 : index) : i64
    %80 = llvm.insertvalue %79, %78[3, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %81 = llvm.mlir.constant(1 : index) : i64
    %82 = llvm.insertvalue %81, %80[4, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %83 = builtin.unrealized_conversion_cast %82 : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> to memref<1x64x112x112xf32>
    %84 = builtin.unrealized_conversion_cast %9 : memref<64xf32> to !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %85 = builtin.unrealized_conversion_cast %19 : memref<64xf32> to !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %86 = builtin.unrealized_conversion_cast %29 : memref<64xf32> to !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %87 = builtin.unrealized_conversion_cast %39 : memref<64xf32> to !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %88 = builtin.unrealized_conversion_cast %61 : memref<1x64x112x112xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %89 = builtin.unrealized_conversion_cast %83 : memref<1x64x112x112xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %90 = llvm.mlir.constant(1.500000e+00 : f32) : f32
    %91 = llvm.mlir.constant(1597463007 : i32) : i32
    %92 = llvm.mlir.constant(1 : i32) : i32
    %93 = llvm.mlir.constant(5.000000e-01 : f32) : f32
    %94 = llvm.mlir.constant(112 : index) : i64
    %95 = llvm.mlir.constant(1 : index) : i64
    %96 = llvm.mlir.constant(16 : index) : i64
    %97 = llvm.mlir.constant(0 : index) : i64
    %98 = builtin.unrealized_conversion_cast %97 : i64 to index
    %99 = builtin.unrealized_conversion_cast %98 : index to i64
    %100 = llvm.mlir.constant(1.000000e-05 : f64) : f64
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%97 : i64)
  ^bb2(%101: i64):  // 2 preds: ^bb1, ^bb6
    %102 = builtin.unrealized_conversion_cast %101 : i64 to index
    %103 = builtin.unrealized_conversion_cast %102 : index to i64
    %104 = builtin.unrealized_conversion_cast %102 : index to i64
    %105 = llvm.icmp "slt" %103, %96 : i64
    llvm.cond_br %105, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    %106 = llvm.extractvalue %84[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %107 = llvm.getelementptr %106[%99] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %108 = llvm.load %107 : !llvm.ptr -> f32
    %109 = llvm.extractvalue %85[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %110 = llvm.getelementptr %109[%99] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %111 = llvm.load %110 : !llvm.ptr -> f32
    %112 = llvm.extractvalue %86[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %113 = llvm.getelementptr %112[%99] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %114 = llvm.load %113 : !llvm.ptr -> f32
    %115 = llvm.extractvalue %87[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %116 = llvm.getelementptr %115[%99] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %117 = llvm.load %116 : !llvm.ptr -> f32
    llvm.br ^bb4(%97 : i64)
  ^bb4(%118: i64):  // 2 preds: ^bb3, ^bb5
    %119 = builtin.unrealized_conversion_cast %118 : i64 to index
    %120 = builtin.unrealized_conversion_cast %119 : index to i64
    %121 = builtin.unrealized_conversion_cast %119 : index to i64
    %122 = llvm.icmp "slt" %120, %94 : i64
    llvm.cond_br %122, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %123 = llvm.extractvalue %88[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %124 = llvm.mlir.constant(802816 : index) : i64
    %125 = llvm.mul %99, %124  : i64
    %126 = llvm.mlir.constant(12544 : index) : i64
    %127 = llvm.mul %99, %126  : i64
    %128 = llvm.add %125, %127  : i64
    %129 = llvm.mlir.constant(112 : index) : i64
    %130 = llvm.mul %104, %129  : i64
    %131 = llvm.add %128, %130  : i64
    %132 = llvm.add %131, %121  : i64
    %133 = llvm.getelementptr %123[%132] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %134 = llvm.load %133 : !llvm.ptr -> f32
    %135 = llvm.fptrunc %100 : f64 to f32
    %136 = llvm.fadd %117, %135  : f32
    %137 = llvm.fmul %136, %93  : f32
    %138 = llvm.bitcast %136 : f32 to i32
    %139 = llvm.lshr %138, %92  : i32
    %140 = llvm.sub %91, %139  : i32
    %141 = llvm.bitcast %140 : i32 to f32
    %142 = llvm.fmul %141, %141  : f32
    %143 = llvm.fmul %142, %137  : f32
    %144 = llvm.fsub %90, %143  : f32
    %145 = llvm.fmul %144, %142  : f32
    %146 = llvm.fsub %134, %114  : f32
    %147 = llvm.fmul %146, %145  : f32
    %148 = llvm.fmul %147, %108  : f32
    %149 = llvm.fadd %148, %111  : f32
    %150 = llvm.extractvalue %89[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %151 = llvm.mlir.constant(802816 : index) : i64
    %152 = llvm.mul %99, %151  : i64
    %153 = llvm.mlir.constant(12544 : index) : i64
    %154 = llvm.mul %99, %153  : i64
    %155 = llvm.add %152, %154  : i64
    %156 = llvm.mlir.constant(112 : index) : i64
    %157 = llvm.mul %104, %156  : i64
    %158 = llvm.add %155, %157  : i64
    %159 = llvm.add %158, %121  : i64
    %160 = llvm.getelementptr %150[%159] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %149, %160 : f32, !llvm.ptr
    %161 = llvm.add %120, %95  : i64
    %162 = builtin.unrealized_conversion_cast %161 : i64 to index
    llvm.br ^bb4(%161 : i64)
  ^bb6:  // pred: ^bb4
    %163 = llvm.add %103, %95  : i64
    %164 = builtin.unrealized_conversion_cast %163 : i64 to index
    llvm.br ^bb2(%163 : i64)
  ^bb7:  // pred: ^bb2
    llvm.return
  }
}


// -----// IR Dump After ReconcileUnrealizedCasts (reconcile-unrealized-casts) //----- //
module attributes {llvm.data_layout = ""} {
  llvm.func @forward_kernel_1(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr, %arg3: !llvm.ptr, %arg4: !llvm.ptr, %arg5: !llvm.ptr) attributes {Kernel, forward_kernel_1} {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %5 = llvm.mlir.constant(64 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %7 = llvm.mlir.constant(1 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %9 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %10 = llvm.insertvalue %arg1, %9[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %11 = llvm.insertvalue %arg1, %10[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %12 = llvm.mlir.constant(0 : index) : i64
    %13 = llvm.insertvalue %12, %11[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %14 = llvm.mlir.constant(64 : index) : i64
    %15 = llvm.insertvalue %14, %13[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %16 = llvm.mlir.constant(1 : index) : i64
    %17 = llvm.insertvalue %16, %15[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %18 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %19 = llvm.insertvalue %arg2, %18[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %20 = llvm.insertvalue %arg2, %19[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %21 = llvm.mlir.constant(0 : index) : i64
    %22 = llvm.insertvalue %21, %20[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %23 = llvm.mlir.constant(64 : index) : i64
    %24 = llvm.insertvalue %23, %22[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %25 = llvm.mlir.constant(1 : index) : i64
    %26 = llvm.insertvalue %25, %24[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %27 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %28 = llvm.insertvalue %arg3, %27[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %29 = llvm.insertvalue %arg3, %28[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %30 = llvm.mlir.constant(0 : index) : i64
    %31 = llvm.insertvalue %30, %29[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %32 = llvm.mlir.constant(64 : index) : i64
    %33 = llvm.insertvalue %32, %31[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %34 = llvm.mlir.constant(1 : index) : i64
    %35 = llvm.insertvalue %34, %33[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %36 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %37 = llvm.insertvalue %arg4, %36[0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %38 = llvm.insertvalue %arg4, %37[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %39 = llvm.mlir.constant(0 : index) : i64
    %40 = llvm.insertvalue %39, %38[2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %41 = llvm.mlir.constant(1 : index) : i64
    %42 = llvm.insertvalue %41, %40[3, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %43 = llvm.mlir.constant(802816 : index) : i64
    %44 = llvm.insertvalue %43, %42[4, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %45 = llvm.mlir.constant(64 : index) : i64
    %46 = llvm.insertvalue %45, %44[3, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %47 = llvm.mlir.constant(12544 : index) : i64
    %48 = llvm.insertvalue %47, %46[4, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %49 = llvm.mlir.constant(112 : index) : i64
    %50 = llvm.insertvalue %49, %48[3, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %51 = llvm.mlir.constant(112 : index) : i64
    %52 = llvm.insertvalue %51, %50[4, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %53 = llvm.mlir.constant(112 : index) : i64
    %54 = llvm.insertvalue %53, %52[3, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %55 = llvm.mlir.constant(1 : index) : i64
    %56 = llvm.insertvalue %55, %54[4, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %57 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %58 = llvm.insertvalue %arg5, %57[0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %59 = llvm.insertvalue %arg5, %58[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %60 = llvm.mlir.constant(0 : index) : i64
    %61 = llvm.insertvalue %60, %59[2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %62 = llvm.mlir.constant(1 : index) : i64
    %63 = llvm.insertvalue %62, %61[3, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %64 = llvm.mlir.constant(802816 : index) : i64
    %65 = llvm.insertvalue %64, %63[4, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %66 = llvm.mlir.constant(64 : index) : i64
    %67 = llvm.insertvalue %66, %65[3, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %68 = llvm.mlir.constant(12544 : index) : i64
    %69 = llvm.insertvalue %68, %67[4, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %70 = llvm.mlir.constant(112 : index) : i64
    %71 = llvm.insertvalue %70, %69[3, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %72 = llvm.mlir.constant(112 : index) : i64
    %73 = llvm.insertvalue %72, %71[4, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %74 = llvm.mlir.constant(112 : index) : i64
    %75 = llvm.insertvalue %74, %73[3, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %76 = llvm.mlir.constant(1 : index) : i64
    %77 = llvm.insertvalue %76, %75[4, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %78 = llvm.mlir.constant(1.500000e+00 : f32) : f32
    %79 = llvm.mlir.constant(1597463007 : i32) : i32
    %80 = llvm.mlir.constant(1 : i32) : i32
    %81 = llvm.mlir.constant(5.000000e-01 : f32) : f32
    %82 = llvm.mlir.constant(112 : index) : i64
    %83 = llvm.mlir.constant(1 : index) : i64
    %84 = llvm.mlir.constant(16 : index) : i64
    %85 = llvm.mlir.constant(0 : index) : i64
    %86 = llvm.mlir.constant(1.000000e-05 : f64) : f64
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%85 : i64)
  ^bb2(%87: i64):  // 2 preds: ^bb1, ^bb6
    %88 = llvm.icmp "slt" %87, %84 : i64
    llvm.cond_br %88, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    %89 = llvm.extractvalue %8[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %90 = llvm.getelementptr %89[%85] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %91 = llvm.load %90 : !llvm.ptr -> f32
    %92 = llvm.extractvalue %17[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %93 = llvm.getelementptr %92[%85] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %94 = llvm.load %93 : !llvm.ptr -> f32
    %95 = llvm.extractvalue %26[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %96 = llvm.getelementptr %95[%85] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %97 = llvm.load %96 : !llvm.ptr -> f32
    %98 = llvm.extractvalue %35[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %99 = llvm.getelementptr %98[%85] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %100 = llvm.load %99 : !llvm.ptr -> f32
    llvm.br ^bb4(%85 : i64)
  ^bb4(%101: i64):  // 2 preds: ^bb3, ^bb5
    %102 = llvm.icmp "slt" %101, %82 : i64
    llvm.cond_br %102, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %103 = llvm.extractvalue %56[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %104 = llvm.mlir.constant(802816 : index) : i64
    %105 = llvm.mul %85, %104  : i64
    %106 = llvm.mlir.constant(12544 : index) : i64
    %107 = llvm.mul %85, %106  : i64
    %108 = llvm.add %105, %107  : i64
    %109 = llvm.mlir.constant(112 : index) : i64
    %110 = llvm.mul %87, %109  : i64
    %111 = llvm.add %108, %110  : i64
    %112 = llvm.add %111, %101  : i64
    %113 = llvm.getelementptr %103[%112] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %114 = llvm.load %113 : !llvm.ptr -> f32
    %115 = llvm.fptrunc %86 : f64 to f32
    %116 = llvm.fadd %100, %115  : f32
    %117 = llvm.fmul %116, %81  : f32
    %118 = llvm.bitcast %116 : f32 to i32
    %119 = llvm.lshr %118, %80  : i32
    %120 = llvm.sub %79, %119  : i32
    %121 = llvm.bitcast %120 : i32 to f32
    %122 = llvm.fmul %121, %121  : f32
    %123 = llvm.fmul %122, %117  : f32
    %124 = llvm.fsub %78, %123  : f32
    %125 = llvm.fmul %124, %122  : f32
    %126 = llvm.fsub %114, %97  : f32
    %127 = llvm.fmul %126, %125  : f32
    %128 = llvm.fmul %127, %91  : f32
    %129 = llvm.fadd %128, %94  : f32
    %130 = llvm.extractvalue %77[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %131 = llvm.mlir.constant(802816 : index) : i64
    %132 = llvm.mul %85, %131  : i64
    %133 = llvm.mlir.constant(12544 : index) : i64
    %134 = llvm.mul %85, %133  : i64
    %135 = llvm.add %132, %134  : i64
    %136 = llvm.mlir.constant(112 : index) : i64
    %137 = llvm.mul %87, %136  : i64
    %138 = llvm.add %135, %137  : i64
    %139 = llvm.add %138, %101  : i64
    %140 = llvm.getelementptr %130[%139] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %129, %140 : f32, !llvm.ptr
    %141 = llvm.add %101, %83  : i64
    llvm.br ^bb4(%141 : i64)
  ^bb6:  // pred: ^bb4
    %142 = llvm.add %87, %83  : i64
    llvm.br ^bb2(%142 : i64)
  ^bb7:  // pred: ^bb2
    llvm.return
  }
}


// -----// IR Dump After Canonicalizer (canonicalize) //----- //
module attributes {llvm.data_layout = ""} {
  llvm.func @forward_kernel_1(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr, %arg3: !llvm.ptr, %arg4: !llvm.ptr, %arg5: !llvm.ptr) attributes {Kernel, forward_kernel_1} {
    %0 = llvm.mlir.constant(1.000000e-05 : f64) : f64
    %1 = llvm.mlir.constant(16 : index) : i64
    %2 = llvm.mlir.constant(5.000000e-01 : f32) : f32
    %3 = llvm.mlir.constant(1 : i32) : i32
    %4 = llvm.mlir.constant(1597463007 : i32) : i32
    %5 = llvm.mlir.constant(1.500000e+00 : f32) : f32
    %6 = llvm.mlir.constant(112 : index) : i64
    %7 = llvm.mlir.constant(12544 : index) : i64
    %8 = llvm.mlir.constant(802816 : index) : i64
    %9 = llvm.mlir.constant(1 : index) : i64
    %10 = llvm.mlir.constant(0 : index) : i64
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%10 : i64)
  ^bb2(%11: i64):  // 2 preds: ^bb1, ^bb6
    %12 = llvm.icmp "slt" %11, %1 : i64
    llvm.cond_br %12, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    %13 = llvm.load %arg0 : !llvm.ptr -> f32
    %14 = llvm.load %arg1 : !llvm.ptr -> f32
    %15 = llvm.load %arg2 : !llvm.ptr -> f32
    %16 = llvm.load %arg3 : !llvm.ptr -> f32
    llvm.br ^bb4(%10 : i64)
  ^bb4(%17: i64):  // 2 preds: ^bb3, ^bb5
    %18 = llvm.icmp "slt" %17, %6 : i64
    llvm.cond_br %18, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %19 = llvm.mul %10, %8  : i64
    %20 = llvm.mul %10, %7  : i64
    %21 = llvm.add %19, %20  : i64
    %22 = llvm.mul %11, %6  : i64
    %23 = llvm.add %21, %22  : i64
    %24 = llvm.add %23, %17  : i64
    %25 = llvm.getelementptr %arg4[%24] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %26 = llvm.load %25 : !llvm.ptr -> f32
    %27 = llvm.fptrunc %0 : f64 to f32
    %28 = llvm.fadd %16, %27  : f32
    %29 = llvm.fmul %28, %2  : f32
    %30 = llvm.bitcast %28 : f32 to i32
    %31 = llvm.lshr %30, %3  : i32
    %32 = llvm.sub %4, %31  : i32
    %33 = llvm.bitcast %32 : i32 to f32
    %34 = llvm.fmul %33, %33  : f32
    %35 = llvm.fmul %34, %29  : f32
    %36 = llvm.fsub %5, %35  : f32
    %37 = llvm.fmul %36, %34  : f32
    %38 = llvm.fsub %26, %15  : f32
    %39 = llvm.fmul %38, %37  : f32
    %40 = llvm.fmul %39, %13  : f32
    %41 = llvm.fadd %40, %14  : f32
    %42 = llvm.mul %10, %8  : i64
    %43 = llvm.mul %10, %7  : i64
    %44 = llvm.add %42, %43  : i64
    %45 = llvm.mul %11, %6  : i64
    %46 = llvm.add %44, %45  : i64
    %47 = llvm.add %46, %17  : i64
    %48 = llvm.getelementptr %arg5[%47] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %41, %48 : f32, !llvm.ptr
    %49 = llvm.add %17, %9  : i64
    llvm.br ^bb4(%49 : i64)
  ^bb6:  // pred: ^bb4
    %50 = llvm.add %11, %9  : i64
    llvm.br ^bb2(%50 : i64)
  ^bb7:  // pred: ^bb2
    llvm.return
  }
}


