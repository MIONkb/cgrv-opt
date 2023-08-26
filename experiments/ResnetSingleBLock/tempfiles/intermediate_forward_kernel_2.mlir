// -----// IR Dump After ArithExpandOps (arith-expand) //----- //
module {
  func.func @forward_kernel_2(%arg0: memref<1x64x112x112xf32>, %arg1: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_2} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    %cst = arith.constant 0.000000e+00 : f32
    affine.for %arg2 = 0 to 16 {
      affine.for %arg3 = 0 to 112 {
        %0 = affine.load %arg0[0, 0, %arg2, %arg3] : memref<1x64x112x112xf32>
        %1 = arith.cmpf ugt, %0, %cst : f32
        %2 = arith.select %1, %0, %cst : f32
        affine.store %2, %arg1[0, 0, %arg2, %arg3] : memref<1x64x112x112xf32>
      }
    }
    return
  }
}


// -----// IR Dump After ExpandOps (memref-expand) //----- //
module {
  func.func @forward_kernel_2(%arg0: memref<1x64x112x112xf32>, %arg1: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_2} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    %cst = arith.constant 0.000000e+00 : f32
    affine.for %arg2 = 0 to 16 {
      affine.for %arg3 = 0 to 112 {
        %0 = affine.load %arg0[0, 0, %arg2, %arg3] : memref<1x64x112x112xf32>
        %1 = arith.cmpf ugt, %0, %cst : f32
        %2 = arith.select %1, %0, %cst : f32
        affine.store %2, %arg1[0, 0, %arg2, %arg3] : memref<1x64x112x112xf32>
      }
    }
    return
  }
}


// -----// IR Dump After SimplifyAffineStructures (affine-simplify-structures) //----- //
func.func @forward_kernel_2(%arg0: memref<1x64x112x112xf32>, %arg1: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_2} {
  cf.br ^bb1
^bb1:  // pred: ^bb0
  %cst = arith.constant 0.000000e+00 : f32
  affine.for %arg2 = 0 to 16 {
    affine.for %arg3 = 0 to 112 {
      %0 = affine.load %arg0[0, 0, %arg2, %arg3] : memref<1x64x112x112xf32>
      %1 = arith.cmpf ugt, %0, %cst : f32
      %2 = arith.select %1, %0, %cst : f32
      affine.store %2, %arg1[0, 0, %arg2, %arg3] : memref<1x64x112x112xf32>
    }
  }
  return
}

// -----// IR Dump After ConvertAffineToStandard (lower-affine) //----- //
module {
  func.func @forward_kernel_2(%arg0: memref<1x64x112x112xf32>, %arg1: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_2} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %c16 = arith.constant 16 : index
    %c1 = arith.constant 1 : index
    scf.for %arg2 = %c0 to %c16 step %c1 {
      %c0_0 = arith.constant 0 : index
      %c112 = arith.constant 112 : index
      %c1_1 = arith.constant 1 : index
      scf.for %arg3 = %c0_0 to %c112 step %c1_1 {
        %c0_2 = arith.constant 0 : index
        %c0_3 = arith.constant 0 : index
        %0 = memref.load %arg0[%c0_2, %c0_3, %arg2, %arg3] : memref<1x64x112x112xf32>
        %1 = arith.cmpf ugt, %0, %cst : f32
        %2 = arith.select %1, %0, %cst : f32
        %c0_4 = arith.constant 0 : index
        %c0_5 = arith.constant 0 : index
        memref.store %2, %arg1[%c0_4, %c0_5, %arg2, %arg3] : memref<1x64x112x112xf32>
      }
    }
    return
  }
}


// -----// IR Dump After SCFForLoopCanonicalization (scf-for-loop-canonicalization) //----- //
module {
  func.func @forward_kernel_2(%arg0: memref<1x64x112x112xf32>, %arg1: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_2} {
    %c112 = arith.constant 112 : index
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    scf.for %arg2 = %c0 to %c16 step %c1 {
      scf.for %arg3 = %c0 to %c112 step %c1 {
        %0 = memref.load %arg0[%c0, %c0, %arg2, %arg3] : memref<1x64x112x112xf32>
        %1 = arith.cmpf ugt, %0, %cst : f32
        %2 = arith.select %1, %0, %cst : f32
        memref.store %2, %arg1[%c0, %c0, %arg2, %arg3] : memref<1x64x112x112xf32>
      }
    }
    return
  }
}


