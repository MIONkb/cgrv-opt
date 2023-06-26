module attributes {torch.debug_module_name = "L"} {
  func.func @forward(%arg0: memref<2xi32>, %arg1: memref<2xi32>) -> memref<2xi32> {
    %0 = memref.alloc() {alignment = 64 : i64} : memref<2xi32>
    FDRA.kernel {
      affine.for %arg2 = 0 to 2 {
        %1 = affine.load %arg0[%arg2] : memref<2xi32>
        %2 = affine.load %arg1[%arg2] : memref<2xi32>
        %3 = arith.addi %1, %2 : i32
        affine.store %3, %0[%arg2] : memref<2xi32>
      }
      FDRA.terminator
    }
    return %0 : memref<2xi32>
  }
}

