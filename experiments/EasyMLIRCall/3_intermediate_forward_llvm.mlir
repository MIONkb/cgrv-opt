// -----// IR Dump After PromoteBuffersToStack (promote-buffers-to-stack) //----- //
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

// -----// IR Dump After PromoteBuffersToStack (promote-buffers-to-stack) //----- //
func.func @forward(%arg0: memref<3x5xf32>, %arg1: memref<3x5xf32>) -> memref<3x5xf32> {
  %alloc = memref.alloc() {alignment = 64 : i64} : memref<3x5xf32>
  %0 = FDRA.BlockLoad %arg0 [0, 0] : memref<3x5xf32> -> memref<3x5xf32> {"forward_kernel_0"}
  %1 = FDRA.BlockLoad %arg1 [0, 0] : memref<3x5xf32> -> memref<3x5xf32> {"forward_kernel_0"}
  %2 = FDRA.BlockLoad %alloc [0, 0] : memref<3x5xf32> -> memref<3x5xf32> {"forward_kernel_0"}
  FDRA.KernelCall @forward_kernel_0(%0, %1, %2) : (memref<3x5xf32>, memref<3x5xf32>, memref<3x5xf32>) -> ()
  FDRA.BlockStore %2,  %alloc [0, 0] : memref<3x5xf32> -> memref<3x5xf32> {"forward_kernel_0"}
  return %alloc : memref<3x5xf32>
}

// -----// IR Dump After ArithExpandOps (arith-expand) //----- //
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


// -----// IR Dump After ExpandOps (memref-expand) //----- //
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


// -----// IR Dump After NormalizeMemRefs (normalize-memrefs) //----- //
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


// -----// IR Dump After ExpandStridedMetadata (expand-strided-metadata) //----- //
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


// -----// IR Dump After ConvertAffineToStandard (lower-affine) //----- //
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
    %c0 = arith.constant 0 : index
    %c3 = arith.constant 3 : index
    %c1 = arith.constant 1 : index
    scf.for %arg3 = %c0 to %c3 step %c1 {
      %c0_0 = arith.constant 0 : index
      %c5 = arith.constant 5 : index
      %c1_1 = arith.constant 1 : index
      scf.for %arg4 = %c0_0 to %c5 step %c1_1 {
        %0 = memref.load %arg0[%arg3, %arg4] : memref<3x5xf32>
        %1 = memref.load %arg1[%arg3, %arg4] : memref<3x5xf32>
        %2 = arith.addf %0, %1 : f32
        memref.store %2, %arg2[%arg3, %arg4] : memref<3x5xf32>
      }
    }
    return
  }
}


// -----// IR Dump After SCFForLoopCanonicalization (scf-for-loop-canonicalization) //----- //
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
    %c5 = arith.constant 5 : index
    %c0 = arith.constant 0 : index
    %c3 = arith.constant 3 : index
    %c1 = arith.constant 1 : index
    scf.for %arg3 = %c0 to %c3 step %c1 {
      scf.for %arg4 = %c0 to %c5 step %c1 {
        %0 = memref.load %arg0[%arg3, %arg4] : memref<3x5xf32>
        %1 = memref.load %arg1[%arg3, %arg4] : memref<3x5xf32>
        %2 = arith.addf %0, %1 : f32
        memref.store %2, %arg2[%arg3, %arg4] : memref<3x5xf32>
      }
    }
    return
  }
}


// -----// IR Dump After SCFToControlFlow (convert-scf-to-cf) //----- //
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
    %c5 = arith.constant 5 : index
    %c0 = arith.constant 0 : index
    %c3 = arith.constant 3 : index
    %c1 = arith.constant 1 : index
    cf.br ^bb1(%c0 : index)
  ^bb1(%0: index):  // 2 preds: ^bb0, ^bb5
    %1 = arith.cmpi slt, %0, %c3 : index
    cf.cond_br %1, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    cf.br ^bb3(%c0 : index)
  ^bb3(%2: index):  // 2 preds: ^bb2, ^bb4
    %3 = arith.cmpi slt, %2, %c5 : index
    cf.cond_br %3, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    %4 = memref.load %arg0[%0, %2] : memref<3x5xf32>
    %5 = memref.load %arg1[%0, %2] : memref<3x5xf32>
    %6 = arith.addf %4, %5 : f32
    memref.store %6, %arg2[%0, %2] : memref<3x5xf32>
    %7 = arith.addi %2, %c1 : index
    cf.br ^bb3(%7 : index)
  ^bb5:  // pred: ^bb3
    %8 = arith.addi %0, %c1 : index
    cf.br ^bb1(%8 : index)
  ^bb6:  // pred: ^bb1
    return
  }
}


// -----// IR Dump After ConvertMathToLLVMPass (convert-math-to-llvm) //----- //
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
    %c5 = arith.constant 5 : index
    %c0 = arith.constant 0 : index
    %c3 = arith.constant 3 : index
    %c1 = arith.constant 1 : index
    cf.br ^bb1(%c0 : index)
  ^bb1(%0: index):  // 2 preds: ^bb0, ^bb5
    %1 = arith.cmpi slt, %0, %c3 : index
    cf.cond_br %1, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    cf.br ^bb3(%c0 : index)
  ^bb3(%2: index):  // 2 preds: ^bb2, ^bb4
    %3 = arith.cmpi slt, %2, %c5 : index
    cf.cond_br %3, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    %4 = memref.load %arg0[%0, %2] : memref<3x5xf32>
    %5 = memref.load %arg1[%0, %2] : memref<3x5xf32>
    %6 = arith.addf %4, %5 : f32
    memref.store %6, %arg2[%0, %2] : memref<3x5xf32>
    %7 = arith.addi %2, %c1 : index
    cf.br ^bb3(%7 : index)
  ^bb5:  // pred: ^bb3
    %8 = arith.addi %0, %c1 : index
    cf.br ^bb1(%8 : index)
  ^bb6:  // pred: ^bb1
    return
  }
}


// -----// IR Dump After ConvertMathToLibm (convert-math-to-libm) //----- //
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
    %c5 = arith.constant 5 : index
    %c0 = arith.constant 0 : index
    %c3 = arith.constant 3 : index
    %c1 = arith.constant 1 : index
    cf.br ^bb1(%c0 : index)
  ^bb1(%0: index):  // 2 preds: ^bb0, ^bb5
    %1 = arith.cmpi slt, %0, %c3 : index
    cf.cond_br %1, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    cf.br ^bb3(%c0 : index)
  ^bb3(%2: index):  // 2 preds: ^bb2, ^bb4
    %3 = arith.cmpi slt, %2, %c5 : index
    cf.cond_br %3, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    %4 = memref.load %arg0[%0, %2] : memref<3x5xf32>
    %5 = memref.load %arg1[%0, %2] : memref<3x5xf32>
    %6 = arith.addf %4, %5 : f32
    memref.store %6, %arg2[%0, %2] : memref<3x5xf32>
    %7 = arith.addi %2, %c1 : index
    cf.br ^bb3(%7 : index)
  ^bb5:  // pred: ^bb3
    %8 = arith.addi %0, %c1 : index
    cf.br ^bb1(%8 : index)
  ^bb6:  // pred: ^bb1
    return
  }
}


// -----// IR Dump After ArithToLLVMConversionPass (convert-arith-to-llvm) //----- //
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
    %0 = llvm.mlir.constant(5 : index) : i64
    %1 = llvm.mlir.constant(0 : index) : i64
    %2 = builtin.unrealized_conversion_cast %1 : i64 to index
    %3 = llvm.mlir.constant(3 : index) : i64
    %4 = llvm.mlir.constant(1 : index) : i64
    cf.br ^bb1(%2 : index)
  ^bb1(%5: index):  // 2 preds: ^bb0, ^bb5
    %6 = builtin.unrealized_conversion_cast %5 : index to i64
    %7 = llvm.icmp "slt" %6, %3 : i64
    cf.cond_br %7, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    cf.br ^bb3(%2 : index)
  ^bb3(%8: index):  // 2 preds: ^bb2, ^bb4
    %9 = builtin.unrealized_conversion_cast %8 : index to i64
    %10 = llvm.icmp "slt" %9, %0 : i64
    cf.cond_br %10, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    %11 = memref.load %arg0[%5, %8] : memref<3x5xf32>
    %12 = memref.load %arg1[%5, %8] : memref<3x5xf32>
    %13 = llvm.fadd %11, %12  : f32
    memref.store %13, %arg2[%5, %8] : memref<3x5xf32>
    %14 = llvm.add %9, %4  : i64
    %15 = builtin.unrealized_conversion_cast %14 : i64 to index
    cf.br ^bb3(%15 : index)
  ^bb5:  // pred: ^bb3
    %16 = llvm.add %6, %4  : i64
    %17 = builtin.unrealized_conversion_cast %16 : i64 to index
    cf.br ^bb1(%17 : index)
  ^bb6:  // pred: ^bb1
    return
  }
}


