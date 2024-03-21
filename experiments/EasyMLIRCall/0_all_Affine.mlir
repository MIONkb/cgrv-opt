module attributes {torch.debug_module_name = "L"} {
  func.func @forward(%arg0: memref<3x5xf32>, %arg1: memref<3x5xf32>) -> memref<3x5xf32> {
    %00 = memref.alloc() {alignment = 64 : i64} : memref<3x5xf32>
      affine.for %arg3 = 0 to 3 {
    affine.for %arg4 = 0 to 5 {
      %0 = affine.load %arg0[%arg3, %arg4] : memref<3x5xf32>
      %1 = affine.load %arg1[%arg3, %arg4] : memref<3x5xf32>
      %2 = arith.addf %0, %1 : f32
      affine.store %2, %00[%arg3, %arg4] : memref<3x5xf32>
    }
  }
    return %00 : memref<3x5xf32>
  }
}


