module attributes {torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_3x3xf32 : memref<3x3xf32> = dense<[[0.569071651, -0.473457456, 0.519209445], [-0.231614307, -0.085622929, 5.772530e-01], [-0.09853556, -0.0144386981, 0.368846387]]>
  func.func @forward(%arg0: memref<4x3xf32>) -> memref<4x3xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = memref.get_global @__constant_3x3xf32 : memref<3x3xf32>
    %1 = memref.alloc() {alignment = 64 : i64} : memref<3x3xf32>
    FDRA.kernel {
      affine.for %arg1 = 0 to 3 {
        affine.for %arg2 = 0 to 3 {
          %4 = affine.load %0[%arg1, %arg2] : memref<3x3xf32>
          affine.store %4, %1[%arg2, %arg1] : memref<3x3xf32>
        }
      }
      FDRA.terminator
    }
    %2 = memref.alloc() {alignment = 64 : i64} : memref<4x3xf32>
    FDRA.kernel {
      affine.for %arg1 = 0 to 4 {
        affine.for %arg2 = 0 to 3 {
          affine.store %cst, %2[%arg1, %arg2] : memref<4x3xf32>
        }
      }
      FDRA.terminator
    }
    %3 = memref.alloc() {alignment = 64 : i64} : memref<4x3xf32>
    memref.copy %2, %3 : memref<4x3xf32> to memref<4x3xf32>
    FDRA.kernel {
      affine.for %arg1 = 0 to 4 {
        affine.for %arg2 = 0 to 3 {
          affine.for %arg3 = 0 to 3 {
            %4 = affine.load %arg0[%arg1, %arg3] : memref<4x3xf32>
            %5 = affine.load %1[%arg3, %arg2] : memref<3x3xf32>
            %6 = affine.load %3[%arg1, %arg2] : memref<4x3xf32>
            %7 = arith.mulf %4, %5 : f32
            %8 = arith.addf %6, %7 : f32
            affine.store %8, %3[%arg1, %arg2] : memref<4x3xf32>
          }
        }
      }
      FDRA.terminator
    }
    return %3 : memref<4x3xf32>
  }
}
