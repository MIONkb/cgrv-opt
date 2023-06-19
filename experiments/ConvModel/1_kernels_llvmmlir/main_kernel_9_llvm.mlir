module attributes {llvm.data_layout = ""} {
  llvm.func @main_kernel_9(%arg0: !llvm.ptr<f32>, %arg1: !llvm.ptr<f32>) attributes {main_kernel_9} {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.mlir.constant(4 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.mlir.constant(8 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %9 = llvm.mlir.constant(8 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.mlir.constant(1 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %14 = llvm.insertvalue %arg1, %13[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %15 = llvm.insertvalue %arg1, %14[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %16 = llvm.mlir.constant(0 : index) : i64
    %17 = llvm.insertvalue %16, %15[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %18 = llvm.mlir.constant(4 : index) : i64
    %19 = llvm.insertvalue %18, %17[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %20 = llvm.mlir.constant(8 : index) : i64
    %21 = llvm.insertvalue %20, %19[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %22 = llvm.mlir.constant(8 : index) : i64
    %23 = llvm.insertvalue %22, %21[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %24 = llvm.mlir.constant(1 : index) : i64
    %25 = llvm.insertvalue %24, %23[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %26 = llvm.mlir.constant(8 : index) : i64
    %27 = llvm.mlir.constant(1 : index) : i64
    %28 = llvm.mlir.constant(4 : index) : i64
    %29 = llvm.mlir.constant(0 : index) : i64
    %30 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%29 : i64)
  ^bb2(%31: i64):  // 2 preds: ^bb1, ^bb6
    %32 = llvm.icmp "slt" %31, %28 : i64
    llvm.cond_br %32, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%29 : i64)
  ^bb4(%33: i64):  // 2 preds: ^bb3, ^bb5
    %34 = llvm.icmp "slt" %33, %26 : i64
    llvm.cond_br %34, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %35 = llvm.extractvalue %12[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %36 = llvm.mlir.constant(8 : index) : i64
    %37 = llvm.mul %31, %36  : i64
    %38 = llvm.add %37, %33  : i64
    %39 = llvm.getelementptr %35[%38] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %40 = llvm.load %39 : !llvm.ptr<f32>
    %41 = llvm.fadd %40, %30  : f32
    %42 = llvm.extractvalue %25[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %43 = llvm.mlir.constant(8 : index) : i64
    %44 = llvm.mul %31, %43  : i64
    %45 = llvm.add %44, %33  : i64
    %46 = llvm.getelementptr %42[%45] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    llvm.store %41, %46 : !llvm.ptr<f32>
    %47 = llvm.add %33, %27  : i64
    llvm.br ^bb4(%47 : i64)
  ^bb6:  // pred: ^bb4
    %48 = llvm.add %31, %27  : i64
    llvm.br ^bb2(%48 : i64)
  ^bb7:  // pred: ^bb2
    llvm.return
  }
}

