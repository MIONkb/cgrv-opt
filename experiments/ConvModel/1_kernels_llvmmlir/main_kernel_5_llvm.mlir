module attributes {llvm.data_layout = ""} {
  llvm.func @main_kernel_5(%arg0: !llvm.ptr<f32>, %arg1: !llvm.ptr<f32>) attributes {main_kernel_5} {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %5 = llvm.mlir.constant(4 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %7 = llvm.mlir.constant(256 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %9 = llvm.mlir.constant(16 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %11 = llvm.mlir.constant(16 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %13 = llvm.mlir.constant(16 : index) : i64
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
    %26 = llvm.mlir.constant(4 : index) : i64
    %27 = llvm.insertvalue %26, %25[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %28 = llvm.mlir.constant(256 : index) : i64
    %29 = llvm.insertvalue %28, %27[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %30 = llvm.mlir.constant(16 : index) : i64
    %31 = llvm.insertvalue %30, %29[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %32 = llvm.mlir.constant(16 : index) : i64
    %33 = llvm.insertvalue %32, %31[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %34 = llvm.mlir.constant(16 : index) : i64
    %35 = llvm.insertvalue %34, %33[3, 2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %36 = llvm.mlir.constant(1 : index) : i64
    %37 = llvm.insertvalue %36, %35[4, 2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %38 = llvm.mlir.constant(1 : index) : i64
    %39 = llvm.insertvalue %38, %37[3, 3] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %40 = llvm.mlir.constant(1 : index) : i64
    %41 = llvm.insertvalue %40, %39[4, 3] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %42 = llvm.mlir.constant(16 : index) : i64
    %43 = llvm.mlir.constant(1 : index) : i64
    %44 = llvm.mlir.constant(4 : index) : i64
    %45 = llvm.mlir.constant(0 : index) : i64
    %46 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%45 : i64)
  ^bb2(%47: i64):  // 2 preds: ^bb1, ^bb12
    %48 = llvm.icmp "slt" %47, %44 : i64
    llvm.cond_br %48, ^bb3, ^bb13
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%45 : i64)
  ^bb4(%49: i64):  // 2 preds: ^bb3, ^bb11
    %50 = llvm.icmp "slt" %49, %42 : i64
    llvm.cond_br %50, ^bb5, ^bb12
  ^bb5:  // pred: ^bb4
    llvm.br ^bb6(%45 : i64)
  ^bb6(%51: i64):  // 2 preds: ^bb5, ^bb10
    %52 = llvm.icmp "slt" %51, %42 : i64
    llvm.cond_br %52, ^bb7, ^bb11
  ^bb7:  // pred: ^bb6
    llvm.br ^bb8(%45 : i64)
  ^bb8(%53: i64):  // 2 preds: ^bb7, ^bb9
    %54 = llvm.icmp "slt" %53, %43 : i64
    llvm.cond_br %54, ^bb9, ^bb10
  ^bb9:  // pred: ^bb8
    %55 = llvm.extractvalue %20[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %56 = llvm.mlir.constant(256 : index) : i64
    %57 = llvm.mul %47, %56  : i64
    %58 = llvm.mlir.constant(16 : index) : i64
    %59 = llvm.mul %49, %58  : i64
    %60 = llvm.add %57, %59  : i64
    %61 = llvm.add %60, %51  : i64
    %62 = llvm.add %61, %53  : i64
    %63 = llvm.getelementptr %55[%62] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %64 = llvm.load %63 : !llvm.ptr<f32>
    %65 = llvm.fadd %64, %46  : f32
    %66 = llvm.extractvalue %41[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %67 = llvm.mlir.constant(256 : index) : i64
    %68 = llvm.mul %47, %67  : i64
    %69 = llvm.mlir.constant(16 : index) : i64
    %70 = llvm.mul %49, %69  : i64
    %71 = llvm.add %68, %70  : i64
    %72 = llvm.add %71, %51  : i64
    %73 = llvm.add %72, %53  : i64
    %74 = llvm.getelementptr %66[%73] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    llvm.store %65, %74 : !llvm.ptr<f32>
    %75 = llvm.add %53, %43  : i64
    llvm.br ^bb8(%75 : i64)
  ^bb10:  // pred: ^bb8
    %76 = llvm.add %51, %43  : i64
    llvm.br ^bb6(%76 : i64)
  ^bb11:  // pred: ^bb6
    %77 = llvm.add %49, %43  : i64
    llvm.br ^bb4(%77 : i64)
  ^bb12:  // pred: ^bb4
    %78 = llvm.add %47, %43  : i64
    llvm.br ^bb2(%78 : i64)
  ^bb13:  // pred: ^bb2
    llvm.return
  }
}

