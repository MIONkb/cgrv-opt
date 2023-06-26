// -----// IR Dump After PromoteBuffersToStack (promote-buffers-to-stack) //----- //
func.func @forward(%arg0: memref<4x3xf32>) -> memref<4x3xf32> {
  %cst = arith.constant 0.000000e+00 : f32
  %0 = memref.get_global @__constant_3x12xf32 : memref<3x12xf32>
  %1 = memref.get_global @__constant_12x3xf32 : memref<12x3xf32>
  %2 = memref.alloca() {alignment = 64 : i64} : memref<3x12xf32>
  FDRA.KernelCall @forward_kernel_0(%1, %2) : (memref<12x3xf32>, memref<3x12xf32>) -> ()
  %3 = memref.alloca() : memref<4x12xf32>
  FDRA.KernelCall @forward_kernel_1(%3) : (memref<4x12xf32>) -> ()
  %4 = memref.alloca() : memref<4x12xf32>
  memref.copy %3, %4 : memref<4x12xf32> to memref<4x12xf32>
  FDRA.KernelCall @forward_kernel_2(%arg0, %2, %4) : (memref<4x3xf32>, memref<3x12xf32>, memref<4x12xf32>) -> ()
  %5 = memref.alloca() {alignment = 64 : i64} : memref<12x3xf32>
  FDRA.KernelCall @forward_kernel_3(%0, %5) : (memref<3x12xf32>, memref<12x3xf32>) -> ()
  %6 = memref.alloca() : memref<4x3xf32>
  FDRA.KernelCall @forward_kernel_4(%6) : (memref<4x3xf32>) -> ()
  %7 = memref.alloc() {alignment = 64 : i64} : memref<4x3xf32>
  memref.copy %6, %7 : memref<4x3xf32> to memref<4x3xf32>
  FDRA.KernelCall @forward_kernel_5(%4, %5, %7) : (memref<4x12xf32>, memref<12x3xf32>, memref<4x3xf32>) -> ()
  return %7 : memref<4x3xf32>
}

// -----// IR Dump After PromoteBuffersToStack (promote-buffers-to-stack) //----- //
func.func @forward_kernel_0(%arg0: memref<12x3xf32>, %arg1: memref<3x12xf32>) attributes {Kernel, forward_kernel_0} {
  cf.br ^bb1
^bb1:  // pred: ^bb0
  affine.for %arg2 = 0 to 12 {
    affine.for %arg3 = 0 to 3 {
      %0 = affine.load %arg0[%arg2, %arg3] : memref<12x3xf32>
      affine.store %0, %arg1[%arg3, %arg2] : memref<3x12xf32>
    }
  }
  return
}

// -----// IR Dump After PromoteBuffersToStack (promote-buffers-to-stack) //----- //
func.func @forward_kernel_1(%arg0: memref<4x12xf32>) attributes {Kernel, forward_kernel_1} {
  cf.br ^bb1
^bb1:  // pred: ^bb0
  %cst = arith.constant 0.000000e+00 : f32
  affine.for %arg1 = 0 to 4 {
    affine.for %arg2 = 0 to 12 {
      affine.store %cst, %arg0[%arg1, %arg2] : memref<4x12xf32>
    }
  }
  return
}

// -----// IR Dump After PromoteBuffersToStack (promote-buffers-to-stack) //----- //
func.func @forward_kernel_2(%arg0: memref<4x3xf32>, %arg1: memref<3x12xf32>, %arg2: memref<4x12xf32>) attributes {Kernel, forward_kernel_2} {
  cf.br ^bb1
^bb1:  // pred: ^bb0
  affine.for %arg3 = 0 to 4 {
    affine.for %arg4 = 0 to 12 {
      affine.for %arg5 = 0 to 3 {
        %0 = affine.load %arg0[%arg3, %arg5] : memref<4x3xf32>
        %1 = affine.load %arg1[%arg5, %arg4] : memref<3x12xf32>
        %2 = affine.load %arg2[%arg3, %arg4] : memref<4x12xf32>
        %3 = arith.mulf %0, %1 : f32
        %4 = arith.addf %2, %3 : f32
        affine.store %4, %arg2[%arg3, %arg4] : memref<4x12xf32>
      }
    }
  }
  return
}

// -----// IR Dump After PromoteBuffersToStack (promote-buffers-to-stack) //----- //
func.func @forward_kernel_3(%arg0: memref<3x12xf32>, %arg1: memref<12x3xf32>) attributes {Kernel, forward_kernel_3} {
  cf.br ^bb1
^bb1:  // pred: ^bb0
  affine.for %arg2 = 0 to 3 {
    affine.for %arg3 = 0 to 12 {
      %0 = affine.load %arg0[%arg2, %arg3] : memref<3x12xf32>
      affine.store %0, %arg1[%arg3, %arg2] : memref<12x3xf32>
    }
  }
  return
}