// -----// IR Dump After SCFToControlFlow (convert-scf-to-cf) //----- //
module {
  func.func @forward_kernel_2(%arg0: memref<1x64x112x112xf32>, %arg1: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_2} {
    %c112 = arith.constant 112 : index
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%c0 : index)
  ^bb2(%0: index):  // 2 preds: ^bb1, ^bb6
    %1 = arith.cmpi slt, %0, %c16 : index
    cf.cond_br %1, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    cf.br ^bb4(%c0 : index)
  ^bb4(%2: index):  // 2 preds: ^bb3, ^bb5
    %3 = arith.cmpi slt, %2, %c112 : index
    cf.cond_br %3, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %4 = memref.load %arg0[%c0, %c0, %0, %2] : memref<1x64x112x112xf32>
    %5 = arith.cmpf ugt, %4, %cst : f32
    %6 = arith.select %5, %4, %cst : f32
    memref.store %6, %arg1[%c0, %c0, %0, %2] : memref<1x64x112x112xf32>
    %7 = arith.addi %2, %c1 : index
    cf.br ^bb4(%7 : index)
  ^bb6:  // pred: ^bb4
    %8 = arith.addi %0, %c1 : index
    cf.br ^bb2(%8 : index)
  ^bb7:  // pred: ^bb2
    return
  }
}


// -----// IR Dump After FinalizeMemRefToLLVMConversionPass (finalize-memref-to-llvm) //----- //
module {
  func.func @forward_kernel_2(%arg0: memref<1x64x112x112xf32>, %arg1: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_2} {
    %0 = builtin.unrealized_conversion_cast %arg0 : memref<1x64x112x112xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %1 = builtin.unrealized_conversion_cast %arg1 : memref<1x64x112x112xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %c112 = arith.constant 112 : index
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c0 = arith.constant 0 : index
    %2 = builtin.unrealized_conversion_cast %c0 : index to i64
    %cst = arith.constant 0.000000e+00 : f32
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%c0 : index)
  ^bb2(%3: index):  // 2 preds: ^bb1, ^bb6
    %4 = builtin.unrealized_conversion_cast %3 : index to i64
    %5 = arith.cmpi slt, %3, %c16 : index
    cf.cond_br %5, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    cf.br ^bb4(%c0 : index)
  ^bb4(%6: index):  // 2 preds: ^bb3, ^bb5
    %7 = builtin.unrealized_conversion_cast %6 : index to i64
    %8 = arith.cmpi slt, %6, %c112 : index
    cf.cond_br %8, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %9 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %10 = llvm.mlir.constant(802816 : index) : i64
    %11 = llvm.mul %2, %10  : i64
    %12 = llvm.mlir.constant(12544 : index) : i64
    %13 = llvm.mul %2, %12  : i64
    %14 = llvm.add %11, %13  : i64
    %15 = llvm.mlir.constant(112 : index) : i64
    %16 = llvm.mul %4, %15  : i64
    %17 = llvm.add %14, %16  : i64
    %18 = llvm.add %17, %7  : i64
    %19 = llvm.getelementptr %9[%18] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %20 = llvm.load %19 : !llvm.ptr -> f32
    %21 = arith.cmpf ugt, %20, %cst : f32
    %22 = arith.select %21, %20, %cst : f32
    %23 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %24 = llvm.mlir.constant(802816 : index) : i64
    %25 = llvm.mul %2, %24  : i64
    %26 = llvm.mlir.constant(12544 : index) : i64
    %27 = llvm.mul %2, %26  : i64
    %28 = llvm.add %25, %27  : i64
    %29 = llvm.mlir.constant(112 : index) : i64
    %30 = llvm.mul %4, %29  : i64
    %31 = llvm.add %28, %30  : i64
    %32 = llvm.add %31, %7  : i64
    %33 = llvm.getelementptr %23[%32] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %22, %33 : f32, !llvm.ptr
    %34 = arith.addi %6, %c1 : index
    cf.br ^bb4(%34 : index)
  ^bb6:  // pred: ^bb4
    %35 = arith.addi %3, %c1 : index
    cf.br ^bb2(%35 : index)
  ^bb7:  // pred: ^bb2
    return
  }
}


