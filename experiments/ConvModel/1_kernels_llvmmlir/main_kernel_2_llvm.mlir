module attributes {llvm.data_layout = ""} {
  llvm.func @main_kernel_2(%arg0: !llvm.ptr<f32>, %arg1: !llvm.ptr<f32>) attributes {main_kernel_2} {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %5 = llvm.mlir.constant(1 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %7 = llvm.mlir.constant(25 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %9 = llvm.mlir.constant(5 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %11 = llvm.mlir.constant(5 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %13 = llvm.mlir.constant(5 : index) : i64
    %14 = llvm.insertvalue %13, %12[3, 2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %15 = llvm.mlir.constant(1 : index) : i64
    %16 = llvm.insertvalue %15, %14[4, 2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %17 = llvm.mlir.constant(1 : index) : i64
    %18 = llvm.insertvalue %17, %16[3, 3] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %19 = llvm.mlir.constant(1 : index) : i64
    %20 = llvm.insertvalue %19, %18[4, 3] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %21 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)>
    %22 = llvm.insertvalue %arg1, %21[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %23 = llvm.insertvalue %arg1, %22[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %24 = llvm.mlir.constant(0 : index) : i64
    %25 = llvm.insertvalue %24, %23[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %26 = llvm.mlir.constant(5 : index) : i64
    %27 = llvm.insertvalue %26, %25[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %28 = llvm.mlir.constant(5 : index) : i64
    %29 = llvm.insertvalue %28, %27[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %30 = llvm.mlir.constant(5 : index) : i64
    %31 = llvm.insertvalue %30, %29[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %32 = llvm.mlir.constant(1 : index) : i64
    %33 = llvm.insertvalue %32, %31[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %34 = llvm.mlir.constant(1 : index) : i64
    %35 = llvm.insertvalue %34, %33[3, 2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %36 = llvm.mlir.constant(1 : index) : i64
    %37 = llvm.insertvalue %36, %35[4, 2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %38 = llvm.mlir.constant(1 : index) : i64
    %39 = llvm.insertvalue %38, %37[3, 3] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %40 = llvm.mlir.constant(1 : index) : i64
    %41 = llvm.insertvalue %40, %39[4, 3] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %42 = llvm.mlir.constant(1 : index) : i64
    %43 = llvm.mlir.constant(5 : index) : i64
    %44 = llvm.mlir.constant(0 : index) : i64
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%44 : i64)
  ^bb2(%45: i64):  // 2 preds: ^bb1, ^bb12
    %46 = llvm.icmp "slt" %45, %43 : i64
    llvm.cond_br %46, ^bb3, ^bb13
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%44 : i64)
  ^bb4(%47: i64):  // 2 preds: ^bb3, ^bb11
    %48 = llvm.icmp "slt" %47, %43 : i64
    llvm.cond_br %48, ^bb5, ^bb12
  ^bb5:  // pred: ^bb4
    llvm.br ^bb6(%44 : i64)
  ^bb6(%49: i64):  // 2 preds: ^bb5, ^bb10
    %50 = llvm.icmp "slt" %49, %42 : i64
    llvm.cond_br %50, ^bb7, ^bb11
  ^bb7:  // pred: ^bb6
    llvm.br ^bb8(%44 : i64)
  ^bb8(%51: i64):  // 2 preds: ^bb7, ^bb9
    %52 = llvm.icmp "slt" %51, %42 : i64
    llvm.cond_br %52, ^bb9, ^bb10
  ^bb9:  // pred: ^bb8
    %53 = llvm.extractvalue %20[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %54 = llvm.mlir.constant(25 : index) : i64
    %55 = llvm.mul %51, %54  : i64
    %56 = llvm.mlir.constant(5 : index) : i64
    %57 = llvm.mul %45, %56  : i64
    %58 = llvm.add %55, %57  : i64
    %59 = llvm.add %58, %47  : i64
    %60 = llvm.add %59, %49  : i64
    %61 = llvm.getelementptr %53[%60] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %62 = llvm.load %61 : !llvm.ptr<f32>
    %63 = llvm.extractvalue %41[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %64 = llvm.mlir.constant(5 : index) : i64
    %65 = llvm.mul %45, %64  : i64
    %66 = llvm.add %65, %47  : i64
    %67 = llvm.add %66, %49  : i64
    %68 = llvm.add %67, %51  : i64
    %69 = llvm.getelementptr %63[%68] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    llvm.store %62, %69 : !llvm.ptr<f32>
    %70 = llvm.add %51, %42  : i64
    llvm.br ^bb8(%70 : i64)
  ^bb10:  // pred: ^bb8
    %71 = llvm.add %49, %42  : i64
    llvm.br ^bb6(%71 : i64)
  ^bb11:  // pred: ^bb6
    %72 = llvm.add %47, %42  : i64
    llvm.br ^bb4(%72 : i64)
  ^bb12:  // pred: ^bb4
    %73 = llvm.add %45, %42  : i64
    llvm.br ^bb2(%73 : i64)
  ^bb13:  // pred: ^bb2
    llvm.return
  }
}

