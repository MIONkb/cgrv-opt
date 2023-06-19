// -----// IR Dump After PromoteBuffersToStack (promote-buffers-to-stack) //----- //
func.func @forward(%arg0: memref<4x3xf32>) -> memref<4x3xf32> {
  %cst = arith.constant 0.000000e+00 : f32
  %0 = memref.get_global @__constant_3x3xf32 : memref<3x3xf32>
  %1 = memref.alloca() : memref<3x3xf32>
  FDRA.KernelCall @forward_kernel_0(%0, %1) : (memref<3x3xf32>, memref<3x3xf32>) -> ()
  %2 = memref.alloca() : memref<4x3xf32>
  FDRA.KernelCall @forward_kernel_1(%2) : (memref<4x3xf32>) -> ()
  %3 = memref.alloc() {alignment = 64 : i64} : memref<4x3xf32>
  memref.copy %2, %3 : memref<4x3xf32> to memref<4x3xf32>
  FDRA.KernelCall @forward_kernel_2(%arg0, %1, %3) : (memref<4x3xf32>, memref<3x3xf32>, memref<4x3xf32>) -> ()
  return %3 : memref<4x3xf32>
}

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

// -----// IR Dump After PromoteBuffersToStack (promote-buffers-to-stack) //----- //
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

// -----// IR Dump After ArithmeticExpandOps (arith-expand) //----- //
module attributes {torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_3x3xf32 : memref<3x3xf32> = dense<[[0.569071651, -0.473457456, 0.519209445], [-0.231614307, -0.085622929, 5.772530e-01], [-0.09853556, -0.0144386981, 0.368846387]]>
  func.func @forward(%arg0: memref<4x3xf32>) -> memref<4x3xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = memref.get_global @__constant_3x3xf32 : memref<3x3xf32>
    %1 = memref.alloca() : memref<3x3xf32>
    FDRA.KernelCall @forward_kernel_0(%0, %1) : (memref<3x3xf32>, memref<3x3xf32>) -> ()
    %2 = memref.alloca() : memref<4x3xf32>
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


// -----// IR Dump After ExpandOps (memref-expand) //----- //
module attributes {torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_3x3xf32 : memref<3x3xf32> = dense<[[0.569071651, -0.473457456, 0.519209445], [-0.231614307, -0.085622929, 5.772530e-01], [-0.09853556, -0.0144386981, 0.368846387]]>
  func.func @forward(%arg0: memref<4x3xf32>) -> memref<4x3xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = memref.get_global @__constant_3x3xf32 : memref<3x3xf32>
    %1 = memref.alloca() : memref<3x3xf32>
    FDRA.KernelCall @forward_kernel_0(%0, %1) : (memref<3x3xf32>, memref<3x3xf32>) -> ()
    %2 = memref.alloca() : memref<4x3xf32>
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


// -----// IR Dump After NormalizeMemRefs (normalize-memrefs) //----- //
module attributes {torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_3x3xf32 : memref<3x3xf32> = dense<[[0.569071651, -0.473457456, 0.519209445], [-0.231614307, -0.085622929, 5.772530e-01], [-0.09853556, -0.0144386981, 0.368846387]]>
  func.func @forward(%arg0: memref<4x3xf32>) -> memref<4x3xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = memref.get_global @__constant_3x3xf32 : memref<3x3xf32>
    %1 = memref.alloca() : memref<3x3xf32>
    FDRA.KernelCall @forward_kernel_0(%0, %1) : (memref<3x3xf32>, memref<3x3xf32>) -> ()
    %2 = memref.alloca() : memref<4x3xf32>
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


// -----// IR Dump After SimplifyAffineStructures (affine-simplify-structures) //----- //
func.func @forward(%arg0: memref<4x3xf32>) -> memref<4x3xf32> {
  %cst = arith.constant 0.000000e+00 : f32
  %0 = memref.get_global @__constant_3x3xf32 : memref<3x3xf32>
  %1 = memref.alloca() : memref<3x3xf32>
  FDRA.KernelCall @forward_kernel_0(%0, %1) : (memref<3x3xf32>, memref<3x3xf32>) -> ()
  %2 = memref.alloca() : memref<4x3xf32>
  FDRA.KernelCall @forward_kernel_1(%2) : (memref<4x3xf32>) -> ()
  %3 = memref.alloc() {alignment = 64 : i64} : memref<4x3xf32>
  memref.copy %2, %3 : memref<4x3xf32> to memref<4x3xf32>
  FDRA.KernelCall @forward_kernel_2(%arg0, %1, %3) : (memref<4x3xf32>, memref<3x3xf32>, memref<4x3xf32>) -> ()
  return %3 : memref<4x3xf32>
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

// -----// IR Dump After SimplifyAffineStructures (affine-simplify-structures) //----- //
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

// -----// IR Dump After ConvertAffineToStandard (lower-affine) //----- //
module attributes {torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_3x3xf32 : memref<3x3xf32> = dense<[[0.569071651, -0.473457456, 0.519209445], [-0.231614307, -0.085622929, 5.772530e-01], [-0.09853556, -0.0144386981, 0.368846387]]>
  func.func @forward(%arg0: memref<4x3xf32>) -> memref<4x3xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = memref.get_global @__constant_3x3xf32 : memref<3x3xf32>
    %1 = memref.alloca() : memref<3x3xf32>
    FDRA.KernelCall @forward_kernel_0(%0, %1) : (memref<3x3xf32>, memref<3x3xf32>) -> ()
    %2 = memref.alloca() : memref<4x3xf32>
    FDRA.KernelCall @forward_kernel_1(%2) : (memref<4x3xf32>) -> ()
    %3 = memref.alloc() {alignment = 64 : i64} : memref<4x3xf32>
    memref.copy %2, %3 : memref<4x3xf32> to memref<4x3xf32>
    FDRA.KernelCall @forward_kernel_2(%arg0, %1, %3) : (memref<4x3xf32>, memref<3x3xf32>, memref<4x3xf32>) -> ()
    return %3 : memref<4x3xf32>
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
  func.func @forward_kernel_1(%arg0: memref<4x3xf32>) attributes {Kernel, forward_kernel_1} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %c1 = arith.constant 1 : index
    scf.for %arg1 = %c0 to %c4 step %c1 {
      %c0_0 = arith.constant 0 : index
      %c3 = arith.constant 3 : index
      %c1_1 = arith.constant 1 : index
      scf.for %arg2 = %c0_0 to %c3 step %c1_1 {
        memref.store %cst, %arg0[%arg1, %arg2] : memref<4x3xf32>
      }
    }
    return
  }
  func.func @forward_kernel_2(%arg0: memref<4x3xf32>, %arg1: memref<3x3xf32>, %arg2: memref<4x3xf32>) attributes {Kernel, forward_kernel_2} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %c1 = arith.constant 1 : index
    scf.for %arg3 = %c0 to %c4 step %c1 {
      %c0_0 = arith.constant 0 : index
      %c3 = arith.constant 3 : index
      %c1_1 = arith.constant 1 : index
      scf.for %arg4 = %c0_0 to %c3 step %c1_1 {
        %c0_2 = arith.constant 0 : index
        %c3_3 = arith.constant 3 : index
        %c1_4 = arith.constant 1 : index
        scf.for %arg5 = %c0_2 to %c3_3 step %c1_4 {
          %0 = memref.load %arg0[%arg3, %arg5] : memref<4x3xf32>
          %1 = memref.load %arg1[%arg5, %arg4] : memref<3x3xf32>
          %2 = memref.load %arg2[%arg3, %arg4] : memref<4x3xf32>
          %3 = arith.mulf %0, %1 : f32
          %4 = arith.addf %2, %3 : f32
          memref.store %4, %arg2[%arg3, %arg4] : memref<4x3xf32>
        }
      }
    }
    return
  }
}


// -----// IR Dump After SCFForLoopCanonicalization (scf-for-loop-canonicalization) //----- //
module attributes {torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_3x3xf32 : memref<3x3xf32> = dense<[[0.569071651, -0.473457456, 0.519209445], [-0.231614307, -0.085622929, 5.772530e-01], [-0.09853556, -0.0144386981, 0.368846387]]>
  func.func @forward(%arg0: memref<4x3xf32>) -> memref<4x3xf32> {
    %0 = memref.get_global @__constant_3x3xf32 : memref<3x3xf32>
    %1 = memref.alloca() : memref<3x3xf32>
    FDRA.KernelCall @forward_kernel_0(%0, %1) : (memref<3x3xf32>, memref<3x3xf32>) -> ()
    %2 = memref.alloca() : memref<4x3xf32>
    FDRA.KernelCall @forward_kernel_1(%2) : (memref<4x3xf32>) -> ()
    %3 = memref.alloc() {alignment = 64 : i64} : memref<4x3xf32>
    memref.copy %2, %3 : memref<4x3xf32> to memref<4x3xf32>
    FDRA.KernelCall @forward_kernel_2(%arg0, %1, %3) : (memref<4x3xf32>, memref<3x3xf32>, memref<4x3xf32>) -> ()
    return %3 : memref<4x3xf32>
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
  func.func @forward_kernel_1(%arg0: memref<4x3xf32>) attributes {Kernel, forward_kernel_1} {
    %c3 = arith.constant 3 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    scf.for %arg1 = %c0 to %c4 step %c1 {
      scf.for %arg2 = %c0 to %c3 step %c1 {
        memref.store %cst, %arg0[%arg1, %arg2] : memref<4x3xf32>
      }
    }
    return
  }
  func.func @forward_kernel_2(%arg0: memref<4x3xf32>, %arg1: memref<3x3xf32>, %arg2: memref<4x3xf32>) attributes {Kernel, forward_kernel_2} {
    %c3 = arith.constant 3 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c0 = arith.constant 0 : index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    scf.for %arg3 = %c0 to %c4 step %c1 {
      scf.for %arg4 = %c0 to %c3 step %c1 {
        scf.for %arg5 = %c0 to %c3 step %c1 {
          %0 = memref.load %arg0[%arg3, %arg5] : memref<4x3xf32>
          %1 = memref.load %arg1[%arg5, %arg4] : memref<3x3xf32>
          %2 = memref.load %arg2[%arg3, %arg4] : memref<4x3xf32>
          %3 = arith.mulf %0, %1 : f32
          %4 = arith.addf %2, %3 : f32
          memref.store %4, %arg2[%arg3, %arg4] : memref<4x3xf32>
        }
      }
    }
    return
  }
}


// -----// IR Dump After SCFToControlFlow (convert-scf-to-cf) //----- //
module attributes {torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_3x3xf32 : memref<3x3xf32> = dense<[[0.569071651, -0.473457456, 0.519209445], [-0.231614307, -0.085622929, 5.772530e-01], [-0.09853556, -0.0144386981, 0.368846387]]>
  func.func @forward(%arg0: memref<4x3xf32>) -> memref<4x3xf32> {
    %0 = memref.get_global @__constant_3x3xf32 : memref<3x3xf32>
    %1 = memref.alloca() : memref<3x3xf32>
    FDRA.KernelCall @forward_kernel_0(%0, %1) : (memref<3x3xf32>, memref<3x3xf32>) -> ()
    %2 = memref.alloca() : memref<4x3xf32>
    FDRA.KernelCall @forward_kernel_1(%2) : (memref<4x3xf32>) -> ()
    %3 = memref.alloc() {alignment = 64 : i64} : memref<4x3xf32>
    memref.copy %2, %3 : memref<4x3xf32> to memref<4x3xf32>
    FDRA.KernelCall @forward_kernel_2(%arg0, %1, %3) : (memref<4x3xf32>, memref<3x3xf32>, memref<4x3xf32>) -> ()
    return %3 : memref<4x3xf32>
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
  func.func @forward_kernel_1(%arg0: memref<4x3xf32>) attributes {Kernel, forward_kernel_1} {
    %c3 = arith.constant 3 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%c0 : index)
  ^bb2(%0: index):  // 2 preds: ^bb1, ^bb6
    %1 = arith.cmpi slt, %0, %c4 : index
    cf.cond_br %1, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    cf.br ^bb4(%c0 : index)
  ^bb4(%2: index):  // 2 preds: ^bb3, ^bb5
    %3 = arith.cmpi slt, %2, %c3 : index
    cf.cond_br %3, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    memref.store %cst, %arg0[%0, %2] : memref<4x3xf32>
    %4 = arith.addi %2, %c1 : index
    cf.br ^bb4(%4 : index)
  ^bb6:  // pred: ^bb4
    %5 = arith.addi %0, %c1 : index
    cf.br ^bb2(%5 : index)
  ^bb7:  // pred: ^bb2
    return
  }
  func.func @forward_kernel_2(%arg0: memref<4x3xf32>, %arg1: memref<3x3xf32>, %arg2: memref<4x3xf32>) attributes {Kernel, forward_kernel_2} {
    %c3 = arith.constant 3 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c0 = arith.constant 0 : index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%c0 : index)
  ^bb2(%0: index):  // 2 preds: ^bb1, ^bb9
    %1 = arith.cmpi slt, %0, %c4 : index
    cf.cond_br %1, ^bb3, ^bb10
  ^bb3:  // pred: ^bb2
    cf.br ^bb4(%c0 : index)
  ^bb4(%2: index):  // 2 preds: ^bb3, ^bb8
    %3 = arith.cmpi slt, %2, %c3 : index
    cf.cond_br %3, ^bb5, ^bb9
  ^bb5:  // pred: ^bb4
    cf.br ^bb6(%c0 : index)
  ^bb6(%4: index):  // 2 preds: ^bb5, ^bb7
    %5 = arith.cmpi slt, %4, %c3 : index
    cf.cond_br %5, ^bb7, ^bb8
  ^bb7:  // pred: ^bb6
    %6 = memref.load %arg0[%0, %4] : memref<4x3xf32>
    %7 = memref.load %arg1[%4, %2] : memref<3x3xf32>
    %8 = memref.load %arg2[%0, %2] : memref<4x3xf32>
    %9 = arith.mulf %6, %7 : f32
    %10 = arith.addf %8, %9 : f32
    memref.store %10, %arg2[%0, %2] : memref<4x3xf32>
    %11 = arith.addi %4, %c1 : index
    cf.br ^bb6(%11 : index)
  ^bb8:  // pred: ^bb6
    %12 = arith.addi %2, %c1 : index
    cf.br ^bb4(%12 : index)
  ^bb9:  // pred: ^bb4
    %13 = arith.addi %0, %c1 : index
    cf.br ^bb2(%13 : index)
  ^bb10:  // pred: ^bb2
    return
  }
}


// -----// IR Dump After ConvertMathToLLVM (convert-math-to-llvm) //----- //
module attributes {torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_3x3xf32 : memref<3x3xf32> = dense<[[0.569071651, -0.473457456, 0.519209445], [-0.231614307, -0.085622929, 5.772530e-01], [-0.09853556, -0.0144386981, 0.368846387]]>
  func.func @forward(%arg0: memref<4x3xf32>) -> memref<4x3xf32> {
    %0 = memref.get_global @__constant_3x3xf32 : memref<3x3xf32>
    %1 = memref.alloca() : memref<3x3xf32>
    FDRA.KernelCall @forward_kernel_0(%0, %1) : (memref<3x3xf32>, memref<3x3xf32>) -> ()
    %2 = memref.alloca() : memref<4x3xf32>
    FDRA.KernelCall @forward_kernel_1(%2) : (memref<4x3xf32>) -> ()
    %3 = memref.alloc() {alignment = 64 : i64} : memref<4x3xf32>
    memref.copy %2, %3 : memref<4x3xf32> to memref<4x3xf32>
    FDRA.KernelCall @forward_kernel_2(%arg0, %1, %3) : (memref<4x3xf32>, memref<3x3xf32>, memref<4x3xf32>) -> ()
    return %3 : memref<4x3xf32>
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
  func.func @forward_kernel_1(%arg0: memref<4x3xf32>) attributes {Kernel, forward_kernel_1} {
    %c3 = arith.constant 3 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%c0 : index)
  ^bb2(%0: index):  // 2 preds: ^bb1, ^bb6
    %1 = arith.cmpi slt, %0, %c4 : index
    cf.cond_br %1, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    cf.br ^bb4(%c0 : index)
  ^bb4(%2: index):  // 2 preds: ^bb3, ^bb5
    %3 = arith.cmpi slt, %2, %c3 : index
    cf.cond_br %3, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    memref.store %cst, %arg0[%0, %2] : memref<4x3xf32>
    %4 = arith.addi %2, %c1 : index
    cf.br ^bb4(%4 : index)
  ^bb6:  // pred: ^bb4
    %5 = arith.addi %0, %c1 : index
    cf.br ^bb2(%5 : index)
  ^bb7:  // pred: ^bb2
    return
  }
  func.func @forward_kernel_2(%arg0: memref<4x3xf32>, %arg1: memref<3x3xf32>, %arg2: memref<4x3xf32>) attributes {Kernel, forward_kernel_2} {
    %c3 = arith.constant 3 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c0 = arith.constant 0 : index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%c0 : index)
  ^bb2(%0: index):  // 2 preds: ^bb1, ^bb9
    %1 = arith.cmpi slt, %0, %c4 : index
    cf.cond_br %1, ^bb3, ^bb10
  ^bb3:  // pred: ^bb2
    cf.br ^bb4(%c0 : index)
  ^bb4(%2: index):  // 2 preds: ^bb3, ^bb8
    %3 = arith.cmpi slt, %2, %c3 : index
    cf.cond_br %3, ^bb5, ^bb9
  ^bb5:  // pred: ^bb4
    cf.br ^bb6(%c0 : index)
  ^bb6(%4: index):  // 2 preds: ^bb5, ^bb7
    %5 = arith.cmpi slt, %4, %c3 : index
    cf.cond_br %5, ^bb7, ^bb8
  ^bb7:  // pred: ^bb6
    %6 = memref.load %arg0[%0, %4] : memref<4x3xf32>
    %7 = memref.load %arg1[%4, %2] : memref<3x3xf32>
    %8 = memref.load %arg2[%0, %2] : memref<4x3xf32>
    %9 = arith.mulf %6, %7 : f32
    %10 = arith.addf %8, %9 : f32
    memref.store %10, %arg2[%0, %2] : memref<4x3xf32>
    %11 = arith.addi %4, %c1 : index
    cf.br ^bb6(%11 : index)
  ^bb8:  // pred: ^bb6
    %12 = arith.addi %2, %c1 : index
    cf.br ^bb4(%12 : index)
  ^bb9:  // pred: ^bb4
    %13 = arith.addi %0, %c1 : index
    cf.br ^bb2(%13 : index)
  ^bb10:  // pred: ^bb2
    return
  }
}


// -----// IR Dump After ConvertMathToLibm (convert-math-to-libm) //----- //
module attributes {torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_3x3xf32 : memref<3x3xf32> = dense<[[0.569071651, -0.473457456, 0.519209445], [-0.231614307, -0.085622929, 5.772530e-01], [-0.09853556, -0.0144386981, 0.368846387]]>
  func.func @forward(%arg0: memref<4x3xf32>) -> memref<4x3xf32> {
    %0 = memref.get_global @__constant_3x3xf32 : memref<3x3xf32>
    %1 = memref.alloca() : memref<3x3xf32>
    FDRA.KernelCall @forward_kernel_0(%0, %1) : (memref<3x3xf32>, memref<3x3xf32>) -> ()
    %2 = memref.alloca() : memref<4x3xf32>
    FDRA.KernelCall @forward_kernel_1(%2) : (memref<4x3xf32>) -> ()
    %3 = memref.alloc() {alignment = 64 : i64} : memref<4x3xf32>
    memref.copy %2, %3 : memref<4x3xf32> to memref<4x3xf32>
    FDRA.KernelCall @forward_kernel_2(%arg0, %1, %3) : (memref<4x3xf32>, memref<3x3xf32>, memref<4x3xf32>) -> ()
    return %3 : memref<4x3xf32>
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
  func.func @forward_kernel_1(%arg0: memref<4x3xf32>) attributes {Kernel, forward_kernel_1} {
    %c3 = arith.constant 3 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%c0 : index)
  ^bb2(%0: index):  // 2 preds: ^bb1, ^bb6
    %1 = arith.cmpi slt, %0, %c4 : index
    cf.cond_br %1, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    cf.br ^bb4(%c0 : index)
  ^bb4(%2: index):  // 2 preds: ^bb3, ^bb5
    %3 = arith.cmpi slt, %2, %c3 : index
    cf.cond_br %3, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    memref.store %cst, %arg0[%0, %2] : memref<4x3xf32>
    %4 = arith.addi %2, %c1 : index
    cf.br ^bb4(%4 : index)
  ^bb6:  // pred: ^bb4
    %5 = arith.addi %0, %c1 : index
    cf.br ^bb2(%5 : index)
  ^bb7:  // pred: ^bb2
    return
  }
  func.func @forward_kernel_2(%arg0: memref<4x3xf32>, %arg1: memref<3x3xf32>, %arg2: memref<4x3xf32>) attributes {Kernel, forward_kernel_2} {
    %c3 = arith.constant 3 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c0 = arith.constant 0 : index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%c0 : index)
  ^bb2(%0: index):  // 2 preds: ^bb1, ^bb9
    %1 = arith.cmpi slt, %0, %c4 : index
    cf.cond_br %1, ^bb3, ^bb10
  ^bb3:  // pred: ^bb2
    cf.br ^bb4(%c0 : index)
  ^bb4(%2: index):  // 2 preds: ^bb3, ^bb8
    %3 = arith.cmpi slt, %2, %c3 : index
    cf.cond_br %3, ^bb5, ^bb9
  ^bb5:  // pred: ^bb4
    cf.br ^bb6(%c0 : index)
  ^bb6(%4: index):  // 2 preds: ^bb5, ^bb7
    %5 = arith.cmpi slt, %4, %c3 : index
    cf.cond_br %5, ^bb7, ^bb8
  ^bb7:  // pred: ^bb6
    %6 = memref.load %arg0[%0, %4] : memref<4x3xf32>
    %7 = memref.load %arg1[%4, %2] : memref<3x3xf32>
    %8 = memref.load %arg2[%0, %2] : memref<4x3xf32>
    %9 = arith.mulf %6, %7 : f32
    %10 = arith.addf %8, %9 : f32
    memref.store %10, %arg2[%0, %2] : memref<4x3xf32>
    %11 = arith.addi %4, %c1 : index
    cf.br ^bb6(%11 : index)
  ^bb8:  // pred: ^bb6
    %12 = arith.addi %2, %c1 : index
    cf.br ^bb4(%12 : index)
  ^bb9:  // pred: ^bb4
    %13 = arith.addi %0, %c1 : index
    cf.br ^bb2(%13 : index)
  ^bb10:  // pred: ^bb2
    return
  }
}


