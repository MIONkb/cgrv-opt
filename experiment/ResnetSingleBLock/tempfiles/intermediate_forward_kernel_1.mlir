// -----// IR Dump After ArithExpandOps (arith-expand) //----- //
#map = affine_map<(d0) -> (d0 + 1)>
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
      affine.for %arg7 = 0 to 112 step 2 {
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
        %20 = affine.apply #map(%arg7)
        %21 = affine.load %arg4[0, 0, %arg6, %20] : memref<1x64x112x112xf32>
        %22 = arith.truncf %cst : f64 to f32
        %23 = arith.addf %3, %22 : f32
        %cst_2 = arith.constant 5.000000e-01 : f32
        %24 = arith.mulf %23, %cst_2 : f32
        %25 = arith.bitcast %23 : f32 to i32
        %c1_i32_3 = arith.constant 1 : i32
        %26 = arith.shrui %25, %c1_i32_3 : i32
        %c1597463007_i32_4 = arith.constant 1597463007 : i32
        %27 = arith.subi %c1597463007_i32_4, %26 : i32
        %28 = arith.bitcast %27 : i32 to f32
        %cst_5 = arith.constant 1.500000e+00 : f32
        %29 = arith.mulf %28, %28 : f32
        %30 = arith.mulf %29, %24 : f32
        %31 = arith.subf %cst_5, %30 : f32
        %32 = arith.mulf %31, %29 : f32
        %33 = arith.subf %21, %2 : f32
        %34 = arith.mulf %33, %32 : f32
        %35 = arith.mulf %34, %0 : f32
        %36 = arith.addf %35, %1 : f32
        affine.store %36, %arg5[0, 0, %arg6, %20] : memref<1x64x112x112xf32>
      }
    }
    return
  }
}


