// -----// IR Dump After PromoteBuffersToStack (promote-buffers-to-stack) //----- //
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

// -----// IR Dump After PromoteBuffersToStack (promote-buffers-to-stack) //----- //
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

// -----// IR Dump After PromoteBuffersToStack (promote-buffers-to-stack) //----- //
func.func @forward(%arg0: memref<3x3xf32>) -> memref<3x3xf32> {
  %cst = arith.constant 0.000000e+00 : f32
  %0 = memref.get_global @__constant_3x3xf32 : memref<3x3xf32>
  %alloca = memref.alloca() {alignment = 64 : i64} : memref<3x3xf32>
  FDRA.KernelCall @forward_kernel_0(%0, %alloca) : (memref<3x3xf32>, memref<3x3xf32>) -> ()
  %alloca_0 = memref.alloca() {alignment = 64 : i64} : memref<3x3xf32>
  affine.for %arg1 = 0 to 3 {
    affine.for %arg2 = 0 to 3 {
      affine.store %cst, %alloca_0[%arg1, %arg2] : memref<3x3xf32>
    }
  }
  %alloc = memref.alloc() {alignment = 64 : i64} : memref<3x3xf32>
  memref.copy %alloca_0, %alloc : memref<3x3xf32> to memref<3x3xf32>
  FDRA.KernelCall @forward_kernel_1(%alloc, %arg0, %alloca) : (memref<3x3xf32>, memref<3x3xf32>, memref<3x3xf32>) -> ()
  return %alloc : memref<3x3xf32>
}

// -----// IR Dump After ArithExpandOps (arith-expand) //----- //
module attributes {torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_3x3xf32 : memref<3x3xf32> = dense<[[-0.533737481, 0.0726815313, 0.548144102], [0.339588523, -0.212466493, 0.129553705], [0.423136026, 0.46056211, -0.0355117619]]>
  func.func @forward(%arg0: memref<3x3xf32>) -> memref<3x3xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = memref.get_global @__constant_3x3xf32 : memref<3x3xf32>
    %alloca = memref.alloca() {alignment = 64 : i64} : memref<3x3xf32>
    FDRA.KernelCall @forward_kernel_0(%0, %alloca) : (memref<3x3xf32>, memref<3x3xf32>) -> ()
    %alloca_0 = memref.alloca() {alignment = 64 : i64} : memref<3x3xf32>
    affine.for %arg1 = 0 to 3 {
      affine.for %arg2 = 0 to 3 {
        affine.store %cst, %alloca_0[%arg1, %arg2] : memref<3x3xf32>
      }
    }
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<3x3xf32>
    memref.copy %alloca_0, %alloc : memref<3x3xf32> to memref<3x3xf32>
    FDRA.KernelCall @forward_kernel_1(%alloc, %arg0, %alloca) : (memref<3x3xf32>, memref<3x3xf32>, memref<3x3xf32>) -> ()
    return %alloc : memref<3x3xf32>
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


// -----// IR Dump After ExpandOps (memref-expand) //----- //
module attributes {torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_3x3xf32 : memref<3x3xf32> = dense<[[-0.533737481, 0.0726815313, 0.548144102], [0.339588523, -0.212466493, 0.129553705], [0.423136026, 0.46056211, -0.0355117619]]>
  func.func @forward(%arg0: memref<3x3xf32>) -> memref<3x3xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = memref.get_global @__constant_3x3xf32 : memref<3x3xf32>
    %alloca = memref.alloca() {alignment = 64 : i64} : memref<3x3xf32>
    FDRA.KernelCall @forward_kernel_0(%0, %alloca) : (memref<3x3xf32>, memref<3x3xf32>) -> ()
    %alloca_0 = memref.alloca() {alignment = 64 : i64} : memref<3x3xf32>
    affine.for %arg1 = 0 to 3 {
      affine.for %arg2 = 0 to 3 {
        affine.store %cst, %alloca_0[%arg1, %arg2] : memref<3x3xf32>
      }
    }
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<3x3xf32>
    memref.copy %alloca_0, %alloc : memref<3x3xf32> to memref<3x3xf32>
    FDRA.KernelCall @forward_kernel_1(%alloc, %arg0, %alloca) : (memref<3x3xf32>, memref<3x3xf32>, memref<3x3xf32>) -> ()
    return %alloc : memref<3x3xf32>
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


// -----// IR Dump After NormalizeMemRefs (normalize-memrefs) //----- //
module attributes {torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_3x3xf32 : memref<3x3xf32> = dense<[[-0.533737481, 0.0726815313, 0.548144102], [0.339588523, -0.212466493, 0.129553705], [0.423136026, 0.46056211, -0.0355117619]]>
  func.func @forward(%arg0: memref<3x3xf32>) -> memref<3x3xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = memref.get_global @__constant_3x3xf32 : memref<3x3xf32>
    %alloca = memref.alloca() {alignment = 64 : i64} : memref<3x3xf32>
    FDRA.KernelCall @forward_kernel_0(%0, %alloca) : (memref<3x3xf32>, memref<3x3xf32>) -> ()
    %alloca_0 = memref.alloca() {alignment = 64 : i64} : memref<3x3xf32>
    affine.for %arg1 = 0 to 3 {
      affine.for %arg2 = 0 to 3 {
        affine.store %cst, %alloca_0[%arg1, %arg2] : memref<3x3xf32>
      }
    }
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<3x3xf32>
    memref.copy %alloca_0, %alloc : memref<3x3xf32> to memref<3x3xf32>
    FDRA.KernelCall @forward_kernel_1(%alloc, %arg0, %alloca) : (memref<3x3xf32>, memref<3x3xf32>, memref<3x3xf32>) -> ()
    return %alloc : memref<3x3xf32>
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


// -----// IR Dump After SimplifyAffineStructures (affine-simplify-structures) //----- //
func.func @forward(%arg0: memref<3x3xf32>) -> memref<3x3xf32> {
  %cst = arith.constant 0.000000e+00 : f32
  %0 = memref.get_global @__constant_3x3xf32 : memref<3x3xf32>
  %alloca = memref.alloca() {alignment = 64 : i64} : memref<3x3xf32>
  FDRA.KernelCall @forward_kernel_0(%0, %alloca) : (memref<3x3xf32>, memref<3x3xf32>) -> ()
  %alloca_0 = memref.alloca() {alignment = 64 : i64} : memref<3x3xf32>
  affine.for %arg1 = 0 to 3 {
    affine.for %arg2 = 0 to 3 {
      affine.store %cst, %alloca_0[%arg1, %arg2] : memref<3x3xf32>
    }
  }
  %alloc = memref.alloc() {alignment = 64 : i64} : memref<3x3xf32>
  memref.copy %alloca_0, %alloc : memref<3x3xf32> to memref<3x3xf32>
  FDRA.KernelCall @forward_kernel_1(%alloc, %arg0, %alloca) : (memref<3x3xf32>, memref<3x3xf32>, memref<3x3xf32>) -> ()
  return %alloc : memref<3x3xf32>
}

// -----// IR Dump After SimplifyAffineStructures (affine-simplify-structures) //----- //
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

// -----// IR Dump After SimplifyAffineStructures (affine-simplify-structures) //----- //
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

// -----// IR Dump After ConvertAffineToStandard (lower-affine) //----- //
module attributes {torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_3x3xf32 : memref<3x3xf32> = dense<[[-0.533737481, 0.0726815313, 0.548144102], [0.339588523, -0.212466493, 0.129553705], [0.423136026, 0.46056211, -0.0355117619]]>
  func.func @forward(%arg0: memref<3x3xf32>) -> memref<3x3xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = memref.get_global @__constant_3x3xf32 : memref<3x3xf32>
    %alloca = memref.alloca() {alignment = 64 : i64} : memref<3x3xf32>
    FDRA.KernelCall @forward_kernel_0(%0, %alloca) : (memref<3x3xf32>, memref<3x3xf32>) -> ()
    %alloca_0 = memref.alloca() {alignment = 64 : i64} : memref<3x3xf32>
    %c0 = arith.constant 0 : index
    %c3 = arith.constant 3 : index
    %c1 = arith.constant 1 : index
    scf.for %arg1 = %c0 to %c3 step %c1 {
      %c0_1 = arith.constant 0 : index
      %c3_2 = arith.constant 3 : index
      %c1_3 = arith.constant 1 : index
      scf.for %arg2 = %c0_1 to %c3_2 step %c1_3 {
        memref.store %cst, %alloca_0[%arg1, %arg2] : memref<3x3xf32>
      }
    }
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<3x3xf32>
    memref.copy %alloca_0, %alloc : memref<3x3xf32> to memref<3x3xf32>
    FDRA.KernelCall @forward_kernel_1(%alloc, %arg0, %alloca) : (memref<3x3xf32>, memref<3x3xf32>, memref<3x3xf32>) -> ()
    return %alloc : memref<3x3xf32>
  }
  func.func @forward_kernel_0(%arg0: memref<3x3xf32>, %arg1: memref<3x3xf32>) attributes {Kernel, forward_kernel_0} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    %c0 = arith.constant 0 : index
    %c3 = arith.constant 3 : index
    %c1 = arith.constant 1 : index
    scf.for %arg2 = %c0 to %c3 step %c1 {
      %c0_0 = arith.constant 0 : index
      %c3_1 = arith.constant 3 : index
      %c1_2 = arith.constant 1 : index
      scf.for %arg3 = %c0_0 to %c3_1 step %c1_2 {
        %0 = memref.load %arg0[%arg2, %arg3] : memref<3x3xf32>
        memref.store %0, %arg1[%arg3, %arg2] : memref<3x3xf32>
      }
    }
    return
  }
  func.func @forward_kernel_1(%arg0: memref<3x3xf32>, %arg1: memref<3x3xf32>, %arg2: memref<3x3xf32>) attributes {Kernel, forward_kernel_1} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    %c0 = arith.constant 0 : index
    %c3 = arith.constant 3 : index
    %c1 = arith.constant 1 : index
    scf.for %arg3 = %c0 to %c3 step %c1 {
      %c0_0 = arith.constant 0 : index
      %c3_1 = arith.constant 3 : index
      %c1_2 = arith.constant 1 : index
      scf.for %arg4 = %c0_0 to %c3_1 step %c1_2 {
        %0 = memref.load %arg0[%arg3, %arg4] : memref<3x3xf32>
        %c0_3 = arith.constant 0 : index
        %c3_4 = arith.constant 3 : index
        %c1_5 = arith.constant 1 : index
        %1 = scf.for %arg5 = %c0_3 to %c3_4 step %c1_5 iter_args(%arg6 = %0) -> (f32) {
          %2 = memref.load %arg1[%arg3, %arg5] : memref<3x3xf32>
          %3 = memref.load %arg2[%arg5, %arg4] : memref<3x3xf32>
          %4 = arith.mulf %2, %3 : f32
          %5 = arith.addf %arg6, %4 : f32
          scf.yield %5 : f32
        }
        memref.store %1, %arg0[%arg3, %arg4] : memref<3x3xf32>
      }
    }
    return
  }
}


