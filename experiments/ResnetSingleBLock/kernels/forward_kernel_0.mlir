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