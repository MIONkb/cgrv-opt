func.func @forward_kernel_0(%arg0: memref<2x3xf32>, %arg1: memref<3x3xf32>, %arg2: memref<2x3xf32>) attributes {Kernel, forward_kernel_0} {
  cf.br ^bb1
^bb1:  // pred: ^bb0
  affine.for %arg3 = 0 to 2 {
    affine.for %arg4 = 0 to 3 {
      %n0 = affine.load %arg2[0, 3] : memref<2x3xf32>
      %r = affine.for %arg5 = 0 to 3 iter_args(%iter = %n0) -> (f32) {
        %0 = affine.load %arg0[%arg3, %arg5] : memref<2x3xf32>
        %1 = affine.load %arg1[%arg5, %arg4] : memref<3x3xf32>
        %3 = arith.mulf %0, %1 : f32
        %4 = arith.addf %iter, %3 : f32
        affine.yield %4 : f32
      }
      affine.store %r, %arg2[%arg3, %arg4] : memref<2x3xf32>
    }
  }
  return
}