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

