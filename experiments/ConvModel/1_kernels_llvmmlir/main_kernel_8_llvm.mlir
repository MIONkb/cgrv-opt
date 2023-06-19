module attributes {llvm.data_layout = ""} {
  llvm.func @main_kernel_8(%arg0: !llvm.ptr<f32>, %arg1: !llvm.ptr<f32>, %arg2: !llvm.ptr<f32>) attributes {main_kernel_8} {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %5 = llvm.mlir.constant(1 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %7 = llvm.mlir.constant(1024 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %9 = llvm.mlir.constant(4 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %11 = llvm.mlir.constant(256 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %13 = llvm.mlir.constant(256 : index) : i64
    %14 = llvm.insertvalue %13, %12[3, 2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %15 = llvm.mlir.constant(1 : index) : i64
    %16 = llvm.insertvalue %15, %14[4, 2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %17 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)>
    %18 = llvm.insertvalue %arg1, %17[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %19 = llvm.insertvalue %arg1, %18[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %20 = llvm.mlir.constant(0 : index) : i64
    %21 = llvm.insertvalue %20, %19[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %22 = llvm.mlir.constant(1 : index) : i64
    %23 = llvm.insertvalue %22, %21[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %24 = llvm.mlir.constant(2048 : index) : i64
    %25 = llvm.insertvalue %24, %23[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %26 = llvm.mlir.constant(256 : index) : i64
    %27 = llvm.insertvalue %26, %25[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %28 = llvm.mlir.constant(8 : index) : i64
    %29 = llvm.insertvalue %28, %27[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %30 = llvm.mlir.constant(8 : index) : i64
    %31 = llvm.insertvalue %30, %29[3, 2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %32 = llvm.mlir.constant(1 : index) : i64
    %33 = llvm.insertvalue %32, %31[4, 2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %34 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)>
    %35 = llvm.insertvalue %arg2, %34[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %36 = llvm.insertvalue %arg2, %35[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %37 = llvm.mlir.constant(0 : index) : i64
    %38 = llvm.insertvalue %37, %36[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %39 = llvm.mlir.constant(1 : index) : i64
    %40 = llvm.insertvalue %39, %38[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %41 = llvm.mlir.constant(32 : index) : i64
    %42 = llvm.insertvalue %41, %40[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %43 = llvm.mlir.constant(4 : index) : i64
    %44 = llvm.insertvalue %43, %42[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %45 = llvm.mlir.constant(8 : index) : i64
    %46 = llvm.insertvalue %45, %44[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %47 = llvm.mlir.constant(8 : index) : i64
    %48 = llvm.insertvalue %47, %46[3, 2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %49 = llvm.mlir.constant(1 : index) : i64
    %50 = llvm.insertvalue %49, %48[4, 2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %51 = llvm.mlir.constant(256 : index) : i64
    %52 = llvm.mlir.constant(8 : index) : i64
    %53 = llvm.mlir.constant(4 : index) : i64
    %54 = llvm.mlir.constant(1 : index) : i64
    %55 = llvm.mlir.constant(0 : index) : i64
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%55 : i64)
  ^bb2(%56: i64):  // 2 preds: ^bb1, ^bb12
    %57 = llvm.icmp "slt" %56, %54 : i64
    llvm.cond_br %57, ^bb3, ^bb13
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%55 : i64)
  ^bb4(%58: i64):  // 2 preds: ^bb3, ^bb11
    %59 = llvm.icmp "slt" %58, %53 : i64
    llvm.cond_br %59, ^bb5, ^bb12
  ^bb5:  // pred: ^bb4
    llvm.br ^bb6(%55 : i64)
  ^bb6(%60: i64):  // 2 preds: ^bb5, ^bb10
    %61 = llvm.icmp "slt" %60, %52 : i64
    llvm.cond_br %61, ^bb7, ^bb11
  ^bb7:  // pred: ^bb6
    llvm.br ^bb8(%55 : i64)
  ^bb8(%62: i64):  // 2 preds: ^bb7, ^bb9
    %63 = llvm.icmp "slt" %62, %51 : i64
    llvm.cond_br %63, ^bb9, ^bb10
  ^bb9:  // pred: ^bb8
    %64 = llvm.extractvalue %16[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %65 = llvm.mlir.constant(1024 : index) : i64
    %66 = llvm.mul %56, %65  : i64
    %67 = llvm.mlir.constant(256 : index) : i64
    %68 = llvm.mul %58, %67  : i64
    %69 = llvm.add %66, %68  : i64
    %70 = llvm.add %69, %62  : i64
    %71 = llvm.getelementptr %64[%70] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %72 = llvm.load %71 : !llvm.ptr<f32>
    %73 = llvm.extractvalue %33[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %74 = llvm.mlir.constant(2048 : index) : i64
    %75 = llvm.mul %56, %74  : i64
    %76 = llvm.mlir.constant(8 : index) : i64
    %77 = llvm.mul %62, %76  : i64
    %78 = llvm.add %75, %77  : i64
    %79 = llvm.add %78, %60  : i64
    %80 = llvm.getelementptr %73[%79] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %81 = llvm.load %80 : !llvm.ptr<f32>
    %82 = llvm.extractvalue %50[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %83 = llvm.mlir.constant(32 : index) : i64
    %84 = llvm.mul %56, %83  : i64
    %85 = llvm.mlir.constant(8 : index) : i64
    %86 = llvm.mul %58, %85  : i64
    %87 = llvm.add %84, %86  : i64
    %88 = llvm.add %87, %60  : i64
    %89 = llvm.getelementptr %82[%88] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %90 = llvm.load %89 : !llvm.ptr<f32>
    %91 = llvm.fmul %72, %81  : f32
    %92 = llvm.fadd %90, %91  : f32
    %93 = llvm.extractvalue %50[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %94 = llvm.mlir.constant(32 : index) : i64
    %95 = llvm.mul %56, %94  : i64
    %96 = llvm.mlir.constant(8 : index) : i64
    %97 = llvm.mul %58, %96  : i64
    %98 = llvm.add %95, %97  : i64
    %99 = llvm.add %98, %60  : i64
    %100 = llvm.getelementptr %93[%99] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    llvm.store %92, %100 : !llvm.ptr<f32>
    %101 = llvm.add %62, %54  : i64
    llvm.br ^bb8(%101 : i64)
  ^bb10:  // pred: ^bb8
    %102 = llvm.add %60, %54  : i64
    llvm.br ^bb6(%102 : i64)
  ^bb11:  // pred: ^bb6
    %103 = llvm.add %58, %54  : i64
    llvm.br ^bb4(%103 : i64)
  ^bb12:  // pred: ^bb4
    %104 = llvm.add %56, %54  : i64
    llvm.br ^bb2(%104 : i64)
  ^bb13:  // pred: ^bb2
    llvm.return
  }
}

