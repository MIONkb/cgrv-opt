func.func @forward_kernel_0(%arg0: memref<2x3xi32>, %arg1: memref<3x3xi32>, %arg2: memref<2x3xi32>) attributes {Kernel, forward_kernel_0} {
  cf.br ^bb1
^bb1:  // pred: ^bb0
  affine.for %arg3 = 0 to 2 {
    affine.for %arg4 = 0 to 3 {
      affine.for %arg5 = 0 to 3 {
        %0 = affine.load %arg0[%arg3, %arg5] : memref<2x3xi32>
        %1 = affine.load %arg1[%arg5, %arg4] : memref<3x3xi32>
        %2 = affine.load %arg2[%arg3, %arg4] : memref<2x3xi32>
        %3 = arith.muli %0, %1 : i32
        %4 = arith.addi %2, %3 : i32
        affine.store %4, %arg2[%arg3, %arg4] : memref<2x3xi32>
      }
    }
  }
  return
}