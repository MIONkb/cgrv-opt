module attributes {torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_3x3xi32 : memref<3x3xi32> = dense<[[1, -2, 3], [-4, 5, -6], [7, -8, 9]]>
  func.func @forward(%arg0: memref<2x3xi32>) -> memref<2x3xi32> {
    %c0_i32 = arith.constant 0 : i32
    %0 = memref.get_global @__constant_3x3xi32 : memref<3x3xi32>
    %1 = memref.alloca() {alignment = 64 : i64} : memref<3x3xi32>
    affine.for %arg1 = 0 to 3 {
      affine.for %arg2 = 0 to 3 {
        %4 = affine.load %0[%arg1, %arg2] : memref<3x3xi32>
        affine.store %4, %1[%arg2, %arg1] : memref<3x3xi32>
      }
    }
    %2 = memref.alloc() {alignment = 64 : i64} : memref<2x3xi32>
    affine.for %arg1 = 0 to 2 {
      affine.for %arg2 = 0 to 3 {
        affine.store %c0_i32, %2[%arg1, %arg2] : memref<2x3xi32>
      }
    }
    %3 = memref.alloc() {alignment = 64 : i64} : memref<2x3xi32>
    memref.copy %2, %3 : memref<2x3xi32> to memref<2x3xi32>
    FDRA.KernelCall @forward_kernel_0(%arg0, %1, %3) : (memref<2x3xi32>, memref<3x3xi32>, memref<2x3xi32>) -> ()
    return %3 : memref<2x3xi32>
  }
  func.func @forward_kernel_0(%arg0: memref<2x3xi32>, %arg1: memref<3x3xi32>, %arg2: memref<2x3xi32>) attributes {Kernel, forward_kernel_0} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    affine.for %arg3 = 0 to 2 {
      affine.for %arg4 = 0 to 3 {
        affine.for %arg5 = 0 to 3 {
          %0 = affine.load %arg0[%arg3, %arg5] : memref<2x3xi32>
          %1 = affine.load %arg1[%arg5, %arg4] : memref<3x3xi32>
          %2 = affine.load %arg2[%arg3, %arg4] : memref<2x3xi32>
          %3 = arith.muli %0, %1 : i32
          %4 = arith.addi %2, %3 : i32
          affine.store %4, %arg2[%arg3, %arg4] : memref<2x3xi32>
        }
      }
    }
    return
  }
}

