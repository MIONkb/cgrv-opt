func.func @forward_kernel_2(%arg0: memref<1x64x112x112xf32>, %arg1: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_2} {
  cf.br ^bb1
^bb1:  // pred: ^bb0
  %cst = arith.constant 0.000000e+00 : f32
  affine.for %arg2 = 0 to 1 {
    affine.for %arg3 = 0 to 64 {
      affine.for %arg4 = 0 to 112 {
        affine.for %arg5 = 0 to 112 {
          %0 = affine.load %arg0[0, %arg3, %arg4, %arg5] : memref<1x64x112x112xf32>
          %1 = arith.cmpf ugt, %0, %cst : f32
          %2 = arith.select %1, %0, %cst : f32
          affine.store %2, %arg1[%arg2, %arg3, %arg4, %arg5] : memref<1x64x112x112xf32>
        }
      }
    }
  }
  return
}