// -----// IR Dump After PromoteBuffersToStack (promote-buffers-to-stack) //----- //
func.func @forward_kernel_4(%arg0: memref<4x3xf32>) attributes {Kernel, forward_kernel_4} {
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
func.func @forward_kernel_5(%arg0: memref<4x12xf32>, %arg1: memref<12x3xf32>, %arg2: memref<4x3xf32>) attributes {Kernel, forward_kernel_5} {
  cf.br ^bb1
^bb1:  // pred: ^bb0
  affine.for %arg3 = 0 to 4 {
    affine.for %arg4 = 0 to 3 {
      affine.for %arg5 = 0 to 12 {
        %0 = affine.load %arg0[%arg3, %arg5] : memref<4x12xf32>
        %1 = affine.load %arg1[%arg5, %arg4] : memref<12x3xf32>
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
  memref.global "private" constant @__constant_12x3xf32 : memref<12x3xf32> = dense<[[-0.259240121, -0.234688252, 0.510510147], [0.233562827, -0.0331445783, 0.384852856], [-0.508802652, 0.173100084, -0.456325561], [0.334649473, 0.101393677, -0.0848175361], [0.415013522, 0.548246503, -0.0517567173], [0.558391511, -0.239463642, -0.212957352], [0.0163944438, -0.32234925, 0.205953121], [-0.284711599, 0.075589411, 0.142221317], [-5.766300e-01, -0.231847823, -0.161687583], [-0.538891375, 0.341592878, -0.576503336], [0.443732411, -0.319553018, -0.167551935], [0.142661244, 0.165032223, -0.576377869]]>
  memref.global "private" constant @__constant_3x12xf32 : memref<3x12xf32> = dense<[[0.161275461, 0.0990483835, 0.140225306, 0.0738267228, -0.0230169389, -0.191564813, 0.1457607, 0.197757319, -0.0972366183, 0.126508623, 0.139206693, -0.0688978806], [-0.176147208, -0.213960767, -0.198053509, -0.0384910479, -0.245581821, 0.139692709, -2.673340e-01, -0.223085925, -0.196028829, -0.226647332, -0.0104687046, 0.127765238], [0.0994836315, -0.128047019, -0.0917707682, 0.115462713, 0.0437031351, -0.0613443516, 0.0145246265, 0.240862086, 0.133553818, -0.0305191949, -0.286686301, -0.204464972]]>
  func.func @forward(%arg0: memref<4x3xf32>) -> memref<4x3xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = memref.get_global @__constant_3x12xf32 : memref<3x12xf32>
    %1 = memref.get_global @__constant_12x3xf32 : memref<12x3xf32>
    %2 = memref.alloca() {alignment = 64 : i64} : memref<3x12xf32>
    FDRA.KernelCall @forward_kernel_0(%1, %2) : (memref<12x3xf32>, memref<3x12xf32>) -> ()
    %3 = memref.alloca() : memref<4x12xf32>
    FDRA.KernelCall @forward_kernel_1(%3) : (memref<4x12xf32>) -> ()
    %4 = memref.alloca() : memref<4x12xf32>
    memref.copy %3, %4 : memref<4x12xf32> to memref<4x12xf32>
    FDRA.KernelCall @forward_kernel_2(%arg0, %2, %4) : (memref<4x3xf32>, memref<3x12xf32>, memref<4x12xf32>) -> ()
    %5 = memref.alloca() {alignment = 64 : i64} : memref<12x3xf32>
    FDRA.KernelCall @forward_kernel_3(%0, %5) : (memref<3x12xf32>, memref<12x3xf32>) -> ()
    %6 = memref.alloca() : memref<4x3xf32>
    FDRA.KernelCall @forward_kernel_4(%6) : (memref<4x3xf32>) -> ()
    %7 = memref.alloc() {alignment = 64 : i64} : memref<4x3xf32>
    memref.copy %6, %7 : memref<4x3xf32> to memref<4x3xf32>
    FDRA.KernelCall @forward_kernel_5(%4, %5, %7) : (memref<4x12xf32>, memref<12x3xf32>, memref<4x3xf32>) -> ()
    return %7 : memref<4x3xf32>
  }
  func.func @forward_kernel_0(%arg0: memref<12x3xf32>, %arg1: memref<3x12xf32>) attributes {Kernel, forward_kernel_0} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    affine.for %arg2 = 0 to 12 {
      affine.for %arg3 = 0 to 3 {
        %0 = affine.load %arg0[%arg2, %arg3] : memref<12x3xf32>
        affine.store %0, %arg1[%arg3, %arg2] : memref<3x12xf32>
      }
    }
    return
  }
  func.func @forward_kernel_1(%arg0: memref<4x12xf32>) attributes {Kernel, forward_kernel_1} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    %cst = arith.constant 0.000000e+00 : f32
    affine.for %arg1 = 0 to 4 {
      affine.for %arg2 = 0 to 12 {
        affine.store %cst, %arg0[%arg1, %arg2] : memref<4x12xf32>
      }
    }
    return
  }
  func.func @forward_kernel_2(%arg0: memref<4x3xf32>, %arg1: memref<3x12xf32>, %arg2: memref<4x12xf32>) attributes {Kernel, forward_kernel_2} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    affine.for %arg3 = 0 to 4 {
      affine.for %arg4 = 0 to 12 {
        affine.for %arg5 = 0 to 3 {
          %0 = affine.load %arg0[%arg3, %arg5] : memref<4x3xf32>
          %1 = affine.load %arg1[%arg5, %arg4] : memref<3x12xf32>
          %2 = affine.load %arg2[%arg3, %arg4] : memref<4x12xf32>
          %3 = arith.mulf %0, %1 : f32
          %4 = arith.addf %2, %3 : f32
          affine.store %4, %arg2[%arg3, %arg4] : memref<4x12xf32>
        }
      }
    }
    return
  }
  func.func @forward_kernel_3(%arg0: memref<3x12xf32>, %arg1: memref<12x3xf32>) attributes {Kernel, forward_kernel_3} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    affine.for %arg2 = 0 to 3 {
      affine.for %arg3 = 0 to 12 {
        %0 = affine.load %arg0[%arg2, %arg3] : memref<3x12xf32>
        affine.store %0, %arg1[%arg3, %arg2] : memref<12x3xf32>
      }
    }
    return
  }
  func.func @forward_kernel_4(%arg0: memref<4x3xf32>) attributes {Kernel, forward_kernel_4} {
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
  func.func @forward_kernel_5(%arg0: memref<4x12xf32>, %arg1: memref<12x3xf32>, %arg2: memref<4x3xf32>) attributes {Kernel, forward_kernel_5} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    affine.for %arg3 = 0 to 4 {
      affine.for %arg4 = 0 to 3 {
        affine.for %arg5 = 0 to 12 {
          %0 = affine.load %arg0[%arg3, %arg5] : memref<4x12xf32>
          %1 = affine.load %arg1[%arg5, %arg4] : memref<12x3xf32>
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
  memref.global "private" constant @__constant_12x3xf32 : memref<12x3xf32> = dense<[[-0.259240121, -0.234688252, 0.510510147], [0.233562827, -0.0331445783, 0.384852856], [-0.508802652, 0.173100084, -0.456325561], [0.334649473, 0.101393677, -0.0848175361], [0.415013522, 0.548246503, -0.0517567173], [0.558391511, -0.239463642, -0.212957352], [0.0163944438, -0.32234925, 0.205953121], [-0.284711599, 0.075589411, 0.142221317], [-5.766300e-01, -0.231847823, -0.161687583], [-0.538891375, 0.341592878, -0.576503336], [0.443732411, -0.319553018, -0.167551935], [0.142661244, 0.165032223, -0.576377869]]>
  memref.global "private" constant @__constant_3x12xf32 : memref<3x12xf32> = dense<[[0.161275461, 0.0990483835, 0.140225306, 0.0738267228, -0.0230169389, -0.191564813, 0.1457607, 0.197757319, -0.0972366183, 0.126508623, 0.139206693, -0.0688978806], [-0.176147208, -0.213960767, -0.198053509, -0.0384910479, -0.245581821, 0.139692709, -2.673340e-01, -0.223085925, -0.196028829, -0.226647332, -0.0104687046, 0.127765238], [0.0994836315, -0.128047019, -0.0917707682, 0.115462713, 0.0437031351, -0.0613443516, 0.0145246265, 0.240862086, 0.133553818, -0.0305191949, -0.286686301, -0.204464972]]>
  func.func @forward(%arg0: memref<4x3xf32>) -> memref<4x3xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = memref.get_global @__constant_3x12xf32 : memref<3x12xf32>
    %1 = memref.get_global @__constant_12x3xf32 : memref<12x3xf32>
    %2 = memref.alloca() {alignment = 64 : i64} : memref<3x12xf32>
    FDRA.KernelCall @forward_kernel_0(%1, %2) : (memref<12x3xf32>, memref<3x12xf32>) -> ()
    %3 = memref.alloca() : memref<4x12xf32>
    FDRA.KernelCall @forward_kernel_1(%3) : (memref<4x12xf32>) -> ()
    %4 = memref.alloca() : memref<4x12xf32>
    memref.copy %3, %4 : memref<4x12xf32> to memref<4x12xf32>
    FDRA.KernelCall @forward_kernel_2(%arg0, %2, %4) : (memref<4x3xf32>, memref<3x12xf32>, memref<4x12xf32>) -> ()
    %5 = memref.alloca() {alignment = 64 : i64} : memref<12x3xf32>
    FDRA.KernelCall @forward_kernel_3(%0, %5) : (memref<3x12xf32>, memref<12x3xf32>) -> ()
    %6 = memref.alloca() : memref<4x3xf32>
    FDRA.KernelCall @forward_kernel_4(%6) : (memref<4x3xf32>) -> ()
    %7 = memref.alloc() {alignment = 64 : i64} : memref<4x3xf32>
    memref.copy %6, %7 : memref<4x3xf32> to memref<4x3xf32>
    FDRA.KernelCall @forward_kernel_5(%4, %5, %7) : (memref<4x12xf32>, memref<12x3xf32>, memref<4x3xf32>) -> ()
    return %7 : memref<4x3xf32>
  }
  func.func @forward_kernel_0(%arg0: memref<12x3xf32>, %arg1: memref<3x12xf32>) attributes {Kernel, forward_kernel_0} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    affine.for %arg2 = 0 to 12 {
      affine.for %arg3 = 0 to 3 {
        %0 = affine.load %arg0[%arg2, %arg3] : memref<12x3xf32>
        affine.store %0, %arg1[%arg3, %arg2] : memref<3x12xf32>
      }
    }
    return
  }
  func.func @forward_kernel_1(%arg0: memref<4x12xf32>) attributes {Kernel, forward_kernel_1} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    %cst = arith.constant 0.000000e+00 : f32
    affine.for %arg1 = 0 to 4 {
      affine.for %arg2 = 0 to 12 {
        affine.store %cst, %arg0[%arg1, %arg2] : memref<4x12xf32>
      }
    }
    return
  }
  func.func @forward_kernel_2(%arg0: memref<4x3xf32>, %arg1: memref<3x12xf32>, %arg2: memref<4x12xf32>) attributes {Kernel, forward_kernel_2} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    affine.for %arg3 = 0 to 4 {
      affine.for %arg4 = 0 to 12 {
        affine.for %arg5 = 0 to 3 {
          %0 = affine.load %arg0[%arg3, %arg5] : memref<4x3xf32>
          %1 = affine.load %arg1[%arg5, %arg4] : memref<3x12xf32>
          %2 = affine.load %arg2[%arg3, %arg4] : memref<4x12xf32>
          %3 = arith.mulf %0, %1 : f32
          %4 = arith.addf %2, %3 : f32
          affine.store %4, %arg2[%arg3, %arg4] : memref<4x12xf32>
        }
      }
    }
    return
  }
  func.func @forward_kernel_3(%arg0: memref<3x12xf32>, %arg1: memref<12x3xf32>) attributes {Kernel, forward_kernel_3} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    affine.for %arg2 = 0 to 3 {
      affine.for %arg3 = 0 to 12 {
        %0 = affine.load %arg0[%arg2, %arg3] : memref<3x12xf32>
        affine.store %0, %arg1[%arg3, %arg2] : memref<12x3xf32>
      }
    }
    return
  }
  func.func @forward_kernel_4(%arg0: memref<4x3xf32>) attributes {Kernel, forward_kernel_4} {
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
  func.func @forward_kernel_5(%arg0: memref<4x12xf32>, %arg1: memref<12x3xf32>, %arg2: memref<4x3xf32>) attributes {Kernel, forward_kernel_5} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    affine.for %arg3 = 0 to 4 {
      affine.for %arg4 = 0 to 3 {
        affine.for %arg5 = 0 to 12 {
          %0 = affine.load %arg0[%arg3, %arg5] : memref<4x12xf32>
          %1 = affine.load %arg1[%arg5, %arg4] : memref<12x3xf32>
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
  memref.global "private" constant @__constant_12x3xf32 : memref<12x3xf32> = dense<[[-0.259240121, -0.234688252, 0.510510147], [0.233562827, -0.0331445783, 0.384852856], [-0.508802652, 0.173100084, -0.456325561], [0.334649473, 0.101393677, -0.0848175361], [0.415013522, 0.548246503, -0.0517567173], [0.558391511, -0.239463642, -0.212957352], [0.0163944438, -0.32234925, 0.205953121], [-0.284711599, 0.075589411, 0.142221317], [-5.766300e-01, -0.231847823, -0.161687583], [-0.538891375, 0.341592878, -0.576503336], [0.443732411, -0.319553018, -0.167551935], [0.142661244, 0.165032223, -0.576377869]]>
  memref.global "private" constant @__constant_3x12xf32 : memref<3x12xf32> = dense<[[0.161275461, 0.0990483835, 0.140225306, 0.0738267228, -0.0230169389, -0.191564813, 0.1457607, 0.197757319, -0.0972366183, 0.126508623, 0.139206693, -0.0688978806], [-0.176147208, -0.213960767, -0.198053509, -0.0384910479, -0.245581821, 0.139692709, -2.673340e-01, -0.223085925, -0.196028829, -0.226647332, -0.0104687046, 0.127765238], [0.0994836315, -0.128047019, -0.0917707682, 0.115462713, 0.0437031351, -0.0613443516, 0.0145246265, 0.240862086, 0.133553818, -0.0305191949, -0.286686301, -0.204464972]]>
  func.func @forward(%arg0: memref<4x3xf32>) -> memref<4x3xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = memref.get_global @__constant_3x12xf32 : memref<3x12xf32>
    %1 = memref.get_global @__constant_12x3xf32 : memref<12x3xf32>
    %2 = memref.alloca() {alignment = 64 : i64} : memref<3x12xf32>
    FDRA.KernelCall @forward_kernel_0(%1, %2) : (memref<12x3xf32>, memref<3x12xf32>) -> ()
    %3 = memref.alloca() : memref<4x12xf32>
    FDRA.KernelCall @forward_kernel_1(%3) : (memref<4x12xf32>) -> ()
    %4 = memref.alloca() : memref<4x12xf32>
    memref.copy %3, %4 : memref<4x12xf32> to memref<4x12xf32>
    FDRA.KernelCall @forward_kernel_2(%arg0, %2, %4) : (memref<4x3xf32>, memref<3x12xf32>, memref<4x12xf32>) -> ()
    %5 = memref.alloca() {alignment = 64 : i64} : memref<12x3xf32>
    FDRA.KernelCall @forward_kernel_3(%0, %5) : (memref<3x12xf32>, memref<12x3xf32>) -> ()
    %6 = memref.alloca() : memref<4x3xf32>
    FDRA.KernelCall @forward_kernel_4(%6) : (memref<4x3xf32>) -> ()
    %7 = memref.alloc() {alignment = 64 : i64} : memref<4x3xf32>
    memref.copy %6, %7 : memref<4x3xf32> to memref<4x3xf32>
    FDRA.KernelCall @forward_kernel_5(%4, %5, %7) : (memref<4x12xf32>, memref<12x3xf32>, memref<4x3xf32>) -> ()
    return %7 : memref<4x3xf32>
  }
  func.func @forward_kernel_0(%arg0: memref<12x3xf32>, %arg1: memref<3x12xf32>) attributes {Kernel, forward_kernel_0} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    affine.for %arg2 = 0 to 12 {
      affine.for %arg3 = 0 to 3 {
        %0 = affine.load %arg0[%arg2, %arg3] : memref<12x3xf32>
        affine.store %0, %arg1[%arg3, %arg2] : memref<3x12xf32>
      }
    }
    return
  }
  func.func @forward_kernel_1(%arg0: memref<4x12xf32>) attributes {Kernel, forward_kernel_1} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    %cst = arith.constant 0.000000e+00 : f32
    affine.for %arg1 = 0 to 4 {
      affine.for %arg2 = 0 to 12 {
        affine.store %cst, %arg0[%arg1, %arg2] : memref<4x12xf32>
      }
    }
    return
  }
  func.func @forward_kernel_2(%arg0: memref<4x3xf32>, %arg1: memref<3x12xf32>, %arg2: memref<4x12xf32>) attributes {Kernel, forward_kernel_2} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    affine.for %arg3 = 0 to 4 {
      affine.for %arg4 = 0 to 12 {
        affine.for %arg5 = 0 to 3 {
          %0 = affine.load %arg0[%arg3, %arg5] : memref<4x3xf32>
          %1 = affine.load %arg1[%arg5, %arg4] : memref<3x12xf32>
          %2 = affine.load %arg2[%arg3, %arg4] : memref<4x12xf32>
          %3 = arith.mulf %0, %1 : f32
          %4 = arith.addf %2, %3 : f32
          affine.store %4, %arg2[%arg3, %arg4] : memref<4x12xf32>
        }
      }
    }
    return
  }
  func.func @forward_kernel_3(%arg0: memref<3x12xf32>, %arg1: memref<12x3xf32>) attributes {Kernel, forward_kernel_3} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    affine.for %arg2 = 0 to 3 {
      affine.for %arg3 = 0 to 12 {
        %0 = affine.load %arg0[%arg2, %arg3] : memref<3x12xf32>
        affine.store %0, %arg1[%arg3, %arg2] : memref<12x3xf32>
      }
    }
    return
  }
  func.func @forward_kernel_4(%arg0: memref<4x3xf32>) attributes {Kernel, forward_kernel_4} {
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
  func.func @forward_kernel_5(%arg0: memref<4x12xf32>, %arg1: memref<12x3xf32>, %arg2: memref<4x3xf32>) attributes {Kernel, forward_kernel_5} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    affine.for %arg3 = 0 to 4 {
      affine.for %arg4 = 0 to 3 {
        affine.for %arg5 = 0 to 12 {
          %0 = affine.load %arg0[%arg3, %arg5] : memref<4x12xf32>
          %1 = affine.load %arg1[%arg5, %arg4] : memref<12x3xf32>
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
  %0 = memref.get_global @__constant_3x12xf32 : memref<3x12xf32>
  %1 = memref.get_global @__constant_12x3xf32 : memref<12x3xf32>
  %2 = memref.alloca() {alignment = 64 : i64} : memref<3x12xf32>
  FDRA.KernelCall @forward_kernel_0(%1, %2) : (memref<12x3xf32>, memref<3x12xf32>) -> ()
  %3 = memref.alloca() : memref<4x12xf32>
  FDRA.KernelCall @forward_kernel_1(%3) : (memref<4x12xf32>) -> ()
  %4 = memref.alloca() : memref<4x12xf32>
  memref.copy %3, %4 : memref<4x12xf32> to memref<4x12xf32>
  FDRA.KernelCall @forward_kernel_2(%arg0, %2, %4) : (memref<4x3xf32>, memref<3x12xf32>, memref<4x12xf32>) -> ()
  %5 = memref.alloca() {alignment = 64 : i64} : memref<12x3xf32>
  FDRA.KernelCall @forward_kernel_3(%0, %5) : (memref<3x12xf32>, memref<12x3xf32>) -> ()
  %6 = memref.alloca() : memref<4x3xf32>
  FDRA.KernelCall @forward_kernel_4(%6) : (memref<4x3xf32>) -> ()
  %7 = memref.alloc() {alignment = 64 : i64} : memref<4x3xf32>
  memref.copy %6, %7 : memref<4x3xf32> to memref<4x3xf32>
  FDRA.KernelCall @forward_kernel_5(%4, %5, %7) : (memref<4x12xf32>, memref<12x3xf32>, memref<4x3xf32>) -> ()
  return %7 : memref<4x3xf32>
}

// -----// IR Dump After SimplifyAffineStructures (affine-simplify-structures) //----- //
func.func @forward_kernel_1(%arg0: memref<4x12xf32>) attributes {Kernel, forward_kernel_1} {
  cf.br ^bb1
^bb1:  // pred: ^bb0
  %cst = arith.constant 0.000000e+00 : f32
  affine.for %arg1 = 0 to 4 {
    affine.for %arg2 = 0 to 12 {
      affine.store %cst, %arg0[%arg1, %arg2] : memref<4x12xf32>
    }
  }
  return
}

// -----// IR Dump After SimplifyAffineStructures (affine-simplify-structures) //----- //
func.func @forward_kernel_2(%arg0: memref<4x3xf32>, %arg1: memref<3x12xf32>, %arg2: memref<4x12xf32>) attributes {Kernel, forward_kernel_2} {
  cf.br ^bb1
^bb1:  // pred: ^bb0
  affine.for %arg3 = 0 to 4 {
    affine.for %arg4 = 0 to 12 {
      affine.for %arg5 = 0 to 3 {
        %0 = affine.load %arg0[%arg3, %arg5] : memref<4x3xf32>
        %1 = affine.load %arg1[%arg5, %arg4] : memref<3x12xf32>
        %2 = affine.load %arg2[%arg3, %arg4] : memref<4x12xf32>
        %3 = arith.mulf %0, %1 : f32
        %4 = arith.addf %2, %3 : f32
        affine.store %4, %arg2[%arg3, %arg4] : memref<4x12xf32>
      }
    }
  }
  return
}

// -----// IR Dump After SimplifyAffineStructures (affine-simplify-structures) //----- //
func.func @forward_kernel_0(%arg0: memref<12x3xf32>, %arg1: memref<3x12xf32>) attributes {Kernel, forward_kernel_0} {
  cf.br ^bb1
^bb1:  // pred: ^bb0
  affine.for %arg2 = 0 to 12 {
    affine.for %arg3 = 0 to 3 {
      %0 = affine.load %arg0[%arg2, %arg3] : memref<12x3xf32>
      affine.store %0, %arg1[%arg3, %arg2] : memref<3x12xf32>
    }
  }
  return
}

// -----// IR Dump After SimplifyAffineStructures (affine-simplify-structures) //----- //
func.func @forward_kernel_5(%arg0: memref<4x12xf32>, %arg1: memref<12x3xf32>, %arg2: memref<4x3xf32>) attributes {Kernel, forward_kernel_5} {
  cf.br ^bb1
^bb1:  // pred: ^bb0
  affine.for %arg3 = 0 to 4 {
    affine.for %arg4 = 0 to 3 {
      affine.for %arg5 = 0 to 12 {
        %0 = affine.load %arg0[%arg3, %arg5] : memref<4x12xf32>
        %1 = affine.load %arg1[%arg5, %arg4] : memref<12x3xf32>
        %2 = affine.load %arg2[%arg3, %arg4] : memref<4x3xf32>
        %3 = arith.mulf %0, %1 : f32
        %4 = arith.addf %2, %3 : f32
        affine.store %4, %arg2[%arg3, %arg4] : memref<4x3xf32>
      }
    }
  }
  return
}

// -----// IR Dump After SimplifyAffineStructures (affine-simplify-structures) //----- //
func.func @forward_kernel_4(%arg0: memref<4x3xf32>) attributes {Kernel, forward_kernel_4} {
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
func.func @forward_kernel_3(%arg0: memref<3x12xf32>, %arg1: memref<12x3xf32>) attributes {Kernel, forward_kernel_3} {
  cf.br ^bb1
^bb1:  // pred: ^bb0
  affine.for %arg2 = 0 to 3 {
    affine.for %arg3 = 0 to 12 {
      %0 = affine.load %arg0[%arg2, %arg3] : memref<3x12xf32>
      affine.store %0, %arg1[%arg3, %arg2] : memref<12x3xf32>
    }
  }
  return
}

// -----// IR Dump After ConvertAffineToStandard (lower-affine) //----- //
module attributes {torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_12x3xf32 : memref<12x3xf32> = dense<[[-0.259240121, -0.234688252, 0.510510147], [0.233562827, -0.0331445783, 0.384852856], [-0.508802652, 0.173100084, -0.456325561], [0.334649473, 0.101393677, -0.0848175361], [0.415013522, 0.548246503, -0.0517567173], [0.558391511, -0.239463642, -0.212957352], [0.0163944438, -0.32234925, 0.205953121], [-0.284711599, 0.075589411, 0.142221317], [-5.766300e-01, -0.231847823, -0.161687583], [-0.538891375, 0.341592878, -0.576503336], [0.443732411, -0.319553018, -0.167551935], [0.142661244, 0.165032223, -0.576377869]]>
  memref.global "private" constant @__constant_3x12xf32 : memref<3x12xf32> = dense<[[0.161275461, 0.0990483835, 0.140225306, 0.0738267228, -0.0230169389, -0.191564813, 0.1457607, 0.197757319, -0.0972366183, 0.126508623, 0.139206693, -0.0688978806], [-0.176147208, -0.213960767, -0.198053509, -0.0384910479, -0.245581821, 0.139692709, -2.673340e-01, -0.223085925, -0.196028829, -0.226647332, -0.0104687046, 0.127765238], [0.0994836315, -0.128047019, -0.0917707682, 0.115462713, 0.0437031351, -0.0613443516, 0.0145246265, 0.240862086, 0.133553818, -0.0305191949, -0.286686301, -0.204464972]]>
  func.func @forward(%arg0: memref<4x3xf32>) -> memref<4x3xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = memref.get_global @__constant_3x12xf32 : memref<3x12xf32>
    %1 = memref.get_global @__constant_12x3xf32 : memref<12x3xf32>
    %2 = memref.alloca() {alignment = 64 : i64} : memref<3x12xf32>
    FDRA.KernelCall @forward_kernel_0(%1, %2) : (memref<12x3xf32>, memref<3x12xf32>) -> ()
    %3 = memref.alloca() : memref<4x12xf32>
    FDRA.KernelCall @forward_kernel_1(%3) : (memref<4x12xf32>) -> ()
    %4 = memref.alloca() : memref<4x12xf32>
    memref.copy %3, %4 : memref<4x12xf32> to memref<4x12xf32>
    FDRA.KernelCall @forward_kernel_2(%arg0, %2, %4) : (memref<4x3xf32>, memref<3x12xf32>, memref<4x12xf32>) -> ()
    %5 = memref.alloca() {alignment = 64 : i64} : memref<12x3xf32>
    FDRA.KernelCall @forward_kernel_3(%0, %5) : (memref<3x12xf32>, memref<12x3xf32>) -> ()
    %6 = memref.alloca() : memref<4x3xf32>
    FDRA.KernelCall @forward_kernel_4(%6) : (memref<4x3xf32>) -> ()
    %7 = memref.alloc() {alignment = 64 : i64} : memref<4x3xf32>
    memref.copy %6, %7 : memref<4x3xf32> to memref<4x3xf32>
    FDRA.KernelCall @forward_kernel_5(%4, %5, %7) : (memref<4x12xf32>, memref<12x3xf32>, memref<4x3xf32>) -> ()
    return %7 : memref<4x3xf32>
  }
  func.func @forward_kernel_0(%arg0: memref<12x3xf32>, %arg1: memref<3x12xf32>) attributes {Kernel, forward_kernel_0} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    %c0 = arith.constant 0 : index
    %c12 = arith.constant 12 : index
    %c1 = arith.constant 1 : index
    scf.for %arg2 = %c0 to %c12 step %c1 {
      %c0_0 = arith.constant 0 : index
      %c3 = arith.constant 3 : index
      %c1_1 = arith.constant 1 : index
      scf.for %arg3 = %c0_0 to %c3 step %c1_1 {
        %0 = memref.load %arg0[%arg2, %arg3] : memref<12x3xf32>
        memref.store %0, %arg1[%arg3, %arg2] : memref<3x12xf32>
      }
    }
    return
  }
  func.func @forward_kernel_1(%arg0: memref<4x12xf32>) attributes {Kernel, forward_kernel_1} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %c1 = arith.constant 1 : index
    scf.for %arg1 = %c0 to %c4 step %c1 {
      %c0_0 = arith.constant 0 : index
      %c12 = arith.constant 12 : index
      %c1_1 = arith.constant 1 : index
      scf.for %arg2 = %c0_0 to %c12 step %c1_1 {
        memref.store %cst, %arg0[%arg1, %arg2] : memref<4x12xf32>
      }
    }
    return
  }
  func.func @forward_kernel_2(%arg0: memref<4x3xf32>, %arg1: memref<3x12xf32>, %arg2: memref<4x12xf32>) attributes {Kernel, forward_kernel_2} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %c1 = arith.constant 1 : index
    scf.for %arg3 = %c0 to %c4 step %c1 {
      %c0_0 = arith.constant 0 : index
      %c12 = arith.constant 12 : index
      %c1_1 = arith.constant 1 : index
      scf.for %arg4 = %c0_0 to %c12 step %c1_1 {
        %c0_2 = arith.constant 0 : index
        %c3 = arith.constant 3 : index
        %c1_3 = arith.constant 1 : index
        scf.for %arg5 = %c0_2 to %c3 step %c1_3 {
          %0 = memref.load %arg0[%arg3, %arg5] : memref<4x3xf32>
          %1 = memref.load %arg1[%arg5, %arg4] : memref<3x12xf32>
          %2 = memref.load %arg2[%arg3, %arg4] : memref<4x12xf32>
          %3 = arith.mulf %0, %1 : f32
          %4 = arith.addf %2, %3 : f32
          memref.store %4, %arg2[%arg3, %arg4] : memref<4x12xf32>
        }
      }
    }
    return
  }
  func.func @forward_kernel_3(%arg0: memref<3x12xf32>, %arg1: memref<12x3xf32>) attributes {Kernel, forward_kernel_3} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    %c0 = arith.constant 0 : index
    %c3 = arith.constant 3 : index
    %c1 = arith.constant 1 : index
    scf.for %arg2 = %c0 to %c3 step %c1 {
      %c0_0 = arith.constant 0 : index
      %c12 = arith.constant 12 : index
      %c1_1 = arith.constant 1 : index
      scf.for %arg3 = %c0_0 to %c12 step %c1_1 {
        %0 = memref.load %arg0[%arg2, %arg3] : memref<3x12xf32>
        memref.store %0, %arg1[%arg3, %arg2] : memref<12x3xf32>
      }
    }
    return
  }
  func.func @forward_kernel_4(%arg0: memref<4x3xf32>) attributes {Kernel, forward_kernel_4} {
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
  func.func @forward_kernel_5(%arg0: memref<4x12xf32>, %arg1: memref<12x3xf32>, %arg2: memref<4x3xf32>) attributes {Kernel, forward_kernel_5} {
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
        %c12 = arith.constant 12 : index
        %c1_3 = arith.constant 1 : index
        scf.for %arg5 = %c0_2 to %c12 step %c1_3 {
          %0 = memref.load %arg0[%arg3, %arg5] : memref<4x12xf32>
          %1 = memref.load %arg1[%arg5, %arg4] : memref<12x3xf32>
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
  memref.global "private" constant @__constant_12x3xf32 : memref<12x3xf32> = dense<[[-0.259240121, -0.234688252, 0.510510147], [0.233562827, -0.0331445783, 0.384852856], [-0.508802652, 0.173100084, -0.456325561], [0.334649473, 0.101393677, -0.0848175361], [0.415013522, 0.548246503, -0.0517567173], [0.558391511, -0.239463642, -0.212957352], [0.0163944438, -0.32234925, 0.205953121], [-0.284711599, 0.075589411, 0.142221317], [-5.766300e-01, -0.231847823, -0.161687583], [-0.538891375, 0.341592878, -0.576503336], [0.443732411, -0.319553018, -0.167551935], [0.142661244, 0.165032223, -0.576377869]]>
  memref.global "private" constant @__constant_3x12xf32 : memref<3x12xf32> = dense<[[0.161275461, 0.0990483835, 0.140225306, 0.0738267228, -0.0230169389, -0.191564813, 0.1457607, 0.197757319, -0.0972366183, 0.126508623, 0.139206693, -0.0688978806], [-0.176147208, -0.213960767, -0.198053509, -0.0384910479, -0.245581821, 0.139692709, -2.673340e-01, -0.223085925, -0.196028829, -0.226647332, -0.0104687046, 0.127765238], [0.0994836315, -0.128047019, -0.0917707682, 0.115462713, 0.0437031351, -0.0613443516, 0.0145246265, 0.240862086, 0.133553818, -0.0305191949, -0.286686301, -0.204464972]]>
  func.func @forward(%arg0: memref<4x3xf32>) -> memref<4x3xf32> {
    %0 = memref.get_global @__constant_3x12xf32 : memref<3x12xf32>
    %1 = memref.get_global @__constant_12x3xf32 : memref<12x3xf32>
    %2 = memref.alloca() {alignment = 64 : i64} : memref<3x12xf32>
    FDRA.KernelCall @forward_kernel_0(%1, %2) : (memref<12x3xf32>, memref<3x12xf32>) -> ()
    %3 = memref.alloca() : memref<4x12xf32>
    FDRA.KernelCall @forward_kernel_1(%3) : (memref<4x12xf32>) -> ()
    %4 = memref.alloca() : memref<4x12xf32>
    memref.copy %3, %4 : memref<4x12xf32> to memref<4x12xf32>
    FDRA.KernelCall @forward_kernel_2(%arg0, %2, %4) : (memref<4x3xf32>, memref<3x12xf32>, memref<4x12xf32>) -> ()
    %5 = memref.alloca() {alignment = 64 : i64} : memref<12x3xf32>
    FDRA.KernelCall @forward_kernel_3(%0, %5) : (memref<3x12xf32>, memref<12x3xf32>) -> ()
    %6 = memref.alloca() : memref<4x3xf32>
    FDRA.KernelCall @forward_kernel_4(%6) : (memref<4x3xf32>) -> ()
    %7 = memref.alloc() {alignment = 64 : i64} : memref<4x3xf32>
    memref.copy %6, %7 : memref<4x3xf32> to memref<4x3xf32>
    FDRA.KernelCall @forward_kernel_5(%4, %5, %7) : (memref<4x12xf32>, memref<12x3xf32>, memref<4x3xf32>) -> ()
    return %7 : memref<4x3xf32>
  }
  func.func @forward_kernel_0(%arg0: memref<12x3xf32>, %arg1: memref<3x12xf32>) attributes {Kernel, forward_kernel_0} {
    %c3 = arith.constant 3 : index
    %c1 = arith.constant 1 : index
    %c12 = arith.constant 12 : index
    %c0 = arith.constant 0 : index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    scf.for %arg2 = %c0 to %c12 step %c1 {
      scf.for %arg3 = %c0 to %c3 step %c1 {
        %0 = memref.load %arg0[%arg2, %arg3] : memref<12x3xf32>
        memref.store %0, %arg1[%arg3, %arg2] : memref<3x12xf32>
      }
    }
    return
  }
  func.func @forward_kernel_1(%arg0: memref<4x12xf32>) attributes {Kernel, forward_kernel_1} {
    %c12 = arith.constant 12 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    scf.for %arg1 = %c0 to %c4 step %c1 {
      scf.for %arg2 = %c0 to %c12 step %c1 {
        memref.store %cst, %arg0[%arg1, %arg2] : memref<4x12xf32>
      }
    }
    return
  }
  func.func @forward_kernel_2(%arg0: memref<4x3xf32>, %arg1: memref<3x12xf32>, %arg2: memref<4x12xf32>) attributes {Kernel, forward_kernel_2} {
    %c3 = arith.constant 3 : index
    %c12 = arith.constant 12 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c0 = arith.constant 0 : index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    scf.for %arg3 = %c0 to %c4 step %c1 {
      scf.for %arg4 = %c0 to %c12 step %c1 {
        scf.for %arg5 = %c0 to %c3 step %c1 {
          %0 = memref.load %arg0[%arg3, %arg5] : memref<4x3xf32>
          %1 = memref.load %arg1[%arg5, %arg4] : memref<3x12xf32>
          %2 = memref.load %arg2[%arg3, %arg4] : memref<4x12xf32>
          %3 = arith.mulf %0, %1 : f32
          %4 = arith.addf %2, %3 : f32
          memref.store %4, %arg2[%arg3, %arg4] : memref<4x12xf32>
        }
      }
    }
    return
  }
  func.func @forward_kernel_3(%arg0: memref<3x12xf32>, %arg1: memref<12x3xf32>) attributes {Kernel, forward_kernel_3} {
    %c12 = arith.constant 12 : index
    %c1 = arith.constant 1 : index
    %c3 = arith.constant 3 : index
    %c0 = arith.constant 0 : index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    scf.for %arg2 = %c0 to %c3 step %c1 {
      scf.for %arg3 = %c0 to %c12 step %c1 {
        %0 = memref.load %arg0[%arg2, %arg3] : memref<3x12xf32>
        memref.store %0, %arg1[%arg3, %arg2] : memref<12x3xf32>
      }
    }
    return
  }
  func.func @forward_kernel_4(%arg0: memref<4x3xf32>) attributes {Kernel, forward_kernel_4} {
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
  func.func @forward_kernel_5(%arg0: memref<4x12xf32>, %arg1: memref<12x3xf32>, %arg2: memref<4x3xf32>) attributes {Kernel, forward_kernel_5} {
    %c12 = arith.constant 12 : index
    %c3 = arith.constant 3 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c0 = arith.constant 0 : index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    scf.for %arg3 = %c0 to %c4 step %c1 {
      scf.for %arg4 = %c0 to %c3 step %c1 {
        scf.for %arg5 = %c0 to %c12 step %c1 {
          %0 = memref.load %arg0[%arg3, %arg5] : memref<4x12xf32>
          %1 = memref.load %arg1[%arg5, %arg4] : memref<12x3xf32>
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
  memref.global "private" constant @__constant_12x3xf32 : memref<12x3xf32> = dense<[[-0.259240121, -0.234688252, 0.510510147], [0.233562827, -0.0331445783, 0.384852856], [-0.508802652, 0.173100084, -0.456325561], [0.334649473, 0.101393677, -0.0848175361], [0.415013522, 0.548246503, -0.0517567173], [0.558391511, -0.239463642, -0.212957352], [0.0163944438, -0.32234925, 0.205953121], [-0.284711599, 0.075589411, 0.142221317], [-5.766300e-01, -0.231847823, -0.161687583], [-0.538891375, 0.341592878, -0.576503336], [0.443732411, -0.319553018, -0.167551935], [0.142661244, 0.165032223, -0.576377869]]>
  memref.global "private" constant @__constant_3x12xf32 : memref<3x12xf32> = dense<[[0.161275461, 0.0990483835, 0.140225306, 0.0738267228, -0.0230169389, -0.191564813, 0.1457607, 0.197757319, -0.0972366183, 0.126508623, 0.139206693, -0.0688978806], [-0.176147208, -0.213960767, -0.198053509, -0.0384910479, -0.245581821, 0.139692709, -2.673340e-01, -0.223085925, -0.196028829, -0.226647332, -0.0104687046, 0.127765238], [0.0994836315, -0.128047019, -0.0917707682, 0.115462713, 0.0437031351, -0.0613443516, 0.0145246265, 0.240862086, 0.133553818, -0.0305191949, -0.286686301, -0.204464972]]>
  func.func @forward(%arg0: memref<4x3xf32>) -> memref<4x3xf32> {
    %0 = memref.get_global @__constant_3x12xf32 : memref<3x12xf32>
    %1 = memref.get_global @__constant_12x3xf32 : memref<12x3xf32>
    %2 = memref.alloca() {alignment = 64 : i64} : memref<3x12xf32>
    FDRA.KernelCall @forward_kernel_0(%1, %2) : (memref<12x3xf32>, memref<3x12xf32>) -> ()
    %3 = memref.alloca() : memref<4x12xf32>
    FDRA.KernelCall @forward_kernel_1(%3) : (memref<4x12xf32>) -> ()
    %4 = memref.alloca() : memref<4x12xf32>
    memref.copy %3, %4 : memref<4x12xf32> to memref<4x12xf32>
    FDRA.KernelCall @forward_kernel_2(%arg0, %2, %4) : (memref<4x3xf32>, memref<3x12xf32>, memref<4x12xf32>) -> ()
    %5 = memref.alloca() {alignment = 64 : i64} : memref<12x3xf32>
    FDRA.KernelCall @forward_kernel_3(%0, %5) : (memref<3x12xf32>, memref<12x3xf32>) -> ()
    %6 = memref.alloca() : memref<4x3xf32>
    FDRA.KernelCall @forward_kernel_4(%6) : (memref<4x3xf32>) -> ()
    %7 = memref.alloc() {alignment = 64 : i64} : memref<4x3xf32>
    memref.copy %6, %7 : memref<4x3xf32> to memref<4x3xf32>
    FDRA.KernelCall @forward_kernel_5(%4, %5, %7) : (memref<4x12xf32>, memref<12x3xf32>, memref<4x3xf32>) -> ()
    return %7 : memref<4x3xf32>
  }
  func.func @forward_kernel_0(%arg0: memref<12x3xf32>, %arg1: memref<3x12xf32>) attributes {Kernel, forward_kernel_0} {
    %c3 = arith.constant 3 : index
    %c1 = arith.constant 1 : index
    %c12 = arith.constant 12 : index
    %c0 = arith.constant 0 : index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%c0 : index)
  ^bb2(%0: index):  // 2 preds: ^bb1, ^bb6
    %1 = arith.cmpi slt, %0, %c12 : index
    cf.cond_br %1, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    cf.br ^bb4(%c0 : index)
  ^bb4(%2: index):  // 2 preds: ^bb3, ^bb5
    %3 = arith.cmpi slt, %2, %c3 : index
    cf.cond_br %3, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %4 = memref.load %arg0[%0, %2] : memref<12x3xf32>
    memref.store %4, %arg1[%2, %0] : memref<3x12xf32>
    %5 = arith.addi %2, %c1 : index
    cf.br ^bb4(%5 : index)
  ^bb6:  // pred: ^bb4
    %6 = arith.addi %0, %c1 : index
    cf.br ^bb2(%6 : index)
  ^bb7:  // pred: ^bb2
    return
  }
  func.func @forward_kernel_1(%arg0: memref<4x12xf32>) attributes {Kernel, forward_kernel_1} {
    %c12 = arith.constant 12 : index
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
    %3 = arith.cmpi slt, %2, %c12 : index
    cf.cond_br %3, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    memref.store %cst, %arg0[%0, %2] : memref<4x12xf32>
    %4 = arith.addi %2, %c1 : index
    cf.br ^bb4(%4 : index)
  ^bb6:  // pred: ^bb4
    %5 = arith.addi %0, %c1 : index
    cf.br ^bb2(%5 : index)
  ^bb7:  // pred: ^bb2
    return
  }
  func.func @forward_kernel_2(%arg0: memref<4x3xf32>, %arg1: memref<3x12xf32>, %arg2: memref<4x12xf32>) attributes {Kernel, forward_kernel_2} {
    %c3 = arith.constant 3 : index
    %c12 = arith.constant 12 : index
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
    %3 = arith.cmpi slt, %2, %c12 : index
    cf.cond_br %3, ^bb5, ^bb9
  ^bb5:  // pred: ^bb4
    cf.br ^bb6(%c0 : index)
  ^bb6(%4: index):  // 2 preds: ^bb5, ^bb7
    %5 = arith.cmpi slt, %4, %c3 : index
    cf.cond_br %5, ^bb7, ^bb8
  ^bb7:  // pred: ^bb6
    %6 = memref.load %arg0[%0, %4] : memref<4x3xf32>
    %7 = memref.load %arg1[%4, %2] : memref<3x12xf32>
    %8 = memref.load %arg2[%0, %2] : memref<4x12xf32>
    %9 = arith.mulf %6, %7 : f32
    %10 = arith.addf %8, %9 : f32
    memref.store %10, %arg2[%0, %2] : memref<4x12xf32>
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
  func.func @forward_kernel_3(%arg0: memref<3x12xf32>, %arg1: memref<12x3xf32>) attributes {Kernel, forward_kernel_3} {
    %c12 = arith.constant 12 : index
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
    %3 = arith.cmpi slt, %2, %c12 : index
    cf.cond_br %3, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %4 = memref.load %arg0[%0, %2] : memref<3x12xf32>
    memref.store %4, %arg1[%2, %0] : memref<12x3xf32>
    %5 = arith.addi %2, %c1 : index
    cf.br ^bb4(%5 : index)
  ^bb6:  // pred: ^bb4
    %6 = arith.addi %0, %c1 : index
    cf.br ^bb2(%6 : index)
  ^bb7:  // pred: ^bb2
    return
  }
  func.func @forward_kernel_4(%arg0: memref<4x3xf32>) attributes {Kernel, forward_kernel_4} {
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
  func.func @forward_kernel_5(%arg0: memref<4x12xf32>, %arg1: memref<12x3xf32>, %arg2: memref<4x3xf32>) attributes {Kernel, forward_kernel_5} {
    %c12 = arith.constant 12 : index
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
    %5 = arith.cmpi slt, %4, %c12 : index
    cf.cond_br %5, ^bb7, ^bb8
  ^bb7:  // pred: ^bb6
    %6 = memref.load %arg0[%0, %4] : memref<4x12xf32>
    %7 = memref.load %arg1[%4, %2] : memref<12x3xf32>
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
  memref.global "private" constant @__constant_12x3xf32 : memref<12x3xf32> = dense<[[-0.259240121, -0.234688252, 0.510510147], [0.233562827, -0.0331445783, 0.384852856], [-0.508802652, 0.173100084, -0.456325561], [0.334649473, 0.101393677, -0.0848175361], [0.415013522, 0.548246503, -0.0517567173], [0.558391511, -0.239463642, -0.212957352], [0.0163944438, -0.32234925, 0.205953121], [-0.284711599, 0.075589411, 0.142221317], [-5.766300e-01, -0.231847823, -0.161687583], [-0.538891375, 0.341592878, -0.576503336], [0.443732411, -0.319553018, -0.167551935], [0.142661244, 0.165032223, -0.576377869]]>
  memref.global "private" constant @__constant_3x12xf32 : memref<3x12xf32> = dense<[[0.161275461, 0.0990483835, 0.140225306, 0.0738267228, -0.0230169389, -0.191564813, 0.1457607, 0.197757319, -0.0972366183, 0.126508623, 0.139206693, -0.0688978806], [-0.176147208, -0.213960767, -0.198053509, -0.0384910479, -0.245581821, 0.139692709, -2.673340e-01, -0.223085925, -0.196028829, -0.226647332, -0.0104687046, 0.127765238], [0.0994836315, -0.128047019, -0.0917707682, 0.115462713, 0.0437031351, -0.0613443516, 0.0145246265, 0.240862086, 0.133553818, -0.0305191949, -0.286686301, -0.204464972]]>
  func.func @forward(%arg0: memref<4x3xf32>) -> memref<4x3xf32> {
    %0 = memref.get_global @__constant_3x12xf32 : memref<3x12xf32>
    %1 = memref.get_global @__constant_12x3xf32 : memref<12x3xf32>
    %2 = memref.alloca() {alignment = 64 : i64} : memref<3x12xf32>
    FDRA.KernelCall @forward_kernel_0(%1, %2) : (memref<12x3xf32>, memref<3x12xf32>) -> ()
    %3 = memref.alloca() : memref<4x12xf32>
    FDRA.KernelCall @forward_kernel_1(%3) : (memref<4x12xf32>) -> ()
    %4 = memref.alloca() : memref<4x12xf32>
    memref.copy %3, %4 : memref<4x12xf32> to memref<4x12xf32>
    FDRA.KernelCall @forward_kernel_2(%arg0, %2, %4) : (memref<4x3xf32>, memref<3x12xf32>, memref<4x12xf32>) -> ()
    %5 = memref.alloca() {alignment = 64 : i64} : memref<12x3xf32>
    FDRA.KernelCall @forward_kernel_3(%0, %5) : (memref<3x12xf32>, memref<12x3xf32>) -> ()
    %6 = memref.alloca() : memref<4x3xf32>
    FDRA.KernelCall @forward_kernel_4(%6) : (memref<4x3xf32>) -> ()
    %7 = memref.alloc() {alignment = 64 : i64} : memref<4x3xf32>
    memref.copy %6, %7 : memref<4x3xf32> to memref<4x3xf32>
    FDRA.KernelCall @forward_kernel_5(%4, %5, %7) : (memref<4x12xf32>, memref<12x3xf32>, memref<4x3xf32>) -> ()
    return %7 : memref<4x3xf32>
  }
  func.func @forward_kernel_0(%arg0: memref<12x3xf32>, %arg1: memref<3x12xf32>) attributes {Kernel, forward_kernel_0} {
    %c3 = arith.constant 3 : index
    %c1 = arith.constant 1 : index
    %c12 = arith.constant 12 : index
    %c0 = arith.constant 0 : index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%c0 : index)
  ^bb2(%0: index):  // 2 preds: ^bb1, ^bb6
    %1 = arith.cmpi slt, %0, %c12 : index
    cf.cond_br %1, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    cf.br ^bb4(%c0 : index)
  ^bb4(%2: index):  // 2 preds: ^bb3, ^bb5
    %3 = arith.cmpi slt, %2, %c3 : index
    cf.cond_br %3, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %4 = memref.load %arg0[%0, %2] : memref<12x3xf32>
    memref.store %4, %arg1[%2, %0] : memref<3x12xf32>
    %5 = arith.addi %2, %c1 : index
    cf.br ^bb4(%5 : index)
  ^bb6:  // pred: ^bb4
    %6 = arith.addi %0, %c1 : index
    cf.br ^bb2(%6 : index)
  ^bb7:  // pred: ^bb2
    return
  }
  func.func @forward_kernel_1(%arg0: memref<4x12xf32>) attributes {Kernel, forward_kernel_1} {
    %c12 = arith.constant 12 : index
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
    %3 = arith.cmpi slt, %2, %c12 : index
    cf.cond_br %3, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    memref.store %cst, %arg0[%0, %2] : memref<4x12xf32>
    %4 = arith.addi %2, %c1 : index
    cf.br ^bb4(%4 : index)
  ^bb6:  // pred: ^bb4
    %5 = arith.addi %0, %c1 : index
    cf.br ^bb2(%5 : index)
  ^bb7:  // pred: ^bb2
    return
  }
  func.func @forward_kernel_2(%arg0: memref<4x3xf32>, %arg1: memref<3x12xf32>, %arg2: memref<4x12xf32>) attributes {Kernel, forward_kernel_2} {
    %c3 = arith.constant 3 : index
    %c12 = arith.constant 12 : index
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
    %3 = arith.cmpi slt, %2, %c12 : index
    cf.cond_br %3, ^bb5, ^bb9
  ^bb5:  // pred: ^bb4
    cf.br ^bb6(%c0 : index)
  ^bb6(%4: index):  // 2 preds: ^bb5, ^bb7
    %5 = arith.cmpi slt, %4, %c3 : index
    cf.cond_br %5, ^bb7, ^bb8
  ^bb7:  // pred: ^bb6
    %6 = memref.load %arg0[%0, %4] : memref<4x3xf32>
    %7 = memref.load %arg1[%4, %2] : memref<3x12xf32>
    %8 = memref.load %arg2[%0, %2] : memref<4x12xf32>
    %9 = arith.mulf %6, %7 : f32
    %10 = arith.addf %8, %9 : f32
    memref.store %10, %arg2[%0, %2] : memref<4x12xf32>
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
  func.func @forward_kernel_3(%arg0: memref<3x12xf32>, %arg1: memref<12x3xf32>) attributes {Kernel, forward_kernel_3} {
    %c12 = arith.constant 12 : index
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
    %3 = arith.cmpi slt, %2, %c12 : index
    cf.cond_br %3, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %4 = memref.load %arg0[%0, %2] : memref<3x12xf32>
    memref.store %4, %arg1[%2, %0] : memref<12x3xf32>
    %5 = arith.addi %2, %c1 : index
    cf.br ^bb4(%5 : index)
  ^bb6:  // pred: ^bb4
    %6 = arith.addi %0, %c1 : index
    cf.br ^bb2(%6 : index)
  ^bb7:  // pred: ^bb2
    return
  }
  func.func @forward_kernel_4(%arg0: memref<4x3xf32>) attributes {Kernel, forward_kernel_4} {
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
  func.func @forward_kernel_5(%arg0: memref<4x12xf32>, %arg1: memref<12x3xf32>, %arg2: memref<4x3xf32>) attributes {Kernel, forward_kernel_5} {
    %c12 = arith.constant 12 : index
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
    %5 = arith.cmpi slt, %4, %c12 : index
    cf.cond_br %5, ^bb7, ^bb8
  ^bb7:  // pred: ^bb6
    %6 = memref.load %arg0[%0, %4] : memref<4x12xf32>
    %7 = memref.load %arg1[%4, %2] : memref<12x3xf32>
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
  memref.global "private" constant @__constant_12x3xf32 : memref<12x3xf32> = dense<[[-0.259240121, -0.234688252, 0.510510147], [0.233562827, -0.0331445783, 0.384852856], [-0.508802652, 0.173100084, -0.456325561], [0.334649473, 0.101393677, -0.0848175361], [0.415013522, 0.548246503, -0.0517567173], [0.558391511, -0.239463642, -0.212957352], [0.0163944438, -0.32234925, 0.205953121], [-0.284711599, 0.075589411, 0.142221317], [-5.766300e-01, -0.231847823, -0.161687583], [-0.538891375, 0.341592878, -0.576503336], [0.443732411, -0.319553018, -0.167551935], [0.142661244, 0.165032223, -0.576377869]]>
  memref.global "private" constant @__constant_3x12xf32 : memref<3x12xf32> = dense<[[0.161275461, 0.0990483835, 0.140225306, 0.0738267228, -0.0230169389, -0.191564813, 0.1457607, 0.197757319, -0.0972366183, 0.126508623, 0.139206693, -0.0688978806], [-0.176147208, -0.213960767, -0.198053509, -0.0384910479, -0.245581821, 0.139692709, -2.673340e-01, -0.223085925, -0.196028829, -0.226647332, -0.0104687046, 0.127765238], [0.0994836315, -0.128047019, -0.0917707682, 0.115462713, 0.0437031351, -0.0613443516, 0.0145246265, 0.240862086, 0.133553818, -0.0305191949, -0.286686301, -0.204464972]]>
  func.func @forward(%arg0: memref<4x3xf32>) -> memref<4x3xf32> {
    %0 = memref.get_global @__constant_3x12xf32 : memref<3x12xf32>
    %1 = memref.get_global @__constant_12x3xf32 : memref<12x3xf32>
    %2 = memref.alloca() {alignment = 64 : i64} : memref<3x12xf32>
    FDRA.KernelCall @forward_kernel_0(%1, %2) : (memref<12x3xf32>, memref<3x12xf32>) -> ()
    %3 = memref.alloca() : memref<4x12xf32>
    FDRA.KernelCall @forward_kernel_1(%3) : (memref<4x12xf32>) -> ()
    %4 = memref.alloca() : memref<4x12xf32>
    memref.copy %3, %4 : memref<4x12xf32> to memref<4x12xf32>
    FDRA.KernelCall @forward_kernel_2(%arg0, %2, %4) : (memref<4x3xf32>, memref<3x12xf32>, memref<4x12xf32>) -> ()
    %5 = memref.alloca() {alignment = 64 : i64} : memref<12x3xf32>
    FDRA.KernelCall @forward_kernel_3(%0, %5) : (memref<3x12xf32>, memref<12x3xf32>) -> ()
    %6 = memref.alloca() : memref<4x3xf32>
    FDRA.KernelCall @forward_kernel_4(%6) : (memref<4x3xf32>) -> ()
    %7 = memref.alloc() {alignment = 64 : i64} : memref<4x3xf32>
    memref.copy %6, %7 : memref<4x3xf32> to memref<4x3xf32>
    FDRA.KernelCall @forward_kernel_5(%4, %5, %7) : (memref<4x12xf32>, memref<12x3xf32>, memref<4x3xf32>) -> ()
    return %7 : memref<4x3xf32>
  }
  func.func @forward_kernel_0(%arg0: memref<12x3xf32>, %arg1: memref<3x12xf32>) attributes {Kernel, forward_kernel_0} {
    %c3 = arith.constant 3 : index
    %c1 = arith.constant 1 : index
    %c12 = arith.constant 12 : index
    %c0 = arith.constant 0 : index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%c0 : index)
  ^bb2(%0: index):  // 2 preds: ^bb1, ^bb6
    %1 = arith.cmpi slt, %0, %c12 : index
    cf.cond_br %1, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    cf.br ^bb4(%c0 : index)
  ^bb4(%2: index):  // 2 preds: ^bb3, ^bb5
    %3 = arith.cmpi slt, %2, %c3 : index
    cf.cond_br %3, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %4 = memref.load %arg0[%0, %2] : memref<12x3xf32>
    memref.store %4, %arg1[%2, %0] : memref<3x12xf32>
    %5 = arith.addi %2, %c1 : index
    cf.br ^bb4(%5 : index)
  ^bb6:  // pred: ^bb4
    %6 = arith.addi %0, %c1 : index
    cf.br ^bb2(%6 : index)
  ^bb7:  // pred: ^bb2
    return
  }
  func.func @forward_kernel_1(%arg0: memref<4x12xf32>) attributes {Kernel, forward_kernel_1} {
    %c12 = arith.constant 12 : index
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
    %3 = arith.cmpi slt, %2, %c12 : index
    cf.cond_br %3, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    memref.store %cst, %arg0[%0, %2] : memref<4x12xf32>
    %4 = arith.addi %2, %c1 : index
    cf.br ^bb4(%4 : index)
  ^bb6:  // pred: ^bb4
    %5 = arith.addi %0, %c1 : index
    cf.br ^bb2(%5 : index)
  ^bb7:  // pred: ^bb2
    return
  }
  func.func @forward_kernel_2(%arg0: memref<4x3xf32>, %arg1: memref<3x12xf32>, %arg2: memref<4x12xf32>) attributes {Kernel, forward_kernel_2} {
    %c3 = arith.constant 3 : index
    %c12 = arith.constant 12 : index
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
    %3 = arith.cmpi slt, %2, %c12 : index
    cf.cond_br %3, ^bb5, ^bb9
  ^bb5:  // pred: ^bb4
    cf.br ^bb6(%c0 : index)
  ^bb6(%4: index):  // 2 preds: ^bb5, ^bb7
    %5 = arith.cmpi slt, %4, %c3 : index
    cf.cond_br %5, ^bb7, ^bb8
  ^bb7:  // pred: ^bb6
    %6 = memref.load %arg0[%0, %4] : memref<4x3xf32>
    %7 = memref.load %arg1[%4, %2] : memref<3x12xf32>
    %8 = memref.load %arg2[%0, %2] : memref<4x12xf32>
    %9 = arith.mulf %6, %7 : f32
    %10 = arith.addf %8, %9 : f32
    memref.store %10, %arg2[%0, %2] : memref<4x12xf32>
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
  func.func @forward_kernel_3(%arg0: memref<3x12xf32>, %arg1: memref<12x3xf32>) attributes {Kernel, forward_kernel_3} {
    %c12 = arith.constant 12 : index
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
    %3 = arith.cmpi slt, %2, %c12 : index
    cf.cond_br %3, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %4 = memref.load %arg0[%0, %2] : memref<3x12xf32>
    memref.store %4, %arg1[%2, %0] : memref<12x3xf32>
    %5 = arith.addi %2, %c1 : index
    cf.br ^bb4(%5 : index)
  ^bb6:  // pred: ^bb4
    %6 = arith.addi %0, %c1 : index
    cf.br ^bb2(%6 : index)
  ^bb7:  // pred: ^bb2
    return
  }
  func.func @forward_kernel_4(%arg0: memref<4x3xf32>) attributes {Kernel, forward_kernel_4} {
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
  func.func @forward_kernel_5(%arg0: memref<4x12xf32>, %arg1: memref<12x3xf32>, %arg2: memref<4x3xf32>) attributes {Kernel, forward_kernel_5} {
    %c12 = arith.constant 12 : index
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
    %5 = arith.cmpi slt, %4, %c12 : index
    cf.cond_br %5, ^bb7, ^bb8
  ^bb7:  // pred: ^bb6
    %6 = memref.load %arg0[%0, %4] : memref<4x12xf32>
    %7 = memref.load %arg1[%4, %2] : memref<12x3xf32>
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
  memref.global "private" constant @__constant_12x3xf32 : memref<12x3xf32> = dense<[[-0.259240121, -0.234688252, 0.510510147], [0.233562827, -0.0331445783, 0.384852856], [-0.508802652, 0.173100084, -0.456325561], [0.334649473, 0.101393677, -0.0848175361], [0.415013522, 0.548246503, -0.0517567173], [0.558391511, -0.239463642, -0.212957352], [0.0163944438, -0.32234925, 0.205953121], [-0.284711599, 0.075589411, 0.142221317], [-5.766300e-01, -0.231847823, -0.161687583], [-0.538891375, 0.341592878, -0.576503336], [0.443732411, -0.319553018, -0.167551935], [0.142661244, 0.165032223, -0.576377869]]>
  memref.global "private" constant @__constant_3x12xf32 : memref<3x12xf32> = dense<[[0.161275461, 0.0990483835, 0.140225306, 0.0738267228, -0.0230169389, -0.191564813, 0.1457607, 0.197757319, -0.0972366183, 0.126508623, 0.139206693, -0.0688978806], [-0.176147208, -0.213960767, -0.198053509, -0.0384910479, -0.245581821, 0.139692709, -2.673340e-01, -0.223085925, -0.196028829, -0.226647332, -0.0104687046, 0.127765238], [0.0994836315, -0.128047019, -0.0917707682, 0.115462713, 0.0437031351, -0.0613443516, 0.0145246265, 0.240862086, 0.133553818, -0.0305191949, -0.286686301, -0.204464972]]>
  func.func @forward(%arg0: memref<4x3xf32>) -> memref<4x3xf32> {
    %0 = memref.get_global @__constant_3x12xf32 : memref<3x12xf32>
    %1 = memref.get_global @__constant_12x3xf32 : memref<12x3xf32>
    %2 = memref.alloca() {alignment = 64 : i64} : memref<3x12xf32>
    FDRA.KernelCall @forward_kernel_0(%1, %2) : (memref<12x3xf32>, memref<3x12xf32>) -> ()
    %3 = memref.alloca() : memref<4x12xf32>
    FDRA.KernelCall @forward_kernel_1(%3) : (memref<4x12xf32>) -> ()
    %4 = memref.alloca() : memref<4x12xf32>
    memref.copy %3, %4 : memref<4x12xf32> to memref<4x12xf32>
    FDRA.KernelCall @forward_kernel_2(%arg0, %2, %4) : (memref<4x3xf32>, memref<3x12xf32>, memref<4x12xf32>) -> ()
    %5 = memref.alloca() {alignment = 64 : i64} : memref<12x3xf32>
    FDRA.KernelCall @forward_kernel_3(%0, %5) : (memref<3x12xf32>, memref<12x3xf32>) -> ()
    %6 = memref.alloca() : memref<4x3xf32>
    FDRA.KernelCall @forward_kernel_4(%6) : (memref<4x3xf32>) -> ()
    %7 = memref.alloc() {alignment = 64 : i64} : memref<4x3xf32>
    memref.copy %6, %7 : memref<4x3xf32> to memref<4x3xf32>
    FDRA.KernelCall @forward_kernel_5(%4, %5, %7) : (memref<4x12xf32>, memref<12x3xf32>, memref<4x3xf32>) -> ()
    return %7 : memref<4x3xf32>
  }
  func.func @forward_kernel_0(%arg0: memref<12x3xf32>, %arg1: memref<3x12xf32>) attributes {Kernel, forward_kernel_0} {
    %0 = llvm.mlir.constant(3 : index) : i64
    %1 = llvm.mlir.constant(1 : index) : i64
    %2 = llvm.mlir.constant(12 : index) : i64
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = builtin.unrealized_conversion_cast %3 : i64 to index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%4 : index)
  ^bb2(%5: index):  // 2 preds: ^bb1, ^bb6
    %6 = builtin.unrealized_conversion_cast %5 : index to i64
    %7 = llvm.icmp "slt" %6, %2 : i64
    cf.cond_br %7, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    cf.br ^bb4(%4 : index)
  ^bb4(%8: index):  // 2 preds: ^bb3, ^bb5
    %9 = builtin.unrealized_conversion_cast %8 : index to i64
    %10 = llvm.icmp "slt" %9, %0 : i64
    cf.cond_br %10, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %11 = memref.load %arg0[%5, %8] : memref<12x3xf32>
    memref.store %11, %arg1[%8, %5] : memref<3x12xf32>
    %12 = llvm.add %9, %1  : i64
    %13 = builtin.unrealized_conversion_cast %12 : i64 to index
    cf.br ^bb4(%13 : index)
  ^bb6:  // pred: ^bb4
    %14 = llvm.add %6, %1  : i64
    %15 = builtin.unrealized_conversion_cast %14 : i64 to index
    cf.br ^bb2(%15 : index)
  ^bb7:  // pred: ^bb2
    return
  }
  func.func @forward_kernel_1(%arg0: memref<4x12xf32>) attributes {Kernel, forward_kernel_1} {
    %0 = llvm.mlir.constant(12 : index) : i64
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
    memref.store %5, %arg0[%6, %9] : memref<4x12xf32>
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
  func.func @forward_kernel_2(%arg0: memref<4x3xf32>, %arg1: memref<3x12xf32>, %arg2: memref<4x12xf32>) attributes {Kernel, forward_kernel_2} {
    %0 = llvm.mlir.constant(3 : index) : i64
    %1 = llvm.mlir.constant(12 : index) : i64
    %2 = llvm.mlir.constant(1 : index) : i64
    %3 = llvm.mlir.constant(4 : index) : i64
    %4 = llvm.mlir.constant(0 : index) : i64
    %5 = builtin.unrealized_conversion_cast %4 : i64 to index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%5 : index)
  ^bb2(%6: index):  // 2 preds: ^bb1, ^bb9
    %7 = builtin.unrealized_conversion_cast %6 : index to i64
    %8 = llvm.icmp "slt" %7, %3 : i64
    cf.cond_br %8, ^bb3, ^bb10
  ^bb3:  // pred: ^bb2
    cf.br ^bb4(%5 : index)
  ^bb4(%9: index):  // 2 preds: ^bb3, ^bb8
    %10 = builtin.unrealized_conversion_cast %9 : index to i64
    %11 = llvm.icmp "slt" %10, %1 : i64
    cf.cond_br %11, ^bb5, ^bb9
  ^bb5:  // pred: ^bb4
    cf.br ^bb6(%5 : index)
  ^bb6(%12: index):  // 2 preds: ^bb5, ^bb7
    %13 = builtin.unrealized_conversion_cast %12 : index to i64
    %14 = llvm.icmp "slt" %13, %0 : i64
    cf.cond_br %14, ^bb7, ^bb8
  ^bb7:  // pred: ^bb6
    %15 = memref.load %arg0[%6, %12] : memref<4x3xf32>
    %16 = memref.load %arg1[%12, %9] : memref<3x12xf32>
    %17 = memref.load %arg2[%6, %9] : memref<4x12xf32>
    %18 = llvm.fmul %15, %16  : f32
    %19 = llvm.fadd %17, %18  : f32
    memref.store %19, %arg2[%6, %9] : memref<4x12xf32>
    %20 = llvm.add %13, %2  : i64
    %21 = builtin.unrealized_conversion_cast %20 : i64 to index
    cf.br ^bb6(%21 : index)
  ^bb8:  // pred: ^bb6
    %22 = llvm.add %10, %2  : i64
    %23 = builtin.unrealized_conversion_cast %22 : i64 to index
    cf.br ^bb4(%23 : index)
  ^bb9:  // pred: ^bb4
    %24 = llvm.add %7, %2  : i64
    %25 = builtin.unrealized_conversion_cast %24 : i64 to index
    cf.br ^bb2(%25 : index)
  ^bb10:  // pred: ^bb2
    return
  }
  func.func @forward_kernel_3(%arg0: memref<3x12xf32>, %arg1: memref<12x3xf32>) attributes {Kernel, forward_kernel_3} {
    %0 = llvm.mlir.constant(12 : index) : i64
    %1 = llvm.mlir.constant(1 : index) : i64
    %2 = llvm.mlir.constant(3 : index) : i64
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = builtin.unrealized_conversion_cast %3 : i64 to index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%4 : index)
  ^bb2(%5: index):  // 2 preds: ^bb1, ^bb6
    %6 = builtin.unrealized_conversion_cast %5 : index to i64
    %7 = llvm.icmp "slt" %6, %2 : i64
    cf.cond_br %7, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    cf.br ^bb4(%4 : index)
  ^bb4(%8: index):  // 2 preds: ^bb3, ^bb5
    %9 = builtin.unrealized_conversion_cast %8 : index to i64
    %10 = llvm.icmp "slt" %9, %0 : i64
    cf.cond_br %10, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %11 = memref.load %arg0[%5, %8] : memref<3x12xf32>
    memref.store %11, %arg1[%8, %5] : memref<12x3xf32>
    %12 = llvm.add %9, %1  : i64
    %13 = builtin.unrealized_conversion_cast %12 : i64 to index
    cf.br ^bb4(%13 : index)
  ^bb6:  // pred: ^bb4
    %14 = llvm.add %6, %1  : i64
    %15 = builtin.unrealized_conversion_cast %14 : i64 to index
    cf.br ^bb2(%15 : index)
  ^bb7:  // pred: ^bb2
    return
  }
  func.func @forward_kernel_4(%arg0: memref<4x3xf32>) attributes {Kernel, forward_kernel_4} {
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
  func.func @forward_kernel_5(%arg0: memref<4x12xf32>, %arg1: memref<12x3xf32>, %arg2: memref<4x3xf32>) attributes {Kernel, forward_kernel_5} {
    %0 = llvm.mlir.constant(12 : index) : i64
    %1 = llvm.mlir.constant(3 : index) : i64
    %2 = llvm.mlir.constant(1 : index) : i64
    %3 = llvm.mlir.constant(4 : index) : i64
    %4 = llvm.mlir.constant(0 : index) : i64
    %5 = builtin.unrealized_conversion_cast %4 : i64 to index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%5 : index)
  ^bb2(%6: index):  // 2 preds: ^bb1, ^bb9
    %7 = builtin.unrealized_conversion_cast %6 : index to i64
    %8 = llvm.icmp "slt" %7, %3 : i64
    cf.cond_br %8, ^bb3, ^bb10
  ^bb3:  // pred: ^bb2
    cf.br ^bb4(%5 : index)
  ^bb4(%9: index):  // 2 preds: ^bb3, ^bb8
    %10 = builtin.unrealized_conversion_cast %9 : index to i64
    %11 = llvm.icmp "slt" %10, %1 : i64
    cf.cond_br %11, ^bb5, ^bb9
  ^bb5:  // pred: ^bb4
    cf.br ^bb6(%5 : index)
  ^bb6(%12: index):  // 2 preds: ^bb5, ^bb7
    %13 = builtin.unrealized_conversion_cast %12 : index to i64
    %14 = llvm.icmp "slt" %13, %0 : i64
    cf.cond_br %14, ^bb7, ^bb8
  ^bb7:  // pred: ^bb6
    %15 = memref.load %arg0[%6, %12] : memref<4x12xf32>
    %16 = memref.load %arg1[%12, %9] : memref<12x3xf32>
    %17 = memref.load %arg2[%6, %9] : memref<4x3xf32>
    %18 = llvm.fmul %15, %16  : f32
    %19 = llvm.fadd %17, %18  : f32
    memref.store %19, %arg2[%6, %9] : memref<4x3xf32>
    %20 = llvm.add %13, %2  : i64
    %21 = builtin.unrealized_conversion_cast %20 : i64 to index
    cf.br ^bb6(%21 : index)
  ^bb8:  // pred: ^bb6
    %22 = llvm.add %10, %2  : i64
    %23 = builtin.unrealized_conversion_cast %22 : i64 to index
    cf.br ^bb4(%23 : index)
  ^bb9:  // pred: ^bb4
    %24 = llvm.add %7, %2  : i64
    %25 = builtin.unrealized_conversion_cast %24 : i64 to index
    cf.br ^bb2(%25 : index)
  ^bb10:  // pred: ^bb2
    return
  }
}


[debug] not a kernel func
// -----// IR Dump After ConvertKernelCallToLLVM (fdra-convert-kernelcall-to-llvm) //----- //
module attributes {torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_12x3xf32 : memref<12x3xf32> = dense<[[-0.259240121, -0.234688252, 0.510510147], [0.233562827, -0.0331445783, 0.384852856], [-0.508802652, 0.173100084, -0.456325561], [0.334649473, 0.101393677, -0.0848175361], [0.415013522, 0.548246503, -0.0517567173], [0.558391511, -0.239463642, -0.212957352], [0.0163944438, -0.32234925, 0.205953121], [-0.284711599, 0.075589411, 0.142221317], [-5.766300e-01, -0.231847823, -0.161687583], [-0.538891375, 0.341592878, -0.576503336], [0.443732411, -0.319553018, -0.167551935], [0.142661244, 0.165032223, -0.576377869]]>
  memref.global "private" constant @__constant_3x12xf32 : memref<3x12xf32> = dense<[[0.161275461, 0.0990483835, 0.140225306, 0.0738267228, -0.0230169389, -0.191564813, 0.1457607, 0.197757319, -0.0972366183, 0.126508623, 0.139206693, -0.0688978806], [-0.176147208, -0.213960767, -0.198053509, -0.0384910479, -0.245581821, 0.139692709, -2.673340e-01, -0.223085925, -0.196028829, -0.226647332, -0.0104687046, 0.127765238], [0.0994836315, -0.128047019, -0.0917707682, 0.115462713, 0.0437031351, -0.0613443516, 0.0145246265, 0.240862086, 0.133553818, -0.0305191949, -0.286686301, -0.204464972]]>
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
    %13 = memref.get_global @__constant_3x12xf32 : memref<3x12xf32>
    %14 = builtin.unrealized_conversion_cast %13 : memref<3x12xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %15 = memref.get_global @__constant_12x3xf32 : memref<12x3xf32>
    %16 = builtin.unrealized_conversion_cast %15 : memref<12x3xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %17 = memref.alloca() {alignment = 64 : i64} : memref<3x12xf32>
    %18 = builtin.unrealized_conversion_cast %17 : memref<3x12xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %19 = llvm.extractvalue %16[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %20 = llvm.extractvalue %18[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_0(%19, %20) : (!llvm.ptr<f32>, !llvm.ptr<f32>) -> ()
    %21 = memref.alloca() : memref<4x12xf32>
    %22 = builtin.unrealized_conversion_cast %21 : memref<4x12xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %23 = llvm.extractvalue %22[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_1(%23) : (!llvm.ptr<f32>) -> ()
    %24 = memref.alloca() : memref<4x12xf32>
    %25 = builtin.unrealized_conversion_cast %24 : memref<4x12xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    memref.copy %21, %24 : memref<4x12xf32> to memref<4x12xf32>
    %26 = llvm.extractvalue %12[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %27 = llvm.extractvalue %18[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %28 = llvm.extractvalue %25[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_2(%26, %27, %28) : (!llvm.ptr<f32>, !llvm.ptr<f32>, !llvm.ptr<f32>) -> ()
    %29 = memref.alloca() {alignment = 64 : i64} : memref<12x3xf32>
    %30 = builtin.unrealized_conversion_cast %29 : memref<12x3xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %31 = llvm.extractvalue %14[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %32 = llvm.extractvalue %30[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_3(%31, %32) : (!llvm.ptr<f32>, !llvm.ptr<f32>) -> ()
    %33 = memref.alloca() : memref<4x3xf32>
    %34 = builtin.unrealized_conversion_cast %33 : memref<4x3xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %35 = llvm.extractvalue %34[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_4(%35) : (!llvm.ptr<f32>) -> ()
    %36 = memref.alloc() {alignment = 64 : i64} : memref<4x3xf32>
    %37 = builtin.unrealized_conversion_cast %36 : memref<4x3xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    memref.copy %33, %36 : memref<4x3xf32> to memref<4x3xf32>
    %38 = llvm.extractvalue %25[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %39 = llvm.extractvalue %30[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %40 = llvm.extractvalue %37[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_5(%38, %39, %40) : (!llvm.ptr<f32>, !llvm.ptr<f32>, !llvm.ptr<f32>) -> ()
    %41 = llvm.extractvalue %37[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.return %41 : !llvm.ptr<f32>
  }
  llvm.func @forward_kernel_0(!llvm.ptr<f32>, !llvm.ptr<f32>) attributes {Kernel, forward_kernel_0}
  llvm.func @forward_kernel_1(!llvm.ptr<f32>) attributes {Kernel, forward_kernel_1}
  llvm.func @forward_kernel_2(!llvm.ptr<f32>, !llvm.ptr<f32>, !llvm.ptr<f32>) attributes {Kernel, forward_kernel_2}
  llvm.func @forward_kernel_3(!llvm.ptr<f32>, !llvm.ptr<f32>) attributes {Kernel, forward_kernel_3}
  llvm.func @forward_kernel_4(!llvm.ptr<f32>) attributes {Kernel, forward_kernel_4}
  llvm.func @forward_kernel_5(!llvm.ptr<f32>, !llvm.ptr<f32>, !llvm.ptr<f32>) attributes {Kernel, forward_kernel_5}
}


// -----// IR Dump After ConvertFuncToLLVM (convert-func-to-llvm) //----- //
module attributes {llvm.data_layout = "", torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_12x3xf32 : memref<12x3xf32> = dense<[[-0.259240121, -0.234688252, 0.510510147], [0.233562827, -0.0331445783, 0.384852856], [-0.508802652, 0.173100084, -0.456325561], [0.334649473, 0.101393677, -0.0848175361], [0.415013522, 0.548246503, -0.0517567173], [0.558391511, -0.239463642, -0.212957352], [0.0163944438, -0.32234925, 0.205953121], [-0.284711599, 0.075589411, 0.142221317], [-5.766300e-01, -0.231847823, -0.161687583], [-0.538891375, 0.341592878, -0.576503336], [0.443732411, -0.319553018, -0.167551935], [0.142661244, 0.165032223, -0.576377869]]>
  memref.global "private" constant @__constant_3x12xf32 : memref<3x12xf32> = dense<[[0.161275461, 0.0990483835, 0.140225306, 0.0738267228, -0.0230169389, -0.191564813, 0.1457607, 0.197757319, -0.0972366183, 0.126508623, 0.139206693, -0.0688978806], [-0.176147208, -0.213960767, -0.198053509, -0.0384910479, -0.245581821, 0.139692709, -2.673340e-01, -0.223085925, -0.196028829, -0.226647332, -0.0104687046, 0.127765238], [0.0994836315, -0.128047019, -0.0917707682, 0.115462713, 0.0437031351, -0.0613443516, 0.0145246265, 0.240862086, 0.133553818, -0.0305191949, -0.286686301, -0.204464972]]>
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
    %13 = memref.get_global @__constant_3x12xf32 : memref<3x12xf32>
    %14 = builtin.unrealized_conversion_cast %13 : memref<3x12xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %15 = memref.get_global @__constant_12x3xf32 : memref<12x3xf32>
    %16 = builtin.unrealized_conversion_cast %15 : memref<12x3xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %17 = memref.alloca() {alignment = 64 : i64} : memref<3x12xf32>
    %18 = builtin.unrealized_conversion_cast %17 : memref<3x12xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %19 = llvm.extractvalue %16[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %20 = llvm.extractvalue %18[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_0(%19, %20) : (!llvm.ptr<f32>, !llvm.ptr<f32>) -> ()
    %21 = memref.alloca() : memref<4x12xf32>
    %22 = builtin.unrealized_conversion_cast %21 : memref<4x12xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %23 = llvm.extractvalue %22[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_1(%23) : (!llvm.ptr<f32>) -> ()
    %24 = memref.alloca() : memref<4x12xf32>
    %25 = builtin.unrealized_conversion_cast %24 : memref<4x12xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    memref.copy %21, %24 : memref<4x12xf32> to memref<4x12xf32>
    %26 = llvm.extractvalue %12[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %27 = llvm.extractvalue %18[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %28 = llvm.extractvalue %25[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_2(%26, %27, %28) : (!llvm.ptr<f32>, !llvm.ptr<f32>, !llvm.ptr<f32>) -> ()
    %29 = memref.alloca() {alignment = 64 : i64} : memref<12x3xf32>
    %30 = builtin.unrealized_conversion_cast %29 : memref<12x3xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %31 = llvm.extractvalue %14[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %32 = llvm.extractvalue %30[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_3(%31, %32) : (!llvm.ptr<f32>, !llvm.ptr<f32>) -> ()
    %33 = memref.alloca() : memref<4x3xf32>
    %34 = builtin.unrealized_conversion_cast %33 : memref<4x3xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %35 = llvm.extractvalue %34[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_4(%35) : (!llvm.ptr<f32>) -> ()
    %36 = memref.alloc() {alignment = 64 : i64} : memref<4x3xf32>
    %37 = builtin.unrealized_conversion_cast %36 : memref<4x3xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    memref.copy %33, %36 : memref<4x3xf32> to memref<4x3xf32>
    %38 = llvm.extractvalue %25[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %39 = llvm.extractvalue %30[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %40 = llvm.extractvalue %37[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_5(%38, %39, %40) : (!llvm.ptr<f32>, !llvm.ptr<f32>, !llvm.ptr<f32>) -> ()
    %41 = llvm.extractvalue %37[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.return %41 : !llvm.ptr<f32>
  }
  llvm.func @forward_kernel_0(!llvm.ptr<f32>, !llvm.ptr<f32>) attributes {Kernel, forward_kernel_0}
  llvm.func @forward_kernel_1(!llvm.ptr<f32>) attributes {Kernel, forward_kernel_1}
  llvm.func @forward_kernel_2(!llvm.ptr<f32>, !llvm.ptr<f32>, !llvm.ptr<f32>) attributes {Kernel, forward_kernel_2}
  llvm.func @forward_kernel_3(!llvm.ptr<f32>, !llvm.ptr<f32>) attributes {Kernel, forward_kernel_3}
  llvm.func @forward_kernel_4(!llvm.ptr<f32>) attributes {Kernel, forward_kernel_4}
  llvm.func @forward_kernel_5(!llvm.ptr<f32>, !llvm.ptr<f32>, !llvm.ptr<f32>) attributes {Kernel, forward_kernel_5}
}


// -----// IR Dump After ConvertMemRefToLLVM (convert-memref-to-llvm) //----- //
module attributes {llvm.data_layout = "", torch.debug_module_name = "L"} {
  llvm.func @malloc(i64) -> !llvm.ptr<i8>
  llvm.mlir.global private constant @__constant_12x3xf32(dense<[[-0.259240121, -0.234688252, 0.510510147], [0.233562827, -0.0331445783, 0.384852856], [-0.508802652, 0.173100084, -0.456325561], [0.334649473, 0.101393677, -0.0848175361], [0.415013522, 0.548246503, -0.0517567173], [0.558391511, -0.239463642, -0.212957352], [0.0163944438, -0.32234925, 0.205953121], [-0.284711599, 0.075589411, 0.142221317], [-5.766300e-01, -0.231847823, -0.161687583], [-0.538891375, 0.341592878, -0.576503336], [0.443732411, -0.319553018, -0.167551935], [0.142661244, 0.165032223, -0.576377869]]> : tensor<12x3xf32>) : !llvm.array<12 x array<3 x f32>>
  llvm.mlir.global private constant @__constant_3x12xf32(dense<[[0.161275461, 0.0990483835, 0.140225306, 0.0738267228, -0.0230169389, -0.191564813, 0.1457607, 0.197757319, -0.0972366183, 0.126508623, 0.139206693, -0.0688978806], [-0.176147208, -0.213960767, -0.198053509, -0.0384910479, -0.245581821, 0.139692709, -2.673340e-01, -0.223085925, -0.196028829, -0.226647332, -0.0104687046, 0.127765238], [0.0994836315, -0.128047019, -0.0917707682, 0.115462713, 0.0437031351, -0.0613443516, 0.0145246265, 0.240862086, 0.133553818, -0.0305191949, -0.286686301, -0.204464972]]> : tensor<3x12xf32>) : !llvm.array<3 x array<12 x f32>>
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
    %14 = llvm.mlir.constant(12 : index) : i64
    %15 = llvm.mlir.constant(1 : index) : i64
    %16 = llvm.mlir.constant(36 : index) : i64
    %17 = llvm.mlir.null : !llvm.ptr<f32>
    %18 = llvm.getelementptr %17[%16] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %19 = llvm.ptrtoint %18 : !llvm.ptr<f32> to i64
    %20 = llvm.mlir.addressof @__constant_3x12xf32 : !llvm.ptr<array<3 x array<12 x f32>>>
    %21 = llvm.getelementptr %20[0, 0, 0] : (!llvm.ptr<array<3 x array<12 x f32>>>) -> !llvm.ptr<f32>
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
    %33 = builtin.unrealized_conversion_cast %32 : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> to memref<3x12xf32>
    %34 = builtin.unrealized_conversion_cast %33 : memref<3x12xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %35 = llvm.mlir.constant(12 : index) : i64
    %36 = llvm.mlir.constant(3 : index) : i64
    %37 = llvm.mlir.constant(1 : index) : i64
    %38 = llvm.mlir.constant(36 : index) : i64
    %39 = llvm.mlir.null : !llvm.ptr<f32>
    %40 = llvm.getelementptr %39[%38] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %41 = llvm.ptrtoint %40 : !llvm.ptr<f32> to i64
    %42 = llvm.mlir.addressof @__constant_12x3xf32 : !llvm.ptr<array<12 x array<3 x f32>>>
    %43 = llvm.getelementptr %42[0, 0, 0] : (!llvm.ptr<array<12 x array<3 x f32>>>) -> !llvm.ptr<f32>
    %44 = llvm.mlir.constant(3735928559 : index) : i64
    %45 = llvm.inttoptr %44 : i64 to !llvm.ptr<f32>
    %46 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %47 = llvm.insertvalue %45, %46[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %48 = llvm.insertvalue %43, %47[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %49 = llvm.mlir.constant(0 : index) : i64
    %50 = llvm.insertvalue %49, %48[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %51 = llvm.insertvalue %35, %50[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %52 = llvm.insertvalue %36, %51[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %53 = llvm.insertvalue %36, %52[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %54 = llvm.insertvalue %37, %53[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %55 = builtin.unrealized_conversion_cast %54 : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> to memref<12x3xf32>
    %56 = builtin.unrealized_conversion_cast %55 : memref<12x3xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %57 = llvm.mlir.constant(3 : index) : i64
    %58 = llvm.mlir.constant(12 : index) : i64
    %59 = llvm.mlir.constant(1 : index) : i64
    %60 = llvm.mlir.constant(36 : index) : i64
    %61 = llvm.mlir.null : !llvm.ptr<f32>
    %62 = llvm.getelementptr %61[%60] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %63 = llvm.ptrtoint %62 : !llvm.ptr<f32> to i64
    %64 = llvm.alloca %63 x f32 {alignment = 64 : i64} : (i64) -> !llvm.ptr<f32>
    %65 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %66 = llvm.insertvalue %64, %65[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %67 = llvm.insertvalue %64, %66[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %68 = llvm.mlir.constant(0 : index) : i64
    %69 = llvm.insertvalue %68, %67[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %70 = llvm.insertvalue %57, %69[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %71 = llvm.insertvalue %58, %70[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %72 = llvm.insertvalue %58, %71[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %73 = llvm.insertvalue %59, %72[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %74 = builtin.unrealized_conversion_cast %73 : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> to memref<3x12xf32>
    %75 = builtin.unrealized_conversion_cast %74 : memref<3x12xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %76 = llvm.extractvalue %56[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %77 = llvm.extractvalue %75[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_0(%76, %77) : (!llvm.ptr<f32>, !llvm.ptr<f32>) -> ()
    %78 = llvm.mlir.constant(4 : index) : i64
    %79 = llvm.mlir.constant(12 : index) : i64
    %80 = llvm.mlir.constant(1 : index) : i64
    %81 = llvm.mlir.constant(48 : index) : i64
    %82 = llvm.mlir.null : !llvm.ptr<f32>
    %83 = llvm.getelementptr %82[%81] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %84 = llvm.ptrtoint %83 : !llvm.ptr<f32> to i64
    %85 = llvm.alloca %84 x f32 : (i64) -> !llvm.ptr<f32>
    %86 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %87 = llvm.insertvalue %85, %86[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %88 = llvm.insertvalue %85, %87[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %89 = llvm.mlir.constant(0 : index) : i64
    %90 = llvm.insertvalue %89, %88[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %91 = llvm.insertvalue %78, %90[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %92 = llvm.insertvalue %79, %91[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %93 = llvm.insertvalue %79, %92[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %94 = llvm.insertvalue %80, %93[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %95 = builtin.unrealized_conversion_cast %94 : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> to memref<4x12xf32>
    %96 = builtin.unrealized_conversion_cast %95 : memref<4x12xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %97 = llvm.extractvalue %96[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_1(%97) : (!llvm.ptr<f32>) -> ()
    %98 = llvm.mlir.constant(4 : index) : i64
    %99 = llvm.mlir.constant(12 : index) : i64
    %100 = llvm.mlir.constant(1 : index) : i64
    %101 = llvm.mlir.constant(48 : index) : i64
    %102 = llvm.mlir.null : !llvm.ptr<f32>
    %103 = llvm.getelementptr %102[%101] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %104 = llvm.ptrtoint %103 : !llvm.ptr<f32> to i64
    %105 = llvm.alloca %104 x f32 : (i64) -> !llvm.ptr<f32>
    %106 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %107 = llvm.insertvalue %105, %106[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %108 = llvm.insertvalue %105, %107[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %109 = llvm.mlir.constant(0 : index) : i64
    %110 = llvm.insertvalue %109, %108[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %111 = llvm.insertvalue %98, %110[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %112 = llvm.insertvalue %99, %111[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %113 = llvm.insertvalue %99, %112[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %114 = llvm.insertvalue %100, %113[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %115 = builtin.unrealized_conversion_cast %114 : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> to memref<4x12xf32>
    %116 = builtin.unrealized_conversion_cast %115 : memref<4x12xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %117 = llvm.mlir.constant(1 : index) : i64
    %118 = llvm.extractvalue %94[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %119 = llvm.mul %117, %118  : i64
    %120 = llvm.extractvalue %94[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %121 = llvm.mul %119, %120  : i64
    %122 = llvm.mlir.null : !llvm.ptr<f32>
    %123 = llvm.getelementptr %122[1] : (!llvm.ptr<f32>) -> !llvm.ptr<f32>
    %124 = llvm.ptrtoint %123 : !llvm.ptr<f32> to i64
    %125 = llvm.mul %121, %124  : i64
    %126 = llvm.extractvalue %94[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %127 = llvm.extractvalue %94[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %128 = llvm.getelementptr %126[%127] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %129 = llvm.extractvalue %114[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %130 = llvm.extractvalue %114[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %131 = llvm.getelementptr %129[%130] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %132 = llvm.mlir.constant(false) : i1
    "llvm.intr.memcpy"(%131, %128, %125, %132) : (!llvm.ptr<f32>, !llvm.ptr<f32>, i64, i1) -> ()
    %133 = llvm.extractvalue %12[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %134 = llvm.extractvalue %75[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %135 = llvm.extractvalue %116[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_2(%133, %134, %135) : (!llvm.ptr<f32>, !llvm.ptr<f32>, !llvm.ptr<f32>) -> ()
    %136 = llvm.mlir.constant(12 : index) : i64
    %137 = llvm.mlir.constant(3 : index) : i64
    %138 = llvm.mlir.constant(1 : index) : i64
    %139 = llvm.mlir.constant(36 : index) : i64
    %140 = llvm.mlir.null : !llvm.ptr<f32>
    %141 = llvm.getelementptr %140[%139] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %142 = llvm.ptrtoint %141 : !llvm.ptr<f32> to i64
    %143 = llvm.alloca %142 x f32 {alignment = 64 : i64} : (i64) -> !llvm.ptr<f32>
    %144 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %145 = llvm.insertvalue %143, %144[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %146 = llvm.insertvalue %143, %145[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %147 = llvm.mlir.constant(0 : index) : i64
    %148 = llvm.insertvalue %147, %146[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %149 = llvm.insertvalue %136, %148[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %150 = llvm.insertvalue %137, %149[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %151 = llvm.insertvalue %137, %150[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %152 = llvm.insertvalue %138, %151[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %153 = builtin.unrealized_conversion_cast %152 : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> to memref<12x3xf32>
    %154 = builtin.unrealized_conversion_cast %153 : memref<12x3xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %155 = llvm.extractvalue %34[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %156 = llvm.extractvalue %154[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_3(%155, %156) : (!llvm.ptr<f32>, !llvm.ptr<f32>) -> ()
    %157 = llvm.mlir.constant(4 : index) : i64
    %158 = llvm.mlir.constant(3 : index) : i64
    %159 = llvm.mlir.constant(1 : index) : i64
    %160 = llvm.mlir.constant(12 : index) : i64
    %161 = llvm.mlir.null : !llvm.ptr<f32>
    %162 = llvm.getelementptr %161[%160] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %163 = llvm.ptrtoint %162 : !llvm.ptr<f32> to i64
    %164 = llvm.alloca %163 x f32 : (i64) -> !llvm.ptr<f32>
    %165 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %166 = llvm.insertvalue %164, %165[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %167 = llvm.insertvalue %164, %166[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %168 = llvm.mlir.constant(0 : index) : i64
    %169 = llvm.insertvalue %168, %167[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %170 = llvm.insertvalue %157, %169[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %171 = llvm.insertvalue %158, %170[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %172 = llvm.insertvalue %158, %171[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %173 = llvm.insertvalue %159, %172[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %174 = builtin.unrealized_conversion_cast %173 : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> to memref<4x3xf32>
    %175 = builtin.unrealized_conversion_cast %174 : memref<4x3xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %176 = llvm.extractvalue %175[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_4(%176) : (!llvm.ptr<f32>) -> ()
    %177 = llvm.mlir.constant(4 : index) : i64
    %178 = llvm.mlir.constant(3 : index) : i64
    %179 = llvm.mlir.constant(1 : index) : i64
    %180 = llvm.mlir.constant(12 : index) : i64
    %181 = llvm.mlir.null : !llvm.ptr<f32>
    %182 = llvm.getelementptr %181[%180] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %183 = llvm.ptrtoint %182 : !llvm.ptr<f32> to i64
    %184 = llvm.mlir.constant(64 : index) : i64
    %185 = llvm.add %183, %184  : i64
    %186 = llvm.call @malloc(%185) : (i64) -> !llvm.ptr<i8>
    %187 = llvm.bitcast %186 : !llvm.ptr<i8> to !llvm.ptr<f32>
    %188 = llvm.ptrtoint %187 : !llvm.ptr<f32> to i64
    %189 = llvm.mlir.constant(1 : index) : i64
    %190 = llvm.sub %184, %189  : i64
    %191 = llvm.add %188, %190  : i64
    %192 = llvm.urem %191, %184  : i64
    %193 = llvm.sub %191, %192  : i64
    %194 = llvm.inttoptr %193 : i64 to !llvm.ptr<f32>
    %195 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %196 = llvm.insertvalue %187, %195[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %197 = llvm.insertvalue %194, %196[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %198 = llvm.mlir.constant(0 : index) : i64
    %199 = llvm.insertvalue %198, %197[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %200 = llvm.insertvalue %177, %199[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %201 = llvm.insertvalue %178, %200[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %202 = llvm.insertvalue %178, %201[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %203 = llvm.insertvalue %179, %202[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %204 = builtin.unrealized_conversion_cast %203 : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> to memref<4x3xf32>
    %205 = builtin.unrealized_conversion_cast %204 : memref<4x3xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %206 = llvm.mlir.constant(1 : index) : i64
    %207 = llvm.extractvalue %173[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %208 = llvm.mul %206, %207  : i64
    %209 = llvm.extractvalue %173[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %210 = llvm.mul %208, %209  : i64
    %211 = llvm.mlir.null : !llvm.ptr<f32>
    %212 = llvm.getelementptr %211[1] : (!llvm.ptr<f32>) -> !llvm.ptr<f32>
    %213 = llvm.ptrtoint %212 : !llvm.ptr<f32> to i64
    %214 = llvm.mul %210, %213  : i64
    %215 = llvm.extractvalue %173[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %216 = llvm.extractvalue %173[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %217 = llvm.getelementptr %215[%216] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %218 = llvm.extractvalue %203[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %219 = llvm.extractvalue %203[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %220 = llvm.getelementptr %218[%219] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %221 = llvm.mlir.constant(false) : i1
    "llvm.intr.memcpy"(%220, %217, %214, %221) : (!llvm.ptr<f32>, !llvm.ptr<f32>, i64, i1) -> ()
    %222 = llvm.extractvalue %116[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %223 = llvm.extractvalue %154[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %224 = llvm.extractvalue %205[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_5(%222, %223, %224) : (!llvm.ptr<f32>, !llvm.ptr<f32>, !llvm.ptr<f32>) -> ()
    %225 = llvm.extractvalue %205[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.return %225 : !llvm.ptr<f32>
  }
  llvm.func @forward_kernel_0(!llvm.ptr<f32>, !llvm.ptr<f32>) attributes {Kernel, forward_kernel_0}
  llvm.func @forward_kernel_1(!llvm.ptr<f32>) attributes {Kernel, forward_kernel_1}
  llvm.func @forward_kernel_2(!llvm.ptr<f32>, !llvm.ptr<f32>, !llvm.ptr<f32>) attributes {Kernel, forward_kernel_2}
  llvm.func @forward_kernel_3(!llvm.ptr<f32>, !llvm.ptr<f32>) attributes {Kernel, forward_kernel_3}
  llvm.func @forward_kernel_4(!llvm.ptr<f32>) attributes {Kernel, forward_kernel_4}
  llvm.func @forward_kernel_5(!llvm.ptr<f32>, !llvm.ptr<f32>, !llvm.ptr<f32>) attributes {Kernel, forward_kernel_5}
}


// -----// IR Dump After ReconcileUnrealizedCasts (reconcile-unrealized-casts) //----- //
module attributes {llvm.data_layout = "", torch.debug_module_name = "L"} {
  llvm.func @malloc(i64) -> !llvm.ptr<i8>
  llvm.mlir.global private constant @__constant_12x3xf32(dense<[[-0.259240121, -0.234688252, 0.510510147], [0.233562827, -0.0331445783, 0.384852856], [-0.508802652, 0.173100084, -0.456325561], [0.334649473, 0.101393677, -0.0848175361], [0.415013522, 0.548246503, -0.0517567173], [0.558391511, -0.239463642, -0.212957352], [0.0163944438, -0.32234925, 0.205953121], [-0.284711599, 0.075589411, 0.142221317], [-5.766300e-01, -0.231847823, -0.161687583], [-0.538891375, 0.341592878, -0.576503336], [0.443732411, -0.319553018, -0.167551935], [0.142661244, 0.165032223, -0.576377869]]> : tensor<12x3xf32>) : !llvm.array<12 x array<3 x f32>>
  llvm.mlir.global private constant @__constant_3x12xf32(dense<[[0.161275461, 0.0990483835, 0.140225306, 0.0738267228, -0.0230169389, -0.191564813, 0.1457607, 0.197757319, -0.0972366183, 0.126508623, 0.139206693, -0.0688978806], [-0.176147208, -0.213960767, -0.198053509, -0.0384910479, -0.245581821, 0.139692709, -2.673340e-01, -0.223085925, -0.196028829, -0.226647332, -0.0104687046, 0.127765238], [0.0994836315, -0.128047019, -0.0917707682, 0.115462713, 0.0437031351, -0.0613443516, 0.0145246265, 0.240862086, 0.133553818, -0.0305191949, -0.286686301, -0.204464972]]> : tensor<3x12xf32>) : !llvm.array<3 x array<12 x f32>>
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
    %14 = llvm.mlir.constant(12 : index) : i64
    %15 = llvm.mlir.constant(1 : index) : i64
    %16 = llvm.mlir.constant(36 : index) : i64
    %17 = llvm.mlir.null : !llvm.ptr<f32>
    %18 = llvm.getelementptr %17[36] : (!llvm.ptr<f32>) -> !llvm.ptr<f32>
    %19 = llvm.ptrtoint %18 : !llvm.ptr<f32> to i64
    %20 = llvm.mlir.addressof @__constant_3x12xf32 : !llvm.ptr<array<3 x array<12 x f32>>>
    %21 = llvm.getelementptr %20[0, 0, 0] : (!llvm.ptr<array<3 x array<12 x f32>>>) -> !llvm.ptr<f32>
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
    %33 = llvm.mlir.constant(12 : index) : i64
    %34 = llvm.mlir.constant(3 : index) : i64
    %35 = llvm.mlir.constant(1 : index) : i64
    %36 = llvm.mlir.constant(36 : index) : i64
    %37 = llvm.mlir.null : !llvm.ptr<f32>
    %38 = llvm.getelementptr %37[36] : (!llvm.ptr<f32>) -> !llvm.ptr<f32>
    %39 = llvm.ptrtoint %38 : !llvm.ptr<f32> to i64
    %40 = llvm.mlir.addressof @__constant_12x3xf32 : !llvm.ptr<array<12 x array<3 x f32>>>
    %41 = llvm.getelementptr %40[0, 0, 0] : (!llvm.ptr<array<12 x array<3 x f32>>>) -> !llvm.ptr<f32>
    %42 = llvm.mlir.constant(3735928559 : index) : i64
    %43 = llvm.inttoptr %42 : i64 to !llvm.ptr<f32>
    %44 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %45 = llvm.insertvalue %43, %44[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %46 = llvm.insertvalue %41, %45[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %47 = llvm.mlir.constant(0 : index) : i64
    %48 = llvm.insertvalue %47, %46[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %49 = llvm.insertvalue %33, %48[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %50 = llvm.insertvalue %34, %49[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %51 = llvm.insertvalue %34, %50[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %52 = llvm.insertvalue %35, %51[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %53 = llvm.mlir.constant(3 : index) : i64
    %54 = llvm.mlir.constant(12 : index) : i64
    %55 = llvm.mlir.constant(1 : index) : i64
    %56 = llvm.mlir.constant(36 : index) : i64
    %57 = llvm.mlir.null : !llvm.ptr<f32>
    %58 = llvm.getelementptr %57[36] : (!llvm.ptr<f32>) -> !llvm.ptr<f32>
    %59 = llvm.ptrtoint %58 : !llvm.ptr<f32> to i64
    %60 = llvm.alloca %59 x f32 {alignment = 64 : i64} : (i64) -> !llvm.ptr<f32>
    %61 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %62 = llvm.insertvalue %60, %61[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %63 = llvm.insertvalue %60, %62[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %64 = llvm.mlir.constant(0 : index) : i64
    %65 = llvm.insertvalue %64, %63[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %66 = llvm.insertvalue %53, %65[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %67 = llvm.insertvalue %54, %66[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %68 = llvm.insertvalue %54, %67[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %69 = llvm.insertvalue %55, %68[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %70 = llvm.extractvalue %52[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %71 = llvm.extractvalue %69[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_0(%70, %71) : (!llvm.ptr<f32>, !llvm.ptr<f32>) -> ()
    %72 = llvm.mlir.constant(4 : index) : i64
    %73 = llvm.mlir.constant(12 : index) : i64
    %74 = llvm.mlir.constant(1 : index) : i64
    %75 = llvm.mlir.constant(48 : index) : i64
    %76 = llvm.mlir.null : !llvm.ptr<f32>
    %77 = llvm.getelementptr %76[48] : (!llvm.ptr<f32>) -> !llvm.ptr<f32>
    %78 = llvm.ptrtoint %77 : !llvm.ptr<f32> to i64
    %79 = llvm.alloca %78 x f32 : (i64) -> !llvm.ptr<f32>
    %80 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %81 = llvm.insertvalue %79, %80[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %82 = llvm.insertvalue %79, %81[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %83 = llvm.mlir.constant(0 : index) : i64
    %84 = llvm.insertvalue %83, %82[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %85 = llvm.insertvalue %72, %84[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %86 = llvm.insertvalue %73, %85[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %87 = llvm.insertvalue %73, %86[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %88 = llvm.insertvalue %74, %87[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %89 = llvm.extractvalue %88[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_1(%89) : (!llvm.ptr<f32>) -> ()
    %90 = llvm.mlir.constant(4 : index) : i64
    %91 = llvm.mlir.constant(12 : index) : i64
    %92 = llvm.mlir.constant(1 : index) : i64
    %93 = llvm.mlir.constant(48 : index) : i64
    %94 = llvm.mlir.null : !llvm.ptr<f32>
    %95 = llvm.getelementptr %94[48] : (!llvm.ptr<f32>) -> !llvm.ptr<f32>
    %96 = llvm.ptrtoint %95 : !llvm.ptr<f32> to i64
    %97 = llvm.alloca %96 x f32 : (i64) -> !llvm.ptr<f32>
    %98 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %99 = llvm.insertvalue %97, %98[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %100 = llvm.insertvalue %97, %99[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %101 = llvm.mlir.constant(0 : index) : i64
    %102 = llvm.insertvalue %101, %100[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %103 = llvm.insertvalue %90, %102[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %104 = llvm.insertvalue %91, %103[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %105 = llvm.insertvalue %91, %104[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %106 = llvm.insertvalue %92, %105[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %107 = llvm.mlir.constant(1 : index) : i64
    %108 = llvm.mul %107, %72  : i64
    %109 = llvm.mul %108, %73  : i64
    %110 = llvm.mlir.null : !llvm.ptr<f32>
    %111 = llvm.getelementptr %110[1] : (!llvm.ptr<f32>) -> !llvm.ptr<f32>
    %112 = llvm.ptrtoint %111 : !llvm.ptr<f32> to i64
    %113 = llvm.mul %109, %112  : i64
    %114 = llvm.getelementptr %79[%83] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %115 = llvm.getelementptr %97[%101] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %116 = llvm.mlir.constant(false) : i1
    "llvm.intr.memcpy"(%115, %114, %113, %116) : (!llvm.ptr<f32>, !llvm.ptr<f32>, i64, i1) -> ()
    %117 = llvm.extractvalue %69[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %118 = llvm.extractvalue %106[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_2(%arg0, %117, %118) : (!llvm.ptr<f32>, !llvm.ptr<f32>, !llvm.ptr<f32>) -> ()
    %119 = llvm.mlir.constant(12 : index) : i64
    %120 = llvm.mlir.constant(3 : index) : i64
    %121 = llvm.mlir.constant(1 : index) : i64
    %122 = llvm.mlir.constant(36 : index) : i64
    %123 = llvm.mlir.null : !llvm.ptr<f32>
    %124 = llvm.getelementptr %123[36] : (!llvm.ptr<f32>) -> !llvm.ptr<f32>
    %125 = llvm.ptrtoint %124 : !llvm.ptr<f32> to i64
    %126 = llvm.alloca %125 x f32 {alignment = 64 : i64} : (i64) -> !llvm.ptr<f32>
    %127 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %128 = llvm.insertvalue %126, %127[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %129 = llvm.insertvalue %126, %128[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %130 = llvm.mlir.constant(0 : index) : i64
    %131 = llvm.insertvalue %130, %129[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %132 = llvm.insertvalue %119, %131[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %133 = llvm.insertvalue %120, %132[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %134 = llvm.insertvalue %120, %133[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %135 = llvm.insertvalue %121, %134[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %136 = llvm.extractvalue %32[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %137 = llvm.extractvalue %135[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_3(%136, %137) : (!llvm.ptr<f32>, !llvm.ptr<f32>) -> ()
    %138 = llvm.mlir.constant(4 : index) : i64
    %139 = llvm.mlir.constant(3 : index) : i64
    %140 = llvm.mlir.constant(1 : index) : i64
    %141 = llvm.mlir.constant(12 : index) : i64
    %142 = llvm.mlir.null : !llvm.ptr<f32>
    %143 = llvm.getelementptr %142[12] : (!llvm.ptr<f32>) -> !llvm.ptr<f32>
    %144 = llvm.ptrtoint %143 : !llvm.ptr<f32> to i64
    %145 = llvm.alloca %144 x f32 : (i64) -> !llvm.ptr<f32>
    %146 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %147 = llvm.insertvalue %145, %146[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %148 = llvm.insertvalue %145, %147[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %149 = llvm.mlir.constant(0 : index) : i64
    %150 = llvm.insertvalue %149, %148[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %151 = llvm.insertvalue %138, %150[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %152 = llvm.insertvalue %139, %151[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %153 = llvm.insertvalue %139, %152[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %154 = llvm.insertvalue %140, %153[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %155 = llvm.extractvalue %154[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_4(%155) : (!llvm.ptr<f32>) -> ()
    %156 = llvm.mlir.constant(4 : index) : i64
    %157 = llvm.mlir.constant(3 : index) : i64
    %158 = llvm.mlir.constant(1 : index) : i64
    %159 = llvm.mlir.constant(12 : index) : i64
    %160 = llvm.mlir.null : !llvm.ptr<f32>
    %161 = llvm.getelementptr %160[12] : (!llvm.ptr<f32>) -> !llvm.ptr<f32>
    %162 = llvm.ptrtoint %161 : !llvm.ptr<f32> to i64
    %163 = llvm.mlir.constant(64 : index) : i64
    %164 = llvm.add %162, %163  : i64
    %165 = llvm.call @malloc(%164) : (i64) -> !llvm.ptr<i8>
    %166 = llvm.bitcast %165 : !llvm.ptr<i8> to !llvm.ptr<f32>
    %167 = llvm.ptrtoint %166 : !llvm.ptr<f32> to i64
    %168 = llvm.mlir.constant(1 : index) : i64
    %169 = llvm.sub %163, %168  : i64
    %170 = llvm.add %167, %169  : i64
    %171 = llvm.urem %170, %163  : i64
    %172 = llvm.sub %170, %171  : i64
    %173 = llvm.inttoptr %172 : i64 to !llvm.ptr<f32>
    %174 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %175 = llvm.insertvalue %166, %174[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %176 = llvm.insertvalue %173, %175[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %177 = llvm.mlir.constant(0 : index) : i64
    %178 = llvm.insertvalue %177, %176[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %179 = llvm.insertvalue %156, %178[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %180 = llvm.insertvalue %157, %179[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %181 = llvm.insertvalue %157, %180[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %182 = llvm.insertvalue %158, %181[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %183 = llvm.mlir.constant(1 : index) : i64
    %184 = llvm.mul %183, %138  : i64
    %185 = llvm.mul %184, %139  : i64
    %186 = llvm.mlir.null : !llvm.ptr<f32>
    %187 = llvm.getelementptr %186[1] : (!llvm.ptr<f32>) -> !llvm.ptr<f32>
    %188 = llvm.ptrtoint %187 : !llvm.ptr<f32> to i64
    %189 = llvm.mul %185, %188  : i64
    %190 = llvm.getelementptr %145[%149] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %191 = llvm.getelementptr %173[%177] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %192 = llvm.mlir.constant(false) : i1
    "llvm.intr.memcpy"(%191, %190, %189, %192) : (!llvm.ptr<f32>, !llvm.ptr<f32>, i64, i1) -> ()
    %193 = llvm.extractvalue %106[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %194 = llvm.extractvalue %135[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %195 = llvm.extractvalue %182[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_5(%193, %194, %195) : (!llvm.ptr<f32>, !llvm.ptr<f32>, !llvm.ptr<f32>) -> ()
    %196 = llvm.extractvalue %182[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.return %196 : !llvm.ptr<f32>
  }
  llvm.func @forward_kernel_0(!llvm.ptr<f32>, !llvm.ptr<f32>) attributes {Kernel, forward_kernel_0}
  llvm.func @forward_kernel_1(!llvm.ptr<f32>) attributes {Kernel, forward_kernel_1}
  llvm.func @forward_kernel_2(!llvm.ptr<f32>, !llvm.ptr<f32>, !llvm.ptr<f32>) attributes {Kernel, forward_kernel_2}
  llvm.func @forward_kernel_3(!llvm.ptr<f32>, !llvm.ptr<f32>) attributes {Kernel, forward_kernel_3}
  llvm.func @forward_kernel_4(!llvm.ptr<f32>) attributes {Kernel, forward_kernel_4}
  llvm.func @forward_kernel_5(!llvm.ptr<f32>, !llvm.ptr<f32>, !llvm.ptr<f32>) attributes {Kernel, forward_kernel_5}
}


