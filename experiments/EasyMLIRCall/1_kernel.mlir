module attributes {torch.debug_module_name = "L"} {
  func.func @forward(%arg0: memref<10xf32>, %arg1: memref<10xf32>) -> memref<10xf32> {
    %0 = memref.alloc() {alignment = 64 : i64} : memref<10xf32>
    FDRA.kernel {
      affine.for %arg2 = 0 to 10 {
        %1 = affine.load %arg0[%arg2] : memref<10xf32>
        %2 = affine.load %arg1[%arg2] : memref<10xf32>
        %3 = arith.addf %1, %2 : f32
        affine.store %3, %0[%arg2] : memref<10xf32>
      }
      FDRA.terminator
    }
    return %0 : memref<10xf32>
  }
}