// -----// IR Dump After SCFForLoopCanonicalization (scf-for-loop-canonicalization) //----- //
module attributes {torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_3x3xf32 : memref<3x3xf32> = dense<[[-0.533737481, 0.0726815313, 0.548144102], [0.339588523, -0.212466493, 0.129553705], [0.423136026, 0.46056211, -0.0355117619]]>
  func.func @forward(%arg0: memref<3x3xf32>) -> memref<3x3xf32> {
    %c1 = arith.constant 1 : index
    %c3 = arith.constant 3 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = memref.get_global @__constant_3x3xf32 : memref<3x3xf32>
    %alloca = memref.alloca() {alignment = 64 : i64} : memref<3x3xf32>
    FDRA.KernelCall @forward_kernel_0(%0, %alloca) : (memref<3x3xf32>, memref<3x3xf32>) -> ()
    %alloca_0 = memref.alloca() {alignment = 64 : i64} : memref<3x3xf32>
    scf.for %arg1 = %c0 to %c3 step %c1 {
      scf.for %arg2 = %c0 to %c3 step %c1 {
        memref.store %cst, %alloca_0[%arg1, %arg2] : memref<3x3xf32>
      }
    }
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<3x3xf32>
    memref.copy %alloca_0, %alloc : memref<3x3xf32> to memref<3x3xf32>
    FDRA.KernelCall @forward_kernel_1(%alloc, %arg0, %alloca) : (memref<3x3xf32>, memref<3x3xf32>, memref<3x3xf32>) -> ()
    return %alloc : memref<3x3xf32>
  }
  func.func @forward_kernel_0(%arg0: memref<3x3xf32>, %arg1: memref<3x3xf32>) attributes {Kernel, forward_kernel_0} {
    %c1 = arith.constant 1 : index
    %c3 = arith.constant 3 : index
    %c0 = arith.constant 0 : index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    scf.for %arg2 = %c0 to %c3 step %c1 {
      scf.for %arg3 = %c0 to %c3 step %c1 {
        %0 = memref.load %arg0[%arg2, %arg3] : memref<3x3xf32>
        memref.store %0, %arg1[%arg3, %arg2] : memref<3x3xf32>
      }
    }
    return
  }
  func.func @forward_kernel_1(%arg0: memref<3x3xf32>, %arg1: memref<3x3xf32>, %arg2: memref<3x3xf32>) attributes {Kernel, forward_kernel_1} {
    %c1 = arith.constant 1 : index
    %c3 = arith.constant 3 : index
    %c0 = arith.constant 0 : index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    scf.for %arg3 = %c0 to %c3 step %c1 {
      scf.for %arg4 = %c0 to %c3 step %c1 {
        %0 = memref.load %arg0[%arg3, %arg4] : memref<3x3xf32>
        %1 = scf.for %arg5 = %c0 to %c3 step %c1 iter_args(%arg6 = %0) -> (f32) {
          %2 = memref.load %arg1[%arg3, %arg5] : memref<3x3xf32>
          %3 = memref.load %arg2[%arg5, %arg4] : memref<3x3xf32>
          %4 = arith.mulf %2, %3 : f32
          %5 = arith.addf %arg6, %4 : f32
          scf.yield %5 : f32
        }
        memref.store %1, %arg0[%arg3, %arg4] : memref<3x3xf32>
      }
    }
    return
  }
}


// -----// IR Dump After SCFToControlFlow (convert-scf-to-cf) //----- //
module attributes {torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_3x3xf32 : memref<3x3xf32> = dense<[[-0.533737481, 0.0726815313, 0.548144102], [0.339588523, -0.212466493, 0.129553705], [0.423136026, 0.46056211, -0.0355117619]]>
  func.func @forward(%arg0: memref<3x3xf32>) -> memref<3x3xf32> {
    %c1 = arith.constant 1 : index
    %c3 = arith.constant 3 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = memref.get_global @__constant_3x3xf32 : memref<3x3xf32>
    %alloca = memref.alloca() {alignment = 64 : i64} : memref<3x3xf32>
    FDRA.KernelCall @forward_kernel_0(%0, %alloca) : (memref<3x3xf32>, memref<3x3xf32>) -> ()
    %alloca_0 = memref.alloca() {alignment = 64 : i64} : memref<3x3xf32>
    cf.br ^bb1(%c0 : index)
  ^bb1(%1: index):  // 2 preds: ^bb0, ^bb5
    %2 = arith.cmpi slt, %1, %c3 : index
    cf.cond_br %2, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    cf.br ^bb3(%c0 : index)
  ^bb3(%3: index):  // 2 preds: ^bb2, ^bb4
    %4 = arith.cmpi slt, %3, %c3 : index
    cf.cond_br %4, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    memref.store %cst, %alloca_0[%1, %3] : memref<3x3xf32>
    %5 = arith.addi %3, %c1 : index
    cf.br ^bb3(%5 : index)
  ^bb5:  // pred: ^bb3
    %6 = arith.addi %1, %c1 : index
    cf.br ^bb1(%6 : index)
  ^bb6:  // pred: ^bb1
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<3x3xf32>
    memref.copy %alloca_0, %alloc : memref<3x3xf32> to memref<3x3xf32>
    FDRA.KernelCall @forward_kernel_1(%alloc, %arg0, %alloca) : (memref<3x3xf32>, memref<3x3xf32>, memref<3x3xf32>) -> ()
    return %alloc : memref<3x3xf32>
  }
  func.func @forward_kernel_0(%arg0: memref<3x3xf32>, %arg1: memref<3x3xf32>) attributes {Kernel, forward_kernel_0} {
    %c1 = arith.constant 1 : index
    %c3 = arith.constant 3 : index
    %c0 = arith.constant 0 : index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%c0 : index)
  ^bb2(%0: index):  // 2 preds: ^bb1, ^bb6
    %1 = arith.cmpi slt, %0, %c3 : index
    cf.cond_br %1, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    cf.br ^bb4(%c0 : index)
  ^bb4(%2: index):  // 2 preds: ^bb3, ^bb5
    %3 = arith.cmpi slt, %2, %c3 : index
    cf.cond_br %3, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %4 = memref.load %arg0[%0, %2] : memref<3x3xf32>
    memref.store %4, %arg1[%2, %0] : memref<3x3xf32>
    %5 = arith.addi %2, %c1 : index
    cf.br ^bb4(%5 : index)
  ^bb6:  // pred: ^bb4
    %6 = arith.addi %0, %c1 : index
    cf.br ^bb2(%6 : index)
  ^bb7:  // pred: ^bb2
    return
  }
  func.func @forward_kernel_1(%arg0: memref<3x3xf32>, %arg1: memref<3x3xf32>, %arg2: memref<3x3xf32>) attributes {Kernel, forward_kernel_1} {
    %c1 = arith.constant 1 : index
    %c3 = arith.constant 3 : index
    %c0 = arith.constant 0 : index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%c0 : index)
  ^bb2(%0: index):  // 2 preds: ^bb1, ^bb9
    %1 = arith.cmpi slt, %0, %c3 : index
    cf.cond_br %1, ^bb3, ^bb10
  ^bb3:  // pred: ^bb2
    cf.br ^bb4(%c0 : index)
  ^bb4(%2: index):  // 2 preds: ^bb3, ^bb8
    %3 = arith.cmpi slt, %2, %c3 : index
    cf.cond_br %3, ^bb5, ^bb9
  ^bb5:  // pred: ^bb4
    %4 = memref.load %arg0[%0, %2] : memref<3x3xf32>
    cf.br ^bb6(%c0, %4 : index, f32)
  ^bb6(%5: index, %6: f32):  // 2 preds: ^bb5, ^bb7
    %7 = arith.cmpi slt, %5, %c3 : index
    cf.cond_br %7, ^bb7, ^bb8
  ^bb7:  // pred: ^bb6
    %8 = memref.load %arg1[%0, %5] : memref<3x3xf32>
    %9 = memref.load %arg2[%5, %2] : memref<3x3xf32>
    %10 = arith.mulf %8, %9 : f32
    %11 = arith.addf %6, %10 : f32
    %12 = arith.addi %5, %c1 : index
    cf.br ^bb6(%12, %11 : index, f32)
  ^bb8:  // pred: ^bb6
    memref.store %6, %arg0[%0, %2] : memref<3x3xf32>
    %13 = arith.addi %2, %c1 : index
    cf.br ^bb4(%13 : index)
  ^bb9:  // pred: ^bb4
    %14 = arith.addi %0, %c1 : index
    cf.br ^bb2(%14 : index)
  ^bb10:  // pred: ^bb2
    return
  }
}


