module attributes {llvm.data_layout = ""} {
  llvm.func @main_kernel_6(%arg0: !llvm.ptr<f32>, %arg1: !llvm.ptr<f32>) attributes {main_kernel_6} {
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
    %46 = llvm.mlir.constant(3.40282347E+38 : f32) : f32
    %47 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%45 : i64)
  ^bb2(%48: i64):  // 2 preds: ^bb1, ^bb12
    %49 = llvm.icmp "slt" %48, %44 : i64
    llvm.cond_br %49, ^bb3, ^bb13
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%45 : i64)
  ^bb4(%50: i64):  // 2 preds: ^bb3, ^bb11
    %51 = llvm.icmp "slt" %50, %42 : i64
    llvm.cond_br %51, ^bb5, ^bb12
  ^bb5:  // pred: ^bb4
    llvm.br ^bb6(%45 : i64)
  ^bb6(%52: i64):  // 2 preds: ^bb5, ^bb10
    %53 = llvm.icmp "slt" %52, %42 : i64
    llvm.cond_br %53, ^bb7, ^bb11
  ^bb7:  // pred: ^bb6
    llvm.br ^bb8(%45 : i64)
  ^bb8(%54: i64):  // 2 preds: ^bb7, ^bb9
    %55 = llvm.icmp "slt" %54, %43 : i64
    llvm.cond_br %55, ^bb9, ^bb10
  ^bb9:  // pred: ^bb8
    %56 = llvm.extractvalue %20[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %57 = llvm.mlir.constant(256 : index) : i64
    %58 = llvm.mul %48, %57  : i64
    %59 = llvm.mlir.constant(16 : index) : i64
    %60 = llvm.mul %50, %59  : i64
    %61 = llvm.add %58, %60  : i64
    %62 = llvm.add %61, %52  : i64
    %63 = llvm.add %62, %54  : i64
    %64 = llvm.getelementptr %56[%63] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %65 = llvm.load %64 : !llvm.ptr<f32>
    %66 = llvm.fcmp "olt" %65, %47 : f32
    %67 = llvm.select %66, %47, %65 : i1, f32
    %68 = llvm.fcmp "olt" %46, %65 : f32
    %69 = llvm.select %68, %46, %67 : i1, f32
    %70 = llvm.extractvalue %41[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %71 = llvm.mlir.constant(256 : index) : i64
    %72 = llvm.mul %48, %71  : i64
    %73 = llvm.mlir.constant(16 : index) : i64
    %74 = llvm.mul %50, %73  : i64
    %75 = llvm.add %72, %74  : i64
    %76 = llvm.add %75, %52  : i64
    %77 = llvm.add %76, %54  : i64
    %78 = llvm.getelementptr %70[%77] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    llvm.store %69, %78 : !llvm.ptr<f32>
    %79 = llvm.add %54, %43  : i64
    llvm.br ^bb8(%79 : i64)
  ^bb10:  // pred: ^bb8
    %80 = llvm.add %52, %43  : i64
    llvm.br ^bb6(%80 : i64)
  ^bb11:  // pred: ^bb6
    %81 = llvm.add %50, %43  : i64
    llvm.br ^bb4(%81 : i64)
  ^bb12:  // pred: ^bb4
    %82 = llvm.add %48, %43  : i64
    llvm.br ^bb2(%82 : i64)
  ^bb13:  // pred: ^bb2
    llvm.return
  }
}