// -----// IR Dump After ConvertArithmeticToLLVM (convert-arith-to-llvm) //----- //
module attributes {torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_3x3xf32 : memref<3x3xf32> = dense<[[0.569071651, -0.473457456, 0.519209445], [-0.231614307, -0.085622929, 5.772530e-01], [-0.09853556, -0.0144386981, 0.368846387]]>
  func.func @forward(%arg0: memref<4x3xf32>) -> memref<4x3xf32> {
    %0 = memref.get_global @__constant_3x3xf32 : memref<3x3xf32>
    %1 = memref.alloca() : memref<3x3xf32>
    FDRA.KernelCall @forward_kernel_0(%0, %1) : (memref<3x3xf32>, memref<3x3xf32>) -> ()
    %2 = memref.alloca() : memref<4x3xf32>
    FDRA.KernelCall @forward_kernel_1(%2) : (memref<4x3xf32>) -> ()
    %3 = memref.alloc() {alignment = 64 : i64} : memref<4x3xf32>
    memref.copy %2, %3 : memref<4x3xf32> to memref<4x3xf32>
    FDRA.KernelCall @forward_kernel_2(%arg0, %1, %3) : (memref<4x3xf32>, memref<3x3xf32>, memref<4x3xf32>) -> ()
    return %3 : memref<4x3xf32>
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
  func.func @forward_kernel_1(%arg0: memref<4x3xf32>) attributes {Kernel, forward_kernel_1} {
    %0 = llvm.mlir.constant(3 : index) : i64
    %1 = llvm.mlir.constant(1 : index) : i64
    %2 = llvm.mlir.constant(4 : index) : i64
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = builtin.unrealized_conversion_cast %3 : i64 to index
    %5 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%4 : index)
  ^bb2(%6: index):  // 2 preds: ^bb1, ^bb6
    %7 = builtin.unrealized_conversion_cast %6 : index to i64
    %8 = llvm.icmp "slt" %7, %2 : i64
    cf.cond_br %8, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    cf.br ^bb4(%4 : index)
  ^bb4(%9: index):  // 2 preds: ^bb3, ^bb5
    %10 = builtin.unrealized_conversion_cast %9 : index to i64
    %11 = llvm.icmp "slt" %10, %0 : i64
    cf.cond_br %11, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    memref.store %5, %arg0[%6, %9] : memref<4x3xf32>
    %12 = llvm.add %10, %1  : i64
    %13 = builtin.unrealized_conversion_cast %12 : i64 to index
    cf.br ^bb4(%13 : index)
  ^bb6:  // pred: ^bb4
    %14 = llvm.add %7, %1  : i64
    %15 = builtin.unrealized_conversion_cast %14 : i64 to index
    cf.br ^bb2(%15 : index)
  ^bb7:  // pred: ^bb2
    return
  }
  func.func @forward_kernel_2(%arg0: memref<4x3xf32>, %arg1: memref<3x3xf32>, %arg2: memref<4x3xf32>) attributes {Kernel, forward_kernel_2} {
    %0 = llvm.mlir.constant(3 : index) : i64
    %1 = llvm.mlir.constant(1 : index) : i64
    %2 = llvm.mlir.constant(4 : index) : i64
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = builtin.unrealized_conversion_cast %3 : i64 to index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%4 : index)
  ^bb2(%5: index):  // 2 preds: ^bb1, ^bb9
    %6 = builtin.unrealized_conversion_cast %5 : index to i64
    %7 = llvm.icmp "slt" %6, %2 : i64
    cf.cond_br %7, ^bb3, ^bb10
  ^bb3:  // pred: ^bb2
    cf.br ^bb4(%4 : index)
  ^bb4(%8: index):  // 2 preds: ^bb3, ^bb8
    %9 = builtin.unrealized_conversion_cast %8 : index to i64
    %10 = llvm.icmp "slt" %9, %0 : i64
    cf.cond_br %10, ^bb5, ^bb9
  ^bb5:  // pred: ^bb4
    cf.br ^bb6(%4 : index)
  ^bb6(%11: index):  // 2 preds: ^bb5, ^bb7
    %12 = builtin.unrealized_conversion_cast %11 : index to i64
    %13 = llvm.icmp "slt" %12, %0 : i64
    cf.cond_br %13, ^bb7, ^bb8
  ^bb7:  // pred: ^bb6
    %14 = memref.load %arg0[%5, %11] : memref<4x3xf32>
    %15 = memref.load %arg1[%11, %8] : memref<3x3xf32>
    %16 = memref.load %arg2[%5, %8] : memref<4x3xf32>
    %17 = llvm.fmul %14, %15  : f32
    %18 = llvm.fadd %16, %17  : f32
    memref.store %18, %arg2[%5, %8] : memref<4x3xf32>
    %19 = llvm.add %12, %1  : i64
    %20 = builtin.unrealized_conversion_cast %19 : i64 to index
    cf.br ^bb6(%20 : index)
  ^bb8:  // pred: ^bb6
    %21 = llvm.add %9, %1  : i64
    %22 = builtin.unrealized_conversion_cast %21 : i64 to index
    cf.br ^bb4(%22 : index)
  ^bb9:  // pred: ^bb4
    %23 = llvm.add %6, %1  : i64
    %24 = builtin.unrealized_conversion_cast %23 : i64 to index
    cf.br ^bb2(%24 : index)
  ^bb10:  // pred: ^bb2
    return
  }
}