// -----// IR Dump After ConvertMathToLLVMPass (convert-math-to-llvm) //----- //
module attributes {torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_3x3xf32 : memref<3x3xf32> = dense<[[-0.533737481, 0.0726815313, 0.548144102], [0.339588523, -0.212466493, 0.129553705], [0.423136026, 0.46056211, -0.0355117619]]>
  func.func @forward(%arg0: memref<3x3xf32>) -> memref<3x3xf32> {
    %c1 = arith.constant 1 : index
    %c3 = arith.constant 3 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = memref.get_global @__constant_3x3xf32 : memref<3x3xf32>
    %alloca = memref.alloca() {alignment = 64 : i64} : memref<3x3xf32>
    FDRA.KernelCall @forward_kernel_0(%0, %alloca) : (memref<3x3xf32>, memref<3x3xf32>) -> ()
    %alloca_0 = memref.alloca() {alignment = 64 : i64} : memref<3x3xf32>
    cf.br ^bb1(%c0 : index)
  ^bb1(%1: index):  // 2 preds: ^bb0, ^bb5
    %2 = arith.cmpi slt, %1, %c3 : index
    cf.cond_br %2, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    cf.br ^bb3(%c0 : index)
  ^bb3(%3: index):  // 2 preds: ^bb2, ^bb4
    %4 = arith.cmpi slt, %3, %c3 : index
    cf.cond_br %4, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    memref.store %cst, %alloca_0[%1, %3] : memref<3x3xf32>
    %5 = arith.addi %3, %c1 : index
    cf.br ^bb3(%5 : index)
  ^bb5:  // pred: ^bb3
    %6 = arith.addi %1, %c1 : index
    cf.br ^bb1(%6 : index)
  ^bb6:  // pred: ^bb1
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<3x3xf32>
    memref.copy %alloca_0, %alloc : memref<3x3xf32> to memref<3x3xf32>
    FDRA.KernelCall @forward_kernel_1(%alloc, %arg0, %alloca) : (memref<3x3xf32>, memref<3x3xf32>, memref<3x3xf32>) -> ()
    return %alloc : memref<3x3xf32>
  }
  func.func @forward_kernel_0(%arg0: memref<3x3xf32>, %arg1: memref<3x3xf32>) attributes {Kernel, forward_kernel_0} {
    %c1 = arith.constant 1 : index
    %c3 = arith.constant 3 : index
    %c0 = arith.constant 0 : index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%c0 : index)
  ^bb2(%0: index):  // 2 preds: ^bb1, ^bb6
    %1 = arith.cmpi slt, %0, %c3 : index
    cf.cond_br %1, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    cf.br ^bb4(%c0 : index)
  ^bb4(%2: index):  // 2 preds: ^bb3, ^bb5
    %3 = arith.cmpi slt, %2, %c3 : index
    cf.cond_br %3, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %4 = memref.load %arg0[%0, %2] : memref<3x3xf32>
    memref.store %4, %arg1[%2, %0] : memref<3x3xf32>
    %5 = arith.addi %2, %c1 : index
    cf.br ^bb4(%5 : index)
  ^bb6:  // pred: ^bb4
    %6 = arith.addi %0, %c1 : index
    cf.br ^bb2(%6 : index)
  ^bb7:  // pred: ^bb2
    return
  }
  func.func @forward_kernel_1(%arg0: memref<3x3xf32>, %arg1: memref<3x3xf32>, %arg2: memref<3x3xf32>) attributes {Kernel, forward_kernel_1} {
    %c1 = arith.constant 1 : index
    %c3 = arith.constant 3 : index
    %c0 = arith.constant 0 : index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%c0 : index)
  ^bb2(%0: index):  // 2 preds: ^bb1, ^bb9
    %1 = arith.cmpi slt, %0, %c3 : index
    cf.cond_br %1, ^bb3, ^bb10
  ^bb3:  // pred: ^bb2
    cf.br ^bb4(%c0 : index)
  ^bb4(%2: index):  // 2 preds: ^bb3, ^bb8
    %3 = arith.cmpi slt, %2, %c3 : index
    cf.cond_br %3, ^bb5, ^bb9
  ^bb5:  // pred: ^bb4
    %4 = memref.load %arg0[%0, %2] : memref<3x3xf32>
    cf.br ^bb6(%c0, %4 : index, f32)
  ^bb6(%5: index, %6: f32):  // 2 preds: ^bb5, ^bb7
    %7 = arith.cmpi slt, %5, %c3 : index
    cf.cond_br %7, ^bb7, ^bb8
  ^bb7:  // pred: ^bb6
    %8 = memref.load %arg1[%0, %5] : memref<3x3xf32>
    %9 = memref.load %arg2[%5, %2] : memref<3x3xf32>
    %10 = arith.mulf %8, %9 : f32
    %11 = arith.addf %6, %10 : f32
    %12 = arith.addi %5, %c1 : index
    cf.br ^bb6(%12, %11 : index, f32)
  ^bb8:  // pred: ^bb6
    memref.store %6, %arg0[%0, %2] : memref<3x3xf32>
    %13 = arith.addi %2, %c1 : index
    cf.br ^bb4(%13 : index)
  ^bb9:  // pred: ^bb4
    %14 = arith.addi %0, %c1 : index
    cf.br ^bb2(%14 : index)
  ^bb10:  // pred: ^bb2
    return
  }
}


// -----// IR Dump After ConvertMathToLibm (convert-math-to-libm) //----- //
module attributes {torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_3x3xf32 : memref<3x3xf32> = dense<[[-0.533737481, 0.0726815313, 0.548144102], [0.339588523, -0.212466493, 0.129553705], [0.423136026, 0.46056211, -0.0355117619]]>
  func.func @forward(%arg0: memref<3x3xf32>) -> memref<3x3xf32> {
    %c1 = arith.constant 1 : index
    %c3 = arith.constant 3 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = memref.get_global @__constant_3x3xf32 : memref<3x3xf32>
    %alloca = memref.alloca() {alignment = 64 : i64} : memref<3x3xf32>
    FDRA.KernelCall @forward_kernel_0(%0, %alloca) : (memref<3x3xf32>, memref<3x3xf32>) -> ()
    %alloca_0 = memref.alloca() {alignment = 64 : i64} : memref<3x3xf32>
    cf.br ^bb1(%c0 : index)
  ^bb1(%1: index):  // 2 preds: ^bb0, ^bb5
    %2 = arith.cmpi slt, %1, %c3 : index
    cf.cond_br %2, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    cf.br ^bb3(%c0 : index)
  ^bb3(%3: index):  // 2 preds: ^bb2, ^bb4
    %4 = arith.cmpi slt, %3, %c3 : index
    cf.cond_br %4, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    memref.store %cst, %alloca_0[%1, %3] : memref<3x3xf32>
    %5 = arith.addi %3, %c1 : index
    cf.br ^bb3(%5 : index)
  ^bb5:  // pred: ^bb3
    %6 = arith.addi %1, %c1 : index
    cf.br ^bb1(%6 : index)
  ^bb6:  // pred: ^bb1
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<3x3xf32>
    memref.copy %alloca_0, %alloc : memref<3x3xf32> to memref<3x3xf32>
    FDRA.KernelCall @forward_kernel_1(%alloc, %arg0, %alloca) : (memref<3x3xf32>, memref<3x3xf32>, memref<3x3xf32>) -> ()
    return %alloc : memref<3x3xf32>
  }
  func.func @forward_kernel_0(%arg0: memref<3x3xf32>, %arg1: memref<3x3xf32>) attributes {Kernel, forward_kernel_0} {
    %c1 = arith.constant 1 : index
    %c3 = arith.constant 3 : index
    %c0 = arith.constant 0 : index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%c0 : index)
  ^bb2(%0: index):  // 2 preds: ^bb1, ^bb6
    %1 = arith.cmpi slt, %0, %c3 : index
    cf.cond_br %1, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    cf.br ^bb4(%c0 : index)
  ^bb4(%2: index):  // 2 preds: ^bb3, ^bb5
    %3 = arith.cmpi slt, %2, %c3 : index
    cf.cond_br %3, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %4 = memref.load %arg0[%0, %2] : memref<3x3xf32>
    memref.store %4, %arg1[%2, %0] : memref<3x3xf32>
    %5 = arith.addi %2, %c1 : index
    cf.br ^bb4(%5 : index)
  ^bb6:  // pred: ^bb4
    %6 = arith.addi %0, %c1 : index
    cf.br ^bb2(%6 : index)
  ^bb7:  // pred: ^bb2
    return
  }
  func.func @forward_kernel_1(%arg0: memref<3x3xf32>, %arg1: memref<3x3xf32>, %arg2: memref<3x3xf32>) attributes {Kernel, forward_kernel_1} {
    %c1 = arith.constant 1 : index
    %c3 = arith.constant 3 : index
    %c0 = arith.constant 0 : index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%c0 : index)
  ^bb2(%0: index):  // 2 preds: ^bb1, ^bb9
    %1 = arith.cmpi slt, %0, %c3 : index
    cf.cond_br %1, ^bb3, ^bb10
  ^bb3:  // pred: ^bb2
    cf.br ^bb4(%c0 : index)
  ^bb4(%2: index):  // 2 preds: ^bb3, ^bb8
    %3 = arith.cmpi slt, %2, %c3 : index
    cf.cond_br %3, ^bb5, ^bb9
  ^bb5:  // pred: ^bb4
    %4 = memref.load %arg0[%0, %2] : memref<3x3xf32>
    cf.br ^bb6(%c0, %4 : index, f32)
  ^bb6(%5: index, %6: f32):  // 2 preds: ^bb5, ^bb7
    %7 = arith.cmpi slt, %5, %c3 : index
    cf.cond_br %7, ^bb7, ^bb8
  ^bb7:  // pred: ^bb6
    %8 = memref.load %arg1[%0, %5] : memref<3x3xf32>
    %9 = memref.load %arg2[%5, %2] : memref<3x3xf32>
    %10 = arith.mulf %8, %9 : f32
    %11 = arith.addf %6, %10 : f32
    %12 = arith.addi %5, %c1 : index
    cf.br ^bb6(%12, %11 : index, f32)
  ^bb8:  // pred: ^bb6
    memref.store %6, %arg0[%0, %2] : memref<3x3xf32>
    %13 = arith.addi %2, %c1 : index
    cf.br ^bb4(%13 : index)
  ^bb9:  // pred: ^bb4
    %14 = arith.addi %0, %c1 : index
    cf.br ^bb2(%14 : index)
  ^bb10:  // pred: ^bb2
    return
  }
}


