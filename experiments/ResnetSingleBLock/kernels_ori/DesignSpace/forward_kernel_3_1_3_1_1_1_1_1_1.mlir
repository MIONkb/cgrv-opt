#map = affine_map<(d0) -> (d0 + 1)>
#map1 = affine_map<(d0) -> (d0 + 2)>
module {
  func.func @forward_kernel_3(%arg0: memref<1x64x56x56xf32>, %arg1: memref<1x64x114x114xf32>, %arg2: memref<1x64x56x56xf32>) attributes {Kernel, forward_kernel_3} {
    %c0 = arith.constant 0 : index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    affine.for %arg3 = 0 to 4 {
      affine.for %arg4 = 0 to 56 {
        %0 = affine.load %arg0[0, 0, %arg3, %arg4] : memref<1x64x56x56xf32>
        %1 = affine.for %arg5 = 0 to 3 iter_args(%arg6 = %0) -> (f32) {
          %2 = affine.load %arg1[0, 0, %arg3 * 2 + %arg5, %arg4 * 2 + %c0] : memref<1x64x114x114xf32>
          %3 = arith.cmpf ugt, %arg6, %2 : f32
          %4 = arith.select %3, %arg6, %2 : f32
          %5 = affine.apply #map(%c0)
          %6 = affine.load %arg1[0, 0, %arg3 * 2 + %arg5, %arg4 * 2 + %5] : memref<1x64x114x114xf32>
          %7 = arith.cmpf ugt, %4, %6 : f32
          %8 = arith.select %7, %4, %6 : f32
          %9 = affine.apply #map1(%c0)
          %10 = affine.load %arg1[0, 0, %arg3 * 2 + %arg5, %arg4 * 2 + %9] : memref<1x64x114x114xf32>
          %11 = arith.cmpf ugt, %8, %10 : f32
          %12 = arith.select %11, %8, %10 : f32
          affine.yield %12 : f32
        }
        affine.store %1, %arg2[0, 0, %arg3, %arg4] : memref<1x64x56x56xf32>
      }
    }
    return
  }
}
