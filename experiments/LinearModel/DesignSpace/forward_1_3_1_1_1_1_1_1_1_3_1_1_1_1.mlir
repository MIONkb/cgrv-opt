#map0 = affine_map<(d0) -> (d0 + 1)>
#map1 = affine_map<(d0) -> (d0 + 2)>
module attributes {torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_3x3xf32 : memref<3x3xf32> = dense<[[0.569071651, -0.473457456, 0.519209445], [-0.231614307, -0.085622929, 5.772530e-01], [-0.09853556, -0.0144386981, 0.368846387]]>
  func.func @forward(%arg0: memref<4x3xf32>) -> memref<4x3xf32> {
    %c0 = arith.constant 0 : index
    %c0_0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %true = arith.constant true
    %c3 = arith.constant 3 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = memref.get_global @__constant_3x3xf32 : memref<3x3xf32>
    %1 = memref.alloca() {alignment = 64 : i64} : memref<3x3xf32>
    affine.for %arg1 = 0 to 3 {
      %5 = affine.load %0[%arg1, %c0_0] : memref<3x3xf32>
      affine.store %5, %1[%c0_0, %arg1] : memref<3x3xf32>
      %6 = affine.apply #map0(%c0_0)
      %7 = affine.load %0[%arg1, %6] : memref<3x3xf32>
      affine.store %7, %1[%6, %arg1] : memref<3x3xf32>
      %8 = affine.apply #map1(%c0_0)
      %9 = affine.load %0[%arg1, %8] : memref<3x3xf32>
      affine.store %9, %1[%8, %arg1] : memref<3x3xf32>
    }
    cf.assert %true, "mismatching contracting dimension for torch.aten.mm"
    %2 = memref.alloc(%c4, %c3) {alignment = 64 : i64} : memref<?x?xf32>
    affine.for %arg1 = 0 to 4 {
      affine.for %arg2 = 0 to 3 {
        affine.store %cst, %2[%arg1, %arg2] : memref<?x?xf32>
      }
    }
    %3 = memref.alloc(%c4, %c3) {alignment = 64 : i64} : memref<?x?xf32>
    memref.copy %2, %3 : memref<?x?xf32> to memref<?x?xf32>
    affine.for %arg1 = 0 to 4 {
      affine.for %arg2 = 0 to 3 {
        %5 = affine.load %arg0[%arg1, %c0] : memref<4x3xf32>
        %6 = affine.load %1[%c0, %arg2] : memref<3x3xf32>
        %7 = affine.load %3[%arg1, %arg2] : memref<?x?xf32>
        %8 = arith.mulf %5, %6 : f32
        %9 = arith.addf %7, %8 : f32
        affine.store %9, %3[%arg1, %arg2] : memref<?x?xf32>
        %10 = affine.apply #map0(%c0)
        %11 = affine.load %arg0[%arg1, %10] : memref<4x3xf32>
        %12 = affine.load %1[%10, %arg2] : memref<3x3xf32>
        %13 = affine.load %3[%arg1, %arg2] : memref<?x?xf32>
        %14 = arith.mulf %11, %12 : f32
        %15 = arith.addf %13, %14 : f32
        affine.store %15, %3[%arg1, %arg2] : memref<?x?xf32>
        %16 = affine.apply #map1(%c0)
        %17 = affine.load %arg0[%arg1, %16] : memref<4x3xf32>
        %18 = affine.load %1[%16, %arg2] : memref<3x3xf32>
        %19 = affine.load %3[%arg1, %arg2] : memref<?x?xf32>
        %20 = arith.mulf %17, %18 : f32
        %21 = arith.addf %19, %20 : f32
        affine.store %21, %3[%arg1, %arg2] : memref<?x?xf32>
      }
    }
    %4 = memref.cast %3 : memref<?x?xf32> to memref<4x3xf32>
    return %4 : memref<4x3xf32>
  }
}
