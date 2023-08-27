module attributes {llvm.data_layout = ""} {
  llvm.func @forward_kernel_2(%arg0: !llvm.ptr, %arg1: !llvm.ptr) attributes {Kernel, forward_kernel_2} {
    %0 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    %1 = llvm.mlir.constant(16 : index) : i64
    %2 = llvm.mlir.constant(14 : index) : i64
    %3 = llvm.mlir.constant(2 : index) : i64
    %4 = llvm.mlir.constant(3 : index) : i64
    %5 = llvm.mlir.constant(4 : index) : i64
    %6 = llvm.mlir.constant(5 : index) : i64
    %7 = llvm.mlir.constant(6 : index) : i64
    %8 = llvm.mlir.constant(7 : index) : i64
    %9 = llvm.mlir.constant(8 : index) : i64
    %10 = llvm.mlir.constant(9 : index) : i64
    %11 = llvm.mlir.constant(10 : index) : i64
    %12 = llvm.mlir.constant(11 : index) : i64
    %13 = llvm.mlir.constant(12 : index) : i64
    %14 = llvm.mlir.constant(13 : index) : i64
    %15 = llvm.mlir.constant(112 : index) : i64
    %16 = llvm.mlir.constant(12544 : index) : i64
    %17 = llvm.mlir.constant(802816 : index) : i64
    %18 = llvm.mlir.constant(1 : index) : i64
    %19 = llvm.mlir.constant(0 : index) : i64
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%19 : i64)
  ^bb2(%20: i64):  // 2 preds: ^bb1, ^bb6
    %21 = llvm.icmp "slt" %20, %1 : i64
    llvm.cond_br %21, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%19 : i64)
  ^bb4(%22: i64):  // 2 preds: ^bb3, ^bb5
    %23 = llvm.icmp "slt" %22, %15 : i64
    llvm.cond_br %23, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %24 = llvm.mul %19, %17  : i64
    %25 = llvm.mul %19, %16  : i64
    %26 = llvm.add %24, %25  : i64
    %27 = llvm.mul %20, %15  : i64
    %28 = llvm.add %26, %27  : i64
    %29 = llvm.add %28, %22  : i64
    %30 = llvm.getelementptr %arg0[%29] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %31 = llvm.load %30 : !llvm.ptr -> f32
    %32 = llvm.fcmp "ugt" %31, %0 : f32
    %33 = llvm.select %32, %31, %0 : i1, f32
    %34 = llvm.mul %19, %17  : i64
    %35 = llvm.mul %19, %16  : i64
    %36 = llvm.add %34, %35  : i64
    %37 = llvm.mul %20, %15  : i64
    %38 = llvm.add %36, %37  : i64
    %39 = llvm.add %38, %22  : i64
    %40 = llvm.getelementptr %arg1[%39] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %33, %40 : f32, !llvm.ptr
    %41 = llvm.add %22, %18  : i64
    %42 = llvm.mul %19, %17  : i64
    %43 = llvm.mul %19, %16  : i64
    %44 = llvm.add %42, %43  : i64
    %45 = llvm.mul %20, %15  : i64
    %46 = llvm.add %44, %45  : i64
    %47 = llvm.add %46, %41  : i64
    %48 = llvm.getelementptr %arg0[%47] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %49 = llvm.load %48 : !llvm.ptr -> f32
    %50 = llvm.fcmp "ugt" %49, %0 : f32
    %51 = llvm.select %50, %49, %0 : i1, f32
    %52 = llvm.mul %19, %17  : i64
    %53 = llvm.mul %19, %16  : i64
    %54 = llvm.add %52, %53  : i64
    %55 = llvm.mul %20, %15  : i64
    %56 = llvm.add %54, %55  : i64
    %57 = llvm.add %56, %41  : i64
    %58 = llvm.getelementptr %arg1[%57] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %51, %58 : f32, !llvm.ptr
    %59 = llvm.add %22, %3  : i64
    %60 = llvm.mul %19, %17  : i64
    %61 = llvm.mul %19, %16  : i64
    %62 = llvm.add %60, %61  : i64
    %63 = llvm.mul %20, %15  : i64
    %64 = llvm.add %62, %63  : i64
    %65 = llvm.add %64, %59  : i64
    %66 = llvm.getelementptr %arg0[%65] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %67 = llvm.load %66 : !llvm.ptr -> f32
    %68 = llvm.fcmp "ugt" %67, %0 : f32
    %69 = llvm.select %68, %67, %0 : i1, f32
    %70 = llvm.mul %19, %17  : i64
    %71 = llvm.mul %19, %16  : i64
    %72 = llvm.add %70, %71  : i64
    %73 = llvm.mul %20, %15  : i64
    %74 = llvm.add %72, %73  : i64
    %75 = llvm.add %74, %59  : i64
    %76 = llvm.getelementptr %arg1[%75] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %69, %76 : f32, !llvm.ptr
    %77 = llvm.add %22, %4  : i64
    %78 = llvm.mul %19, %17  : i64
    %79 = llvm.mul %19, %16  : i64
    %80 = llvm.add %78, %79  : i64
    %81 = llvm.mul %20, %15  : i64
    %82 = llvm.add %80, %81  : i64
    %83 = llvm.add %82, %77  : i64
    %84 = llvm.getelementptr %arg0[%83] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %85 = llvm.load %84 : !llvm.ptr -> f32
    %86 = llvm.fcmp "ugt" %85, %0 : f32
    %87 = llvm.select %86, %85, %0 : i1, f32
    %88 = llvm.mul %19, %17  : i64
    %89 = llvm.mul %19, %16  : i64
    %90 = llvm.add %88, %89  : i64
    %91 = llvm.mul %20, %15  : i64
    %92 = llvm.add %90, %91  : i64
    %93 = llvm.add %92, %77  : i64
    %94 = llvm.getelementptr %arg1[%93] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %87, %94 : f32, !llvm.ptr
    %95 = llvm.add %22, %5  : i64
    %96 = llvm.mul %19, %17  : i64
    %97 = llvm.mul %19, %16  : i64
    %98 = llvm.add %96, %97  : i64
    %99 = llvm.mul %20, %15  : i64
    %100 = llvm.add %98, %99  : i64
    %101 = llvm.add %100, %95  : i64
    %102 = llvm.getelementptr %arg0[%101] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %103 = llvm.load %102 : !llvm.ptr -> f32
    %104 = llvm.fcmp "ugt" %103, %0 : f32
    %105 = llvm.select %104, %103, %0 : i1, f32
    %106 = llvm.mul %19, %17  : i64
    %107 = llvm.mul %19, %16  : i64
    %108 = llvm.add %106, %107  : i64
    %109 = llvm.mul %20, %15  : i64
    %110 = llvm.add %108, %109  : i64
    %111 = llvm.add %110, %95  : i64
    %112 = llvm.getelementptr %arg1[%111] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %105, %112 : f32, !llvm.ptr
    %113 = llvm.add %22, %6  : i64
    %114 = llvm.mul %19, %17  : i64
    %115 = llvm.mul %19, %16  : i64
    %116 = llvm.add %114, %115  : i64
    %117 = llvm.mul %20, %15  : i64
    %118 = llvm.add %116, %117  : i64
    %119 = llvm.add %118, %113  : i64
    %120 = llvm.getelementptr %arg0[%119] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %121 = llvm.load %120 : !llvm.ptr -> f32
    %122 = llvm.fcmp "ugt" %121, %0 : f32
    %123 = llvm.select %122, %121, %0 : i1, f32
    %124 = llvm.mul %19, %17  : i64
    %125 = llvm.mul %19, %16  : i64
    %126 = llvm.add %124, %125  : i64
    %127 = llvm.mul %20, %15  : i64
    %128 = llvm.add %126, %127  : i64
    %129 = llvm.add %128, %113  : i64
    %130 = llvm.getelementptr %arg1[%129] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %123, %130 : f32, !llvm.ptr
    %131 = llvm.add %22, %7  : i64
    %132 = llvm.mul %19, %17  : i64
    %133 = llvm.mul %19, %16  : i64
    %134 = llvm.add %132, %133  : i64
    %135 = llvm.mul %20, %15  : i64
    %136 = llvm.add %134, %135  : i64
    %137 = llvm.add %136, %131  : i64
    %138 = llvm.getelementptr %arg0[%137] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %139 = llvm.load %138 : !llvm.ptr -> f32
    %140 = llvm.fcmp "ugt" %139, %0 : f32
    %141 = llvm.select %140, %139, %0 : i1, f32
    %142 = llvm.mul %19, %17  : i64
    %143 = llvm.mul %19, %16  : i64
    %144 = llvm.add %142, %143  : i64
    %145 = llvm.mul %20, %15  : i64
    %146 = llvm.add %144, %145  : i64
    %147 = llvm.add %146, %131  : i64
    %148 = llvm.getelementptr %arg1[%147] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %141, %148 : f32, !llvm.ptr
    %149 = llvm.add %22, %8  : i64
    %150 = llvm.mul %19, %17  : i64
    %151 = llvm.mul %19, %16  : i64
    %152 = llvm.add %150, %151  : i64
    %153 = llvm.mul %20, %15  : i64
    %154 = llvm.add %152, %153  : i64
    %155 = llvm.add %154, %149  : i64
    %156 = llvm.getelementptr %arg0[%155] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %157 = llvm.load %156 : !llvm.ptr -> f32
    %158 = llvm.fcmp "ugt" %157, %0 : f32
    %159 = llvm.select %158, %157, %0 : i1, f32
    %160 = llvm.mul %19, %17  : i64
    %161 = llvm.mul %19, %16  : i64
    %162 = llvm.add %160, %161  : i64
    %163 = llvm.mul %20, %15  : i64
    %164 = llvm.add %162, %163  : i64
    %165 = llvm.add %164, %149  : i64
    %166 = llvm.getelementptr %arg1[%165] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %159, %166 : f32, !llvm.ptr
    %167 = llvm.add %22, %9  : i64
    %168 = llvm.mul %19, %17  : i64
    %169 = llvm.mul %19, %16  : i64
    %170 = llvm.add %168, %169  : i64
    %171 = llvm.mul %20, %15  : i64
    %172 = llvm.add %170, %171  : i64
    %173 = llvm.add %172, %167  : i64
    %174 = llvm.getelementptr %arg0[%173] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %175 = llvm.load %174 : !llvm.ptr -> f32
    %176 = llvm.fcmp "ugt" %175, %0 : f32
    %177 = llvm.select %176, %175, %0 : i1, f32
    %178 = llvm.mul %19, %17  : i64
    %179 = llvm.mul %19, %16  : i64
    %180 = llvm.add %178, %179  : i64
    %181 = llvm.mul %20, %15  : i64
    %182 = llvm.add %180, %181  : i64
    %183 = llvm.add %182, %167  : i64
    %184 = llvm.getelementptr %arg1[%183] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %177, %184 : f32, !llvm.ptr
    %185 = llvm.add %22, %10  : i64
    %186 = llvm.mul %19, %17  : i64
    %187 = llvm.mul %19, %16  : i64
    %188 = llvm.add %186, %187  : i64
    %189 = llvm.mul %20, %15  : i64
    %190 = llvm.add %188, %189  : i64
    %191 = llvm.add %190, %185  : i64
    %192 = llvm.getelementptr %arg0[%191] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %193 = llvm.load %192 : !llvm.ptr -> f32
    %194 = llvm.fcmp "ugt" %193, %0 : f32
    %195 = llvm.select %194, %193, %0 : i1, f32
    %196 = llvm.mul %19, %17  : i64
    %197 = llvm.mul %19, %16  : i64
    %198 = llvm.add %196, %197  : i64
    %199 = llvm.mul %20, %15  : i64
    %200 = llvm.add %198, %199  : i64
    %201 = llvm.add %200, %185  : i64
    %202 = llvm.getelementptr %arg1[%201] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %195, %202 : f32, !llvm.ptr
    %203 = llvm.add %22, %11  : i64
    %204 = llvm.mul %19, %17  : i64
    %205 = llvm.mul %19, %16  : i64
    %206 = llvm.add %204, %205  : i64
    %207 = llvm.mul %20, %15  : i64
    %208 = llvm.add %206, %207  : i64
    %209 = llvm.add %208, %203  : i64
    %210 = llvm.getelementptr %arg0[%209] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %211 = llvm.load %210 : !llvm.ptr -> f32
    %212 = llvm.fcmp "ugt" %211, %0 : f32
    %213 = llvm.select %212, %211, %0 : i1, f32
    %214 = llvm.mul %19, %17  : i64
    %215 = llvm.mul %19, %16  : i64
    %216 = llvm.add %214, %215  : i64
    %217 = llvm.mul %20, %15  : i64
    %218 = llvm.add %216, %217  : i64
    %219 = llvm.add %218, %203  : i64
    %220 = llvm.getelementptr %arg1[%219] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %213, %220 : f32, !llvm.ptr
    %221 = llvm.add %22, %12  : i64
    %222 = llvm.mul %19, %17  : i64
    %223 = llvm.mul %19, %16  : i64
    %224 = llvm.add %222, %223  : i64
    %225 = llvm.mul %20, %15  : i64
    %226 = llvm.add %224, %225  : i64
    %227 = llvm.add %226, %221  : i64
    %228 = llvm.getelementptr %arg0[%227] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %229 = llvm.load %228 : !llvm.ptr -> f32
    %230 = llvm.fcmp "ugt" %229, %0 : f32
    %231 = llvm.select %230, %229, %0 : i1, f32
    %232 = llvm.mul %19, %17  : i64
    %233 = llvm.mul %19, %16  : i64
    %234 = llvm.add %232, %233  : i64
    %235 = llvm.mul %20, %15  : i64
    %236 = llvm.add %234, %235  : i64
    %237 = llvm.add %236, %221  : i64
    %238 = llvm.getelementptr %arg1[%237] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %231, %238 : f32, !llvm.ptr
    %239 = llvm.add %22, %13  : i64
    %240 = llvm.mul %19, %17  : i64
    %241 = llvm.mul %19, %16  : i64
    %242 = llvm.add %240, %241  : i64
    %243 = llvm.mul %20, %15  : i64
    %244 = llvm.add %242, %243  : i64
    %245 = llvm.add %244, %239  : i64
    %246 = llvm.getelementptr %arg0[%245] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %247 = llvm.load %246 : !llvm.ptr -> f32
    %248 = llvm.fcmp "ugt" %247, %0 : f32
    %249 = llvm.select %248, %247, %0 : i1, f32
    %250 = llvm.mul %19, %17  : i64
    %251 = llvm.mul %19, %16  : i64
    %252 = llvm.add %250, %251  : i64
    %253 = llvm.mul %20, %15  : i64
    %254 = llvm.add %252, %253  : i64
    %255 = llvm.add %254, %239  : i64
    %256 = llvm.getelementptr %arg1[%255] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %249, %256 : f32, !llvm.ptr
    %257 = llvm.add %22, %14  : i64
    %258 = llvm.mul %19, %17  : i64
    %259 = llvm.mul %19, %16  : i64
    %260 = llvm.add %258, %259  : i64
    %261 = llvm.mul %20, %15  : i64
    %262 = llvm.add %260, %261  : i64
    %263 = llvm.add %262, %257  : i64
    %264 = llvm.getelementptr %arg0[%263] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %265 = llvm.load %264 : !llvm.ptr -> f32
    %266 = llvm.fcmp "ugt" %265, %0 : f32
    %267 = llvm.select %266, %265, %0 : i1, f32
    %268 = llvm.mul %19, %17  : i64
    %269 = llvm.mul %19, %16  : i64
    %270 = llvm.add %268, %269  : i64
    %271 = llvm.mul %20, %15  : i64
    %272 = llvm.add %270, %271  : i64
    %273 = llvm.add %272, %257  : i64
    %274 = llvm.getelementptr %arg1[%273] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %267, %274 : f32, !llvm.ptr
    %275 = llvm.add %22, %2  : i64
    llvm.br ^bb4(%275 : i64)
  ^bb6:  // pred: ^bb4
    %276 = llvm.add %20, %18  : i64
    llvm.br ^bb2(%276 : i64)
  ^bb7:  // pred: ^bb2
    llvm.return
  }
}

