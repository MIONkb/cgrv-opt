module attributes {llvm.data_layout = ""} {
  llvm.func @forward_kernel_0(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr, %arg3: !llvm.ptr) attributes {Kernel, forward_kernel_0} {
    %0 = llvm.mlir.constant(8 : index) : i64
    %1 = llvm.mlir.constant(2 : index) : i64
    %2 = llvm.mlir.constant(7 : index) : i64
    %3 = llvm.mlir.constant(49 : index) : i64
    %4 = llvm.mlir.constant(147 : index) : i64
    %5 = llvm.mlir.constant(230 : index) : i64
    %6 = llvm.mlir.constant(52900 : index) : i64
    %7 = llvm.mlir.constant(3 : index) : i64
    %8 = llvm.mlir.constant(158700 : index) : i64
    %9 = llvm.mlir.constant(112 : index) : i64
    %10 = llvm.mlir.constant(12544 : index) : i64
    %11 = llvm.mlir.constant(802816 : index) : i64
    %12 = llvm.mlir.constant(1 : index) : i64
    %13 = llvm.mlir.constant(0 : index) : i64
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%13 : i64)
  ^bb2(%14: i64):  // 2 preds: ^bb1, ^bb12
    %15 = llvm.icmp "slt" %14, %0 : i64
    llvm.cond_br %15, ^bb3, ^bb13
  ^bb3:  // pred: ^bb2
    %16 = llvm.mul %13, %11  : i64
    %17 = llvm.mul %13, %10  : i64
    %18 = llvm.add %16, %17  : i64
    %19 = llvm.mul %13, %9  : i64
    %20 = llvm.add %18, %19  : i64
    %21 = llvm.add %20, %14  : i64
    %22 = llvm.getelementptr %arg0[%21] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %23 = llvm.load %22 : !llvm.ptr -> f32
    llvm.br ^bb4(%13, %23 : i64, f32)
  ^bb4(%24: i64, %25: f32):  // 2 preds: ^bb3, ^bb11
    %26 = llvm.icmp "slt" %24, %7 : i64
    llvm.cond_br %26, ^bb5, ^bb12
  ^bb5:  // pred: ^bb4
    llvm.br ^bb6(%13, %25 : i64, f32)
  ^bb6(%27: i64, %28: f32):  // 2 preds: ^bb5, ^bb10
    %29 = llvm.icmp "slt" %27, %2 : i64
    llvm.cond_br %29, ^bb7, ^bb11
  ^bb7:  // pred: ^bb6
    llvm.br ^bb8(%13, %28 : i64, f32)
  ^bb8(%30: i64, %31: f32):  // 2 preds: ^bb7, ^bb9
    %32 = llvm.icmp "slt" %30, %2 : i64
    llvm.cond_br %32, ^bb9, ^bb10
  ^bb9:  // pred: ^bb8
    %33 = llvm.mul %14, %1  : i64
    %34 = llvm.add %33, %30  : i64
    %35 = llvm.mul %13, %8  : i64
    %36 = llvm.mul %24, %6  : i64
    %37 = llvm.add %35, %36  : i64
    %38 = llvm.mul %27, %5  : i64
    %39 = llvm.add %37, %38  : i64
    %40 = llvm.add %39, %34  : i64
    %41 = llvm.getelementptr %arg1[%40] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %42 = llvm.load %41 : !llvm.ptr -> f32
    %43 = llvm.mul %13, %4  : i64
    %44 = llvm.mul %24, %3  : i64
    %45 = llvm.add %43, %44  : i64
    %46 = llvm.mul %27, %2  : i64
    %47 = llvm.add %45, %46  : i64
    %48 = llvm.add %47, %30  : i64
    %49 = llvm.getelementptr %arg2[%48] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %50 = llvm.load %49 : !llvm.ptr -> f32
    %51 = llvm.fmul %42, %50  : f32
    %52 = llvm.fadd %31, %51  : f32
    %53 = llvm.add %30, %12  : i64
    llvm.br ^bb8(%53, %52 : i64, f32)
  ^bb10:  // pred: ^bb8
    %54 = llvm.add %27, %12  : i64
    llvm.br ^bb6(%54, %31 : i64, f32)
  ^bb11:  // pred: ^bb6
    %55 = llvm.add %24, %12  : i64
    llvm.br ^bb4(%55, %28 : i64, f32)
  ^bb12:  // pred: ^bb4
    %56 = llvm.mul %13, %11  : i64
    %57 = llvm.mul %13, %10  : i64
    %58 = llvm.add %56, %57  : i64
    %59 = llvm.mul %13, %9  : i64
    %60 = llvm.add %58, %59  : i64
    %61 = llvm.add %60, %14  : i64
    %62 = llvm.getelementptr %arg3[%61] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %25, %62 : f32, !llvm.ptr
    %63 = llvm.add %14, %12  : i64
    llvm.br ^bb2(%63 : i64)
  ^bb13:  // pred: ^bb2
    llvm.return
  }
}

