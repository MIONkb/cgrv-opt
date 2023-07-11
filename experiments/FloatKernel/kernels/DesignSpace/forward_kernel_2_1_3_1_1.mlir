#map0 = affine_map<(d0) -> (d0 + 1)>
#map1 = affine_map<(d0) -> (d0 + 2)>
module {
  func.func @forward_kernel_2(%arg0: memref<2x3xf32>, %arg1: memref<2x3xf32>, %arg2: memref<3x3xf32>) attributes {Kernel, forward_kernel_2} {
    %c0 = arith.constant 0 : index
    %c0_0 = arith.constant 0 : index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    affine.for %arg3 = 0 to 2 {
      %0 = affine.load %arg0[%arg3, %c0] : memref<2x3xf32>
      %1 = affine.load %arg1[%arg3, %c0_0] : memref<2x3xf32>
      %2 = affine.load %arg2[%c0_0, %c0] : memref<3x3xf32>
      %3 = arith.mulf %1, %2 : f32
      %4 = arith.addf %0, %3 : f32
      %5 = affine.apply #map0(%c0_0)
      %6 = affine.load %arg1[%arg3, %5] : memref<2x3xf32>
      %7 = affine.load %arg2[%5, %c0] : memref<3x3xf32>
      %8 = arith.mulf %6, %7 : f32
      %9 = arith.addf %4, %8 : f32
      %10 = affine.apply #map1(%c0_0)
      %11 = affine.load %arg1[%arg3, %10] : memref<2x3xf32>
      %12 = affine.load %arg2[%10, %c0] : memref<3x3xf32>
      %13 = arith.mulf %11, %12 : f32
      %14 = arith.addf %9, %13 : f32
      affine.store %14, %arg0[%arg3, %c0] : memref<2x3xf32>
      %15 = affine.apply #map0(%c0)
      %16 = affine.load %arg0[%arg3, %15] : memref<2x3xf32>
      %17 = affine.load %arg1[%arg3, %c0_0] : memref<2x3xf32>
      %18 = affine.load %arg2[%c0_0, %15] : memref<3x3xf32>
      %19 = arith.mulf %17, %18 : f32
      %20 = arith.addf %16, %19 : f32
      %21 = affine.apply #map0(%c0_0)
      %22 = affine.load %arg1[%arg3, %21] : memref<2x3xf32>
      %23 = affine.load %arg2[%21, %15] : memref<3x3xf32>
      %24 = arith.mulf %22, %23 : f32
      %25 = arith.addf %20, %24 : f32
      %26 = affine.apply #map1(%c0_0)
      %27 = affine.load %arg1[%arg3, %26] : memref<2x3xf32>
      %28 = affine.load %arg2[%26, %15] : memref<3x3xf32>
      %29 = arith.mulf %27, %28 : f32
      %30 = arith.addf %25, %29 : f32
      affine.store %30, %arg0[%arg3, %15] : memref<2x3xf32>
      %31 = affine.apply #map1(%c0)
      %32 = affine.load %arg0[%arg3, %31] : memref<2x3xf32>
      %33 = affine.load %arg1[%arg3, %c0_0] : memref<2x3xf32>
      %34 = affine.load %arg2[%c0_0, %31] : memref<3x3xf32>
      %35 = arith.mulf %33, %34 : f32
      %36 = arith.addf %32, %35 : f32
      %37 = affine.apply #map0(%c0_0)
      %38 = affine.load %arg1[%arg3, %37] : memref<2x3xf32>
      %39 = affine.load %arg2[%37, %31] : memref<3x3xf32>
      %40 = arith.mulf %38, %39 : f32
      %41 = arith.addf %36, %40 : f32
      %42 = affine.apply #map1(%c0_0)
      %43 = affine.load %arg1[%arg3, %42] : memref<2x3xf32>
      %44 = affine.load %arg2[%42, %31] : memref<3x3xf32>
      %45 = arith.mulf %43, %44 : f32
      %46 = arith.addf %41, %45 : f32
      affine.store %46, %arg0[%arg3, %31] : memref<2x3xf32>
    }
    return
  }
}
