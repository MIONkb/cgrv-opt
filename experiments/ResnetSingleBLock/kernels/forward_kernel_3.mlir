#map = affine_map<(d0) -> (d0 + 1)>
#map1 = affine_map<(d0) -> (d0 + 2)>
module {
  func.func @forward_kernel_3(%arg0: memref<1x64x56x56xf32>, %arg1: memref<1x64x114x114xf32>, %arg2: memref<1x64x56x56xf32>) attributes {Kernel, forward_kernel_3} {
    %c0 = arith.constant 0 : index
    %c0_0 = arith.constant 0 : index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    affine.for %arg3 = 0 to 4 {
      affine.for %arg4 = 0 to 56 {
        %0 = affine.load %arg0[0, 0, %arg3, %arg4] : memref<1x64x56x56xf32>
        %1 = affine.load %arg1[0, 0, %arg3 * 2 + %c0, %arg4 * 2 + %c0_0] : memref<1x64x114x114xf32>
        %2 = arith.cmpf ugt, %0, %1 : f32
        %3 = arith.select %2, %0, %1 : f32
        %4 = affine.apply #map(%c0_0)
        %5 = affine.load %arg1[0, 0, %arg3 * 2 + %c0, %arg4 * 2 + %4] : memref<1x64x114x114xf32>
        %6 = arith.cmpf ugt, %3, %5 : f32
        %7 = arith.select %6, %3, %5 : f32
        %8 = affine.apply #map1(%c0_0)
        %9 = affine.load %arg1[0, 0, %arg3 * 2 + %c0, %arg4 * 2 + %8] : memref<1x64x114x114xf32>
        %10 = arith.cmpf ugt, %7, %9 : f32
        %11 = arith.select %10, %7, %9 : f32
        %12 = affine.apply #map(%c0)
        %13 = affine.load %arg1[0, 0, %arg3 * 2 + %12, %arg4 * 2 + %c0_0] : memref<1x64x114x114xf32>
        %14 = arith.cmpf ugt, %11, %13 : f32
        %15 = arith.select %14, %11, %13 : f32
        %16 = affine.apply #map(%c0_0)
        %17 = affine.load %arg1[0, 0, %arg3 * 2 + %12, %arg4 * 2 + %16] : memref<1x64x114x114xf32>
        %18 = arith.cmpf ugt, %15, %17 : f32
        %19 = arith.select %18, %15, %17 : f32
        %20 = affine.apply #map1(%c0_0)
        %21 = affine.load %arg1[0, 0, %arg3 * 2 + %12, %arg4 * 2 + %20] : memref<1x64x114x114xf32>
        %22 = arith.cmpf ugt, %19, %21 : f32
        %23 = arith.select %22, %19, %21 : f32
        %24 = affine.apply #map1(%c0)
        %25 = affine.load %arg1[0, 0, %arg3 * 2 + %24, %arg4 * 2 + %c0_0] : memref<1x64x114x114xf32>
        %26 = arith.cmpf ugt, %23, %25 : f32
        %27 = arith.select %26, %23, %25 : f32
        %28 = affine.apply #map(%c0_0)
        %29 = affine.load %arg1[0, 0, %arg3 * 2 + %24, %arg4 * 2 + %28] : memref<1x64x114x114xf32>
        %30 = arith.cmpf ugt, %27, %29 : f32
        %31 = arith.select %30, %27, %29 : f32
        %32 = affine.apply #map1(%c0_0)
        %33 = affine.load %arg1[0, 0, %arg3 * 2 + %24, %arg4 * 2 + %32] : memref<1x64x114x114xf32>
        %34 = arith.cmpf ugt, %31, %33 : f32
        %35 = arith.select %34, %31, %33 : f32
        affine.store %35, %arg2[0, 0, %arg3, %arg4] : memref<1x64x56x56xf32>
      }
    }
    return
  }
}

