func.func @forward_kernel_0(%arg0: memref<12x3xf32>, %arg1: memref<3x12xf32>) attributes {Kernel, forward_kernel_0} {
  cf.br ^bb1
^bb1:  // pred: ^bb0
  affine.for %arg2 = 0 to 12 {
    affine.for %arg3 = 0 to 3 {
      %0 = affine.load %arg0[%arg2, %arg3] : memref<12x3xf32>
      affine.store %0, %arg1[%arg3, %arg2] : memref<3x12xf32>
    }
  }
  return
}