// -----// IR Dump After ConvertMathToLLVMPass (convert-math-to-llvm) //----- //
module {
  func.func @forward_kernel_2(%arg0: memref<1x64x112x112xf32>, %arg1: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_2} {
    %0 = builtin.unrealized_conversion_cast %arg0 : memref<1x64x112x112xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %1 = builtin.unrealized_conversion_cast %arg1 : memref<1x64x112x112xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %c112 = arith.constant 112 : index
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c0 = arith.constant 0 : index
    %2 = builtin.unrealized_conversion_cast %c0 : index to i64
    %cst = arith.constant 0.000000e+00 : f32
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%c0 : index)
  ^bb2(%3: index):  // 2 preds: ^bb1, ^bb6
    %4 = builtin.unrealized_conversion_cast %3 : index to i64
    %5 = arith.cmpi slt, %3, %c16 : index
    cf.cond_br %5, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    cf.br ^bb4(%c0 : index)
  ^bb4(%6: index):  // 2 preds: ^bb3, ^bb5
    %7 = builtin.unrealized_conversion_cast %6 : index to i64
    %8 = arith.cmpi slt, %6, %c112 : index
    cf.cond_br %8, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %9 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %10 = llvm.mlir.constant(802816 : index) : i64
    %11 = llvm.mul %2, %10  : i64
    %12 = llvm.mlir.constant(12544 : index) : i64
    %13 = llvm.mul %2, %12  : i64
    %14 = llvm.add %11, %13  : i64
    %15 = llvm.mlir.constant(112 : index) : i64
    %16 = llvm.mul %4, %15  : i64
    %17 = llvm.add %14, %16  : i64
    %18 = llvm.add %17, %7  : i64
    %19 = llvm.getelementptr %9[%18] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %20 = llvm.load %19 : !llvm.ptr -> f32
    %21 = arith.cmpf ugt, %20, %cst : f32
    %22 = arith.select %21, %20, %cst : f32
    %23 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %24 = llvm.mlir.constant(802816 : index) : i64
    %25 = llvm.mul %2, %24  : i64
    %26 = llvm.mlir.constant(12544 : index) : i64
    %27 = llvm.mul %2, %26  : i64
    %28 = llvm.add %25, %27  : i64
    %29 = llvm.mlir.constant(112 : index) : i64
    %30 = llvm.mul %4, %29  : i64
    %31 = llvm.add %28, %30  : i64
    %32 = llvm.add %31, %7  : i64
    %33 = llvm.getelementptr %23[%32] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %22, %33 : f32, !llvm.ptr
    %34 = arith.addi %6, %c1 : index
    cf.br ^bb4(%34 : index)
  ^bb6:  // pred: ^bb4
    %35 = arith.addi %3, %c1 : index
    cf.br ^bb2(%35 : index)
  ^bb7:  // pred: ^bb2
    return
  }
}


// -----// IR Dump After ConvertMathToLibm (convert-math-to-libm) //----- //
module {
  func.func @forward_kernel_2(%arg0: memref<1x64x112x112xf32>, %arg1: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_2} {
    %0 = builtin.unrealized_conversion_cast %arg0 : memref<1x64x112x112xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %1 = builtin.unrealized_conversion_cast %arg1 : memref<1x64x112x112xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %c112 = arith.constant 112 : index
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c0 = arith.constant 0 : index
    %2 = builtin.unrealized_conversion_cast %c0 : index to i64
    %cst = arith.constant 0.000000e+00 : f32
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%c0 : index)
  ^bb2(%3: index):  // 2 preds: ^bb1, ^bb6
    %4 = builtin.unrealized_conversion_cast %3 : index to i64
    %5 = arith.cmpi slt, %3, %c16 : index
    cf.cond_br %5, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    cf.br ^bb4(%c0 : index)
  ^bb4(%6: index):  // 2 preds: ^bb3, ^bb5
    %7 = builtin.unrealized_conversion_cast %6 : index to i64
    %8 = arith.cmpi slt, %6, %c112 : index
    cf.cond_br %8, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %9 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %10 = llvm.mlir.constant(802816 : index) : i64
    %11 = llvm.mul %2, %10  : i64
    %12 = llvm.mlir.constant(12544 : index) : i64
    %13 = llvm.mul %2, %12  : i64
    %14 = llvm.add %11, %13  : i64
    %15 = llvm.mlir.constant(112 : index) : i64
    %16 = llvm.mul %4, %15  : i64
    %17 = llvm.add %14, %16  : i64
    %18 = llvm.add %17, %7  : i64
    %19 = llvm.getelementptr %9[%18] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %20 = llvm.load %19 : !llvm.ptr -> f32
    %21 = arith.cmpf ugt, %20, %cst : f32
    %22 = arith.select %21, %20, %cst : f32
    %23 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %24 = llvm.mlir.constant(802816 : index) : i64
    %25 = llvm.mul %2, %24  : i64
    %26 = llvm.mlir.constant(12544 : index) : i64
    %27 = llvm.mul %2, %26  : i64
    %28 = llvm.add %25, %27  : i64
    %29 = llvm.mlir.constant(112 : index) : i64
    %30 = llvm.mul %4, %29  : i64
    %31 = llvm.add %28, %30  : i64
    %32 = llvm.add %31, %7  : i64
    %33 = llvm.getelementptr %23[%32] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %22, %33 : f32, !llvm.ptr
    %34 = arith.addi %6, %c1 : index
    cf.br ^bb4(%34 : index)
  ^bb6:  // pred: ^bb4
    %35 = arith.addi %3, %c1 : index
    cf.br ^bb2(%35 : index)
  ^bb7:  // pred: ^bb2
    return
  }
}