// -----// IR Dump After ArithToLLVMConversionPass (convert-arith-to-llvm) //----- //
module attributes {torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_3x3xf32 : memref<3x3xf32> = dense<[[-0.533737481, 0.0726815313, 0.548144102], [0.339588523, -0.212466493, 0.129553705], [0.423136026, 0.46056211, -0.0355117619]]>
  func.func @forward(%arg0: memref<3x3xf32>) -> memref<3x3xf32> {
    %0 = llvm.mlir.constant(1 : index) : i64
    %1 = llvm.mlir.constant(3 : index) : i64
    %2 = llvm.mlir.constant(0 : index) : i64
    %3 = builtin.unrealized_conversion_cast %2 : i64 to index
    %4 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    %5 = memref.get_global @__constant_3x3xf32 : memref<3x3xf32>
    %alloca = memref.alloca() {alignment = 64 : i64} : memref<3x3xf32>
    FDRA.KernelCall @forward_kernel_0(%5, %alloca) : (memref<3x3xf32>, memref<3x3xf32>) -> ()
    %alloca_0 = memref.alloca() {alignment = 64 : i64} : memref<3x3xf32>
    cf.br ^bb1(%3 : index)
  ^bb1(%6: index):  // 2 preds: ^bb0, ^bb5
    %7 = builtin.unrealized_conversion_cast %6 : index to i64
    %8 = llvm.icmp "slt" %7, %1 : i64
    cf.cond_br %8, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    cf.br ^bb3(%3 : index)
  ^bb3(%9: index):  // 2 preds: ^bb2, ^bb4
    %10 = builtin.unrealized_conversion_cast %9 : index to i64
    %11 = llvm.icmp "slt" %10, %1 : i64
    cf.cond_br %11, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    memref.store %4, %alloca_0[%6, %9] : memref<3x3xf32>
    %12 = llvm.add %10, %0  : i64
    %13 = builtin.unrealized_conversion_cast %12 : i64 to index
    cf.br ^bb3(%13 : index)
  ^bb5:  // pred: ^bb3
    %14 = llvm.add %7, %0  : i64
    %15 = builtin.unrealized_conversion_cast %14 : i64 to index
    cf.br ^bb1(%15 : index)
  ^bb6:  // pred: ^bb1
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<3x3xf32>
    memref.copy %alloca_0, %alloc : memref<3x3xf32> to memref<3x3xf32>
    FDRA.KernelCall @forward_kernel_1(%alloc, %arg0, %alloca) : (memref<3x3xf32>, memref<3x3xf32>, memref<3x3xf32>) -> ()
    return %alloc : memref<3x3xf32>
  }
  func.func @forward_kernel_0(%arg0: memref<3x3xf32>, %arg1: memref<3x3xf32>) attributes {Kernel, forward_kernel_0} {
    %0 = llvm.mlir.constant(1 : index) : i64
    %1 = llvm.mlir.constant(3 : index) : i64
    %2 = llvm.mlir.constant(0 : index) : i64
    %3 = builtin.unrealized_conversion_cast %2 : i64 to index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%3 : index)
  ^bb2(%4: index):  // 2 preds: ^bb1, ^bb6
    %5 = builtin.unrealized_conversion_cast %4 : index to i64
    %6 = llvm.icmp "slt" %5, %1 : i64
    cf.cond_br %6, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    cf.br ^bb4(%3 : index)
  ^bb4(%7: index):  // 2 preds: ^bb3, ^bb5
    %8 = builtin.unrealized_conversion_cast %7 : index to i64
    %9 = llvm.icmp "slt" %8, %1 : i64
    cf.cond_br %9, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %10 = memref.load %arg0[%4, %7] : memref<3x3xf32>
    memref.store %10, %arg1[%7, %4] : memref<3x3xf32>
    %11 = llvm.add %8, %0  : i64
    %12 = builtin.unrealized_conversion_cast %11 : i64 to index
    cf.br ^bb4(%12 : index)
  ^bb6:  // pred: ^bb4
    %13 = llvm.add %5, %0  : i64
    %14 = builtin.unrealized_conversion_cast %13 : i64 to index
    cf.br ^bb2(%14 : index)
  ^bb7:  // pred: ^bb2
    return
  }
  func.func @forward_kernel_1(%arg0: memref<3x3xf32>, %arg1: memref<3x3xf32>, %arg2: memref<3x3xf32>) attributes {Kernel, forward_kernel_1} {
    %0 = llvm.mlir.constant(1 : index) : i64
    %1 = llvm.mlir.constant(3 : index) : i64
    %2 = llvm.mlir.constant(0 : index) : i64
    %3 = builtin.unrealized_conversion_cast %2 : i64 to index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%3 : index)
  ^bb2(%4: index):  // 2 preds: ^bb1, ^bb9
    %5 = builtin.unrealized_conversion_cast %4 : index to i64
    %6 = llvm.icmp "slt" %5, %1 : i64
    cf.cond_br %6, ^bb3, ^bb10
  ^bb3:  // pred: ^bb2
    cf.br ^bb4(%3 : index)
  ^bb4(%7: index):  // 2 preds: ^bb3, ^bb8
    %8 = builtin.unrealized_conversion_cast %7 : index to i64
    %9 = llvm.icmp "slt" %8, %1 : i64
    cf.cond_br %9, ^bb5, ^bb9
  ^bb5:  // pred: ^bb4
    %10 = memref.load %arg0[%4, %7] : memref<3x3xf32>
    cf.br ^bb6(%3, %10 : index, f32)
  ^bb6(%11: index, %12: f32):  // 2 preds: ^bb5, ^bb7
    %13 = builtin.unrealized_conversion_cast %11 : index to i64
    %14 = llvm.icmp "slt" %13, %1 : i64
    cf.cond_br %14, ^bb7, ^bb8
  ^bb7:  // pred: ^bb6
    %15 = memref.load %arg1[%4, %11] : memref<3x3xf32>
    %16 = memref.load %arg2[%11, %7] : memref<3x3xf32>
    %17 = llvm.fmul %15, %16  : f32
    %18 = llvm.fadd %12, %17  : f32
    %19 = llvm.add %13, %0  : i64
    %20 = builtin.unrealized_conversion_cast %19 : i64 to index
    cf.br ^bb6(%20, %18 : index, f32)
  ^bb8:  // pred: ^bb6
    memref.store %12, %arg0[%4, %7] : memref<3x3xf32>
    %21 = llvm.add %8, %0  : i64
    %22 = builtin.unrealized_conversion_cast %21 : i64 to index
    cf.br ^bb4(%22 : index)
  ^bb9:  // pred: ^bb4
    %23 = llvm.add %5, %0  : i64
    %24 = builtin.unrealized_conversion_cast %23 : i64 to index
    cf.br ^bb2(%24 : index)
  ^bb10:  // pred: ^bb2
    return
  }
}


