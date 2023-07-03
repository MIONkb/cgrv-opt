func.func @forward_kernel_0(%arg0: memref<10xf32>, %arg1: memref<10xf32>, %arg2: memref<10xf32>) attributes {Kernel, forward_kernel_0} {
  cf.br ^bb1
^bb1:  // pred: ^bb0
  affine.for %arg3 = 0 to 10 {
    %0 = affine.load %arg0[%arg3] : memref<10xf32>
    %1 = affine.load %arg1[%arg3] : memref<10xf32>
    %2 = arith.addf %0, %1 : f32
    affine.store %2, %arg2[%arg3] : memref<10xf32>
  }
  return
}