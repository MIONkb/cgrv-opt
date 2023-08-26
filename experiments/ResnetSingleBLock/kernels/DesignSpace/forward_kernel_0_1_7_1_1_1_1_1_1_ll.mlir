module attributes {llvm.data_layout = ""} {
  llvm.func @forward_kernel_0(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr, %arg3: !llvm.ptr) attributes {Kernel, forward_kernel_0} {
    %0 = llvm.mlir.constant(8 : index) : i64
    %1 = llvm.mlir.constant(2 : index) : i64
    %2 = llvm.mlir.constant(4 : index) : i64
    %3 = llvm.mlir.constant(5 : index) : i64
    %4 = llvm.mlir.constant(6 : index) : i64
    %5 = llvm.mlir.constant(7 : index) : i64
    %6 = llvm.mlir.constant(49 : index) : i64
    %7 = llvm.mlir.constant(147 : index) : i64
    %8 = llvm.mlir.constant(230 : index) : i64
    %9 = llvm.mlir.constant(52900 : index) : i64
    %10 = llvm.mlir.constant(3 : index) : i64
    %11 = llvm.mlir.constant(158700 : index) : i64
    %12 = llvm.mlir.constant(112 : index) : i64
    %13 = llvm.mlir.constant(12544 : index) : i64
    %14 = llvm.mlir.constant(802816 : index) : i64
    %15 = llvm.mlir.constant(1 : index) : i64
    %16 = llvm.mlir.constant(0 : index) : i64
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%16 : i64)
  ^bb2(%17: i64):  // 2 preds: ^bb1, ^bb9
    %18 = llvm.icmp "slt" %17, %0 : i64
    llvm.cond_br %18, ^bb3, ^bb10
  ^bb3:  // pred: ^bb2
    %19 = llvm.mul %16, %14  : i64
    %20 = llvm.mul %16, %13  : i64
    %21 = llvm.add %19, %20  : i64
    %22 = llvm.mul %16, %12  : i64
    %23 = llvm.add %21, %22  : i64
    %24 = llvm.add %23, %17  : i64
    %25 = llvm.getelementptr %arg0[%24] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %26 = llvm.load %25 : !llvm.ptr -> f32
    llvm.br ^bb4(%16, %26 : i64, f32)
  ^bb4(%27: i64, %28: f32):  // 2 preds: ^bb3, ^bb8
    %29 = llvm.icmp "slt" %27, %10 : i64
    llvm.cond_br %29, ^bb5, ^bb9
  ^bb5:  // pred: ^bb4
    llvm.br ^bb6(%16, %28 : i64, f32)
  ^bb6(%30: i64, %31: f32):  // 2 preds: ^bb5, ^bb7
    %32 = llvm.icmp "slt" %30, %5 : i64
    llvm.cond_br %32, ^bb7, ^bb8
  ^bb7:  // pred: ^bb6
    %33 = llvm.mul %17, %1  : i64
    %34 = llvm.mul %16, %11  : i64
    %35 = llvm.mul %27, %9  : i64
    %36 = llvm.add %34, %35  : i64
    %37 = llvm.mul %30, %8  : i64
    %38 = llvm.add %36, %37  : i64
    %39 = llvm.add %38, %33  : i64
    %40 = llvm.getelementptr %arg1[%39] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %41 = llvm.load %40 : !llvm.ptr -> f32
    %42 = llvm.mul %16, %7  : i64
    %43 = llvm.mul %27, %6  : i64
    %44 = llvm.add %42, %43  : i64
    %45 = llvm.mul %30, %5  : i64
    %46 = llvm.add %44, %45  : i64
    %47 = llvm.add %46, %16  : i64
    %48 = llvm.getelementptr %arg2[%47] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %49 = llvm.load %48 : !llvm.ptr -> f32
    %50 = llvm.fmul %41, %49  : f32
    %51 = llvm.fadd %31, %50  : f32
    %52 = llvm.mul %17, %1  : i64
    %53 = llvm.add %52, %15  : i64
    %54 = llvm.mul %16, %11  : i64
    %55 = llvm.mul %27, %9  : i64
    %56 = llvm.add %54, %55  : i64
    %57 = llvm.mul %30, %8  : i64
    %58 = llvm.add %56, %57  : i64
    %59 = llvm.add %58, %53  : i64
    %60 = llvm.getelementptr %arg1[%59] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %61 = llvm.load %60 : !llvm.ptr -> f32
    %62 = llvm.mul %16, %7  : i64
    %63 = llvm.mul %27, %6  : i64
    %64 = llvm.add %62, %63  : i64
    %65 = llvm.mul %30, %5  : i64
    %66 = llvm.add %64, %65  : i64
    %67 = llvm.add %66, %15  : i64
    %68 = llvm.getelementptr %arg2[%67] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %69 = llvm.load %68 : !llvm.ptr -> f32
    %70 = llvm.fmul %61, %69  : f32
    %71 = llvm.fadd %51, %70  : f32
    %72 = llvm.mul %17, %1  : i64
    %73 = llvm.add %72, %1  : i64
    %74 = llvm.mul %16, %11  : i64
    %75 = llvm.mul %27, %9  : i64
    %76 = llvm.add %74, %75  : i64
    %77 = llvm.mul %30, %8  : i64
    %78 = llvm.add %76, %77  : i64
    %79 = llvm.add %78, %73  : i64
    %80 = llvm.getelementptr %arg1[%79] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %81 = llvm.load %80 : !llvm.ptr -> f32
    %82 = llvm.mul %16, %7  : i64
    %83 = llvm.mul %27, %6  : i64
    %84 = llvm.add %82, %83  : i64
    %85 = llvm.mul %30, %5  : i64
    %86 = llvm.add %84, %85  : i64
    %87 = llvm.add %86, %1  : i64
    %88 = llvm.getelementptr %arg2[%87] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %89 = llvm.load %88 : !llvm.ptr -> f32
    %90 = llvm.fmul %81, %89  : f32
    %91 = llvm.fadd %71, %90  : f32
    %92 = llvm.mul %17, %1  : i64
    %93 = llvm.add %92, %10  : i64
    %94 = llvm.mul %16, %11  : i64
    %95 = llvm.mul %27, %9  : i64
    %96 = llvm.add %94, %95  : i64
    %97 = llvm.mul %30, %8  : i64
    %98 = llvm.add %96, %97  : i64
    %99 = llvm.add %98, %93  : i64
    %100 = llvm.getelementptr %arg1[%99] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %101 = llvm.load %100 : !llvm.ptr -> f32
    %102 = llvm.mul %16, %7  : i64
    %103 = llvm.mul %27, %6  : i64
    %104 = llvm.add %102, %103  : i64
    %105 = llvm.mul %30, %5  : i64
    %106 = llvm.add %104, %105  : i64
    %107 = llvm.add %106, %10  : i64
    %108 = llvm.getelementptr %arg2[%107] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %109 = llvm.load %108 : !llvm.ptr -> f32
    %110 = llvm.fmul %101, %109  : f32
    %111 = llvm.fadd %91, %110  : f32
    %112 = llvm.mul %17, %1  : i64
    %113 = llvm.add %112, %2  : i64
    %114 = llvm.mul %16, %11  : i64
    %115 = llvm.mul %27, %9  : i64
    %116 = llvm.add %114, %115  : i64
    %117 = llvm.mul %30, %8  : i64
    %118 = llvm.add %116, %117  : i64
    %119 = llvm.add %118, %113  : i64
    %120 = llvm.getelementptr %arg1[%119] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %121 = llvm.load %120 : !llvm.ptr -> f32
    %122 = llvm.mul %16, %7  : i64
    %123 = llvm.mul %27, %6  : i64
    %124 = llvm.add %122, %123  : i64
    %125 = llvm.mul %30, %5  : i64
    %126 = llvm.add %124, %125  : i64
    %127 = llvm.add %126, %2  : i64
    %128 = llvm.getelementptr %arg2[%127] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %129 = llvm.load %128 : !llvm.ptr -> f32
    %130 = llvm.fmul %121, %129  : f32
    %131 = llvm.fadd %111, %130  : f32
    %132 = llvm.mul %17, %1  : i64
    %133 = llvm.add %132, %3  : i64
    %134 = llvm.mul %16, %11  : i64
    %135 = llvm.mul %27, %9  : i64
    %136 = llvm.add %134, %135  : i64
    %137 = llvm.mul %30, %8  : i64
    %138 = llvm.add %136, %137  : i64
    %139 = llvm.add %138, %133  : i64
    %140 = llvm.getelementptr %arg1[%139] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %141 = llvm.load %140 : !llvm.ptr -> f32
    %142 = llvm.mul %16, %7  : i64
    %143 = llvm.mul %27, %6  : i64
    %144 = llvm.add %142, %143  : i64
    %145 = llvm.mul %30, %5  : i64
    %146 = llvm.add %144, %145  : i64
    %147 = llvm.add %146, %3  : i64
    %148 = llvm.getelementptr %arg2[%147] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %149 = llvm.load %148 : !llvm.ptr -> f32
    %150 = llvm.fmul %141, %149  : f32
    %151 = llvm.fadd %131, %150  : f32
    %152 = llvm.mul %17, %1  : i64
    %153 = llvm.add %152, %4  : i64
    %154 = llvm.mul %16, %11  : i64
    %155 = llvm.mul %27, %9  : i64
    %156 = llvm.add %154, %155  : i64
    %157 = llvm.mul %30, %8  : i64
    %158 = llvm.add %156, %157  : i64
    %159 = llvm.add %158, %153  : i64
    %160 = llvm.getelementptr %arg1[%159] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %161 = llvm.load %160 : !llvm.ptr -> f32
    %162 = llvm.mul %16, %7  : i64
    %163 = llvm.mul %27, %6  : i64
    %164 = llvm.add %162, %163  : i64
    %165 = llvm.mul %30, %5  : i64
    %166 = llvm.add %164, %165  : i64
    %167 = llvm.add %166, %4  : i64
    %168 = llvm.getelementptr %arg2[%167] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %169 = llvm.load %168 : !llvm.ptr -> f32
    %170 = llvm.fmul %161, %169  : f32
    %171 = llvm.fadd %151, %170  : f32
    %172 = llvm.add %30, %15  : i64
    llvm.br ^bb6(%172, %171 : i64, f32)
  ^bb8:  // pred: ^bb6
    %173 = llvm.add %27, %15  : i64
    llvm.br ^bb4(%173, %31 : i64, f32)
  ^bb9:  // pred: ^bb4
    %174 = llvm.mul %16, %14  : i64
    %175 = llvm.mul %16, %13  : i64
    %176 = llvm.add %174, %175  : i64
    %177 = llvm.mul %16, %12  : i64
    %178 = llvm.add %176, %177  : i64
    %179 = llvm.add %178, %17  : i64
    %180 = llvm.getelementptr %arg3[%179] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %28, %180 : f32, !llvm.ptr
    %181 = llvm.add %17, %15  : i64
    llvm.br ^bb2(%181 : i64)
  ^bb10:  // pred: ^bb2
    llvm.return
  }
}

