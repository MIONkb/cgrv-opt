// -----// IR Dump After PromoteBuffersToStack (promote-buffers-to-stack) //----- //
func.func @forward(%arg0: memref<2xi32>, %arg1: memref<2xi32>) -> memref<2xi32> {
  %0 = memref.alloc() {alignment = 64 : i64} : memref<2xi32>
  FDRA.KernelCall @forward_kernel_0(%arg0, %arg1, %0) : (memref<2xi32>, memref<2xi32>, memref<2xi32>) -> ()
  return %0 : memref<2xi32>
}

// -----// IR Dump After PromoteBuffersToStack (promote-buffers-to-stack) //----- //
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

// -----// IR Dump After ArithmeticExpandOps (arith-expand) //----- //
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


// -----// IR Dump After ExpandOps (memref-expand) //----- //
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


// -----// IR Dump After NormalizeMemRefs (normalize-memrefs) //----- //
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


// -----// IR Dump After SimplifyAffineStructures (affine-simplify-structures) //----- //
func.func @forward(%arg0: memref<2xi32>, %arg1: memref<2xi32>) -> memref<2xi32> {
  %0 = memref.alloc() {alignment = 64 : i64} : memref<2xi32>
  FDRA.KernelCall @forward_kernel_0(%arg0, %arg1, %0) : (memref<2xi32>, memref<2xi32>, memref<2xi32>) -> ()
  return %0 : memref<2xi32>
}

// -----// IR Dump After SimplifyAffineStructures (affine-simplify-structures) //----- //
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

// -----// IR Dump After ConvertAffineToStandard (lower-affine) //----- //
module attributes {torch.debug_module_name = "L"} {
  func.func @forward(%arg0: memref<2xi32>, %arg1: memref<2xi32>) -> memref<2xi32> {
    %0 = memref.alloc() {alignment = 64 : i64} : memref<2xi32>
    FDRA.KernelCall @forward_kernel_0(%arg0, %arg1, %0) : (memref<2xi32>, memref<2xi32>, memref<2xi32>) -> ()
    return %0 : memref<2xi32>
  }
  func.func @forward_kernel_0(%arg0: memref<2xi32>, %arg1: memref<2xi32>, %arg2: memref<2xi32>) attributes {Kernel, forward_kernel_0} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    %c0 = arith.constant 0 : index
    %c2 = arith.constant 2 : index
    %c1 = arith.constant 1 : index
    scf.for %arg3 = %c0 to %c2 step %c1 {
      %0 = memref.load %arg0[%arg3] : memref<2xi32>
      %1 = memref.load %arg1[%arg3] : memref<2xi32>
      %2 = arith.addi %0, %1 : i32
      memref.store %2, %arg2[%arg3] : memref<2xi32>
    }
    return
  }
}


// -----// IR Dump After SCFForLoopCanonicalization (scf-for-loop-canonicalization) //----- //
module attributes {torch.debug_module_name = "L"} {
  func.func @forward(%arg0: memref<2xi32>, %arg1: memref<2xi32>) -> memref<2xi32> {
    %0 = memref.alloc() {alignment = 64 : i64} : memref<2xi32>
    FDRA.KernelCall @forward_kernel_0(%arg0, %arg1, %0) : (memref<2xi32>, memref<2xi32>, memref<2xi32>) -> ()
    return %0 : memref<2xi32>
  }
  func.func @forward_kernel_0(%arg0: memref<2xi32>, %arg1: memref<2xi32>, %arg2: memref<2xi32>) attributes {Kernel, forward_kernel_0} {
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    scf.for %arg3 = %c0 to %c2 step %c1 {
      %0 = memref.load %arg0[%arg3] : memref<2xi32>
      %1 = memref.load %arg1[%arg3] : memref<2xi32>
      %2 = arith.addi %0, %1 : i32
      memref.store %2, %arg2[%arg3] : memref<2xi32>
    }
    return
  }
}


