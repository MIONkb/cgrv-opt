module attributes {torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_3x3xf32 : memref<3x3xf32> = dense<[[0.569071651, -0.473457456, 0.519209445], [-0.231614307, -0.085622929, 5.772530e-01], [-0.09853556, -0.0144386981, 0.368846387]]>
  func.func @forward(%arg0: memref<4x3xf32>) -> memref<4x3xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = memref.get_global @__constant_3x3xf32 : memref<3x3xf32>
    %1 = memref.alloc() {alignment = 64 : i64} : memref<3x3xf32>
    FDRA.KernelCall @forward_kernel_0(%0, %1) : (memref<3x3xf32>, memref<3x3xf32>) -> ()
    %2 = memref.alloc() {alignment = 64 : i64} : memref<4x3xf32>
    FDRA.KernelCall @forward_kernel_1(%2) : (memref<4x3xf32>) -> ()
    %3 = memref.alloc() {alignment = 64 : i64} : memref<4x3xf32>
    memref.copy %2, %3 : memref<4x3xf32> to memref<4x3xf32>
    FDRA.KernelCall @forward_kernel_2(%arg0, %1, %3) : (memref<4x3xf32>, memref<3x3xf32>, memref<4x3xf32>) -> ()
    return %3 : memref<4x3xf32>
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
  func.func @forward_kernel_1(%arg0: memref<4x3xf32>) attributes {Kernel, forward_kernel_1} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    %cst = arith.constant 0.000000e+00 : f32
    affine.for %arg1 = 0 to 4 {
      affine.for %arg2 = 0 to 3 {
        affine.store %cst, %arg0[%arg1, %arg2] : memref<4x3xf32>
      }
    }
    return
  }
  func.func @forward_kernel_2(%arg0: memref<4x3xf32>, %arg1: memref<3x3xf32>, %arg2: memref<4x3xf32>) attributes {Kernel, forward_kernel_2} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    affine.for %arg3 = 0 to 4 {
      affine.for %arg4 = 0 to 3 {
        affine.for %arg5 = 0 to 3 {
          %0 = affine.load %arg0[%arg3, %arg5] : memref<4x3xf32>
          %1 = affine.load %arg1[%arg5, %arg4] : memref<3x3xf32>
          %2 = affine.load %arg2[%arg3, %arg4] : memref<4x3xf32>
          %3 = arith.mulf %0, %1 : f32
          %4 = arith.addf %2, %3 : f32
          affine.store %4, %arg2[%arg3, %arg4] : memref<4x3xf32>
        }
      }
    }
    return
  }
}

