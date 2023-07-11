#map0 = affine_map<(d0) -> (d0 + 1)>
#map1 = affine_map<(d0) -> (d0 + 2)>
module {
  func.func @forward_kernel_2(%arg0: memref<2x3xf32>, %arg1: memref<2x3xf32>, %arg2: memref<3x3xf32>) attributes {Kernel, forward_kernel_2} {
    %c0 = arith.constant 0 : index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    affine.for %arg3 = 0 to 2 {
      affine.for %arg4 = 0 to 3 {
        %0 = affine.load %arg0[%arg3, %arg4] : memref<2x3xf32>
        %1 = affine.load %arg1[%arg3, %c0] : memref<2x3xf32>
        %2 = affine.load %arg2[%c0, %arg4] : memref<3x3xf32>
        %3 = arith.mulf %1, %2 : f32
        %4 = arith.addf %0, %3 : f32
        %5 = affine.apply #map0(%c0)
        %6 = affine.load %arg1[%arg3, %5] : memref<2x3xf32>
        %7 = affine.load %arg2[%5, %arg4] : memref<3x3xf32>
        %8 = arith.mulf %6, %7 : f32
        %9 = arith.addf %4, %8 : f32
        %10 = affine.apply #map1(%c0)
        %11 = affine.load %arg1[%arg3, %10] : memref<2x3xf32>
        %12 = affine.load %arg2[%10, %arg4] : memref<3x3xf32>
        %13 = arith.mulf %11, %12 : f32
        %14 = arith.addf %9, %13 : f32
        affine.store %14, %arg0[%arg3, %arg4] : memref<2x3xf32>
      }
    }
    return
  }
}
