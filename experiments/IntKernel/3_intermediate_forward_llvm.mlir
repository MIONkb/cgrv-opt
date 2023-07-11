// -----// IR Dump After PromoteBuffersToStack (promote-buffers-to-stack) //----- //
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
  %2 = memref.alloca() : memref<2x3xi32>
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

// -----// IR Dump After PromoteBuffersToStack (promote-buffers-to-stack) //----- //
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

// -----// IR Dump After ArithmeticExpandOps (arith-expand) //----- //
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
    %2 = memref.alloca() : memref<2x3xi32>
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


// -----// IR Dump After ExpandOps (memref-expand) //----- //
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
    %2 = memref.alloca() : memref<2x3xi32>
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


// -----// IR Dump After NormalizeMemRefs (normalize-memrefs) //----- //
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
    %2 = memref.alloca() : memref<2x3xi32>
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


// -----// IR Dump After SimplifyAffineStructures (affine-simplify-structures) //----- //
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
  %2 = memref.alloca() : memref<2x3xi32>
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

// -----// IR Dump After SimplifyAffineStructures (affine-simplify-structures) //----- //
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

// -----// IR Dump After ConvertAffineToStandard (lower-affine) //----- //
module attributes {torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_3x3xi32 : memref<3x3xi32> = dense<[[1, -2, 3], [-4, 5, -6], [7, -8, 9]]>
  func.func @forward(%arg0: memref<2x3xi32>) -> memref<2x3xi32> {
    %c0_i32 = arith.constant 0 : i32
    %0 = memref.get_global @__constant_3x3xi32 : memref<3x3xi32>
    %1 = memref.alloca() {alignment = 64 : i64} : memref<3x3xi32>
    %c0 = arith.constant 0 : index
    %c3 = arith.constant 3 : index
    %c1 = arith.constant 1 : index
    scf.for %arg1 = %c0 to %c3 step %c1 {
      %c0_2 = arith.constant 0 : index
      %c3_3 = arith.constant 3 : index
      %c1_4 = arith.constant 1 : index
      scf.for %arg2 = %c0_2 to %c3_3 step %c1_4 {
        %4 = memref.load %0[%arg1, %arg2] : memref<3x3xi32>
        memref.store %4, %1[%arg2, %arg1] : memref<3x3xi32>
      }
    }
    %2 = memref.alloca() : memref<2x3xi32>
    %c0_0 = arith.constant 0 : index
    %c2 = arith.constant 2 : index
    %c1_1 = arith.constant 1 : index
    scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
      %c0_2 = arith.constant 0 : index
      %c3_3 = arith.constant 3 : index
      %c1_4 = arith.constant 1 : index
      scf.for %arg2 = %c0_2 to %c3_3 step %c1_4 {
        memref.store %c0_i32, %2[%arg1, %arg2] : memref<2x3xi32>
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
    %c0 = arith.constant 0 : index
    %c2 = arith.constant 2 : index
    %c1 = arith.constant 1 : index
    scf.for %arg3 = %c0 to %c2 step %c1 {
      %c0_0 = arith.constant 0 : index
      %c3 = arith.constant 3 : index
      %c1_1 = arith.constant 1 : index
      scf.for %arg4 = %c0_0 to %c3 step %c1_1 {
        %c0_2 = arith.constant 0 : index
        %c3_3 = arith.constant 3 : index
        %c1_4 = arith.constant 1 : index
        scf.for %arg5 = %c0_2 to %c3_3 step %c1_4 {
          %0 = memref.load %arg0[%arg3, %arg5] : memref<2x3xi32>
          %1 = memref.load %arg1[%arg5, %arg4] : memref<3x3xi32>
          %2 = memref.load %arg2[%arg3, %arg4] : memref<2x3xi32>
          %3 = arith.muli %0, %1 : i32
          %4 = arith.addi %2, %3 : i32
          memref.store %4, %arg2[%arg3, %arg4] : memref<2x3xi32>
        }
      }
    }
    return
  }
}


// -----// IR Dump After SCFForLoopCanonicalization (scf-for-loop-canonicalization) //----- //
module attributes {torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_3x3xi32 : memref<3x3xi32> = dense<[[1, -2, 3], [-4, 5, -6], [7, -8, 9]]>
  func.func @forward(%arg0: memref<2x3xi32>) -> memref<2x3xi32> {
    %c2 = arith.constant 2 : index
    %c1 = arith.constant 1 : index
    %c3 = arith.constant 3 : index
    %c0 = arith.constant 0 : index
    %c0_i32 = arith.constant 0 : i32
    %0 = memref.get_global @__constant_3x3xi32 : memref<3x3xi32>
    %1 = memref.alloca() {alignment = 64 : i64} : memref<3x3xi32>
    scf.for %arg1 = %c0 to %c3 step %c1 {
      scf.for %arg2 = %c0 to %c3 step %c1 {
        %4 = memref.load %0[%arg1, %arg2] : memref<3x3xi32>
        memref.store %4, %1[%arg2, %arg1] : memref<3x3xi32>
      }
    }
    %2 = memref.alloca() : memref<2x3xi32>
    scf.for %arg1 = %c0 to %c2 step %c1 {
      scf.for %arg2 = %c0 to %c3 step %c1 {
        memref.store %c0_i32, %2[%arg1, %arg2] : memref<2x3xi32>
      }
    }
    %3 = memref.alloc() {alignment = 64 : i64} : memref<2x3xi32>
    memref.copy %2, %3 : memref<2x3xi32> to memref<2x3xi32>
    FDRA.KernelCall @forward_kernel_0(%arg0, %1, %3) : (memref<2x3xi32>, memref<3x3xi32>, memref<2x3xi32>) -> ()
    return %3 : memref<2x3xi32>
  }
  func.func @forward_kernel_0(%arg0: memref<2x3xi32>, %arg1: memref<3x3xi32>, %arg2: memref<2x3xi32>) attributes {Kernel, forward_kernel_0} {
    %c3 = arith.constant 3 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    scf.for %arg3 = %c0 to %c2 step %c1 {
      scf.for %arg4 = %c0 to %c3 step %c1 {
        scf.for %arg5 = %c0 to %c3 step %c1 {
          %0 = memref.load %arg0[%arg3, %arg5] : memref<2x3xi32>
          %1 = memref.load %arg1[%arg5, %arg4] : memref<3x3xi32>
          %2 = memref.load %arg2[%arg3, %arg4] : memref<2x3xi32>
          %3 = arith.muli %0, %1 : i32
          %4 = arith.addi %2, %3 : i32
          memref.store %4, %arg2[%arg3, %arg4] : memref<2x3xi32>
        }
      }
    }
    return
  }
}


// -----// IR Dump After SCFToControlFlow (convert-scf-to-cf) //----- //
module attributes {torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_3x3xi32 : memref<3x3xi32> = dense<[[1, -2, 3], [-4, 5, -6], [7, -8, 9]]>
  func.func @forward(%arg0: memref<2x3xi32>) -> memref<2x3xi32> {
    %c2 = arith.constant 2 : index
    %c1 = arith.constant 1 : index
    %c3 = arith.constant 3 : index
    %c0 = arith.constant 0 : index
    %c0_i32 = arith.constant 0 : i32
    %0 = memref.get_global @__constant_3x3xi32 : memref<3x3xi32>
    %1 = memref.alloca() {alignment = 64 : i64} : memref<3x3xi32>
    cf.br ^bb1(%c0 : index)
  ^bb1(%2: index):  // 2 preds: ^bb0, ^bb5
    %3 = arith.cmpi slt, %2, %c3 : index
    cf.cond_br %3, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    cf.br ^bb3(%c0 : index)
  ^bb3(%4: index):  // 2 preds: ^bb2, ^bb4
    %5 = arith.cmpi slt, %4, %c3 : index
    cf.cond_br %5, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    %6 = memref.load %0[%2, %4] : memref<3x3xi32>
    memref.store %6, %1[%4, %2] : memref<3x3xi32>
    %7 = arith.addi %4, %c1 : index
    cf.br ^bb3(%7 : index)
  ^bb5:  // pred: ^bb3
    %8 = arith.addi %2, %c1 : index
    cf.br ^bb1(%8 : index)
  ^bb6:  // pred: ^bb1
    %9 = memref.alloca() : memref<2x3xi32>
    cf.br ^bb7(%c0 : index)
  ^bb7(%10: index):  // 2 preds: ^bb6, ^bb11
    %11 = arith.cmpi slt, %10, %c2 : index
    cf.cond_br %11, ^bb8, ^bb12
  ^bb8:  // pred: ^bb7
    cf.br ^bb9(%c0 : index)
  ^bb9(%12: index):  // 2 preds: ^bb8, ^bb10
    %13 = arith.cmpi slt, %12, %c3 : index
    cf.cond_br %13, ^bb10, ^bb11
  ^bb10:  // pred: ^bb9
    memref.store %c0_i32, %9[%10, %12] : memref<2x3xi32>
    %14 = arith.addi %12, %c1 : index
    cf.br ^bb9(%14 : index)
  ^bb11:  // pred: ^bb9
    %15 = arith.addi %10, %c1 : index
    cf.br ^bb7(%15 : index)
  ^bb12:  // pred: ^bb7
    %16 = memref.alloc() {alignment = 64 : i64} : memref<2x3xi32>
    memref.copy %9, %16 : memref<2x3xi32> to memref<2x3xi32>
    FDRA.KernelCall @forward_kernel_0(%arg0, %1, %16) : (memref<2x3xi32>, memref<3x3xi32>, memref<2x3xi32>) -> ()
    return %16 : memref<2x3xi32>
  }
  func.func @forward_kernel_0(%arg0: memref<2x3xi32>, %arg1: memref<3x3xi32>, %arg2: memref<2x3xi32>) attributes {Kernel, forward_kernel_0} {
    %c3 = arith.constant 3 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%c0 : index)
  ^bb2(%0: index):  // 2 preds: ^bb1, ^bb9
    %1 = arith.cmpi slt, %0, %c2 : index
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
    %6 = memref.load %arg0[%0, %4] : memref<2x3xi32>
    %7 = memref.load %arg1[%4, %2] : memref<3x3xi32>
    %8 = memref.load %arg2[%0, %2] : memref<2x3xi32>
    %9 = arith.muli %6, %7 : i32
    %10 = arith.addi %8, %9 : i32
    memref.store %10, %arg2[%0, %2] : memref<2x3xi32>
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
  memref.global "private" constant @__constant_3x3xi32 : memref<3x3xi32> = dense<[[1, -2, 3], [-4, 5, -6], [7, -8, 9]]>
  func.func @forward(%arg0: memref<2x3xi32>) -> memref<2x3xi32> {
    %c2 = arith.constant 2 : index
    %c1 = arith.constant 1 : index
    %c3 = arith.constant 3 : index
    %c0 = arith.constant 0 : index
    %c0_i32 = arith.constant 0 : i32
    %0 = memref.get_global @__constant_3x3xi32 : memref<3x3xi32>
    %1 = memref.alloca() {alignment = 64 : i64} : memref<3x3xi32>
    cf.br ^bb1(%c0 : index)
  ^bb1(%2: index):  // 2 preds: ^bb0, ^bb5
    %3 = arith.cmpi slt, %2, %c3 : index
    cf.cond_br %3, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    cf.br ^bb3(%c0 : index)
  ^bb3(%4: index):  // 2 preds: ^bb2, ^bb4
    %5 = arith.cmpi slt, %4, %c3 : index
    cf.cond_br %5, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    %6 = memref.load %0[%2, %4] : memref<3x3xi32>
    memref.store %6, %1[%4, %2] : memref<3x3xi32>
    %7 = arith.addi %4, %c1 : index
    cf.br ^bb3(%7 : index)
  ^bb5:  // pred: ^bb3
    %8 = arith.addi %2, %c1 : index
    cf.br ^bb1(%8 : index)
  ^bb6:  // pred: ^bb1
    %9 = memref.alloca() : memref<2x3xi32>
    cf.br ^bb7(%c0 : index)
  ^bb7(%10: index):  // 2 preds: ^bb6, ^bb11
    %11 = arith.cmpi slt, %10, %c2 : index
    cf.cond_br %11, ^bb8, ^bb12
  ^bb8:  // pred: ^bb7
    cf.br ^bb9(%c0 : index)
  ^bb9(%12: index):  // 2 preds: ^bb8, ^bb10
    %13 = arith.cmpi slt, %12, %c3 : index
    cf.cond_br %13, ^bb10, ^bb11
  ^bb10:  // pred: ^bb9
    memref.store %c0_i32, %9[%10, %12] : memref<2x3xi32>
    %14 = arith.addi %12, %c1 : index
    cf.br ^bb9(%14 : index)
  ^bb11:  // pred: ^bb9
    %15 = arith.addi %10, %c1 : index
    cf.br ^bb7(%15 : index)
  ^bb12:  // pred: ^bb7
    %16 = memref.alloc() {alignment = 64 : i64} : memref<2x3xi32>
    memref.copy %9, %16 : memref<2x3xi32> to memref<2x3xi32>
    FDRA.KernelCall @forward_kernel_0(%arg0, %1, %16) : (memref<2x3xi32>, memref<3x3xi32>, memref<2x3xi32>) -> ()
    return %16 : memref<2x3xi32>
  }
  func.func @forward_kernel_0(%arg0: memref<2x3xi32>, %arg1: memref<3x3xi32>, %arg2: memref<2x3xi32>) attributes {Kernel, forward_kernel_0} {
    %c3 = arith.constant 3 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%c0 : index)
  ^bb2(%0: index):  // 2 preds: ^bb1, ^bb9
    %1 = arith.cmpi slt, %0, %c2 : index
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
    %6 = memref.load %arg0[%0, %4] : memref<2x3xi32>
    %7 = memref.load %arg1[%4, %2] : memref<3x3xi32>
    %8 = memref.load %arg2[%0, %2] : memref<2x3xi32>
    %9 = arith.muli %6, %7 : i32
    %10 = arith.addi %8, %9 : i32
    memref.store %10, %arg2[%0, %2] : memref<2x3xi32>
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
  memref.global "private" constant @__constant_3x3xi32 : memref<3x3xi32> = dense<[[1, -2, 3], [-4, 5, -6], [7, -8, 9]]>
  func.func @forward(%arg0: memref<2x3xi32>) -> memref<2x3xi32> {
    %c2 = arith.constant 2 : index
    %c1 = arith.constant 1 : index
    %c3 = arith.constant 3 : index
    %c0 = arith.constant 0 : index
    %c0_i32 = arith.constant 0 : i32
    %0 = memref.get_global @__constant_3x3xi32 : memref<3x3xi32>
    %1 = memref.alloca() {alignment = 64 : i64} : memref<3x3xi32>
    cf.br ^bb1(%c0 : index)
  ^bb1(%2: index):  // 2 preds: ^bb0, ^bb5
    %3 = arith.cmpi slt, %2, %c3 : index
    cf.cond_br %3, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    cf.br ^bb3(%c0 : index)
  ^bb3(%4: index):  // 2 preds: ^bb2, ^bb4
    %5 = arith.cmpi slt, %4, %c3 : index
    cf.cond_br %5, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    %6 = memref.load %0[%2, %4] : memref<3x3xi32>
    memref.store %6, %1[%4, %2] : memref<3x3xi32>
    %7 = arith.addi %4, %c1 : index
    cf.br ^bb3(%7 : index)
  ^bb5:  // pred: ^bb3
    %8 = arith.addi %2, %c1 : index
    cf.br ^bb1(%8 : index)
  ^bb6:  // pred: ^bb1
    %9 = memref.alloca() : memref<2x3xi32>
    cf.br ^bb7(%c0 : index)
  ^bb7(%10: index):  // 2 preds: ^bb6, ^bb11
    %11 = arith.cmpi slt, %10, %c2 : index
    cf.cond_br %11, ^bb8, ^bb12
  ^bb8:  // pred: ^bb7
    cf.br ^bb9(%c0 : index)
  ^bb9(%12: index):  // 2 preds: ^bb8, ^bb10
    %13 = arith.cmpi slt, %12, %c3 : index
    cf.cond_br %13, ^bb10, ^bb11
  ^bb10:  // pred: ^bb9
    memref.store %c0_i32, %9[%10, %12] : memref<2x3xi32>
    %14 = arith.addi %12, %c1 : index
    cf.br ^bb9(%14 : index)
  ^bb11:  // pred: ^bb9
    %15 = arith.addi %10, %c1 : index
    cf.br ^bb7(%15 : index)
  ^bb12:  // pred: ^bb7
    %16 = memref.alloc() {alignment = 64 : i64} : memref<2x3xi32>
    memref.copy %9, %16 : memref<2x3xi32> to memref<2x3xi32>
    FDRA.KernelCall @forward_kernel_0(%arg0, %1, %16) : (memref<2x3xi32>, memref<3x3xi32>, memref<2x3xi32>) -> ()
    return %16 : memref<2x3xi32>
  }
  func.func @forward_kernel_0(%arg0: memref<2x3xi32>, %arg1: memref<3x3xi32>, %arg2: memref<2x3xi32>) attributes {Kernel, forward_kernel_0} {
    %c3 = arith.constant 3 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%c0 : index)
  ^bb2(%0: index):  // 2 preds: ^bb1, ^bb9
    %1 = arith.cmpi slt, %0, %c2 : index
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
    %6 = memref.load %arg0[%0, %4] : memref<2x3xi32>
    %7 = memref.load %arg1[%4, %2] : memref<3x3xi32>
    %8 = memref.load %arg2[%0, %2] : memref<2x3xi32>
    %9 = arith.muli %6, %7 : i32
    %10 = arith.addi %8, %9 : i32
    memref.store %10, %arg2[%0, %2] : memref<2x3xi32>
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
  memref.global "private" constant @__constant_3x3xi32 : memref<3x3xi32> = dense<[[1, -2, 3], [-4, 5, -6], [7, -8, 9]]>
  func.func @forward(%arg0: memref<2x3xi32>) -> memref<2x3xi32> {
    %0 = llvm.mlir.constant(2 : index) : i64
    %1 = llvm.mlir.constant(1 : index) : i64
    %2 = llvm.mlir.constant(3 : index) : i64
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = builtin.unrealized_conversion_cast %3 : i64 to index
    %5 = llvm.mlir.constant(0 : i32) : i32
    %6 = memref.get_global @__constant_3x3xi32 : memref<3x3xi32>
    %7 = memref.alloca() {alignment = 64 : i64} : memref<3x3xi32>
    cf.br ^bb1(%4 : index)
  ^bb1(%8: index):  // 2 preds: ^bb0, ^bb5
    %9 = builtin.unrealized_conversion_cast %8 : index to i64
    %10 = llvm.icmp "slt" %9, %2 : i64
    cf.cond_br %10, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    cf.br ^bb3(%4 : index)
  ^bb3(%11: index):  // 2 preds: ^bb2, ^bb4
    %12 = builtin.unrealized_conversion_cast %11 : index to i64
    %13 = llvm.icmp "slt" %12, %2 : i64
    cf.cond_br %13, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    %14 = memref.load %6[%8, %11] : memref<3x3xi32>
    memref.store %14, %7[%11, %8] : memref<3x3xi32>
    %15 = llvm.add %12, %1  : i64
    %16 = builtin.unrealized_conversion_cast %15 : i64 to index
    cf.br ^bb3(%16 : index)
  ^bb5:  // pred: ^bb3
    %17 = llvm.add %9, %1  : i64
    %18 = builtin.unrealized_conversion_cast %17 : i64 to index
    cf.br ^bb1(%18 : index)
  ^bb6:  // pred: ^bb1
    %19 = memref.alloca() : memref<2x3xi32>
    cf.br ^bb7(%4 : index)
  ^bb7(%20: index):  // 2 preds: ^bb6, ^bb11
    %21 = builtin.unrealized_conversion_cast %20 : index to i64
    %22 = llvm.icmp "slt" %21, %0 : i64
    cf.cond_br %22, ^bb8, ^bb12
  ^bb8:  // pred: ^bb7
    cf.br ^bb9(%4 : index)
  ^bb9(%23: index):  // 2 preds: ^bb8, ^bb10
    %24 = builtin.unrealized_conversion_cast %23 : index to i64
    %25 = llvm.icmp "slt" %24, %2 : i64
    cf.cond_br %25, ^bb10, ^bb11
  ^bb10:  // pred: ^bb9
    memref.store %5, %19[%20, %23] : memref<2x3xi32>
    %26 = llvm.add %24, %1  : i64
    %27 = builtin.unrealized_conversion_cast %26 : i64 to index
    cf.br ^bb9(%27 : index)
  ^bb11:  // pred: ^bb9
    %28 = llvm.add %21, %1  : i64
    %29 = builtin.unrealized_conversion_cast %28 : i64 to index
    cf.br ^bb7(%29 : index)
  ^bb12:  // pred: ^bb7
    %30 = memref.alloc() {alignment = 64 : i64} : memref<2x3xi32>
    memref.copy %19, %30 : memref<2x3xi32> to memref<2x3xi32>
    FDRA.KernelCall @forward_kernel_0(%arg0, %7, %30) : (memref<2x3xi32>, memref<3x3xi32>, memref<2x3xi32>) -> ()
    return %30 : memref<2x3xi32>
  }
  func.func @forward_kernel_0(%arg0: memref<2x3xi32>, %arg1: memref<3x3xi32>, %arg2: memref<2x3xi32>) attributes {Kernel, forward_kernel_0} {
    %0 = llvm.mlir.constant(3 : index) : i64
    %1 = llvm.mlir.constant(1 : index) : i64
    %2 = llvm.mlir.constant(2 : index) : i64
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
    %14 = memref.load %arg0[%5, %11] : memref<2x3xi32>
    %15 = memref.load %arg1[%11, %8] : memref<3x3xi32>
    %16 = memref.load %arg2[%5, %8] : memref<2x3xi32>
    %17 = llvm.mul %14, %15  : i32
    %18 = llvm.add %16, %17  : i32
    memref.store %18, %arg2[%5, %8] : memref<2x3xi32>
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
  memref.global "private" constant @__constant_3x3xi32 : memref<3x3xi32> = dense<[[1, -2, 3], [-4, 5, -6], [7, -8, 9]]>
  llvm.func @forward(%arg0: !llvm.ptr<i32>) -> !llvm.ptr<i32> {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.mlir.constant(2 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.mlir.constant(3 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %9 = llvm.mlir.constant(3 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.mlir.constant(1 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = llvm.mlir.constant(2 : index) : i64
    %14 = llvm.mlir.constant(1 : index) : i64
    %15 = llvm.mlir.constant(3 : index) : i64
    %16 = llvm.mlir.constant(0 : index) : i64
    %17 = builtin.unrealized_conversion_cast %16 : i64 to index
    %18 = llvm.mlir.constant(0 : i32) : i32
    %19 = memref.get_global @__constant_3x3xi32 : memref<3x3xi32>
    %20 = memref.alloca() {alignment = 64 : i64} : memref<3x3xi32>
    %21 = builtin.unrealized_conversion_cast %20 : memref<3x3xi32> to !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>
    llvm.br ^bb1(%16 : i64)
  ^bb1(%22: i64):  // 2 preds: ^bb0, ^bb5
    %23 = builtin.unrealized_conversion_cast %22 : i64 to index
    %24 = builtin.unrealized_conversion_cast %23 : index to i64
    %25 = llvm.icmp "slt" %24, %15 : i64
    llvm.cond_br %25, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    llvm.br ^bb3(%16 : i64)
  ^bb3(%26: i64):  // 2 preds: ^bb2, ^bb4
    %27 = builtin.unrealized_conversion_cast %26 : i64 to index
    %28 = builtin.unrealized_conversion_cast %27 : index to i64
    %29 = llvm.icmp "slt" %28, %15 : i64
    llvm.cond_br %29, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    %30 = memref.load %19[%23, %27] : memref<3x3xi32>
    memref.store %30, %20[%27, %23] : memref<3x3xi32>
    %31 = llvm.add %28, %14  : i64
    %32 = builtin.unrealized_conversion_cast %31 : i64 to index
    llvm.br ^bb3(%31 : i64)
  ^bb5:  // pred: ^bb3
    %33 = llvm.add %24, %14  : i64
    %34 = builtin.unrealized_conversion_cast %33 : i64 to index
    llvm.br ^bb1(%33 : i64)
  ^bb6:  // pred: ^bb1
    %35 = memref.alloca() : memref<2x3xi32>
    llvm.br ^bb7(%16 : i64)
  ^bb7(%36: i64):  // 2 preds: ^bb6, ^bb11
    %37 = builtin.unrealized_conversion_cast %36 : i64 to index
    %38 = builtin.unrealized_conversion_cast %37 : index to i64
    %39 = llvm.icmp "slt" %38, %13 : i64
    llvm.cond_br %39, ^bb8, ^bb12
  ^bb8:  // pred: ^bb7
    llvm.br ^bb9(%16 : i64)
  ^bb9(%40: i64):  // 2 preds: ^bb8, ^bb10
    %41 = builtin.unrealized_conversion_cast %40 : i64 to index
    %42 = builtin.unrealized_conversion_cast %41 : index to i64
    %43 = llvm.icmp "slt" %42, %15 : i64
    llvm.cond_br %43, ^bb10, ^bb11
  ^bb10:  // pred: ^bb9
    memref.store %18, %35[%37, %41] : memref<2x3xi32>
    %44 = llvm.add %42, %14  : i64
    %45 = builtin.unrealized_conversion_cast %44 : i64 to index
    llvm.br ^bb9(%44 : i64)
  ^bb11:  // pred: ^bb9
    %46 = llvm.add %38, %14  : i64
    %47 = builtin.unrealized_conversion_cast %46 : i64 to index
    llvm.br ^bb7(%46 : i64)
  ^bb12:  // pred: ^bb7
    %48 = memref.alloc() {alignment = 64 : i64} : memref<2x3xi32>
    %49 = builtin.unrealized_conversion_cast %48 : memref<2x3xi32> to !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>
    memref.copy %35, %48 : memref<2x3xi32> to memref<2x3xi32>
    %50 = llvm.extractvalue %12[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %51 = llvm.extractvalue %21[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %52 = llvm.extractvalue %49[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_0(%50, %51, %52) : (!llvm.ptr<i32>, !llvm.ptr<i32>, !llvm.ptr<i32>) -> ()
    %53 = llvm.extractvalue %49[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.return %53 : !llvm.ptr<i32>
  }
  llvm.func @forward_kernel_0(!llvm.ptr<i32>, !llvm.ptr<i32>, !llvm.ptr<i32>) attributes {Kernel, forward_kernel_0}
}


// -----// IR Dump After ConvertFuncToLLVM (convert-func-to-llvm) //----- //
module attributes {llvm.data_layout = "", torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_3x3xi32 : memref<3x3xi32> = dense<[[1, -2, 3], [-4, 5, -6], [7, -8, 9]]>
  llvm.func @forward(%arg0: !llvm.ptr<i32>) -> !llvm.ptr<i32> {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.mlir.constant(2 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.mlir.constant(3 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %9 = llvm.mlir.constant(3 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.mlir.constant(1 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = llvm.mlir.constant(2 : index) : i64
    %14 = llvm.mlir.constant(1 : index) : i64
    %15 = llvm.mlir.constant(3 : index) : i64
    %16 = llvm.mlir.constant(0 : index) : i64
    %17 = builtin.unrealized_conversion_cast %16 : i64 to index
    %18 = llvm.mlir.constant(0 : i32) : i32
    %19 = memref.get_global @__constant_3x3xi32 : memref<3x3xi32>
    %20 = memref.alloca() {alignment = 64 : i64} : memref<3x3xi32>
    %21 = builtin.unrealized_conversion_cast %20 : memref<3x3xi32> to !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>
    llvm.br ^bb1(%16 : i64)
  ^bb1(%22: i64):  // 2 preds: ^bb0, ^bb5
    %23 = builtin.unrealized_conversion_cast %22 : i64 to index
    %24 = builtin.unrealized_conversion_cast %23 : index to i64
    %25 = llvm.icmp "slt" %24, %15 : i64
    llvm.cond_br %25, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    llvm.br ^bb3(%16 : i64)
  ^bb3(%26: i64):  // 2 preds: ^bb2, ^bb4
    %27 = builtin.unrealized_conversion_cast %26 : i64 to index
    %28 = builtin.unrealized_conversion_cast %27 : index to i64
    %29 = llvm.icmp "slt" %28, %15 : i64
    llvm.cond_br %29, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    %30 = memref.load %19[%23, %27] : memref<3x3xi32>
    memref.store %30, %20[%27, %23] : memref<3x3xi32>
    %31 = llvm.add %28, %14  : i64
    %32 = builtin.unrealized_conversion_cast %31 : i64 to index
    llvm.br ^bb3(%31 : i64)
  ^bb5:  // pred: ^bb3
    %33 = llvm.add %24, %14  : i64
    %34 = builtin.unrealized_conversion_cast %33 : i64 to index
    llvm.br ^bb1(%33 : i64)
  ^bb6:  // pred: ^bb1
    %35 = memref.alloca() : memref<2x3xi32>
    llvm.br ^bb7(%16 : i64)
  ^bb7(%36: i64):  // 2 preds: ^bb6, ^bb11
    %37 = builtin.unrealized_conversion_cast %36 : i64 to index
    %38 = builtin.unrealized_conversion_cast %37 : index to i64
    %39 = llvm.icmp "slt" %38, %13 : i64
    llvm.cond_br %39, ^bb8, ^bb12
  ^bb8:  // pred: ^bb7
    llvm.br ^bb9(%16 : i64)
  ^bb9(%40: i64):  // 2 preds: ^bb8, ^bb10
    %41 = builtin.unrealized_conversion_cast %40 : i64 to index
    %42 = builtin.unrealized_conversion_cast %41 : index to i64
    %43 = llvm.icmp "slt" %42, %15 : i64
    llvm.cond_br %43, ^bb10, ^bb11
  ^bb10:  // pred: ^bb9
    memref.store %18, %35[%37, %41] : memref<2x3xi32>
    %44 = llvm.add %42, %14  : i64
    %45 = builtin.unrealized_conversion_cast %44 : i64 to index
    llvm.br ^bb9(%44 : i64)
  ^bb11:  // pred: ^bb9
    %46 = llvm.add %38, %14  : i64
    %47 = builtin.unrealized_conversion_cast %46 : i64 to index
    llvm.br ^bb7(%46 : i64)
  ^bb12:  // pred: ^bb7
    %48 = memref.alloc() {alignment = 64 : i64} : memref<2x3xi32>
    %49 = builtin.unrealized_conversion_cast %48 : memref<2x3xi32> to !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>
    memref.copy %35, %48 : memref<2x3xi32> to memref<2x3xi32>
    %50 = llvm.extractvalue %12[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %51 = llvm.extractvalue %21[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %52 = llvm.extractvalue %49[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_0(%50, %51, %52) : (!llvm.ptr<i32>, !llvm.ptr<i32>, !llvm.ptr<i32>) -> ()
    %53 = llvm.extractvalue %49[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.return %53 : !llvm.ptr<i32>
  }
  llvm.func @forward_kernel_0(!llvm.ptr<i32>, !llvm.ptr<i32>, !llvm.ptr<i32>) attributes {Kernel, forward_kernel_0}
}


// -----// IR Dump After ConvertMemRefToLLVM (convert-memref-to-llvm) //----- //
module attributes {llvm.data_layout = "", torch.debug_module_name = "L"} {
  llvm.func @malloc(i64) -> !llvm.ptr<i8>
  llvm.mlir.global private constant @__constant_3x3xi32(dense<[[1, -2, 3], [-4, 5, -6], [7, -8, 9]]> : tensor<3x3xi32>) : !llvm.array<3 x array<3 x i32>>
  llvm.func @forward(%arg0: !llvm.ptr<i32>) -> !llvm.ptr<i32> {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.mlir.constant(2 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.mlir.constant(3 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %9 = llvm.mlir.constant(3 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.mlir.constant(1 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = llvm.mlir.constant(2 : index) : i64
    %14 = llvm.mlir.constant(1 : index) : i64
    %15 = llvm.mlir.constant(3 : index) : i64
    %16 = llvm.mlir.constant(0 : index) : i64
    %17 = builtin.unrealized_conversion_cast %16 : i64 to index
    %18 = llvm.mlir.constant(0 : i32) : i32
    %19 = llvm.mlir.constant(3 : index) : i64
    %20 = llvm.mlir.constant(3 : index) : i64
    %21 = llvm.mlir.constant(1 : index) : i64
    %22 = llvm.mlir.constant(9 : index) : i64
    %23 = llvm.mlir.null : !llvm.ptr<i32>
    %24 = llvm.getelementptr %23[%22] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    %25 = llvm.ptrtoint %24 : !llvm.ptr<i32> to i64
    %26 = llvm.mlir.addressof @__constant_3x3xi32 : !llvm.ptr<array<3 x array<3 x i32>>>
    %27 = llvm.getelementptr %26[0, 0, 0] : (!llvm.ptr<array<3 x array<3 x i32>>>) -> !llvm.ptr<i32>
    %28 = llvm.mlir.constant(3735928559 : index) : i64
    %29 = llvm.inttoptr %28 : i64 to !llvm.ptr<i32>
    %30 = llvm.mlir.undef : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>
    %31 = llvm.insertvalue %29, %30[0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %32 = llvm.insertvalue %27, %31[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %33 = llvm.mlir.constant(0 : index) : i64
    %34 = llvm.insertvalue %33, %32[2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %35 = llvm.insertvalue %19, %34[3, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %36 = llvm.insertvalue %20, %35[3, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %37 = llvm.insertvalue %20, %36[4, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %38 = llvm.insertvalue %21, %37[4, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %39 = llvm.mlir.constant(3 : index) : i64
    %40 = llvm.mlir.constant(3 : index) : i64
    %41 = llvm.mlir.constant(1 : index) : i64
    %42 = llvm.mlir.constant(9 : index) : i64
    %43 = llvm.mlir.null : !llvm.ptr<i32>
    %44 = llvm.getelementptr %43[%42] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    %45 = llvm.ptrtoint %44 : !llvm.ptr<i32> to i64
    %46 = llvm.alloca %45 x i32 {alignment = 64 : i64} : (i64) -> !llvm.ptr<i32>
    %47 = llvm.mlir.undef : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>
    %48 = llvm.insertvalue %46, %47[0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %49 = llvm.insertvalue %46, %48[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %50 = llvm.mlir.constant(0 : index) : i64
    %51 = llvm.insertvalue %50, %49[2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %52 = llvm.insertvalue %39, %51[3, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %53 = llvm.insertvalue %40, %52[3, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %54 = llvm.insertvalue %40, %53[4, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %55 = llvm.insertvalue %41, %54[4, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %56 = builtin.unrealized_conversion_cast %55 : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> to memref<3x3xi32>
    %57 = builtin.unrealized_conversion_cast %56 : memref<3x3xi32> to !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>
    llvm.br ^bb1(%16 : i64)
  ^bb1(%58: i64):  // 2 preds: ^bb0, ^bb5
    %59 = builtin.unrealized_conversion_cast %58 : i64 to index
    %60 = builtin.unrealized_conversion_cast %59 : index to i64
    %61 = llvm.icmp "slt" %60, %15 : i64
    llvm.cond_br %61, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    llvm.br ^bb3(%16 : i64)
  ^bb3(%62: i64):  // 2 preds: ^bb2, ^bb4
    %63 = builtin.unrealized_conversion_cast %62 : i64 to index
    %64 = builtin.unrealized_conversion_cast %63 : index to i64
    %65 = llvm.icmp "slt" %64, %15 : i64
    llvm.cond_br %65, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    %66 = llvm.extractvalue %38[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %67 = llvm.mlir.constant(3 : index) : i64
    %68 = llvm.mul %58, %67  : i64
    %69 = llvm.add %68, %62  : i64
    %70 = llvm.getelementptr %66[%69] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    %71 = llvm.load %70 : !llvm.ptr<i32>
    %72 = llvm.extractvalue %55[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %73 = llvm.mlir.constant(3 : index) : i64
    %74 = llvm.mul %62, %73  : i64
    %75 = llvm.add %74, %58  : i64
    %76 = llvm.getelementptr %72[%75] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    llvm.store %71, %76 : !llvm.ptr<i32>
    %77 = llvm.add %64, %14  : i64
    %78 = builtin.unrealized_conversion_cast %77 : i64 to index
    llvm.br ^bb3(%77 : i64)
  ^bb5:  // pred: ^bb3
    %79 = llvm.add %60, %14  : i64
    %80 = builtin.unrealized_conversion_cast %79 : i64 to index
    llvm.br ^bb1(%79 : i64)
  ^bb6:  // pred: ^bb1
    %81 = llvm.mlir.constant(2 : index) : i64
    %82 = llvm.mlir.constant(3 : index) : i64
    %83 = llvm.mlir.constant(1 : index) : i64
    %84 = llvm.mlir.constant(6 : index) : i64
    %85 = llvm.mlir.null : !llvm.ptr<i32>
    %86 = llvm.getelementptr %85[%84] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    %87 = llvm.ptrtoint %86 : !llvm.ptr<i32> to i64
    %88 = llvm.alloca %87 x i32 : (i64) -> !llvm.ptr<i32>
    %89 = llvm.mlir.undef : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>
    %90 = llvm.insertvalue %88, %89[0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %91 = llvm.insertvalue %88, %90[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %92 = llvm.mlir.constant(0 : index) : i64
    %93 = llvm.insertvalue %92, %91[2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %94 = llvm.insertvalue %81, %93[3, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %95 = llvm.insertvalue %82, %94[3, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %96 = llvm.insertvalue %82, %95[4, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %97 = llvm.insertvalue %83, %96[4, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.br ^bb7(%16 : i64)
  ^bb7(%98: i64):  // 2 preds: ^bb6, ^bb11
    %99 = builtin.unrealized_conversion_cast %98 : i64 to index
    %100 = builtin.unrealized_conversion_cast %99 : index to i64
    %101 = llvm.icmp "slt" %100, %13 : i64
    llvm.cond_br %101, ^bb8, ^bb12
  ^bb8:  // pred: ^bb7
    llvm.br ^bb9(%16 : i64)
  ^bb9(%102: i64):  // 2 preds: ^bb8, ^bb10
    %103 = builtin.unrealized_conversion_cast %102 : i64 to index
    %104 = builtin.unrealized_conversion_cast %103 : index to i64
    %105 = llvm.icmp "slt" %104, %15 : i64
    llvm.cond_br %105, ^bb10, ^bb11
  ^bb10:  // pred: ^bb9
    %106 = llvm.extractvalue %97[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %107 = llvm.mlir.constant(3 : index) : i64
    %108 = llvm.mul %98, %107  : i64
    %109 = llvm.add %108, %102  : i64
    %110 = llvm.getelementptr %106[%109] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    llvm.store %18, %110 : !llvm.ptr<i32>
    %111 = llvm.add %104, %14  : i64
    %112 = builtin.unrealized_conversion_cast %111 : i64 to index
    llvm.br ^bb9(%111 : i64)
  ^bb11:  // pred: ^bb9
    %113 = llvm.add %100, %14  : i64
    %114 = builtin.unrealized_conversion_cast %113 : i64 to index
    llvm.br ^bb7(%113 : i64)
  ^bb12:  // pred: ^bb7
    %115 = llvm.mlir.constant(2 : index) : i64
    %116 = llvm.mlir.constant(3 : index) : i64
    %117 = llvm.mlir.constant(1 : index) : i64
    %118 = llvm.mlir.constant(6 : index) : i64
    %119 = llvm.mlir.null : !llvm.ptr<i32>
    %120 = llvm.getelementptr %119[%118] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    %121 = llvm.ptrtoint %120 : !llvm.ptr<i32> to i64
    %122 = llvm.mlir.constant(64 : index) : i64
    %123 = llvm.add %121, %122  : i64
    %124 = llvm.call @malloc(%123) : (i64) -> !llvm.ptr<i8>
    %125 = llvm.bitcast %124 : !llvm.ptr<i8> to !llvm.ptr<i32>
    %126 = llvm.ptrtoint %125 : !llvm.ptr<i32> to i64
    %127 = llvm.mlir.constant(1 : index) : i64
    %128 = llvm.sub %122, %127  : i64
    %129 = llvm.add %126, %128  : i64
    %130 = llvm.urem %129, %122  : i64
    %131 = llvm.sub %129, %130  : i64
    %132 = llvm.inttoptr %131 : i64 to !llvm.ptr<i32>
    %133 = llvm.mlir.undef : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>
    %134 = llvm.insertvalue %125, %133[0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %135 = llvm.insertvalue %132, %134[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %136 = llvm.mlir.constant(0 : index) : i64
    %137 = llvm.insertvalue %136, %135[2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %138 = llvm.insertvalue %115, %137[3, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %139 = llvm.insertvalue %116, %138[3, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %140 = llvm.insertvalue %116, %139[4, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %141 = llvm.insertvalue %117, %140[4, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %142 = builtin.unrealized_conversion_cast %141 : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> to memref<2x3xi32>
    %143 = builtin.unrealized_conversion_cast %142 : memref<2x3xi32> to !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>
    %144 = llvm.mlir.constant(1 : index) : i64
    %145 = llvm.extractvalue %97[3, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %146 = llvm.mul %144, %145  : i64
    %147 = llvm.extractvalue %97[3, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %148 = llvm.mul %146, %147  : i64
    %149 = llvm.mlir.null : !llvm.ptr<i32>
    %150 = llvm.getelementptr %149[1] : (!llvm.ptr<i32>) -> !llvm.ptr<i32>
    %151 = llvm.ptrtoint %150 : !llvm.ptr<i32> to i64
    %152 = llvm.mul %148, %151  : i64
    %153 = llvm.extractvalue %97[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %154 = llvm.extractvalue %97[2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %155 = llvm.getelementptr %153[%154] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    %156 = llvm.extractvalue %141[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %157 = llvm.extractvalue %141[2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %158 = llvm.getelementptr %156[%157] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    %159 = llvm.mlir.constant(false) : i1
    "llvm.intr.memcpy"(%158, %155, %152, %159) : (!llvm.ptr<i32>, !llvm.ptr<i32>, i64, i1) -> ()
    %160 = llvm.extractvalue %12[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %161 = llvm.extractvalue %57[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %162 = llvm.extractvalue %143[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_0(%160, %161, %162) : (!llvm.ptr<i32>, !llvm.ptr<i32>, !llvm.ptr<i32>) -> ()
    %163 = llvm.extractvalue %143[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.return %163 : !llvm.ptr<i32>
  }
  llvm.func @forward_kernel_0(!llvm.ptr<i32>, !llvm.ptr<i32>, !llvm.ptr<i32>) attributes {Kernel, forward_kernel_0}
}


// -----// IR Dump After ReconcileUnrealizedCasts (reconcile-unrealized-casts) //----- //
module attributes {llvm.data_layout = "", torch.debug_module_name = "L"} {
  llvm.func @malloc(i64) -> !llvm.ptr<i8>
  llvm.mlir.global private constant @__constant_3x3xi32(dense<[[1, -2, 3], [-4, 5, -6], [7, -8, 9]]> : tensor<3x3xi32>) : !llvm.array<3 x array<3 x i32>>
  llvm.func @forward(%arg0: !llvm.ptr<i32>) -> !llvm.ptr<i32> {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.mlir.constant(2 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.mlir.constant(3 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %9 = llvm.mlir.constant(3 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.mlir.constant(1 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = llvm.mlir.constant(2 : index) : i64
    %14 = llvm.mlir.constant(1 : index) : i64
    %15 = llvm.mlir.constant(3 : index) : i64
    %16 = llvm.mlir.constant(0 : index) : i64
    %17 = llvm.mlir.constant(0 : i32) : i32
    %18 = llvm.mlir.constant(3 : index) : i64
    %19 = llvm.mlir.constant(3 : index) : i64
    %20 = llvm.mlir.constant(1 : index) : i64
    %21 = llvm.mlir.constant(9 : index) : i64
    %22 = llvm.mlir.null : !llvm.ptr<i32>
    %23 = llvm.getelementptr %22[9] : (!llvm.ptr<i32>) -> !llvm.ptr<i32>
    %24 = llvm.ptrtoint %23 : !llvm.ptr<i32> to i64
    %25 = llvm.mlir.addressof @__constant_3x3xi32 : !llvm.ptr<array<3 x array<3 x i32>>>
    %26 = llvm.getelementptr %25[0, 0, 0] : (!llvm.ptr<array<3 x array<3 x i32>>>) -> !llvm.ptr<i32>
    %27 = llvm.mlir.constant(3735928559 : index) : i64
    %28 = llvm.inttoptr %27 : i64 to !llvm.ptr<i32>
    %29 = llvm.mlir.undef : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>
    %30 = llvm.insertvalue %28, %29[0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %31 = llvm.insertvalue %26, %30[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %32 = llvm.mlir.constant(0 : index) : i64
    %33 = llvm.insertvalue %32, %31[2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %34 = llvm.insertvalue %18, %33[3, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %35 = llvm.insertvalue %19, %34[3, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %36 = llvm.insertvalue %19, %35[4, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %37 = llvm.insertvalue %20, %36[4, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %38 = llvm.mlir.constant(3 : index) : i64
    %39 = llvm.mlir.constant(3 : index) : i64
    %40 = llvm.mlir.constant(1 : index) : i64
    %41 = llvm.mlir.constant(9 : index) : i64
    %42 = llvm.mlir.null : !llvm.ptr<i32>
    %43 = llvm.getelementptr %42[9] : (!llvm.ptr<i32>) -> !llvm.ptr<i32>
    %44 = llvm.ptrtoint %43 : !llvm.ptr<i32> to i64
    %45 = llvm.alloca %44 x i32 {alignment = 64 : i64} : (i64) -> !llvm.ptr<i32>
    %46 = llvm.mlir.undef : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>
    %47 = llvm.insertvalue %45, %46[0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %48 = llvm.insertvalue %45, %47[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %49 = llvm.mlir.constant(0 : index) : i64
    %50 = llvm.insertvalue %49, %48[2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %51 = llvm.insertvalue %38, %50[3, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %52 = llvm.insertvalue %39, %51[3, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %53 = llvm.insertvalue %39, %52[4, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %54 = llvm.insertvalue %40, %53[4, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.br ^bb1(%16 : i64)
  ^bb1(%55: i64):  // 2 preds: ^bb0, ^bb5
    %56 = llvm.icmp "slt" %55, %15 : i64
    llvm.cond_br %56, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    llvm.br ^bb3(%16 : i64)
  ^bb3(%57: i64):  // 2 preds: ^bb2, ^bb4
    %58 = llvm.icmp "slt" %57, %15 : i64
    llvm.cond_br %58, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    %59 = llvm.mlir.constant(3 : index) : i64
    %60 = llvm.mul %55, %59  : i64
    %61 = llvm.add %60, %57  : i64
    %62 = llvm.getelementptr %26[%61] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    %63 = llvm.load %62 : !llvm.ptr<i32>
    %64 = llvm.mlir.constant(3 : index) : i64
    %65 = llvm.mul %57, %64  : i64
    %66 = llvm.add %65, %55  : i64
    %67 = llvm.getelementptr %45[%66] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    llvm.store %63, %67 : !llvm.ptr<i32>
    %68 = llvm.add %57, %14  : i64
    llvm.br ^bb3(%68 : i64)
  ^bb5:  // pred: ^bb3
    %69 = llvm.add %55, %14  : i64
    llvm.br ^bb1(%69 : i64)
  ^bb6:  // pred: ^bb1
    %70 = llvm.mlir.constant(2 : index) : i64
    %71 = llvm.mlir.constant(3 : index) : i64
    %72 = llvm.mlir.constant(1 : index) : i64
    %73 = llvm.mlir.constant(6 : index) : i64
    %74 = llvm.mlir.null : !llvm.ptr<i32>
    %75 = llvm.getelementptr %74[6] : (!llvm.ptr<i32>) -> !llvm.ptr<i32>
    %76 = llvm.ptrtoint %75 : !llvm.ptr<i32> to i64
    %77 = llvm.alloca %76 x i32 : (i64) -> !llvm.ptr<i32>
    %78 = llvm.mlir.undef : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>
    %79 = llvm.insertvalue %77, %78[0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %80 = llvm.insertvalue %77, %79[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %81 = llvm.mlir.constant(0 : index) : i64
    %82 = llvm.insertvalue %81, %80[2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %83 = llvm.insertvalue %70, %82[3, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %84 = llvm.insertvalue %71, %83[3, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %85 = llvm.insertvalue %71, %84[4, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %86 = llvm.insertvalue %72, %85[4, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.br ^bb7(%16 : i64)
  ^bb7(%87: i64):  // 2 preds: ^bb6, ^bb11
    %88 = llvm.icmp "slt" %87, %13 : i64
    llvm.cond_br %88, ^bb8, ^bb12
  ^bb8:  // pred: ^bb7
    llvm.br ^bb9(%16 : i64)
  ^bb9(%89: i64):  // 2 preds: ^bb8, ^bb10
    %90 = llvm.icmp "slt" %89, %15 : i64
    llvm.cond_br %90, ^bb10, ^bb11
  ^bb10:  // pred: ^bb9
    %91 = llvm.mlir.constant(3 : index) : i64
    %92 = llvm.mul %87, %91  : i64
    %93 = llvm.add %92, %89  : i64
    %94 = llvm.getelementptr %77[%93] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    llvm.store %17, %94 : !llvm.ptr<i32>
    %95 = llvm.add %89, %14  : i64
    llvm.br ^bb9(%95 : i64)
  ^bb11:  // pred: ^bb9
    %96 = llvm.add %87, %14  : i64
    llvm.br ^bb7(%96 : i64)
  ^bb12:  // pred: ^bb7
    %97 = llvm.mlir.constant(2 : index) : i64
    %98 = llvm.mlir.constant(3 : index) : i64
    %99 = llvm.mlir.constant(1 : index) : i64
    %100 = llvm.mlir.constant(6 : index) : i64
    %101 = llvm.mlir.null : !llvm.ptr<i32>
    %102 = llvm.getelementptr %101[6] : (!llvm.ptr<i32>) -> !llvm.ptr<i32>
    %103 = llvm.ptrtoint %102 : !llvm.ptr<i32> to i64
    %104 = llvm.mlir.constant(64 : index) : i64
    %105 = llvm.add %103, %104  : i64
    %106 = llvm.call @malloc(%105) : (i64) -> !llvm.ptr<i8>
    %107 = llvm.bitcast %106 : !llvm.ptr<i8> to !llvm.ptr<i32>
    %108 = llvm.ptrtoint %107 : !llvm.ptr<i32> to i64
    %109 = llvm.mlir.constant(1 : index) : i64
    %110 = llvm.sub %104, %109  : i64
    %111 = llvm.add %108, %110  : i64
    %112 = llvm.urem %111, %104  : i64
    %113 = llvm.sub %111, %112  : i64
    %114 = llvm.inttoptr %113 : i64 to !llvm.ptr<i32>
    %115 = llvm.mlir.undef : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>
    %116 = llvm.insertvalue %107, %115[0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %117 = llvm.insertvalue %114, %116[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %118 = llvm.mlir.constant(0 : index) : i64
    %119 = llvm.insertvalue %118, %117[2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %120 = llvm.insertvalue %97, %119[3, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %121 = llvm.insertvalue %98, %120[3, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %122 = llvm.insertvalue %98, %121[4, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %123 = llvm.insertvalue %99, %122[4, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %124 = llvm.mlir.constant(1 : index) : i64
    %125 = llvm.mul %124, %70  : i64
    %126 = llvm.mul %125, %71  : i64
    %127 = llvm.mlir.null : !llvm.ptr<i32>
    %128 = llvm.getelementptr %127[1] : (!llvm.ptr<i32>) -> !llvm.ptr<i32>
    %129 = llvm.ptrtoint %128 : !llvm.ptr<i32> to i64
    %130 = llvm.mul %126, %129  : i64
    %131 = llvm.getelementptr %77[%81] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    %132 = llvm.getelementptr %114[%118] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    %133 = llvm.mlir.constant(false) : i1
    "llvm.intr.memcpy"(%132, %131, %130, %133) : (!llvm.ptr<i32>, !llvm.ptr<i32>, i64, i1) -> ()
    %134 = llvm.extractvalue %54[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %135 = llvm.extractvalue %123[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_0(%arg0, %134, %135) : (!llvm.ptr<i32>, !llvm.ptr<i32>, !llvm.ptr<i32>) -> ()
    %136 = llvm.extractvalue %123[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.return %136 : !llvm.ptr<i32>
  }
  llvm.func @forward_kernel_0(!llvm.ptr<i32>, !llvm.ptr<i32>, !llvm.ptr<i32>) attributes {Kernel, forward_kernel_0}
}


