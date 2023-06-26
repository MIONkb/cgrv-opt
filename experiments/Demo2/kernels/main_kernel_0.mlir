func.func @main_kernel_0(%arg0: memref<5x5x1x1xf32>, %arg1: memref<1x5x5x1xf32>) attributes {Kernel, main_kernel_0} {
  cf.br ^bb1
^bb1:  // pred: ^bb0
  affine.for %arg2 = 0 to 1 {
    affine.for %arg3 = 0 to 5 {
      affine.for %arg4 = 0 to 5 {
        affine.for %arg5 = 0 to 1 {
          %0 = affine.load %arg0[%arg3, %arg4, %arg5, %arg2] : memref<5x5x1x1xf32>
          affine.store %0, %arg1[%arg2, %arg3, %arg4, %arg5] : memref<1x5x5x1xf32>
        }
      }
    }
  }
  return
}