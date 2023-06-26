module attributes {torch.debug_module_name = "L"} {
  func.func @forward(%arg0: memref<2xi32>, %arg1: memref<2xi32>) -> memref<2xi32> {
    %0 = memref.alloc() {alignment = 64 : i64} : memref<2xi32>
    FDRA.KernelCall @forward_kernel_0(%arg0, %arg1, %0) : (memref<2xi32>, memref<2xi32>, memref<2xi32>) -> ()
    return %0 : memref<2xi32>
  }
  func.func @forward_kernel_0(%arg0: memref<2xi32>, %arg1: memref<2xi32>, %arg2: memref<2xi32>) attributes {Kernel, forward_kernel_0} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    affine.for %arg3 = 0 to 2 {
      %0 = affine.load %arg0[%arg3] : memref<2xi32>
      %1 = affine.load %arg1[%arg3] : memref<2xi32>
      %2 = arith.addi %0, %1 : i32
      affine.store %2, %arg2[%arg3] : memref<2xi32>
    }
    return
  }
}