[debug] not a kernel func
// -----// IR Dump After ConvertKernelCallToLLVM (fdra-convert-kernelcall-to-llvm) //----- //
module attributes {torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_3x3xf32 : memref<3x3xf32> = dense<[[0.569071651, -0.473457456, 0.519209445], [-0.231614307, -0.085622929, 5.772530e-01], [-0.09853556, -0.0144386981, 0.368846387]]>
  llvm.func @forward(%arg0: !llvm.ptr<f32>) -> !llvm.ptr<f32> {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.mlir.constant(4 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.mlir.constant(3 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %9 = llvm.mlir.constant(3 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.mlir.constant(1 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = memref.get_global @__constant_3x3xf32 : memref<3x3xf32>
    %14 = builtin.unrealized_conversion_cast %13 : memref<3x3xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %15 = memref.alloca() : memref<3x3xf32>
    %16 = builtin.unrealized_conversion_cast %15 : memref<3x3xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %17 = llvm.extractvalue %14[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %18 = llvm.extractvalue %16[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_0(%17, %18) : (!llvm.ptr<f32>, !llvm.ptr<f32>) -> ()
    %19 = memref.alloca() : memref<4x3xf32>
    %20 = builtin.unrealized_conversion_cast %19 : memref<4x3xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %21 = llvm.extractvalue %20[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_1(%21) : (!llvm.ptr<f32>) -> ()
    %22 = memref.alloc() {alignment = 64 : i64} : memref<4x3xf32>
    %23 = builtin.unrealized_conversion_cast %22 : memref<4x3xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    memref.copy %19, %22 : memref<4x3xf32> to memref<4x3xf32>
    %24 = llvm.extractvalue %12[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %25 = llvm.extractvalue %16[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %26 = llvm.extractvalue %23[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_2(%24, %25, %26) : (!llvm.ptr<f32>, !llvm.ptr<f32>, !llvm.ptr<f32>) -> ()
    %27 = llvm.extractvalue %23[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.return %27 : !llvm.ptr<f32>
  }
  llvm.func @forward_kernel_0(!llvm.ptr<f32>, !llvm.ptr<f32>) attributes {Kernel, forward_kernel_0}
  llvm.func @forward_kernel_1(!llvm.ptr<f32>) attributes {Kernel, forward_kernel_1}
  llvm.func @forward_kernel_2(!llvm.ptr<f32>, !llvm.ptr<f32>, !llvm.ptr<f32>) attributes {Kernel, forward_kernel_2}
}


// -----// IR Dump After ConvertFuncToLLVM (convert-func-to-llvm) //----- //
module attributes {llvm.data_layout = "", torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_3x3xf32 : memref<3x3xf32> = dense<[[0.569071651, -0.473457456, 0.519209445], [-0.231614307, -0.085622929, 5.772530e-01], [-0.09853556, -0.0144386981, 0.368846387]]>
  llvm.func @forward(%arg0: !llvm.ptr<f32>) -> !llvm.ptr<f32> {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.mlir.constant(4 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.mlir.constant(3 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %9 = llvm.mlir.constant(3 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.mlir.constant(1 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = memref.get_global @__constant_3x3xf32 : memref<3x3xf32>
    %14 = builtin.unrealized_conversion_cast %13 : memref<3x3xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %15 = memref.alloca() : memref<3x3xf32>
    %16 = builtin.unrealized_conversion_cast %15 : memref<3x3xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %17 = llvm.extractvalue %14[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %18 = llvm.extractvalue %16[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_0(%17, %18) : (!llvm.ptr<f32>, !llvm.ptr<f32>) -> ()
    %19 = memref.alloca() : memref<4x3xf32>
    %20 = builtin.unrealized_conversion_cast %19 : memref<4x3xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %21 = llvm.extractvalue %20[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_1(%21) : (!llvm.ptr<f32>) -> ()
    %22 = memref.alloc() {alignment = 64 : i64} : memref<4x3xf32>
    %23 = builtin.unrealized_conversion_cast %22 : memref<4x3xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    memref.copy %19, %22 : memref<4x3xf32> to memref<4x3xf32>
    %24 = llvm.extractvalue %12[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %25 = llvm.extractvalue %16[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %26 = llvm.extractvalue %23[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_2(%24, %25, %26) : (!llvm.ptr<f32>, !llvm.ptr<f32>, !llvm.ptr<f32>) -> ()
    %27 = llvm.extractvalue %23[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.return %27 : !llvm.ptr<f32>
  }
  llvm.func @forward_kernel_0(!llvm.ptr<f32>, !llvm.ptr<f32>) attributes {Kernel, forward_kernel_0}
  llvm.func @forward_kernel_1(!llvm.ptr<f32>) attributes {Kernel, forward_kernel_1}
  llvm.func @forward_kernel_2(!llvm.ptr<f32>, !llvm.ptr<f32>, !llvm.ptr<f32>) attributes {Kernel, forward_kernel_2}
}


// -----// IR Dump After ConvertMemRefToLLVM (convert-memref-to-llvm) //----- //
module attributes {llvm.data_layout = "", torch.debug_module_name = "L"} {
  llvm.func @malloc(i64) -> !llvm.ptr<i8>
  llvm.mlir.global private constant @__constant_3x3xf32(dense<[[0.569071651, -0.473457456, 0.519209445], [-0.231614307, -0.085622929, 5.772530e-01], [-0.09853556, -0.0144386981, 0.368846387]]> : tensor<3x3xf32>) : !llvm.array<3 x array<3 x f32>>
  llvm.func @forward(%arg0: !llvm.ptr<f32>) -> !llvm.ptr<f32> {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.mlir.constant(4 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.mlir.constant(3 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %9 = llvm.mlir.constant(3 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.mlir.constant(1 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = llvm.mlir.constant(3 : index) : i64
    %14 = llvm.mlir.constant(3 : index) : i64
    %15 = llvm.mlir.constant(1 : index) : i64
    %16 = llvm.mlir.constant(9 : index) : i64
    %17 = llvm.mlir.null : !llvm.ptr<f32>
    %18 = llvm.getelementptr %17[%16] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %19 = llvm.ptrtoint %18 : !llvm.ptr<f32> to i64
    %20 = llvm.mlir.addressof @__constant_3x3xf32 : !llvm.ptr<array<3 x array<3 x f32>>>
    %21 = llvm.getelementptr %20[0, 0, 0] : (!llvm.ptr<array<3 x array<3 x f32>>>) -> !llvm.ptr<f32>
    %22 = llvm.mlir.constant(3735928559 : index) : i64
    %23 = llvm.inttoptr %22 : i64 to !llvm.ptr<f32>
    %24 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %25 = llvm.insertvalue %23, %24[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %26 = llvm.insertvalue %21, %25[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %27 = llvm.mlir.constant(0 : index) : i64
    %28 = llvm.insertvalue %27, %26[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %29 = llvm.insertvalue %13, %28[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %30 = llvm.insertvalue %14, %29[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %31 = llvm.insertvalue %14, %30[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %32 = llvm.insertvalue %15, %31[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %33 = builtin.unrealized_conversion_cast %32 : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> to memref<3x3xf32>
    %34 = builtin.unrealized_conversion_cast %33 : memref<3x3xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %35 = llvm.mlir.constant(3 : index) : i64
    %36 = llvm.mlir.constant(3 : index) : i64
    %37 = llvm.mlir.constant(1 : index) : i64
    %38 = llvm.mlir.constant(9 : index) : i64
    %39 = llvm.mlir.null : !llvm.ptr<f32>
    %40 = llvm.getelementptr %39[%38] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %41 = llvm.ptrtoint %40 : !llvm.ptr<f32> to i64
    %42 = llvm.alloca %41 x f32 : (i64) -> !llvm.ptr<f32>
    %43 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %44 = llvm.insertvalue %42, %43[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %45 = llvm.insertvalue %42, %44[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %46 = llvm.mlir.constant(0 : index) : i64
    %47 = llvm.insertvalue %46, %45[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %48 = llvm.insertvalue %35, %47[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %49 = llvm.insertvalue %36, %48[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %50 = llvm.insertvalue %36, %49[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %51 = llvm.insertvalue %37, %50[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %52 = builtin.unrealized_conversion_cast %51 : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> to memref<3x3xf32>
    %53 = builtin.unrealized_conversion_cast %52 : memref<3x3xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %54 = llvm.extractvalue %34[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %55 = llvm.extractvalue %53[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_0(%54, %55) : (!llvm.ptr<f32>, !llvm.ptr<f32>) -> ()
    %56 = llvm.mlir.constant(4 : index) : i64
    %57 = llvm.mlir.constant(3 : index) : i64
    %58 = llvm.mlir.constant(1 : index) : i64
    %59 = llvm.mlir.constant(12 : index) : i64
    %60 = llvm.mlir.null : !llvm.ptr<f32>
    %61 = llvm.getelementptr %60[%59] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
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
    %73 = builtin.unrealized_conversion_cast %72 : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> to memref<4x3xf32>
    %74 = builtin.unrealized_conversion_cast %73 : memref<4x3xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %75 = llvm.extractvalue %74[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_1(%75) : (!llvm.ptr<f32>) -> ()
    %76 = llvm.mlir.constant(4 : index) : i64
    %77 = llvm.mlir.constant(3 : index) : i64
    %78 = llvm.mlir.constant(1 : index) : i64
    %79 = llvm.mlir.constant(12 : index) : i64
    %80 = llvm.mlir.null : !llvm.ptr<f32>
    %81 = llvm.getelementptr %80[%79] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %82 = llvm.ptrtoint %81 : !llvm.ptr<f32> to i64
    %83 = llvm.mlir.constant(64 : index) : i64
    %84 = llvm.add %82, %83  : i64
    %85 = llvm.call @malloc(%84) : (i64) -> !llvm.ptr<i8>
    %86 = llvm.bitcast %85 : !llvm.ptr<i8> to !llvm.ptr<f32>
    %87 = llvm.ptrtoint %86 : !llvm.ptr<f32> to i64
    %88 = llvm.mlir.constant(1 : index) : i64
    %89 = llvm.sub %83, %88  : i64
    %90 = llvm.add %87, %89  : i64
    %91 = llvm.urem %90, %83  : i64
    %92 = llvm.sub %90, %91  : i64
    %93 = llvm.inttoptr %92 : i64 to !llvm.ptr<f32>
    %94 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %95 = llvm.insertvalue %86, %94[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %96 = llvm.insertvalue %93, %95[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %97 = llvm.mlir.constant(0 : index) : i64
    %98 = llvm.insertvalue %97, %96[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %99 = llvm.insertvalue %76, %98[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %100 = llvm.insertvalue %77, %99[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %101 = llvm.insertvalue %77, %100[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %102 = llvm.insertvalue %78, %101[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %103 = builtin.unrealized_conversion_cast %102 : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> to memref<4x3xf32>
    %104 = builtin.unrealized_conversion_cast %103 : memref<4x3xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %105 = llvm.mlir.constant(1 : index) : i64
    %106 = llvm.extractvalue %72[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %107 = llvm.mul %105, %106  : i64
    %108 = llvm.extractvalue %72[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %109 = llvm.mul %107, %108  : i64
    %110 = llvm.mlir.null : !llvm.ptr<f32>
    %111 = llvm.getelementptr %110[1] : (!llvm.ptr<f32>) -> !llvm.ptr<f32>
    %112 = llvm.ptrtoint %111 : !llvm.ptr<f32> to i64
    %113 = llvm.mul %109, %112  : i64
    %114 = llvm.extractvalue %72[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %115 = llvm.extractvalue %72[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %116 = llvm.getelementptr %114[%115] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %117 = llvm.extractvalue %102[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %118 = llvm.extractvalue %102[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %119 = llvm.getelementptr %117[%118] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %120 = llvm.mlir.constant(false) : i1
    "llvm.intr.memcpy"(%119, %116, %113, %120) : (!llvm.ptr<f32>, !llvm.ptr<f32>, i64, i1) -> ()
    %121 = llvm.extractvalue %12[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %122 = llvm.extractvalue %53[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %123 = llvm.extractvalue %104[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_2(%121, %122, %123) : (!llvm.ptr<f32>, !llvm.ptr<f32>, !llvm.ptr<f32>) -> ()
    %124 = llvm.extractvalue %104[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.return %124 : !llvm.ptr<f32>
  }
  llvm.func @forward_kernel_0(!llvm.ptr<f32>, !llvm.ptr<f32>) attributes {Kernel, forward_kernel_0}
  llvm.func @forward_kernel_1(!llvm.ptr<f32>) attributes {Kernel, forward_kernel_1}
  llvm.func @forward_kernel_2(!llvm.ptr<f32>, !llvm.ptr<f32>, !llvm.ptr<f32>) attributes {Kernel, forward_kernel_2}
}


// -----// IR Dump After ReconcileUnrealizedCasts (reconcile-unrealized-casts) //----- //
module attributes {llvm.data_layout = "", torch.debug_module_name = "L"} {
  llvm.func @malloc(i64) -> !llvm.ptr<i8>
  llvm.mlir.global private constant @__constant_3x3xf32(dense<[[0.569071651, -0.473457456, 0.519209445], [-0.231614307, -0.085622929, 5.772530e-01], [-0.09853556, -0.0144386981, 0.368846387]]> : tensor<3x3xf32>) : !llvm.array<3 x array<3 x f32>>
  llvm.func @forward(%arg0: !llvm.ptr<f32>) -> !llvm.ptr<f32> {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.mlir.constant(4 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.mlir.constant(3 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %9 = llvm.mlir.constant(3 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.mlir.constant(1 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = llvm.mlir.constant(3 : index) : i64
    %14 = llvm.mlir.constant(3 : index) : i64
    %15 = llvm.mlir.constant(1 : index) : i64
    %16 = llvm.mlir.constant(9 : index) : i64
    %17 = llvm.mlir.null : !llvm.ptr<f32>
    %18 = llvm.getelementptr %17[9] : (!llvm.ptr<f32>) -> !llvm.ptr<f32>
    %19 = llvm.ptrtoint %18 : !llvm.ptr<f32> to i64
    %20 = llvm.mlir.addressof @__constant_3x3xf32 : !llvm.ptr<array<3 x array<3 x f32>>>
    %21 = llvm.getelementptr %20[0, 0, 0] : (!llvm.ptr<array<3 x array<3 x f32>>>) -> !llvm.ptr<f32>
    %22 = llvm.mlir.constant(3735928559 : index) : i64
    %23 = llvm.inttoptr %22 : i64 to !llvm.ptr<f32>
    %24 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %25 = llvm.insertvalue %23, %24[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %26 = llvm.insertvalue %21, %25[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %27 = llvm.mlir.constant(0 : index) : i64
    %28 = llvm.insertvalue %27, %26[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %29 = llvm.insertvalue %13, %28[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %30 = llvm.insertvalue %14, %29[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %31 = llvm.insertvalue %14, %30[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %32 = llvm.insertvalue %15, %31[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %33 = llvm.mlir.constant(3 : index) : i64
    %34 = llvm.mlir.constant(3 : index) : i64
    %35 = llvm.mlir.constant(1 : index) : i64
    %36 = llvm.mlir.constant(9 : index) : i64
    %37 = llvm.mlir.null : !llvm.ptr<f32>
    %38 = llvm.getelementptr %37[9] : (!llvm.ptr<f32>) -> !llvm.ptr<f32>
    %39 = llvm.ptrtoint %38 : !llvm.ptr<f32> to i64
    %40 = llvm.alloca %39 x f32 : (i64) -> !llvm.ptr<f32>
    %41 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %42 = llvm.insertvalue %40, %41[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %43 = llvm.insertvalue %40, %42[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %44 = llvm.mlir.constant(0 : index) : i64
    %45 = llvm.insertvalue %44, %43[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %46 = llvm.insertvalue %33, %45[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %47 = llvm.insertvalue %34, %46[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %48 = llvm.insertvalue %34, %47[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %49 = llvm.insertvalue %35, %48[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %50 = llvm.extractvalue %32[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %51 = llvm.extractvalue %49[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_0(%50, %51) : (!llvm.ptr<f32>, !llvm.ptr<f32>) -> ()
    %52 = llvm.mlir.constant(4 : index) : i64
    %53 = llvm.mlir.constant(3 : index) : i64
    %54 = llvm.mlir.constant(1 : index) : i64
    %55 = llvm.mlir.constant(12 : index) : i64
    %56 = llvm.mlir.null : !llvm.ptr<f32>
    %57 = llvm.getelementptr %56[12] : (!llvm.ptr<f32>) -> !llvm.ptr<f32>
    %58 = llvm.ptrtoint %57 : !llvm.ptr<f32> to i64
    %59 = llvm.alloca %58 x f32 : (i64) -> !llvm.ptr<f32>
    %60 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %61 = llvm.insertvalue %59, %60[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %62 = llvm.insertvalue %59, %61[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %63 = llvm.mlir.constant(0 : index) : i64
    %64 = llvm.insertvalue %63, %62[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %65 = llvm.insertvalue %52, %64[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %66 = llvm.insertvalue %53, %65[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %67 = llvm.insertvalue %53, %66[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %68 = llvm.insertvalue %54, %67[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %69 = llvm.extractvalue %68[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_1(%69) : (!llvm.ptr<f32>) -> ()
    %70 = llvm.mlir.constant(4 : index) : i64
    %71 = llvm.mlir.constant(3 : index) : i64
    %72 = llvm.mlir.constant(1 : index) : i64
    %73 = llvm.mlir.constant(12 : index) : i64
    %74 = llvm.mlir.null : !llvm.ptr<f32>
    %75 = llvm.getelementptr %74[12] : (!llvm.ptr<f32>) -> !llvm.ptr<f32>
    %76 = llvm.ptrtoint %75 : !llvm.ptr<f32> to i64
    %77 = llvm.mlir.constant(64 : index) : i64
    %78 = llvm.add %76, %77  : i64
    %79 = llvm.call @malloc(%78) : (i64) -> !llvm.ptr<i8>
    %80 = llvm.bitcast %79 : !llvm.ptr<i8> to !llvm.ptr<f32>
    %81 = llvm.ptrtoint %80 : !llvm.ptr<f32> to i64
    %82 = llvm.mlir.constant(1 : index) : i64
    %83 = llvm.sub %77, %82  : i64
    %84 = llvm.add %81, %83  : i64
    %85 = llvm.urem %84, %77  : i64
    %86 = llvm.sub %84, %85  : i64
    %87 = llvm.inttoptr %86 : i64 to !llvm.ptr<f32>
    %88 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %89 = llvm.insertvalue %80, %88[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %90 = llvm.insertvalue %87, %89[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %91 = llvm.mlir.constant(0 : index) : i64
    %92 = llvm.insertvalue %91, %90[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %93 = llvm.insertvalue %70, %92[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %94 = llvm.insertvalue %71, %93[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %95 = llvm.insertvalue %71, %94[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %96 = llvm.insertvalue %72, %95[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %97 = llvm.mlir.constant(1 : index) : i64
    %98 = llvm.mul %97, %52  : i64
    %99 = llvm.mul %98, %53  : i64
    %100 = llvm.mlir.null : !llvm.ptr<f32>
    %101 = llvm.getelementptr %100[1] : (!llvm.ptr<f32>) -> !llvm.ptr<f32>
    %102 = llvm.ptrtoint %101 : !llvm.ptr<f32> to i64
    %103 = llvm.mul %99, %102  : i64
    %104 = llvm.getelementptr %59[%63] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %105 = llvm.getelementptr %87[%91] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %106 = llvm.mlir.constant(false) : i1
    "llvm.intr.memcpy"(%105, %104, %103, %106) : (!llvm.ptr<f32>, !llvm.ptr<f32>, i64, i1) -> ()
    %107 = llvm.extractvalue %49[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %108 = llvm.extractvalue %96[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_2(%arg0, %107, %108) : (!llvm.ptr<f32>, !llvm.ptr<f32>, !llvm.ptr<f32>) -> ()
    %109 = llvm.extractvalue %96[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.return %109 : !llvm.ptr<f32>
  }
  llvm.func @forward_kernel_0(!llvm.ptr<f32>, !llvm.ptr<f32>) attributes {Kernel, forward_kernel_0}
  llvm.func @forward_kernel_1(!llvm.ptr<f32>) attributes {Kernel, forward_kernel_1}
  llvm.func @forward_kernel_2(!llvm.ptr<f32>, !llvm.ptr<f32>, !llvm.ptr<f32>) attributes {Kernel, forward_kernel_2}
}


