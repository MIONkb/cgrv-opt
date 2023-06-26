module attributes {llvm.data_layout = ""} {
  llvm.func @forward_kernel_5(%arg0: !llvm.ptr<f32>, %arg1: !llvm.ptr<f32>, %arg2: !llvm.ptr<f32>) attributes {Kernel, forward_kernel_5} {
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
    %13 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %14 = llvm.insertvalue %arg1, %13[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %15 = llvm.insertvalue %arg1, %14[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %16 = llvm.mlir.constant(0 : index) : i64
    %17 = llvm.insertvalue %16, %15[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %18 = llvm.mlir.constant(12 : index) : i64
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
    %31 = llvm.mlir.constant(4 : index) : i64
    %32 = llvm.insertvalue %31, %30[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %33 = llvm.mlir.constant(3 : index) : i64
    %34 = llvm.insertvalue %33, %32[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %35 = llvm.mlir.constant(3 : index) : i64
    %36 = llvm.insertvalue %35, %34[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %37 = llvm.mlir.constant(1 : index) : i64
    %38 = llvm.insertvalue %37, %36[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %39 = llvm.mlir.constant(12 : index) : i64
    %40 = llvm.mlir.constant(3 : index) : i64
    %41 = llvm.mlir.constant(1 : index) : i64
    %42 = llvm.mlir.constant(4 : index) : i64
    %43 = llvm.mlir.constant(0 : index) : i64
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%43 : i64)
  ^bb2(%44: i64):  // 2 preds: ^bb1, ^bb9
    %45 = llvm.icmp "slt" %44, %42 : i64
    llvm.cond_br %45, ^bb3, ^bb10
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%43 : i64)
  ^bb4(%46: i64):  // 2 preds: ^bb3, ^bb8
    %47 = llvm.icmp "slt" %46, %40 : i64
    llvm.cond_br %47, ^bb5, ^bb9
  ^bb5:  // pred: ^bb4
    llvm.br ^bb6(%43 : i64)
  ^bb6(%48: i64):  // 2 preds: ^bb5, ^bb7
    %49 = llvm.icmp "slt" %48, %39 : i64
    llvm.cond_br %49, ^bb7, ^bb8
  ^bb7:  // pred: ^bb6
    %50 = llvm.extractvalue %12[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %51 = llvm.mlir.constant(12 : index) : i64
    %52 = llvm.mul %44, %51  : i64
    %53 = llvm.add %52, %48  : i64
    %54 = llvm.getelementptr %50[%53] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %55 = llvm.load %54 : !llvm.ptr<f32>
    %56 = llvm.extractvalue %25[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %57 = llvm.mlir.constant(3 : index) : i64
    %58 = llvm.mul %48, %57  : i64
    %59 = llvm.add %58, %46  : i64
    %60 = llvm.getelementptr %56[%59] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %61 = llvm.load %60 : !llvm.ptr<f32>
    %62 = llvm.extractvalue %38[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %63 = llvm.mlir.constant(3 : index) : i64
    %64 = llvm.mul %44, %63  : i64
    %65 = llvm.add %64, %46  : i64
    %66 = llvm.getelementptr %62[%65] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %67 = llvm.load %66 : !llvm.ptr<f32>
    %68 = llvm.fmul %55, %61  : f32
    %69 = llvm.fadd %67, %68  : f32
    %70 = llvm.extractvalue %38[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %71 = llvm.mlir.constant(3 : index) : i64
    %72 = llvm.mul %44, %71  : i64
    %73 = llvm.add %72, %46  : i64
    %74 = llvm.getelementptr %70[%73] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    llvm.store %69, %74 : !llvm.ptr<f32>
    %75 = llvm.add %48, %41  : i64
    llvm.br ^bb6(%75 : i64)
  ^bb8:  // pred: ^bb6
    %76 = llvm.add %46, %41  : i64
    llvm.br ^bb4(%76 : i64)
  ^bb9:  // pred: ^bb4
    %77 = llvm.add %44, %41  : i64
    llvm.br ^bb2(%77 : i64)
  ^bb10:  // pred: ^bb2
    llvm.return
  }
}

