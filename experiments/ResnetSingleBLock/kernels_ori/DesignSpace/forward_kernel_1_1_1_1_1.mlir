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