// -----// IR Dump After ArithToLLVMConversionPass (convert-arith-to-llvm) //----- //
module {
  func.func @forward_kernel_2(%arg0: memref<1x64x112x112xf32>, %arg1: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_2} {
    %0 = builtin.unrealized_conversion_cast %arg0 : memref<1x64x112x112xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %1 = builtin.unrealized_conversion_cast %arg1 : memref<1x64x112x112xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %2 = llvm.mlir.constant(112 : index) : i64
    %3 = llvm.mlir.constant(1 : index) : i64
    %4 = llvm.mlir.constant(16 : index) : i64
    %5 = llvm.mlir.constant(0 : index) : i64
    %6 = builtin.unrealized_conversion_cast %5 : i64 to index
    %7 = builtin.unrealized_conversion_cast %6 : index to i64
    %8 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%6 : index)
  ^bb2(%9: index):  // 2 preds: ^bb1, ^bb6
    %10 = builtin.unrealized_conversion_cast %9 : index to i64
    %11 = builtin.unrealized_conversion_cast %9 : index to i64
    %12 = llvm.icmp "slt" %10, %4 : i64
    cf.cond_br %12, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    cf.br ^bb4(%6 : index)
  ^bb4(%13: index):  // 2 preds: ^bb3, ^bb5
    %14 = builtin.unrealized_conversion_cast %13 : index to i64
    %15 = builtin.unrealized_conversion_cast %13 : index to i64
    %16 = llvm.icmp "slt" %14, %2 : i64
    cf.cond_br %16, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %17 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %18 = llvm.mlir.constant(802816 : index) : i64
    %19 = llvm.mul %7, %18  : i64
    %20 = llvm.mlir.constant(12544 : index) : i64
    %21 = llvm.mul %7, %20  : i64
    %22 = llvm.add %19, %21  : i64
    %23 = llvm.mlir.constant(112 : index) : i64
    %24 = llvm.mul %11, %23  : i64
    %25 = llvm.add %22, %24  : i64
    %26 = llvm.add %25, %15  : i64
    %27 = llvm.getelementptr %17[%26] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %28 = llvm.load %27 : !llvm.ptr -> f32
    %29 = llvm.fcmp "ugt" %28, %8 : f32
    %30 = llvm.select %29, %28, %8 : i1, f32
    %31 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %32 = llvm.mlir.constant(802816 : index) : i64
    %33 = llvm.mul %7, %32  : i64
    %34 = llvm.mlir.constant(12544 : index) : i64
    %35 = llvm.mul %7, %34  : i64
    %36 = llvm.add %33, %35  : i64
    %37 = llvm.mlir.constant(112 : index) : i64
    %38 = llvm.mul %11, %37  : i64
    %39 = llvm.add %36, %38  : i64
    %40 = llvm.add %39, %15  : i64
    %41 = llvm.getelementptr %31[%40] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %30, %41 : f32, !llvm.ptr
    %42 = llvm.add %14, %3  : i64
    %43 = builtin.unrealized_conversion_cast %42 : i64 to index
    cf.br ^bb4(%43 : index)
  ^bb6:  // pred: ^bb4
    %44 = llvm.add %10, %3  : i64
    %45 = builtin.unrealized_conversion_cast %44 : i64 to index
    cf.br ^bb2(%45 : index)
  ^bb7:  // pred: ^bb2
    return
  }
}


