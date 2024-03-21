module attributes {llvm.data_layout = ""} {
  llvm.func @forward_kernel_0(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr) attributes {Kernel, forward_kernel_0} {
    %0 = llvm.mlir.constant(1 : index) : i64
    %1 = llvm.mlir.constant(5 : index) : i64
    %2 = llvm.mlir.constant(3 : index) : i64
    %3 = llvm.mlir.constant(0 : index) : i64
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%3 : i64)
  ^bb2(%4: i64):  // 2 preds: ^bb1, ^bb6
    %5 = llvm.icmp "slt" %4, %2 : i64
    llvm.cond_br %5, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%3 : i64)
  ^bb4(%6: i64):  // 2 preds: ^bb3, ^bb5
    %7 = llvm.icmp "slt" %6, %1 : i64
    llvm.cond_br %7, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %8 = llvm.mul %4, %1  : i64
    %9 = llvm.add %8, %6  : i64
    %10 = llvm.getelementptr %arg0[%9] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %11 = llvm.load %10 : !llvm.ptr -> f32
    %12 = llvm.mul %4, %1  : i64
    %13 = llvm.add %12, %6  : i64
    %14 = llvm.getelementptr %arg1[%13] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %15 = llvm.load %14 : !llvm.ptr -> f32
    %16 = llvm.fadd %11, %15  : f32
    %17 = llvm.mul %4, %1  : i64
    %18 = llvm.add %17, %6  : i64
    %19 = llvm.getelementptr %arg2[%18] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %16, %19 : f32, !llvm.ptr
    %20 = llvm.add %6, %0  : i64
    llvm.br ^bb4(%20 : i64)
  ^bb6:  // pred: ^bb4
    %21 = llvm.add %4, %0  : i64
    llvm.br ^bb2(%21 : i64)
  ^bb7:  // pred: ^bb2
    llvm.return
  }
}