// -----// IR Dump After SCFToControlFlow (convert-scf-to-cf) //----- //
module attributes {torch.debug_module_name = "L"} {
  func.func @forward(%arg0: memref<2xi32>, %arg1: memref<2xi32>) -> memref<2xi32> {
    %0 = memref.alloc() {alignment = 64 : i64} : memref<2xi32>
    FDRA.KernelCall @forward_kernel_0(%arg0, %arg1, %0) : (memref<2xi32>, memref<2xi32>, memref<2xi32>) -> ()
    return %0 : memref<2xi32>
  }
  func.func @forward_kernel_0(%arg0: memref<2xi32>, %arg1: memref<2xi32>, %arg2: memref<2xi32>) attributes {Kernel, forward_kernel_0} {
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%c0 : index)
  ^bb2(%0: index):  // 2 preds: ^bb1, ^bb3
    %1 = arith.cmpi slt, %0, %c2 : index
    cf.cond_br %1, ^bb3, ^bb4
  ^bb3:  // pred: ^bb2
    %2 = memref.load %arg0[%0] : memref<2xi32>
    %3 = memref.load %arg1[%0] : memref<2xi32>
    %4 = arith.addi %2, %3 : i32
    memref.store %4, %arg2[%0] : memref<2xi32>
    %5 = arith.addi %0, %c1 : index
    cf.br ^bb2(%5 : index)
  ^bb4:  // pred: ^bb2
    return
  }
}


// -----// IR Dump After ConvertMathToLLVM (convert-math-to-llvm) //----- //
module attributes {torch.debug_module_name = "L"} {
  func.func @forward(%arg0: memref<2xi32>, %arg1: memref<2xi32>) -> memref<2xi32> {
    %0 = memref.alloc() {alignment = 64 : i64} : memref<2xi32>
    FDRA.KernelCall @forward_kernel_0(%arg0, %arg1, %0) : (memref<2xi32>, memref<2xi32>, memref<2xi32>) -> ()
    return %0 : memref<2xi32>
  }
  func.func @forward_kernel_0(%arg0: memref<2xi32>, %arg1: memref<2xi32>, %arg2: memref<2xi32>) attributes {Kernel, forward_kernel_0} {
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%c0 : index)
  ^bb2(%0: index):  // 2 preds: ^bb1, ^bb3
    %1 = arith.cmpi slt, %0, %c2 : index
    cf.cond_br %1, ^bb3, ^bb4
  ^bb3:  // pred: ^bb2
    %2 = memref.load %arg0[%0] : memref<2xi32>
    %3 = memref.load %arg1[%0] : memref<2xi32>
    %4 = arith.addi %2, %3 : i32
    memref.store %4, %arg2[%0] : memref<2xi32>
    %5 = arith.addi %0, %c1 : index
    cf.br ^bb2(%5 : index)
  ^bb4:  // pred: ^bb2
    return
  }
}


// -----// IR Dump After ConvertMathToLibm (convert-math-to-libm) //----- //
module attributes {torch.debug_module_name = "L"} {
  func.func @forward(%arg0: memref<2xi32>, %arg1: memref<2xi32>) -> memref<2xi32> {
    %0 = memref.alloc() {alignment = 64 : i64} : memref<2xi32>
    FDRA.KernelCall @forward_kernel_0(%arg0, %arg1, %0) : (memref<2xi32>, memref<2xi32>, memref<2xi32>) -> ()
    return %0 : memref<2xi32>
  }
  func.func @forward_kernel_0(%arg0: memref<2xi32>, %arg1: memref<2xi32>, %arg2: memref<2xi32>) attributes {Kernel, forward_kernel_0} {
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%c0 : index)
  ^bb2(%0: index):  // 2 preds: ^bb1, ^bb3
    %1 = arith.cmpi slt, %0, %c2 : index
    cf.cond_br %1, ^bb3, ^bb4
  ^bb3:  // pred: ^bb2
    %2 = memref.load %arg0[%0] : memref<2xi32>
    %3 = memref.load %arg1[%0] : memref<2xi32>
    %4 = arith.addi %2, %3 : i32
    memref.store %4, %arg2[%0] : memref<2xi32>
    %5 = arith.addi %0, %c1 : index
    cf.br ^bb2(%5 : index)
  ^bb4:  // pred: ^bb2
    return
  }
}


