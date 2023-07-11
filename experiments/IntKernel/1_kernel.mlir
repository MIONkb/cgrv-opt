module attributes {torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_3x3xi32 : memref<3x3xi32> = dense<[[1, -2, 3], [-4, 5, -6], [7, -8, 9]]>
  func.func @forward(%arg0: memref<2x3xi32>) -> memref<2x3xi32> {
    %c0_i32 = arith.constant 0 : i32
    %0 = memref.get_global @__constant_3x3xi32 : memref<3x3xi32>
    %1 = memref.alloca() {alignment = 64 : i64} : memref<3x3xi32>
    FDRA.kernel {
      affine.for %arg1 = 0 to 3 {
        affine.for %arg2 = 0 to 3 {
          %4 = affine.load %0[%arg1, %arg2] : memref<3x3xi32>
          affine.store %4, %1[%arg2, %arg1] : memref<3x3xi32>
        }
      }
      FDRA.terminator
    }
    %2 = memref.alloc() {alignment = 64 : i64} : memref<2x3xi32>
    FDRA.kernel {
      affine.for %arg1 = 0 to 2 {
        affine.for %arg2 = 0 to 3 {
          affine.store %c0_i32, %2[%arg1, %arg2] : memref<2x3xi32>
        }
      }
      FDRA.terminator
    }
    %3 = memref.alloc() {alignment = 64 : i64} : memref<2x3xi32>
    memref.copy %2, %3 : memref<2x3xi32> to memref<2x3xi32>
    FDRA.kernel {
      affine.for %arg1 = 0 to 2 {
        affine.for %arg2 = 0 to 3 {
          affine.for %arg3 = 0 to 3 {
            %4 = affine.load %arg0[%arg1, %arg3] : memref<2x3xi32>
            %5 = affine.load %1[%arg3, %arg2] : memref<3x3xi32>
            %6 = affine.load %3[%arg1, %arg2] : memref<2x3xi32>
            %7 = arith.muli %4, %5 : i32
            %8 = arith.addi %6, %7 : i32
            affine.store %8, %3[%arg1, %arg2] : memref<2x3xi32>
          }
        }
      }
      FDRA.terminator
    }
    return %3 : memref<2x3xi32>
  }
}

