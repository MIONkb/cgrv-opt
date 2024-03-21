module attributes {torch.debug_module_name = "L"} {
  func.func @forward(%arg0: memref<3x5xf32>, %arg1: memref<3x5xf32>) -> memref<3x5xf32> {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<3x5xf32>
    FDRA.kernel {
      affine.for %arg2 = 0 to 3 {
        affine.for %arg3 = 0 to 5 {
          %0 = affine.load %arg0[%arg2, %arg3] : memref<3x5xf32>
          %1 = affine.load %arg1[%arg2, %arg3] : memref<3x5xf32>
          %2 = arith.addf %0, %1 : f32
          affine.store %2, %alloc[%arg2, %arg3] : memref<3x5xf32>
        }
      }
      FDRA.terminator
    }
    return %alloc : memref<3x5xf32>
  }
}

