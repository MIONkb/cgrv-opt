module attributes {llvm.data_layout = ""} {
  llvm.func @forward_kernel_1(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr, %arg3: !llvm.ptr, %arg4: !llvm.ptr, %arg5: !llvm.ptr) attributes {Kernel, forward_kernel_1} {
    %0 = llvm.mlir.constant(1.000000e-05 : f64) : f64
    %1 = llvm.mlir.constant(16 : index) : i64
    %2 = llvm.mlir.constant(28 : index) : i64
    %3 = llvm.mlir.constant(5.000000e-01 : f32) : f32
    %4 = llvm.mlir.constant(1 : i32) : i32
    %5 = llvm.mlir.constant(1597463007 : i32) : i32
    %6 = llvm.mlir.constant(1.500000e+00 : f32) : f32
    %7 = llvm.mlir.constant(2 : index) : i64
    %8 = llvm.mlir.constant(3 : index) : i64
    %9 = llvm.mlir.constant(4 : index) : i64
    %10 = llvm.mlir.constant(5 : index) : i64
    %11 = llvm.mlir.constant(6 : index) : i64
    %12 = llvm.mlir.constant(7 : index) : i64
    %13 = llvm.mlir.constant(8 : index) : i64
    %14 = llvm.mlir.constant(9 : index) : i64
    %15 = llvm.mlir.constant(10 : index) : i64
    %16 = llvm.mlir.constant(11 : index) : i64
    %17 = llvm.mlir.constant(12 : index) : i64
    %18 = llvm.mlir.constant(13 : index) : i64
    %19 = llvm.mlir.constant(14 : index) : i64
    %20 = llvm.mlir.constant(15 : index) : i64
    %21 = llvm.mlir.constant(17 : index) : i64
    %22 = llvm.mlir.constant(18 : index) : i64
    %23 = llvm.mlir.constant(19 : index) : i64
    %24 = llvm.mlir.constant(20 : index) : i64
    %25 = llvm.mlir.constant(21 : index) : i64
    %26 = llvm.mlir.constant(22 : index) : i64
    %27 = llvm.mlir.constant(23 : index) : i64
    %28 = llvm.mlir.constant(24 : index) : i64
    %29 = llvm.mlir.constant(25 : index) : i64
    %30 = llvm.mlir.constant(26 : index) : i64
    %31 = llvm.mlir.constant(27 : index) : i64
    %32 = llvm.mlir.constant(112 : index) : i64
    %33 = llvm.mlir.constant(12544 : index) : i64
    %34 = llvm.mlir.constant(802816 : index) : i64
    %35 = llvm.mlir.constant(1 : index) : i64
    %36 = llvm.mlir.constant(0 : index) : i64
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%36 : i64)
  ^bb2(%37: i64):  // 2 preds: ^bb1, ^bb6
    %38 = llvm.icmp "slt" %37, %1 : i64
    llvm.cond_br %38, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    %39 = llvm.load %arg0 : !llvm.ptr -> f32
    %40 = llvm.load %arg1 : !llvm.ptr -> f32
    %41 = llvm.load %arg2 : !llvm.ptr -> f32
    %42 = llvm.load %arg3 : !llvm.ptr -> f32
    llvm.br ^bb4(%36 : i64)
  ^bb4(%43: i64):  // 2 preds: ^bb3, ^bb5
    %44 = llvm.icmp "slt" %43, %32 : i64
    llvm.cond_br %44, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %45 = llvm.mul %36, %34  : i64
    %46 = llvm.mul %36, %33  : i64
    %47 = llvm.add %45, %46  : i64
    %48 = llvm.mul %37, %32  : i64
    %49 = llvm.add %47, %48  : i64
    %50 = llvm.add %49, %43  : i64
    %51 = llvm.getelementptr %arg4[%50] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %52 = llvm.load %51 : !llvm.ptr -> f32
    %53 = llvm.fptrunc %0 : f64 to f32
    %54 = llvm.fadd %42, %53  : f32
    %55 = llvm.fmul %54, %3  : f32
    %56 = llvm.bitcast %54 : f32 to i32
    %57 = llvm.lshr %56, %4  : i32
    %58 = llvm.sub %5, %57  : i32
    %59 = llvm.bitcast %58 : i32 to f32
    %60 = llvm.fmul %59, %59  : f32
    %61 = llvm.fmul %60, %55  : f32
    %62 = llvm.fsub %6, %61  : f32
    %63 = llvm.fmul %62, %60  : f32
    %64 = llvm.fsub %52, %41  : f32
    %65 = llvm.fmul %64, %63  : f32
    %66 = llvm.fmul %65, %39  : f32
    %67 = llvm.fadd %66, %40  : f32
    %68 = llvm.mul %36, %34  : i64
    %69 = llvm.mul %36, %33  : i64
    %70 = llvm.add %68, %69  : i64
    %71 = llvm.mul %37, %32  : i64
    %72 = llvm.add %70, %71  : i64
    %73 = llvm.add %72, %43  : i64
    %74 = llvm.getelementptr %arg5[%73] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %67, %74 : f32, !llvm.ptr
    %75 = llvm.add %43, %35  : i64
    %76 = llvm.mul %36, %34  : i64
    %77 = llvm.mul %36, %33  : i64
    %78 = llvm.add %76, %77  : i64
    %79 = llvm.mul %37, %32  : i64
    %80 = llvm.add %78, %79  : i64
    %81 = llvm.add %80, %75  : i64
    %82 = llvm.getelementptr %arg4[%81] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %83 = llvm.load %82 : !llvm.ptr -> f32
    %84 = llvm.fptrunc %0 : f64 to f32
    %85 = llvm.fadd %42, %84  : f32
    %86 = llvm.fmul %85, %3  : f32
    %87 = llvm.bitcast %85 : f32 to i32
    %88 = llvm.lshr %87, %4  : i32
    %89 = llvm.sub %5, %88  : i32
    %90 = llvm.bitcast %89 : i32 to f32
    %91 = llvm.fmul %90, %90  : f32
    %92 = llvm.fmul %91, %86  : f32
    %93 = llvm.fsub %6, %92  : f32
    %94 = llvm.fmul %93, %91  : f32
    %95 = llvm.fsub %83, %41  : f32
    %96 = llvm.fmul %95, %94  : f32
    %97 = llvm.fmul %96, %39  : f32
    %98 = llvm.fadd %97, %40  : f32
    %99 = llvm.mul %36, %34  : i64
    %100 = llvm.mul %36, %33  : i64
    %101 = llvm.add %99, %100  : i64
    %102 = llvm.mul %37, %32  : i64
    %103 = llvm.add %101, %102  : i64
    %104 = llvm.add %103, %75  : i64
    %105 = llvm.getelementptr %arg5[%104] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %98, %105 : f32, !llvm.ptr
    %106 = llvm.add %43, %7  : i64
    %107 = llvm.mul %36, %34  : i64
    %108 = llvm.mul %36, %33  : i64
    %109 = llvm.add %107, %108  : i64
    %110 = llvm.mul %37, %32  : i64
    %111 = llvm.add %109, %110  : i64
    %112 = llvm.add %111, %106  : i64
    %113 = llvm.getelementptr %arg4[%112] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %114 = llvm.load %113 : !llvm.ptr -> f32
    %115 = llvm.fptrunc %0 : f64 to f32
    %116 = llvm.fadd %42, %115  : f32
    %117 = llvm.fmul %116, %3  : f32
    %118 = llvm.bitcast %116 : f32 to i32
    %119 = llvm.lshr %118, %4  : i32
    %120 = llvm.sub %5, %119  : i32
    %121 = llvm.bitcast %120 : i32 to f32
    %122 = llvm.fmul %121, %121  : f32
    %123 = llvm.fmul %122, %117  : f32
    %124 = llvm.fsub %6, %123  : f32
    %125 = llvm.fmul %124, %122  : f32
    %126 = llvm.fsub %114, %41  : f32
    %127 = llvm.fmul %126, %125  : f32
    %128 = llvm.fmul %127, %39  : f32
    %129 = llvm.fadd %128, %40  : f32
    %130 = llvm.mul %36, %34  : i64
    %131 = llvm.mul %36, %33  : i64
    %132 = llvm.add %130, %131  : i64
    %133 = llvm.mul %37, %32  : i64
    %134 = llvm.add %132, %133  : i64
    %135 = llvm.add %134, %106  : i64
    %136 = llvm.getelementptr %arg5[%135] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %129, %136 : f32, !llvm.ptr
    %137 = llvm.add %43, %8  : i64
    %138 = llvm.mul %36, %34  : i64
    %139 = llvm.mul %36, %33  : i64
    %140 = llvm.add %138, %139  : i64
    %141 = llvm.mul %37, %32  : i64
    %142 = llvm.add %140, %141  : i64
    %143 = llvm.add %142, %137  : i64
    %144 = llvm.getelementptr %arg4[%143] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %145 = llvm.load %144 : !llvm.ptr -> f32
    %146 = llvm.fptrunc %0 : f64 to f32
    %147 = llvm.fadd %42, %146  : f32
    %148 = llvm.fmul %147, %3  : f32
    %149 = llvm.bitcast %147 : f32 to i32
    %150 = llvm.lshr %149, %4  : i32
    %151 = llvm.sub %5, %150  : i32
    %152 = llvm.bitcast %151 : i32 to f32
    %153 = llvm.fmul %152, %152  : f32
    %154 = llvm.fmul %153, %148  : f32
    %155 = llvm.fsub %6, %154  : f32
    %156 = llvm.fmul %155, %153  : f32
    %157 = llvm.fsub %145, %41  : f32
    %158 = llvm.fmul %157, %156  : f32
    %159 = llvm.fmul %158, %39  : f32
    %160 = llvm.fadd %159, %40  : f32
    %161 = llvm.mul %36, %34  : i64
    %162 = llvm.mul %36, %33  : i64
    %163 = llvm.add %161, %162  : i64
    %164 = llvm.mul %37, %32  : i64
    %165 = llvm.add %163, %164  : i64
    %166 = llvm.add %165, %137  : i64
    %167 = llvm.getelementptr %arg5[%166] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %160, %167 : f32, !llvm.ptr
    %168 = llvm.add %43, %9  : i64
    %169 = llvm.mul %36, %34  : i64
    %170 = llvm.mul %36, %33  : i64
    %171 = llvm.add %169, %170  : i64
    %172 = llvm.mul %37, %32  : i64
    %173 = llvm.add %171, %172  : i64
    %174 = llvm.add %173, %168  : i64
    %175 = llvm.getelementptr %arg4[%174] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %176 = llvm.load %175 : !llvm.ptr -> f32
    %177 = llvm.fptrunc %0 : f64 to f32
    %178 = llvm.fadd %42, %177  : f32
    %179 = llvm.fmul %178, %3  : f32
    %180 = llvm.bitcast %178 : f32 to i32
    %181 = llvm.lshr %180, %4  : i32
    %182 = llvm.sub %5, %181  : i32
    %183 = llvm.bitcast %182 : i32 to f32
    %184 = llvm.fmul %183, %183  : f32
    %185 = llvm.fmul %184, %179  : f32
    %186 = llvm.fsub %6, %185  : f32
    %187 = llvm.fmul %186, %184  : f32
    %188 = llvm.fsub %176, %41  : f32
    %189 = llvm.fmul %188, %187  : f32
    %190 = llvm.fmul %189, %39  : f32
    %191 = llvm.fadd %190, %40  : f32
    %192 = llvm.mul %36, %34  : i64
    %193 = llvm.mul %36, %33  : i64
    %194 = llvm.add %192, %193  : i64
    %195 = llvm.mul %37, %32  : i64
    %196 = llvm.add %194, %195  : i64
    %197 = llvm.add %196, %168  : i64
    %198 = llvm.getelementptr %arg5[%197] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %191, %198 : f32, !llvm.ptr
    %199 = llvm.add %43, %10  : i64
    %200 = llvm.mul %36, %34  : i64
    %201 = llvm.mul %36, %33  : i64
    %202 = llvm.add %200, %201  : i64
    %203 = llvm.mul %37, %32  : i64
    %204 = llvm.add %202, %203  : i64
    %205 = llvm.add %204, %199  : i64
    %206 = llvm.getelementptr %arg4[%205] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %207 = llvm.load %206 : !llvm.ptr -> f32
    %208 = llvm.fptrunc %0 : f64 to f32
    %209 = llvm.fadd %42, %208  : f32
    %210 = llvm.fmul %209, %3  : f32
    %211 = llvm.bitcast %209 : f32 to i32
    %212 = llvm.lshr %211, %4  : i32
    %213 = llvm.sub %5, %212  : i32
    %214 = llvm.bitcast %213 : i32 to f32
    %215 = llvm.fmul %214, %214  : f32
    %216 = llvm.fmul %215, %210  : f32
    %217 = llvm.fsub %6, %216  : f32
    %218 = llvm.fmul %217, %215  : f32
    %219 = llvm.fsub %207, %41  : f32
    %220 = llvm.fmul %219, %218  : f32
    %221 = llvm.fmul %220, %39  : f32
    %222 = llvm.fadd %221, %40  : f32
    %223 = llvm.mul %36, %34  : i64
    %224 = llvm.mul %36, %33  : i64
    %225 = llvm.add %223, %224  : i64
    %226 = llvm.mul %37, %32  : i64
    %227 = llvm.add %225, %226  : i64
    %228 = llvm.add %227, %199  : i64
    %229 = llvm.getelementptr %arg5[%228] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %222, %229 : f32, !llvm.ptr
    %230 = llvm.add %43, %11  : i64
    %231 = llvm.mul %36, %34  : i64
    %232 = llvm.mul %36, %33  : i64
    %233 = llvm.add %231, %232  : i64
    %234 = llvm.mul %37, %32  : i64
    %235 = llvm.add %233, %234  : i64
    %236 = llvm.add %235, %230  : i64
    %237 = llvm.getelementptr %arg4[%236] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %238 = llvm.load %237 : !llvm.ptr -> f32
    %239 = llvm.fptrunc %0 : f64 to f32
    %240 = llvm.fadd %42, %239  : f32
    %241 = llvm.fmul %240, %3  : f32
    %242 = llvm.bitcast %240 : f32 to i32
    %243 = llvm.lshr %242, %4  : i32
    %244 = llvm.sub %5, %243  : i32
    %245 = llvm.bitcast %244 : i32 to f32
    %246 = llvm.fmul %245, %245  : f32
    %247 = llvm.fmul %246, %241  : f32
    %248 = llvm.fsub %6, %247  : f32
    %249 = llvm.fmul %248, %246  : f32
    %250 = llvm.fsub %238, %41  : f32
    %251 = llvm.fmul %250, %249  : f32
    %252 = llvm.fmul %251, %39  : f32
    %253 = llvm.fadd %252, %40  : f32
    %254 = llvm.mul %36, %34  : i64
    %255 = llvm.mul %36, %33  : i64
    %256 = llvm.add %254, %255  : i64
    %257 = llvm.mul %37, %32  : i64
    %258 = llvm.add %256, %257  : i64
    %259 = llvm.add %258, %230  : i64
    %260 = llvm.getelementptr %arg5[%259] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %253, %260 : f32, !llvm.ptr
    %261 = llvm.add %43, %12  : i64
    %262 = llvm.mul %36, %34  : i64
    %263 = llvm.mul %36, %33  : i64
    %264 = llvm.add %262, %263  : i64
    %265 = llvm.mul %37, %32  : i64
    %266 = llvm.add %264, %265  : i64
    %267 = llvm.add %266, %261  : i64
    %268 = llvm.getelementptr %arg4[%267] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %269 = llvm.load %268 : !llvm.ptr -> f32
    %270 = llvm.fptrunc %0 : f64 to f32
    %271 = llvm.fadd %42, %270  : f32
    %272 = llvm.fmul %271, %3  : f32
    %273 = llvm.bitcast %271 : f32 to i32
    %274 = llvm.lshr %273, %4  : i32
    %275 = llvm.sub %5, %274  : i32
    %276 = llvm.bitcast %275 : i32 to f32
    %277 = llvm.fmul %276, %276  : f32
    %278 = llvm.fmul %277, %272  : f32
    %279 = llvm.fsub %6, %278  : f32
    %280 = llvm.fmul %279, %277  : f32
    %281 = llvm.fsub %269, %41  : f32
    %282 = llvm.fmul %281, %280  : f32
    %283 = llvm.fmul %282, %39  : f32
    %284 = llvm.fadd %283, %40  : f32
    %285 = llvm.mul %36, %34  : i64
    %286 = llvm.mul %36, %33  : i64
    %287 = llvm.add %285, %286  : i64
    %288 = llvm.mul %37, %32  : i64
    %289 = llvm.add %287, %288  : i64
    %290 = llvm.add %289, %261  : i64
    %291 = llvm.getelementptr %arg5[%290] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %284, %291 : f32, !llvm.ptr
    %292 = llvm.add %43, %13  : i64
    %293 = llvm.mul %36, %34  : i64
    %294 = llvm.mul %36, %33  : i64
    %295 = llvm.add %293, %294  : i64
    %296 = llvm.mul %37, %32  : i64
    %297 = llvm.add %295, %296  : i64
    %298 = llvm.add %297, %292  : i64
    %299 = llvm.getelementptr %arg4[%298] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %300 = llvm.load %299 : !llvm.ptr -> f32
    %301 = llvm.fptrunc %0 : f64 to f32
    %302 = llvm.fadd %42, %301  : f32
    %303 = llvm.fmul %302, %3  : f32
    %304 = llvm.bitcast %302 : f32 to i32
    %305 = llvm.lshr %304, %4  : i32
    %306 = llvm.sub %5, %305  : i32
    %307 = llvm.bitcast %306 : i32 to f32
    %308 = llvm.fmul %307, %307  : f32
    %309 = llvm.fmul %308, %303  : f32
    %310 = llvm.fsub %6, %309  : f32
    %311 = llvm.fmul %310, %308  : f32
    %312 = llvm.fsub %300, %41  : f32
    %313 = llvm.fmul %312, %311  : f32
    %314 = llvm.fmul %313, %39  : f32
    %315 = llvm.fadd %314, %40  : f32
    %316 = llvm.mul %36, %34  : i64
    %317 = llvm.mul %36, %33  : i64
    %318 = llvm.add %316, %317  : i64
    %319 = llvm.mul %37, %32  : i64
    %320 = llvm.add %318, %319  : i64
    %321 = llvm.add %320, %292  : i64
    %322 = llvm.getelementptr %arg5[%321] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %315, %322 : f32, !llvm.ptr
    %323 = llvm.add %43, %14  : i64
    %324 = llvm.mul %36, %34  : i64
    %325 = llvm.mul %36, %33  : i64
    %326 = llvm.add %324, %325  : i64
    %327 = llvm.mul %37, %32  : i64
    %328 = llvm.add %326, %327  : i64
    %329 = llvm.add %328, %323  : i64
    %330 = llvm.getelementptr %arg4[%329] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %331 = llvm.load %330 : !llvm.ptr -> f32
    %332 = llvm.fptrunc %0 : f64 to f32
    %333 = llvm.fadd %42, %332  : f32
    %334 = llvm.fmul %333, %3  : f32
    %335 = llvm.bitcast %333 : f32 to i32
    %336 = llvm.lshr %335, %4  : i32
    %337 = llvm.sub %5, %336  : i32
    %338 = llvm.bitcast %337 : i32 to f32
    %339 = llvm.fmul %338, %338  : f32
    %340 = llvm.fmul %339, %334  : f32
    %341 = llvm.fsub %6, %340  : f32
    %342 = llvm.fmul %341, %339  : f32
    %343 = llvm.fsub %331, %41  : f32
    %344 = llvm.fmul %343, %342  : f32
    %345 = llvm.fmul %344, %39  : f32
    %346 = llvm.fadd %345, %40  : f32
    %347 = llvm.mul %36, %34  : i64
    %348 = llvm.mul %36, %33  : i64
    %349 = llvm.add %347, %348  : i64
    %350 = llvm.mul %37, %32  : i64
    %351 = llvm.add %349, %350  : i64
    %352 = llvm.add %351, %323  : i64
    %353 = llvm.getelementptr %arg5[%352] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %346, %353 : f32, !llvm.ptr
    %354 = llvm.add %43, %15  : i64
    %355 = llvm.mul %36, %34  : i64
    %356 = llvm.mul %36, %33  : i64
    %357 = llvm.add %355, %356  : i64
    %358 = llvm.mul %37, %32  : i64
    %359 = llvm.add %357, %358  : i64
    %360 = llvm.add %359, %354  : i64
    %361 = llvm.getelementptr %arg4[%360] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %362 = llvm.load %361 : !llvm.ptr -> f32
    %363 = llvm.fptrunc %0 : f64 to f32
    %364 = llvm.fadd %42, %363  : f32
    %365 = llvm.fmul %364, %3  : f32
    %366 = llvm.bitcast %364 : f32 to i32
    %367 = llvm.lshr %366, %4  : i32
    %368 = llvm.sub %5, %367  : i32
    %369 = llvm.bitcast %368 : i32 to f32
    %370 = llvm.fmul %369, %369  : f32
    %371 = llvm.fmul %370, %365  : f32
    %372 = llvm.fsub %6, %371  : f32
    %373 = llvm.fmul %372, %370  : f32
    %374 = llvm.fsub %362, %41  : f32
    %375 = llvm.fmul %374, %373  : f32
    %376 = llvm.fmul %375, %39  : f32
    %377 = llvm.fadd %376, %40  : f32
    %378 = llvm.mul %36, %34  : i64
    %379 = llvm.mul %36, %33  : i64
    %380 = llvm.add %378, %379  : i64
    %381 = llvm.mul %37, %32  : i64
    %382 = llvm.add %380, %381  : i64
    %383 = llvm.add %382, %354  : i64
    %384 = llvm.getelementptr %arg5[%383] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %377, %384 : f32, !llvm.ptr
    %385 = llvm.add %43, %16  : i64
    %386 = llvm.mul %36, %34  : i64
    %387 = llvm.mul %36, %33  : i64
    %388 = llvm.add %386, %387  : i64
    %389 = llvm.mul %37, %32  : i64
    %390 = llvm.add %388, %389  : i64
    %391 = llvm.add %390, %385  : i64
    %392 = llvm.getelementptr %arg4[%391] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %393 = llvm.load %392 : !llvm.ptr -> f32
    %394 = llvm.fptrunc %0 : f64 to f32
    %395 = llvm.fadd %42, %394  : f32
    %396 = llvm.fmul %395, %3  : f32
    %397 = llvm.bitcast %395 : f32 to i32
    %398 = llvm.lshr %397, %4  : i32
    %399 = llvm.sub %5, %398  : i32
    %400 = llvm.bitcast %399 : i32 to f32
    %401 = llvm.fmul %400, %400  : f32
    %402 = llvm.fmul %401, %396  : f32
    %403 = llvm.fsub %6, %402  : f32
    %404 = llvm.fmul %403, %401  : f32
    %405 = llvm.fsub %393, %41  : f32
    %406 = llvm.fmul %405, %404  : f32
    %407 = llvm.fmul %406, %39  : f32
    %408 = llvm.fadd %407, %40  : f32
    %409 = llvm.mul %36, %34  : i64
    %410 = llvm.mul %36, %33  : i64
    %411 = llvm.add %409, %410  : i64
    %412 = llvm.mul %37, %32  : i64
    %413 = llvm.add %411, %412  : i64
    %414 = llvm.add %413, %385  : i64
    %415 = llvm.getelementptr %arg5[%414] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %408, %415 : f32, !llvm.ptr
    %416 = llvm.add %43, %17  : i64
    %417 = llvm.mul %36, %34  : i64
    %418 = llvm.mul %36, %33  : i64
    %419 = llvm.add %417, %418  : i64
    %420 = llvm.mul %37, %32  : i64
    %421 = llvm.add %419, %420  : i64
    %422 = llvm.add %421, %416  : i64
    %423 = llvm.getelementptr %arg4[%422] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %424 = llvm.load %423 : !llvm.ptr -> f32
    %425 = llvm.fptrunc %0 : f64 to f32
    %426 = llvm.fadd %42, %425  : f32
    %427 = llvm.fmul %426, %3  : f32
    %428 = llvm.bitcast %426 : f32 to i32
    %429 = llvm.lshr %428, %4  : i32
    %430 = llvm.sub %5, %429  : i32
    %431 = llvm.bitcast %430 : i32 to f32
    %432 = llvm.fmul %431, %431  : f32
    %433 = llvm.fmul %432, %427  : f32
    %434 = llvm.fsub %6, %433  : f32
    %435 = llvm.fmul %434, %432  : f32
    %436 = llvm.fsub %424, %41  : f32
    %437 = llvm.fmul %436, %435  : f32
    %438 = llvm.fmul %437, %39  : f32
    %439 = llvm.fadd %438, %40  : f32
    %440 = llvm.mul %36, %34  : i64
    %441 = llvm.mul %36, %33  : i64
    %442 = llvm.add %440, %441  : i64
    %443 = llvm.mul %37, %32  : i64
    %444 = llvm.add %442, %443  : i64
    %445 = llvm.add %444, %416  : i64
    %446 = llvm.getelementptr %arg5[%445] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %439, %446 : f32, !llvm.ptr
    %447 = llvm.add %43, %18  : i64
    %448 = llvm.mul %36, %34  : i64
    %449 = llvm.mul %36, %33  : i64
    %450 = llvm.add %448, %449  : i64
    %451 = llvm.mul %37, %32  : i64
    %452 = llvm.add %450, %451  : i64
    %453 = llvm.add %452, %447  : i64
    %454 = llvm.getelementptr %arg4[%453] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %455 = llvm.load %454 : !llvm.ptr -> f32
    %456 = llvm.fptrunc %0 : f64 to f32
    %457 = llvm.fadd %42, %456  : f32
    %458 = llvm.fmul %457, %3  : f32
    %459 = llvm.bitcast %457 : f32 to i32
    %460 = llvm.lshr %459, %4  : i32
    %461 = llvm.sub %5, %460  : i32
    %462 = llvm.bitcast %461 : i32 to f32
    %463 = llvm.fmul %462, %462  : f32
    %464 = llvm.fmul %463, %458  : f32
    %465 = llvm.fsub %6, %464  : f32
    %466 = llvm.fmul %465, %463  : f32
    %467 = llvm.fsub %455, %41  : f32
    %468 = llvm.fmul %467, %466  : f32
    %469 = llvm.fmul %468, %39  : f32
    %470 = llvm.fadd %469, %40  : f32
    %471 = llvm.mul %36, %34  : i64
    %472 = llvm.mul %36, %33  : i64
    %473 = llvm.add %471, %472  : i64
    %474 = llvm.mul %37, %32  : i64
    %475 = llvm.add %473, %474  : i64
    %476 = llvm.add %475, %447  : i64
    %477 = llvm.getelementptr %arg5[%476] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %470, %477 : f32, !llvm.ptr
    %478 = llvm.add %43, %19  : i64
    %479 = llvm.mul %36, %34  : i64
    %480 = llvm.mul %36, %33  : i64
    %481 = llvm.add %479, %480  : i64
    %482 = llvm.mul %37, %32  : i64
    %483 = llvm.add %481, %482  : i64
    %484 = llvm.add %483, %478  : i64
    %485 = llvm.getelementptr %arg4[%484] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %486 = llvm.load %485 : !llvm.ptr -> f32
    %487 = llvm.fptrunc %0 : f64 to f32
    %488 = llvm.fadd %42, %487  : f32
    %489 = llvm.fmul %488, %3  : f32
    %490 = llvm.bitcast %488 : f32 to i32
    %491 = llvm.lshr %490, %4  : i32
    %492 = llvm.sub %5, %491  : i32
    %493 = llvm.bitcast %492 : i32 to f32
    %494 = llvm.fmul %493, %493  : f32
    %495 = llvm.fmul %494, %489  : f32
    %496 = llvm.fsub %6, %495  : f32
    %497 = llvm.fmul %496, %494  : f32
    %498 = llvm.fsub %486, %41  : f32
    %499 = llvm.fmul %498, %497  : f32
    %500 = llvm.fmul %499, %39  : f32
    %501 = llvm.fadd %500, %40  : f32
    %502 = llvm.mul %36, %34  : i64
    %503 = llvm.mul %36, %33  : i64
    %504 = llvm.add %502, %503  : i64
    %505 = llvm.mul %37, %32  : i64
    %506 = llvm.add %504, %505  : i64
    %507 = llvm.add %506, %478  : i64
    %508 = llvm.getelementptr %arg5[%507] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %501, %508 : f32, !llvm.ptr
    %509 = llvm.add %43, %20  : i64
    %510 = llvm.mul %36, %34  : i64
    %511 = llvm.mul %36, %33  : i64
    %512 = llvm.add %510, %511  : i64
    %513 = llvm.mul %37, %32  : i64
    %514 = llvm.add %512, %513  : i64
    %515 = llvm.add %514, %509  : i64
    %516 = llvm.getelementptr %arg4[%515] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %517 = llvm.load %516 : !llvm.ptr -> f32
    %518 = llvm.fptrunc %0 : f64 to f32
    %519 = llvm.fadd %42, %518  : f32
    %520 = llvm.fmul %519, %3  : f32
    %521 = llvm.bitcast %519 : f32 to i32
    %522 = llvm.lshr %521, %4  : i32
    %523 = llvm.sub %5, %522  : i32
    %524 = llvm.bitcast %523 : i32 to f32
    %525 = llvm.fmul %524, %524  : f32
    %526 = llvm.fmul %525, %520  : f32
    %527 = llvm.fsub %6, %526  : f32
    %528 = llvm.fmul %527, %525  : f32
    %529 = llvm.fsub %517, %41  : f32
    %530 = llvm.fmul %529, %528  : f32
    %531 = llvm.fmul %530, %39  : f32
    %532 = llvm.fadd %531, %40  : f32
    %533 = llvm.mul %36, %34  : i64
    %534 = llvm.mul %36, %33  : i64
    %535 = llvm.add %533, %534  : i64
    %536 = llvm.mul %37, %32  : i64
    %537 = llvm.add %535, %536  : i64
    %538 = llvm.add %537, %509  : i64
    %539 = llvm.getelementptr %arg5[%538] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %532, %539 : f32, !llvm.ptr
    %540 = llvm.add %43, %1  : i64
    %541 = llvm.mul %36, %34  : i64
    %542 = llvm.mul %36, %33  : i64
    %543 = llvm.add %541, %542  : i64
    %544 = llvm.mul %37, %32  : i64
    %545 = llvm.add %543, %544  : i64
    %546 = llvm.add %545, %540  : i64
    %547 = llvm.getelementptr %arg4[%546] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %548 = llvm.load %547 : !llvm.ptr -> f32
    %549 = llvm.fptrunc %0 : f64 to f32
    %550 = llvm.fadd %42, %549  : f32
    %551 = llvm.fmul %550, %3  : f32
    %552 = llvm.bitcast %550 : f32 to i32
    %553 = llvm.lshr %552, %4  : i32
    %554 = llvm.sub %5, %553  : i32
    %555 = llvm.bitcast %554 : i32 to f32
    %556 = llvm.fmul %555, %555  : f32
    %557 = llvm.fmul %556, %551  : f32
    %558 = llvm.fsub %6, %557  : f32
    %559 = llvm.fmul %558, %556  : f32
    %560 = llvm.fsub %548, %41  : f32
    %561 = llvm.fmul %560, %559  : f32
    %562 = llvm.fmul %561, %39  : f32
    %563 = llvm.fadd %562, %40  : f32
    %564 = llvm.mul %36, %34  : i64
    %565 = llvm.mul %36, %33  : i64
    %566 = llvm.add %564, %565  : i64
    %567 = llvm.mul %37, %32  : i64
    %568 = llvm.add %566, %567  : i64
    %569 = llvm.add %568, %540  : i64
    %570 = llvm.getelementptr %arg5[%569] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %563, %570 : f32, !llvm.ptr
    %571 = llvm.add %43, %21  : i64
    %572 = llvm.mul %36, %34  : i64
    %573 = llvm.mul %36, %33  : i64
    %574 = llvm.add %572, %573  : i64
    %575 = llvm.mul %37, %32  : i64
    %576 = llvm.add %574, %575  : i64
    %577 = llvm.add %576, %571  : i64
    %578 = llvm.getelementptr %arg4[%577] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %579 = llvm.load %578 : !llvm.ptr -> f32
    %580 = llvm.fptrunc %0 : f64 to f32
    %581 = llvm.fadd %42, %580  : f32
    %582 = llvm.fmul %581, %3  : f32
    %583 = llvm.bitcast %581 : f32 to i32
    %584 = llvm.lshr %583, %4  : i32
    %585 = llvm.sub %5, %584  : i32
    %586 = llvm.bitcast %585 : i32 to f32
    %587 = llvm.fmul %586, %586  : f32
    %588 = llvm.fmul %587, %582  : f32
    %589 = llvm.fsub %6, %588  : f32
    %590 = llvm.fmul %589, %587  : f32
    %591 = llvm.fsub %579, %41  : f32
    %592 = llvm.fmul %591, %590  : f32
    %593 = llvm.fmul %592, %39  : f32
    %594 = llvm.fadd %593, %40  : f32
    %595 = llvm.mul %36, %34  : i64
    %596 = llvm.mul %36, %33  : i64
    %597 = llvm.add %595, %596  : i64
    %598 = llvm.mul %37, %32  : i64
    %599 = llvm.add %597, %598  : i64
    %600 = llvm.add %599, %571  : i64
    %601 = llvm.getelementptr %arg5[%600] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %594, %601 : f32, !llvm.ptr
    %602 = llvm.add %43, %22  : i64
    %603 = llvm.mul %36, %34  : i64
    %604 = llvm.mul %36, %33  : i64
    %605 = llvm.add %603, %604  : i64
    %606 = llvm.mul %37, %32  : i64
    %607 = llvm.add %605, %606  : i64
    %608 = llvm.add %607, %602  : i64
    %609 = llvm.getelementptr %arg4[%608] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %610 = llvm.load %609 : !llvm.ptr -> f32
    %611 = llvm.fptrunc %0 : f64 to f32
    %612 = llvm.fadd %42, %611  : f32
    %613 = llvm.fmul %612, %3  : f32
    %614 = llvm.bitcast %612 : f32 to i32
    %615 = llvm.lshr %614, %4  : i32
    %616 = llvm.sub %5, %615  : i32
    %617 = llvm.bitcast %616 : i32 to f32
    %618 = llvm.fmul %617, %617  : f32
    %619 = llvm.fmul %618, %613  : f32
    %620 = llvm.fsub %6, %619  : f32
    %621 = llvm.fmul %620, %618  : f32
    %622 = llvm.fsub %610, %41  : f32
    %623 = llvm.fmul %622, %621  : f32
    %624 = llvm.fmul %623, %39  : f32
    %625 = llvm.fadd %624, %40  : f32
    %626 = llvm.mul %36, %34  : i64
    %627 = llvm.mul %36, %33  : i64
    %628 = llvm.add %626, %627  : i64
    %629 = llvm.mul %37, %32  : i64
    %630 = llvm.add %628, %629  : i64
    %631 = llvm.add %630, %602  : i64
    %632 = llvm.getelementptr %arg5[%631] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %625, %632 : f32, !llvm.ptr
    %633 = llvm.add %43, %23  : i64
    %634 = llvm.mul %36, %34  : i64
    %635 = llvm.mul %36, %33  : i64
    %636 = llvm.add %634, %635  : i64
    %637 = llvm.mul %37, %32  : i64
    %638 = llvm.add %636, %637  : i64
    %639 = llvm.add %638, %633  : i64
    %640 = llvm.getelementptr %arg4[%639] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %641 = llvm.load %640 : !llvm.ptr -> f32
    %642 = llvm.fptrunc %0 : f64 to f32
    %643 = llvm.fadd %42, %642  : f32
    %644 = llvm.fmul %643, %3  : f32
    %645 = llvm.bitcast %643 : f32 to i32
    %646 = llvm.lshr %645, %4  : i32
    %647 = llvm.sub %5, %646  : i32
    %648 = llvm.bitcast %647 : i32 to f32
    %649 = llvm.fmul %648, %648  : f32
    %650 = llvm.fmul %649, %644  : f32
    %651 = llvm.fsub %6, %650  : f32
    %652 = llvm.fmul %651, %649  : f32
    %653 = llvm.fsub %641, %41  : f32
    %654 = llvm.fmul %653, %652  : f32
    %655 = llvm.fmul %654, %39  : f32
    %656 = llvm.fadd %655, %40  : f32
    %657 = llvm.mul %36, %34  : i64
    %658 = llvm.mul %36, %33  : i64
    %659 = llvm.add %657, %658  : i64
    %660 = llvm.mul %37, %32  : i64
    %661 = llvm.add %659, %660  : i64
    %662 = llvm.add %661, %633  : i64
    %663 = llvm.getelementptr %arg5[%662] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %656, %663 : f32, !llvm.ptr
    %664 = llvm.add %43, %24  : i64
    %665 = llvm.mul %36, %34  : i64
    %666 = llvm.mul %36, %33  : i64
    %667 = llvm.add %665, %666  : i64
    %668 = llvm.mul %37, %32  : i64
    %669 = llvm.add %667, %668  : i64
    %670 = llvm.add %669, %664  : i64
    %671 = llvm.getelementptr %arg4[%670] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %672 = llvm.load %671 : !llvm.ptr -> f32
    %673 = llvm.fptrunc %0 : f64 to f32
    %674 = llvm.fadd %42, %673  : f32
    %675 = llvm.fmul %674, %3  : f32
    %676 = llvm.bitcast %674 : f32 to i32
    %677 = llvm.lshr %676, %4  : i32
    %678 = llvm.sub %5, %677  : i32
    %679 = llvm.bitcast %678 : i32 to f32
    %680 = llvm.fmul %679, %679  : f32
    %681 = llvm.fmul %680, %675  : f32
    %682 = llvm.fsub %6, %681  : f32
    %683 = llvm.fmul %682, %680  : f32
    %684 = llvm.fsub %672, %41  : f32
    %685 = llvm.fmul %684, %683  : f32
    %686 = llvm.fmul %685, %39  : f32
    %687 = llvm.fadd %686, %40  : f32
    %688 = llvm.mul %36, %34  : i64
    %689 = llvm.mul %36, %33  : i64
    %690 = llvm.add %688, %689  : i64
    %691 = llvm.mul %37, %32  : i64
    %692 = llvm.add %690, %691  : i64
    %693 = llvm.add %692, %664  : i64
    %694 = llvm.getelementptr %arg5[%693] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %687, %694 : f32, !llvm.ptr
    %695 = llvm.add %43, %25  : i64
    %696 = llvm.mul %36, %34  : i64
    %697 = llvm.mul %36, %33  : i64
    %698 = llvm.add %696, %697  : i64
    %699 = llvm.mul %37, %32  : i64
    %700 = llvm.add %698, %699  : i64
    %701 = llvm.add %700, %695  : i64
    %702 = llvm.getelementptr %arg4[%701] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %703 = llvm.load %702 : !llvm.ptr -> f32
    %704 = llvm.fptrunc %0 : f64 to f32
    %705 = llvm.fadd %42, %704  : f32
    %706 = llvm.fmul %705, %3  : f32
    %707 = llvm.bitcast %705 : f32 to i32
    %708 = llvm.lshr %707, %4  : i32
    %709 = llvm.sub %5, %708  : i32
    %710 = llvm.bitcast %709 : i32 to f32
    %711 = llvm.fmul %710, %710  : f32
    %712 = llvm.fmul %711, %706  : f32
    %713 = llvm.fsub %6, %712  : f32
    %714 = llvm.fmul %713, %711  : f32
    %715 = llvm.fsub %703, %41  : f32
    %716 = llvm.fmul %715, %714  : f32
    %717 = llvm.fmul %716, %39  : f32
    %718 = llvm.fadd %717, %40  : f32
    %719 = llvm.mul %36, %34  : i64
    %720 = llvm.mul %36, %33  : i64
    %721 = llvm.add %719, %720  : i64
    %722 = llvm.mul %37, %32  : i64
    %723 = llvm.add %721, %722  : i64
    %724 = llvm.add %723, %695  : i64
    %725 = llvm.getelementptr %arg5[%724] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %718, %725 : f32, !llvm.ptr
    %726 = llvm.add %43, %26  : i64
    %727 = llvm.mul %36, %34  : i64
    %728 = llvm.mul %36, %33  : i64
    %729 = llvm.add %727, %728  : i64
    %730 = llvm.mul %37, %32  : i64
    %731 = llvm.add %729, %730  : i64
    %732 = llvm.add %731, %726  : i64
    %733 = llvm.getelementptr %arg4[%732] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %734 = llvm.load %733 : !llvm.ptr -> f32
    %735 = llvm.fptrunc %0 : f64 to f32
    %736 = llvm.fadd %42, %735  : f32
    %737 = llvm.fmul %736, %3  : f32
    %738 = llvm.bitcast %736 : f32 to i32
    %739 = llvm.lshr %738, %4  : i32
    %740 = llvm.sub %5, %739  : i32
    %741 = llvm.bitcast %740 : i32 to f32
    %742 = llvm.fmul %741, %741  : f32
    %743 = llvm.fmul %742, %737  : f32
    %744 = llvm.fsub %6, %743  : f32
    %745 = llvm.fmul %744, %742  : f32
    %746 = llvm.fsub %734, %41  : f32
    %747 = llvm.fmul %746, %745  : f32
    %748 = llvm.fmul %747, %39  : f32
    %749 = llvm.fadd %748, %40  : f32
    %750 = llvm.mul %36, %34  : i64
    %751 = llvm.mul %36, %33  : i64
    %752 = llvm.add %750, %751  : i64
    %753 = llvm.mul %37, %32  : i64
    %754 = llvm.add %752, %753  : i64
    %755 = llvm.add %754, %726  : i64
    %756 = llvm.getelementptr %arg5[%755] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %749, %756 : f32, !llvm.ptr
    %757 = llvm.add %43, %27  : i64
    %758 = llvm.mul %36, %34  : i64
    %759 = llvm.mul %36, %33  : i64
    %760 = llvm.add %758, %759  : i64
    %761 = llvm.mul %37, %32  : i64
    %762 = llvm.add %760, %761  : i64
    %763 = llvm.add %762, %757  : i64
    %764 = llvm.getelementptr %arg4[%763] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %765 = llvm.load %764 : !llvm.ptr -> f32
    %766 = llvm.fptrunc %0 : f64 to f32
    %767 = llvm.fadd %42, %766  : f32
    %768 = llvm.fmul %767, %3  : f32
    %769 = llvm.bitcast %767 : f32 to i32
    %770 = llvm.lshr %769, %4  : i32
    %771 = llvm.sub %5, %770  : i32
    %772 = llvm.bitcast %771 : i32 to f32
    %773 = llvm.fmul %772, %772  : f32
    %774 = llvm.fmul %773, %768  : f32
    %775 = llvm.fsub %6, %774  : f32
    %776 = llvm.fmul %775, %773  : f32
    %777 = llvm.fsub %765, %41  : f32
    %778 = llvm.fmul %777, %776  : f32
    %779 = llvm.fmul %778, %39  : f32
    %780 = llvm.fadd %779, %40  : f32
    %781 = llvm.mul %36, %34  : i64
    %782 = llvm.mul %36, %33  : i64
    %783 = llvm.add %781, %782  : i64
    %784 = llvm.mul %37, %32  : i64
    %785 = llvm.add %783, %784  : i64
    %786 = llvm.add %785, %757  : i64
    %787 = llvm.getelementptr %arg5[%786] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %780, %787 : f32, !llvm.ptr
    %788 = llvm.add %43, %28  : i64
    %789 = llvm.mul %36, %34  : i64
    %790 = llvm.mul %36, %33  : i64
    %791 = llvm.add %789, %790  : i64
    %792 = llvm.mul %37, %32  : i64
    %793 = llvm.add %791, %792  : i64
    %794 = llvm.add %793, %788  : i64
    %795 = llvm.getelementptr %arg4[%794] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %796 = llvm.load %795 : !llvm.ptr -> f32
    %797 = llvm.fptrunc %0 : f64 to f32
    %798 = llvm.fadd %42, %797  : f32
    %799 = llvm.fmul %798, %3  : f32
    %800 = llvm.bitcast %798 : f32 to i32
    %801 = llvm.lshr %800, %4  : i32
    %802 = llvm.sub %5, %801  : i32
    %803 = llvm.bitcast %802 : i32 to f32
    %804 = llvm.fmul %803, %803  : f32
    %805 = llvm.fmul %804, %799  : f32
    %806 = llvm.fsub %6, %805  : f32
    %807 = llvm.fmul %806, %804  : f32
    %808 = llvm.fsub %796, %41  : f32
    %809 = llvm.fmul %808, %807  : f32
    %810 = llvm.fmul %809, %39  : f32
    %811 = llvm.fadd %810, %40  : f32
    %812 = llvm.mul %36, %34  : i64
    %813 = llvm.mul %36, %33  : i64
    %814 = llvm.add %812, %813  : i64
    %815 = llvm.mul %37, %32  : i64
    %816 = llvm.add %814, %815  : i64
    %817 = llvm.add %816, %788  : i64
    %818 = llvm.getelementptr %arg5[%817] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %811, %818 : f32, !llvm.ptr
    %819 = llvm.add %43, %29  : i64
    %820 = llvm.mul %36, %34  : i64
    %821 = llvm.mul %36, %33  : i64
    %822 = llvm.add %820, %821  : i64
    %823 = llvm.mul %37, %32  : i64
    %824 = llvm.add %822, %823  : i64
    %825 = llvm.add %824, %819  : i64
    %826 = llvm.getelementptr %arg4[%825] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %827 = llvm.load %826 : !llvm.ptr -> f32
    %828 = llvm.fptrunc %0 : f64 to f32
    %829 = llvm.fadd %42, %828  : f32
    %830 = llvm.fmul %829, %3  : f32
    %831 = llvm.bitcast %829 : f32 to i32
    %832 = llvm.lshr %831, %4  : i32
    %833 = llvm.sub %5, %832  : i32
    %834 = llvm.bitcast %833 : i32 to f32
    %835 = llvm.fmul %834, %834  : f32
    %836 = llvm.fmul %835, %830  : f32
    %837 = llvm.fsub %6, %836  : f32
    %838 = llvm.fmul %837, %835  : f32
    %839 = llvm.fsub %827, %41  : f32
    %840 = llvm.fmul %839, %838  : f32
    %841 = llvm.fmul %840, %39  : f32
    %842 = llvm.fadd %841, %40  : f32
    %843 = llvm.mul %36, %34  : i64
    %844 = llvm.mul %36, %33  : i64
    %845 = llvm.add %843, %844  : i64
    %846 = llvm.mul %37, %32  : i64
    %847 = llvm.add %845, %846  : i64
    %848 = llvm.add %847, %819  : i64
    %849 = llvm.getelementptr %arg5[%848] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %842, %849 : f32, !llvm.ptr
    %850 = llvm.add %43, %30  : i64
    %851 = llvm.mul %36, %34  : i64
    %852 = llvm.mul %36, %33  : i64
    %853 = llvm.add %851, %852  : i64
    %854 = llvm.mul %37, %32  : i64
    %855 = llvm.add %853, %854  : i64
    %856 = llvm.add %855, %850  : i64
    %857 = llvm.getelementptr %arg4[%856] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %858 = llvm.load %857 : !llvm.ptr -> f32
    %859 = llvm.fptrunc %0 : f64 to f32
    %860 = llvm.fadd %42, %859  : f32
    %861 = llvm.fmul %860, %3  : f32
    %862 = llvm.bitcast %860 : f32 to i32
    %863 = llvm.lshr %862, %4  : i32
    %864 = llvm.sub %5, %863  : i32
    %865 = llvm.bitcast %864 : i32 to f32
    %866 = llvm.fmul %865, %865  : f32
    %867 = llvm.fmul %866, %861  : f32
    %868 = llvm.fsub %6, %867  : f32
    %869 = llvm.fmul %868, %866  : f32
    %870 = llvm.fsub %858, %41  : f32
    %871 = llvm.fmul %870, %869  : f32
    %872 = llvm.fmul %871, %39  : f32
    %873 = llvm.fadd %872, %40  : f32
    %874 = llvm.mul %36, %34  : i64
    %875 = llvm.mul %36, %33  : i64
    %876 = llvm.add %874, %875  : i64
    %877 = llvm.mul %37, %32  : i64
    %878 = llvm.add %876, %877  : i64
    %879 = llvm.add %878, %850  : i64
    %880 = llvm.getelementptr %arg5[%879] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %873, %880 : f32, !llvm.ptr
    %881 = llvm.add %43, %31  : i64
    %882 = llvm.mul %36, %34  : i64
    %883 = llvm.mul %36, %33  : i64
    %884 = llvm.add %882, %883  : i64
    %885 = llvm.mul %37, %32  : i64
    %886 = llvm.add %884, %885  : i64
    %887 = llvm.add %886, %881  : i64
    %888 = llvm.getelementptr %arg4[%887] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %889 = llvm.load %888 : !llvm.ptr -> f32
    %890 = llvm.fptrunc %0 : f64 to f32
    %891 = llvm.fadd %42, %890  : f32
    %892 = llvm.fmul %891, %3  : f32
    %893 = llvm.bitcast %891 : f32 to i32
    %894 = llvm.lshr %893, %4  : i32
    %895 = llvm.sub %5, %894  : i32
    %896 = llvm.bitcast %895 : i32 to f32
    %897 = llvm.fmul %896, %896  : f32
    %898 = llvm.fmul %897, %892  : f32
    %899 = llvm.fsub %6, %898  : f32
    %900 = llvm.fmul %899, %897  : f32
    %901 = llvm.fsub %889, %41  : f32
    %902 = llvm.fmul %901, %900  : f32
    %903 = llvm.fmul %902, %39  : f32
    %904 = llvm.fadd %903, %40  : f32
    %905 = llvm.mul %36, %34  : i64
    %906 = llvm.mul %36, %33  : i64
    %907 = llvm.add %905, %906  : i64
    %908 = llvm.mul %37, %32  : i64
    %909 = llvm.add %907, %908  : i64
    %910 = llvm.add %909, %881  : i64
    %911 = llvm.getelementptr %arg5[%910] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %904, %911 : f32, !llvm.ptr
    %912 = llvm.add %43, %2  : i64
    llvm.br ^bb4(%912 : i64)
  ^bb6:  // pred: ^bb4
    %913 = llvm.add %37, %35  : i64
    llvm.br ^bb2(%913 : i64)
  ^bb7:  // pred: ^bb2
    llvm.return
  }
}
