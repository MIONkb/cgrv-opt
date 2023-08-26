#map = affine_map<(d0) -> (d0 + 1)>
#map1 = affine_map<(d0) -> (d0 + 2)>
#map2 = affine_map<(d0) -> (d0 + 3)>
#map3 = affine_map<(d0) -> (d0 + 4)>
#map4 = affine_map<(d0) -> (d0 + 5)>
#map5 = affine_map<(d0) -> (d0 + 6)>
module {
  func.func @forward_kernel_0(%arg0: memref<1x64x112x112xf32>, %arg1: memref<1x3x230x230xf32>, %arg2: memref<64x3x7x7xf32>, %arg3: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_0} {
    %c0 = arith.constant 0 : index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    affine.for %arg4 = 0 to 8 {
      %0 = affine.load %arg0[0, 0, 0, %arg4] : memref<1x64x112x112xf32>
      %1 = affine.for %arg5 = 0 to 3 iter_args(%arg6 = %0) -> (f32) {
        %2 = affine.for %arg7 = 0 to 7 iter_args(%arg8 = %arg6) -> (f32) {
          %3 = affine.load %arg1[0, %arg5, %arg7, %arg4 * 2 + %c0] : memref<1x3x230x230xf32>
          %4 = affine.load %arg2[0, %arg5, %arg7, %c0] : memref<64x3x7x7xf32>
          %5 = arith.mulf %3, %4 : f32
          %6 = arith.addf %arg8, %5 : f32
          %7 = affine.apply #map(%c0)
          %8 = affine.load %arg1[0, %arg5, %arg7, %arg4 * 2 + %7] : memref<1x3x230x230xf32>
          %9 = affine.load %arg2[0, %arg5, %arg7, %7] : memref<64x3x7x7xf32>
          %10 = arith.mulf %8, %9 : f32
          %11 = arith.addf %6, %10 : f32
          %12 = affine.apply #map1(%c0)
          %13 = affine.load %arg1[0, %arg5, %arg7, %arg4 * 2 + %12] : memref<1x3x230x230xf32>
          %14 = affine.load %arg2[0, %arg5, %arg7, %12] : memref<64x3x7x7xf32>
          %15 = arith.mulf %13, %14 : f32
          %16 = arith.addf %11, %15 : f32
          %17 = affine.apply #map2(%c0)
          %18 = affine.load %arg1[0, %arg5, %arg7, %arg4 * 2 + %17] : memref<1x3x230x230xf32>
          %19 = affine.load %arg2[0, %arg5, %arg7, %17] : memref<64x3x7x7xf32>
          %20 = arith.mulf %18, %19 : f32
          %21 = arith.addf %16, %20 : f32
          %22 = affine.apply #map3(%c0)
          %23 = affine.load %arg1[0, %arg5, %arg7, %arg4 * 2 + %22] : memref<1x3x230x230xf32>
          %24 = affine.load %arg2[0, %arg5, %arg7, %22] : memref<64x3x7x7xf32>
          %25 = arith.mulf %23, %24 : f32
          %26 = arith.addf %21, %25 : f32
          %27 = affine.apply #map4(%c0)
          %28 = affine.load %arg1[0, %arg5, %arg7, %arg4 * 2 + %27] : memref<1x3x230x230xf32>
          %29 = affine.load %arg2[0, %arg5, %arg7, %27] : memref<64x3x7x7xf32>
          %30 = arith.mulf %28, %29 : f32
          %31 = arith.addf %26, %30 : f32
          %32 = affine.apply #map5(%c0)
          %33 = affine.load %arg1[0, %arg5, %arg7, %arg4 * 2 + %32] : memref<1x3x230x230xf32>
          %34 = affine.load %arg2[0, %arg5, %arg7, %32] : memref<64x3x7x7xf32>
          %35 = arith.mulf %33, %34 : f32
          %36 = arith.addf %31, %35 : f32
          affine.yield %36 : f32
        }
        affine.yield %2 : f32
      }
      affine.store %1, %arg3[0, 0, 0, %arg4] : memref<1x64x112x112xf32>
    }
    return
  }
}
