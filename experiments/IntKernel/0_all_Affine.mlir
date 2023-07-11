module attributes {torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_3x3xi32 : memref<3x3xi32> = dense<[[1, -2, 3], [-4, 5, -6], [7, -8, 9]]>
  func.func @forward(%arg0: memref<2x3xi32>) -> memref<2x3xi32> {
    %cst = arith.constant 0 : i32
    %0 = memref.get_global @__constant_3x3xi32 : memref<3x3xi32>
    %alloca = memref.alloca() {alignment = 64 : i64} : memref<3x3xi32>
    affine.for %arg1 = 0 to 3 {
      affine.for %arg2 = 0 to 3 {
        %1 = affine.load %0[%arg1, %arg2] : memref<3x3xi32>
        affine.store %1, %alloca[%arg2, %arg1] : memref<3x3xi32>
      }
    }
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<2x3xi32>
    affine.for %arg1 = 0 to 2 {
      affine.for %arg2 = 0 to 3 {
        affine.store %cst, %alloc[%arg1, %arg2] : memref<2x3xi32>
      }
    }
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<2x3xi32>
    memref.copy %alloc, %alloc_0 : memref<2x3xi32> to memref<2x3xi32>
    FDRA.kernel{
    affine.for %arg1 = 0 to 2 {
      affine.for %arg2 = 0 to 3 {
        affine.for %arg3 = 0 to 3 {
          %1 = affine.load %arg0[%arg1, %arg3] : memref<2x3xi32>
          %2 = affine.load %alloca[%arg3, %arg2] : memref<3x3xi32>
          %3 = affine.load %alloc_0[%arg1, %arg2] : memref<2x3xi32>
          %4 = arith.muli %1, %2 : i32
          %5 = arith.addi %3, %4 : i32
          affine.store %5, %alloc_0[%arg1, %arg2] : memref<2x3xi32>
        }
      }
    }
      FDRA.terminator
    }
    return %alloc_0 : memref<2x3xi32>
  }
}

