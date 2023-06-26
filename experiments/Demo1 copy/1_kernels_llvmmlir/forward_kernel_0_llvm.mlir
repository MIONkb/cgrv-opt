module attributes {llvm.data_layout = ""} {
  llvm.func @forward_kernel_0(%arg0: !llvm.ptr<f32>, %arg1: !llvm.ptr<f32>) attributes {Kernel, forward_kernel_0} {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.mlir.constant(12 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.mlir.constant(3 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %9 = llvm.mlir.constant(3 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.mlir.constant(1 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %14 = llvm.insertvalue %arg1, %13[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %15 = llvm.insertvalue %arg1, %14[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %16 = llvm.mlir.constant(0 : index) : i64
    %17 = llvm.insertvalue %16, %15[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %18 = llvm.mlir.constant(3 : index) : i64
    %19 = llvm.insertvalue %18, %17[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %20 = llvm.mlir.constant(12 : index) : i64
    %21 = llvm.insertvalue %20, %19[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %22 = llvm.mlir.constant(12 : index) : i64
    %23 = llvm.insertvalue %22, %21[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %24 = llvm.mlir.constant(1 : index) : i64
    %25 = llvm.insertvalue %24, %23[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %26 = llvm.mlir.constant(3 : index) : i64
    %27 = llvm.mlir.constant(1 : index) : i64
    %28 = llvm.mlir.constant(12 : index) : i64
    %29 = llvm.mlir.constant(0 : index) : i64
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%29 : i64)
  ^bb2(%30: i64):  // 2 preds: ^bb1, ^bb6
    %31 = llvm.icmp "slt" %30, %28 : i64
    llvm.cond_br %31, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%29 : i64)
  ^bb4(%32: i64):  // 2 preds: ^bb3, ^bb5
    %33 = llvm.icmp "slt" %32, %26 : i64
    llvm.cond_br %33, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %34 = llvm.extractvalue %12[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %35 = llvm.mlir.constant(3 : index) : i64
    %36 = llvm.mul %30, %35  : i64
    %37 = llvm.add %36, %32  : i64
    %38 = llvm.getelementptr %34[%37] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %39 = llvm.load %38 : !llvm.ptr<f32>
    %40 = llvm.extractvalue %25[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %41 = llvm.mlir.constant(12 : index) : i64
    %42 = llvm.mul %32, %41  : i64
    %43 = llvm.add %42, %30  : i64
    %44 = llvm.getelementptr %40[%43] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    llvm.store %39, %44 : !llvm.ptr<f32>
    %45 = llvm.add %32, %27  : i64
    llvm.br ^bb4(%45 : i64)
  ^bb6:  // pred: ^bb4
    %46 = llvm.add %30, %27  : i64
    llvm.br ^bb2(%46 : i64)
  ^bb7:  // pred: ^bb2
    llvm.return
  }
}

