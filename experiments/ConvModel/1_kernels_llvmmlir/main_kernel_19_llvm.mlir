module attributes {llvm.data_layout = ""} {
  llvm.func @main_kernel_19(%arg0: !llvm.ptr<f32>) attributes {main_kernel_19} {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %5 = llvm.mlir.constant(4 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %7 = llvm.mlir.constant(1 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %9 = llvm.mlir.constant(1 : index) : i64
    %10 = llvm.mlir.constant(4 : index) : i64
    %11 = llvm.mlir.constant(0 : index) : i64
    %12 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%11 : i64)
  ^bb2(%13: i64):  // 2 preds: ^bb1, ^bb3
    %14 = llvm.icmp "slt" %13, %10 : i64
    llvm.cond_br %14, ^bb3, ^bb4
  ^bb3:  // pred: ^bb2
    %15 = llvm.extractvalue %8[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %16 = llvm.getelementptr %15[%13] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    llvm.store %12, %16 : !llvm.ptr<f32>
    %17 = llvm.add %13, %9  : i64
    llvm.br ^bb2(%17 : i64)
  ^bb4:  // pred: ^bb2
    llvm.return
  }
}

