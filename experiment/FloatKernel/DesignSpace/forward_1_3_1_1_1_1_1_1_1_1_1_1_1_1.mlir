#map0 = affine_map<(d0) -> (d0 + 1)>
#map1 = affine_map<(d0) -> (d0 + 2)>
module attributes {torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_3x3xf32 : memref<3x3xf32> = dense<[[-0.415798277, 0.157707065, 0.13065134], [-0.458860725, -0.0944703146, -0.40910387], [0.19170782, -0.139193341, -0.414218515]]>
  func.func @forward(%arg0: memref<2x3xf32>) -> memref<2x3xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = memref.get_global @__constant_3x3xf32 : memref<3x3xf32>
    %1 = memref.alloca() {alignment = 64 : i64} : memref<3x3xf32>
    affine.for %arg1 = 0 to 3 {
      %4 = affine.load %0[%arg1, %c0] : memref<3x3xf32>
      affine.store %4, %1[%c0, %arg1] : memref<3x3xf32>
      %5 = affine.apply #map0(%c0)
      %6 = affine.load %0[%arg1, %5] : memref<3x3xf32>
      affine.store %6, %1[%5, %arg1] : memref<3x3xf32>
      %7 = affine.apply #map1(%c0)
      %8 = affine.load %0[%arg1, %7] : memref<3x3xf32>
      affine.store %8, %1[%7, %arg1] : memref<3x3xf32>
    }
    %2 = memref.alloc() {alignment = 64 : i64} : memref<2x3xf32>
    affine.for %arg1 = 0 to 2 {
      affine.for %arg2 = 0 to 3 {
        affine.store %cst, %2[%arg1, %arg2] : memref<2x3xf32>
      }
    }
    %3 = memref.alloc() {alignment = 64 : i64} : memref<2x3xf32>
    memref.copy %2, %3 : memref<2x3xf32> to memref<2x3xf32>
    affine.for %arg1 = 0 to 2 {
      affine.for %arg2 = 0 to 3 {
        affine.for %arg3 = 0 to 3 {
          %4 = affine.load %arg0[%arg1, %arg3] : memref<2x3xf32>
          %5 = affine.load %1[%arg3, %arg2] : memref<3x3xf32>
          %6 = affine.load %3[%arg1, %arg2] : memref<2x3xf32>
          %7 = arith.mulf %4, %5 : f32
          %8 = arith.addf %6, %7 : f32
          affine.store %8, %3[%arg1, %arg2] : memref<2x3xf32>
        }
      }
    }
    return %3 : memref<2x3xf32>
  }
}
