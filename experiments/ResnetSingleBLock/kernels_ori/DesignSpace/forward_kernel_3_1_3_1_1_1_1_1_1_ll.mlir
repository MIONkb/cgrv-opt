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
  ^bb2(%11: i64):  // 2 preds: ^bb1, ^bb9
    %12 = llvm.icmp "slt" %11, %0 : i64
    llvm.cond_br %12, ^bb3, ^bb10
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%10 : i64)
  ^bb4(%13: i64):  // 2 preds: ^bb3, ^bb8
    %14 = llvm.icmp "slt" %13, %6 : i64
    llvm.cond_br %14, ^bb5, ^bb9
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
  ^bb6(%23: i64, %24: f32):  // 2 preds: ^bb5, ^bb7
    %25 = llvm.icmp "slt" %23, %1 : i64
    llvm.cond_br %25, ^bb7, ^bb8
  ^bb7:  // pred: ^bb6
    %26 = llvm.mul %11, %2  : i64
    %27 = llvm.add %26, %23  : i64
    %28 = llvm.mul %13, %2  : i64
    %29 = llvm.mul %10, %5  : i64
    %30 = llvm.mul %10, %4  : i64
    %31 = llvm.add %29, %30  : i64
    %32 = llvm.mul %27, %3  : i64
    %33 = llvm.add %31, %32  : i64
    %34 = llvm.add %33, %28  : i64
    %35 = llvm.getelementptr %arg1[%34] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %36 = llvm.load %35 : !llvm.ptr -> f32
    %37 = llvm.fcmp "ugt" %24, %36 : f32
    %38 = llvm.select %37, %24, %36 : i1, f32
    %39 = llvm.mul %11, %2  : i64
    %40 = llvm.add %39, %23  : i64
    %41 = llvm.mul %13, %2  : i64
    %42 = llvm.add %41, %9  : i64
    %43 = llvm.mul %10, %5  : i64
    %44 = llvm.mul %10, %4  : i64
    %45 = llvm.add %43, %44  : i64
    %46 = llvm.mul %40, %3  : i64
    %47 = llvm.add %45, %46  : i64
    %48 = llvm.add %47, %42  : i64
    %49 = llvm.getelementptr %arg1[%48] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %50 = llvm.load %49 : !llvm.ptr -> f32
    %51 = llvm.fcmp "ugt" %38, %50 : f32
    %52 = llvm.select %51, %38, %50 : i1, f32
    %53 = llvm.mul %11, %2  : i64
    %54 = llvm.add %53, %23  : i64
    %55 = llvm.mul %13, %2  : i64
    %56 = llvm.add %55, %2  : i64
    %57 = llvm.mul %10, %5  : i64
    %58 = llvm.mul %10, %4  : i64
    %59 = llvm.add %57, %58  : i64
    %60 = llvm.mul %54, %3  : i64
    %61 = llvm.add %59, %60  : i64
    %62 = llvm.add %61, %56  : i64
    %63 = llvm.getelementptr %arg1[%62] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %64 = llvm.load %63 : !llvm.ptr -> f32
    %65 = llvm.fcmp "ugt" %52, %64 : f32
    %66 = llvm.select %65, %52, %64 : i1, f32
    %67 = llvm.add %23, %9  : i64
    llvm.br ^bb6(%67, %66 : i64, f32)
  ^bb8:  // pred: ^bb6
    %68 = llvm.mul %10, %8  : i64
    %69 = llvm.mul %10, %7  : i64
    %70 = llvm.add %68, %69  : i64
    %71 = llvm.mul %11, %6  : i64
    %72 = llvm.add %70, %71  : i64
    %73 = llvm.add %72, %13  : i64
    %74 = llvm.getelementptr %arg2[%73] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %24, %74 : f32, !llvm.ptr
    %75 = llvm.add %13, %9  : i64
    llvm.br ^bb4(%75 : i64)
  ^bb9:  // pred: ^bb4
    %76 = llvm.add %11, %9  : i64
    llvm.br ^bb2(%76 : i64)
  ^bb10:  // pred: ^bb2
    llvm.return
  }
}

