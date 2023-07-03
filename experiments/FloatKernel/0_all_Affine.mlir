module attributes {torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_3x3xf32 : memref<3x3xf32> = dense<[[-0.415798277, 0.157707065, 0.13065134], [-0.458860725, -0.0944703146, -0.40910387], [0.19170782, -0.139193341, -0.414218515]]>
  func.func @forward(%arg0: memref<2x3xf32>) -> memref<2x3xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = memref.get_global @__constant_3x3xf32 : memref<3x3xf32>
    %alloca = memref.alloca() {alignment = 64 : i64} : memref<3x3xf32>
    affine.for %arg1 = 0 to 3 {
      affine.for %arg2 = 0 to 3 {
        %1 = affine.load %0[%arg1, %arg2] : memref<3x3xf32>
        affine.store %1, %alloca[%arg2, %arg1] : memref<3x3xf32>
      }
    }
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<2x3xf32>
    affine.for %arg1 = 0 to 2 {
      affine.for %arg2 = 0 to 3 {
        affine.store %cst, %alloc[%arg1, %arg2] : memref<2x3xf32>
      }
    }
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<2x3xf32>
    memref.copy %alloc, %alloc_0 : memref<2x3xf32> to memref<2x3xf32>
    affine.for %arg1 = 0 to 2 {
      affine.for %arg2 = 0 to 3 {
        affine.for %arg3 = 0 to 3 {
          %1 = affine.load %arg0[%arg1, %arg3] : memref<2x3xf32>
          %2 = affine.load %alloca[%arg3, %arg2] : memref<3x3xf32>
          %3 = affine.load %alloc_0[%arg1, %arg2] : memref<2x3xf32>
          %4 = arith.mulf %1, %2 : f32
          %5 = arith.addf %3, %4 : f32
          affine.store %5, %alloc_0[%arg1, %arg2] : memref<2x3xf32>
        }
      }
    }
    return %alloc_0 : memref<2x3xf32>
  }
}

