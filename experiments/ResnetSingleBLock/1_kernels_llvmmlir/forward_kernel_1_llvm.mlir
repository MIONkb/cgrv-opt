module attributes {llvm.data_layout = ""} {
  llvm.func @forward_kernel_1(%arg0: !llvm.ptr) attributes {Kernel, forward_kernel_1} {
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
    %21 = llvm.mlir.constant(112 : index) : i64
    %22 = llvm.mlir.constant(64 : index) : i64
    %23 = llvm.mlir.constant(1 : index) : i64
    %24 = llvm.mlir.constant(0 : index) : i64
    %25 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%24 : i64)
  ^bb2(%26: i64):  // 2 preds: ^bb1, ^bb12
    %27 = llvm.icmp "slt" %26, %23 : i64
    llvm.cond_br %27, ^bb3, ^bb13
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%24 : i64)
  ^bb4(%28: i64):  // 2 preds: ^bb3, ^bb11
    %29 = llvm.icmp "slt" %28, %22 : i64
    llvm.cond_br %29, ^bb5, ^bb12
  ^bb5:  // pred: ^bb4
    llvm.br ^bb6(%24 : i64)
  ^bb6(%30: i64):  // 2 preds: ^bb5, ^bb10
    %31 = llvm.icmp "slt" %30, %21 : i64
    llvm.cond_br %31, ^bb7, ^bb11
  ^bb7:  // pred: ^bb6
    llvm.br ^bb8(%24 : i64)
  ^bb8(%32: i64):  // 2 preds: ^bb7, ^bb9
    %33 = llvm.icmp "slt" %32, %21 : i64
    llvm.cond_br %33, ^bb9, ^bb10
  ^bb9:  // pred: ^bb8
    %34 = llvm.extractvalue %20[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %35 = llvm.mlir.constant(802816 : index) : i64
    %36 = llvm.mul %26, %35  : i64
    %37 = llvm.mlir.constant(12544 : index) : i64
    %38 = llvm.mul %28, %37  : i64
    %39 = llvm.add %36, %38  : i64
    %40 = llvm.mlir.constant(112 : index) : i64
    %41 = llvm.mul %30, %40  : i64
    %42 = llvm.add %39, %41  : i64
    %43 = llvm.add %42, %32  : i64
    %44 = llvm.getelementptr %34[%43] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %25, %44 : f32, !llvm.ptr
    %45 = llvm.add %32, %23  : i64
    llvm.br ^bb8(%45 : i64)
  ^bb10:  // pred: ^bb8
    %46 = llvm.add %30, %23  : i64
    llvm.br ^bb6(%46 : i64)
  ^bb11:  // pred: ^bb6
    %47 = llvm.add %28, %23  : i64
    llvm.br ^bb4(%47 : i64)
  ^bb12:  // pred: ^bb4
    %48 = llvm.add %26, %23  : i64
    llvm.br ^bb2(%48 : i64)
  ^bb13:  // pred: ^bb2
    llvm.return
  }
}

