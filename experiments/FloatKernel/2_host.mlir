module attributes {torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_3x3xf32 : memref<3x3xf32> = dense<[[-0.415798277, 0.157707065, 0.13065134], [-0.458860725, -0.0944703146, -0.40910387], [0.19170782, -0.139193341, -0.414218515]]>
  func.func @forward(%arg0: memref<2x3xf32>) -> memref<2x3xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = memref.get_global @__constant_3x3xf32 : memref<3x3xf32>
    %1 = memref.alloca() {alignment = 64 : i64} : memref<3x3xf32>
    affine.for %arg1 = 0 to 3 {
      affine.for %arg2 = 0 to 3 {
        %4 = affine.load %0[%arg1, %arg2] : memref<3x3xf32>
        affine.store %4, %1[%arg2, %arg1] : memref<3x3xf32>
      }
    }
    %2 = memref.alloc() {alignment = 64 : i64} : memref<2x3xf32>
    affine.for %arg1 = 0 to 2 {
      affine.for %arg2 = 0 to 3 {
        affine.store %cst, %2[%arg1, %arg2] : memref<2x3xf32>
      }
    }
    %3 = memref.alloc() {alignment = 64 : i64} : memref<2x3xf32>
    memref.copy %2, %3 : memref<2x3xf32> to memref<2x3xf32>
    FDRA.KernelCall @forward_kernel_0(%arg0, %1, %3) : (memref<2x3xf32>, memref<3x3xf32>, memref<2x3xf32>) -> ()
    return %3 : memref<2x3xf32>
  }
  func.func @forward_kernel_0(%arg0: memref<2x3xf32>, %arg1: memref<3x3xf32>, %arg2: memref<2x3xf32>) attributes {Kernel, forward_kernel_0} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    affine.for %arg3 = 0 to 2 {
      affine.for %arg4 = 0 to 3 {
        affine.for %arg5 = 0 to 3 {
          %0 = affine.load %arg0[%arg3, %arg5] : memref<2x3xf32>
          %1 = affine.load %arg1[%arg5, %arg4] : memref<3x3xf32>
          %2 = affine.load %arg2[%arg3, %arg4] : memref<2x3xf32>
          %3 = arith.mulf %0, %1 : f32
          %4 = arith.addf %2, %3 : f32
          affine.store %4, %arg2[%arg3, %arg4] : memref<2x3xf32>
        }
      }
    }
    return
  }
}

