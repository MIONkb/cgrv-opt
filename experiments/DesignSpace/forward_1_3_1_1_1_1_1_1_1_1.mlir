#map0 = affine_map<(d0) -> (d0 + 1)>
#map1 = affine_map<(d0) -> (d0 + 2)>
module attributes {torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_3x3xf32 : memref<3x3xf32> = dense<[[0.569071651, -0.231614307, -0.09853556], [-0.473457456, -0.085622929, -0.0144386981], [0.519209445, 5.772530e-01, 0.368846387]]>
  func.func @forward(%arg0: memref<4x3xf32>) -> memref<4x3xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %true = arith.constant true
    %0 = memref.get_global @__constant_3x3xf32 : memref<3x3xf32>
    cf.assert %true, "mismatching contracting dimension for torch.aten.mm"
    %1 = memref.alloca() {alignment = 64 : i64} : memref<4x3xf32>
    affine.for %arg1 = 0 to 4 {
      affine.store %cst, %1[%arg1, %c0] : memref<4x3xf32>
      %3 = affine.apply #map0(%c0)
      affine.store %cst, %1[%arg1, %3] : memref<4x3xf32>
      %4 = affine.apply #map1(%c0)
      affine.store %cst, %1[%arg1, %4] : memref<4x3xf32>
    }
    %2 = memref.alloc() {alignment = 64 : i64} : memref<4x3xf32>
    memref.copy %1, %2 : memref<4x3xf32> to memref<4x3xf32>
    affine.for %arg1 = 0 to 4 {
      affine.for %arg2 = 0 to 3 {
        affine.for %arg3 = 0 to 3 {
          %3 = affine.load %arg0[%arg1, %arg3] : memref<4x3xf32>
          %4 = affine.load %0[%arg3, %arg2] : memref<3x3xf32>
          %5 = affine.load %2[%arg1, %arg2] : memref<4x3xf32>
          %6 = arith.mulf %3, %4 : f32
          %7 = arith.addf %5, %6 : f32
          affine.store %7, %2[%arg1, %arg2] : memref<4x3xf32>
        }
      }
    }
    return %2 : memref<4x3xf32>
  }
}
