module attributes {torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_3x3xf32 : memref<3x3xf32> = dense<[[0.569071651, -0.473457456, 0.519209445], [-0.231614307, -0.085622929, 5.772530e-01], [-0.09853556, -0.0144386981, 0.368846387]]>
  func.func @forward(%arg0: memref<4x3xf32>) -> memref<4x3xf32> {
    %c4 = arith.constant 4 : index
    %true = arith.constant true
    %c3 = arith.constant 3 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = memref.get_global @__constant_3x3xf32 : memref<3x3xf32>
    %alloca = memref.alloca() {alignment = 64 : i64} : memref<3x3xf32>
    affine.for %arg1 = 0 to 3 {
      affine.for %arg2 = 0 to 3 {
        %1 = affine.load %0[%arg1, %arg2] : memref<3x3xf32>
        affine.store %1, %alloca[%arg2, %arg1] : memref<3x3xf32>
      }
    }
    cf.assert %true, "mismatching contracting dimension for torch.aten.mm"
    %alloc = memref.alloc(%c4, %c3) {alignment = 64 : i64} : memref<?x?xf32>
    affine.for %arg1 = 0 to 4 {
      affine.for %arg2 = 0 to 3 {
        affine.store %cst, %alloc[%arg1, %arg2] : memref<?x?xf32>
      }
    }
    %alloc_0 = memref.alloc(%c4, %c3) {alignment = 64 : i64} : memref<?x?xf32>
    memref.copy %alloc, %alloc_0 : memref<?x?xf32> to memref<?x?xf32>
    affine.for %arg1 = 0 to 4 {
      affine.for %arg2 = 0 to 3 {
        affine.for %arg3 = 0 to 3 {
          %1 = affine.load %arg0[%arg1, %arg3] : memref<4x3xf32>
          %2 = affine.load %alloca[%arg3, %arg2] : memref<3x3xf32>
          %3 = affine.load %alloc_0[%arg1, %arg2] : memref<?x?xf32>
          %4 = arith.mulf %1, %2 : f32
          %5 = arith.addf %3, %4 : f32
          affine.store %5, %alloc_0[%arg1, %arg2] : memref<?x?xf32>
        }
      }
    }
    %cast = memref.cast %alloc_0 : memref<?x?xf32> to memref<4x3xf32>
    return %cast : memref<4x3xf32>
  }
}

