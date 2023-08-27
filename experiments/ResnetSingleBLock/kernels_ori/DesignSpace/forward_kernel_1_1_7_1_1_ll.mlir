module attributes {llvm.data_layout = ""} {
  llvm.func @forward_kernel_1(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr, %arg3: !llvm.ptr, %arg4: !llvm.ptr, %arg5: !llvm.ptr) attributes {Kernel, forward_kernel_1} {
    %0 = llvm.mlir.constant(1.000000e-05 : f64) : f64
    %1 = llvm.mlir.constant(16 : index) : i64
    %2 = llvm.mlir.constant(7 : index) : i64
    %3 = llvm.mlir.constant(5.000000e-01 : f32) : f32
    %4 = llvm.mlir.constant(1 : i32) : i32
    %5 = llvm.mlir.constant(1597463007 : i32) : i32
    %6 = llvm.mlir.constant(1.500000e+00 : f32) : f32
    %7 = llvm.mlir.constant(2 : index) : i64
    %8 = llvm.mlir.constant(3 : index) : i64
    %9 = llvm.mlir.constant(4 : index) : i64
    %10 = llvm.mlir.constant(5 : index) : i64
    %11 = llvm.mlir.constant(6 : index) : i64
    %12 = llvm.mlir.constant(112 : index) : i64
    %13 = llvm.mlir.constant(12544 : index) : i64
    %14 = llvm.mlir.constant(802816 : index) : i64
    %15 = llvm.mlir.constant(1 : index) : i64
    %16 = llvm.mlir.constant(0 : index) : i64
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%16 : i64)
  ^bb2(%17: i64):  // 2 preds: ^bb1, ^bb6
    %18 = llvm.icmp "slt" %17, %1 : i64
    llvm.cond_br %18, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    %19 = llvm.load %arg0 : !llvm.ptr -> f32
    %20 = llvm.load %arg1 : !llvm.ptr -> f32
    %21 = llvm.load %arg2 : !llvm.ptr -> f32
    %22 = llvm.load %arg3 : !llvm.ptr -> f32
    llvm.br ^bb4(%16 : i64)
  ^bb4(%23: i64):  // 2 preds: ^bb3, ^bb5
    %24 = llvm.icmp "slt" %23, %12 : i64
    llvm.cond_br %24, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %25 = llvm.mul %16, %14  : i64
    %26 = llvm.mul %16, %13  : i64
    %27 = llvm.add %25, %26  : i64
    %28 = llvm.mul %17, %12  : i64
    %29 = llvm.add %27, %28  : i64
    %30 = llvm.add %29, %23  : i64
    %31 = llvm.getelementptr %arg4[%30] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %32 = llvm.load %31 : !llvm.ptr -> f32
    %33 = llvm.fptrunc %0 : f64 to f32
    %34 = llvm.fadd %22, %33  : f32
    %35 = llvm.fmul %34, %3  : f32
    %36 = llvm.bitcast %34 : f32 to i32
    %37 = llvm.lshr %36, %4  : i32
    %38 = llvm.sub %5, %37  : i32
    %39 = llvm.bitcast %38 : i32 to f32
    %40 = llvm.fmul %39, %39  : f32
    %41 = llvm.fmul %40, %35  : f32
    %42 = llvm.fsub %6, %41  : f32
    %43 = llvm.fmul %42, %40  : f32
    %44 = llvm.fsub %32, %21  : f32
    %45 = llvm.fmul %44, %43  : f32
    %46 = llvm.fmul %45, %19  : f32
    %47 = llvm.fadd %46, %20  : f32
    %48 = llvm.mul %16, %14  : i64
    %49 = llvm.mul %16, %13  : i64
    %50 = llvm.add %48, %49  : i64
    %51 = llvm.mul %17, %12  : i64
    %52 = llvm.add %50, %51  : i64
    %53 = llvm.add %52, %23  : i64
    %54 = llvm.getelementptr %arg5[%53] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %47, %54 : f32, !llvm.ptr
    %55 = llvm.add %23, %15  : i64
    %56 = llvm.mul %16, %14  : i64
    %57 = llvm.mul %16, %13  : i64
    %58 = llvm.add %56, %57  : i64
    %59 = llvm.mul %17, %12  : i64
    %60 = llvm.add %58, %59  : i64
    %61 = llvm.add %60, %55  : i64
    %62 = llvm.getelementptr %arg4[%61] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %63 = llvm.load %62 : !llvm.ptr -> f32
    %64 = llvm.fptrunc %0 : f64 to f32
    %65 = llvm.fadd %22, %64  : f32
    %66 = llvm.fmul %65, %3  : f32
    %67 = llvm.bitcast %65 : f32 to i32
    %68 = llvm.lshr %67, %4  : i32
    %69 = llvm.sub %5, %68  : i32
    %70 = llvm.bitcast %69 : i32 to f32
    %71 = llvm.fmul %70, %70  : f32
    %72 = llvm.fmul %71, %66  : f32
    %73 = llvm.fsub %6, %72  : f32
    %74 = llvm.fmul %73, %71  : f32
    %75 = llvm.fsub %63, %21  : f32
    %76 = llvm.fmul %75, %74  : f32
    %77 = llvm.fmul %76, %19  : f32
    %78 = llvm.fadd %77, %20  : f32
    %79 = llvm.mul %16, %14  : i64
    %80 = llvm.mul %16, %13  : i64
    %81 = llvm.add %79, %80  : i64
    %82 = llvm.mul %17, %12  : i64
    %83 = llvm.add %81, %82  : i64
    %84 = llvm.add %83, %55  : i64
    %85 = llvm.getelementptr %arg5[%84] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %78, %85 : f32, !llvm.ptr
    %86 = llvm.add %23, %7  : i64
    %87 = llvm.mul %16, %14  : i64
    %88 = llvm.mul %16, %13  : i64
    %89 = llvm.add %87, %88  : i64
    %90 = llvm.mul %17, %12  : i64
    %91 = llvm.add %89, %90  : i64
    %92 = llvm.add %91, %86  : i64
    %93 = llvm.getelementptr %arg4[%92] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %94 = llvm.load %93 : !llvm.ptr -> f32
    %95 = llvm.fptrunc %0 : f64 to f32
    %96 = llvm.fadd %22, %95  : f32
    %97 = llvm.fmul %96, %3  : f32
    %98 = llvm.bitcast %96 : f32 to i32
    %99 = llvm.lshr %98, %4  : i32
    %100 = llvm.sub %5, %99  : i32
    %101 = llvm.bitcast %100 : i32 to f32
    %102 = llvm.fmul %101, %101  : f32
    %103 = llvm.fmul %102, %97  : f32
    %104 = llvm.fsub %6, %103  : f32
    %105 = llvm.fmul %104, %102  : f32
    %106 = llvm.fsub %94, %21  : f32
    %107 = llvm.fmul %106, %105  : f32
    %108 = llvm.fmul %107, %19  : f32
    %109 = llvm.fadd %108, %20  : f32
    %110 = llvm.mul %16, %14  : i64
    %111 = llvm.mul %16, %13  : i64
    %112 = llvm.add %110, %111  : i64
    %113 = llvm.mul %17, %12  : i64
    %114 = llvm.add %112, %113  : i64
    %115 = llvm.add %114, %86  : i64
    %116 = llvm.getelementptr %arg5[%115] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %109, %116 : f32, !llvm.ptr
    %117 = llvm.add %23, %8  : i64
    %118 = llvm.mul %16, %14  : i64
    %119 = llvm.mul %16, %13  : i64
    %120 = llvm.add %118, %119  : i64
    %121 = llvm.mul %17, %12  : i64
    %122 = llvm.add %120, %121  : i64
    %123 = llvm.add %122, %117  : i64
    %124 = llvm.getelementptr %arg4[%123] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %125 = llvm.load %124 : !llvm.ptr -> f32
    %126 = llvm.fptrunc %0 : f64 to f32
    %127 = llvm.fadd %22, %126  : f32
    %128 = llvm.fmul %127, %3  : f32
    %129 = llvm.bitcast %127 : f32 to i32
    %130 = llvm.lshr %129, %4  : i32
    %131 = llvm.sub %5, %130  : i32
    %132 = llvm.bitcast %131 : i32 to f32
    %133 = llvm.fmul %132, %132  : f32
    %134 = llvm.fmul %133, %128  : f32
    %135 = llvm.fsub %6, %134  : f32
    %136 = llvm.fmul %135, %133  : f32
    %137 = llvm.fsub %125, %21  : f32
    %138 = llvm.fmul %137, %136  : f32
    %139 = llvm.fmul %138, %19  : f32
    %140 = llvm.fadd %139, %20  : f32
    %141 = llvm.mul %16, %14  : i64
    %142 = llvm.mul %16, %13  : i64
    %143 = llvm.add %141, %142  : i64
    %144 = llvm.mul %17, %12  : i64
    %145 = llvm.add %143, %144  : i64
    %146 = llvm.add %145, %117  : i64
    %147 = llvm.getelementptr %arg5[%146] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %140, %147 : f32, !llvm.ptr
    %148 = llvm.add %23, %9  : i64
    %149 = llvm.mul %16, %14  : i64
    %150 = llvm.mul %16, %13  : i64
    %151 = llvm.add %149, %150  : i64
    %152 = llvm.mul %17, %12  : i64
    %153 = llvm.add %151, %152  : i64
    %154 = llvm.add %153, %148  : i64
    %155 = llvm.getelementptr %arg4[%154] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %156 = llvm.load %155 : !llvm.ptr -> f32
    %157 = llvm.fptrunc %0 : f64 to f32
    %158 = llvm.fadd %22, %157  : f32
    %159 = llvm.fmul %158, %3  : f32
    %160 = llvm.bitcast %158 : f32 to i32
    %161 = llvm.lshr %160, %4  : i32
    %162 = llvm.sub %5, %161  : i32
    %163 = llvm.bitcast %162 : i32 to f32
    %164 = llvm.fmul %163, %163  : f32
    %165 = llvm.fmul %164, %159  : f32
    %166 = llvm.fsub %6, %165  : f32
    %167 = llvm.fmul %166, %164  : f32
    %168 = llvm.fsub %156, %21  : f32
    %169 = llvm.fmul %168, %167  : f32
    %170 = llvm.fmul %169, %19  : f32
    %171 = llvm.fadd %170, %20  : f32
    %172 = llvm.mul %16, %14  : i64
    %173 = llvm.mul %16, %13  : i64
    %174 = llvm.add %172, %173  : i64
    %175 = llvm.mul %17, %12  : i64
    %176 = llvm.add %174, %175  : i64
    %177 = llvm.add %176, %148  : i64
    %178 = llvm.getelementptr %arg5[%177] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %171, %178 : f32, !llvm.ptr
    %179 = llvm.add %23, %10  : i64
    %180 = llvm.mul %16, %14  : i64
    %181 = llvm.mul %16, %13  : i64
    %182 = llvm.add %180, %181  : i64
    %183 = llvm.mul %17, %12  : i64
    %184 = llvm.add %182, %183  : i64
    %185 = llvm.add %184, %179  : i64
    %186 = llvm.getelementptr %arg4[%185] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %187 = llvm.load %186 : !llvm.ptr -> f32
    %188 = llvm.fptrunc %0 : f64 to f32
    %189 = llvm.fadd %22, %188  : f32
    %190 = llvm.fmul %189, %3  : f32
    %191 = llvm.bitcast %189 : f32 to i32
    %192 = llvm.lshr %191, %4  : i32
    %193 = llvm.sub %5, %192  : i32
    %194 = llvm.bitcast %193 : i32 to f32
    %195 = llvm.fmul %194, %194  : f32
    %196 = llvm.fmul %195, %190  : f32
    %197 = llvm.fsub %6, %196  : f32
    %198 = llvm.fmul %197, %195  : f32
    %199 = llvm.fsub %187, %21  : f32
    %200 = llvm.fmul %199, %198  : f32
    %201 = llvm.fmul %200, %19  : f32
    %202 = llvm.fadd %201, %20  : f32
    %203 = llvm.mul %16, %14  : i64
    %204 = llvm.mul %16, %13  : i64
    %205 = llvm.add %203, %204  : i64
    %206 = llvm.mul %17, %12  : i64
    %207 = llvm.add %205, %206  : i64
    %208 = llvm.add %207, %179  : i64
    %209 = llvm.getelementptr %arg5[%208] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %202, %209 : f32, !llvm.ptr
    %210 = llvm.add %23, %11  : i64
    %211 = llvm.mul %16, %14  : i64
    %212 = llvm.mul %16, %13  : i64
    %213 = llvm.add %211, %212  : i64
    %214 = llvm.mul %17, %12  : i64
    %215 = llvm.add %213, %214  : i64
    %216 = llvm.add %215, %210  : i64
    %217 = llvm.getelementptr %arg4[%216] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %218 = llvm.load %217 : !llvm.ptr -> f32
    %219 = llvm.fptrunc %0 : f64 to f32
    %220 = llvm.fadd %22, %219  : f32
    %221 = llvm.fmul %220, %3  : f32
    %222 = llvm.bitcast %220 : f32 to i32
    %223 = llvm.lshr %222, %4  : i32
    %224 = llvm.sub %5, %223  : i32
    %225 = llvm.bitcast %224 : i32 to f32
    %226 = llvm.fmul %225, %225  : f32
    %227 = llvm.fmul %226, %221  : f32
    %228 = llvm.fsub %6, %227  : f32
    %229 = llvm.fmul %228, %226  : f32
    %230 = llvm.fsub %218, %21  : f32
    %231 = llvm.fmul %230, %229  : f32
    %232 = llvm.fmul %231, %19  : f32
    %233 = llvm.fadd %232, %20  : f32
    %234 = llvm.mul %16, %14  : i64
    %235 = llvm.mul %16, %13  : i64
    %236 = llvm.add %234, %235  : i64
    %237 = llvm.mul %17, %12  : i64
    %238 = llvm.add %236, %237  : i64
    %239 = llvm.add %238, %210  : i64
    %240 = llvm.getelementptr %arg5[%239] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %233, %240 : f32, !llvm.ptr
    %241 = llvm.add %23, %2  : i64
    llvm.br ^bb4(%241 : i64)
  ^bb6:  // pred: ^bb4
    %242 = llvm.add %17, %15  : i64
    llvm.br ^bb2(%242 : i64)
  ^bb7:  // pred: ^bb2
    llvm.return
  }
}

