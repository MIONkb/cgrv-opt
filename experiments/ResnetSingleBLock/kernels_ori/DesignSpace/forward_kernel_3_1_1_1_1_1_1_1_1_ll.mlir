module attributes {llvm.data_layout = ""} {
  llvm.func @forward_kernel_3(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr) attributes {Kernel, forward_kernel_3} {
    %0 = llvm.mlir.constant(4 : index) : i64
    %1 = llvm.mlir.constant(3 : index) : i64
    %2 = llvm.mlir.constant(2 : index) : i64
    %3 = llvm.mlir.constant(114 : index) : i64
    %4 = llvm.mlir.constant(12996 : index) : i64
    %5 = llvm.mlir.constant(831744 : index) : i64
    %6 = llvm.mlir.constant(56 : index) : i64
    %7 = llvm.mlir.constant(3136 : index) : i64
    %8 = llvm.mlir.constant(200704 : index) : i64
    %9 = llvm.mlir.constant(1 : index) : i64
    %10 = llvm.mlir.constant(0 : index) : i64
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%10 : i64)
  ^bb2(%11: i64):  // 2 preds: ^bb1, ^bb12
    %12 = llvm.icmp "slt" %11, %0 : i64
    llvm.cond_br %12, ^bb3, ^bb13
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%10 : i64)
  ^bb4(%13: i64):  // 2 preds: ^bb3, ^bb11
    %14 = llvm.icmp "slt" %13, %6 : i64
    llvm.cond_br %14, ^bb5, ^bb12
  ^bb5:  // pred: ^bb4
    %15 = llvm.mul %10, %8  : i64
    %16 = llvm.mul %10, %7  : i64
    %17 = llvm.add %15, %16  : i64
    %18 = llvm.mul %11, %6  : i64
    %19 = llvm.add %17, %18  : i64
    %20 = llvm.add %19, %13  : i64
    %21 = llvm.getelementptr %arg0[%20] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %22 = llvm.load %21 : !llvm.ptr -> f32
    llvm.br ^bb6(%10, %22 : i64, f32)
  ^bb6(%23: i64, %24: f32):  // 2 preds: ^bb5, ^bb10
    %25 = llvm.icmp "slt" %23, %1 : i64
    llvm.cond_br %25, ^bb7, ^bb11
  ^bb7:  // pred: ^bb6
    llvm.br ^bb8(%10, %24 : i64, f32)
  ^bb8(%26: i64, %27: f32):  // 2 preds: ^bb7, ^bb9
    %28 = llvm.icmp "slt" %26, %1 : i64
    llvm.cond_br %28, ^bb9, ^bb10
  ^bb9:  // pred: ^bb8
    %29 = llvm.mul %11, %2  : i64
    %30 = llvm.add %29, %23  : i64
    %31 = llvm.mul %13, %2  : i64
    %32 = llvm.add %31, %26  : i64
    %33 = llvm.mul %10, %5  : i64
    %34 = llvm.mul %10, %4  : i64
    %35 = llvm.add %33, %34  : i64
    %36 = llvm.mul %30, %3  : i64
    %37 = llvm.add %35, %36  : i64
    %38 = llvm.add %37, %32  : i64
    %39 = llvm.getelementptr %arg1[%38] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %40 = llvm.load %39 : !llvm.ptr -> f32
    %41 = llvm.fcmp "ugt" %27, %40 : f32
    %42 = llvm.select %41, %27, %40 : i1, f32
    %43 = llvm.add %26, %9  : i64
    llvm.br ^bb8(%43, %42 : i64, f32)
  ^bb10:  // pred: ^bb8
    %44 = llvm.add %23, %9  : i64
    llvm.br ^bb6(%44, %27 : i64, f32)
  ^bb11:  // pred: ^bb6
    %45 = llvm.mul %10, %8  : i64
    %46 = llvm.mul %10, %7  : i64
    %47 = llvm.add %45, %46  : i64
    %48 = llvm.mul %11, %6  : i64
    %49 = llvm.add %47, %48  : i64
    %50 = llvm.add %49, %13  : i64
    %51 = llvm.getelementptr %arg2[%50] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %24, %51 : f32, !llvm.ptr
    %52 = llvm.add %13, %9  : i64
    llvm.br ^bb4(%52 : i64)
  ^bb12:  // pred: ^bb4
    %53 = llvm.add %11, %9  : i64
    llvm.br ^bb2(%53 : i64)
  ^bb13:  // pred: ^bb2
    llvm.return
  }
}