// -----// IR Dump After ExpandOps (memref-expand) //----- //
#map = affine_map<(d0) -> (d0 + 1)>
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
      affine.for %arg7 = 0 to 112 step 2 {
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
        %20 = affine.apply #map(%arg7)
        %21 = affine.load %arg4[0, 0, %arg6, %20] : memref<1x64x112x112xf32>
        %22 = arith.truncf %cst : f64 to f32
        %23 = arith.addf %3, %22 : f32
        %cst_2 = arith.constant 5.000000e-01 : f32
        %24 = arith.mulf %23, %cst_2 : f32
        %25 = arith.bitcast %23 : f32 to i32
        %c1_i32_3 = arith.constant 1 : i32
        %26 = arith.shrui %25, %c1_i32_3 : i32
        %c1597463007_i32_4 = arith.constant 1597463007 : i32
        %27 = arith.subi %c1597463007_i32_4, %26 : i32
        %28 = arith.bitcast %27 : i32 to f32
        %cst_5 = arith.constant 1.500000e+00 : f32
        %29 = arith.mulf %28, %28 : f32
        %30 = arith.mulf %29, %24 : f32
        %31 = arith.subf %cst_5, %30 : f32
        %32 = arith.mulf %31, %29 : f32
        %33 = arith.subf %21, %2 : f32
        %34 = arith.mulf %33, %32 : f32
        %35 = arith.mulf %34, %0 : f32
        %36 = arith.addf %35, %1 : f32
        affine.store %36, %arg5[0, 0, %arg6, %20] : memref<1x64x112x112xf32>
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
    affine.for %arg7 = 0 to 112 step 2 {
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
      %20 = affine.apply affine_map<(d0) -> (d0 + 1)>(%arg7)
      %21 = affine.load %arg4[0, 0, %arg6, %20] : memref<1x64x112x112xf32>
      %22 = arith.truncf %cst : f64 to f32
      %23 = arith.addf %3, %22 : f32
      %cst_2 = arith.constant 5.000000e-01 : f32
      %24 = arith.mulf %23, %cst_2 : f32
      %25 = arith.bitcast %23 : f32 to i32
      %c1_i32_3 = arith.constant 1 : i32
      %26 = arith.shrui %25, %c1_i32_3 : i32
      %c1597463007_i32_4 = arith.constant 1597463007 : i32
      %27 = arith.subi %c1597463007_i32_4, %26 : i32
      %28 = arith.bitcast %27 : i32 to f32
      %cst_5 = arith.constant 1.500000e+00 : f32
      %29 = arith.mulf %28, %28 : f32
      %30 = arith.mulf %29, %24 : f32
      %31 = arith.subf %cst_5, %30 : f32
      %32 = arith.mulf %31, %29 : f32
      %33 = arith.subf %21, %2 : f32
      %34 = arith.mulf %33, %32 : f32
      %35 = arith.mulf %34, %0 : f32
      %36 = arith.addf %35, %1 : f32
      affine.store %36, %arg5[0, 0, %arg6, %20] : memref<1x64x112x112xf32>
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
      %c2 = arith.constant 2 : index
      scf.for %arg7 = %c0_4 to %c112 step %c2 {
        %c0_5 = arith.constant 0 : index
        %c0_6 = arith.constant 0 : index
        %4 = memref.load %arg4[%c0_5, %c0_6, %arg6, %arg7] : memref<1x64x112x112xf32>
        %5 = arith.truncf %cst : f64 to f32
        %6 = arith.addf %3, %5 : f32
        %cst_7 = arith.constant 5.000000e-01 : f32
        %7 = arith.mulf %6, %cst_7 : f32
        %8 = arith.bitcast %6 : f32 to i32
        %c1_i32 = arith.constant 1 : i32
        %9 = arith.shrui %8, %c1_i32 : i32
        %c1597463007_i32 = arith.constant 1597463007 : i32
        %10 = arith.subi %c1597463007_i32, %9 : i32
        %11 = arith.bitcast %10 : i32 to f32
        %cst_8 = arith.constant 1.500000e+00 : f32
        %12 = arith.mulf %11, %11 : f32
        %13 = arith.mulf %12, %7 : f32
        %14 = arith.subf %cst_8, %13 : f32
        %15 = arith.mulf %14, %12 : f32
        %16 = arith.subf %4, %2 : f32
        %17 = arith.mulf %16, %15 : f32
        %18 = arith.mulf %17, %0 : f32
        %19 = arith.addf %18, %1 : f32
        %c0_9 = arith.constant 0 : index
        %c0_10 = arith.constant 0 : index
        memref.store %19, %arg5[%c0_9, %c0_10, %arg6, %arg7] : memref<1x64x112x112xf32>
        %c1_11 = arith.constant 1 : index
        %20 = arith.addi %arg7, %c1_11 : index
        %c0_12 = arith.constant 0 : index
        %c0_13 = arith.constant 0 : index
        %21 = memref.load %arg4[%c0_12, %c0_13, %arg6, %20] : memref<1x64x112x112xf32>
        %22 = arith.truncf %cst : f64 to f32
        %23 = arith.addf %3, %22 : f32
        %cst_14 = arith.constant 5.000000e-01 : f32
        %24 = arith.mulf %23, %cst_14 : f32
        %25 = arith.bitcast %23 : f32 to i32
        %c1_i32_15 = arith.constant 1 : i32
        %26 = arith.shrui %25, %c1_i32_15 : i32
        %c1597463007_i32_16 = arith.constant 1597463007 : i32
        %27 = arith.subi %c1597463007_i32_16, %26 : i32
        %28 = arith.bitcast %27 : i32 to f32
        %cst_17 = arith.constant 1.500000e+00 : f32
        %29 = arith.mulf %28, %28 : f32
        %30 = arith.mulf %29, %24 : f32
        %31 = arith.subf %cst_17, %30 : f32
        %32 = arith.mulf %31, %29 : f32
        %33 = arith.subf %21, %2 : f32
        %34 = arith.mulf %33, %32 : f32
        %35 = arith.mulf %34, %0 : f32
        %36 = arith.addf %35, %1 : f32
        %c0_18 = arith.constant 0 : index
        %c0_19 = arith.constant 0 : index
        memref.store %36, %arg5[%c0_18, %c0_19, %arg6, %20] : memref<1x64x112x112xf32>
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
    %c2 = arith.constant 2 : index
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
      scf.for %arg7 = %c0 to %c112 step %c2 {
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
        %20 = arith.addi %arg7, %c1 : index
        %21 = memref.load %arg4[%c0, %c0, %arg6, %20] : memref<1x64x112x112xf32>
        %22 = arith.truncf %cst_1 : f64 to f32
        %23 = arith.addf %3, %22 : f32
        %24 = arith.mulf %23, %cst_0 : f32
        %25 = arith.bitcast %23 : f32 to i32
        %26 = arith.shrui %25, %c1_i32 : i32
        %27 = arith.subi %c1597463007_i32, %26 : i32
        %28 = arith.bitcast %27 : i32 to f32
        %29 = arith.mulf %28, %28 : f32
        %30 = arith.mulf %29, %24 : f32
        %31 = arith.subf %cst, %30 : f32
        %32 = arith.mulf %31, %29 : f32
        %33 = arith.subf %21, %2 : f32
        %34 = arith.mulf %33, %32 : f32
        %35 = arith.mulf %34, %0 : f32
        %36 = arith.addf %35, %1 : f32
        memref.store %36, %arg5[%c0, %c0, %arg6, %20] : memref<1x64x112x112xf32>
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
    %c2 = arith.constant 2 : index
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
    %25 = memref.load %arg4[%c0, %c0, %0, %24] : memref<1x64x112x112xf32>
    %26 = arith.truncf %cst_1 : f64 to f32
    %27 = arith.addf %5, %26 : f32
    %28 = arith.mulf %27, %cst_0 : f32
    %29 = arith.bitcast %27 : f32 to i32
    %30 = arith.shrui %29, %c1_i32 : i32
    %31 = arith.subi %c1597463007_i32, %30 : i32
    %32 = arith.bitcast %31 : i32 to f32
    %33 = arith.mulf %32, %32 : f32
    %34 = arith.mulf %33, %28 : f32
    %35 = arith.subf %cst, %34 : f32
    %36 = arith.mulf %35, %33 : f32
    %37 = arith.subf %25, %4 : f32
    %38 = arith.mulf %37, %36 : f32
    %39 = arith.mulf %38, %2 : f32
    %40 = arith.addf %39, %3 : f32
    memref.store %40, %arg5[%c0, %c0, %0, %24] : memref<1x64x112x112xf32>
    %41 = arith.addi %6, %c2 : index
    cf.br ^bb4(%41 : index)
  ^bb6:  // pred: ^bb4
    %42 = arith.addi %0, %c1 : index
    cf.br ^bb2(%42 : index)
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
    %c2 = arith.constant 2 : index
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
    %64 = builtin.unrealized_conversion_cast %63 : index to i64
    %65 = llvm.extractvalue %4[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %66 = llvm.mlir.constant(802816 : index) : i64
    %67 = llvm.mul %6, %66  : i64
    %68 = llvm.mlir.constant(12544 : index) : i64
    %69 = llvm.mul %6, %68  : i64
    %70 = llvm.add %67, %69  : i64
    %71 = llvm.mlir.constant(112 : index) : i64
    %72 = llvm.mul %8, %71  : i64
    %73 = llvm.add %70, %72  : i64
    %74 = llvm.add %73, %64  : i64
    %75 = llvm.getelementptr %65[%74] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %76 = llvm.load %75 : !llvm.ptr -> f32
    %77 = arith.truncf %cst_1 : f64 to f32
    %78 = arith.addf %21, %77 : f32
    %79 = arith.mulf %78, %cst_0 : f32
    %80 = arith.bitcast %78 : f32 to i32
    %81 = arith.shrui %80, %c1_i32 : i32
    %82 = arith.subi %c1597463007_i32, %81 : i32
    %83 = arith.bitcast %82 : i32 to f32
    %84 = arith.mulf %83, %83 : f32
    %85 = arith.mulf %84, %79 : f32
    %86 = arith.subf %cst, %85 : f32
    %87 = arith.mulf %86, %84 : f32
    %88 = arith.subf %76, %18 : f32
    %89 = arith.mulf %88, %87 : f32
    %90 = arith.mulf %89, %12 : f32
    %91 = arith.addf %90, %15 : f32
    %92 = llvm.extractvalue %5[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %93 = llvm.mlir.constant(802816 : index) : i64
    %94 = llvm.mul %6, %93  : i64
    %95 = llvm.mlir.constant(12544 : index) : i64
    %96 = llvm.mul %6, %95  : i64
    %97 = llvm.add %94, %96  : i64
    %98 = llvm.mlir.constant(112 : index) : i64
    %99 = llvm.mul %8, %98  : i64
    %100 = llvm.add %97, %99  : i64
    %101 = llvm.add %100, %64  : i64
    %102 = llvm.getelementptr %92[%101] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %91, %102 : f32, !llvm.ptr
    %103 = arith.addi %22, %c2 : index
    cf.br ^bb4(%103 : index)
  ^bb6:  // pred: ^bb4
    %104 = arith.addi %7, %c1 : index
    cf.br ^bb2(%104 : index)
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
    %c2 = arith.constant 2 : index
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
    %64 = builtin.unrealized_conversion_cast %63 : index to i64
    %65 = llvm.extractvalue %4[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %66 = llvm.mlir.constant(802816 : index) : i64
    %67 = llvm.mul %6, %66  : i64
    %68 = llvm.mlir.constant(12544 : index) : i64
    %69 = llvm.mul %6, %68  : i64
    %70 = llvm.add %67, %69  : i64
    %71 = llvm.mlir.constant(112 : index) : i64
    %72 = llvm.mul %8, %71  : i64
    %73 = llvm.add %70, %72  : i64
    %74 = llvm.add %73, %64  : i64
    %75 = llvm.getelementptr %65[%74] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %76 = llvm.load %75 : !llvm.ptr -> f32
    %77 = arith.truncf %cst_1 : f64 to f32
    %78 = arith.addf %21, %77 : f32
    %79 = arith.mulf %78, %cst_0 : f32
    %80 = arith.bitcast %78 : f32 to i32
    %81 = arith.shrui %80, %c1_i32 : i32
    %82 = arith.subi %c1597463007_i32, %81 : i32
    %83 = arith.bitcast %82 : i32 to f32
    %84 = arith.mulf %83, %83 : f32
    %85 = arith.mulf %84, %79 : f32
    %86 = arith.subf %cst, %85 : f32
    %87 = arith.mulf %86, %84 : f32
    %88 = arith.subf %76, %18 : f32
    %89 = arith.mulf %88, %87 : f32
    %90 = arith.mulf %89, %12 : f32
    %91 = arith.addf %90, %15 : f32
    %92 = llvm.extractvalue %5[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %93 = llvm.mlir.constant(802816 : index) : i64
    %94 = llvm.mul %6, %93  : i64
    %95 = llvm.mlir.constant(12544 : index) : i64
    %96 = llvm.mul %6, %95  : i64
    %97 = llvm.add %94, %96  : i64
    %98 = llvm.mlir.constant(112 : index) : i64
    %99 = llvm.mul %8, %98  : i64
    %100 = llvm.add %97, %99  : i64
    %101 = llvm.add %100, %64  : i64
    %102 = llvm.getelementptr %92[%101] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %91, %102 : f32, !llvm.ptr
    %103 = arith.addi %22, %c2 : index
    cf.br ^bb4(%103 : index)
  ^bb6:  // pred: ^bb4
    %104 = arith.addi %7, %c1 : index
    cf.br ^bb2(%104 : index)
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
    %c2 = arith.constant 2 : index
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
    %64 = builtin.unrealized_conversion_cast %63 : index to i64
    %65 = llvm.extractvalue %4[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %66 = llvm.mlir.constant(802816 : index) : i64
    %67 = llvm.mul %6, %66  : i64
    %68 = llvm.mlir.constant(12544 : index) : i64
    %69 = llvm.mul %6, %68  : i64
    %70 = llvm.add %67, %69  : i64
    %71 = llvm.mlir.constant(112 : index) : i64
    %72 = llvm.mul %8, %71  : i64
    %73 = llvm.add %70, %72  : i64
    %74 = llvm.add %73, %64  : i64
    %75 = llvm.getelementptr %65[%74] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %76 = llvm.load %75 : !llvm.ptr -> f32
    %77 = arith.truncf %cst_1 : f64 to f32
    %78 = arith.addf %21, %77 : f32
    %79 = arith.mulf %78, %cst_0 : f32
    %80 = arith.bitcast %78 : f32 to i32
    %81 = arith.shrui %80, %c1_i32 : i32
    %82 = arith.subi %c1597463007_i32, %81 : i32
    %83 = arith.bitcast %82 : i32 to f32
    %84 = arith.mulf %83, %83 : f32
    %85 = arith.mulf %84, %79 : f32
    %86 = arith.subf %cst, %85 : f32
    %87 = arith.mulf %86, %84 : f32
    %88 = arith.subf %76, %18 : f32
    %89 = arith.mulf %88, %87 : f32
    %90 = arith.mulf %89, %12 : f32
    %91 = arith.addf %90, %15 : f32
    %92 = llvm.extractvalue %5[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %93 = llvm.mlir.constant(802816 : index) : i64
    %94 = llvm.mul %6, %93  : i64
    %95 = llvm.mlir.constant(12544 : index) : i64
    %96 = llvm.mul %6, %95  : i64
    %97 = llvm.add %94, %96  : i64
    %98 = llvm.mlir.constant(112 : index) : i64
    %99 = llvm.mul %8, %98  : i64
    %100 = llvm.add %97, %99  : i64
    %101 = llvm.add %100, %64  : i64
    %102 = llvm.getelementptr %92[%101] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %91, %102 : f32, !llvm.ptr
    %103 = arith.addi %22, %c2 : index
    cf.br ^bb4(%103 : index)
  ^bb6:  // pred: ^bb4
    %104 = arith.addi %7, %c1 : index
    cf.br ^bb2(%104 : index)
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
    %10 = llvm.mlir.constant(2 : index) : i64
    %11 = llvm.mlir.constant(112 : index) : i64
    %12 = llvm.mlir.constant(1 : index) : i64
    %13 = llvm.mlir.constant(16 : index) : i64
    %14 = llvm.mlir.constant(0 : index) : i64
    %15 = builtin.unrealized_conversion_cast %14 : i64 to index
    %16 = builtin.unrealized_conversion_cast %15 : index to i64
    %17 = llvm.mlir.constant(1.000000e-05 : f64) : f64
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%15 : index)
  ^bb2(%18: index):  // 2 preds: ^bb1, ^bb6
    %19 = builtin.unrealized_conversion_cast %18 : index to i64
    %20 = builtin.unrealized_conversion_cast %18 : index to i64
    %21 = llvm.icmp "slt" %19, %13 : i64
    cf.cond_br %21, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    %22 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %23 = llvm.getelementptr %22[%16] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %24 = llvm.load %23 : !llvm.ptr -> f32
    %25 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %26 = llvm.getelementptr %25[%16] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %27 = llvm.load %26 : !llvm.ptr -> f32
    %28 = llvm.extractvalue %2[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %29 = llvm.getelementptr %28[%16] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %30 = llvm.load %29 : !llvm.ptr -> f32
    %31 = llvm.extractvalue %3[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %32 = llvm.getelementptr %31[%16] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %33 = llvm.load %32 : !llvm.ptr -> f32
    cf.br ^bb4(%15 : index)
  ^bb4(%34: index):  // 2 preds: ^bb3, ^bb5
    %35 = builtin.unrealized_conversion_cast %34 : index to i64
    %36 = builtin.unrealized_conversion_cast %34 : index to i64
    %37 = llvm.icmp "slt" %35, %11 : i64
    cf.cond_br %37, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %38 = llvm.extractvalue %4[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %39 = llvm.mlir.constant(802816 : index) : i64
    %40 = llvm.mul %16, %39  : i64
    %41 = llvm.mlir.constant(12544 : index) : i64
    %42 = llvm.mul %16, %41  : i64
    %43 = llvm.add %40, %42  : i64
    %44 = llvm.mlir.constant(112 : index) : i64
    %45 = llvm.mul %20, %44  : i64
    %46 = llvm.add %43, %45  : i64
    %47 = llvm.add %46, %36  : i64
    %48 = llvm.getelementptr %38[%47] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %49 = llvm.load %48 : !llvm.ptr -> f32
    %50 = llvm.fptrunc %17 : f64 to f32
    %51 = llvm.fadd %33, %50  : f32
    %52 = llvm.fmul %51, %9  : f32
    %53 = llvm.bitcast %51 : f32 to i32
    %54 = llvm.lshr %53, %8  : i32
    %55 = llvm.sub %7, %54  : i32
    %56 = llvm.bitcast %55 : i32 to f32
    %57 = llvm.fmul %56, %56  : f32
    %58 = llvm.fmul %57, %52  : f32
    %59 = llvm.fsub %6, %58  : f32
    %60 = llvm.fmul %59, %57  : f32
    %61 = llvm.fsub %49, %30  : f32
    %62 = llvm.fmul %61, %60  : f32
    %63 = llvm.fmul %62, %24  : f32
    %64 = llvm.fadd %63, %27  : f32
    %65 = llvm.extractvalue %5[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %66 = llvm.mlir.constant(802816 : index) : i64
    %67 = llvm.mul %16, %66  : i64
    %68 = llvm.mlir.constant(12544 : index) : i64
    %69 = llvm.mul %16, %68  : i64
    %70 = llvm.add %67, %69  : i64
    %71 = llvm.mlir.constant(112 : index) : i64
    %72 = llvm.mul %20, %71  : i64
    %73 = llvm.add %70, %72  : i64
    %74 = llvm.add %73, %36  : i64
    %75 = llvm.getelementptr %65[%74] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %64, %75 : f32, !llvm.ptr
    %76 = llvm.add %35, %12  : i64
    %77 = builtin.unrealized_conversion_cast %76 : i64 to index
    %78 = builtin.unrealized_conversion_cast %77 : index to i64
    %79 = llvm.extractvalue %4[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %80 = llvm.mlir.constant(802816 : index) : i64
    %81 = llvm.mul %16, %80  : i64
    %82 = llvm.mlir.constant(12544 : index) : i64
    %83 = llvm.mul %16, %82  : i64
    %84 = llvm.add %81, %83  : i64
    %85 = llvm.mlir.constant(112 : index) : i64
    %86 = llvm.mul %20, %85  : i64
    %87 = llvm.add %84, %86  : i64
    %88 = llvm.add %87, %78  : i64
    %89 = llvm.getelementptr %79[%88] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %90 = llvm.load %89 : !llvm.ptr -> f32
    %91 = llvm.fptrunc %17 : f64 to f32
    %92 = llvm.fadd %33, %91  : f32
    %93 = llvm.fmul %92, %9  : f32
    %94 = llvm.bitcast %92 : f32 to i32
    %95 = llvm.lshr %94, %8  : i32
    %96 = llvm.sub %7, %95  : i32
    %97 = llvm.bitcast %96 : i32 to f32
    %98 = llvm.fmul %97, %97  : f32
    %99 = llvm.fmul %98, %93  : f32
    %100 = llvm.fsub %6, %99  : f32
    %101 = llvm.fmul %100, %98  : f32
    %102 = llvm.fsub %90, %30  : f32
    %103 = llvm.fmul %102, %101  : f32
    %104 = llvm.fmul %103, %24  : f32
    %105 = llvm.fadd %104, %27  : f32
    %106 = llvm.extractvalue %5[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %107 = llvm.mlir.constant(802816 : index) : i64
    %108 = llvm.mul %16, %107  : i64
    %109 = llvm.mlir.constant(12544 : index) : i64
    %110 = llvm.mul %16, %109  : i64
    %111 = llvm.add %108, %110  : i64
    %112 = llvm.mlir.constant(112 : index) : i64
    %113 = llvm.mul %20, %112  : i64
    %114 = llvm.add %111, %113  : i64
    %115 = llvm.add %114, %78  : i64
    %116 = llvm.getelementptr %106[%115] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %105, %116 : f32, !llvm.ptr
    %117 = llvm.add %35, %10  : i64
    %118 = builtin.unrealized_conversion_cast %117 : i64 to index
    cf.br ^bb4(%118 : index)
  ^bb6:  // pred: ^bb4
    %119 = llvm.add %19, %12  : i64
    %120 = builtin.unrealized_conversion_cast %119 : i64 to index
    cf.br ^bb2(%120 : index)
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
    %94 = llvm.mlir.constant(2 : index) : i64
    %95 = llvm.mlir.constant(112 : index) : i64
    %96 = llvm.mlir.constant(1 : index) : i64
    %97 = llvm.mlir.constant(16 : index) : i64
    %98 = llvm.mlir.constant(0 : index) : i64
    %99 = builtin.unrealized_conversion_cast %98 : i64 to index
    %100 = builtin.unrealized_conversion_cast %99 : index to i64
    %101 = llvm.mlir.constant(1.000000e-05 : f64) : f64
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%98 : i64)
  ^bb2(%102: i64):  // 2 preds: ^bb1, ^bb6
    %103 = builtin.unrealized_conversion_cast %102 : i64 to index
    %104 = builtin.unrealized_conversion_cast %103 : index to i64
    %105 = builtin.unrealized_conversion_cast %103 : index to i64
    %106 = llvm.icmp "slt" %104, %97 : i64
    llvm.cond_br %106, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    %107 = llvm.extractvalue %84[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %108 = llvm.getelementptr %107[%100] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %109 = llvm.load %108 : !llvm.ptr -> f32
    %110 = llvm.extractvalue %85[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %111 = llvm.getelementptr %110[%100] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %112 = llvm.load %111 : !llvm.ptr -> f32
    %113 = llvm.extractvalue %86[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %114 = llvm.getelementptr %113[%100] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %115 = llvm.load %114 : !llvm.ptr -> f32
    %116 = llvm.extractvalue %87[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %117 = llvm.getelementptr %116[%100] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %118 = llvm.load %117 : !llvm.ptr -> f32
    llvm.br ^bb4(%98 : i64)
  ^bb4(%119: i64):  // 2 preds: ^bb3, ^bb5
    %120 = builtin.unrealized_conversion_cast %119 : i64 to index
    %121 = builtin.unrealized_conversion_cast %120 : index to i64
    %122 = builtin.unrealized_conversion_cast %120 : index to i64
    %123 = llvm.icmp "slt" %121, %95 : i64
    llvm.cond_br %123, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %124 = llvm.extractvalue %88[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %125 = llvm.mlir.constant(802816 : index) : i64
    %126 = llvm.mul %100, %125  : i64
    %127 = llvm.mlir.constant(12544 : index) : i64
    %128 = llvm.mul %100, %127  : i64
    %129 = llvm.add %126, %128  : i64
    %130 = llvm.mlir.constant(112 : index) : i64
    %131 = llvm.mul %105, %130  : i64
    %132 = llvm.add %129, %131  : i64
    %133 = llvm.add %132, %122  : i64
    %134 = llvm.getelementptr %124[%133] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %135 = llvm.load %134 : !llvm.ptr -> f32
    %136 = llvm.fptrunc %101 : f64 to f32
    %137 = llvm.fadd %118, %136  : f32
    %138 = llvm.fmul %137, %93  : f32
    %139 = llvm.bitcast %137 : f32 to i32
    %140 = llvm.lshr %139, %92  : i32
    %141 = llvm.sub %91, %140  : i32
    %142 = llvm.bitcast %141 : i32 to f32
    %143 = llvm.fmul %142, %142  : f32
    %144 = llvm.fmul %143, %138  : f32
    %145 = llvm.fsub %90, %144  : f32
    %146 = llvm.fmul %145, %143  : f32
    %147 = llvm.fsub %135, %115  : f32
    %148 = llvm.fmul %147, %146  : f32
    %149 = llvm.fmul %148, %109  : f32
    %150 = llvm.fadd %149, %112  : f32
    %151 = llvm.extractvalue %89[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %152 = llvm.mlir.constant(802816 : index) : i64
    %153 = llvm.mul %100, %152  : i64
    %154 = llvm.mlir.constant(12544 : index) : i64
    %155 = llvm.mul %100, %154  : i64
    %156 = llvm.add %153, %155  : i64
    %157 = llvm.mlir.constant(112 : index) : i64
    %158 = llvm.mul %105, %157  : i64
    %159 = llvm.add %156, %158  : i64
    %160 = llvm.add %159, %122  : i64
    %161 = llvm.getelementptr %151[%160] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %150, %161 : f32, !llvm.ptr
    %162 = llvm.add %121, %96  : i64
    %163 = builtin.unrealized_conversion_cast %162 : i64 to index
    %164 = builtin.unrealized_conversion_cast %163 : index to i64
    %165 = llvm.extractvalue %88[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %166 = llvm.mlir.constant(802816 : index) : i64
    %167 = llvm.mul %100, %166  : i64
    %168 = llvm.mlir.constant(12544 : index) : i64
    %169 = llvm.mul %100, %168  : i64
    %170 = llvm.add %167, %169  : i64
    %171 = llvm.mlir.constant(112 : index) : i64
    %172 = llvm.mul %105, %171  : i64
    %173 = llvm.add %170, %172  : i64
    %174 = llvm.add %173, %164  : i64
    %175 = llvm.getelementptr %165[%174] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %176 = llvm.load %175 : !llvm.ptr -> f32
    %177 = llvm.fptrunc %101 : f64 to f32
    %178 = llvm.fadd %118, %177  : f32
    %179 = llvm.fmul %178, %93  : f32
    %180 = llvm.bitcast %178 : f32 to i32
    %181 = llvm.lshr %180, %92  : i32
    %182 = llvm.sub %91, %181  : i32
    %183 = llvm.bitcast %182 : i32 to f32
    %184 = llvm.fmul %183, %183  : f32
    %185 = llvm.fmul %184, %179  : f32
    %186 = llvm.fsub %90, %185  : f32
    %187 = llvm.fmul %186, %184  : f32
    %188 = llvm.fsub %176, %115  : f32
    %189 = llvm.fmul %188, %187  : f32
    %190 = llvm.fmul %189, %109  : f32
    %191 = llvm.fadd %190, %112  : f32
    %192 = llvm.extractvalue %89[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %193 = llvm.mlir.constant(802816 : index) : i64
    %194 = llvm.mul %100, %193  : i64
    %195 = llvm.mlir.constant(12544 : index) : i64
    %196 = llvm.mul %100, %195  : i64
    %197 = llvm.add %194, %196  : i64
    %198 = llvm.mlir.constant(112 : index) : i64
    %199 = llvm.mul %105, %198  : i64
    %200 = llvm.add %197, %199  : i64
    %201 = llvm.add %200, %164  : i64
    %202 = llvm.getelementptr %192[%201] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %191, %202 : f32, !llvm.ptr
    %203 = llvm.add %121, %94  : i64
    %204 = builtin.unrealized_conversion_cast %203 : i64 to index
    llvm.br ^bb4(%203 : i64)
  ^bb6:  // pred: ^bb4
    %205 = llvm.add %104, %96  : i64
    %206 = builtin.unrealized_conversion_cast %205 : i64 to index
    llvm.br ^bb2(%205 : i64)
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
    %82 = llvm.mlir.constant(2 : index) : i64
    %83 = llvm.mlir.constant(112 : index) : i64
    %84 = llvm.mlir.constant(1 : index) : i64
    %85 = llvm.mlir.constant(16 : index) : i64
    %86 = llvm.mlir.constant(0 : index) : i64
    %87 = llvm.mlir.constant(1.000000e-05 : f64) : f64
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%86 : i64)
  ^bb2(%88: i64):  // 2 preds: ^bb1, ^bb6
    %89 = llvm.icmp "slt" %88, %85 : i64
    llvm.cond_br %89, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    %90 = llvm.extractvalue %8[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %91 = llvm.getelementptr %90[%86] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %92 = llvm.load %91 : !llvm.ptr -> f32
    %93 = llvm.extractvalue %17[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %94 = llvm.getelementptr %93[%86] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %95 = llvm.load %94 : !llvm.ptr -> f32
    %96 = llvm.extractvalue %26[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %97 = llvm.getelementptr %96[%86] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %98 = llvm.load %97 : !llvm.ptr -> f32
    %99 = llvm.extractvalue %35[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %100 = llvm.getelementptr %99[%86] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %101 = llvm.load %100 : !llvm.ptr -> f32
    llvm.br ^bb4(%86 : i64)
  ^bb4(%102: i64):  // 2 preds: ^bb3, ^bb5
    %103 = llvm.icmp "slt" %102, %83 : i64
    llvm.cond_br %103, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %104 = llvm.extractvalue %56[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %105 = llvm.mlir.constant(802816 : index) : i64
    %106 = llvm.mul %86, %105  : i64
    %107 = llvm.mlir.constant(12544 : index) : i64
    %108 = llvm.mul %86, %107  : i64
    %109 = llvm.add %106, %108  : i64
    %110 = llvm.mlir.constant(112 : index) : i64
    %111 = llvm.mul %88, %110  : i64
    %112 = llvm.add %109, %111  : i64
    %113 = llvm.add %112, %102  : i64
    %114 = llvm.getelementptr %104[%113] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %115 = llvm.load %114 : !llvm.ptr -> f32
    %116 = llvm.fptrunc %87 : f64 to f32
    %117 = llvm.fadd %101, %116  : f32
    %118 = llvm.fmul %117, %81  : f32
    %119 = llvm.bitcast %117 : f32 to i32
    %120 = llvm.lshr %119, %80  : i32
    %121 = llvm.sub %79, %120  : i32
    %122 = llvm.bitcast %121 : i32 to f32
    %123 = llvm.fmul %122, %122  : f32
    %124 = llvm.fmul %123, %118  : f32
    %125 = llvm.fsub %78, %124  : f32
    %126 = llvm.fmul %125, %123  : f32
    %127 = llvm.fsub %115, %98  : f32
    %128 = llvm.fmul %127, %126  : f32
    %129 = llvm.fmul %128, %92  : f32
    %130 = llvm.fadd %129, %95  : f32
    %131 = llvm.extractvalue %77[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %132 = llvm.mlir.constant(802816 : index) : i64
    %133 = llvm.mul %86, %132  : i64
    %134 = llvm.mlir.constant(12544 : index) : i64
    %135 = llvm.mul %86, %134  : i64
    %136 = llvm.add %133, %135  : i64
    %137 = llvm.mlir.constant(112 : index) : i64
    %138 = llvm.mul %88, %137  : i64
    %139 = llvm.add %136, %138  : i64
    %140 = llvm.add %139, %102  : i64
    %141 = llvm.getelementptr %131[%140] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %130, %141 : f32, !llvm.ptr
    %142 = llvm.add %102, %84  : i64
    %143 = llvm.extractvalue %56[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %144 = llvm.mlir.constant(802816 : index) : i64
    %145 = llvm.mul %86, %144  : i64
    %146 = llvm.mlir.constant(12544 : index) : i64
    %147 = llvm.mul %86, %146  : i64
    %148 = llvm.add %145, %147  : i64
    %149 = llvm.mlir.constant(112 : index) : i64
    %150 = llvm.mul %88, %149  : i64
    %151 = llvm.add %148, %150  : i64
    %152 = llvm.add %151, %142  : i64
    %153 = llvm.getelementptr %143[%152] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %154 = llvm.load %153 : !llvm.ptr -> f32
    %155 = llvm.fptrunc %87 : f64 to f32
    %156 = llvm.fadd %101, %155  : f32
    %157 = llvm.fmul %156, %81  : f32
    %158 = llvm.bitcast %156 : f32 to i32
    %159 = llvm.lshr %158, %80  : i32
    %160 = llvm.sub %79, %159  : i32
    %161 = llvm.bitcast %160 : i32 to f32
    %162 = llvm.fmul %161, %161  : f32
    %163 = llvm.fmul %162, %157  : f32
    %164 = llvm.fsub %78, %163  : f32
    %165 = llvm.fmul %164, %162  : f32
    %166 = llvm.fsub %154, %98  : f32
    %167 = llvm.fmul %166, %165  : f32
    %168 = llvm.fmul %167, %92  : f32
    %169 = llvm.fadd %168, %95  : f32
    %170 = llvm.extractvalue %77[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %171 = llvm.mlir.constant(802816 : index) : i64
    %172 = llvm.mul %86, %171  : i64
    %173 = llvm.mlir.constant(12544 : index) : i64
    %174 = llvm.mul %86, %173  : i64
    %175 = llvm.add %172, %174  : i64
    %176 = llvm.mlir.constant(112 : index) : i64
    %177 = llvm.mul %88, %176  : i64
    %178 = llvm.add %175, %177  : i64
    %179 = llvm.add %178, %142  : i64
    %180 = llvm.getelementptr %170[%179] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %169, %180 : f32, !llvm.ptr
    %181 = llvm.add %102, %82  : i64
    llvm.br ^bb4(%181 : i64)
  ^bb6:  // pred: ^bb4
    %182 = llvm.add %88, %84  : i64
    llvm.br ^bb2(%182 : i64)
  ^bb7:  // pred: ^bb2
    llvm.return
  }
}


// -----// IR Dump After Canonicalizer (canonicalize) //----- //
module attributes {llvm.data_layout = ""} {
  llvm.func @forward_kernel_1(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr, %arg3: !llvm.ptr, %arg4: !llvm.ptr, %arg5: !llvm.ptr) attributes {Kernel, forward_kernel_1} {
    %0 = llvm.mlir.constant(1.000000e-05 : f64) : f64
    %1 = llvm.mlir.constant(16 : index) : i64
    %2 = llvm.mlir.constant(2 : index) : i64
    %3 = llvm.mlir.constant(5.000000e-01 : f32) : f32
    %4 = llvm.mlir.constant(1 : i32) : i32
    %5 = llvm.mlir.constant(1597463007 : i32) : i32
    %6 = llvm.mlir.constant(1.500000e+00 : f32) : f32
    %7 = llvm.mlir.constant(112 : index) : i64
    %8 = llvm.mlir.constant(12544 : index) : i64
    %9 = llvm.mlir.constant(802816 : index) : i64
    %10 = llvm.mlir.constant(1 : index) : i64
    %11 = llvm.mlir.constant(0 : index) : i64
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%11 : i64)
  ^bb2(%12: i64):  // 2 preds: ^bb1, ^bb6
    %13 = llvm.icmp "slt" %12, %1 : i64
    llvm.cond_br %13, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    %14 = llvm.load %arg0 : !llvm.ptr -> f32
    %15 = llvm.load %arg1 : !llvm.ptr -> f32
    %16 = llvm.load %arg2 : !llvm.ptr -> f32
    %17 = llvm.load %arg3 : !llvm.ptr -> f32
    llvm.br ^bb4(%11 : i64)
  ^bb4(%18: i64):  // 2 preds: ^bb3, ^bb5
    %19 = llvm.icmp "slt" %18, %7 : i64
    llvm.cond_br %19, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %20 = llvm.mul %11, %9  : i64
    %21 = llvm.mul %11, %8  : i64
    %22 = llvm.add %20, %21  : i64
    %23 = llvm.mul %12, %7  : i64
    %24 = llvm.add %22, %23  : i64
    %25 = llvm.add %24, %18  : i64
    %26 = llvm.getelementptr %arg4[%25] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %27 = llvm.load %26 : !llvm.ptr -> f32
    %28 = llvm.fptrunc %0 : f64 to f32
    %29 = llvm.fadd %17, %28  : f32
    %30 = llvm.fmul %29, %3  : f32
    %31 = llvm.bitcast %29 : f32 to i32
    %32 = llvm.lshr %31, %4  : i32
    %33 = llvm.sub %5, %32  : i32
    %34 = llvm.bitcast %33 : i32 to f32
    %35 = llvm.fmul %34, %34  : f32
    %36 = llvm.fmul %35, %30  : f32
    %37 = llvm.fsub %6, %36  : f32
    %38 = llvm.fmul %37, %35  : f32
    %39 = llvm.fsub %27, %16  : f32
    %40 = llvm.fmul %39, %38  : f32
    %41 = llvm.fmul %40, %14  : f32
    %42 = llvm.fadd %41, %15  : f32
    %43 = llvm.mul %11, %9  : i64
    %44 = llvm.mul %11, %8  : i64
    %45 = llvm.add %43, %44  : i64
    %46 = llvm.mul %12, %7  : i64
    %47 = llvm.add %45, %46  : i64
    %48 = llvm.add %47, %18  : i64
    %49 = llvm.getelementptr %arg5[%48] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %42, %49 : f32, !llvm.ptr
    %50 = llvm.add %18, %10  : i64
    %51 = llvm.mul %11, %9  : i64
    %52 = llvm.mul %11, %8  : i64
    %53 = llvm.add %51, %52  : i64
    %54 = llvm.mul %12, %7  : i64
    %55 = llvm.add %53, %54  : i64
    %56 = llvm.add %55, %50  : i64
    %57 = llvm.getelementptr %arg4[%56] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %58 = llvm.load %57 : !llvm.ptr -> f32
    %59 = llvm.fptrunc %0 : f64 to f32
    %60 = llvm.fadd %17, %59  : f32
    %61 = llvm.fmul %60, %3  : f32
    %62 = llvm.bitcast %60 : f32 to i32
    %63 = llvm.lshr %62, %4  : i32
    %64 = llvm.sub %5, %63  : i32
    %65 = llvm.bitcast %64 : i32 to f32
    %66 = llvm.fmul %65, %65  : f32
    %67 = llvm.fmul %66, %61  : f32
    %68 = llvm.fsub %6, %67  : f32
    %69 = llvm.fmul %68, %66  : f32
    %70 = llvm.fsub %58, %16  : f32
    %71 = llvm.fmul %70, %69  : f32
    %72 = llvm.fmul %71, %14  : f32
    %73 = llvm.fadd %72, %15  : f32
    %74 = llvm.mul %11, %9  : i64
    %75 = llvm.mul %11, %8  : i64
    %76 = llvm.add %74, %75  : i64
    %77 = llvm.mul %12, %7  : i64
    %78 = llvm.add %76, %77  : i64
    %79 = llvm.add %78, %50  : i64
    %80 = llvm.getelementptr %arg5[%79] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %73, %80 : f32, !llvm.ptr
    %81 = llvm.add %18, %2  : i64
    llvm.br ^bb4(%81 : i64)
  ^bb6:  // pred: ^bb4
    %82 = llvm.add %12, %10  : i64
    llvm.br ^bb2(%82 : i64)
  ^bb7:  // pred: ^bb2
    llvm.return
  }
}


