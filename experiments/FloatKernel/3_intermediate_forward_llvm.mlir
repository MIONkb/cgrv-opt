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
func.func @forward(%arg0: memref<3x3xf32>) -> memref<3x3xf32> {
  %cst = arith.constant 0.000000e+00 : f32
  %0 = memref.get_global @__constant_3x3xf32 : memref<3x3xf32>
  %1 = memref.alloca() {alignment = 64 : i64} : memref<3x3xf32>
  FDRA.KernelCall @forward_kernel_0(%0, %1) : (memref<3x3xf32>, memref<3x3xf32>) -> ()
  %2 = memref.alloca() : memref<3x3xf32>
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

// -----// IR Dump After ArithmeticExpandOps (arith-expand) //----- //
module attributes {torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_3x3xf32 : memref<3x3xf32> = dense<[[-0.533737481, 0.0726815313, 0.548144102], [0.339588523, -0.212466493, 0.129553705], [0.423136026, 0.46056211, -0.0355117619]]>
  func.func @forward(%arg0: memref<3x3xf32>) -> memref<3x3xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = memref.get_global @__constant_3x3xf32 : memref<3x3xf32>
    %1 = memref.alloca() {alignment = 64 : i64} : memref<3x3xf32>
    FDRA.KernelCall @forward_kernel_0(%0, %1) : (memref<3x3xf32>, memref<3x3xf32>) -> ()
    %2 = memref.alloca() : memref<3x3xf32>
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


// -----// IR Dump After ExpandOps (memref-expand) //----- //
module attributes {torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_3x3xf32 : memref<3x3xf32> = dense<[[-0.533737481, 0.0726815313, 0.548144102], [0.339588523, -0.212466493, 0.129553705], [0.423136026, 0.46056211, -0.0355117619]]>
  func.func @forward(%arg0: memref<3x3xf32>) -> memref<3x3xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = memref.get_global @__constant_3x3xf32 : memref<3x3xf32>
    %1 = memref.alloca() {alignment = 64 : i64} : memref<3x3xf32>
    FDRA.KernelCall @forward_kernel_0(%0, %1) : (memref<3x3xf32>, memref<3x3xf32>) -> ()
    %2 = memref.alloca() : memref<3x3xf32>
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


// -----// IR Dump After NormalizeMemRefs (normalize-memrefs) //----- //
module attributes {torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_3x3xf32 : memref<3x3xf32> = dense<[[-0.533737481, 0.0726815313, 0.548144102], [0.339588523, -0.212466493, 0.129553705], [0.423136026, 0.46056211, -0.0355117619]]>
  func.func @forward(%arg0: memref<3x3xf32>) -> memref<3x3xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = memref.get_global @__constant_3x3xf32 : memref<3x3xf32>
    %1 = memref.alloca() {alignment = 64 : i64} : memref<3x3xf32>
    FDRA.KernelCall @forward_kernel_0(%0, %1) : (memref<3x3xf32>, memref<3x3xf32>) -> ()
    %2 = memref.alloca() : memref<3x3xf32>
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


// -----// IR Dump After SimplifyAffineStructures (affine-simplify-structures) //----- //
func.func @forward(%arg0: memref<3x3xf32>) -> memref<3x3xf32> {
  %cst = arith.constant 0.000000e+00 : f32
  %0 = memref.get_global @__constant_3x3xf32 : memref<3x3xf32>
  %1 = memref.alloca() {alignment = 64 : i64} : memref<3x3xf32>
  FDRA.KernelCall @forward_kernel_0(%0, %1) : (memref<3x3xf32>, memref<3x3xf32>) -> ()
  %2 = memref.alloca() : memref<3x3xf32>
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

// -----// IR Dump After ConvertAffineToStandard (lower-affine) //----- //
module attributes {torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_3x3xf32 : memref<3x3xf32> = dense<[[-0.533737481, 0.0726815313, 0.548144102], [0.339588523, -0.212466493, 0.129553705], [0.423136026, 0.46056211, -0.0355117619]]>
  func.func @forward(%arg0: memref<3x3xf32>) -> memref<3x3xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = memref.get_global @__constant_3x3xf32 : memref<3x3xf32>
    %1 = memref.alloca() {alignment = 64 : i64} : memref<3x3xf32>
    FDRA.KernelCall @forward_kernel_0(%0, %1) : (memref<3x3xf32>, memref<3x3xf32>) -> ()
    %2 = memref.alloca() : memref<3x3xf32>
    %c0 = arith.constant 0 : index
    %c3 = arith.constant 3 : index
    %c1 = arith.constant 1 : index
    scf.for %arg1 = %c0 to %c3 step %c1 {
      %c0_0 = arith.constant 0 : index
      %c3_1 = arith.constant 3 : index
      %c1_2 = arith.constant 1 : index
      scf.for %arg2 = %c0_0 to %c3_1 step %c1_2 {
        memref.store %cst, %2[%arg1, %arg2] : memref<3x3xf32>
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
    %1 = memref.alloca() {alignment = 64 : i64} : memref<3x3xf32>
    FDRA.KernelCall @forward_kernel_0(%0, %1) : (memref<3x3xf32>, memref<3x3xf32>) -> ()
    %2 = memref.alloca() : memref<3x3xf32>
    scf.for %arg1 = %c0 to %c3 step %c1 {
      scf.for %arg2 = %c0 to %c3 step %c1 {
        memref.store %cst, %2[%arg1, %arg2] : memref<3x3xf32>
      }
    }
    %3 = memref.alloc() {alignment = 64 : i64} : memref<3x3xf32>
    memref.copy %2, %3 : memref<3x3xf32> to memref<3x3xf32>
    FDRA.KernelCall @forward_kernel_1(%3, %arg0, %1) : (memref<3x3xf32>, memref<3x3xf32>, memref<3x3xf32>) -> ()
    return %3 : memref<3x3xf32>
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
    %1 = memref.alloca() {alignment = 64 : i64} : memref<3x3xf32>
    FDRA.KernelCall @forward_kernel_0(%0, %1) : (memref<3x3xf32>, memref<3x3xf32>) -> ()
    %2 = memref.alloca() : memref<3x3xf32>
    cf.br ^bb1(%c0 : index)
  ^bb1(%3: index):  // 2 preds: ^bb0, ^bb5
    %4 = arith.cmpi slt, %3, %c3 : index
    cf.cond_br %4, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    cf.br ^bb3(%c0 : index)
  ^bb3(%5: index):  // 2 preds: ^bb2, ^bb4
    %6 = arith.cmpi slt, %5, %c3 : index
    cf.cond_br %6, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    memref.store %cst, %2[%3, %5] : memref<3x3xf32>
    %7 = arith.addi %5, %c1 : index
    cf.br ^bb3(%7 : index)
  ^bb5:  // pred: ^bb3
    %8 = arith.addi %3, %c1 : index
    cf.br ^bb1(%8 : index)
  ^bb6:  // pred: ^bb1
    %9 = memref.alloc() {alignment = 64 : i64} : memref<3x3xf32>
    memref.copy %2, %9 : memref<3x3xf32> to memref<3x3xf32>
    FDRA.KernelCall @forward_kernel_1(%9, %arg0, %1) : (memref<3x3xf32>, memref<3x3xf32>, memref<3x3xf32>) -> ()
    return %9 : memref<3x3xf32>
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


// -----// IR Dump After ConvertMathToLLVM (convert-math-to-llvm) //----- //
module attributes {torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_3x3xf32 : memref<3x3xf32> = dense<[[-0.533737481, 0.0726815313, 0.548144102], [0.339588523, -0.212466493, 0.129553705], [0.423136026, 0.46056211, -0.0355117619]]>
  func.func @forward(%arg0: memref<3x3xf32>) -> memref<3x3xf32> {
    %c1 = arith.constant 1 : index
    %c3 = arith.constant 3 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = memref.get_global @__constant_3x3xf32 : memref<3x3xf32>
    %1 = memref.alloca() {alignment = 64 : i64} : memref<3x3xf32>
    FDRA.KernelCall @forward_kernel_0(%0, %1) : (memref<3x3xf32>, memref<3x3xf32>) -> ()
    %2 = memref.alloca() : memref<3x3xf32>
    cf.br ^bb1(%c0 : index)
  ^bb1(%3: index):  // 2 preds: ^bb0, ^bb5
    %4 = arith.cmpi slt, %3, %c3 : index
    cf.cond_br %4, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    cf.br ^bb3(%c0 : index)
  ^bb3(%5: index):  // 2 preds: ^bb2, ^bb4
    %6 = arith.cmpi slt, %5, %c3 : index
    cf.cond_br %6, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    memref.store %cst, %2[%3, %5] : memref<3x3xf32>
    %7 = arith.addi %5, %c1 : index
    cf.br ^bb3(%7 : index)
  ^bb5:  // pred: ^bb3
    %8 = arith.addi %3, %c1 : index
    cf.br ^bb1(%8 : index)
  ^bb6:  // pred: ^bb1
    %9 = memref.alloc() {alignment = 64 : i64} : memref<3x3xf32>
    memref.copy %2, %9 : memref<3x3xf32> to memref<3x3xf32>
    FDRA.KernelCall @forward_kernel_1(%9, %arg0, %1) : (memref<3x3xf32>, memref<3x3xf32>, memref<3x3xf32>) -> ()
    return %9 : memref<3x3xf32>
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
    %1 = memref.alloca() {alignment = 64 : i64} : memref<3x3xf32>
    FDRA.KernelCall @forward_kernel_0(%0, %1) : (memref<3x3xf32>, memref<3x3xf32>) -> ()
    %2 = memref.alloca() : memref<3x3xf32>
    cf.br ^bb1(%c0 : index)
  ^bb1(%3: index):  // 2 preds: ^bb0, ^bb5
    %4 = arith.cmpi slt, %3, %c3 : index
    cf.cond_br %4, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    cf.br ^bb3(%c0 : index)
  ^bb3(%5: index):  // 2 preds: ^bb2, ^bb4
    %6 = arith.cmpi slt, %5, %c3 : index
    cf.cond_br %6, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    memref.store %cst, %2[%3, %5] : memref<3x3xf32>
    %7 = arith.addi %5, %c1 : index
    cf.br ^bb3(%7 : index)
  ^bb5:  // pred: ^bb3
    %8 = arith.addi %3, %c1 : index
    cf.br ^bb1(%8 : index)
  ^bb6:  // pred: ^bb1
    %9 = memref.alloc() {alignment = 64 : i64} : memref<3x3xf32>
    memref.copy %2, %9 : memref<3x3xf32> to memref<3x3xf32>
    FDRA.KernelCall @forward_kernel_1(%9, %arg0, %1) : (memref<3x3xf32>, memref<3x3xf32>, memref<3x3xf32>) -> ()
    return %9 : memref<3x3xf32>
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


// -----// IR Dump After ConvertArithmeticToLLVM (convert-arith-to-llvm) //----- //
module attributes {torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_3x3xf32 : memref<3x3xf32> = dense<[[-0.533737481, 0.0726815313, 0.548144102], [0.339588523, -0.212466493, 0.129553705], [0.423136026, 0.46056211, -0.0355117619]]>
  func.func @forward(%arg0: memref<3x3xf32>) -> memref<3x3xf32> {
    %0 = llvm.mlir.constant(1 : index) : i64
    %1 = llvm.mlir.constant(3 : index) : i64
    %2 = llvm.mlir.constant(0 : index) : i64
    %3 = builtin.unrealized_conversion_cast %2 : i64 to index
    %4 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    %5 = memref.get_global @__constant_3x3xf32 : memref<3x3xf32>
    %6 = memref.alloca() {alignment = 64 : i64} : memref<3x3xf32>
    FDRA.KernelCall @forward_kernel_0(%5, %6) : (memref<3x3xf32>, memref<3x3xf32>) -> ()
    %7 = memref.alloca() : memref<3x3xf32>
    cf.br ^bb1(%3 : index)
  ^bb1(%8: index):  // 2 preds: ^bb0, ^bb5
    %9 = builtin.unrealized_conversion_cast %8 : index to i64
    %10 = llvm.icmp "slt" %9, %1 : i64
    cf.cond_br %10, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    cf.br ^bb3(%3 : index)
  ^bb3(%11: index):  // 2 preds: ^bb2, ^bb4
    %12 = builtin.unrealized_conversion_cast %11 : index to i64
    %13 = llvm.icmp "slt" %12, %1 : i64
    cf.cond_br %13, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    memref.store %4, %7[%8, %11] : memref<3x3xf32>
    %14 = llvm.add %12, %0  : i64
    %15 = builtin.unrealized_conversion_cast %14 : i64 to index
    cf.br ^bb3(%15 : index)
  ^bb5:  // pred: ^bb3
    %16 = llvm.add %9, %0  : i64
    %17 = builtin.unrealized_conversion_cast %16 : i64 to index
    cf.br ^bb1(%17 : index)
  ^bb6:  // pred: ^bb1
    %18 = memref.alloc() {alignment = 64 : i64} : memref<3x3xf32>
    memref.copy %7, %18 : memref<3x3xf32> to memref<3x3xf32>
    FDRA.KernelCall @forward_kernel_1(%18, %arg0, %6) : (memref<3x3xf32>, memref<3x3xf32>, memref<3x3xf32>) -> ()
    return %18 : memref<3x3xf32>
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


[debug] not a kernel func
// -----// IR Dump After ConvertKernelCallToLLVM (fdra-convert-kernelcall-to-llvm) //----- //
module attributes {torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_3x3xf32 : memref<3x3xf32> = dense<[[-0.533737481, 0.0726815313, 0.548144102], [0.339588523, -0.212466493, 0.129553705], [0.423136026, 0.46056211, -0.0355117619]]>
  llvm.func @forward(%arg0: !llvm.ptr<f32>) -> !llvm.ptr<f32> {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.mlir.constant(3 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.mlir.constant(3 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %9 = llvm.mlir.constant(3 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.mlir.constant(1 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = llvm.mlir.constant(1 : index) : i64
    %14 = llvm.mlir.constant(3 : index) : i64
    %15 = llvm.mlir.constant(0 : index) : i64
    %16 = builtin.unrealized_conversion_cast %15 : i64 to index
    %17 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    %18 = memref.get_global @__constant_3x3xf32 : memref<3x3xf32>
    %19 = builtin.unrealized_conversion_cast %18 : memref<3x3xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %20 = memref.alloca() {alignment = 64 : i64} : memref<3x3xf32>
    %21 = builtin.unrealized_conversion_cast %20 : memref<3x3xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %22 = llvm.extractvalue %19[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %23 = llvm.extractvalue %21[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_0(%22, %23) : (!llvm.ptr<f32>, !llvm.ptr<f32>) -> ()
    %24 = memref.alloca() : memref<3x3xf32>
    llvm.br ^bb1(%15 : i64)
  ^bb1(%25: i64):  // 2 preds: ^bb0, ^bb5
    %26 = builtin.unrealized_conversion_cast %25 : i64 to index
    %27 = builtin.unrealized_conversion_cast %26 : index to i64
    %28 = llvm.icmp "slt" %27, %14 : i64
    llvm.cond_br %28, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    llvm.br ^bb3(%15 : i64)
  ^bb3(%29: i64):  // 2 preds: ^bb2, ^bb4
    %30 = builtin.unrealized_conversion_cast %29 : i64 to index
    %31 = builtin.unrealized_conversion_cast %30 : index to i64
    %32 = llvm.icmp "slt" %31, %14 : i64
    llvm.cond_br %32, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    memref.store %17, %24[%26, %30] : memref<3x3xf32>
    %33 = llvm.add %31, %13  : i64
    %34 = builtin.unrealized_conversion_cast %33 : i64 to index
    llvm.br ^bb3(%33 : i64)
  ^bb5:  // pred: ^bb3
    %35 = llvm.add %27, %13  : i64
    %36 = builtin.unrealized_conversion_cast %35 : i64 to index
    llvm.br ^bb1(%35 : i64)
  ^bb6:  // pred: ^bb1
    %37 = memref.alloc() {alignment = 64 : i64} : memref<3x3xf32>
    %38 = builtin.unrealized_conversion_cast %37 : memref<3x3xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    memref.copy %24, %37 : memref<3x3xf32> to memref<3x3xf32>
    %39 = llvm.extractvalue %38[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %40 = llvm.extractvalue %12[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %41 = llvm.extractvalue %21[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_1(%39, %40, %41) : (!llvm.ptr<f32>, !llvm.ptr<f32>, !llvm.ptr<f32>) -> ()
    %42 = llvm.extractvalue %38[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.return %42 : !llvm.ptr<f32>
  }
  llvm.func @forward_kernel_0(!llvm.ptr<f32>, !llvm.ptr<f32>) attributes {Kernel, forward_kernel_0}
  llvm.func @forward_kernel_1(!llvm.ptr<f32>, !llvm.ptr<f32>, !llvm.ptr<f32>) attributes {Kernel, forward_kernel_1}
}


// -----// IR Dump After ConvertFuncToLLVM (convert-func-to-llvm) //----- //
module attributes {llvm.data_layout = "", torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_3x3xf32 : memref<3x3xf32> = dense<[[-0.533737481, 0.0726815313, 0.548144102], [0.339588523, -0.212466493, 0.129553705], [0.423136026, 0.46056211, -0.0355117619]]>
  llvm.func @forward(%arg0: !llvm.ptr<f32>) -> !llvm.ptr<f32> {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.mlir.constant(3 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.mlir.constant(3 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %9 = llvm.mlir.constant(3 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.mlir.constant(1 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = llvm.mlir.constant(1 : index) : i64
    %14 = llvm.mlir.constant(3 : index) : i64
    %15 = llvm.mlir.constant(0 : index) : i64
    %16 = builtin.unrealized_conversion_cast %15 : i64 to index
    %17 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    %18 = memref.get_global @__constant_3x3xf32 : memref<3x3xf32>
    %19 = builtin.unrealized_conversion_cast %18 : memref<3x3xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %20 = memref.alloca() {alignment = 64 : i64} : memref<3x3xf32>
    %21 = builtin.unrealized_conversion_cast %20 : memref<3x3xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %22 = llvm.extractvalue %19[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %23 = llvm.extractvalue %21[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_0(%22, %23) : (!llvm.ptr<f32>, !llvm.ptr<f32>) -> ()
    %24 = memref.alloca() : memref<3x3xf32>
    llvm.br ^bb1(%15 : i64)
  ^bb1(%25: i64):  // 2 preds: ^bb0, ^bb5
    %26 = builtin.unrealized_conversion_cast %25 : i64 to index
    %27 = builtin.unrealized_conversion_cast %26 : index to i64
    %28 = llvm.icmp "slt" %27, %14 : i64
    llvm.cond_br %28, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    llvm.br ^bb3(%15 : i64)
  ^bb3(%29: i64):  // 2 preds: ^bb2, ^bb4
    %30 = builtin.unrealized_conversion_cast %29 : i64 to index
    %31 = builtin.unrealized_conversion_cast %30 : index to i64
    %32 = llvm.icmp "slt" %31, %14 : i64
    llvm.cond_br %32, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    memref.store %17, %24[%26, %30] : memref<3x3xf32>
    %33 = llvm.add %31, %13  : i64
    %34 = builtin.unrealized_conversion_cast %33 : i64 to index
    llvm.br ^bb3(%33 : i64)
  ^bb5:  // pred: ^bb3
    %35 = llvm.add %27, %13  : i64
    %36 = builtin.unrealized_conversion_cast %35 : i64 to index
    llvm.br ^bb1(%35 : i64)
  ^bb6:  // pred: ^bb1
    %37 = memref.alloc() {alignment = 64 : i64} : memref<3x3xf32>
    %38 = builtin.unrealized_conversion_cast %37 : memref<3x3xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    memref.copy %24, %37 : memref<3x3xf32> to memref<3x3xf32>
    %39 = llvm.extractvalue %38[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %40 = llvm.extractvalue %12[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %41 = llvm.extractvalue %21[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_1(%39, %40, %41) : (!llvm.ptr<f32>, !llvm.ptr<f32>, !llvm.ptr<f32>) -> ()
    %42 = llvm.extractvalue %38[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.return %42 : !llvm.ptr<f32>
  }
  llvm.func @forward_kernel_0(!llvm.ptr<f32>, !llvm.ptr<f32>) attributes {Kernel, forward_kernel_0}
  llvm.func @forward_kernel_1(!llvm.ptr<f32>, !llvm.ptr<f32>, !llvm.ptr<f32>) attributes {Kernel, forward_kernel_1}
}


// -----// IR Dump After ConvertMemRefToLLVM (convert-memref-to-llvm) //----- //
module attributes {llvm.data_layout = "", torch.debug_module_name = "L"} {
  llvm.func @malloc(i64) -> !llvm.ptr<i8>
  llvm.mlir.global private constant @__constant_3x3xf32(dense<[[-0.533737481, 0.0726815313, 0.548144102], [0.339588523, -0.212466493, 0.129553705], [0.423136026, 0.46056211, -0.0355117619]]> : tensor<3x3xf32>) : !llvm.array<3 x array<3 x f32>>
  llvm.func @forward(%arg0: !llvm.ptr<f32>) -> !llvm.ptr<f32> {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.mlir.constant(3 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.mlir.constant(3 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %9 = llvm.mlir.constant(3 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.mlir.constant(1 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = llvm.mlir.constant(1 : index) : i64
    %14 = llvm.mlir.constant(3 : index) : i64
    %15 = llvm.mlir.constant(0 : index) : i64
    %16 = builtin.unrealized_conversion_cast %15 : i64 to index
    %17 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    %18 = llvm.mlir.constant(3 : index) : i64
    %19 = llvm.mlir.constant(3 : index) : i64
    %20 = llvm.mlir.constant(1 : index) : i64
    %21 = llvm.mlir.constant(9 : index) : i64
    %22 = llvm.mlir.null : !llvm.ptr<f32>
    %23 = llvm.getelementptr %22[%21] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %24 = llvm.ptrtoint %23 : !llvm.ptr<f32> to i64
    %25 = llvm.mlir.addressof @__constant_3x3xf32 : !llvm.ptr<array<3 x array<3 x f32>>>
    %26 = llvm.getelementptr %25[0, 0, 0] : (!llvm.ptr<array<3 x array<3 x f32>>>) -> !llvm.ptr<f32>
    %27 = llvm.mlir.constant(3735928559 : index) : i64
    %28 = llvm.inttoptr %27 : i64 to !llvm.ptr<f32>
    %29 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %30 = llvm.insertvalue %28, %29[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %31 = llvm.insertvalue %26, %30[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %32 = llvm.mlir.constant(0 : index) : i64
    %33 = llvm.insertvalue %32, %31[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %34 = llvm.insertvalue %18, %33[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %35 = llvm.insertvalue %19, %34[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %36 = llvm.insertvalue %19, %35[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %37 = llvm.insertvalue %20, %36[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %38 = builtin.unrealized_conversion_cast %37 : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> to memref<3x3xf32>
    %39 = builtin.unrealized_conversion_cast %38 : memref<3x3xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %40 = llvm.mlir.constant(3 : index) : i64
    %41 = llvm.mlir.constant(3 : index) : i64
    %42 = llvm.mlir.constant(1 : index) : i64
    %43 = llvm.mlir.constant(9 : index) : i64
    %44 = llvm.mlir.null : !llvm.ptr<f32>
    %45 = llvm.getelementptr %44[%43] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %46 = llvm.ptrtoint %45 : !llvm.ptr<f32> to i64
    %47 = llvm.alloca %46 x f32 {alignment = 64 : i64} : (i64) -> !llvm.ptr<f32>
    %48 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %49 = llvm.insertvalue %47, %48[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %50 = llvm.insertvalue %47, %49[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %51 = llvm.mlir.constant(0 : index) : i64
    %52 = llvm.insertvalue %51, %50[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %53 = llvm.insertvalue %40, %52[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %54 = llvm.insertvalue %41, %53[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %55 = llvm.insertvalue %41, %54[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %56 = llvm.insertvalue %42, %55[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %57 = builtin.unrealized_conversion_cast %56 : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> to memref<3x3xf32>
    %58 = builtin.unrealized_conversion_cast %57 : memref<3x3xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %59 = llvm.extractvalue %39[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %60 = llvm.extractvalue %58[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_0(%59, %60) : (!llvm.ptr<f32>, !llvm.ptr<f32>) -> ()
    %61 = llvm.mlir.constant(3 : index) : i64
    %62 = llvm.mlir.constant(3 : index) : i64
    %63 = llvm.mlir.constant(1 : index) : i64
    %64 = llvm.mlir.constant(9 : index) : i64
    %65 = llvm.mlir.null : !llvm.ptr<f32>
    %66 = llvm.getelementptr %65[%64] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %67 = llvm.ptrtoint %66 : !llvm.ptr<f32> to i64
    %68 = llvm.alloca %67 x f32 : (i64) -> !llvm.ptr<f32>
    %69 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %70 = llvm.insertvalue %68, %69[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %71 = llvm.insertvalue %68, %70[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %72 = llvm.mlir.constant(0 : index) : i64
    %73 = llvm.insertvalue %72, %71[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %74 = llvm.insertvalue %61, %73[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %75 = llvm.insertvalue %62, %74[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %76 = llvm.insertvalue %62, %75[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %77 = llvm.insertvalue %63, %76[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.br ^bb1(%15 : i64)
  ^bb1(%78: i64):  // 2 preds: ^bb0, ^bb5
    %79 = builtin.unrealized_conversion_cast %78 : i64 to index
    %80 = builtin.unrealized_conversion_cast %79 : index to i64
    %81 = llvm.icmp "slt" %80, %14 : i64
    llvm.cond_br %81, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    llvm.br ^bb3(%15 : i64)
  ^bb3(%82: i64):  // 2 preds: ^bb2, ^bb4
    %83 = builtin.unrealized_conversion_cast %82 : i64 to index
    %84 = builtin.unrealized_conversion_cast %83 : index to i64
    %85 = llvm.icmp "slt" %84, %14 : i64
    llvm.cond_br %85, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    %86 = llvm.extractvalue %77[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %87 = llvm.mlir.constant(3 : index) : i64
    %88 = llvm.mul %78, %87  : i64
    %89 = llvm.add %88, %82  : i64
    %90 = llvm.getelementptr %86[%89] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    llvm.store %17, %90 : !llvm.ptr<f32>
    %91 = llvm.add %84, %13  : i64
    %92 = builtin.unrealized_conversion_cast %91 : i64 to index
    llvm.br ^bb3(%91 : i64)
  ^bb5:  // pred: ^bb3
    %93 = llvm.add %80, %13  : i64
    %94 = builtin.unrealized_conversion_cast %93 : i64 to index
    llvm.br ^bb1(%93 : i64)
  ^bb6:  // pred: ^bb1
    %95 = llvm.mlir.constant(3 : index) : i64
    %96 = llvm.mlir.constant(3 : index) : i64
    %97 = llvm.mlir.constant(1 : index) : i64
    %98 = llvm.mlir.constant(9 : index) : i64
    %99 = llvm.mlir.null : !llvm.ptr<f32>
    %100 = llvm.getelementptr %99[%98] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %101 = llvm.ptrtoint %100 : !llvm.ptr<f32> to i64
    %102 = llvm.mlir.constant(64 : index) : i64
    %103 = llvm.add %101, %102  : i64
    %104 = llvm.call @malloc(%103) : (i64) -> !llvm.ptr<i8>
    %105 = llvm.bitcast %104 : !llvm.ptr<i8> to !llvm.ptr<f32>
    %106 = llvm.ptrtoint %105 : !llvm.ptr<f32> to i64
    %107 = llvm.mlir.constant(1 : index) : i64
    %108 = llvm.sub %102, %107  : i64
    %109 = llvm.add %106, %108  : i64
    %110 = llvm.urem %109, %102  : i64
    %111 = llvm.sub %109, %110  : i64
    %112 = llvm.inttoptr %111 : i64 to !llvm.ptr<f32>
    %113 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %114 = llvm.insertvalue %105, %113[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %115 = llvm.insertvalue %112, %114[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %116 = llvm.mlir.constant(0 : index) : i64
    %117 = llvm.insertvalue %116, %115[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %118 = llvm.insertvalue %95, %117[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %119 = llvm.insertvalue %96, %118[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %120 = llvm.insertvalue %96, %119[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %121 = llvm.insertvalue %97, %120[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %122 = builtin.unrealized_conversion_cast %121 : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> to memref<3x3xf32>
    %123 = builtin.unrealized_conversion_cast %122 : memref<3x3xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %124 = llvm.mlir.constant(1 : index) : i64
    %125 = llvm.extractvalue %77[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %126 = llvm.mul %124, %125  : i64
    %127 = llvm.extractvalue %77[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %128 = llvm.mul %126, %127  : i64
    %129 = llvm.mlir.null : !llvm.ptr<f32>
    %130 = llvm.getelementptr %129[1] : (!llvm.ptr<f32>) -> !llvm.ptr<f32>
    %131 = llvm.ptrtoint %130 : !llvm.ptr<f32> to i64
    %132 = llvm.mul %128, %131  : i64
    %133 = llvm.extractvalue %77[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %134 = llvm.extractvalue %77[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %135 = llvm.getelementptr %133[%134] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %136 = llvm.extractvalue %121[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %137 = llvm.extractvalue %121[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %138 = llvm.getelementptr %136[%137] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %139 = llvm.mlir.constant(false) : i1
    "llvm.intr.memcpy"(%138, %135, %132, %139) : (!llvm.ptr<f32>, !llvm.ptr<f32>, i64, i1) -> ()
    %140 = llvm.extractvalue %123[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %141 = llvm.extractvalue %12[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %142 = llvm.extractvalue %58[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_1(%140, %141, %142) : (!llvm.ptr<f32>, !llvm.ptr<f32>, !llvm.ptr<f32>) -> ()
    %143 = llvm.extractvalue %123[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.return %143 : !llvm.ptr<f32>
  }
  llvm.func @forward_kernel_0(!llvm.ptr<f32>, !llvm.ptr<f32>) attributes {Kernel, forward_kernel_0}
  llvm.func @forward_kernel_1(!llvm.ptr<f32>, !llvm.ptr<f32>, !llvm.ptr<f32>) attributes {Kernel, forward_kernel_1}
}


// -----// IR Dump After ReconcileUnrealizedCasts (reconcile-unrealized-casts) //----- //
module attributes {llvm.data_layout = "", torch.debug_module_name = "L"} {
  llvm.func @malloc(i64) -> !llvm.ptr<i8>
  llvm.mlir.global private constant @__constant_3x3xf32(dense<[[-0.533737481, 0.0726815313, 0.548144102], [0.339588523, -0.212466493, 0.129553705], [0.423136026, 0.46056211, -0.0355117619]]> : tensor<3x3xf32>) : !llvm.array<3 x array<3 x f32>>
  llvm.func @forward(%arg0: !llvm.ptr<f32>) -> !llvm.ptr<f32> {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.mlir.constant(3 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.mlir.constant(3 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %9 = llvm.mlir.constant(3 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.mlir.constant(1 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = llvm.mlir.constant(1 : index) : i64
    %14 = llvm.mlir.constant(3 : index) : i64
    %15 = llvm.mlir.constant(0 : index) : i64
    %16 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    %17 = llvm.mlir.constant(3 : index) : i64
    %18 = llvm.mlir.constant(3 : index) : i64
    %19 = llvm.mlir.constant(1 : index) : i64
    %20 = llvm.mlir.constant(9 : index) : i64
    %21 = llvm.mlir.null : !llvm.ptr<f32>
    %22 = llvm.getelementptr %21[9] : (!llvm.ptr<f32>) -> !llvm.ptr<f32>
    %23 = llvm.ptrtoint %22 : !llvm.ptr<f32> to i64
    %24 = llvm.mlir.addressof @__constant_3x3xf32 : !llvm.ptr<array<3 x array<3 x f32>>>
    %25 = llvm.getelementptr %24[0, 0, 0] : (!llvm.ptr<array<3 x array<3 x f32>>>) -> !llvm.ptr<f32>
    %26 = llvm.mlir.constant(3735928559 : index) : i64
    %27 = llvm.inttoptr %26 : i64 to !llvm.ptr<f32>
    %28 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %29 = llvm.insertvalue %27, %28[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %30 = llvm.insertvalue %25, %29[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %31 = llvm.mlir.constant(0 : index) : i64
    %32 = llvm.insertvalue %31, %30[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %33 = llvm.insertvalue %17, %32[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %34 = llvm.insertvalue %18, %33[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %35 = llvm.insertvalue %18, %34[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %36 = llvm.insertvalue %19, %35[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %37 = llvm.mlir.constant(3 : index) : i64
    %38 = llvm.mlir.constant(3 : index) : i64
    %39 = llvm.mlir.constant(1 : index) : i64
    %40 = llvm.mlir.constant(9 : index) : i64
    %41 = llvm.mlir.null : !llvm.ptr<f32>
    %42 = llvm.getelementptr %41[9] : (!llvm.ptr<f32>) -> !llvm.ptr<f32>
    %43 = llvm.ptrtoint %42 : !llvm.ptr<f32> to i64
    %44 = llvm.alloca %43 x f32 {alignment = 64 : i64} : (i64) -> !llvm.ptr<f32>
    %45 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %46 = llvm.insertvalue %44, %45[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %47 = llvm.insertvalue %44, %46[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %48 = llvm.mlir.constant(0 : index) : i64
    %49 = llvm.insertvalue %48, %47[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %50 = llvm.insertvalue %37, %49[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %51 = llvm.insertvalue %38, %50[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %52 = llvm.insertvalue %38, %51[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %53 = llvm.insertvalue %39, %52[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %54 = llvm.extractvalue %36[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %55 = llvm.extractvalue %53[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_0(%54, %55) : (!llvm.ptr<f32>, !llvm.ptr<f32>) -> ()
    %56 = llvm.mlir.constant(3 : index) : i64
    %57 = llvm.mlir.constant(3 : index) : i64
    %58 = llvm.mlir.constant(1 : index) : i64
    %59 = llvm.mlir.constant(9 : index) : i64
    %60 = llvm.mlir.null : !llvm.ptr<f32>
    %61 = llvm.getelementptr %60[9] : (!llvm.ptr<f32>) -> !llvm.ptr<f32>
    %62 = llvm.ptrtoint %61 : !llvm.ptr<f32> to i64
    %63 = llvm.alloca %62 x f32 : (i64) -> !llvm.ptr<f32>
    %64 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %65 = llvm.insertvalue %63, %64[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %66 = llvm.insertvalue %63, %65[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %67 = llvm.mlir.constant(0 : index) : i64
    %68 = llvm.insertvalue %67, %66[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %69 = llvm.insertvalue %56, %68[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %70 = llvm.insertvalue %57, %69[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %71 = llvm.insertvalue %57, %70[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %72 = llvm.insertvalue %58, %71[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.br ^bb1(%15 : i64)
  ^bb1(%73: i64):  // 2 preds: ^bb0, ^bb5
    %74 = llvm.icmp "slt" %73, %14 : i64
    llvm.cond_br %74, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    llvm.br ^bb3(%15 : i64)
  ^bb3(%75: i64):  // 2 preds: ^bb2, ^bb4
    %76 = llvm.icmp "slt" %75, %14 : i64
    llvm.cond_br %76, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    %77 = llvm.mlir.constant(3 : index) : i64
    %78 = llvm.mul %73, %77  : i64
    %79 = llvm.add %78, %75  : i64
    %80 = llvm.getelementptr %63[%79] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    llvm.store %16, %80 : !llvm.ptr<f32>
    %81 = llvm.add %75, %13  : i64
    llvm.br ^bb3(%81 : i64)
  ^bb5:  // pred: ^bb3
    %82 = llvm.add %73, %13  : i64
    llvm.br ^bb1(%82 : i64)
  ^bb6:  // pred: ^bb1
    %83 = llvm.mlir.constant(3 : index) : i64
    %84 = llvm.mlir.constant(3 : index) : i64
    %85 = llvm.mlir.constant(1 : index) : i64
    %86 = llvm.mlir.constant(9 : index) : i64
    %87 = llvm.mlir.null : !llvm.ptr<f32>
    %88 = llvm.getelementptr %87[9] : (!llvm.ptr<f32>) -> !llvm.ptr<f32>
    %89 = llvm.ptrtoint %88 : !llvm.ptr<f32> to i64
    %90 = llvm.mlir.constant(64 : index) : i64
    %91 = llvm.add %89, %90  : i64
    %92 = llvm.call @malloc(%91) : (i64) -> !llvm.ptr<i8>
    %93 = llvm.bitcast %92 : !llvm.ptr<i8> to !llvm.ptr<f32>
    %94 = llvm.ptrtoint %93 : !llvm.ptr<f32> to i64
    %95 = llvm.mlir.constant(1 : index) : i64
    %96 = llvm.sub %90, %95  : i64
    %97 = llvm.add %94, %96  : i64
    %98 = llvm.urem %97, %90  : i64
    %99 = llvm.sub %97, %98  : i64
    %100 = llvm.inttoptr %99 : i64 to !llvm.ptr<f32>
    %101 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %102 = llvm.insertvalue %93, %101[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %103 = llvm.insertvalue %100, %102[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %104 = llvm.mlir.constant(0 : index) : i64
    %105 = llvm.insertvalue %104, %103[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %106 = llvm.insertvalue %83, %105[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %107 = llvm.insertvalue %84, %106[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %108 = llvm.insertvalue %84, %107[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %109 = llvm.insertvalue %85, %108[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %110 = llvm.mlir.constant(1 : index) : i64
    %111 = llvm.mul %110, %56  : i64
    %112 = llvm.mul %111, %57  : i64
    %113 = llvm.mlir.null : !llvm.ptr<f32>
    %114 = llvm.getelementptr %113[1] : (!llvm.ptr<f32>) -> !llvm.ptr<f32>
    %115 = llvm.ptrtoint %114 : !llvm.ptr<f32> to i64
    %116 = llvm.mul %112, %115  : i64
    %117 = llvm.getelementptr %63[%67] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %118 = llvm.getelementptr %100[%104] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %119 = llvm.mlir.constant(false) : i1
    "llvm.intr.memcpy"(%118, %117, %116, %119) : (!llvm.ptr<f32>, !llvm.ptr<f32>, i64, i1) -> ()
    %120 = llvm.extractvalue %109[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %121 = llvm.extractvalue %53[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_1(%120, %arg0, %121) : (!llvm.ptr<f32>, !llvm.ptr<f32>, !llvm.ptr<f32>) -> ()
    %122 = llvm.extractvalue %109[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.return %122 : !llvm.ptr<f32>
  }
  llvm.func @forward_kernel_0(!llvm.ptr<f32>, !llvm.ptr<f32>) attributes {Kernel, forward_kernel_0}
  llvm.func @forward_kernel_1(!llvm.ptr<f32>, !llvm.ptr<f32>, !llvm.ptr<f32>) attributes {Kernel, forward_kernel_1}
}


