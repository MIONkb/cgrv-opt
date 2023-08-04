module attributes {llvm.data_layout = ""} {
  llvm.func @forward_kernel_2(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr) attributes {Kernel, forward_kernel_2} {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %5 = llvm.mlir.constant(1 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %7 = llvm.mlir.constant(802816 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %9 = llvm.mlir.constant(64 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %11 = llvm.mlir.constant(12544 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %13 = llvm.mlir.constant(112 : index) : i64
    %14 = llvm.insertvalue %13, %12[3, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %15 = llvm.mlir.constant(112 : index) : i64
    %16 = llvm.insertvalue %15, %14[4, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %17 = llvm.mlir.constant(112 : index) : i64
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
    %28 = llvm.mlir.constant(158700 : index) : i64
    %29 = llvm.insertvalue %28, %27[4, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %30 = llvm.mlir.constant(3 : index) : i64
    %31 = llvm.insertvalue %30, %29[3, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %32 = llvm.mlir.constant(52900 : index) : i64
    %33 = llvm.insertvalue %32, %31[4, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %34 = llvm.mlir.constant(230 : index) : i64
    %35 = llvm.insertvalue %34, %33[3, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %36 = llvm.mlir.constant(230 : index) : i64
    %37 = llvm.insertvalue %36, %35[4, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %38 = llvm.mlir.constant(230 : index) : i64
    %39 = llvm.insertvalue %38, %37[3, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %40 = llvm.mlir.constant(1 : index) : i64
    %41 = llvm.insertvalue %40, %39[4, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %42 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %43 = llvm.insertvalue %arg2, %42[0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %44 = llvm.insertvalue %arg2, %43[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %45 = llvm.mlir.constant(0 : index) : i64
    %46 = llvm.insertvalue %45, %44[2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %47 = llvm.mlir.constant(64 : index) : i64
    %48 = llvm.insertvalue %47, %46[3, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %49 = llvm.mlir.constant(147 : index) : i64
    %50 = llvm.insertvalue %49, %48[4, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %51 = llvm.mlir.constant(3 : index) : i64
    %52 = llvm.insertvalue %51, %50[3, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %53 = llvm.mlir.constant(49 : index) : i64
    %54 = llvm.insertvalue %53, %52[4, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %55 = llvm.mlir.constant(7 : index) : i64
    %56 = llvm.insertvalue %55, %54[3, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %57 = llvm.mlir.constant(7 : index) : i64
    %58 = llvm.insertvalue %57, %56[4, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %59 = llvm.mlir.constant(7 : index) : i64
    %60 = llvm.insertvalue %59, %58[3, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %61 = llvm.mlir.constant(1 : index) : i64
    %62 = llvm.insertvalue %61, %60[4, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %63 = llvm.mlir.constant(2 : index) : i64
    %64 = llvm.mlir.constant(7 : index) : i64
    %65 = llvm.mlir.constant(3 : index) : i64
    %66 = llvm.mlir.constant(112 : index) : i64
    %67 = llvm.mlir.constant(64 : index) : i64
    %68 = llvm.mlir.constant(1 : index) : i64
    %69 = llvm.mlir.constant(0 : index) : i64
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%69 : i64)
  ^bb2(%70: i64):  // 2 preds: ^bb1, ^bb21
    %71 = llvm.icmp "slt" %70, %68 : i64
    llvm.cond_br %71, ^bb3, ^bb22
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%69 : i64)
  ^bb4(%72: i64):  // 2 preds: ^bb3, ^bb20
    %73 = llvm.icmp "slt" %72, %67 : i64
    llvm.cond_br %73, ^bb5, ^bb21
  ^bb5:  // pred: ^bb4
    llvm.br ^bb6(%69 : i64)
  ^bb6(%74: i64):  // 2 preds: ^bb5, ^bb19
    %75 = llvm.icmp "slt" %74, %66 : i64
    llvm.cond_br %75, ^bb7, ^bb20
  ^bb7:  // pred: ^bb6
    llvm.br ^bb8(%69 : i64)
  ^bb8(%76: i64):  // 2 preds: ^bb7, ^bb18
    %77 = llvm.icmp "slt" %76, %66 : i64
    llvm.cond_br %77, ^bb9, ^bb19
  ^bb9:  // pred: ^bb8
    %78 = llvm.extractvalue %20[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %79 = llvm.mlir.constant(802816 : index) : i64
    %80 = llvm.mul %70, %79  : i64
    %81 = llvm.mlir.constant(12544 : index) : i64
    %82 = llvm.mul %72, %81  : i64
    %83 = llvm.add %80, %82  : i64
    %84 = llvm.mlir.constant(112 : index) : i64
    %85 = llvm.mul %74, %84  : i64
    %86 = llvm.add %83, %85  : i64
    %87 = llvm.add %86, %76  : i64
    %88 = llvm.getelementptr %78[%87] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %89 = llvm.load %88 : !llvm.ptr -> f32
    llvm.br ^bb10(%69, %89 : i64, f32)
  ^bb10(%90: i64, %91: f32):  // 2 preds: ^bb9, ^bb17
    %92 = llvm.icmp "slt" %90, %65 : i64
    llvm.cond_br %92, ^bb11, ^bb18
  ^bb11:  // pred: ^bb10
    llvm.br ^bb12(%69, %91 : i64, f32)
  ^bb12(%93: i64, %94: f32):  // 2 preds: ^bb11, ^bb16
    %95 = llvm.icmp "slt" %93, %64 : i64
    llvm.cond_br %95, ^bb13, ^bb17
  ^bb13:  // pred: ^bb12
    llvm.br ^bb14(%69, %94 : i64, f32)
  ^bb14(%96: i64, %97: f32):  // 2 preds: ^bb13, ^bb15
    %98 = llvm.icmp "slt" %96, %64 : i64
    llvm.cond_br %98, ^bb15, ^bb16
  ^bb15:  // pred: ^bb14
    %99 = llvm.mul %74, %63  : i64
    %100 = llvm.add %99, %93  : i64
    %101 = llvm.mul %76, %63  : i64
    %102 = llvm.add %101, %96  : i64
    %103 = llvm.extractvalue %41[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %104 = llvm.mlir.constant(158700 : index) : i64
    %105 = llvm.mul %70, %104  : i64
    %106 = llvm.mlir.constant(52900 : index) : i64
    %107 = llvm.mul %90, %106  : i64
    %108 = llvm.add %105, %107  : i64
    %109 = llvm.mlir.constant(230 : index) : i64
    %110 = llvm.mul %100, %109  : i64
    %111 = llvm.add %108, %110  : i64
    %112 = llvm.add %111, %102  : i64
    %113 = llvm.getelementptr %103[%112] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %114 = llvm.load %113 : !llvm.ptr -> f32
    %115 = llvm.extractvalue %62[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %116 = llvm.mlir.constant(147 : index) : i64
    %117 = llvm.mul %72, %116  : i64
    %118 = llvm.mlir.constant(49 : index) : i64
    %119 = llvm.mul %90, %118  : i64
    %120 = llvm.add %117, %119  : i64
    %121 = llvm.mlir.constant(7 : index) : i64
    %122 = llvm.mul %93, %121  : i64
    %123 = llvm.add %120, %122  : i64
    %124 = llvm.add %123, %96  : i64
    %125 = llvm.getelementptr %115[%124] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %126 = llvm.load %125 : !llvm.ptr -> f32
    %127 = llvm.fmul %114, %126  : f32
    %128 = llvm.fadd %97, %127  : f32
    %129 = llvm.add %96, %68  : i64
    llvm.br ^bb14(%129, %128 : i64, f32)
  ^bb16:  // pred: ^bb14
    %130 = llvm.add %93, %68  : i64
    llvm.br ^bb12(%130, %97 : i64, f32)
  ^bb17:  // pred: ^bb12
    %131 = llvm.add %90, %68  : i64
    llvm.br ^bb10(%131, %94 : i64, f32)
  ^bb18:  // pred: ^bb10
    %132 = llvm.extractvalue %20[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %133 = llvm.mlir.constant(802816 : index) : i64
    %134 = llvm.mul %70, %133  : i64
    %135 = llvm.mlir.constant(12544 : index) : i64
    %136 = llvm.mul %72, %135  : i64
    %137 = llvm.add %134, %136  : i64
    %138 = llvm.mlir.constant(112 : index) : i64
    %139 = llvm.mul %74, %138  : i64
    %140 = llvm.add %137, %139  : i64
    %141 = llvm.add %140, %76  : i64
    %142 = llvm.getelementptr %132[%141] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %91, %142 : f32, !llvm.ptr
    %143 = llvm.add %76, %68  : i64
    llvm.br ^bb8(%143 : i64)
  ^bb19:  // pred: ^bb8
    %144 = llvm.add %74, %68  : i64
    llvm.br ^bb6(%144 : i64)
  ^bb20:  // pred: ^bb6
    %145 = llvm.add %72, %68  : i64
    llvm.br ^bb4(%145 : i64)
  ^bb21:  // pred: ^bb4
    %146 = llvm.add %70, %68  : i64
    llvm.br ^bb2(%146 : i64)
  ^bb22:  // pred: ^bb2
    llvm.return
  }
}

