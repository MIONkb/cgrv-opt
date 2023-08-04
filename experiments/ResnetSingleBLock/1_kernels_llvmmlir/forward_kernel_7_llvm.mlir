module attributes {llvm.data_layout = ""} {
  llvm.func @forward_kernel_7(%arg0: !llvm.ptr, %arg1: !llvm.ptr) attributes {Kernel, forward_kernel_7} {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %5 = llvm.mlir.constant(1 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %7 = llvm.mlir.constant(200704 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %9 = llvm.mlir.constant(64 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %11 = llvm.mlir.constant(3136 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %13 = llvm.mlir.constant(56 : index) : i64
    %14 = llvm.insertvalue %13, %12[3, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %15 = llvm.mlir.constant(56 : index) : i64
    %16 = llvm.insertvalue %15, %14[4, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %17 = llvm.mlir.constant(56 : index) : i64
    %18 = llvm.insertvalue %17, %16[3, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %19 = llvm.mlir.constant(1 : index) : i64
    %20 = llvm.insertvalue %19, %18[4, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %21 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %22 = llvm.insertvalue %arg1, %21[0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %23 = llvm.insertvalue %arg1, %22[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %24 = llvm.mlir.constant(0 : index) : i64
    %25 = llvm.insertvalue %24, %23[2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %26 = llvm.mlir.constant(1 : index) : i64
    %27 = llvm.insertvalue %26, %25[3, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %28 = llvm.mlir.constant(831744 : index) : i64
    %29 = llvm.insertvalue %28, %27[4, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %30 = llvm.mlir.constant(64 : index) : i64
    %31 = llvm.insertvalue %30, %29[3, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %32 = llvm.mlir.constant(12996 : index) : i64
    %33 = llvm.insertvalue %32, %31[4, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %34 = llvm.mlir.constant(114 : index) : i64
    %35 = llvm.insertvalue %34, %33[3, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %36 = llvm.mlir.constant(114 : index) : i64
    %37 = llvm.insertvalue %36, %35[4, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %38 = llvm.mlir.constant(114 : index) : i64
    %39 = llvm.insertvalue %38, %37[3, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %40 = llvm.mlir.constant(1 : index) : i64
    %41 = llvm.insertvalue %40, %39[4, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %42 = llvm.mlir.constant(2 : index) : i64
    %43 = llvm.mlir.constant(3 : index) : i64
    %44 = llvm.mlir.constant(56 : index) : i64
    %45 = llvm.mlir.constant(64 : index) : i64
    %46 = llvm.mlir.constant(1 : index) : i64
    %47 = llvm.mlir.constant(0 : index) : i64
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%47 : i64)
  ^bb2(%48: i64):  // 2 preds: ^bb1, ^bb18
    %49 = llvm.icmp "slt" %48, %46 : i64
    llvm.cond_br %49, ^bb3, ^bb19
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%47 : i64)
  ^bb4(%50: i64):  // 2 preds: ^bb3, ^bb17
    %51 = llvm.icmp "slt" %50, %45 : i64
    llvm.cond_br %51, ^bb5, ^bb18
  ^bb5:  // pred: ^bb4
    llvm.br ^bb6(%47 : i64)
  ^bb6(%52: i64):  // 2 preds: ^bb5, ^bb16
    %53 = llvm.icmp "slt" %52, %44 : i64
    llvm.cond_br %53, ^bb7, ^bb17
  ^bb7:  // pred: ^bb6
    llvm.br ^bb8(%47 : i64)
  ^bb8(%54: i64):  // 2 preds: ^bb7, ^bb15
    %55 = llvm.icmp "slt" %54, %44 : i64
    llvm.cond_br %55, ^bb9, ^bb16
  ^bb9:  // pred: ^bb8
    %56 = llvm.extractvalue %20[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %57 = llvm.mlir.constant(200704 : index) : i64
    %58 = llvm.mul %48, %57  : i64
    %59 = llvm.mlir.constant(3136 : index) : i64
    %60 = llvm.mul %50, %59  : i64
    %61 = llvm.add %58, %60  : i64
    %62 = llvm.mlir.constant(56 : index) : i64
    %63 = llvm.mul %52, %62  : i64
    %64 = llvm.add %61, %63  : i64
    %65 = llvm.add %64, %54  : i64
    %66 = llvm.getelementptr %56[%65] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %67 = llvm.load %66 : !llvm.ptr -> f32
    llvm.br ^bb10(%47, %67 : i64, f32)
  ^bb10(%68: i64, %69: f32):  // 2 preds: ^bb9, ^bb14
    %70 = llvm.icmp "slt" %68, %43 : i64
    llvm.cond_br %70, ^bb11, ^bb15
  ^bb11:  // pred: ^bb10
    llvm.br ^bb12(%47, %69 : i64, f32)
  ^bb12(%71: i64, %72: f32):  // 2 preds: ^bb11, ^bb13
    %73 = llvm.icmp "slt" %71, %43 : i64
    llvm.cond_br %73, ^bb13, ^bb14
  ^bb13:  // pred: ^bb12
    %74 = llvm.mul %52, %42  : i64
    %75 = llvm.add %74, %68  : i64
    %76 = llvm.mul %54, %42  : i64
    %77 = llvm.add %76, %71  : i64
    %78 = llvm.extractvalue %41[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %79 = llvm.mlir.constant(831744 : index) : i64
    %80 = llvm.mul %48, %79  : i64
    %81 = llvm.mlir.constant(12996 : index) : i64
    %82 = llvm.mul %50, %81  : i64
    %83 = llvm.add %80, %82  : i64
    %84 = llvm.mlir.constant(114 : index) : i64
    %85 = llvm.mul %75, %84  : i64
    %86 = llvm.add %83, %85  : i64
    %87 = llvm.add %86, %77  : i64
    %88 = llvm.getelementptr %78[%87] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %89 = llvm.load %88 : !llvm.ptr -> f32
    %90 = llvm.fcmp "ugt" %72, %89 : f32
    %91 = llvm.select %90, %72, %89 : i1, f32
    %92 = llvm.fcmp "uno" %89, %89 : f32
    %93 = llvm.select %92, %89, %91 : i1, f32
    %94 = llvm.add %71, %46  : i64
    llvm.br ^bb12(%94, %93 : i64, f32)
  ^bb14:  // pred: ^bb12
    %95 = llvm.add %68, %46  : i64
    llvm.br ^bb10(%95, %72 : i64, f32)
  ^bb15:  // pred: ^bb10
    %96 = llvm.extractvalue %20[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %97 = llvm.mlir.constant(200704 : index) : i64
    %98 = llvm.mul %48, %97  : i64
    %99 = llvm.mlir.constant(3136 : index) : i64
    %100 = llvm.mul %50, %99  : i64
    %101 = llvm.add %98, %100  : i64
    %102 = llvm.mlir.constant(56 : index) : i64
    %103 = llvm.mul %52, %102  : i64
    %104 = llvm.add %101, %103  : i64
    %105 = llvm.add %104, %54  : i64
    %106 = llvm.getelementptr %96[%105] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %69, %106 : f32, !llvm.ptr
    %107 = llvm.add %54, %46  : i64
    llvm.br ^bb8(%107 : i64)
  ^bb16:  // pred: ^bb8
    %108 = llvm.add %52, %46  : i64
    llvm.br ^bb6(%108 : i64)
  ^bb17:  // pred: ^bb6
    %109 = llvm.add %50, %46  : i64
    llvm.br ^bb4(%109 : i64)
  ^bb18:  // pred: ^bb4
    %110 = llvm.add %48, %46  : i64
    llvm.br ^bb2(%110 : i64)
  ^bb19:  // pred: ^bb2
    llvm.return
  }
}