// -----// IR Dump After ConvertFuncToLLVMPass (convert-func-to-llvm) //----- //
module attributes {llvm.data_layout = ""} {
  llvm.func @forward_kernel_2(%arg0: !llvm.ptr, %arg1: !llvm.ptr) attributes {Kernel, forward_kernel_2} {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %5 = llvm.mlir.constant(1 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %7 = llvm.mlir.constant(802816 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %9 = llvm.mlir.constant(64 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %11 = llvm.mlir.constant(12544 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %13 = llvm.mlir.constant(112 : index) : i64
    %14 = llvm.insertvalue %13, %12[3, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %15 = llvm.mlir.constant(112 : index) : i64
    %16 = llvm.insertvalue %15, %14[4, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %17 = llvm.mlir.constant(112 : index) : i64
    %18 = llvm.insertvalue %17, %16[3, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %19 = llvm.mlir.constant(1 : index) : i64
    %20 = llvm.insertvalue %19, %18[4, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %21 = builtin.unrealized_conversion_cast %20 : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> to memref<1x64x112x112xf32>
    %22 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %23 = llvm.insertvalue %arg1, %22[0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %24 = llvm.insertvalue %arg1, %23[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %25 = llvm.mlir.constant(0 : index) : i64
    %26 = llvm.insertvalue %25, %24[2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %27 = llvm.mlir.constant(1 : index) : i64
    %28 = llvm.insertvalue %27, %26[3, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %29 = llvm.mlir.constant(802816 : index) : i64
    %30 = llvm.insertvalue %29, %28[4, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %31 = llvm.mlir.constant(64 : index) : i64
    %32 = llvm.insertvalue %31, %30[3, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %33 = llvm.mlir.constant(12544 : index) : i64
    %34 = llvm.insertvalue %33, %32[4, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %35 = llvm.mlir.constant(112 : index) : i64
    %36 = llvm.insertvalue %35, %34[3, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %37 = llvm.mlir.constant(112 : index) : i64
    %38 = llvm.insertvalue %37, %36[4, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %39 = llvm.mlir.constant(112 : index) : i64
    %40 = llvm.insertvalue %39, %38[3, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %41 = llvm.mlir.constant(1 : index) : i64
    %42 = llvm.insertvalue %41, %40[4, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %43 = builtin.unrealized_conversion_cast %42 : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> to memref<1x64x112x112xf32>
    %44 = builtin.unrealized_conversion_cast %21 : memref<1x64x112x112xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %45 = builtin.unrealized_conversion_cast %43 : memref<1x64x112x112xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %46 = llvm.mlir.constant(112 : index) : i64
    %47 = llvm.mlir.constant(1 : index) : i64
    %48 = llvm.mlir.constant(16 : index) : i64
    %49 = llvm.mlir.constant(0 : index) : i64
    %50 = builtin.unrealized_conversion_cast %49 : i64 to index
    %51 = builtin.unrealized_conversion_cast %50 : index to i64
    %52 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%49 : i64)
  ^bb2(%53: i64):  // 2 preds: ^bb1, ^bb6
    %54 = builtin.unrealized_conversion_cast %53 : i64 to index
    %55 = builtin.unrealized_conversion_cast %54 : index to i64
    %56 = builtin.unrealized_conversion_cast %54 : index to i64
    %57 = llvm.icmp "slt" %55, %48 : i64
    llvm.cond_br %57, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%49 : i64)
  ^bb4(%58: i64):  // 2 preds: ^bb3, ^bb5
    %59 = builtin.unrealized_conversion_cast %58 : i64 to index
    %60 = builtin.unrealized_conversion_cast %59 : index to i64
    %61 = builtin.unrealized_conversion_cast %59 : index to i64
    %62 = llvm.icmp "slt" %60, %46 : i64
    llvm.cond_br %62, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %63 = llvm.extractvalue %44[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %64 = llvm.mlir.constant(802816 : index) : i64
    %65 = llvm.mul %51, %64  : i64
    %66 = llvm.mlir.constant(12544 : index) : i64
    %67 = llvm.mul %51, %66  : i64
    %68 = llvm.add %65, %67  : i64
    %69 = llvm.mlir.constant(112 : index) : i64
    %70 = llvm.mul %56, %69  : i64
    %71 = llvm.add %68, %70  : i64
    %72 = llvm.add %71, %61  : i64
    %73 = llvm.getelementptr %63[%72] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %74 = llvm.load %73 : !llvm.ptr -> f32
    %75 = llvm.fcmp "ugt" %74, %52 : f32
    %76 = llvm.select %75, %74, %52 : i1, f32
    %77 = llvm.extractvalue %45[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %78 = llvm.mlir.constant(802816 : index) : i64
    %79 = llvm.mul %51, %78  : i64
    %80 = llvm.mlir.constant(12544 : index) : i64
    %81 = llvm.mul %51, %80  : i64
    %82 = llvm.add %79, %81  : i64
    %83 = llvm.mlir.constant(112 : index) : i64
    %84 = llvm.mul %56, %83  : i64
    %85 = llvm.add %82, %84  : i64
    %86 = llvm.add %85, %61  : i64
    %87 = llvm.getelementptr %77[%86] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %76, %87 : f32, !llvm.ptr
    %88 = llvm.add %60, %47  : i64
    %89 = builtin.unrealized_conversion_cast %88 : i64 to index
    llvm.br ^bb4(%88 : i64)
  ^bb6:  // pred: ^bb4
    %90 = llvm.add %55, %47  : i64
    %91 = builtin.unrealized_conversion_cast %90 : i64 to index
    llvm.br ^bb2(%90 : i64)
  ^bb7:  // pred: ^bb2
    llvm.return
  }
}


// -----// IR Dump After ReconcileUnrealizedCasts (reconcile-unrealized-casts) //----- //
module attributes {llvm.data_layout = ""} {
  llvm.func @forward_kernel_2(%arg0: !llvm.ptr, %arg1: !llvm.ptr) attributes {Kernel, forward_kernel_2} {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %5 = llvm.mlir.constant(1 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %7 = llvm.mlir.constant(802816 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %9 = llvm.mlir.constant(64 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %11 = llvm.mlir.constant(12544 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %13 = llvm.mlir.constant(112 : index) : i64
    %14 = llvm.insertvalue %13, %12[3, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %15 = llvm.mlir.constant(112 : index) : i64
    %16 = llvm.insertvalue %15, %14[4, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %17 = llvm.mlir.constant(112 : index) : i64
    %18 = llvm.insertvalue %17, %16[3, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %19 = llvm.mlir.constant(1 : index) : i64
    %20 = llvm.insertvalue %19, %18[4, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %21 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %22 = llvm.insertvalue %arg1, %21[0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %23 = llvm.insertvalue %arg1, %22[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %24 = llvm.mlir.constant(0 : index) : i64
    %25 = llvm.insertvalue %24, %23[2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %26 = llvm.mlir.constant(1 : index) : i64
    %27 = llvm.insertvalue %26, %25[3, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %28 = llvm.mlir.constant(802816 : index) : i64
    %29 = llvm.insertvalue %28, %27[4, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %30 = llvm.mlir.constant(64 : index) : i64
    %31 = llvm.insertvalue %30, %29[3, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %32 = llvm.mlir.constant(12544 : index) : i64
    %33 = llvm.insertvalue %32, %31[4, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %34 = llvm.mlir.constant(112 : index) : i64
    %35 = llvm.insertvalue %34, %33[3, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %36 = llvm.mlir.constant(112 : index) : i64
    %37 = llvm.insertvalue %36, %35[4, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %38 = llvm.mlir.constant(112 : index) : i64
    %39 = llvm.insertvalue %38, %37[3, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %40 = llvm.mlir.constant(1 : index) : i64
    %41 = llvm.insertvalue %40, %39[4, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %42 = llvm.mlir.constant(112 : index) : i64
    %43 = llvm.mlir.constant(1 : index) : i64
    %44 = llvm.mlir.constant(16 : index) : i64
    %45 = llvm.mlir.constant(0 : index) : i64
    %46 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%45 : i64)
  ^bb2(%47: i64):  // 2 preds: ^bb1, ^bb6
    %48 = llvm.icmp "slt" %47, %44 : i64
    llvm.cond_br %48, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%45 : i64)
  ^bb4(%49: i64):  // 2 preds: ^bb3, ^bb5
    %50 = llvm.icmp "slt" %49, %42 : i64
    llvm.cond_br %50, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %51 = llvm.extractvalue %20[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %52 = llvm.mlir.constant(802816 : index) : i64
    %53 = llvm.mul %45, %52  : i64
    %54 = llvm.mlir.constant(12544 : index) : i64
    %55 = llvm.mul %45, %54  : i64
    %56 = llvm.add %53, %55  : i64
    %57 = llvm.mlir.constant(112 : index) : i64
    %58 = llvm.mul %47, %57  : i64
    %59 = llvm.add %56, %58  : i64
    %60 = llvm.add %59, %49  : i64
    %61 = llvm.getelementptr %51[%60] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %62 = llvm.load %61 : !llvm.ptr -> f32
    %63 = llvm.fcmp "ugt" %62, %46 : f32
    %64 = llvm.select %63, %62, %46 : i1, f32
    %65 = llvm.extractvalue %41[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %66 = llvm.mlir.constant(802816 : index) : i64
    %67 = llvm.mul %45, %66  : i64
    %68 = llvm.mlir.constant(12544 : index) : i64
    %69 = llvm.mul %45, %68  : i64
    %70 = llvm.add %67, %69  : i64
    %71 = llvm.mlir.constant(112 : index) : i64
    %72 = llvm.mul %47, %71  : i64
    %73 = llvm.add %70, %72  : i64
    %74 = llvm.add %73, %49  : i64
    %75 = llvm.getelementptr %65[%74] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %64, %75 : f32, !llvm.ptr
    %76 = llvm.add %49, %43  : i64
    llvm.br ^bb4(%76 : i64)
  ^bb6:  // pred: ^bb4
    %77 = llvm.add %47, %43  : i64
    llvm.br ^bb2(%77 : i64)
  ^bb7:  // pred: ^bb2
    llvm.return
  }
}


// -----// IR Dump After Canonicalizer (canonicalize) //----- //
module attributes {llvm.data_layout = ""} {
  llvm.func @forward_kernel_2(%arg0: !llvm.ptr, %arg1: !llvm.ptr) attributes {Kernel, forward_kernel_2} {
    %0 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    %1 = llvm.mlir.constant(16 : index) : i64
    %2 = llvm.mlir.constant(112 : index) : i64
    %3 = llvm.mlir.constant(12544 : index) : i64
    %4 = llvm.mlir.constant(802816 : index) : i64
    %5 = llvm.mlir.constant(1 : index) : i64
    %6 = llvm.mlir.constant(0 : index) : i64
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%6 : i64)
  ^bb2(%7: i64):  // 2 preds: ^bb1, ^bb6
    %8 = llvm.icmp "slt" %7, %1 : i64
    llvm.cond_br %8, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%6 : i64)
  ^bb4(%9: i64):  // 2 preds: ^bb3, ^bb5
    %10 = llvm.icmp "slt" %9, %2 : i64
    llvm.cond_br %10, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %11 = llvm.mul %6, %4  : i64
    %12 = llvm.mul %6, %3  : i64
    %13 = llvm.add %11, %12  : i64
    %14 = llvm.mul %7, %2  : i64
    %15 = llvm.add %13, %14  : i64
    %16 = llvm.add %15, %9  : i64
    %17 = llvm.getelementptr %arg0[%16] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %18 = llvm.load %17 : !llvm.ptr -> f32
    %19 = llvm.fcmp "ugt" %18, %0 : f32
    %20 = llvm.select %19, %18, %0 : i1, f32
    %21 = llvm.mul %6, %4  : i64
    %22 = llvm.mul %6, %3  : i64
    %23 = llvm.add %21, %22  : i64
    %24 = llvm.mul %7, %2  : i64
    %25 = llvm.add %23, %24  : i64
    %26 = llvm.add %25, %9  : i64
    %27 = llvm.getelementptr %arg1[%26] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %20, %27 : f32, !llvm.ptr
    %28 = llvm.add %9, %5  : i64
    llvm.br ^bb4(%28 : i64)
  ^bb6:  // pred: ^bb4
    %29 = llvm.add %7, %5  : i64
    llvm.br ^bb2(%29 : i64)
  ^bb7:  // pred: ^bb2
    llvm.return
  }
}


