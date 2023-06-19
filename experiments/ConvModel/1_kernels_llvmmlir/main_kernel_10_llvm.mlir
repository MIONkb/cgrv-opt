module attributes {llvm.data_layout = ""} {
  llvm.func @main_kernel_10(%arg0: !llvm.ptr<f32>, %arg1: !llvm.ptr<f32>) attributes {main_kernel_10} {
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
    %30 = llvm.mlir.constant(3.40282347E+38 : f32) : f32
    %31 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%29 : i64)
  ^bb2(%32: i64):  // 2 preds: ^bb1, ^bb6
    %33 = llvm.icmp "slt" %32, %28 : i64
    llvm.cond_br %33, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%29 : i64)
  ^bb4(%34: i64):  // 2 preds: ^bb3, ^bb5
    %35 = llvm.icmp "slt" %34, %26 : i64
    llvm.cond_br %35, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %36 = llvm.extractvalue %12[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %37 = llvm.mlir.constant(8 : index) : i64
    %38 = llvm.mul %32, %37  : i64
    %39 = llvm.add %38, %34  : i64
    %40 = llvm.getelementptr %36[%39] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %41 = llvm.load %40 : !llvm.ptr<f32>
    %42 = llvm.fcmp "olt" %41, %31 : f32
    %43 = llvm.select %42, %31, %41 : i1, f32
    %44 = llvm.fcmp "olt" %30, %41 : f32
    %45 = llvm.select %44, %30, %43 : i1, f32
    %46 = llvm.extractvalue %25[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %47 = llvm.mlir.constant(8 : index) : i64
    %48 = llvm.mul %32, %47  : i64
    %49 = llvm.add %48, %34  : i64
    %50 = llvm.getelementptr %46[%49] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    llvm.store %45, %50 : !llvm.ptr<f32>
    %51 = llvm.add %34, %27  : i64
    llvm.br ^bb4(%51 : i64)
  ^bb6:  // pred: ^bb4
    %52 = llvm.add %32, %27  : i64
    llvm.br ^bb2(%52 : i64)
  ^bb7:  // pred: ^bb2
    llvm.return
  }
}