// -----// IR Dump After FinalizeMemRefToLLVMConversionPass (finalize-memref-to-llvm) //----- //
module attributes {torch.debug_module_name = "L"} {
  llvm.func @malloc(i64) -> !llvm.ptr
  func.func @forward(%arg0: memref<3x5xf32>, %arg1: memref<3x5xf32>) -> memref<3x5xf32> {
    %0 = llvm.mlir.constant(3 : index) : i64
    %1 = llvm.mlir.constant(5 : index) : i64
    %2 = llvm.mlir.constant(1 : index) : i64
    %3 = llvm.mlir.constant(15 : index) : i64
    %4 = llvm.mlir.null : !llvm.ptr
    %5 = llvm.getelementptr %4[%3] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %6 = llvm.ptrtoint %5 : !llvm.ptr to i64
    %7 = llvm.mlir.constant(64 : index) : i64
    %8 = llvm.add %6, %7  : i64
    %9 = llvm.call @malloc(%8) : (i64) -> !llvm.ptr
    %10 = llvm.ptrtoint %9 : !llvm.ptr to i64
    %11 = llvm.mlir.constant(1 : index) : i64
    %12 = llvm.sub %7, %11  : i64
    %13 = llvm.add %10, %12  : i64
    %14 = llvm.urem %13, %7  : i64
    %15 = llvm.sub %13, %14  : i64
    %16 = llvm.inttoptr %15 : i64 to !llvm.ptr
    %17 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %18 = llvm.insertvalue %9, %17[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %19 = llvm.insertvalue %16, %18[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %20 = llvm.mlir.constant(0 : index) : i64
    %21 = llvm.insertvalue %20, %19[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %22 = llvm.insertvalue %0, %21[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %23 = llvm.insertvalue %1, %22[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %24 = llvm.insertvalue %1, %23[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %25 = llvm.insertvalue %2, %24[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %26 = builtin.unrealized_conversion_cast %25 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> to memref<3x5xf32>
    %27 = FDRA.BlockLoad %arg0 [0, 0] : memref<3x5xf32> -> memref<3x5xf32> {"forward_kernel_0"}
    %28 = FDRA.BlockLoad %arg1 [0, 0] : memref<3x5xf32> -> memref<3x5xf32> {"forward_kernel_0"}
    %29 = FDRA.BlockLoad %26 [0, 0] : memref<3x5xf32> -> memref<3x5xf32> {"forward_kernel_0"}
    FDRA.KernelCall @forward_kernel_0(%27, %28, %29) : (memref<3x5xf32>, memref<3x5xf32>, memref<3x5xf32>) -> ()
    FDRA.BlockStore %29,  %26 [0, 0] : memref<3x5xf32> -> memref<3x5xf32> {"forward_kernel_0"}
    return %26 : memref<3x5xf32>
  }
  func.func @forward_kernel_0(%arg0: memref<3x5xf32>, %arg1: memref<3x5xf32>, %arg2: memref<3x5xf32>) attributes {Kernel, forward_kernel_0} {
    %0 = builtin.unrealized_conversion_cast %arg0 : memref<3x5xf32> to !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %1 = builtin.unrealized_conversion_cast %arg1 : memref<3x5xf32> to !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %2 = builtin.unrealized_conversion_cast %arg2 : memref<3x5xf32> to !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %3 = llvm.mlir.constant(5 : index) : i64
    %4 = llvm.mlir.constant(0 : index) : i64
    %5 = builtin.unrealized_conversion_cast %4 : i64 to index
    %6 = llvm.mlir.constant(3 : index) : i64
    %7 = llvm.mlir.constant(1 : index) : i64
    cf.br ^bb1(%5 : index)
  ^bb1(%8: index):  // 2 preds: ^bb0, ^bb5
    %9 = builtin.unrealized_conversion_cast %8 : index to i64
    %10 = builtin.unrealized_conversion_cast %8 : index to i64
    %11 = llvm.icmp "slt" %10, %6 : i64
    cf.cond_br %11, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    cf.br ^bb3(%5 : index)
  ^bb3(%12: index):  // 2 preds: ^bb2, ^bb4
    %13 = builtin.unrealized_conversion_cast %12 : index to i64
    %14 = builtin.unrealized_conversion_cast %12 : index to i64
    %15 = llvm.icmp "slt" %14, %3 : i64
    cf.cond_br %15, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    %16 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %17 = llvm.mlir.constant(5 : index) : i64
    %18 = llvm.mul %9, %17  : i64
    %19 = llvm.add %18, %13  : i64
    %20 = llvm.getelementptr %16[%19] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %21 = llvm.load %20 : !llvm.ptr -> f32
    %22 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %23 = llvm.mlir.constant(5 : index) : i64
    %24 = llvm.mul %9, %23  : i64
    %25 = llvm.add %24, %13  : i64
    %26 = llvm.getelementptr %22[%25] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %27 = llvm.load %26 : !llvm.ptr -> f32
    %28 = llvm.fadd %21, %27  : f32
    %29 = llvm.extractvalue %2[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %30 = llvm.mlir.constant(5 : index) : i64
    %31 = llvm.mul %9, %30  : i64
    %32 = llvm.add %31, %13  : i64
    %33 = llvm.getelementptr %29[%32] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %28, %33 : f32, !llvm.ptr
    %34 = llvm.add %14, %7  : i64
    %35 = builtin.unrealized_conversion_cast %34 : i64 to index
    cf.br ^bb3(%35 : index)
  ^bb5:  // pred: ^bb3
    %36 = llvm.add %10, %7  : i64
    %37 = builtin.unrealized_conversion_cast %36 : i64 to index
    cf.br ^bb1(%37 : index)
  ^bb6:  // pred: ^bb1
    return
  }
}


[debug] newFuncOp before inlineRegionBeforellvm.func @forward(!llvm.ptr, !llvm.ptr) -> !llvm.ptr
[debug] funcOp before inlineRegionBeforefunc.func @forward(%arg0: memref<3x5xf32>, %arg1: memref<3x5xf32>) -> memref<3x5xf32> {
  %0 = llvm.mlir.constant(3 : index) : i64
  %1 = llvm.mlir.constant(5 : index) : i64
  %2 = llvm.mlir.constant(1 : index) : i64
  %3 = llvm.mlir.constant(15 : index) : i64
  %4 = llvm.mlir.null : !llvm.ptr
  %5 = llvm.getelementptr %4[%3] : (!llvm.ptr, i64) -> !llvm.ptr, f32
  %6 = llvm.ptrtoint %5 : !llvm.ptr to i64
  %7 = llvm.mlir.constant(64 : index) : i64
  %8 = llvm.add %6, %7  : i64
  %9 = llvm.call @malloc(%8) : (i64) -> !llvm.ptr
  %10 = llvm.ptrtoint %9 : !llvm.ptr to i64
  %11 = llvm.mlir.constant(1 : index) : i64
  %12 = llvm.sub %7, %11  : i64
  %13 = llvm.add %10, %12  : i64
  %14 = llvm.urem %13, %7  : i64
  %15 = llvm.sub %13, %14  : i64
  %16 = llvm.inttoptr %15 : i64 to !llvm.ptr
  %17 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %18 = llvm.insertvalue %9, %17[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
  %19 = llvm.insertvalue %16, %18[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
  %20 = llvm.mlir.constant(0 : index) : i64
  %21 = llvm.insertvalue %20, %19[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
  %22 = llvm.insertvalue %0, %21[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
  %23 = llvm.insertvalue %1, %22[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
  %24 = llvm.insertvalue %1, %23[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
  %25 = llvm.insertvalue %2, %24[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
  %26 = builtin.unrealized_conversion_cast %25 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> to memref<3x5xf32>
  %27 = FDRA.BlockLoad %arg0 [0, 0] : memref<3x5xf32> -> memref<3x5xf32> {"forward_kernel_0"}
  %28 = FDRA.BlockLoad %arg1 [0, 0] : memref<3x5xf32> -> memref<3x5xf32> {"forward_kernel_0"}
  %29 = FDRA.BlockLoad %26 [0, 0] : memref<3x5xf32> -> memref<3x5xf32> {"forward_kernel_0"}
  FDRA.KernelCall @forward_kernel_0(%27, %28, %29) : (memref<3x5xf32>, memref<3x5xf32>, memref<3x5xf32>) -> ()
  FDRA.BlockStore %29,  %26 [0, 0] : memref<3x5xf32> -> memref<3x5xf32> {"forward_kernel_0"}
  return %26 : memref<3x5xf32>
}
[debug] after newFuncOp inlineRegionBefore"llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<ptr (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "forward", visibility_ = 0 : i64}> ({
^bb0(%arg0: memref<3x5xf32>, %arg1: memref<3x5xf32>):
  %0 = "llvm.mlir.constant"() <{value = 3 : index}> : () -> i64
  %1 = "llvm.mlir.constant"() <{value = 5 : index}> : () -> i64
  %2 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
  %3 = "llvm.mlir.constant"() <{value = 15 : index}> : () -> i64
  %4 = "llvm.mlir.null"() : () -> !llvm.ptr
  %5 = "llvm.getelementptr"(%4, %3) <{elem_type = f32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
  %6 = "llvm.ptrtoint"(%5) : (!llvm.ptr) -> i64
  %7 = "llvm.mlir.constant"() <{value = 64 : index}> : () -> i64
  %8 = "llvm.add"(%6, %7) : (i64, i64) -> i64
  %9 = "llvm.call"(%8) <{callee = @malloc, fastmathFlags = #llvm.fastmath<none>}> : (i64) -> !llvm.ptr
  %10 = "llvm.ptrtoint"(%9) : (!llvm.ptr) -> i64
  %11 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
  %12 = "llvm.sub"(%7, %11) : (i64, i64) -> i64
  %13 = "llvm.add"(%10, %12) : (i64, i64) -> i64
  %14 = "llvm.urem"(%13, %7) : (i64, i64) -> i64
  %15 = "llvm.sub"(%13, %14) : (i64, i64) -> i64
  %16 = "llvm.inttoptr"(%15) : (i64) -> !llvm.ptr
  %17 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %18 = "llvm.insertvalue"(%17, %9) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, !llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %19 = "llvm.insertvalue"(%18, %16) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, !llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %20 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
  %21 = "llvm.insertvalue"(%19, %20) <{position = array<i64: 2>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %22 = "llvm.insertvalue"(%21, %0) <{position = array<i64: 3, 0>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %23 = "llvm.insertvalue"(%22, %1) <{position = array<i64: 3, 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %24 = "llvm.insertvalue"(%23, %1) <{position = array<i64: 4, 0>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %25 = "llvm.insertvalue"(%24, %2) <{position = array<i64: 4, 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %26 = "builtin.unrealized_conversion_cast"(%25) : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>) -> memref<3x5xf32>
  %27 = "FDRA.BlockLoad"(%arg0) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>) -> memref<3x5xf32>
  %28 = "FDRA.BlockLoad"(%arg1) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>) -> memref<3x5xf32>
  %29 = "FDRA.BlockLoad"(%26) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>) -> memref<3x5xf32>
  "FDRA.KernelCall"(%27, %28, %29) {callee = @forward_kernel_0} : (memref<3x5xf32>, memref<3x5xf32>, memref<3x5xf32>) -> ()
  "FDRA.BlockStore"(%29, %26) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>, memref<3x5xf32>) -> ()
  "func.return"(%26) : (memref<3x5xf32>) -> ()
}) : () -> ()
[debug] arg:<block argument> of type 'memref<3x5xf32>' at index: 0 type: memref<3x5xf32>
[debug] yes:<block argument> of type 'memref<3x5xf32>' at index: 0
[debug] cast0:%0 = "builtin.unrealized_conversion_cast"(%arg0) : (memref<3x5xf32>) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
[debug] cast1:%1 = "builtin.unrealized_conversion_cast"(%0) : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>) -> memref<3x5xf32>
[debug] newFuncOp after cast:"llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<ptr (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "forward", visibility_ = 0 : i64}> ({
^bb0(%arg0: memref<3x5xf32>, %arg1: memref<3x5xf32>):
  %0 = "builtin.unrealized_conversion_cast"(%arg0) : (memref<3x5xf32>) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %1 = "builtin.unrealized_conversion_cast"(%0) : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>) -> memref<3x5xf32>
  %2 = "llvm.mlir.constant"() <{value = 3 : index}> : () -> i64
  %3 = "llvm.mlir.constant"() <{value = 5 : index}> : () -> i64
  %4 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
  %5 = "llvm.mlir.constant"() <{value = 15 : index}> : () -> i64
  %6 = "llvm.mlir.null"() : () -> !llvm.ptr
  %7 = "llvm.getelementptr"(%6, %5) <{elem_type = f32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
  %8 = "llvm.ptrtoint"(%7) : (!llvm.ptr) -> i64
  %9 = "llvm.mlir.constant"() <{value = 64 : index}> : () -> i64
  %10 = "llvm.add"(%8, %9) : (i64, i64) -> i64
  %11 = "llvm.call"(%10) <{callee = @malloc, fastmathFlags = #llvm.fastmath<none>}> : (i64) -> !llvm.ptr
  %12 = "llvm.ptrtoint"(%11) : (!llvm.ptr) -> i64
  %13 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
  %14 = "llvm.sub"(%9, %13) : (i64, i64) -> i64
  %15 = "llvm.add"(%12, %14) : (i64, i64) -> i64
  %16 = "llvm.urem"(%15, %9) : (i64, i64) -> i64
  %17 = "llvm.sub"(%15, %16) : (i64, i64) -> i64
  %18 = "llvm.inttoptr"(%17) : (i64) -> !llvm.ptr
  %19 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %20 = "llvm.insertvalue"(%19, %11) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, !llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %21 = "llvm.insertvalue"(%20, %18) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, !llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %22 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
  %23 = "llvm.insertvalue"(%21, %22) <{position = array<i64: 2>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %24 = "llvm.insertvalue"(%23, %2) <{position = array<i64: 3, 0>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %25 = "llvm.insertvalue"(%24, %3) <{position = array<i64: 3, 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %26 = "llvm.insertvalue"(%25, %3) <{position = array<i64: 4, 0>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %27 = "llvm.insertvalue"(%26, %4) <{position = array<i64: 4, 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %28 = "builtin.unrealized_conversion_cast"(%27) : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>) -> memref<3x5xf32>
  %29 = "FDRA.BlockLoad"(%arg0) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>) -> memref<3x5xf32>
  %30 = "FDRA.BlockLoad"(%arg1) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>) -> memref<3x5xf32>
  %31 = "FDRA.BlockLoad"(%28) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>) -> memref<3x5xf32>
  "FDRA.KernelCall"(%29, %30, %31) {callee = @forward_kernel_0} : (memref<3x5xf32>, memref<3x5xf32>, memref<3x5xf32>) -> ()
  "FDRA.BlockStore"(%31, %28) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>, memref<3x5xf32>) -> ()
  "func.return"(%28) : (memref<3x5xf32>) -> ()
}) : () -> ()
[debug] newFuncOp after cast:"llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<ptr (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "forward", visibility_ = 0 : i64}> ({
^bb0(%arg0: memref<3x5xf32>, %arg1: memref<3x5xf32>):
  %0 = "builtin.unrealized_conversion_cast"(%arg0) : (memref<3x5xf32>) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %1 = "builtin.unrealized_conversion_cast"(%0) : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>) -> memref<3x5xf32>
  %2 = "llvm.mlir.constant"() <{value = 3 : index}> : () -> i64
  %3 = "llvm.mlir.constant"() <{value = 5 : index}> : () -> i64
  %4 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
  %5 = "llvm.mlir.constant"() <{value = 15 : index}> : () -> i64
  %6 = "llvm.mlir.null"() : () -> !llvm.ptr
  %7 = "llvm.getelementptr"(%6, %5) <{elem_type = f32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
  %8 = "llvm.ptrtoint"(%7) : (!llvm.ptr) -> i64
  %9 = "llvm.mlir.constant"() <{value = 64 : index}> : () -> i64
  %10 = "llvm.add"(%8, %9) : (i64, i64) -> i64
  %11 = "llvm.call"(%10) <{callee = @malloc, fastmathFlags = #llvm.fastmath<none>}> : (i64) -> !llvm.ptr
  %12 = "llvm.ptrtoint"(%11) : (!llvm.ptr) -> i64
  %13 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
  %14 = "llvm.sub"(%9, %13) : (i64, i64) -> i64
  %15 = "llvm.add"(%12, %14) : (i64, i64) -> i64
  %16 = "llvm.urem"(%15, %9) : (i64, i64) -> i64
  %17 = "llvm.sub"(%15, %16) : (i64, i64) -> i64
  %18 = "llvm.inttoptr"(%17) : (i64) -> !llvm.ptr
  %19 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %20 = "llvm.insertvalue"(%19, %11) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, !llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %21 = "llvm.insertvalue"(%20, %18) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, !llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %22 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
  %23 = "llvm.insertvalue"(%21, %22) <{position = array<i64: 2>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %24 = "llvm.insertvalue"(%23, %2) <{position = array<i64: 3, 0>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %25 = "llvm.insertvalue"(%24, %3) <{position = array<i64: 3, 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %26 = "llvm.insertvalue"(%25, %3) <{position = array<i64: 4, 0>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %27 = "llvm.insertvalue"(%26, %4) <{position = array<i64: 4, 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %28 = "builtin.unrealized_conversion_cast"(%27) : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>) -> memref<3x5xf32>
  %29 = "FDRA.BlockLoad"(%1) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>) -> memref<3x5xf32>
  %30 = "FDRA.BlockLoad"(%arg1) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>) -> memref<3x5xf32>
  %31 = "FDRA.BlockLoad"(%28) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>) -> memref<3x5xf32>
  "FDRA.KernelCall"(%29, %30, %31) {callee = @forward_kernel_0} : (memref<3x5xf32>, memref<3x5xf32>, memref<3x5xf32>) -> ()
  "FDRA.BlockStore"(%31, %28) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>, memref<3x5xf32>) -> ()
  "func.return"(%28) : (memref<3x5xf32>) -> ()
}) : () -> ()
[debug] arg:<block argument> of type 'memref<3x5xf32>' at index: 1 type: memref<3x5xf32>
[debug] yes:<block argument> of type 'memref<3x5xf32>' at index: 1
[debug] cast0:%0 = "builtin.unrealized_conversion_cast"(%arg1) : (memref<3x5xf32>) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
[debug] cast1:%1 = "builtin.unrealized_conversion_cast"(%0) : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>) -> memref<3x5xf32>
[debug] newFuncOp after cast:"llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<ptr (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "forward", visibility_ = 0 : i64}> ({
^bb0(%arg0: memref<3x5xf32>, %arg1: memref<3x5xf32>):
  %0 = "builtin.unrealized_conversion_cast"(%arg1) : (memref<3x5xf32>) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %1 = "builtin.unrealized_conversion_cast"(%0) : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>) -> memref<3x5xf32>
  %2 = "builtin.unrealized_conversion_cast"(%arg0) : (memref<3x5xf32>) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %3 = "builtin.unrealized_conversion_cast"(%2) : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>) -> memref<3x5xf32>
  %4 = "llvm.mlir.constant"() <{value = 3 : index}> : () -> i64
  %5 = "llvm.mlir.constant"() <{value = 5 : index}> : () -> i64
  %6 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
  %7 = "llvm.mlir.constant"() <{value = 15 : index}> : () -> i64
  %8 = "llvm.mlir.null"() : () -> !llvm.ptr
  %9 = "llvm.getelementptr"(%8, %7) <{elem_type = f32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
  %10 = "llvm.ptrtoint"(%9) : (!llvm.ptr) -> i64
  %11 = "llvm.mlir.constant"() <{value = 64 : index}> : () -> i64
  %12 = "llvm.add"(%10, %11) : (i64, i64) -> i64
  %13 = "llvm.call"(%12) <{callee = @malloc, fastmathFlags = #llvm.fastmath<none>}> : (i64) -> !llvm.ptr
  %14 = "llvm.ptrtoint"(%13) : (!llvm.ptr) -> i64
  %15 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
  %16 = "llvm.sub"(%11, %15) : (i64, i64) -> i64
  %17 = "llvm.add"(%14, %16) : (i64, i64) -> i64
  %18 = "llvm.urem"(%17, %11) : (i64, i64) -> i64
  %19 = "llvm.sub"(%17, %18) : (i64, i64) -> i64
  %20 = "llvm.inttoptr"(%19) : (i64) -> !llvm.ptr
  %21 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %22 = "llvm.insertvalue"(%21, %13) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, !llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %23 = "llvm.insertvalue"(%22, %20) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, !llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %24 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
  %25 = "llvm.insertvalue"(%23, %24) <{position = array<i64: 2>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %26 = "llvm.insertvalue"(%25, %4) <{position = array<i64: 3, 0>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %27 = "llvm.insertvalue"(%26, %5) <{position = array<i64: 3, 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %28 = "llvm.insertvalue"(%27, %5) <{position = array<i64: 4, 0>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %29 = "llvm.insertvalue"(%28, %6) <{position = array<i64: 4, 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %30 = "builtin.unrealized_conversion_cast"(%29) : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>) -> memref<3x5xf32>
  %31 = "FDRA.BlockLoad"(%3) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>) -> memref<3x5xf32>
  %32 = "FDRA.BlockLoad"(%arg1) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>) -> memref<3x5xf32>
  %33 = "FDRA.BlockLoad"(%30) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>) -> memref<3x5xf32>
  "FDRA.KernelCall"(%31, %32, %33) {callee = @forward_kernel_0} : (memref<3x5xf32>, memref<3x5xf32>, memref<3x5xf32>) -> ()
  "FDRA.BlockStore"(%33, %30) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>, memref<3x5xf32>) -> ()
  "func.return"(%30) : (memref<3x5xf32>) -> ()
}) : () -> ()
[debug] newFuncOp after cast:"llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<ptr (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "forward", visibility_ = 0 : i64}> ({
^bb0(%arg0: memref<3x5xf32>, %arg1: memref<3x5xf32>):
  %0 = "builtin.unrealized_conversion_cast"(%arg1) : (memref<3x5xf32>) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %1 = "builtin.unrealized_conversion_cast"(%0) : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>) -> memref<3x5xf32>
  %2 = "builtin.unrealized_conversion_cast"(%arg0) : (memref<3x5xf32>) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %3 = "builtin.unrealized_conversion_cast"(%2) : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>) -> memref<3x5xf32>
  %4 = "llvm.mlir.constant"() <{value = 3 : index}> : () -> i64
  %5 = "llvm.mlir.constant"() <{value = 5 : index}> : () -> i64
  %6 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
  %7 = "llvm.mlir.constant"() <{value = 15 : index}> : () -> i64
  %8 = "llvm.mlir.null"() : () -> !llvm.ptr
  %9 = "llvm.getelementptr"(%8, %7) <{elem_type = f32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
  %10 = "llvm.ptrtoint"(%9) : (!llvm.ptr) -> i64
  %11 = "llvm.mlir.constant"() <{value = 64 : index}> : () -> i64
  %12 = "llvm.add"(%10, %11) : (i64, i64) -> i64
  %13 = "llvm.call"(%12) <{callee = @malloc, fastmathFlags = #llvm.fastmath<none>}> : (i64) -> !llvm.ptr
  %14 = "llvm.ptrtoint"(%13) : (!llvm.ptr) -> i64
  %15 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
  %16 = "llvm.sub"(%11, %15) : (i64, i64) -> i64
  %17 = "llvm.add"(%14, %16) : (i64, i64) -> i64
  %18 = "llvm.urem"(%17, %11) : (i64, i64) -> i64
  %19 = "llvm.sub"(%17, %18) : (i64, i64) -> i64
  %20 = "llvm.inttoptr"(%19) : (i64) -> !llvm.ptr
  %21 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %22 = "llvm.insertvalue"(%21, %13) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, !llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %23 = "llvm.insertvalue"(%22, %20) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, !llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %24 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
  %25 = "llvm.insertvalue"(%23, %24) <{position = array<i64: 2>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %26 = "llvm.insertvalue"(%25, %4) <{position = array<i64: 3, 0>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %27 = "llvm.insertvalue"(%26, %5) <{position = array<i64: 3, 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %28 = "llvm.insertvalue"(%27, %5) <{position = array<i64: 4, 0>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %29 = "llvm.insertvalue"(%28, %6) <{position = array<i64: 4, 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %30 = "builtin.unrealized_conversion_cast"(%29) : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>) -> memref<3x5xf32>
  %31 = "FDRA.BlockLoad"(%3) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>) -> memref<3x5xf32>
  %32 = "FDRA.BlockLoad"(%1) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>) -> memref<3x5xf32>
  %33 = "FDRA.BlockLoad"(%30) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>) -> memref<3x5xf32>
  "FDRA.KernelCall"(%31, %32, %33) {callee = @forward_kernel_0} : (memref<3x5xf32>, memref<3x5xf32>, memref<3x5xf32>) -> ()
  "FDRA.BlockStore"(%33, %30) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>, memref<3x5xf32>) -> ()
  "func.return"(%30) : (memref<3x5xf32>) -> ()
}) : () -> ()
[debug] newFuncOp before convertRegionTypes"llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<ptr (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "forward", visibility_ = 0 : i64}> ({
^bb0(%arg0: memref<3x5xf32>, %arg1: memref<3x5xf32>):
  %0 = "builtin.unrealized_conversion_cast"(%arg1) : (memref<3x5xf32>) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %1 = "builtin.unrealized_conversion_cast"(%0) : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>) -> memref<3x5xf32>
  %2 = "builtin.unrealized_conversion_cast"(%arg0) : (memref<3x5xf32>) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %3 = "builtin.unrealized_conversion_cast"(%2) : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>) -> memref<3x5xf32>
  %4 = "llvm.mlir.constant"() <{value = 3 : index}> : () -> i64
  %5 = "llvm.mlir.constant"() <{value = 5 : index}> : () -> i64
  %6 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
  %7 = "llvm.mlir.constant"() <{value = 15 : index}> : () -> i64
  %8 = "llvm.mlir.null"() : () -> !llvm.ptr
  %9 = "llvm.getelementptr"(%8, %7) <{elem_type = f32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
  %10 = "llvm.ptrtoint"(%9) : (!llvm.ptr) -> i64
  %11 = "llvm.mlir.constant"() <{value = 64 : index}> : () -> i64
  %12 = "llvm.add"(%10, %11) : (i64, i64) -> i64
  %13 = "llvm.call"(%12) <{callee = @malloc, fastmathFlags = #llvm.fastmath<none>}> : (i64) -> !llvm.ptr
  %14 = "llvm.ptrtoint"(%13) : (!llvm.ptr) -> i64
  %15 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
  %16 = "llvm.sub"(%11, %15) : (i64, i64) -> i64
  %17 = "llvm.add"(%14, %16) : (i64, i64) -> i64
  %18 = "llvm.urem"(%17, %11) : (i64, i64) -> i64
  %19 = "llvm.sub"(%17, %18) : (i64, i64) -> i64
  %20 = "llvm.inttoptr"(%19) : (i64) -> !llvm.ptr
  %21 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %22 = "llvm.insertvalue"(%21, %13) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, !llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %23 = "llvm.insertvalue"(%22, %20) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, !llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %24 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
  %25 = "llvm.insertvalue"(%23, %24) <{position = array<i64: 2>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %26 = "llvm.insertvalue"(%25, %4) <{position = array<i64: 3, 0>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %27 = "llvm.insertvalue"(%26, %5) <{position = array<i64: 3, 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %28 = "llvm.insertvalue"(%27, %5) <{position = array<i64: 4, 0>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %29 = "llvm.insertvalue"(%28, %6) <{position = array<i64: 4, 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %30 = "builtin.unrealized_conversion_cast"(%29) : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>) -> memref<3x5xf32>
  %31 = "FDRA.BlockLoad"(%3) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>) -> memref<3x5xf32>
  %32 = "FDRA.BlockLoad"(%1) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>) -> memref<3x5xf32>
  %33 = "FDRA.BlockLoad"(%30) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>) -> memref<3x5xf32>
  "FDRA.KernelCall"(%31, %32, %33) {callee = @forward_kernel_0} : (memref<3x5xf32>, memref<3x5xf32>, memref<3x5xf32>) -> ()
  "FDRA.BlockStore"(%33, %30) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>, memref<3x5xf32>) -> ()
  "func.return"(%30) : (memref<3x5xf32>) -> ()
}) : () -> ()
[debug] newFuncOp after convertRegionTypes"llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<ptr (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "forward", visibility_ = 0 : i64}> ({
^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
  %0 = "builtin.unrealized_conversion_cast"(%arg0) : (!llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %1 = "builtin.unrealized_conversion_cast"(%arg1) : (!llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %2 = "builtin.unrealized_conversion_cast"(<<UNKNOWN SSA VALUE>>) : (memref<3x5xf32>) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %3 = "builtin.unrealized_conversion_cast"(%2) : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>) -> memref<3x5xf32>
  %4 = "builtin.unrealized_conversion_cast"(<<UNKNOWN SSA VALUE>>) : (memref<3x5xf32>) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %5 = "builtin.unrealized_conversion_cast"(%4) : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>) -> memref<3x5xf32>
  %6 = "llvm.mlir.constant"() <{value = 3 : index}> : () -> i64
  %7 = "llvm.mlir.constant"() <{value = 5 : index}> : () -> i64
  %8 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
  %9 = "llvm.mlir.constant"() <{value = 15 : index}> : () -> i64
  %10 = "llvm.mlir.null"() : () -> !llvm.ptr
  %11 = "llvm.getelementptr"(%10, %9) <{elem_type = f32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
  %12 = "llvm.ptrtoint"(%11) : (!llvm.ptr) -> i64
  %13 = "llvm.mlir.constant"() <{value = 64 : index}> : () -> i64
  %14 = "llvm.add"(%12, %13) : (i64, i64) -> i64
  %15 = "llvm.call"(%14) <{callee = @malloc, fastmathFlags = #llvm.fastmath<none>}> : (i64) -> !llvm.ptr
  %16 = "llvm.ptrtoint"(%15) : (!llvm.ptr) -> i64
  %17 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
  %18 = "llvm.sub"(%13, %17) : (i64, i64) -> i64
  %19 = "llvm.add"(%16, %18) : (i64, i64) -> i64
  %20 = "llvm.urem"(%19, %13) : (i64, i64) -> i64
  %21 = "llvm.sub"(%19, %20) : (i64, i64) -> i64
  %22 = "llvm.inttoptr"(%21) : (i64) -> !llvm.ptr
  %23 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %24 = "llvm.insertvalue"(%23, %15) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, !llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %25 = "llvm.insertvalue"(%24, %22) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, !llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %26 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
  %27 = "llvm.insertvalue"(%25, %26) <{position = array<i64: 2>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %28 = "llvm.insertvalue"(%27, %6) <{position = array<i64: 3, 0>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %29 = "llvm.insertvalue"(%28, %7) <{position = array<i64: 3, 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %30 = "llvm.insertvalue"(%29, %7) <{position = array<i64: 4, 0>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %31 = "llvm.insertvalue"(%30, %8) <{position = array<i64: 4, 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %32 = "builtin.unrealized_conversion_cast"(%31) : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>) -> memref<3x5xf32>
  %33 = "FDRA.BlockLoad"(%5) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>) -> memref<3x5xf32>
  %34 = "FDRA.BlockLoad"(%3) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>) -> memref<3x5xf32>
  %35 = "FDRA.BlockLoad"(%32) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>) -> memref<3x5xf32>
  "FDRA.KernelCall"(%33, %34, %35) {callee = @forward_kernel_0} : (memref<3x5xf32>, memref<3x5xf32>, memref<3x5xf32>) -> ()
  "FDRA.BlockStore"(%35, %32) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>, memref<3x5xf32>) -> ()
  "func.return"(%32) : (memref<3x5xf32>) -> ()
}) : () -> ()
[debug] after convertFuncOpToLLVMFuncOp newFuncOp:"llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<ptr (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "forward", visibility_ = 0 : i64}> ({
^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
  %0 = "builtin.unrealized_conversion_cast"(%arg0) : (!llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %1 = "builtin.unrealized_conversion_cast"(%arg1) : (!llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %2 = "builtin.unrealized_conversion_cast"(<<UNKNOWN SSA VALUE>>) : (memref<3x5xf32>) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %3 = "builtin.unrealized_conversion_cast"(%2) : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>) -> memref<3x5xf32>
  %4 = "builtin.unrealized_conversion_cast"(<<UNKNOWN SSA VALUE>>) : (memref<3x5xf32>) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %5 = "builtin.unrealized_conversion_cast"(%4) : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>) -> memref<3x5xf32>
  %6 = "llvm.mlir.constant"() <{value = 3 : index}> : () -> i64
  %7 = "llvm.mlir.constant"() <{value = 5 : index}> : () -> i64
  %8 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
  %9 = "llvm.mlir.constant"() <{value = 15 : index}> : () -> i64
  %10 = "llvm.mlir.null"() : () -> !llvm.ptr
  %11 = "llvm.getelementptr"(%10, %9) <{elem_type = f32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
  %12 = "llvm.ptrtoint"(%11) : (!llvm.ptr) -> i64
  %13 = "llvm.mlir.constant"() <{value = 64 : index}> : () -> i64
  %14 = "llvm.add"(%12, %13) : (i64, i64) -> i64
  %15 = "llvm.call"(%14) <{callee = @malloc, fastmathFlags = #llvm.fastmath<none>}> : (i64) -> !llvm.ptr
  %16 = "llvm.ptrtoint"(%15) : (!llvm.ptr) -> i64
  %17 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
  %18 = "llvm.sub"(%13, %17) : (i64, i64) -> i64
  %19 = "llvm.add"(%16, %18) : (i64, i64) -> i64
  %20 = "llvm.urem"(%19, %13) : (i64, i64) -> i64
  %21 = "llvm.sub"(%19, %20) : (i64, i64) -> i64
  %22 = "llvm.inttoptr"(%21) : (i64) -> !llvm.ptr
  %23 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %24 = "llvm.insertvalue"(%23, %15) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, !llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %25 = "llvm.insertvalue"(%24, %22) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, !llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %26 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
  %27 = "llvm.insertvalue"(%25, %26) <{position = array<i64: 2>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %28 = "llvm.insertvalue"(%27, %6) <{position = array<i64: 3, 0>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %29 = "llvm.insertvalue"(%28, %7) <{position = array<i64: 3, 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %30 = "llvm.insertvalue"(%29, %7) <{position = array<i64: 4, 0>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %31 = "llvm.insertvalue"(%30, %8) <{position = array<i64: 4, 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %32 = "builtin.unrealized_conversion_cast"(%31) : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>) -> memref<3x5xf32>
  %33 = "FDRA.BlockLoad"(%5) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>) -> memref<3x5xf32>
  %34 = "FDRA.BlockLoad"(%3) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>) -> memref<3x5xf32>
  %35 = "FDRA.BlockLoad"(%32) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>) -> memref<3x5xf32>
  "FDRA.KernelCall"(%33, %34, %35) {callee = @forward_kernel_0} : (memref<3x5xf32>, memref<3x5xf32>, memref<3x5xf32>) -> ()
  "FDRA.BlockStore"(%35, %32) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>, memref<3x5xf32>) -> ()
  "func.return"(%32) : (memref<3x5xf32>) -> ()
}) : () -> ()
[debug] before replaceUsesOfBlockArgument newFuncOp:"llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<ptr (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "forward", visibility_ = 0 : i64}> ({
^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
  %0 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %1 = "builtin.unrealized_conversion_cast"(%arg0) : (!llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %2 = "builtin.unrealized_conversion_cast"(%arg1) : (!llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %3 = "builtin.unrealized_conversion_cast"(<<UNKNOWN SSA VALUE>>) : (memref<3x5xf32>) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %4 = "builtin.unrealized_conversion_cast"(%3) : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>) -> memref<3x5xf32>
  %5 = "builtin.unrealized_conversion_cast"(<<UNKNOWN SSA VALUE>>) : (memref<3x5xf32>) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %6 = "builtin.unrealized_conversion_cast"(%5) : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>) -> memref<3x5xf32>
  %7 = "llvm.mlir.constant"() <{value = 3 : index}> : () -> i64
  %8 = "llvm.mlir.constant"() <{value = 5 : index}> : () -> i64
  %9 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
  %10 = "llvm.mlir.constant"() <{value = 15 : index}> : () -> i64
  %11 = "llvm.mlir.null"() : () -> !llvm.ptr
  %12 = "llvm.getelementptr"(%11, %10) <{elem_type = f32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
  %13 = "llvm.ptrtoint"(%12) : (!llvm.ptr) -> i64
  %14 = "llvm.mlir.constant"() <{value = 64 : index}> : () -> i64
  %15 = "llvm.add"(%13, %14) : (i64, i64) -> i64
  %16 = "llvm.call"(%15) <{callee = @malloc, fastmathFlags = #llvm.fastmath<none>}> : (i64) -> !llvm.ptr
  %17 = "llvm.ptrtoint"(%16) : (!llvm.ptr) -> i64
  %18 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
  %19 = "llvm.sub"(%14, %18) : (i64, i64) -> i64
  %20 = "llvm.add"(%17, %19) : (i64, i64) -> i64
  %21 = "llvm.urem"(%20, %14) : (i64, i64) -> i64
  %22 = "llvm.sub"(%20, %21) : (i64, i64) -> i64
  %23 = "llvm.inttoptr"(%22) : (i64) -> !llvm.ptr
  %24 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %25 = "llvm.insertvalue"(%24, %16) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, !llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %26 = "llvm.insertvalue"(%25, %23) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, !llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %27 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
  %28 = "llvm.insertvalue"(%26, %27) <{position = array<i64: 2>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %29 = "llvm.insertvalue"(%28, %7) <{position = array<i64: 3, 0>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %30 = "llvm.insertvalue"(%29, %8) <{position = array<i64: 3, 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %31 = "llvm.insertvalue"(%30, %8) <{position = array<i64: 4, 0>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %32 = "llvm.insertvalue"(%31, %9) <{position = array<i64: 4, 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %33 = "builtin.unrealized_conversion_cast"(%32) : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>) -> memref<3x5xf32>
  %34 = "FDRA.BlockLoad"(%6) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>) -> memref<3x5xf32>
  %35 = "FDRA.BlockLoad"(%4) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>) -> memref<3x5xf32>
  %36 = "FDRA.BlockLoad"(%33) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>) -> memref<3x5xf32>
  "FDRA.KernelCall"(%34, %35, %36) {callee = @forward_kernel_0} : (memref<3x5xf32>, memref<3x5xf32>, memref<3x5xf32>) -> ()
  "FDRA.BlockStore"(%36, %33) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>, memref<3x5xf32>) -> ()
  "func.return"(%33) : (memref<3x5xf32>) -> ()
}) : () -> ()
[debug] after replaceUsesOfBlockArgument newFuncOp:"llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<ptr (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "forward", visibility_ = 0 : i64}> ({
^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
  %0 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %1 = "builtin.unrealized_conversion_cast"(%arg0) : (!llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %2 = "builtin.unrealized_conversion_cast"(%arg1) : (!llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %3 = "builtin.unrealized_conversion_cast"(<<UNKNOWN SSA VALUE>>) : (memref<3x5xf32>) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %4 = "builtin.unrealized_conversion_cast"(%3) : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>) -> memref<3x5xf32>
  %5 = "builtin.unrealized_conversion_cast"(<<UNKNOWN SSA VALUE>>) : (memref<3x5xf32>) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %6 = "builtin.unrealized_conversion_cast"(%5) : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>) -> memref<3x5xf32>
  %7 = "llvm.mlir.constant"() <{value = 3 : index}> : () -> i64
  %8 = "llvm.mlir.constant"() <{value = 5 : index}> : () -> i64
  %9 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
  %10 = "llvm.mlir.constant"() <{value = 15 : index}> : () -> i64
  %11 = "llvm.mlir.null"() : () -> !llvm.ptr
  %12 = "llvm.getelementptr"(%11, %10) <{elem_type = f32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
  %13 = "llvm.ptrtoint"(%12) : (!llvm.ptr) -> i64
  %14 = "llvm.mlir.constant"() <{value = 64 : index}> : () -> i64
  %15 = "llvm.add"(%13, %14) : (i64, i64) -> i64
  %16 = "llvm.call"(%15) <{callee = @malloc, fastmathFlags = #llvm.fastmath<none>}> : (i64) -> !llvm.ptr
  %17 = "llvm.ptrtoint"(%16) : (!llvm.ptr) -> i64
  %18 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
  %19 = "llvm.sub"(%14, %18) : (i64, i64) -> i64
  %20 = "llvm.add"(%17, %19) : (i64, i64) -> i64
  %21 = "llvm.urem"(%20, %14) : (i64, i64) -> i64
  %22 = "llvm.sub"(%20, %21) : (i64, i64) -> i64
  %23 = "llvm.inttoptr"(%22) : (i64) -> !llvm.ptr
  %24 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %25 = "llvm.insertvalue"(%24, %16) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, !llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %26 = "llvm.insertvalue"(%25, %23) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, !llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %27 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
  %28 = "llvm.insertvalue"(%26, %27) <{position = array<i64: 2>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %29 = "llvm.insertvalue"(%28, %7) <{position = array<i64: 3, 0>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %30 = "llvm.insertvalue"(%29, %8) <{position = array<i64: 3, 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %31 = "llvm.insertvalue"(%30, %8) <{position = array<i64: 4, 0>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %32 = "llvm.insertvalue"(%31, %9) <{position = array<i64: 4, 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %33 = "builtin.unrealized_conversion_cast"(%32) : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>) -> memref<3x5xf32>
  %34 = "FDRA.BlockLoad"(%6) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>) -> memref<3x5xf32>
  %35 = "FDRA.BlockLoad"(%4) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>) -> memref<3x5xf32>
  %36 = "FDRA.BlockLoad"(%33) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>) -> memref<3x5xf32>
  "FDRA.KernelCall"(%34, %35, %36) {callee = @forward_kernel_0} : (memref<3x5xf32>, memref<3x5xf32>, memref<3x5xf32>) -> ()
  "FDRA.BlockStore"(%36, %33) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>, memref<3x5xf32>) -> ()
  "func.return"(%33) : (memref<3x5xf32>) -> ()
}) : () -> ()
[debug] before replaceUsesOfBlockArgument newFuncOp:"llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<ptr (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "forward", visibility_ = 0 : i64}> ({
^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
  %0 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %1 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %2 = "llvm.insertvalue"(%1, %arg0) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, !llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %3 = "llvm.insertvalue"(%2, %arg0) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, !llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %4 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
  %5 = "llvm.insertvalue"(%3, %4) <{position = array<i64: 2>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %6 = "llvm.mlir.constant"() <{value = 3 : index}> : () -> i64
  %7 = "llvm.insertvalue"(%5, %6) <{position = array<i64: 3, 0>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %8 = "llvm.mlir.constant"() <{value = 5 : index}> : () -> i64
  %9 = "llvm.insertvalue"(%7, %8) <{position = array<i64: 4, 0>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %10 = "llvm.mlir.constant"() <{value = 5 : index}> : () -> i64
  %11 = "llvm.insertvalue"(%9, %10) <{position = array<i64: 3, 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %12 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
  %13 = "llvm.insertvalue"(%11, %12) <{position = array<i64: 4, 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %14 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %15 = "builtin.unrealized_conversion_cast"(%arg0) : (!llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %16 = "builtin.unrealized_conversion_cast"(%arg1) : (!llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %17 = "builtin.unrealized_conversion_cast"(<<UNKNOWN SSA VALUE>>) : (memref<3x5xf32>) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %18 = "builtin.unrealized_conversion_cast"(%17) : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>) -> memref<3x5xf32>
  %19 = "builtin.unrealized_conversion_cast"(<<UNKNOWN SSA VALUE>>) : (memref<3x5xf32>) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %20 = "builtin.unrealized_conversion_cast"(%19) : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>) -> memref<3x5xf32>
  %21 = "llvm.mlir.constant"() <{value = 3 : index}> : () -> i64
  %22 = "llvm.mlir.constant"() <{value = 5 : index}> : () -> i64
  %23 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
  %24 = "llvm.mlir.constant"() <{value = 15 : index}> : () -> i64
  %25 = "llvm.mlir.null"() : () -> !llvm.ptr
  %26 = "llvm.getelementptr"(%25, %24) <{elem_type = f32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
  %27 = "llvm.ptrtoint"(%26) : (!llvm.ptr) -> i64
  %28 = "llvm.mlir.constant"() <{value = 64 : index}> : () -> i64
  %29 = "llvm.add"(%27, %28) : (i64, i64) -> i64
  %30 = "llvm.call"(%29) <{callee = @malloc, fastmathFlags = #llvm.fastmath<none>}> : (i64) -> !llvm.ptr
  %31 = "llvm.ptrtoint"(%30) : (!llvm.ptr) -> i64
  %32 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
  %33 = "llvm.sub"(%28, %32) : (i64, i64) -> i64
  %34 = "llvm.add"(%31, %33) : (i64, i64) -> i64
  %35 = "llvm.urem"(%34, %28) : (i64, i64) -> i64
  %36 = "llvm.sub"(%34, %35) : (i64, i64) -> i64
  %37 = "llvm.inttoptr"(%36) : (i64) -> !llvm.ptr
  %38 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %39 = "llvm.insertvalue"(%38, %30) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, !llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %40 = "llvm.insertvalue"(%39, %37) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, !llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %41 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
  %42 = "llvm.insertvalue"(%40, %41) <{position = array<i64: 2>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %43 = "llvm.insertvalue"(%42, %21) <{position = array<i64: 3, 0>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %44 = "llvm.insertvalue"(%43, %22) <{position = array<i64: 3, 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %45 = "llvm.insertvalue"(%44, %22) <{position = array<i64: 4, 0>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %46 = "llvm.insertvalue"(%45, %23) <{position = array<i64: 4, 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %47 = "builtin.unrealized_conversion_cast"(%46) : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>) -> memref<3x5xf32>
  %48 = "FDRA.BlockLoad"(%20) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>) -> memref<3x5xf32>
  %49 = "FDRA.BlockLoad"(%18) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>) -> memref<3x5xf32>
  %50 = "FDRA.BlockLoad"(%47) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>) -> memref<3x5xf32>
  "FDRA.KernelCall"(%48, %49, %50) {callee = @forward_kernel_0} : (memref<3x5xf32>, memref<3x5xf32>, memref<3x5xf32>) -> ()
  "FDRA.BlockStore"(%50, %47) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>, memref<3x5xf32>) -> ()
  "func.return"(%47) : (memref<3x5xf32>) -> ()
}) : () -> ()
[debug] after replaceUsesOfBlockArgument newFuncOp:"llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<ptr (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "forward", visibility_ = 0 : i64}> ({
^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
  %0 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %1 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %2 = "llvm.insertvalue"(%1, %arg0) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, !llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %3 = "llvm.insertvalue"(%2, %arg0) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, !llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %4 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
  %5 = "llvm.insertvalue"(%3, %4) <{position = array<i64: 2>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %6 = "llvm.mlir.constant"() <{value = 3 : index}> : () -> i64
  %7 = "llvm.insertvalue"(%5, %6) <{position = array<i64: 3, 0>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %8 = "llvm.mlir.constant"() <{value = 5 : index}> : () -> i64
  %9 = "llvm.insertvalue"(%7, %8) <{position = array<i64: 4, 0>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %10 = "llvm.mlir.constant"() <{value = 5 : index}> : () -> i64
  %11 = "llvm.insertvalue"(%9, %10) <{position = array<i64: 3, 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %12 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
  %13 = "llvm.insertvalue"(%11, %12) <{position = array<i64: 4, 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %14 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %15 = "builtin.unrealized_conversion_cast"(%arg0) : (!llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %16 = "builtin.unrealized_conversion_cast"(%arg1) : (!llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %17 = "builtin.unrealized_conversion_cast"(<<UNKNOWN SSA VALUE>>) : (memref<3x5xf32>) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %18 = "builtin.unrealized_conversion_cast"(%17) : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>) -> memref<3x5xf32>
  %19 = "builtin.unrealized_conversion_cast"(<<UNKNOWN SSA VALUE>>) : (memref<3x5xf32>) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %20 = "builtin.unrealized_conversion_cast"(%19) : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>) -> memref<3x5xf32>
  %21 = "llvm.mlir.constant"() <{value = 3 : index}> : () -> i64
  %22 = "llvm.mlir.constant"() <{value = 5 : index}> : () -> i64
  %23 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
  %24 = "llvm.mlir.constant"() <{value = 15 : index}> : () -> i64
  %25 = "llvm.mlir.null"() : () -> !llvm.ptr
  %26 = "llvm.getelementptr"(%25, %24) <{elem_type = f32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
  %27 = "llvm.ptrtoint"(%26) : (!llvm.ptr) -> i64
  %28 = "llvm.mlir.constant"() <{value = 64 : index}> : () -> i64
  %29 = "llvm.add"(%27, %28) : (i64, i64) -> i64
  %30 = "llvm.call"(%29) <{callee = @malloc, fastmathFlags = #llvm.fastmath<none>}> : (i64) -> !llvm.ptr
  %31 = "llvm.ptrtoint"(%30) : (!llvm.ptr) -> i64
  %32 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
  %33 = "llvm.sub"(%28, %32) : (i64, i64) -> i64
  %34 = "llvm.add"(%31, %33) : (i64, i64) -> i64
  %35 = "llvm.urem"(%34, %28) : (i64, i64) -> i64
  %36 = "llvm.sub"(%34, %35) : (i64, i64) -> i64
  %37 = "llvm.inttoptr"(%36) : (i64) -> !llvm.ptr
  %38 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %39 = "llvm.insertvalue"(%38, %30) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, !llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %40 = "llvm.insertvalue"(%39, %37) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, !llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %41 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
  %42 = "llvm.insertvalue"(%40, %41) <{position = array<i64: 2>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %43 = "llvm.insertvalue"(%42, %21) <{position = array<i64: 3, 0>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %44 = "llvm.insertvalue"(%43, %22) <{position = array<i64: 3, 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %45 = "llvm.insertvalue"(%44, %22) <{position = array<i64: 4, 0>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %46 = "llvm.insertvalue"(%45, %23) <{position = array<i64: 4, 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %47 = "builtin.unrealized_conversion_cast"(%46) : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>) -> memref<3x5xf32>
  %48 = "FDRA.BlockLoad"(%20) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>) -> memref<3x5xf32>
  %49 = "FDRA.BlockLoad"(%18) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>) -> memref<3x5xf32>
  %50 = "FDRA.BlockLoad"(%47) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>) -> memref<3x5xf32>
  "FDRA.KernelCall"(%48, %49, %50) {callee = @forward_kernel_0} : (memref<3x5xf32>, memref<3x5xf32>, memref<3x5xf32>) -> ()
  "FDRA.BlockStore"(%50, %47) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>, memref<3x5xf32>) -> ()
  "func.return"(%47) : (memref<3x5xf32>) -> ()
}) : () -> ()
[debug] newFuncOp:"llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<ptr (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "forward", visibility_ = 0 : i64}> ({
^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
  %0 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %1 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %2 = "llvm.insertvalue"(%1, %arg0) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, !llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %3 = "llvm.insertvalue"(%2, %arg0) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, !llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %4 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
  %5 = "llvm.insertvalue"(%3, %4) <{position = array<i64: 2>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %6 = "llvm.mlir.constant"() <{value = 3 : index}> : () -> i64
  %7 = "llvm.insertvalue"(%5, %6) <{position = array<i64: 3, 0>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %8 = "llvm.mlir.constant"() <{value = 5 : index}> : () -> i64
  %9 = "llvm.insertvalue"(%7, %8) <{position = array<i64: 4, 0>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %10 = "llvm.mlir.constant"() <{value = 5 : index}> : () -> i64
  %11 = "llvm.insertvalue"(%9, %10) <{position = array<i64: 3, 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %12 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
  %13 = "llvm.insertvalue"(%11, %12) <{position = array<i64: 4, 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %14 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %15 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %16 = "llvm.insertvalue"(%15, %arg1) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, !llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %17 = "llvm.insertvalue"(%16, %arg1) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, !llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %18 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
  %19 = "llvm.insertvalue"(%17, %18) <{position = array<i64: 2>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %20 = "llvm.mlir.constant"() <{value = 3 : index}> : () -> i64
  %21 = "llvm.insertvalue"(%19, %20) <{position = array<i64: 3, 0>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %22 = "llvm.mlir.constant"() <{value = 5 : index}> : () -> i64
  %23 = "llvm.insertvalue"(%21, %22) <{position = array<i64: 4, 0>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %24 = "llvm.mlir.constant"() <{value = 5 : index}> : () -> i64
  %25 = "llvm.insertvalue"(%23, %24) <{position = array<i64: 3, 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %26 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
  %27 = "llvm.insertvalue"(%25, %26) <{position = array<i64: 4, 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %28 = "builtin.unrealized_conversion_cast"(%arg0) : (!llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %29 = "builtin.unrealized_conversion_cast"(%arg1) : (!llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %30 = "builtin.unrealized_conversion_cast"(<<UNKNOWN SSA VALUE>>) : (memref<3x5xf32>) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %31 = "builtin.unrealized_conversion_cast"(%30) : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>) -> memref<3x5xf32>
  %32 = "builtin.unrealized_conversion_cast"(<<UNKNOWN SSA VALUE>>) : (memref<3x5xf32>) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %33 = "builtin.unrealized_conversion_cast"(%32) : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>) -> memref<3x5xf32>
  %34 = "llvm.mlir.constant"() <{value = 3 : index}> : () -> i64
  %35 = "llvm.mlir.constant"() <{value = 5 : index}> : () -> i64
  %36 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
  %37 = "llvm.mlir.constant"() <{value = 15 : index}> : () -> i64
  %38 = "llvm.mlir.null"() : () -> !llvm.ptr
  %39 = "llvm.getelementptr"(%38, %37) <{elem_type = f32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
  %40 = "llvm.ptrtoint"(%39) : (!llvm.ptr) -> i64
  %41 = "llvm.mlir.constant"() <{value = 64 : index}> : () -> i64
  %42 = "llvm.add"(%40, %41) : (i64, i64) -> i64
  %43 = "llvm.call"(%42) <{callee = @malloc, fastmathFlags = #llvm.fastmath<none>}> : (i64) -> !llvm.ptr
  %44 = "llvm.ptrtoint"(%43) : (!llvm.ptr) -> i64
  %45 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
  %46 = "llvm.sub"(%41, %45) : (i64, i64) -> i64
  %47 = "llvm.add"(%44, %46) : (i64, i64) -> i64
  %48 = "llvm.urem"(%47, %41) : (i64, i64) -> i64
  %49 = "llvm.sub"(%47, %48) : (i64, i64) -> i64
  %50 = "llvm.inttoptr"(%49) : (i64) -> !llvm.ptr
  %51 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %52 = "llvm.insertvalue"(%51, %43) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, !llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %53 = "llvm.insertvalue"(%52, %50) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, !llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %54 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
  %55 = "llvm.insertvalue"(%53, %54) <{position = array<i64: 2>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %56 = "llvm.insertvalue"(%55, %34) <{position = array<i64: 3, 0>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %57 = "llvm.insertvalue"(%56, %35) <{position = array<i64: 3, 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %58 = "llvm.insertvalue"(%57, %35) <{position = array<i64: 4, 0>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %59 = "llvm.insertvalue"(%58, %36) <{position = array<i64: 4, 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %60 = "builtin.unrealized_conversion_cast"(%59) : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>) -> memref<3x5xf32>
  %61 = "FDRA.BlockLoad"(%33) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>) -> memref<3x5xf32>
  %62 = "FDRA.BlockLoad"(%31) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>) -> memref<3x5xf32>
  %63 = "FDRA.BlockLoad"(%60) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>) -> memref<3x5xf32>
  "FDRA.KernelCall"(%61, %62, %63) {callee = @forward_kernel_0} : (memref<3x5xf32>, memref<3x5xf32>, memref<3x5xf32>) -> ()
  "FDRA.BlockStore"(%63, %60) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>, memref<3x5xf32>) -> ()
  "func.return"(%60) : (memref<3x5xf32>) -> ()
}) : () -> ()
[debug] op: %64 = "FDRA.BlockLoad"(%33) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>) -> memref<3x5xf32>
[debug] getMemref: %33 = "builtin.unrealized_conversion_cast"(%32) : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>) -> memref<3x5xf32> type:memref<3x5xf32>
[debug] base: %64 = "llvm.extractvalue"(%32) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>) -> !llvm.ptr
[debug] op: %77 = "FDRA.BlockLoad"(%31) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>) -> memref<3x5xf32>
[debug] getMemref: %31 = "builtin.unrealized_conversion_cast"(%30) : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>) -> memref<3x5xf32> type:memref<3x5xf32>
[debug] base: %77 = "llvm.extractvalue"(%30) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>) -> !llvm.ptr
[debug] op: %90 = "FDRA.BlockLoad"(%62) {KernelName = "forward_kernel_0", map = affine_map<() -> (0, 0)>} : (memref<3x5xf32>) -> memref<3x5xf32>
[debug] getMemref: %62 = "builtin.unrealized_conversion_cast"(%61) : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>) -> memref<3x5xf32> type:memref<3x5xf32>
[debug] base: %90 = "llvm.extractvalue"(%61) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>) -> !llvm.ptr
[debug] newFuncOp before inlineRegionBeforellvm.func @forward_kernel_0(!llvm.ptr, !llvm.ptr, !llvm.ptr) attributes {Kernel, forward_kernel_0}
[debug] funcOp before inlineRegionBeforefunc.func @forward_kernel_0(%arg0: memref<3x5xf32>, %arg1: memref<3x5xf32>, %arg2: memref<3x5xf32>) attributes {Kernel, forward_kernel_0} {
  %0 = builtin.unrealized_conversion_cast %arg0 : memref<3x5xf32> to !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %1 = builtin.unrealized_conversion_cast %arg1 : memref<3x5xf32> to !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %2 = builtin.unrealized_conversion_cast %arg2 : memref<3x5xf32> to !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  %3 = llvm.mlir.constant(5 : index) : i64
  %4 = llvm.mlir.constant(0 : index) : i64
  %5 = builtin.unrealized_conversion_cast %4 : i64 to index
  %6 = llvm.mlir.constant(3 : index) : i64
  %7 = llvm.mlir.constant(1 : index) : i64
  cf.br ^bb1(%5 : index)
^bb1(%8: index):  // 2 preds: ^bb0, ^bb5
  %9 = builtin.unrealized_conversion_cast %8 : index to i64
  %10 = builtin.unrealized_conversion_cast %8 : index to i64
  %11 = llvm.icmp "slt" %10, %6 : i64
  cf.cond_br %11, ^bb2, ^bb6
^bb2:  // pred: ^bb1
  cf.br ^bb3(%5 : index)
^bb3(%12: index):  // 2 preds: ^bb2, ^bb4
  %13 = builtin.unrealized_conversion_cast %12 : index to i64
  %14 = builtin.unrealized_conversion_cast %12 : index to i64
  %15 = llvm.icmp "slt" %14, %3 : i64
  cf.cond_br %15, ^bb4, ^bb5
^bb4:  // pred: ^bb3
  %16 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
  %17 = llvm.mlir.constant(5 : index) : i64
  %18 = llvm.mul %9, %17  : i64
  %19 = llvm.add %18, %13  : i64
  %20 = llvm.getelementptr %16[%19] : (!llvm.ptr, i64) -> !llvm.ptr, f32
  %21 = llvm.load %20 : !llvm.ptr -> f32
  %22 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
  %23 = llvm.mlir.constant(5 : index) : i64
  %24 = llvm.mul %9, %23  : i64
  %25 = llvm.add %24, %13  : i64
  %26 = llvm.getelementptr %22[%25] : (!llvm.ptr, i64) -> !llvm.ptr, f32
  %27 = llvm.load %26 : !llvm.ptr -> f32
  %28 = llvm.fadd %21, %27  : f32
  %29 = llvm.extractvalue %2[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
  %30 = llvm.mlir.constant(5 : index) : i64
  %31 = llvm.mul %9, %30  : i64
  %32 = llvm.add %31, %13  : i64
  %33 = llvm.getelementptr %29[%32] : (!llvm.ptr, i64) -> !llvm.ptr, f32
  llvm.store %28, %33 : f32, !llvm.ptr
  %34 = llvm.add %14, %7  : i64
  %35 = builtin.unrealized_conversion_cast %34 : i64 to index
  cf.br ^bb3(%35 : index)
^bb5:  // pred: ^bb3
  %36 = llvm.add %10, %7  : i64
  %37 = builtin.unrealized_conversion_cast %36 : i64 to index
  cf.br ^bb1(%37 : index)
^bb6:  // pred: ^bb1
  return
}
[debug] newFuncOp after convertRegionTypesllvm.func @forward_kernel_0(!llvm.ptr, !llvm.ptr, !llvm.ptr) attributes {Kernel, forward_kernel_0}
[debug] after convertFuncOpToLLVMFuncOp newFuncOp:llvm.func @forward_kernel_0(!llvm.ptr, !llvm.ptr, !llvm.ptr) attributes {Kernel, forward_kernel_0}
module attributes {torch.debug_module_name = "L"} {
  llvm.func @malloc(i64) -> !llvm.ptr
  llvm.func @forward(%arg0: !llvm.ptr, %arg1: !llvm.ptr) -> !llvm.ptr {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.mlir.constant(3 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.mlir.constant(5 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %9 = llvm.mlir.constant(5 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.mlir.constant(1 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = builtin.unrealized_conversion_cast %12 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> to memref<3x5xf32>
    %14 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %15 = llvm.insertvalue %arg1, %14[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %16 = llvm.insertvalue %arg1, %15[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %17 = llvm.mlir.constant(0 : index) : i64
    %18 = llvm.insertvalue %17, %16[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %19 = llvm.mlir.constant(3 : index) : i64
    %20 = llvm.insertvalue %19, %18[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %21 = llvm.mlir.constant(5 : index) : i64
    %22 = llvm.insertvalue %21, %20[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %23 = llvm.mlir.constant(5 : index) : i64
    %24 = llvm.insertvalue %23, %22[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %25 = llvm.mlir.constant(1 : index) : i64
    %26 = llvm.insertvalue %25, %24[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %27 = builtin.unrealized_conversion_cast %26 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> to memref<3x5xf32>
    %28 = builtin.unrealized_conversion_cast %27 : memref<3x5xf32> to !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %29 = builtin.unrealized_conversion_cast %28 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> to memref<3x5xf32>
    %30 = builtin.unrealized_conversion_cast %13 : memref<3x5xf32> to !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %31 = builtin.unrealized_conversion_cast %30 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> to memref<3x5xf32>
    %32 = llvm.mlir.constant(3 : index) : i64
    %33 = llvm.mlir.constant(5 : index) : i64
    %34 = llvm.mlir.constant(1 : index) : i64
    %35 = llvm.mlir.constant(15 : index) : i64
    %36 = llvm.mlir.null : !llvm.ptr
    %37 = llvm.getelementptr %36[%35] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %38 = llvm.ptrtoint %37 : !llvm.ptr to i64
    %39 = llvm.mlir.constant(64 : index) : i64
    %40 = llvm.add %38, %39  : i64
    %41 = llvm.call @malloc(%40) : (i64) -> !llvm.ptr
    %42 = llvm.ptrtoint %41 : !llvm.ptr to i64
    %43 = llvm.mlir.constant(1 : index) : i64
    %44 = llvm.sub %39, %43  : i64
    %45 = llvm.add %42, %44  : i64
    %46 = llvm.urem %45, %39  : i64
    %47 = llvm.sub %45, %46  : i64
    %48 = llvm.inttoptr %47 : i64 to !llvm.ptr
    %49 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %50 = llvm.insertvalue %41, %49[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %51 = llvm.insertvalue %48, %50[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %52 = llvm.mlir.constant(0 : index) : i64
    %53 = llvm.insertvalue %52, %51[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %54 = llvm.insertvalue %32, %53[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %55 = llvm.insertvalue %33, %54[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %56 = llvm.insertvalue %33, %55[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %57 = llvm.insertvalue %34, %56[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %58 = builtin.unrealized_conversion_cast %57 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> to memref<3x5xf32>
    %59 = llvm.mlir.constant(0 : index) : i64
    %60 = builtin.unrealized_conversion_cast %59 : i64 to index
    %61 = llvm.mlir.constant(0 : index) : i64
    %62 = builtin.unrealized_conversion_cast %61 : i64 to index
    %63 = llvm.extractvalue %30[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %64 = builtin.unrealized_conversion_cast %60 : index to i64
    %65 = llvm.mlir.constant(5 : index) : i64
    %66 = llvm.mul %64, %65  : i64
    %67 = builtin.unrealized_conversion_cast %62 : index to i64
    %68 = llvm.add %66, %67  : i64
    %69 = llvm.getelementptr %63[%68] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %70 = builtin.unrealized_conversion_cast %69 : !llvm.ptr to !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %71 = llvm.mlir.constant(0 : index) : i64
    %72 = builtin.unrealized_conversion_cast %71 : i64 to index
    %73 = llvm.mlir.constant(0 : index) : i64
    %74 = builtin.unrealized_conversion_cast %73 : i64 to index
    %75 = llvm.extractvalue %28[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %76 = builtin.unrealized_conversion_cast %72 : index to i64
    %77 = llvm.mlir.constant(5 : index) : i64
    %78 = llvm.mul %76, %77  : i64
    %79 = builtin.unrealized_conversion_cast %74 : index to i64
    %80 = llvm.add %78, %79  : i64
    %81 = llvm.getelementptr %75[%80] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %82 = builtin.unrealized_conversion_cast %81 : !llvm.ptr to !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %83 = llvm.mlir.constant(0 : index) : i64
    %84 = builtin.unrealized_conversion_cast %83 : i64 to index
    %85 = llvm.mlir.constant(0 : index) : i64
    %86 = builtin.unrealized_conversion_cast %85 : i64 to index
    %87 = llvm.extractvalue %57[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %88 = builtin.unrealized_conversion_cast %84 : index to i64
    %89 = llvm.mlir.constant(5 : index) : i64
    %90 = llvm.mul %88, %89  : i64
    %91 = builtin.unrealized_conversion_cast %86 : index to i64
    %92 = llvm.add %90, %91  : i64
    %93 = llvm.getelementptr %87[%92] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %94 = builtin.unrealized_conversion_cast %93 : !llvm.ptr to !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    llvm.call @forward_kernel_0(%69, %81, %93) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    %95 = llvm.extractvalue %57[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.return %95 : !llvm.ptr
  }
  llvm.func @forward_kernel_0(!llvm.ptr, !llvm.ptr, !llvm.ptr) attributes {Kernel, forward_kernel_0}
}
// -----// IR Dump After ConvertKernelCallToLLVM (fdra-convert-kernelcall-to-llvm) //----- //
module attributes {torch.debug_module_name = "L"} {
  llvm.func @malloc(i64) -> !llvm.ptr
  llvm.func @forward(%arg0: !llvm.ptr, %arg1: !llvm.ptr) -> !llvm.ptr {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.mlir.constant(3 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.mlir.constant(5 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %9 = llvm.mlir.constant(5 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.mlir.constant(1 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = builtin.unrealized_conversion_cast %12 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> to memref<3x5xf32>
    %14 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %15 = llvm.insertvalue %arg1, %14[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %16 = llvm.insertvalue %arg1, %15[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %17 = llvm.mlir.constant(0 : index) : i64
    %18 = llvm.insertvalue %17, %16[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %19 = llvm.mlir.constant(3 : index) : i64
    %20 = llvm.insertvalue %19, %18[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %21 = llvm.mlir.constant(5 : index) : i64
    %22 = llvm.insertvalue %21, %20[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %23 = llvm.mlir.constant(5 : index) : i64
    %24 = llvm.insertvalue %23, %22[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %25 = llvm.mlir.constant(1 : index) : i64
    %26 = llvm.insertvalue %25, %24[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %27 = builtin.unrealized_conversion_cast %26 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> to memref<3x5xf32>
    %28 = builtin.unrealized_conversion_cast %27 : memref<3x5xf32> to !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %29 = builtin.unrealized_conversion_cast %28 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> to memref<3x5xf32>
    %30 = builtin.unrealized_conversion_cast %13 : memref<3x5xf32> to !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %31 = builtin.unrealized_conversion_cast %30 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> to memref<3x5xf32>
    %32 = llvm.mlir.constant(3 : index) : i64
    %33 = llvm.mlir.constant(5 : index) : i64
    %34 = llvm.mlir.constant(1 : index) : i64
    %35 = llvm.mlir.constant(15 : index) : i64
    %36 = llvm.mlir.null : !llvm.ptr
    %37 = llvm.getelementptr %36[%35] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %38 = llvm.ptrtoint %37 : !llvm.ptr to i64
    %39 = llvm.mlir.constant(64 : index) : i64
    %40 = llvm.add %38, %39  : i64
    %41 = llvm.call @malloc(%40) : (i64) -> !llvm.ptr
    %42 = llvm.ptrtoint %41 : !llvm.ptr to i64
    %43 = llvm.mlir.constant(1 : index) : i64
    %44 = llvm.sub %39, %43  : i64
    %45 = llvm.add %42, %44  : i64
    %46 = llvm.urem %45, %39  : i64
    %47 = llvm.sub %45, %46  : i64
    %48 = llvm.inttoptr %47 : i64 to !llvm.ptr
    %49 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %50 = llvm.insertvalue %41, %49[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %51 = llvm.insertvalue %48, %50[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %52 = llvm.mlir.constant(0 : index) : i64
    %53 = llvm.insertvalue %52, %51[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %54 = llvm.insertvalue %32, %53[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %55 = llvm.insertvalue %33, %54[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %56 = llvm.insertvalue %33, %55[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %57 = llvm.insertvalue %34, %56[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %58 = builtin.unrealized_conversion_cast %57 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> to memref<3x5xf32>
    %59 = llvm.mlir.constant(0 : index) : i64
    %60 = builtin.unrealized_conversion_cast %59 : i64 to index
    %61 = llvm.mlir.constant(0 : index) : i64
    %62 = builtin.unrealized_conversion_cast %61 : i64 to index
    %63 = llvm.extractvalue %30[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %64 = builtin.unrealized_conversion_cast %60 : index to i64
    %65 = llvm.mlir.constant(5 : index) : i64
    %66 = llvm.mul %64, %65  : i64
    %67 = builtin.unrealized_conversion_cast %62 : index to i64
    %68 = llvm.add %66, %67  : i64
    %69 = llvm.getelementptr %63[%68] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %70 = builtin.unrealized_conversion_cast %69 : !llvm.ptr to !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %71 = llvm.mlir.constant(0 : index) : i64
    %72 = builtin.unrealized_conversion_cast %71 : i64 to index
    %73 = llvm.mlir.constant(0 : index) : i64
    %74 = builtin.unrealized_conversion_cast %73 : i64 to index
    %75 = llvm.extractvalue %28[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %76 = builtin.unrealized_conversion_cast %72 : index to i64
    %77 = llvm.mlir.constant(5 : index) : i64
    %78 = llvm.mul %76, %77  : i64
    %79 = builtin.unrealized_conversion_cast %74 : index to i64
    %80 = llvm.add %78, %79  : i64
    %81 = llvm.getelementptr %75[%80] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %82 = builtin.unrealized_conversion_cast %81 : !llvm.ptr to !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %83 = llvm.mlir.constant(0 : index) : i64
    %84 = builtin.unrealized_conversion_cast %83 : i64 to index
    %85 = llvm.mlir.constant(0 : index) : i64
    %86 = builtin.unrealized_conversion_cast %85 : i64 to index
    %87 = llvm.extractvalue %57[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %88 = builtin.unrealized_conversion_cast %84 : index to i64
    %89 = llvm.mlir.constant(5 : index) : i64
    %90 = llvm.mul %88, %89  : i64
    %91 = builtin.unrealized_conversion_cast %86 : index to i64
    %92 = llvm.add %90, %91  : i64
    %93 = llvm.getelementptr %87[%92] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %94 = builtin.unrealized_conversion_cast %93 : !llvm.ptr to !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    llvm.call @forward_kernel_0(%69, %81, %93) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    %95 = llvm.extractvalue %57[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.return %95 : !llvm.ptr
  }
  llvm.func @forward_kernel_0(!llvm.ptr, !llvm.ptr, !llvm.ptr) attributes {Kernel, forward_kernel_0}
}


// -----// IR Dump After ConvertFuncToLLVMPass (convert-func-to-llvm) //----- //
module attributes {llvm.data_layout = "", torch.debug_module_name = "L"} {
  llvm.func @malloc(i64) -> !llvm.ptr
  llvm.func @forward(%arg0: !llvm.ptr, %arg1: !llvm.ptr) -> !llvm.ptr {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.mlir.constant(3 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.mlir.constant(5 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %9 = llvm.mlir.constant(5 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.mlir.constant(1 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = builtin.unrealized_conversion_cast %12 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> to memref<3x5xf32>
    %14 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %15 = llvm.insertvalue %arg1, %14[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %16 = llvm.insertvalue %arg1, %15[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %17 = llvm.mlir.constant(0 : index) : i64
    %18 = llvm.insertvalue %17, %16[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %19 = llvm.mlir.constant(3 : index) : i64
    %20 = llvm.insertvalue %19, %18[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %21 = llvm.mlir.constant(5 : index) : i64
    %22 = llvm.insertvalue %21, %20[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %23 = llvm.mlir.constant(5 : index) : i64
    %24 = llvm.insertvalue %23, %22[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %25 = llvm.mlir.constant(1 : index) : i64
    %26 = llvm.insertvalue %25, %24[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %27 = builtin.unrealized_conversion_cast %26 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> to memref<3x5xf32>
    %28 = builtin.unrealized_conversion_cast %27 : memref<3x5xf32> to !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %29 = builtin.unrealized_conversion_cast %28 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> to memref<3x5xf32>
    %30 = builtin.unrealized_conversion_cast %13 : memref<3x5xf32> to !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %31 = builtin.unrealized_conversion_cast %30 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> to memref<3x5xf32>
    %32 = llvm.mlir.constant(3 : index) : i64
    %33 = llvm.mlir.constant(5 : index) : i64
    %34 = llvm.mlir.constant(1 : index) : i64
    %35 = llvm.mlir.constant(15 : index) : i64
    %36 = llvm.mlir.null : !llvm.ptr
    %37 = llvm.getelementptr %36[%35] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %38 = llvm.ptrtoint %37 : !llvm.ptr to i64
    %39 = llvm.mlir.constant(64 : index) : i64
    %40 = llvm.add %38, %39  : i64
    %41 = llvm.call @malloc(%40) : (i64) -> !llvm.ptr
    %42 = llvm.ptrtoint %41 : !llvm.ptr to i64
    %43 = llvm.mlir.constant(1 : index) : i64
    %44 = llvm.sub %39, %43  : i64
    %45 = llvm.add %42, %44  : i64
    %46 = llvm.urem %45, %39  : i64
    %47 = llvm.sub %45, %46  : i64
    %48 = llvm.inttoptr %47 : i64 to !llvm.ptr
    %49 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %50 = llvm.insertvalue %41, %49[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %51 = llvm.insertvalue %48, %50[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %52 = llvm.mlir.constant(0 : index) : i64
    %53 = llvm.insertvalue %52, %51[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %54 = llvm.insertvalue %32, %53[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %55 = llvm.insertvalue %33, %54[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %56 = llvm.insertvalue %33, %55[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %57 = llvm.insertvalue %34, %56[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %58 = builtin.unrealized_conversion_cast %57 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> to memref<3x5xf32>
    %59 = llvm.mlir.constant(0 : index) : i64
    %60 = builtin.unrealized_conversion_cast %59 : i64 to index
    %61 = llvm.mlir.constant(0 : index) : i64
    %62 = builtin.unrealized_conversion_cast %61 : i64 to index
    %63 = llvm.extractvalue %30[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %64 = builtin.unrealized_conversion_cast %60 : index to i64
    %65 = llvm.mlir.constant(5 : index) : i64
    %66 = llvm.mul %64, %65  : i64
    %67 = builtin.unrealized_conversion_cast %62 : index to i64
    %68 = llvm.add %66, %67  : i64
    %69 = llvm.getelementptr %63[%68] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %70 = builtin.unrealized_conversion_cast %69 : !llvm.ptr to !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %71 = llvm.mlir.constant(0 : index) : i64
    %72 = builtin.unrealized_conversion_cast %71 : i64 to index
    %73 = llvm.mlir.constant(0 : index) : i64
    %74 = builtin.unrealized_conversion_cast %73 : i64 to index
    %75 = llvm.extractvalue %28[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %76 = builtin.unrealized_conversion_cast %72 : index to i64
    %77 = llvm.mlir.constant(5 : index) : i64
    %78 = llvm.mul %76, %77  : i64
    %79 = builtin.unrealized_conversion_cast %74 : index to i64
    %80 = llvm.add %78, %79  : i64
    %81 = llvm.getelementptr %75[%80] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %82 = builtin.unrealized_conversion_cast %81 : !llvm.ptr to !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %83 = llvm.mlir.constant(0 : index) : i64
    %84 = builtin.unrealized_conversion_cast %83 : i64 to index
    %85 = llvm.mlir.constant(0 : index) : i64
    %86 = builtin.unrealized_conversion_cast %85 : i64 to index
    %87 = llvm.extractvalue %57[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %88 = builtin.unrealized_conversion_cast %84 : index to i64
    %89 = llvm.mlir.constant(5 : index) : i64
    %90 = llvm.mul %88, %89  : i64
    %91 = builtin.unrealized_conversion_cast %86 : index to i64
    %92 = llvm.add %90, %91  : i64
    %93 = llvm.getelementptr %87[%92] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %94 = builtin.unrealized_conversion_cast %93 : !llvm.ptr to !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    llvm.call @forward_kernel_0(%69, %81, %93) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    %95 = llvm.extractvalue %57[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.return %95 : !llvm.ptr
  }
  llvm.func @forward_kernel_0(!llvm.ptr, !llvm.ptr, !llvm.ptr) attributes {Kernel, forward_kernel_0}
}


// -----// IR Dump After FinalizeMemRefToLLVMConversionPass (finalize-memref-to-llvm) //----- //
module attributes {llvm.data_layout = "", torch.debug_module_name = "L"} {
  llvm.func @malloc(i64) -> !llvm.ptr
  llvm.func @forward(%arg0: !llvm.ptr, %arg1: !llvm.ptr) -> !llvm.ptr {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.mlir.constant(3 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.mlir.constant(5 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %9 = llvm.mlir.constant(5 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.mlir.constant(1 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = builtin.unrealized_conversion_cast %12 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> to memref<3x5xf32>
    %14 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %15 = llvm.insertvalue %arg1, %14[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %16 = llvm.insertvalue %arg1, %15[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %17 = llvm.mlir.constant(0 : index) : i64
    %18 = llvm.insertvalue %17, %16[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %19 = llvm.mlir.constant(3 : index) : i64
    %20 = llvm.insertvalue %19, %18[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %21 = llvm.mlir.constant(5 : index) : i64
    %22 = llvm.insertvalue %21, %20[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %23 = llvm.mlir.constant(5 : index) : i64
    %24 = llvm.insertvalue %23, %22[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %25 = llvm.mlir.constant(1 : index) : i64
    %26 = llvm.insertvalue %25, %24[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %27 = builtin.unrealized_conversion_cast %26 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> to memref<3x5xf32>
    %28 = builtin.unrealized_conversion_cast %27 : memref<3x5xf32> to !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %29 = builtin.unrealized_conversion_cast %28 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> to memref<3x5xf32>
    %30 = builtin.unrealized_conversion_cast %13 : memref<3x5xf32> to !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %31 = builtin.unrealized_conversion_cast %30 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> to memref<3x5xf32>
    %32 = llvm.mlir.constant(3 : index) : i64
    %33 = llvm.mlir.constant(5 : index) : i64
    %34 = llvm.mlir.constant(1 : index) : i64
    %35 = llvm.mlir.constant(15 : index) : i64
    %36 = llvm.mlir.null : !llvm.ptr
    %37 = llvm.getelementptr %36[%35] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %38 = llvm.ptrtoint %37 : !llvm.ptr to i64
    %39 = llvm.mlir.constant(64 : index) : i64
    %40 = llvm.add %38, %39  : i64
    %41 = llvm.call @malloc(%40) : (i64) -> !llvm.ptr
    %42 = llvm.ptrtoint %41 : !llvm.ptr to i64
    %43 = llvm.mlir.constant(1 : index) : i64
    %44 = llvm.sub %39, %43  : i64
    %45 = llvm.add %42, %44  : i64
    %46 = llvm.urem %45, %39  : i64
    %47 = llvm.sub %45, %46  : i64
    %48 = llvm.inttoptr %47 : i64 to !llvm.ptr
    %49 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %50 = llvm.insertvalue %41, %49[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %51 = llvm.insertvalue %48, %50[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %52 = llvm.mlir.constant(0 : index) : i64
    %53 = llvm.insertvalue %52, %51[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %54 = llvm.insertvalue %32, %53[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %55 = llvm.insertvalue %33, %54[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %56 = llvm.insertvalue %33, %55[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %57 = llvm.insertvalue %34, %56[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %58 = builtin.unrealized_conversion_cast %57 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> to memref<3x5xf32>
    %59 = llvm.mlir.constant(0 : index) : i64
    %60 = builtin.unrealized_conversion_cast %59 : i64 to index
    %61 = llvm.mlir.constant(0 : index) : i64
    %62 = builtin.unrealized_conversion_cast %61 : i64 to index
    %63 = llvm.extractvalue %30[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %64 = builtin.unrealized_conversion_cast %60 : index to i64
    %65 = llvm.mlir.constant(5 : index) : i64
    %66 = llvm.mul %64, %65  : i64
    %67 = builtin.unrealized_conversion_cast %62 : index to i64
    %68 = llvm.add %66, %67  : i64
    %69 = llvm.getelementptr %63[%68] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %70 = builtin.unrealized_conversion_cast %69 : !llvm.ptr to !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %71 = llvm.mlir.constant(0 : index) : i64
    %72 = builtin.unrealized_conversion_cast %71 : i64 to index
    %73 = llvm.mlir.constant(0 : index) : i64
    %74 = builtin.unrealized_conversion_cast %73 : i64 to index
    %75 = llvm.extractvalue %28[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %76 = builtin.unrealized_conversion_cast %72 : index to i64
    %77 = llvm.mlir.constant(5 : index) : i64
    %78 = llvm.mul %76, %77  : i64
    %79 = builtin.unrealized_conversion_cast %74 : index to i64
    %80 = llvm.add %78, %79  : i64
    %81 = llvm.getelementptr %75[%80] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %82 = builtin.unrealized_conversion_cast %81 : !llvm.ptr to !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %83 = llvm.mlir.constant(0 : index) : i64
    %84 = builtin.unrealized_conversion_cast %83 : i64 to index
    %85 = llvm.mlir.constant(0 : index) : i64
    %86 = builtin.unrealized_conversion_cast %85 : i64 to index
    %87 = llvm.extractvalue %57[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %88 = builtin.unrealized_conversion_cast %84 : index to i64
    %89 = llvm.mlir.constant(5 : index) : i64
    %90 = llvm.mul %88, %89  : i64
    %91 = builtin.unrealized_conversion_cast %86 : index to i64
    %92 = llvm.add %90, %91  : i64
    %93 = llvm.getelementptr %87[%92] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %94 = builtin.unrealized_conversion_cast %93 : !llvm.ptr to !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    llvm.call @forward_kernel_0(%69, %81, %93) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    %95 = llvm.extractvalue %57[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.return %95 : !llvm.ptr
  }
  llvm.func @forward_kernel_0(!llvm.ptr, !llvm.ptr, !llvm.ptr) attributes {Kernel, forward_kernel_0}
}


// -----// IR Dump After CSE (cse) //----- //
module attributes {llvm.data_layout = "", torch.debug_module_name = "L"} {
  llvm.func @malloc(i64) -> !llvm.ptr
  llvm.func @forward(%arg0: !llvm.ptr, %arg1: !llvm.ptr) -> !llvm.ptr {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.mlir.constant(3 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.mlir.constant(5 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %9 = llvm.insertvalue %7, %8[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %10 = llvm.mlir.constant(1 : index) : i64
    %11 = llvm.insertvalue %10, %9[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %12 = builtin.unrealized_conversion_cast %11 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> to memref<3x5xf32>
    %13 = llvm.insertvalue %arg1, %0[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %14 = llvm.insertvalue %arg1, %13[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %15 = llvm.insertvalue %3, %14[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %16 = llvm.insertvalue %5, %15[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %17 = llvm.insertvalue %7, %16[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %18 = llvm.insertvalue %7, %17[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %19 = llvm.insertvalue %10, %18[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %20 = builtin.unrealized_conversion_cast %19 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> to memref<3x5xf32>
    %21 = builtin.unrealized_conversion_cast %20 : memref<3x5xf32> to !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %22 = builtin.unrealized_conversion_cast %12 : memref<3x5xf32> to !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %23 = llvm.mlir.constant(15 : index) : i64
    %24 = llvm.mlir.null : !llvm.ptr
    %25 = llvm.getelementptr %24[%23] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %26 = llvm.ptrtoint %25 : !llvm.ptr to i64
    %27 = llvm.mlir.constant(64 : index) : i64
    %28 = llvm.add %26, %27  : i64
    %29 = llvm.call @malloc(%28) : (i64) -> !llvm.ptr
    %30 = llvm.ptrtoint %29 : !llvm.ptr to i64
    %31 = llvm.sub %27, %10  : i64
    %32 = llvm.add %30, %31  : i64
    %33 = llvm.urem %32, %27  : i64
    %34 = llvm.sub %32, %33  : i64
    %35 = llvm.inttoptr %34 : i64 to !llvm.ptr
    %36 = llvm.insertvalue %29, %0[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %37 = llvm.insertvalue %35, %36[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %38 = llvm.insertvalue %3, %37[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %39 = llvm.insertvalue %5, %38[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %40 = llvm.insertvalue %7, %39[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %41 = llvm.insertvalue %7, %40[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %42 = llvm.insertvalue %10, %41[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %43 = builtin.unrealized_conversion_cast %3 : i64 to index
    %44 = llvm.extractvalue %22[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %45 = builtin.unrealized_conversion_cast %43 : index to i64
    %46 = llvm.mul %45, %7  : i64
    %47 = llvm.add %46, %45  : i64
    %48 = llvm.getelementptr %44[%47] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %49 = llvm.extractvalue %21[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %50 = llvm.getelementptr %49[%47] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %51 = llvm.extractvalue %42[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %52 = llvm.getelementptr %51[%47] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.call @forward_kernel_0(%48, %50, %52) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    %53 = llvm.extractvalue %42[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.return %53 : !llvm.ptr
  }
  llvm.func @forward_kernel_0(!llvm.ptr, !llvm.ptr, !llvm.ptr) attributes {Kernel, forward_kernel_0}
}


// -----// IR Dump After Canonicalizer (canonicalize) //----- //
module attributes {llvm.data_layout = "", torch.debug_module_name = "L"} {
  llvm.func @malloc(i64) -> !llvm.ptr
  llvm.func @forward(%arg0: !llvm.ptr, %arg1: !llvm.ptr) -> !llvm.ptr {
    %0 = llvm.mlir.constant(64 : index) : i64
    %1 = llvm.mlir.constant(1 : index) : i64
    %2 = llvm.mlir.constant(5 : index) : i64
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.mlir.null : !llvm.ptr
    %5 = llvm.getelementptr %4[15] : (!llvm.ptr) -> !llvm.ptr, f32
    %6 = llvm.ptrtoint %5 : !llvm.ptr to i64
    %7 = llvm.add %6, %0  : i64
    %8 = llvm.call @malloc(%7) : (i64) -> !llvm.ptr
    %9 = llvm.ptrtoint %8 : !llvm.ptr to i64
    %10 = llvm.sub %0, %1  : i64
    %11 = llvm.add %9, %10  : i64
    %12 = llvm.urem %11, %0  : i64
    %13 = llvm.sub %11, %12  : i64
    %14 = llvm.inttoptr %13 : i64 to !llvm.ptr
    %15 = llvm.mul %3, %2  : i64
    %16 = llvm.add %15, %3  : i64
    %17 = llvm.getelementptr %arg0[%16] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %18 = llvm.getelementptr %arg1[%16] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %19 = llvm.getelementptr %14[%16] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.call @forward_kernel_0(%17, %18, %19) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    llvm.return %8 : !llvm.ptr
  }
  llvm.func @forward_kernel_0(!llvm.ptr, !llvm.ptr, !llvm.ptr) attributes {Kernel, forward_kernel_0}
}


// -----// IR Dump After ReconcileUnrealizedCasts (reconcile-unrealized-casts) //----- //
module attributes {llvm.data_layout = "", torch.debug_module_name = "L"} {
  llvm.func @malloc(i64) -> !llvm.ptr
  llvm.func @forward(%arg0: !llvm.ptr, %arg1: !llvm.ptr) -> !llvm.ptr {
    %0 = llvm.mlir.constant(64 : index) : i64
    %1 = llvm.mlir.constant(1 : index) : i64
    %2 = llvm.mlir.constant(5 : index) : i64
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.mlir.null : !llvm.ptr
    %5 = llvm.getelementptr %4[15] : (!llvm.ptr) -> !llvm.ptr, f32
    %6 = llvm.ptrtoint %5 : !llvm.ptr to i64
    %7 = llvm.add %6, %0  : i64
    %8 = llvm.call @malloc(%7) : (i64) -> !llvm.ptr
    %9 = llvm.ptrtoint %8 : !llvm.ptr to i64
    %10 = llvm.sub %0, %1  : i64
    %11 = llvm.add %9, %10  : i64
    %12 = llvm.urem %11, %0  : i64
    %13 = llvm.sub %11, %12  : i64
    %14 = llvm.inttoptr %13 : i64 to !llvm.ptr
    %15 = llvm.mul %3, %2  : i64
    %16 = llvm.add %15, %3  : i64
    %17 = llvm.getelementptr %arg0[%16] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %18 = llvm.getelementptr %arg1[%16] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %19 = llvm.getelementptr %14[%16] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.call @forward_kernel_0(%17, %18, %19) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    llvm.return %8 : !llvm.ptr
  }
  llvm.func @forward_kernel_0(!llvm.ptr, !llvm.ptr, !llvm.ptr) attributes {Kernel, forward_kernel_0}
}


