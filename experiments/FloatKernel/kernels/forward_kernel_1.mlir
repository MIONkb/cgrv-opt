func.func @forward_kernel_1(%arg0: memref<3x3xf32>, %arg1: memref<3x3xf32>, %arg2: memref<3x3xf32>) attributes {Kernel, forward_kernel_1} {
  cf.br ^bb1
^bb1:  // pred: ^bb0
  affine.for %arg3 = 0 to 3 {
    affine.for %arg4 = 0 to 3 {
      %0 = affine.load %arg0[%arg3, %arg4] : memref<3x3xf32>
      %1 = affine.for %arg5 = 0 to 3 iter_args(%arg6 = %0) -> (f32) {
        %2 = affine.load %arg1[%arg3, %arg5] : memref<3x3xf32>
        %3 = affine.load %arg2[%arg5, %arg4] : memref<3x3xf32>
        %4 = arith.mulf %2, %3 : f32
        %5 = arith.addf %arg6, %4 : f32
        affine.yield %5 : f32
      }
      affine.store %1, %arg0[%arg3, %arg4] : memref<3x3xf32>
    }
  }
  return
}