module attributes {llvm.data_layout = ""} {
  llvm.func @forward_kernel_1(%arg0: !llvm.ptr<f32>) attributes {Kernel, forward_kernel_1} {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.mlir.constant(4 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.mlir.constant(12 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %9 = llvm.mlir.constant(12 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.mlir.constant(1 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = llvm.mlir.constant(12 : index) : i64
    %14 = llvm.mlir.constant(1 : index) : i64
    %15 = llvm.mlir.constant(4 : index) : i64
    %16 = llvm.mlir.constant(0 : index) : i64
    %17 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%16 : i64)
  ^bb2(%18: i64):  // 2 preds: ^bb1, ^bb6
    %19 = llvm.icmp "slt" %18, %15 : i64
    llvm.cond_br %19, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%16 : i64)
  ^bb4(%20: i64):  // 2 preds: ^bb3, ^bb5
    %21 = llvm.icmp "slt" %20, %13 : i64
    llvm.cond_br %21, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %22 = llvm.extractvalue %12[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %23 = llvm.mlir.constant(12 : index) : i64
    %24 = llvm.mul %18, %23  : i64
    %25 = llvm.add %24, %20  : i64
    %26 = llvm.getelementptr %22[%25] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    llvm.store %17, %26 : !llvm.ptr<f32>
    %27 = llvm.add %20, %14  : i64
    llvm.br ^bb4(%27 : i64)
  ^bb6:  // pred: ^bb4
    %28 = llvm.add %18, %14  : i64
    llvm.br ^bb2(%28 : i64)
  ^bb7:  // pred: ^bb2
    llvm.return
  }
}