// -----// IR Dump After ConvertArithmeticToLLVM (convert-arith-to-llvm) //----- //
module attributes {torch.debug_module_name = "L"} {
  func.func @forward(%arg0: memref<2xi32>, %arg1: memref<2xi32>) -> memref<2xi32> {
    %0 = memref.alloc() {alignment = 64 : i64} : memref<2xi32>
    FDRA.KernelCall @forward_kernel_0(%arg0, %arg1, %0) : (memref<2xi32>, memref<2xi32>, memref<2xi32>) -> ()
    return %0 : memref<2xi32>
  }
  func.func @forward_kernel_0(%arg0: memref<2xi32>, %arg1: memref<2xi32>, %arg2: memref<2xi32>) attributes {Kernel, forward_kernel_0} {
    %0 = llvm.mlir.constant(1 : index) : i64
    %1 = llvm.mlir.constant(2 : index) : i64
    %2 = llvm.mlir.constant(0 : index) : i64
    %3 = builtin.unrealized_conversion_cast %2 : i64 to index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%3 : index)
  ^bb2(%4: index):  // 2 preds: ^bb1, ^bb3
    %5 = builtin.unrealized_conversion_cast %4 : index to i64
    %6 = llvm.icmp "slt" %5, %1 : i64
    cf.cond_br %6, ^bb3, ^bb4
  ^bb3:  // pred: ^bb2
    %7 = memref.load %arg0[%4] : memref<2xi32>
    %8 = memref.load %arg1[%4] : memref<2xi32>
    %9 = llvm.add %7, %8  : i32
    memref.store %9, %arg2[%4] : memref<2xi32>
    %10 = llvm.add %5, %0  : i64
    %11 = builtin.unrealized_conversion_cast %10 : i64 to index
    cf.br ^bb2(%11 : index)
  ^bb4:  // pred: ^bb2
    return
  }
}


