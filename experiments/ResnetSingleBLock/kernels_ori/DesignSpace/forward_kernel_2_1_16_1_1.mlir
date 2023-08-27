#map = affine_map<(d0) -> (d0 + 1)>
#map1 = affine_map<(d0) -> (d0 + 2)>
#map2 = affine_map<(d0) -> (d0 + 3)>
#map3 = affine_map<(d0) -> (d0 + 4)>
#map4 = affine_map<(d0) -> (d0 + 5)>
#map5 = affine_map<(d0) -> (d0 + 6)>
#map6 = affine_map<(d0) -> (d0 + 7)>
#map7 = affine_map<(d0) -> (d0 + 8)>
#map8 = affine_map<(d0) -> (d0 + 9)>
#map9 = affine_map<(d0) -> (d0 + 10)>
#map10 = affine_map<(d0) -> (d0 + 11)>
#map11 = affine_map<(d0) -> (d0 + 12)>
#map12 = affine_map<(d0) -> (d0 + 13)>
#map13 = affine_map<(d0) -> (d0 + 14)>
#map14 = affine_map<(d0) -> (d0 + 15)>
module {
  func.func @forward_kernel_2(%arg0: memref<1x64x112x112xf32>, %arg1: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_2} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    %cst = arith.constant 0.000000e+00 : f32
    affine.for %arg2 = 0 to 16 {
      affine.for %arg3 = 0 to 112 step 16 {
        %0 = affine.load %arg0[0, 0, %arg2, %arg3] : memref<1x64x112x112xf32>
        %1 = arith.cmpf ugt, %0, %cst : f32
        %2 = arith.select %1, %0, %cst : f32
        affine.store %2, %arg1[0, 0, %arg2, %arg3] : memref<1x64x112x112xf32>
        %3 = affine.apply #map(%arg3)
        %4 = affine.load %arg0[0, 0, %arg2, %3] : memref<1x64x112x112xf32>
        %5 = arith.cmpf ugt, %4, %cst : f32
        %6 = arith.select %5, %4, %cst : f32
        affine.store %6, %arg1[0, 0, %arg2, %3] : memref<1x64x112x112xf32>
        %7 = affine.apply #map1(%arg3)
        %8 = affine.load %arg0[0, 0, %arg2, %7] : memref<1x64x112x112xf32>
        %9 = arith.cmpf ugt, %8, %cst : f32
        %10 = arith.select %9, %8, %cst : f32
        affine.store %10, %arg1[0, 0, %arg2, %7] : memref<1x64x112x112xf32>
        %11 = affine.apply #map2(%arg3)
        %12 = affine.load %arg0[0, 0, %arg2, %11] : memref<1x64x112x112xf32>
        %13 = arith.cmpf ugt, %12, %cst : f32
        %14 = arith.select %13, %12, %cst : f32
        affine.store %14, %arg1[0, 0, %arg2, %11] : memref<1x64x112x112xf32>
        %15 = affine.apply #map3(%arg3)
        %16 = affine.load %arg0[0, 0, %arg2, %15] : memref<1x64x112x112xf32>
        %17 = arith.cmpf ugt, %16, %cst : f32
        %18 = arith.select %17, %16, %cst : f32
        affine.store %18, %arg1[0, 0, %arg2, %15] : memref<1x64x112x112xf32>
        %19 = affine.apply #map4(%arg3)
        %20 = affine.load %arg0[0, 0, %arg2, %19] : memref<1x64x112x112xf32>
        %21 = arith.cmpf ugt, %20, %cst : f32
        %22 = arith.select %21, %20, %cst : f32
        affine.store %22, %arg1[0, 0, %arg2, %19] : memref<1x64x112x112xf32>
        %23 = affine.apply #map5(%arg3)
        %24 = affine.load %arg0[0, 0, %arg2, %23] : memref<1x64x112x112xf32>
        %25 = arith.cmpf ugt, %24, %cst : f32
        %26 = arith.select %25, %24, %cst : f32
        affine.store %26, %arg1[0, 0, %arg2, %23] : memref<1x64x112x112xf32>
        %27 = affine.apply #map6(%arg3)
        %28 = affine.load %arg0[0, 0, %arg2, %27] : memref<1x64x112x112xf32>
        %29 = arith.cmpf ugt, %28, %cst : f32
        %30 = arith.select %29, %28, %cst : f32
        affine.store %30, %arg1[0, 0, %arg2, %27] : memref<1x64x112x112xf32>
        %31 = affine.apply #map7(%arg3)
        %32 = affine.load %arg0[0, 0, %arg2, %31] : memref<1x64x112x112xf32>
        %33 = arith.cmpf ugt, %32, %cst : f32
        %34 = arith.select %33, %32, %cst : f32
        affine.store %34, %arg1[0, 0, %arg2, %31] : memref<1x64x112x112xf32>
        %35 = affine.apply #map8(%arg3)
        %36 = affine.load %arg0[0, 0, %arg2, %35] : memref<1x64x112x112xf32>
        %37 = arith.cmpf ugt, %36, %cst : f32
        %38 = arith.select %37, %36, %cst : f32
        affine.store %38, %arg1[0, 0, %arg2, %35] : memref<1x64x112x112xf32>
        %39 = affine.apply #map9(%arg3)
        %40 = affine.load %arg0[0, 0, %arg2, %39] : memref<1x64x112x112xf32>
        %41 = arith.cmpf ugt, %40, %cst : f32
        %42 = arith.select %41, %40, %cst : f32
        affine.store %42, %arg1[0, 0, %arg2, %39] : memref<1x64x112x112xf32>
        %43 = affine.apply #map10(%arg3)
        %44 = affine.load %arg0[0, 0, %arg2, %43] : memref<1x64x112x112xf32>
        %45 = arith.cmpf ugt, %44, %cst : f32
        %46 = arith.select %45, %44, %cst : f32
        affine.store %46, %arg1[0, 0, %arg2, %43] : memref<1x64x112x112xf32>
        %47 = affine.apply #map11(%arg3)
        %48 = affine.load %arg0[0, 0, %arg2, %47] : memref<1x64x112x112xf32>
        %49 = arith.cmpf ugt, %48, %cst : f32
        %50 = arith.select %49, %48, %cst : f32
        affine.store %50, %arg1[0, 0, %arg2, %47] : memref<1x64x112x112xf32>
        %51 = affine.apply #map12(%arg3)
        %52 = affine.load %arg0[0, 0, %arg2, %51] : memref<1x64x112x112xf32>
        %53 = arith.cmpf ugt, %52, %cst : f32
        %54 = arith.select %53, %52, %cst : f32
        affine.store %54, %arg1[0, 0, %arg2, %51] : memref<1x64x112x112xf32>
        %55 = affine.apply #map13(%arg3)
        %56 = affine.load %arg0[0, 0, %arg2, %55] : memref<1x64x112x112xf32>
        %57 = arith.cmpf ugt, %56, %cst : f32
        %58 = arith.select %57, %56, %cst : f32
        affine.store %58, %arg1[0, 0, %arg2, %55] : memref<1x64x112x112xf32>
        %59 = affine.apply #map14(%arg3)
        %60 = affine.load %arg0[0, 0, %arg2, %59] : memref<1x64x112x112xf32>
        %61 = arith.cmpf ugt, %60, %cst : f32
        %62 = arith.select %61, %60, %cst : f32
        affine.store %62, %arg1[0, 0, %arg2, %59] : memref<1x64x112x112xf32>
      }
    }
    return
  }
}
