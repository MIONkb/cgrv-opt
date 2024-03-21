module attributes {torch.debug_module_name = "L"} {
  func.func @forward(%arg0: memref<3x5xf32>, %arg1: memref<3x5xf32>) -> memref<3x5xf32> {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<3x5xf32>
    %0 = FDRA.BlockLoad %arg0 [0, 0] : memref<3x5xf32> -> memref<3x5xf32> {"forward_kernel_0"}
    %1 = FDRA.BlockLoad %arg1 [0, 0] : memref<3x5xf32> -> memref<3x5xf32> {"forward_kernel_0"}
    %2 = FDRA.BlockLoad %alloc [0, 0] : memref<3x5xf32> -> memref<3x5xf32> {"forward_kernel_0"}
    FDRA.KernelCall @forward_kernel_0(%0, %1, %2) : (memref<3x5xf32>, memref<3x5xf32>, memref<3x5xf32>) -> ()
    FDRA.BlockStore %2,  %alloc [0, 0] : memref<3x5xf32> -> memref<3x5xf32> {"forward_kernel_0"}
    return %alloc : memref<3x5xf32>
  }
  func.func @forward_kernel_0(%arg0: memref<3x5xf32>, %arg1: memref<3x5xf32>, %arg2: memref<3x5xf32>) attributes {Kernel, forward_kernel_0} {
    affine.for %arg3 = 0 to 3 {
      affine.for %arg4 = 0 to 5 {
        %0 = affine.load %arg0[%arg3, %arg4] : memref<3x5xf32>
        %1 = affine.load %arg1[%arg3, %arg4] : memref<3x5xf32>
        %2 = arith.addf %0, %1 : f32
        affine.store %2, %arg2[%arg3, %arg4] : memref<3x5xf32>
      }
    }
    return
  }
}

