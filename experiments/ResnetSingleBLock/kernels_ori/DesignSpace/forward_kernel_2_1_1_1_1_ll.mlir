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