[debug] not a kernel func
// -----// IR Dump After ConvertKernelCallToLLVM (fdra-convert-kernelcall-to-llvm) //----- //
module attributes {torch.debug_module_name = "L"} {
  llvm.func @forward(%arg0: !llvm.ptr<i32>, %arg1: !llvm.ptr<i32>) -> !llvm.ptr<i32> {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %5 = llvm.mlir.constant(2 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %7 = llvm.mlir.constant(1 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %9 = llvm.mlir.undef : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)>
    %10 = llvm.insertvalue %arg1, %9[0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %11 = llvm.insertvalue %arg1, %10[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %12 = llvm.mlir.constant(0 : index) : i64
    %13 = llvm.insertvalue %12, %11[2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %14 = llvm.mlir.constant(2 : index) : i64
    %15 = llvm.insertvalue %14, %13[3, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %16 = llvm.mlir.constant(1 : index) : i64
    %17 = llvm.insertvalue %16, %15[4, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %18 = memref.alloc() {alignment = 64 : i64} : memref<2xi32>
    %19 = builtin.unrealized_conversion_cast %18 : memref<2xi32> to !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)>
    %20 = llvm.extractvalue %8[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %21 = llvm.extractvalue %17[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %22 = llvm.extractvalue %19[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.call @forward_kernel_0(%20, %21, %22) : (!llvm.ptr<i32>, !llvm.ptr<i32>, !llvm.ptr<i32>) -> ()
    %23 = llvm.extractvalue %19[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.return %23 : !llvm.ptr<i32>
  }
  llvm.func @forward_kernel_0(!llvm.ptr<i32>, !llvm.ptr<i32>, !llvm.ptr<i32>) attributes {Kernel, forward_kernel_0}
}


// -----// IR Dump After ConvertFuncToLLVM (convert-func-to-llvm) //----- //
module attributes {llvm.data_layout = "", torch.debug_module_name = "L"} {
  llvm.func @forward(%arg0: !llvm.ptr<i32>, %arg1: !llvm.ptr<i32>) -> !llvm.ptr<i32> {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %5 = llvm.mlir.constant(2 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %7 = llvm.mlir.constant(1 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %9 = llvm.mlir.undef : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)>
    %10 = llvm.insertvalue %arg1, %9[0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %11 = llvm.insertvalue %arg1, %10[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %12 = llvm.mlir.constant(0 : index) : i64
    %13 = llvm.insertvalue %12, %11[2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %14 = llvm.mlir.constant(2 : index) : i64
    %15 = llvm.insertvalue %14, %13[3, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %16 = llvm.mlir.constant(1 : index) : i64
    %17 = llvm.insertvalue %16, %15[4, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %18 = memref.alloc() {alignment = 64 : i64} : memref<2xi32>
    %19 = builtin.unrealized_conversion_cast %18 : memref<2xi32> to !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)>
    %20 = llvm.extractvalue %8[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %21 = llvm.extractvalue %17[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %22 = llvm.extractvalue %19[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.call @forward_kernel_0(%20, %21, %22) : (!llvm.ptr<i32>, !llvm.ptr<i32>, !llvm.ptr<i32>) -> ()
    %23 = llvm.extractvalue %19[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.return %23 : !llvm.ptr<i32>
  }
  llvm.func @forward_kernel_0(!llvm.ptr<i32>, !llvm.ptr<i32>, !llvm.ptr<i32>) attributes {Kernel, forward_kernel_0}
}


// -----// IR Dump After ConvertMemRefToLLVM (convert-memref-to-llvm) //----- //
module attributes {llvm.data_layout = "", torch.debug_module_name = "L"} {
  llvm.func @malloc(i64) -> !llvm.ptr<i8>
  llvm.func @forward(%arg0: !llvm.ptr<i32>, %arg1: !llvm.ptr<i32>) -> !llvm.ptr<i32> {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %5 = llvm.mlir.constant(2 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %7 = llvm.mlir.constant(1 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %9 = llvm.mlir.undef : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)>
    %10 = llvm.insertvalue %arg1, %9[0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %11 = llvm.insertvalue %arg1, %10[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %12 = llvm.mlir.constant(0 : index) : i64
    %13 = llvm.insertvalue %12, %11[2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %14 = llvm.mlir.constant(2 : index) : i64
    %15 = llvm.insertvalue %14, %13[3, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %16 = llvm.mlir.constant(1 : index) : i64
    %17 = llvm.insertvalue %16, %15[4, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %18 = llvm.mlir.constant(2 : index) : i64
    %19 = llvm.mlir.constant(1 : index) : i64
    %20 = llvm.mlir.null : !llvm.ptr<i32>
    %21 = llvm.getelementptr %20[%18] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    %22 = llvm.ptrtoint %21 : !llvm.ptr<i32> to i64
    %23 = llvm.mlir.constant(64 : index) : i64
    %24 = llvm.add %22, %23  : i64
    %25 = llvm.call @malloc(%24) : (i64) -> !llvm.ptr<i8>
    %26 = llvm.bitcast %25 : !llvm.ptr<i8> to !llvm.ptr<i32>
    %27 = llvm.ptrtoint %26 : !llvm.ptr<i32> to i64
    %28 = llvm.mlir.constant(1 : index) : i64
    %29 = llvm.sub %23, %28  : i64
    %30 = llvm.add %27, %29  : i64
    %31 = llvm.urem %30, %23  : i64
    %32 = llvm.sub %30, %31  : i64
    %33 = llvm.inttoptr %32 : i64 to !llvm.ptr<i32>
    %34 = llvm.mlir.undef : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)>
    %35 = llvm.insertvalue %26, %34[0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %36 = llvm.insertvalue %33, %35[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %37 = llvm.mlir.constant(0 : index) : i64
    %38 = llvm.insertvalue %37, %36[2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %39 = llvm.insertvalue %18, %38[3, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %40 = llvm.insertvalue %19, %39[4, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %41 = builtin.unrealized_conversion_cast %40 : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> to memref<2xi32>
    %42 = builtin.unrealized_conversion_cast %41 : memref<2xi32> to !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)>
    %43 = llvm.extractvalue %8[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %44 = llvm.extractvalue %17[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %45 = llvm.extractvalue %42[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.call @forward_kernel_0(%43, %44, %45) : (!llvm.ptr<i32>, !llvm.ptr<i32>, !llvm.ptr<i32>) -> ()
    %46 = llvm.extractvalue %42[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.return %46 : !llvm.ptr<i32>
  }
  llvm.func @forward_kernel_0(!llvm.ptr<i32>, !llvm.ptr<i32>, !llvm.ptr<i32>) attributes {Kernel, forward_kernel_0}
}


// -----// IR Dump After ReconcileUnrealizedCasts (reconcile-unrealized-casts) //----- //
module attributes {llvm.data_layout = "", torch.debug_module_name = "L"} {
  llvm.func @malloc(i64) -> !llvm.ptr<i8>
  llvm.func @forward(%arg0: !llvm.ptr<i32>, %arg1: !llvm.ptr<i32>) -> !llvm.ptr<i32> {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %5 = llvm.mlir.constant(2 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %7 = llvm.mlir.constant(1 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %9 = llvm.mlir.undef : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)>
    %10 = llvm.insertvalue %arg1, %9[0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %11 = llvm.insertvalue %arg1, %10[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %12 = llvm.mlir.constant(0 : index) : i64
    %13 = llvm.insertvalue %12, %11[2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %14 = llvm.mlir.constant(2 : index) : i64
    %15 = llvm.insertvalue %14, %13[3, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %16 = llvm.mlir.constant(1 : index) : i64
    %17 = llvm.insertvalue %16, %15[4, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %18 = llvm.mlir.constant(2 : index) : i64
    %19 = llvm.mlir.constant(1 : index) : i64
    %20 = llvm.mlir.null : !llvm.ptr<i32>
    %21 = llvm.getelementptr %20[2] : (!llvm.ptr<i32>) -> !llvm.ptr<i32>
    %22 = llvm.ptrtoint %21 : !llvm.ptr<i32> to i64
    %23 = llvm.mlir.constant(64 : index) : i64
    %24 = llvm.add %22, %23  : i64
    %25 = llvm.call @malloc(%24) : (i64) -> !llvm.ptr<i8>
    %26 = llvm.bitcast %25 : !llvm.ptr<i8> to !llvm.ptr<i32>
    %27 = llvm.ptrtoint %26 : !llvm.ptr<i32> to i64
    %28 = llvm.mlir.constant(1 : index) : i64
    %29 = llvm.sub %23, %28  : i64
    %30 = llvm.add %27, %29  : i64
    %31 = llvm.urem %30, %23  : i64
    %32 = llvm.sub %30, %31  : i64
    %33 = llvm.inttoptr %32 : i64 to !llvm.ptr<i32>
    %34 = llvm.mlir.undef : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)>
    %35 = llvm.insertvalue %26, %34[0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %36 = llvm.insertvalue %33, %35[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %37 = llvm.mlir.constant(0 : index) : i64
    %38 = llvm.insertvalue %37, %36[2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %39 = llvm.insertvalue %18, %38[3, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %40 = llvm.insertvalue %19, %39[4, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %41 = llvm.extractvalue %40[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.call @forward_kernel_0(%arg0, %arg1, %41) : (!llvm.ptr<i32>, !llvm.ptr<i32>, !llvm.ptr<i32>) -> ()
    %42 = llvm.extractvalue %40[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.return %42 : !llvm.ptr<i32>
  }
  llvm.func @forward_kernel_0(!llvm.ptr<i32>, !llvm.ptr<i32>, !llvm.ptr<i32>) attributes {Kernel, forward_kernel_0}
}


