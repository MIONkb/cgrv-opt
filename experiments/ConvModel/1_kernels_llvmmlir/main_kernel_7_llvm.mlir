module attributes {llvm.data_layout = ""} {
  llvm.func @main_kernel_7(%arg0: !llvm.ptr<f32>) attributes {main_kernel_7} {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %5 = llvm.mlir.constant(1 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %7 = llvm.mlir.constant(32 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %9 = llvm.mlir.constant(4 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %11 = llvm.mlir.constant(8 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %13 = llvm.mlir.constant(8 : index) : i64
    %14 = llvm.insertvalue %13, %12[3, 2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %15 = llvm.mlir.constant(1 : index) : i64
    %16 = llvm.insertvalue %15, %14[4, 2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %17 = llvm.mlir.constant(8 : index) : i64
    %18 = llvm.mlir.constant(4 : index) : i64
    %19 = llvm.mlir.constant(1 : index) : i64
    %20 = llvm.mlir.constant(0 : index) : i64
    %21 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%20 : i64)
  ^bb2(%22: i64):  // 2 preds: ^bb1, ^bb9
    %23 = llvm.icmp "slt" %22, %19 : i64
    llvm.cond_br %23, ^bb3, ^bb10
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%20 : i64)
  ^bb4(%24: i64):  // 2 preds: ^bb3, ^bb8
    %25 = llvm.icmp "slt" %24, %18 : i64
    llvm.cond_br %25, ^bb5, ^bb9
  ^bb5:  // pred: ^bb4
    llvm.br ^bb6(%20 : i64)
  ^bb6(%26: i64):  // 2 preds: ^bb5, ^bb7
    %27 = llvm.icmp "slt" %26, %17 : i64
    llvm.cond_br %27, ^bb7, ^bb8
  ^bb7:  // pred: ^bb6
    %28 = llvm.extractvalue %16[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %29 = llvm.mlir.constant(32 : index) : i64
    %30 = llvm.mul %22, %29  : i64
    %31 = llvm.mlir.constant(8 : index) : i64
    %32 = llvm.mul %24, %31  : i64
    %33 = llvm.add %30, %32  : i64
    %34 = llvm.add %33, %26  : i64
    %35 = llvm.getelementptr %28[%34] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    llvm.store %21, %35 : !llvm.ptr<f32>
    %36 = llvm.add %26, %19  : i64
    llvm.br ^bb6(%36 : i64)
  ^bb8:  // pred: ^bb6
    %37 = llvm.add %24, %19  : i64
    llvm.br ^bb4(%37 : i64)
  ^bb9:  // pred: ^bb4
    %38 = llvm.add %22, %19  : i64
    llvm.br ^bb2(%38 : i64)
  ^bb10:  // pred: ^bb2
    llvm.return
  }
}