// -----// IR Dump After ConvertKernelCallToLLVM (fdra-convert-kernelcall-to-llvm) //----- //
module attributes {torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_3x3xf32 : memref<3x3xf32> = dense<[[-0.533737481, 0.0726815313, 0.548144102], [0.339588523, -0.212466493, 0.129553705], [0.423136026, 0.46056211, -0.0355117619]]>
  llvm.func @forward(%arg0: !llvm.ptr) -> !llvm.ptr {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.mlir.constant(3 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.mlir.constant(3 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %9 = llvm.mlir.constant(3 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.mlir.constant(1 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = llvm.mlir.constant(1 : index) : i64
    %14 = llvm.mlir.constant(3 : index) : i64
    %15 = llvm.mlir.constant(0 : index) : i64
    %16 = builtin.unrealized_conversion_cast %15 : i64 to index
    %17 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    %18 = memref.get_global @__constant_3x3xf32 : memref<3x3xf32>
    %19 = builtin.unrealized_conversion_cast %18 : memref<3x3xf32> to !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %alloca = memref.alloca() {alignment = 64 : i64} : memref<3x3xf32>
    %20 = builtin.unrealized_conversion_cast %alloca : memref<3x3xf32> to !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %21 = llvm.extractvalue %19[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %22 = llvm.extractvalue %20[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_0(%21, %22) : (!llvm.ptr, !llvm.ptr) -> ()
    %alloca_0 = memref.alloca() {alignment = 64 : i64} : memref<3x3xf32>
    llvm.br ^bb1(%15 : i64)
  ^bb1(%23: i64):  // 2 preds: ^bb0, ^bb5
    %24 = builtin.unrealized_conversion_cast %23 : i64 to index
    %25 = builtin.unrealized_conversion_cast %24 : index to i64
    %26 = llvm.icmp "slt" %25, %14 : i64
    llvm.cond_br %26, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    llvm.br ^bb3(%15 : i64)
  ^bb3(%27: i64):  // 2 preds: ^bb2, ^bb4
    %28 = builtin.unrealized_conversion_cast %27 : i64 to index
    %29 = builtin.unrealized_conversion_cast %28 : index to i64
    %30 = llvm.icmp "slt" %29, %14 : i64
    llvm.cond_br %30, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    memref.store %17, %alloca_0[%24, %28] : memref<3x3xf32>
    %31 = llvm.add %29, %13  : i64
    %32 = builtin.unrealized_conversion_cast %31 : i64 to index
    llvm.br ^bb3(%31 : i64)
  ^bb5:  // pred: ^bb3
    %33 = llvm.add %25, %13  : i64
    %34 = builtin.unrealized_conversion_cast %33 : i64 to index
    llvm.br ^bb1(%33 : i64)
  ^bb6:  // pred: ^bb1
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<3x3xf32>
    %35 = builtin.unrealized_conversion_cast %alloc : memref<3x3xf32> to !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    memref.copy %alloca_0, %alloc : memref<3x3xf32> to memref<3x3xf32>
    %36 = llvm.extractvalue %35[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %37 = llvm.extractvalue %12[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %38 = llvm.extractvalue %20[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_1(%36, %37, %38) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    %39 = llvm.extractvalue %35[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.return %39 : !llvm.ptr
  }
  llvm.func @forward_kernel_0(%arg0: !llvm.ptr, %arg1: !llvm.ptr) attributes {Kernel, forward_kernel_0} {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.mlir.constant(3 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.mlir.constant(3 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %9 = llvm.mlir.constant(3 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.mlir.constant(1 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = builtin.unrealized_conversion_cast %12 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> to memref<3x3xf32>
    %14 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %15 = llvm.insertvalue %arg1, %14[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %16 = llvm.insertvalue %arg1, %15[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %17 = llvm.mlir.constant(0 : index) : i64
    %18 = llvm.insertvalue %17, %16[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %19 = llvm.mlir.constant(3 : index) : i64
    %20 = llvm.insertvalue %19, %18[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %21 = llvm.mlir.constant(3 : index) : i64
    %22 = llvm.insertvalue %21, %20[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %23 = llvm.mlir.constant(3 : index) : i64
    %24 = llvm.insertvalue %23, %22[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %25 = llvm.mlir.constant(1 : index) : i64
    %26 = llvm.insertvalue %25, %24[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %27 = builtin.unrealized_conversion_cast %26 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> to memref<3x3xf32>
    %28 = llvm.mlir.constant(1 : index) : i64
    %29 = llvm.mlir.constant(3 : index) : i64
    %30 = llvm.mlir.constant(0 : index) : i64
    %31 = builtin.unrealized_conversion_cast %30 : i64 to index
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%30 : i64)
  ^bb2(%32: i64):  // 2 preds: ^bb1, ^bb6
    %33 = builtin.unrealized_conversion_cast %32 : i64 to index
    %34 = builtin.unrealized_conversion_cast %33 : index to i64
    %35 = llvm.icmp "slt" %34, %29 : i64
    llvm.cond_br %35, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%30 : i64)
  ^bb4(%36: i64):  // 2 preds: ^bb3, ^bb5
    %37 = builtin.unrealized_conversion_cast %36 : i64 to index
    %38 = builtin.unrealized_conversion_cast %37 : index to i64
    %39 = llvm.icmp "slt" %38, %29 : i64
    llvm.cond_br %39, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %40 = memref.load %13[%33, %37] : memref<3x3xf32>
    memref.store %40, %27[%37, %33] : memref<3x3xf32>
    %41 = llvm.add %38, %28  : i64
    %42 = builtin.unrealized_conversion_cast %41 : i64 to index
    llvm.br ^bb4(%41 : i64)
  ^bb6:  // pred: ^bb4
    %43 = llvm.add %34, %28  : i64
    %44 = builtin.unrealized_conversion_cast %43 : i64 to index
    llvm.br ^bb2(%43 : i64)
  ^bb7:  // pred: ^bb2
    llvm.return
  }
  llvm.func @forward_kernel_1(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr) attributes {Kernel, forward_kernel_1} {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.mlir.constant(3 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.mlir.constant(3 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %9 = llvm.mlir.constant(3 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.mlir.constant(1 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = builtin.unrealized_conversion_cast %12 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> to memref<3x3xf32>
    %14 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %15 = llvm.insertvalue %arg1, %14[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %16 = llvm.insertvalue %arg1, %15[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %17 = llvm.mlir.constant(0 : index) : i64
    %18 = llvm.insertvalue %17, %16[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %19 = llvm.mlir.constant(3 : index) : i64
    %20 = llvm.insertvalue %19, %18[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %21 = llvm.mlir.constant(3 : index) : i64
    %22 = llvm.insertvalue %21, %20[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %23 = llvm.mlir.constant(3 : index) : i64
    %24 = llvm.insertvalue %23, %22[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %25 = llvm.mlir.constant(1 : index) : i64
    %26 = llvm.insertvalue %25, %24[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %27 = builtin.unrealized_conversion_cast %26 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> to memref<3x3xf32>
    %28 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %29 = llvm.insertvalue %arg2, %28[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %30 = llvm.insertvalue %arg2, %29[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %31 = llvm.mlir.constant(0 : index) : i64
    %32 = llvm.insertvalue %31, %30[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %33 = llvm.mlir.constant(3 : index) : i64
    %34 = llvm.insertvalue %33, %32[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %35 = llvm.mlir.constant(3 : index) : i64
    %36 = llvm.insertvalue %35, %34[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %37 = llvm.mlir.constant(3 : index) : i64
    %38 = llvm.insertvalue %37, %36[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %39 = llvm.mlir.constant(1 : index) : i64
    %40 = llvm.insertvalue %39, %38[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %41 = builtin.unrealized_conversion_cast %40 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> to memref<3x3xf32>
    %42 = llvm.mlir.constant(1 : index) : i64
    %43 = llvm.mlir.constant(3 : index) : i64
    %44 = llvm.mlir.constant(0 : index) : i64
    %45 = builtin.unrealized_conversion_cast %44 : i64 to index
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%44 : i64)
  ^bb2(%46: i64):  // 2 preds: ^bb1, ^bb9
    %47 = builtin.unrealized_conversion_cast %46 : i64 to index
    %48 = builtin.unrealized_conversion_cast %47 : index to i64
    %49 = llvm.icmp "slt" %48, %43 : i64
    llvm.cond_br %49, ^bb3, ^bb10
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%44 : i64)
  ^bb4(%50: i64):  // 2 preds: ^bb3, ^bb8
    %51 = builtin.unrealized_conversion_cast %50 : i64 to index
    %52 = builtin.unrealized_conversion_cast %51 : index to i64
    %53 = llvm.icmp "slt" %52, %43 : i64
    llvm.cond_br %53, ^bb5, ^bb9
  ^bb5:  // pred: ^bb4
    %54 = memref.load %13[%47, %51] : memref<3x3xf32>
    llvm.br ^bb6(%44, %54 : i64, f32)
  ^bb6(%55: i64, %56: f32):  // 2 preds: ^bb5, ^bb7
    %57 = builtin.unrealized_conversion_cast %55 : i64 to index
    %58 = builtin.unrealized_conversion_cast %57 : index to i64
    %59 = llvm.icmp "slt" %58, %43 : i64
    llvm.cond_br %59, ^bb7, ^bb8
  ^bb7:  // pred: ^bb6
    %60 = memref.load %27[%47, %57] : memref<3x3xf32>
    %61 = memref.load %41[%57, %51] : memref<3x3xf32>
    %62 = llvm.fmul %60, %61  : f32
    %63 = llvm.fadd %56, %62  : f32
    %64 = llvm.add %58, %42  : i64
    %65 = builtin.unrealized_conversion_cast %64 : i64 to index
    llvm.br ^bb6(%64, %63 : i64, f32)
  ^bb8:  // pred: ^bb6
    memref.store %56, %13[%47, %51] : memref<3x3xf32>
    %66 = llvm.add %52, %42  : i64
    %67 = builtin.unrealized_conversion_cast %66 : i64 to index
    llvm.br ^bb4(%66 : i64)
  ^bb9:  // pred: ^bb4
    %68 = llvm.add %48, %42  : i64
    %69 = builtin.unrealized_conversion_cast %68 : i64 to index
    llvm.br ^bb2(%68 : i64)
  ^bb10:  // pred: ^bb2
    llvm.return
  }
}


// -----// IR Dump After ConvertFuncToLLVMPass (convert-func-to-llvm) //----- //
module attributes {llvm.data_layout = "", torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_3x3xf32 : memref<3x3xf32> = dense<[[-0.533737481, 0.0726815313, 0.548144102], [0.339588523, -0.212466493, 0.129553705], [0.423136026, 0.46056211, -0.0355117619]]>
  llvm.func @forward(%arg0: !llvm.ptr) -> !llvm.ptr {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.mlir.constant(3 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.mlir.constant(3 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %9 = llvm.mlir.constant(3 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.mlir.constant(1 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = llvm.mlir.constant(1 : index) : i64
    %14 = llvm.mlir.constant(3 : index) : i64
    %15 = llvm.mlir.constant(0 : index) : i64
    %16 = builtin.unrealized_conversion_cast %15 : i64 to index
    %17 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    %18 = memref.get_global @__constant_3x3xf32 : memref<3x3xf32>
    %19 = builtin.unrealized_conversion_cast %18 : memref<3x3xf32> to !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %alloca = memref.alloca() {alignment = 64 : i64} : memref<3x3xf32>
    %20 = builtin.unrealized_conversion_cast %alloca : memref<3x3xf32> to !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %21 = llvm.extractvalue %19[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %22 = llvm.extractvalue %20[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_0(%21, %22) : (!llvm.ptr, !llvm.ptr) -> ()
    %alloca_0 = memref.alloca() {alignment = 64 : i64} : memref<3x3xf32>
    llvm.br ^bb1(%15 : i64)
  ^bb1(%23: i64):  // 2 preds: ^bb0, ^bb5
    %24 = builtin.unrealized_conversion_cast %23 : i64 to index
    %25 = builtin.unrealized_conversion_cast %24 : index to i64
    %26 = llvm.icmp "slt" %25, %14 : i64
    llvm.cond_br %26, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    llvm.br ^bb3(%15 : i64)
  ^bb3(%27: i64):  // 2 preds: ^bb2, ^bb4
    %28 = builtin.unrealized_conversion_cast %27 : i64 to index
    %29 = builtin.unrealized_conversion_cast %28 : index to i64
    %30 = llvm.icmp "slt" %29, %14 : i64
    llvm.cond_br %30, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    memref.store %17, %alloca_0[%24, %28] : memref<3x3xf32>
    %31 = llvm.add %29, %13  : i64
    %32 = builtin.unrealized_conversion_cast %31 : i64 to index
    llvm.br ^bb3(%31 : i64)
  ^bb5:  // pred: ^bb3
    %33 = llvm.add %25, %13  : i64
    %34 = builtin.unrealized_conversion_cast %33 : i64 to index
    llvm.br ^bb1(%33 : i64)
  ^bb6:  // pred: ^bb1
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<3x3xf32>
    %35 = builtin.unrealized_conversion_cast %alloc : memref<3x3xf32> to !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    memref.copy %alloca_0, %alloc : memref<3x3xf32> to memref<3x3xf32>
    %36 = llvm.extractvalue %35[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %37 = llvm.extractvalue %12[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %38 = llvm.extractvalue %20[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_1(%36, %37, %38) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    %39 = llvm.extractvalue %35[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.return %39 : !llvm.ptr
  }
  llvm.func @forward_kernel_0(%arg0: !llvm.ptr, %arg1: !llvm.ptr) attributes {Kernel, forward_kernel_0} {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.mlir.constant(3 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.mlir.constant(3 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %9 = llvm.mlir.constant(3 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.mlir.constant(1 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = builtin.unrealized_conversion_cast %12 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> to memref<3x3xf32>
    %14 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %15 = llvm.insertvalue %arg1, %14[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %16 = llvm.insertvalue %arg1, %15[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %17 = llvm.mlir.constant(0 : index) : i64
    %18 = llvm.insertvalue %17, %16[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %19 = llvm.mlir.constant(3 : index) : i64
    %20 = llvm.insertvalue %19, %18[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %21 = llvm.mlir.constant(3 : index) : i64
    %22 = llvm.insertvalue %21, %20[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %23 = llvm.mlir.constant(3 : index) : i64
    %24 = llvm.insertvalue %23, %22[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %25 = llvm.mlir.constant(1 : index) : i64
    %26 = llvm.insertvalue %25, %24[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %27 = builtin.unrealized_conversion_cast %26 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> to memref<3x3xf32>
    %28 = llvm.mlir.constant(1 : index) : i64
    %29 = llvm.mlir.constant(3 : index) : i64
    %30 = llvm.mlir.constant(0 : index) : i64
    %31 = builtin.unrealized_conversion_cast %30 : i64 to index
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%30 : i64)
  ^bb2(%32: i64):  // 2 preds: ^bb1, ^bb6
    %33 = builtin.unrealized_conversion_cast %32 : i64 to index
    %34 = builtin.unrealized_conversion_cast %33 : index to i64
    %35 = llvm.icmp "slt" %34, %29 : i64
    llvm.cond_br %35, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%30 : i64)
  ^bb4(%36: i64):  // 2 preds: ^bb3, ^bb5
    %37 = builtin.unrealized_conversion_cast %36 : i64 to index
    %38 = builtin.unrealized_conversion_cast %37 : index to i64
    %39 = llvm.icmp "slt" %38, %29 : i64
    llvm.cond_br %39, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %40 = memref.load %13[%33, %37] : memref<3x3xf32>
    memref.store %40, %27[%37, %33] : memref<3x3xf32>
    %41 = llvm.add %38, %28  : i64
    %42 = builtin.unrealized_conversion_cast %41 : i64 to index
    llvm.br ^bb4(%41 : i64)
  ^bb6:  // pred: ^bb4
    %43 = llvm.add %34, %28  : i64
    %44 = builtin.unrealized_conversion_cast %43 : i64 to index
    llvm.br ^bb2(%43 : i64)
  ^bb7:  // pred: ^bb2
    llvm.return
  }
  llvm.func @forward_kernel_1(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr) attributes {Kernel, forward_kernel_1} {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.mlir.constant(3 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.mlir.constant(3 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %9 = llvm.mlir.constant(3 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.mlir.constant(1 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = builtin.unrealized_conversion_cast %12 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> to memref<3x3xf32>
    %14 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %15 = llvm.insertvalue %arg1, %14[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %16 = llvm.insertvalue %arg1, %15[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %17 = llvm.mlir.constant(0 : index) : i64
    %18 = llvm.insertvalue %17, %16[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %19 = llvm.mlir.constant(3 : index) : i64
    %20 = llvm.insertvalue %19, %18[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %21 = llvm.mlir.constant(3 : index) : i64
    %22 = llvm.insertvalue %21, %20[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %23 = llvm.mlir.constant(3 : index) : i64
    %24 = llvm.insertvalue %23, %22[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %25 = llvm.mlir.constant(1 : index) : i64
    %26 = llvm.insertvalue %25, %24[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %27 = builtin.unrealized_conversion_cast %26 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> to memref<3x3xf32>
    %28 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %29 = llvm.insertvalue %arg2, %28[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %30 = llvm.insertvalue %arg2, %29[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %31 = llvm.mlir.constant(0 : index) : i64
    %32 = llvm.insertvalue %31, %30[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %33 = llvm.mlir.constant(3 : index) : i64
    %34 = llvm.insertvalue %33, %32[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %35 = llvm.mlir.constant(3 : index) : i64
    %36 = llvm.insertvalue %35, %34[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %37 = llvm.mlir.constant(3 : index) : i64
    %38 = llvm.insertvalue %37, %36[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %39 = llvm.mlir.constant(1 : index) : i64
    %40 = llvm.insertvalue %39, %38[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %41 = builtin.unrealized_conversion_cast %40 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> to memref<3x3xf32>
    %42 = llvm.mlir.constant(1 : index) : i64
    %43 = llvm.mlir.constant(3 : index) : i64
    %44 = llvm.mlir.constant(0 : index) : i64
    %45 = builtin.unrealized_conversion_cast %44 : i64 to index
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%44 : i64)
  ^bb2(%46: i64):  // 2 preds: ^bb1, ^bb9
    %47 = builtin.unrealized_conversion_cast %46 : i64 to index
    %48 = builtin.unrealized_conversion_cast %47 : index to i64
    %49 = llvm.icmp "slt" %48, %43 : i64
    llvm.cond_br %49, ^bb3, ^bb10
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%44 : i64)
  ^bb4(%50: i64):  // 2 preds: ^bb3, ^bb8
    %51 = builtin.unrealized_conversion_cast %50 : i64 to index
    %52 = builtin.unrealized_conversion_cast %51 : index to i64
    %53 = llvm.icmp "slt" %52, %43 : i64
    llvm.cond_br %53, ^bb5, ^bb9
  ^bb5:  // pred: ^bb4
    %54 = memref.load %13[%47, %51] : memref<3x3xf32>
    llvm.br ^bb6(%44, %54 : i64, f32)
  ^bb6(%55: i64, %56: f32):  // 2 preds: ^bb5, ^bb7
    %57 = builtin.unrealized_conversion_cast %55 : i64 to index
    %58 = builtin.unrealized_conversion_cast %57 : index to i64
    %59 = llvm.icmp "slt" %58, %43 : i64
    llvm.cond_br %59, ^bb7, ^bb8
  ^bb7:  // pred: ^bb6
    %60 = memref.load %27[%47, %57] : memref<3x3xf32>
    %61 = memref.load %41[%57, %51] : memref<3x3xf32>
    %62 = llvm.fmul %60, %61  : f32
    %63 = llvm.fadd %56, %62  : f32
    %64 = llvm.add %58, %42  : i64
    %65 = builtin.unrealized_conversion_cast %64 : i64 to index
    llvm.br ^bb6(%64, %63 : i64, f32)
  ^bb8:  // pred: ^bb6
    memref.store %56, %13[%47, %51] : memref<3x3xf32>
    %66 = llvm.add %52, %42  : i64
    %67 = builtin.unrealized_conversion_cast %66 : i64 to index
    llvm.br ^bb4(%66 : i64)
  ^bb9:  // pred: ^bb4
    %68 = llvm.add %48, %42  : i64
    %69 = builtin.unrealized_conversion_cast %68 : i64 to index
    llvm.br ^bb2(%68 : i64)
  ^bb10:  // pred: ^bb2
    llvm.return
  }
}


// -----// IR Dump After FinalizeMemRefToLLVMConversionPass (finalize-memref-to-llvm) //----- //
module attributes {llvm.data_layout = "", torch.debug_module_name = "L"} {
  llvm.func @malloc(i64) -> !llvm.ptr
  llvm.mlir.global private constant @__constant_3x3xf32(dense<[[-0.533737481, 0.0726815313, 0.548144102], [0.339588523, -0.212466493, 0.129553705], [0.423136026, 0.46056211, -0.0355117619]]> : tensor<3x3xf32>) {addr_space = 0 : i32} : !llvm.array<3 x array<3 x f32>>
  llvm.func @forward(%arg0: !llvm.ptr) -> !llvm.ptr {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.mlir.constant(3 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.mlir.constant(3 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %9 = llvm.mlir.constant(3 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.mlir.constant(1 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = llvm.mlir.constant(1 : index) : i64
    %14 = llvm.mlir.constant(3 : index) : i64
    %15 = llvm.mlir.constant(0 : index) : i64
    %16 = builtin.unrealized_conversion_cast %15 : i64 to index
    %17 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    %18 = llvm.mlir.constant(3 : index) : i64
    %19 = llvm.mlir.constant(3 : index) : i64
    %20 = llvm.mlir.constant(1 : index) : i64
    %21 = llvm.mlir.constant(9 : index) : i64
    %22 = llvm.mlir.null : !llvm.ptr
    %23 = llvm.getelementptr %22[%21] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %24 = llvm.ptrtoint %23 : !llvm.ptr to i64
    %25 = llvm.mlir.addressof @__constant_3x3xf32 : !llvm.ptr
    %26 = llvm.getelementptr %25[0, 0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<3 x array<3 x f32>>
    %27 = llvm.mlir.constant(3735928559 : index) : i64
    %28 = llvm.inttoptr %27 : i64 to !llvm.ptr
    %29 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %30 = llvm.insertvalue %28, %29[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %31 = llvm.insertvalue %26, %30[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %32 = llvm.mlir.constant(0 : index) : i64
    %33 = llvm.insertvalue %32, %31[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %34 = llvm.insertvalue %18, %33[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %35 = llvm.insertvalue %19, %34[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %36 = llvm.insertvalue %19, %35[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %37 = llvm.insertvalue %20, %36[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %38 = builtin.unrealized_conversion_cast %37 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> to memref<3x3xf32>
    %39 = builtin.unrealized_conversion_cast %38 : memref<3x3xf32> to !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %40 = llvm.mlir.constant(3 : index) : i64
    %41 = llvm.mlir.constant(3 : index) : i64
    %42 = llvm.mlir.constant(1 : index) : i64
    %43 = llvm.mlir.constant(9 : index) : i64
    %44 = llvm.alloca %43 x f32 {alignment = 64 : i64} : (i64) -> !llvm.ptr
    %45 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %46 = llvm.insertvalue %44, %45[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %47 = llvm.insertvalue %44, %46[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %48 = llvm.mlir.constant(0 : index) : i64
    %49 = llvm.insertvalue %48, %47[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %50 = llvm.insertvalue %40, %49[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %51 = llvm.insertvalue %41, %50[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %52 = llvm.insertvalue %41, %51[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %53 = llvm.insertvalue %42, %52[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %54 = builtin.unrealized_conversion_cast %53 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> to memref<3x3xf32>
    %55 = builtin.unrealized_conversion_cast %54 : memref<3x3xf32> to !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %56 = llvm.extractvalue %39[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %57 = llvm.extractvalue %55[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_0(%56, %57) : (!llvm.ptr, !llvm.ptr) -> ()
    %58 = llvm.mlir.constant(3 : index) : i64
    %59 = llvm.mlir.constant(3 : index) : i64
    %60 = llvm.mlir.constant(1 : index) : i64
    %61 = llvm.mlir.constant(9 : index) : i64
    %62 = llvm.alloca %61 x f32 {alignment = 64 : i64} : (i64) -> !llvm.ptr
    %63 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %64 = llvm.insertvalue %62, %63[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %65 = llvm.insertvalue %62, %64[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %66 = llvm.mlir.constant(0 : index) : i64
    %67 = llvm.insertvalue %66, %65[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %68 = llvm.insertvalue %58, %67[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %69 = llvm.insertvalue %59, %68[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %70 = llvm.insertvalue %59, %69[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %71 = llvm.insertvalue %60, %70[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.br ^bb1(%15 : i64)
  ^bb1(%72: i64):  // 2 preds: ^bb0, ^bb5
    %73 = builtin.unrealized_conversion_cast %72 : i64 to index
    %74 = builtin.unrealized_conversion_cast %73 : index to i64
    %75 = llvm.icmp "slt" %74, %14 : i64
    llvm.cond_br %75, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    llvm.br ^bb3(%15 : i64)
  ^bb3(%76: i64):  // 2 preds: ^bb2, ^bb4
    %77 = builtin.unrealized_conversion_cast %76 : i64 to index
    %78 = builtin.unrealized_conversion_cast %77 : index to i64
    %79 = llvm.icmp "slt" %78, %14 : i64
    llvm.cond_br %79, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    %80 = llvm.extractvalue %71[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %81 = llvm.mlir.constant(3 : index) : i64
    %82 = llvm.mul %72, %81  : i64
    %83 = llvm.add %82, %76  : i64
    %84 = llvm.getelementptr %80[%83] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %17, %84 : f32, !llvm.ptr
    %85 = llvm.add %78, %13  : i64
    %86 = builtin.unrealized_conversion_cast %85 : i64 to index
    llvm.br ^bb3(%85 : i64)
  ^bb5:  // pred: ^bb3
    %87 = llvm.add %74, %13  : i64
    %88 = builtin.unrealized_conversion_cast %87 : i64 to index
    llvm.br ^bb1(%87 : i64)
  ^bb6:  // pred: ^bb1
    %89 = llvm.mlir.constant(3 : index) : i64
    %90 = llvm.mlir.constant(3 : index) : i64
    %91 = llvm.mlir.constant(1 : index) : i64
    %92 = llvm.mlir.constant(9 : index) : i64
    %93 = llvm.mlir.null : !llvm.ptr
    %94 = llvm.getelementptr %93[%92] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %95 = llvm.ptrtoint %94 : !llvm.ptr to i64
    %96 = llvm.mlir.constant(64 : index) : i64
    %97 = llvm.add %95, %96  : i64
    %98 = llvm.call @malloc(%97) : (i64) -> !llvm.ptr
    %99 = llvm.ptrtoint %98 : !llvm.ptr to i64
    %100 = llvm.mlir.constant(1 : index) : i64
    %101 = llvm.sub %96, %100  : i64
    %102 = llvm.add %99, %101  : i64
    %103 = llvm.urem %102, %96  : i64
    %104 = llvm.sub %102, %103  : i64
    %105 = llvm.inttoptr %104 : i64 to !llvm.ptr
    %106 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %107 = llvm.insertvalue %98, %106[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %108 = llvm.insertvalue %105, %107[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %109 = llvm.mlir.constant(0 : index) : i64
    %110 = llvm.insertvalue %109, %108[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %111 = llvm.insertvalue %89, %110[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %112 = llvm.insertvalue %90, %111[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %113 = llvm.insertvalue %90, %112[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %114 = llvm.insertvalue %91, %113[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %115 = builtin.unrealized_conversion_cast %114 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> to memref<3x3xf32>
    %116 = builtin.unrealized_conversion_cast %115 : memref<3x3xf32> to !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %117 = llvm.mlir.constant(1 : index) : i64
    %118 = llvm.extractvalue %71[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %119 = llvm.mul %117, %118  : i64
    %120 = llvm.extractvalue %71[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %121 = llvm.mul %119, %120  : i64
    %122 = llvm.mlir.null : !llvm.ptr
    %123 = llvm.getelementptr %122[1] : (!llvm.ptr) -> !llvm.ptr, f32
    %124 = llvm.ptrtoint %123 : !llvm.ptr to i64
    %125 = llvm.mul %121, %124  : i64
    %126 = llvm.extractvalue %71[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %127 = llvm.extractvalue %71[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %128 = llvm.getelementptr %126[%127] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %129 = llvm.extractvalue %114[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %130 = llvm.extractvalue %114[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %131 = llvm.getelementptr %129[%130] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    "llvm.intr.memcpy"(%131, %128, %125) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i64) -> ()
    %132 = llvm.extractvalue %116[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %133 = llvm.extractvalue %12[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %134 = llvm.extractvalue %55[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_1(%132, %133, %134) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    %135 = llvm.extractvalue %116[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.return %135 : !llvm.ptr
  }
  llvm.func @forward_kernel_0(%arg0: !llvm.ptr, %arg1: !llvm.ptr) attributes {Kernel, forward_kernel_0} {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.mlir.constant(3 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.mlir.constant(3 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %9 = llvm.mlir.constant(3 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.mlir.constant(1 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = builtin.unrealized_conversion_cast %12 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> to memref<3x3xf32>
    %14 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %15 = llvm.insertvalue %arg1, %14[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %16 = llvm.insertvalue %arg1, %15[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %17 = llvm.mlir.constant(0 : index) : i64
    %18 = llvm.insertvalue %17, %16[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %19 = llvm.mlir.constant(3 : index) : i64
    %20 = llvm.insertvalue %19, %18[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %21 = llvm.mlir.constant(3 : index) : i64
    %22 = llvm.insertvalue %21, %20[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %23 = llvm.mlir.constant(3 : index) : i64
    %24 = llvm.insertvalue %23, %22[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %25 = llvm.mlir.constant(1 : index) : i64
    %26 = llvm.insertvalue %25, %24[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %27 = builtin.unrealized_conversion_cast %26 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> to memref<3x3xf32>
    %28 = llvm.mlir.constant(1 : index) : i64
    %29 = llvm.mlir.constant(3 : index) : i64
    %30 = llvm.mlir.constant(0 : index) : i64
    %31 = builtin.unrealized_conversion_cast %30 : i64 to index
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%30 : i64)
  ^bb2(%32: i64):  // 2 preds: ^bb1, ^bb6
    %33 = builtin.unrealized_conversion_cast %32 : i64 to index
    %34 = builtin.unrealized_conversion_cast %33 : index to i64
    %35 = llvm.icmp "slt" %34, %29 : i64
    llvm.cond_br %35, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%30 : i64)
  ^bb4(%36: i64):  // 2 preds: ^bb3, ^bb5
    %37 = builtin.unrealized_conversion_cast %36 : i64 to index
    %38 = builtin.unrealized_conversion_cast %37 : index to i64
    %39 = llvm.icmp "slt" %38, %29 : i64
    llvm.cond_br %39, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %40 = llvm.extractvalue %12[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %41 = llvm.mlir.constant(3 : index) : i64
    %42 = llvm.mul %32, %41  : i64
    %43 = llvm.add %42, %36  : i64
    %44 = llvm.getelementptr %40[%43] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %45 = llvm.load %44 : !llvm.ptr -> f32
    %46 = llvm.extractvalue %26[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %47 = llvm.mlir.constant(3 : index) : i64
    %48 = llvm.mul %36, %47  : i64
    %49 = llvm.add %48, %32  : i64
    %50 = llvm.getelementptr %46[%49] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %45, %50 : f32, !llvm.ptr
    %51 = llvm.add %38, %28  : i64
    %52 = builtin.unrealized_conversion_cast %51 : i64 to index
    llvm.br ^bb4(%51 : i64)
  ^bb6:  // pred: ^bb4
    %53 = llvm.add %34, %28  : i64
    %54 = builtin.unrealized_conversion_cast %53 : i64 to index
    llvm.br ^bb2(%53 : i64)
  ^bb7:  // pred: ^bb2
    llvm.return
  }
  llvm.func @forward_kernel_1(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr) attributes {Kernel, forward_kernel_1} {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.mlir.constant(3 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.mlir.constant(3 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %9 = llvm.mlir.constant(3 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.mlir.constant(1 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = builtin.unrealized_conversion_cast %12 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> to memref<3x3xf32>
    %14 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %15 = llvm.insertvalue %arg1, %14[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %16 = llvm.insertvalue %arg1, %15[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %17 = llvm.mlir.constant(0 : index) : i64
    %18 = llvm.insertvalue %17, %16[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %19 = llvm.mlir.constant(3 : index) : i64
    %20 = llvm.insertvalue %19, %18[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %21 = llvm.mlir.constant(3 : index) : i64
    %22 = llvm.insertvalue %21, %20[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %23 = llvm.mlir.constant(3 : index) : i64
    %24 = llvm.insertvalue %23, %22[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %25 = llvm.mlir.constant(1 : index) : i64
    %26 = llvm.insertvalue %25, %24[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %27 = builtin.unrealized_conversion_cast %26 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> to memref<3x3xf32>
    %28 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %29 = llvm.insertvalue %arg2, %28[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %30 = llvm.insertvalue %arg2, %29[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %31 = llvm.mlir.constant(0 : index) : i64
    %32 = llvm.insertvalue %31, %30[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %33 = llvm.mlir.constant(3 : index) : i64
    %34 = llvm.insertvalue %33, %32[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %35 = llvm.mlir.constant(3 : index) : i64
    %36 = llvm.insertvalue %35, %34[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %37 = llvm.mlir.constant(3 : index) : i64
    %38 = llvm.insertvalue %37, %36[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %39 = llvm.mlir.constant(1 : index) : i64
    %40 = llvm.insertvalue %39, %38[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %41 = builtin.unrealized_conversion_cast %40 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> to memref<3x3xf32>
    %42 = llvm.mlir.constant(1 : index) : i64
    %43 = llvm.mlir.constant(3 : index) : i64
    %44 = llvm.mlir.constant(0 : index) : i64
    %45 = builtin.unrealized_conversion_cast %44 : i64 to index
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%44 : i64)
  ^bb2(%46: i64):  // 2 preds: ^bb1, ^bb9
    %47 = builtin.unrealized_conversion_cast %46 : i64 to index
    %48 = builtin.unrealized_conversion_cast %47 : index to i64
    %49 = llvm.icmp "slt" %48, %43 : i64
    llvm.cond_br %49, ^bb3, ^bb10
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%44 : i64)
  ^bb4(%50: i64):  // 2 preds: ^bb3, ^bb8
    %51 = builtin.unrealized_conversion_cast %50 : i64 to index
    %52 = builtin.unrealized_conversion_cast %51 : index to i64
    %53 = llvm.icmp "slt" %52, %43 : i64
    llvm.cond_br %53, ^bb5, ^bb9
  ^bb5:  // pred: ^bb4
    %54 = llvm.extractvalue %12[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %55 = llvm.mlir.constant(3 : index) : i64
    %56 = llvm.mul %46, %55  : i64
    %57 = llvm.add %56, %50  : i64
    %58 = llvm.getelementptr %54[%57] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %59 = llvm.load %58 : !llvm.ptr -> f32
    llvm.br ^bb6(%44, %59 : i64, f32)
  ^bb6(%60: i64, %61: f32):  // 2 preds: ^bb5, ^bb7
    %62 = builtin.unrealized_conversion_cast %60 : i64 to index
    %63 = builtin.unrealized_conversion_cast %62 : index to i64
    %64 = llvm.icmp "slt" %63, %43 : i64
    llvm.cond_br %64, ^bb7, ^bb8
  ^bb7:  // pred: ^bb6
    %65 = llvm.extractvalue %26[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %66 = llvm.mlir.constant(3 : index) : i64
    %67 = llvm.mul %46, %66  : i64
    %68 = llvm.add %67, %60  : i64
    %69 = llvm.getelementptr %65[%68] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %70 = llvm.load %69 : !llvm.ptr -> f32
    %71 = llvm.extractvalue %40[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %72 = llvm.mlir.constant(3 : index) : i64
    %73 = llvm.mul %60, %72  : i64
    %74 = llvm.add %73, %50  : i64
    %75 = llvm.getelementptr %71[%74] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %76 = llvm.load %75 : !llvm.ptr -> f32
    %77 = llvm.fmul %70, %76  : f32
    %78 = llvm.fadd %61, %77  : f32
    %79 = llvm.add %63, %42  : i64
    %80 = builtin.unrealized_conversion_cast %79 : i64 to index
    llvm.br ^bb6(%79, %78 : i64, f32)
  ^bb8:  // pred: ^bb6
    %81 = llvm.extractvalue %12[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %82 = llvm.mlir.constant(3 : index) : i64
    %83 = llvm.mul %46, %82  : i64
    %84 = llvm.add %83, %50  : i64
    %85 = llvm.getelementptr %81[%84] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %61, %85 : f32, !llvm.ptr
    %86 = llvm.add %52, %42  : i64
    %87 = builtin.unrealized_conversion_cast %86 : i64 to index
    llvm.br ^bb4(%86 : i64)
  ^bb9:  // pred: ^bb4
    %88 = llvm.add %48, %42  : i64
    %89 = builtin.unrealized_conversion_cast %88 : i64 to index
    llvm.br ^bb2(%88 : i64)
  ^bb10:  // pred: ^bb2
    llvm.return
  }
}


// -----// IR Dump After ReconcileUnrealizedCasts (reconcile-unrealized-casts) //----- //
module attributes {llvm.data_layout = "", torch.debug_module_name = "L"} {
  llvm.func @malloc(i64) -> !llvm.ptr
  llvm.mlir.global private constant @__constant_3x3xf32(dense<[[-0.533737481, 0.0726815313, 0.548144102], [0.339588523, -0.212466493, 0.129553705], [0.423136026, 0.46056211, -0.0355117619]]> : tensor<3x3xf32>) {addr_space = 0 : i32} : !llvm.array<3 x array<3 x f32>>
  llvm.func @forward(%arg0: !llvm.ptr) -> !llvm.ptr {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.mlir.constant(3 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.mlir.constant(3 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %9 = llvm.mlir.constant(3 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.mlir.constant(1 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = llvm.mlir.constant(1 : index) : i64
    %14 = llvm.mlir.constant(3 : index) : i64
    %15 = llvm.mlir.constant(0 : index) : i64
    %16 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    %17 = llvm.mlir.constant(3 : index) : i64
    %18 = llvm.mlir.constant(3 : index) : i64
    %19 = llvm.mlir.constant(1 : index) : i64
    %20 = llvm.mlir.constant(9 : index) : i64
    %21 = llvm.mlir.null : !llvm.ptr
    %22 = llvm.getelementptr %21[9] : (!llvm.ptr) -> !llvm.ptr, f32
    %23 = llvm.ptrtoint %22 : !llvm.ptr to i64
    %24 = llvm.mlir.addressof @__constant_3x3xf32 : !llvm.ptr
    %25 = llvm.getelementptr %24[0, 0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<3 x array<3 x f32>>
    %26 = llvm.mlir.constant(3735928559 : index) : i64
    %27 = llvm.inttoptr %26 : i64 to !llvm.ptr
    %28 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %29 = llvm.insertvalue %27, %28[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %30 = llvm.insertvalue %25, %29[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %31 = llvm.mlir.constant(0 : index) : i64
    %32 = llvm.insertvalue %31, %30[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %33 = llvm.insertvalue %17, %32[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %34 = llvm.insertvalue %18, %33[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %35 = llvm.insertvalue %18, %34[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %36 = llvm.insertvalue %19, %35[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %37 = llvm.mlir.constant(3 : index) : i64
    %38 = llvm.mlir.constant(3 : index) : i64
    %39 = llvm.mlir.constant(1 : index) : i64
    %40 = llvm.mlir.constant(9 : index) : i64
    %41 = llvm.alloca %40 x f32 {alignment = 64 : i64} : (i64) -> !llvm.ptr
    %42 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %43 = llvm.insertvalue %41, %42[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %44 = llvm.insertvalue %41, %43[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %45 = llvm.mlir.constant(0 : index) : i64
    %46 = llvm.insertvalue %45, %44[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %47 = llvm.insertvalue %37, %46[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %48 = llvm.insertvalue %38, %47[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %49 = llvm.insertvalue %38, %48[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %50 = llvm.insertvalue %39, %49[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %51 = llvm.extractvalue %36[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %52 = llvm.extractvalue %50[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_0(%51, %52) : (!llvm.ptr, !llvm.ptr) -> ()
    %53 = llvm.mlir.constant(3 : index) : i64
    %54 = llvm.mlir.constant(3 : index) : i64
    %55 = llvm.mlir.constant(1 : index) : i64
    %56 = llvm.mlir.constant(9 : index) : i64
    %57 = llvm.alloca %56 x f32 {alignment = 64 : i64} : (i64) -> !llvm.ptr
    %58 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %59 = llvm.insertvalue %57, %58[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %60 = llvm.insertvalue %57, %59[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %61 = llvm.mlir.constant(0 : index) : i64
    %62 = llvm.insertvalue %61, %60[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %63 = llvm.insertvalue %53, %62[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %64 = llvm.insertvalue %54, %63[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %65 = llvm.insertvalue %54, %64[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %66 = llvm.insertvalue %55, %65[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.br ^bb1(%15 : i64)
  ^bb1(%67: i64):  // 2 preds: ^bb0, ^bb5
    %68 = llvm.icmp "slt" %67, %14 : i64
    llvm.cond_br %68, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    llvm.br ^bb3(%15 : i64)
  ^bb3(%69: i64):  // 2 preds: ^bb2, ^bb4
    %70 = llvm.icmp "slt" %69, %14 : i64
    llvm.cond_br %70, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    %71 = llvm.mlir.constant(3 : index) : i64
    %72 = llvm.mul %67, %71  : i64
    %73 = llvm.add %72, %69  : i64
    %74 = llvm.getelementptr %57[%73] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %16, %74 : f32, !llvm.ptr
    %75 = llvm.add %69, %13  : i64
    llvm.br ^bb3(%75 : i64)
  ^bb5:  // pred: ^bb3
    %76 = llvm.add %67, %13  : i64
    llvm.br ^bb1(%76 : i64)
  ^bb6:  // pred: ^bb1
    %77 = llvm.mlir.constant(3 : index) : i64
    %78 = llvm.mlir.constant(3 : index) : i64
    %79 = llvm.mlir.constant(1 : index) : i64
    %80 = llvm.mlir.constant(9 : index) : i64
    %81 = llvm.mlir.null : !llvm.ptr
    %82 = llvm.getelementptr %81[9] : (!llvm.ptr) -> !llvm.ptr, f32
    %83 = llvm.ptrtoint %82 : !llvm.ptr to i64
    %84 = llvm.mlir.constant(64 : index) : i64
    %85 = llvm.add %83, %84  : i64
    %86 = llvm.call @malloc(%85) : (i64) -> !llvm.ptr
    %87 = llvm.ptrtoint %86 : !llvm.ptr to i64
    %88 = llvm.mlir.constant(1 : index) : i64
    %89 = llvm.sub %84, %88  : i64
    %90 = llvm.add %87, %89  : i64
    %91 = llvm.urem %90, %84  : i64
    %92 = llvm.sub %90, %91  : i64
    %93 = llvm.inttoptr %92 : i64 to !llvm.ptr
    %94 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %95 = llvm.insertvalue %86, %94[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %96 = llvm.insertvalue %93, %95[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %97 = llvm.mlir.constant(0 : index) : i64
    %98 = llvm.insertvalue %97, %96[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %99 = llvm.insertvalue %77, %98[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %100 = llvm.insertvalue %78, %99[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %101 = llvm.insertvalue %78, %100[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %102 = llvm.insertvalue %79, %101[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %103 = llvm.mlir.constant(1 : index) : i64
    %104 = llvm.mul %53, %103  : i64
    %105 = llvm.mul %104, %54  : i64
    %106 = llvm.mlir.null : !llvm.ptr
    %107 = llvm.getelementptr %106[1] : (!llvm.ptr) -> !llvm.ptr, f32
    %108 = llvm.ptrtoint %107 : !llvm.ptr to i64
    %109 = llvm.mul %105, %108  : i64
    %110 = llvm.getelementptr %57[%61] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %111 = llvm.getelementptr %93[%97] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    "llvm.intr.memcpy"(%111, %110, %109) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i64) -> ()
    %112 = llvm.extractvalue %102[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %113 = llvm.extractvalue %50[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_1(%112, %arg0, %113) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    %114 = llvm.extractvalue %102[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.return %114 : !llvm.ptr
  }
  llvm.func @forward_kernel_0(%arg0: !llvm.ptr, %arg1: !llvm.ptr) attributes {Kernel, forward_kernel_0} {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.mlir.constant(3 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.mlir.constant(3 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %9 = llvm.mlir.constant(3 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.mlir.constant(1 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %14 = llvm.insertvalue %arg1, %13[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %15 = llvm.insertvalue %arg1, %14[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %16 = llvm.mlir.constant(0 : index) : i64
    %17 = llvm.insertvalue %16, %15[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %18 = llvm.mlir.constant(3 : index) : i64
    %19 = llvm.insertvalue %18, %17[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %20 = llvm.mlir.constant(3 : index) : i64
    %21 = llvm.insertvalue %20, %19[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %22 = llvm.mlir.constant(3 : index) : i64
    %23 = llvm.insertvalue %22, %21[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %24 = llvm.mlir.constant(1 : index) : i64
    %25 = llvm.insertvalue %24, %23[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %26 = llvm.mlir.constant(1 : index) : i64
    %27 = llvm.mlir.constant(3 : index) : i64
    %28 = llvm.mlir.constant(0 : index) : i64
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%28 : i64)
  ^bb2(%29: i64):  // 2 preds: ^bb1, ^bb6
    %30 = llvm.icmp "slt" %29, %27 : i64
    llvm.cond_br %30, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%28 : i64)
  ^bb4(%31: i64):  // 2 preds: ^bb3, ^bb5
    %32 = llvm.icmp "slt" %31, %27 : i64
    llvm.cond_br %32, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %33 = llvm.mlir.constant(3 : index) : i64
    %34 = llvm.mul %29, %33  : i64
    %35 = llvm.add %34, %31  : i64
    %36 = llvm.getelementptr %arg0[%35] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %37 = llvm.load %36 : !llvm.ptr -> f32
    %38 = llvm.mlir.constant(3 : index) : i64
    %39 = llvm.mul %31, %38  : i64
    %40 = llvm.add %39, %29  : i64
    %41 = llvm.getelementptr %arg1[%40] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %37, %41 : f32, !llvm.ptr
    %42 = llvm.add %31, %26  : i64
    llvm.br ^bb4(%42 : i64)
  ^bb6:  // pred: ^bb4
    %43 = llvm.add %29, %26  : i64
    llvm.br ^bb2(%43 : i64)
  ^bb7:  // pred: ^bb2
    llvm.return
  }
  llvm.func @forward_kernel_1(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr) attributes {Kernel, forward_kernel_1} {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.mlir.constant(3 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.mlir.constant(3 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %9 = llvm.mlir.constant(3 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.mlir.constant(1 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %14 = llvm.insertvalue %arg1, %13[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %15 = llvm.insertvalue %arg1, %14[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %16 = llvm.mlir.constant(0 : index) : i64
    %17 = llvm.insertvalue %16, %15[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %18 = llvm.mlir.constant(3 : index) : i64
    %19 = llvm.insertvalue %18, %17[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %20 = llvm.mlir.constant(3 : index) : i64
    %21 = llvm.insertvalue %20, %19[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %22 = llvm.mlir.constant(3 : index) : i64
    %23 = llvm.insertvalue %22, %21[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %24 = llvm.mlir.constant(1 : index) : i64
    %25 = llvm.insertvalue %24, %23[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %26 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %27 = llvm.insertvalue %arg2, %26[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %28 = llvm.insertvalue %arg2, %27[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %29 = llvm.mlir.constant(0 : index) : i64
    %30 = llvm.insertvalue %29, %28[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %31 = llvm.mlir.constant(3 : index) : i64
    %32 = llvm.insertvalue %31, %30[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %33 = llvm.mlir.constant(3 : index) : i64
    %34 = llvm.insertvalue %33, %32[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %35 = llvm.mlir.constant(3 : index) : i64
    %36 = llvm.insertvalue %35, %34[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %37 = llvm.mlir.constant(1 : index) : i64
    %38 = llvm.insertvalue %37, %36[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %39 = llvm.mlir.constant(1 : index) : i64
    %40 = llvm.mlir.constant(3 : index) : i64
    %41 = llvm.mlir.constant(0 : index) : i64
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%41 : i64)
  ^bb2(%42: i64):  // 2 preds: ^bb1, ^bb9
    %43 = llvm.icmp "slt" %42, %40 : i64
    llvm.cond_br %43, ^bb3, ^bb10
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%41 : i64)
  ^bb4(%44: i64):  // 2 preds: ^bb3, ^bb8
    %45 = llvm.icmp "slt" %44, %40 : i64
    llvm.cond_br %45, ^bb5, ^bb9
  ^bb5:  // pred: ^bb4
    %46 = llvm.mlir.constant(3 : index) : i64
    %47 = llvm.mul %42, %46  : i64
    %48 = llvm.add %47, %44  : i64
    %49 = llvm.getelementptr %arg0[%48] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %50 = llvm.load %49 : !llvm.ptr -> f32
    llvm.br ^bb6(%41, %50 : i64, f32)
  ^bb6(%51: i64, %52: f32):  // 2 preds: ^bb5, ^bb7
    %53 = llvm.icmp "slt" %51, %40 : i64
    llvm.cond_br %53, ^bb7, ^bb8
  ^bb7:  // pred: ^bb6
    %54 = llvm.mlir.constant(3 : index) : i64
    %55 = llvm.mul %42, %54  : i64
    %56 = llvm.add %55, %51  : i64
    %57 = llvm.getelementptr %arg1[%56] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %58 = llvm.load %57 : !llvm.ptr -> f32
    %59 = llvm.mlir.constant(3 : index) : i64
    %60 = llvm.mul %51, %59  : i64
    %61 = llvm.add %60, %44  : i64
    %62 = llvm.getelementptr %arg2[%61] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %63 = llvm.load %62 : !llvm.ptr -> f32
    %64 = llvm.fmul %58, %63  : f32
    %65 = llvm.fadd %52, %64  : f32
    %66 = llvm.add %51, %39  : i64
    llvm.br ^bb6(%66, %65 : i64, f32)
  ^bb8:  // pred: ^bb6
    %67 = llvm.mlir.constant(3 : index) : i64
    %68 = llvm.mul %42, %67  : i64
    %69 = llvm.add %68, %44  : i64
    %70 = llvm.getelementptr %arg0[%69] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %52, %70 : f32, !llvm.ptr
    %71 = llvm.add %44, %39  : i64
    llvm.br ^bb4(%71 : i64)
  ^bb9:  // pred: ^bb4
    %72 = llvm.add %42, %39  : i64
    llvm.br ^bb2(%72 : i64)
  ^bb10:  // pred: ^bb2
    llvm.return
  }
}


