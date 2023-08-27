module attributes {llvm.data_layout = ""} {
  llvm.func @forward_kernel_1(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr, %arg3: !llvm.ptr, %arg4: !llvm.ptr, %arg5: !llvm.ptr) attributes {Kernel, forward_kernel_1} {
    %0 = llvm.mlir.constant(1.000000e-05 : f64) : f64
    %1 = llvm.mlir.constant(16 : index) : i64
    %2 = llvm.mlir.constant(5.000000e-01 : f32) : f32
    %3 = llvm.mlir.constant(1 : i32) : i32
    %4 = llvm.mlir.constant(1597463007 : i32) : i32
    %5 = llvm.mlir.constant(1.500000e+00 : f32) : f32
    %6 = llvm.mlir.constant(112 : index) : i64
    %7 = llvm.mlir.constant(12544 : index) : i64
    %8 = llvm.mlir.constant(802816 : index) : i64
    %9 = llvm.mlir.constant(1 : index) : i64
    %10 = llvm.mlir.constant(0 : index) : i64
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%10 : i64)
  ^bb2(%11: i64):  // 2 preds: ^bb1, ^bb6
    %12 = llvm.icmp "slt" %11, %1 : i64
    llvm.cond_br %12, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    %13 = llvm.load %arg0 : !llvm.ptr -> f32
    %14 = llvm.load %arg1 : !llvm.ptr -> f32
    %15 = llvm.load %arg2 : !llvm.ptr -> f32
    %16 = llvm.load %arg3 : !llvm.ptr -> f32
    llvm.br ^bb4(%10 : i64)
  ^bb4(%17: i64):  // 2 preds: ^bb3, ^bb5
    %18 = llvm.icmp "slt" %17, %6 : i64
    llvm.cond_br %18, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %19 = llvm.mul %10, %8  : i64
    %20 = llvm.mul %10, %7  : i64
    %21 = llvm.add %19, %20  : i64
    %22 = llvm.mul %11, %6  : i64
    %23 = llvm.add %21, %22  : i64
    %24 = llvm.add %23, %17  : i64
    %25 = llvm.getelementptr %arg4[%24] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %26 = llvm.load %25 : !llvm.ptr -> f32
    %27 = llvm.fptrunc %0 : f64 to f32
    %28 = llvm.fadd %16, %27  : f32
    %29 = llvm.fmul %28, %2  : f32
    %30 = llvm.bitcast %28 : f32 to i32
    %31 = llvm.lshr %30, %3  : i32
    %32 = llvm.sub %4, %31  : i32
    %33 = llvm.bitcast %32 : i32 to f32
    %34 = llvm.fmul %33, %33  : f32
    %35 = llvm.fmul %34, %29  : f32
    %36 = llvm.fsub %5, %35  : f32
    %37 = llvm.fmul %36, %34  : f32
    %38 = llvm.fsub %26, %15  : f32
    %39 = llvm.fmul %38, %37  : f32
    %40 = llvm.fmul %39, %13  : f32
    %41 = llvm.fadd %40, %14  : f32
    %42 = llvm.mul %10, %8  : i64
    %43 = llvm.mul %10, %7  : i64
    %44 = llvm.add %42, %43  : i64
    %45 = llvm.mul %11, %6  : i64
    %46 = llvm.add %44, %45  : i64
    %47 = llvm.add %46, %17  : i64
    %48 = llvm.getelementptr %arg5[%47] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %41, %48 : f32, !llvm.ptr
    %49 = llvm.add %17, %9  : i64
    llvm.br ^bb4(%49 : i64)
  ^bb6:  // pred: ^bb4
    %50 = llvm.add %11, %9  : i64
    llvm.br ^bb2(%50 : i64)
  ^bb7:  // pred: ^bb2
    llvm.return
  }
}

