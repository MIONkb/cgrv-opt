module attributes {torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_3x3xf32 : memref<3x3xf32> = dense<[[-0.533737481, 0.0726815313, 0.548144102], [0.339588523, -0.212466493, 0.129553705], [0.423136026, 0.46056211, -0.0355117619]]>
  func.func @forward(%arg0: memref<3x3xf32>) -> memref<3x3xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = memref.get_global @__constant_3x3xf32 : memref<3x3xf32>
    %1 = memref.alloca() {alignment = 64 : i64} : memref<3x3xf32>
    FDRA.KernelCall @forward_kernel_0(%0, %1) : (memref<3x3xf32>, memref<3x3xf32>) -> ()
    %2 = memref.alloc() {alignment = 64 : i64} : memref<3x3xf32>
    affine.for %arg1 = 0 to 3 {
      affine.for %arg2 = 0 to 3 {
        affine.store %cst, %2[%arg1, %arg2] : memref<3x3xf32>
      }
    }
    %3 = memref.alloc() {alignment = 64 : i64} : memref<3x3xf32>
    memref.copy %2, %3 : memref<3x3xf32> to memref<3x3xf32>
    FDRA.KernelCall @forward_kernel_1(%3, %arg0, %1) : (memref<3x3xf32>, memref<3x3xf32>, memref<3x3xf32>) -> ()
    return %3 : memref<3x3xf32>
  }
  func.func @forward_kernel_0(%arg0: memref<3x3xf32>, %arg1: memref<3x3xf32>) attributes {Kernel, forward_kernel_0} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    affine.for %arg2 = 0 to 3 {
      affine.for %arg3 = 0 to 3 {
        %0 = affine.load %arg0[%arg2, %arg3] : memref<3x3xf32>
        affine.store %0, %arg1[%arg3, %arg2] : memref<3x3xf32>
      }
    }
    return
  }
  func.func @forward_kernel_1(%arg0: memref<3x3xf32>, %arg1: memref<3x3xf32>, %arg2: memref<3x3xf32>) attributes {Kernel, forward_kernel_1} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    affine.for %arg3 = 0 to 3 {
      affine.for %arg4 = 0 to 3 {
        %0 = affine.load %arg0[%arg3, %arg4] : memref<3x3xf32>
        %1 = affine.for %arg5 = 0 to 3 iter_args(%arg6 = %0) -> (f32) {
          %2 = affine.load %arg1[%arg3, %arg5] : memref<3x3xf32>
          %3 = affine.load %arg2[%arg5, %arg4] : memref<3x3xf32>
          %4 = arith.mulf %2, %3 : f32
          %5 = arith.addf %arg6, %4 : f32
          affine.yield %5 : f32
        }
        affine.store %1, %arg0[%arg3, %arg4] : memref<3x3xf32>
      }
    }
    return
  }
}

