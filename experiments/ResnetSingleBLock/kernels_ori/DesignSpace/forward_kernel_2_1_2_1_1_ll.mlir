module attributes {llvm.data_layout = ""} {
  llvm.func @forward_kernel_2(%arg0: !llvm.ptr, %arg1: !llvm.ptr) attributes {Kernel, forward_kernel_2} {
    %0 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    %1 = llvm.mlir.constant(16 : index) : i64
    %2 = llvm.mlir.constant(2 : index) : i64
    %3 = llvm.mlir.constant(112 : index) : i64
    %4 = llvm.mlir.constant(12544 : index) : i64
    %5 = llvm.mlir.constant(802816 : index) : i64
    %6 = llvm.mlir.constant(1 : index) : i64
    %7 = llvm.mlir.constant(0 : index) : i64
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%7 : i64)
  ^bb2(%8: i64):  // 2 preds: ^bb1, ^bb6
    %9 = llvm.icmp "slt" %8, %1 : i64
    llvm.cond_br %9, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%7 : i64)
  ^bb4(%10: i64):  // 2 preds: ^bb3, ^bb5
    %11 = llvm.icmp "slt" %10, %3 : i64
    llvm.cond_br %11, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %12 = llvm.mul %7, %5  : i64
    %13 = llvm.mul %7, %4  : i64
    %14 = llvm.add %12, %13  : i64
    %15 = llvm.mul %8, %3  : i64
    %16 = llvm.add %14, %15  : i64
    %17 = llvm.add %16, %10  : i64
    %18 = llvm.getelementptr %arg0[%17] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %19 = llvm.load %18 : !llvm.ptr -> f32
    %20 = llvm.fcmp "ugt" %19, %0 : f32
    %21 = llvm.select %20, %19, %0 : i1, f32
    %22 = llvm.mul %7, %5  : i64
    %23 = llvm.mul %7, %4  : i64
    %24 = llvm.add %22, %23  : i64
    %25 = llvm.mul %8, %3  : i64
    %26 = llvm.add %24, %25  : i64
    %27 = llvm.add %26, %10  : i64
    %28 = llvm.getelementptr %arg1[%27] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %21, %28 : f32, !llvm.ptr
    %29 = llvm.add %10, %6  : i64
    %30 = llvm.mul %7, %5  : i64
    %31 = llvm.mul %7, %4  : i64
    %32 = llvm.add %30, %31  : i64
    %33 = llvm.mul %8, %3  : i64
    %34 = llvm.add %32, %33  : i64
    %35 = llvm.add %34, %29  : i64
    %36 = llvm.getelementptr %arg0[%35] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %37 = llvm.load %36 : !llvm.ptr -> f32
    %38 = llvm.fcmp "ugt" %37, %0 : f32
    %39 = llvm.select %38, %37, %0 : i1, f32
    %40 = llvm.mul %7, %5  : i64
    %41 = llvm.mul %7, %4  : i64
    %42 = llvm.add %40, %41  : i64
    %43 = llvm.mul %8, %3  : i64
    %44 = llvm.add %42, %43  : i64
    %45 = llvm.add %44, %29  : i64
    %46 = llvm.getelementptr %arg1[%45] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %39, %46 : f32, !llvm.ptr
    %47 = llvm.add %10, %2  : i64
    llvm.br ^bb4(%47 : i64)
  ^bb6:  // pred: ^bb4
    %48 = llvm.add %8, %6  : i64
    llvm.br ^bb2(%48 : i64)
  ^bb7:  // pred: ^bb2
    llvm.return
  }
}

