module attributes {llvm.data_layout = ""} {
  llvm.func @kernel_0(%arg0: !llvm.ptr<f32>, %arg1: !llvm.ptr<f32>, %arg2: !llvm.ptr<f32>) attributes {Kernel, kernel_0} {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.mlir.constant(2 : index) : i64
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
    %18 = llvm.mlir.constant(2 : index) : i64
    %19 = llvm.insertvalue %18, %17[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %20 = llvm.mlir.constant(3 : index) : i64
    %21 = llvm.insertvalue %20, %19[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %22 = llvm.mlir.constant(3 : index) : i64
    %23 = llvm.insertvalue %22, %21[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %24 = llvm.mlir.constant(1 : index) : i64
    %25 = llvm.insertvalue %24, %23[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %26 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %27 = llvm.insertvalue %arg2, %26[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %28 = llvm.insertvalue %arg2, %27[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %29 = llvm.mlir.constant(0 : index) : i64
    %30 = llvm.insertvalue %29, %28[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %31 = llvm.mlir.constant(3 : index) : i64
    %32 = llvm.insertvalue %31, %30[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %33 = llvm.mlir.constant(3 : index) : i64
    %34 = llvm.insertvalue %33, %32[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %35 = llvm.mlir.constant(3 : index) : i64
    %36 = llvm.insertvalue %35, %34[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %37 = llvm.mlir.constant(1 : index) : i64
    %38 = llvm.insertvalue %37, %36[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %39 = llvm.mlir.constant(3 : index) : i64
    %40 = llvm.mlir.constant(1 : index) : i64
    %41 = llvm.mlir.constant(2 : index) : i64
    %42 = llvm.mlir.constant(0 : index) : i64
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%42 : i64)
  ^bb2(%43: i64):  // 2 preds: ^bb1, ^bb6
    %44 = llvm.icmp "slt" %43, %41 : i64
    llvm.cond_br %44, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%42 : i64)
  ^bb4(%45: i64):  // 2 preds: ^bb3, ^bb5
    %46 = llvm.icmp "slt" %45, %39 : i64
    llvm.cond_br %46, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %47 = llvm.extractvalue %12[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %48 = llvm.mlir.constant(3 : index) : i64
    %49 = llvm.mul %43, %48  : i64
    %50 = llvm.add %49, %45  : i64
    %51 = llvm.getelementptr %47[%50] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %52 = llvm.load %51 : !llvm.ptr<f32>
    %53 = llvm.extractvalue %25[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %54 = llvm.mlir.constant(3 : index) : i64
    %55 = llvm.mul %43, %54  : i64
    %56 = llvm.add %55, %42  : i64
    %57 = llvm.getelementptr %53[%56] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %58 = llvm.load %57 : !llvm.ptr<f32>
    %59 = llvm.extractvalue %38[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %60 = llvm.mlir.constant(3 : index) : i64
    %61 = llvm.mul %42, %60  : i64
    %62 = llvm.add %61, %45  : i64
    %63 = llvm.getelementptr %59[%62] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %64 = llvm.load %63 : !llvm.ptr<f32>
    %65 = llvm.fmul %58, %64  : f32
    %66 = llvm.fadd %52, %65  : f32
    %67 = llvm.extractvalue %25[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %68 = llvm.mlir.constant(3 : index) : i64
    %69 = llvm.mul %43, %68  : i64
    %70 = llvm.add %69, %40  : i64
    %71 = llvm.getelementptr %67[%70] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %72 = llvm.load %71 : !llvm.ptr<f32>
    %73 = llvm.extractvalue %38[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %74 = llvm.mlir.constant(3 : index) : i64
    %75 = llvm.mul %40, %74  : i64
    %76 = llvm.add %75, %45  : i64
    %77 = llvm.getelementptr %73[%76] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %78 = llvm.load %77 : !llvm.ptr<f32>
    %79 = llvm.fmul %72, %78  : f32
    %80 = llvm.fadd %66, %79  : f32
    %81 = llvm.extractvalue %25[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %82 = llvm.mlir.constant(3 : index) : i64
    %83 = llvm.mul %43, %82  : i64
    %84 = llvm.add %83, %41  : i64
    %85 = llvm.getelementptr %81[%84] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %86 = llvm.load %85 : !llvm.ptr<f32>
    %87 = llvm.extractvalue %38[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %88 = llvm.mlir.constant(3 : index) : i64
    %89 = llvm.mul %41, %88  : i64
    %90 = llvm.add %89, %45  : i64
    %91 = llvm.getelementptr %87[%90] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %92 = llvm.load %91 : !llvm.ptr<f32>
    %93 = llvm.fmul %86, %92  : f32
    %94 = llvm.fadd %80, %93  : f32
    %95 = llvm.extractvalue %12[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %96 = llvm.mlir.constant(3 : index) : i64
    %97 = llvm.mul %43, %96  : i64
    %98 = llvm.add %97, %45  : i64
    %99 = llvm.getelementptr %95[%98] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    llvm.store %94, %99 : !llvm.ptr<f32>
    %100 = llvm.add %45, %40  : i64
    llvm.br ^bb4(%100 : i64)
  ^bb6:  // pred: ^bb4
    %101 = llvm.add %43, %40  : i64
    llvm.br ^bb2(%101 : i64)
  ^bb7:  // pred: ^bb2
    llvm.return
  }
}

