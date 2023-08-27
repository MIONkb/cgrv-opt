module attributes {llvm.data_layout = ""} {
  llvm.func @forward_kernel_2(%arg0: !llvm.ptr, %arg1: !llvm.ptr) attributes {Kernel, forward_kernel_2} {
    %0 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    %1 = llvm.mlir.constant(16 : index) : i64
    %2 = llvm.mlir.constant(4 : index) : i64
    %3 = llvm.mlir.constant(2 : index) : i64
    %4 = llvm.mlir.constant(3 : index) : i64
    %5 = llvm.mlir.constant(112 : index) : i64
    %6 = llvm.mlir.constant(12544 : index) : i64
    %7 = llvm.mlir.constant(802816 : index) : i64
    %8 = llvm.mlir.constant(1 : index) : i64
    %9 = llvm.mlir.constant(0 : index) : i64
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%9 : i64)
  ^bb2(%10: i64):  // 2 preds: ^bb1, ^bb6
    %11 = llvm.icmp "slt" %10, %1 : i64
    llvm.cond_br %11, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%9 : i64)
  ^bb4(%12: i64):  // 2 preds: ^bb3, ^bb5
    %13 = llvm.icmp "slt" %12, %5 : i64
    llvm.cond_br %13, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %14 = llvm.mul %9, %7  : i64
    %15 = llvm.mul %9, %6  : i64
    %16 = llvm.add %14, %15  : i64
    %17 = llvm.mul %10, %5  : i64
    %18 = llvm.add %16, %17  : i64
    %19 = llvm.add %18, %12  : i64
    %20 = llvm.getelementptr %arg0[%19] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %21 = llvm.load %20 : !llvm.ptr -> f32
    %22 = llvm.fcmp "ugt" %21, %0 : f32
    %23 = llvm.select %22, %21, %0 : i1, f32
    %24 = llvm.mul %9, %7  : i64
    %25 = llvm.mul %9, %6  : i64
    %26 = llvm.add %24, %25  : i64
    %27 = llvm.mul %10, %5  : i64
    %28 = llvm.add %26, %27  : i64
    %29 = llvm.add %28, %12  : i64
    %30 = llvm.getelementptr %arg1[%29] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %23, %30 : f32, !llvm.ptr
    %31 = llvm.add %12, %8  : i64
    %32 = llvm.mul %9, %7  : i64
    %33 = llvm.mul %9, %6  : i64
    %34 = llvm.add %32, %33  : i64
    %35 = llvm.mul %10, %5  : i64
    %36 = llvm.add %34, %35  : i64
    %37 = llvm.add %36, %31  : i64
    %38 = llvm.getelementptr %arg0[%37] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %39 = llvm.load %38 : !llvm.ptr -> f32
    %40 = llvm.fcmp "ugt" %39, %0 : f32
    %41 = llvm.select %40, %39, %0 : i1, f32
    %42 = llvm.mul %9, %7  : i64
    %43 = llvm.mul %9, %6  : i64
    %44 = llvm.add %42, %43  : i64
    %45 = llvm.mul %10, %5  : i64
    %46 = llvm.add %44, %45  : i64
    %47 = llvm.add %46, %31  : i64
    %48 = llvm.getelementptr %arg1[%47] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %41, %48 : f32, !llvm.ptr
    %49 = llvm.add %12, %3  : i64
    %50 = llvm.mul %9, %7  : i64
    %51 = llvm.mul %9, %6  : i64
    %52 = llvm.add %50, %51  : i64
    %53 = llvm.mul %10, %5  : i64
    %54 = llvm.add %52, %53  : i64
    %55 = llvm.add %54, %49  : i64
    %56 = llvm.getelementptr %arg0[%55] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %57 = llvm.load %56 : !llvm.ptr -> f32
    %58 = llvm.fcmp "ugt" %57, %0 : f32
    %59 = llvm.select %58, %57, %0 : i1, f32
    %60 = llvm.mul %9, %7  : i64
    %61 = llvm.mul %9, %6  : i64
    %62 = llvm.add %60, %61  : i64
    %63 = llvm.mul %10, %5  : i64
    %64 = llvm.add %62, %63  : i64
    %65 = llvm.add %64, %49  : i64
    %66 = llvm.getelementptr %arg1[%65] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %59, %66 : f32, !llvm.ptr
    %67 = llvm.add %12, %4  : i64
    %68 = llvm.mul %9, %7  : i64
    %69 = llvm.mul %9, %6  : i64
    %70 = llvm.add %68, %69  : i64
    %71 = llvm.mul %10, %5  : i64
    %72 = llvm.add %70, %71  : i64
    %73 = llvm.add %72, %67  : i64
    %74 = llvm.getelementptr %arg0[%73] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %75 = llvm.load %74 : !llvm.ptr -> f32
    %76 = llvm.fcmp "ugt" %75, %0 : f32
    %77 = llvm.select %76, %75, %0 : i1, f32
    %78 = llvm.mul %9, %7  : i64
    %79 = llvm.mul %9, %6  : i64
    %80 = llvm.add %78, %79  : i64
    %81 = llvm.mul %10, %5  : i64
    %82 = llvm.add %80, %81  : i64
    %83 = llvm.add %82, %67  : i64
    %84 = llvm.getelementptr %arg1[%83] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %77, %84 : f32, !llvm.ptr
    %85 = llvm.add %12, %2  : i64
    llvm.br ^bb4(%85 : i64)
  ^bb6:  // pred: ^bb4
    %86 = llvm.add %10, %8  : i64
    llvm.br ^bb2(%86 : i64)
  ^bb7:  // pred: ^bb2
    llvm.return
  }
}

