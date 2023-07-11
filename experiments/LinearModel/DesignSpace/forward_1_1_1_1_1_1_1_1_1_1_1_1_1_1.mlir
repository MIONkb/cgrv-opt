module attributes {torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_3x3xf32 : memref<3x3xf32> = dense<[[0.569071651, -0.473457456, 0.519209445], [-0.231614307, -0.085622929, 5.772530e-01], [-0.09853556, -0.0144386981, 0.368846387]]>
  func.func @forward(%arg0: memref<4x3xf32>) -> memref<4x3xf32> {
    %c4 = arith.constant 4 : index
    %true = arith.constant true
    %c3 = arith.constant 3 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = memref.get_global @__constant_3x3xf32 : memref<3x3xf32>
    %1 = memref.alloca() {alignment = 64 : i64} : memref<3x3xf32>
    affine.for %arg1 = 0 to 3 {
      affine.for %arg2 = 0 to 3 {
        %5 = affine.load %0[%arg1, %arg2] : memref<3x3xf32>
        affine.store %5, %1[%arg2, %arg1] : memref<3x3xf32>
      }
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
        affine.for %arg3 = 0 to 3 {
          %5 = affine.load %arg0[%arg1, %arg3] : memref<4x3xf32>
          %6 = affine.load %1[%arg3, %arg2] : memref<3x3xf32>
          %7 = affine.load %3[%arg1, %arg2] : memref<?x?xf32>
          %8 = arith.mulf %5, %6 : f32
          %9 = arith.addf %7, %8 : f32
          affine.store %9, %3[%arg1, %arg2] : memref<?x?xf32>
        }
      }
    }
    %4 = memref.cast %3 : memref<?x?xf32> to memref<4x3xf32>
    return %4 : memref<4x3xf32>
  }
}
