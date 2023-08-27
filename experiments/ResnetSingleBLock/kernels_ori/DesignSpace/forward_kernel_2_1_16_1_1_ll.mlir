module attributes {llvm.data_layout = ""} {
  llvm.func @forward_kernel_2(%arg0: !llvm.ptr, %arg1: !llvm.ptr) attributes {Kernel, forward_kernel_2} {
    %0 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    %1 = llvm.mlir.constant(16 : index) : i64
    %2 = llvm.mlir.constant(2 : index) : i64
    %3 = llvm.mlir.constant(3 : index) : i64
    %4 = llvm.mlir.constant(4 : index) : i64
    %5 = llvm.mlir.constant(5 : index) : i64
    %6 = llvm.mlir.constant(6 : index) : i64
    %7 = llvm.mlir.constant(7 : index) : i64
    %8 = llvm.mlir.constant(8 : index) : i64
    %9 = llvm.mlir.constant(9 : index) : i64
    %10 = llvm.mlir.constant(10 : index) : i64
    %11 = llvm.mlir.constant(11 : index) : i64
    %12 = llvm.mlir.constant(12 : index) : i64
    %13 = llvm.mlir.constant(13 : index) : i64
    %14 = llvm.mlir.constant(14 : index) : i64
    %15 = llvm.mlir.constant(15 : index) : i64
    %16 = llvm.mlir.constant(112 : index) : i64
    %17 = llvm.mlir.constant(12544 : index) : i64
    %18 = llvm.mlir.constant(802816 : index) : i64
    %19 = llvm.mlir.constant(1 : index) : i64
    %20 = llvm.mlir.constant(0 : index) : i64
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%20 : i64)
  ^bb2(%21: i64):  // 2 preds: ^bb1, ^bb6
    %22 = llvm.icmp "slt" %21, %1 : i64
    llvm.cond_br %22, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%20 : i64)
  ^bb4(%23: i64):  // 2 preds: ^bb3, ^bb5
    %24 = llvm.icmp "slt" %23, %16 : i64
    llvm.cond_br %24, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %25 = llvm.mul %20, %18  : i64
    %26 = llvm.mul %20, %17  : i64
    %27 = llvm.add %25, %26  : i64
    %28 = llvm.mul %21, %16  : i64
    %29 = llvm.add %27, %28  : i64
    %30 = llvm.add %29, %23  : i64
    %31 = llvm.getelementptr %arg0[%30] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %32 = llvm.load %31 : !llvm.ptr -> f32
    %33 = llvm.fcmp "ugt" %32, %0 : f32
    %34 = llvm.select %33, %32, %0 : i1, f32
    %35 = llvm.mul %20, %18  : i64
    %36 = llvm.mul %20, %17  : i64
    %37 = llvm.add %35, %36  : i64
    %38 = llvm.mul %21, %16  : i64
    %39 = llvm.add %37, %38  : i64
    %40 = llvm.add %39, %23  : i64
    %41 = llvm.getelementptr %arg1[%40] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %34, %41 : f32, !llvm.ptr
    %42 = llvm.add %23, %19  : i64
    %43 = llvm.mul %20, %18  : i64
    %44 = llvm.mul %20, %17  : i64
    %45 = llvm.add %43, %44  : i64
    %46 = llvm.mul %21, %16  : i64
    %47 = llvm.add %45, %46  : i64
    %48 = llvm.add %47, %42  : i64
    %49 = llvm.getelementptr %arg0[%48] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %50 = llvm.load %49 : !llvm.ptr -> f32
    %51 = llvm.fcmp "ugt" %50, %0 : f32
    %52 = llvm.select %51, %50, %0 : i1, f32
    %53 = llvm.mul %20, %18  : i64
    %54 = llvm.mul %20, %17  : i64
    %55 = llvm.add %53, %54  : i64
    %56 = llvm.mul %21, %16  : i64
    %57 = llvm.add %55, %56  : i64
    %58 = llvm.add %57, %42  : i64
    %59 = llvm.getelementptr %arg1[%58] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %52, %59 : f32, !llvm.ptr
    %60 = llvm.add %23, %2  : i64
    %61 = llvm.mul %20, %18  : i64
    %62 = llvm.mul %20, %17  : i64
    %63 = llvm.add %61, %62  : i64
    %64 = llvm.mul %21, %16  : i64
    %65 = llvm.add %63, %64  : i64
    %66 = llvm.add %65, %60  : i64
    %67 = llvm.getelementptr %arg0[%66] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %68 = llvm.load %67 : !llvm.ptr -> f32
    %69 = llvm.fcmp "ugt" %68, %0 : f32
    %70 = llvm.select %69, %68, %0 : i1, f32
    %71 = llvm.mul %20, %18  : i64
    %72 = llvm.mul %20, %17  : i64
    %73 = llvm.add %71, %72  : i64
    %74 = llvm.mul %21, %16  : i64
    %75 = llvm.add %73, %74  : i64
    %76 = llvm.add %75, %60  : i64
    %77 = llvm.getelementptr %arg1[%76] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %70, %77 : f32, !llvm.ptr
    %78 = llvm.add %23, %3  : i64
    %79 = llvm.mul %20, %18  : i64
    %80 = llvm.mul %20, %17  : i64
    %81 = llvm.add %79, %80  : i64
    %82 = llvm.mul %21, %16  : i64
    %83 = llvm.add %81, %82  : i64
    %84 = llvm.add %83, %78  : i64
    %85 = llvm.getelementptr %arg0[%84] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %86 = llvm.load %85 : !llvm.ptr -> f32
    %87 = llvm.fcmp "ugt" %86, %0 : f32
    %88 = llvm.select %87, %86, %0 : i1, f32
    %89 = llvm.mul %20, %18  : i64
    %90 = llvm.mul %20, %17  : i64
    %91 = llvm.add %89, %90  : i64
    %92 = llvm.mul %21, %16  : i64
    %93 = llvm.add %91, %92  : i64
    %94 = llvm.add %93, %78  : i64
    %95 = llvm.getelementptr %arg1[%94] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %88, %95 : f32, !llvm.ptr
    %96 = llvm.add %23, %4  : i64
    %97 = llvm.mul %20, %18  : i64
    %98 = llvm.mul %20, %17  : i64
    %99 = llvm.add %97, %98  : i64
    %100 = llvm.mul %21, %16  : i64
    %101 = llvm.add %99, %100  : i64
    %102 = llvm.add %101, %96  : i64
    %103 = llvm.getelementptr %arg0[%102] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %104 = llvm.load %103 : !llvm.ptr -> f32
    %105 = llvm.fcmp "ugt" %104, %0 : f32
    %106 = llvm.select %105, %104, %0 : i1, f32
    %107 = llvm.mul %20, %18  : i64
    %108 = llvm.mul %20, %17  : i64
    %109 = llvm.add %107, %108  : i64
    %110 = llvm.mul %21, %16  : i64
    %111 = llvm.add %109, %110  : i64
    %112 = llvm.add %111, %96  : i64
    %113 = llvm.getelementptr %arg1[%112] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %106, %113 : f32, !llvm.ptr
    %114 = llvm.add %23, %5  : i64
    %115 = llvm.mul %20, %18  : i64
    %116 = llvm.mul %20, %17  : i64
    %117 = llvm.add %115, %116  : i64
    %118 = llvm.mul %21, %16  : i64
    %119 = llvm.add %117, %118  : i64
    %120 = llvm.add %119, %114  : i64
    %121 = llvm.getelementptr %arg0[%120] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %122 = llvm.load %121 : !llvm.ptr -> f32
    %123 = llvm.fcmp "ugt" %122, %0 : f32
    %124 = llvm.select %123, %122, %0 : i1, f32
    %125 = llvm.mul %20, %18  : i64
    %126 = llvm.mul %20, %17  : i64
    %127 = llvm.add %125, %126  : i64
    %128 = llvm.mul %21, %16  : i64
    %129 = llvm.add %127, %128  : i64
    %130 = llvm.add %129, %114  : i64
    %131 = llvm.getelementptr %arg1[%130] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %124, %131 : f32, !llvm.ptr
    %132 = llvm.add %23, %6  : i64
    %133 = llvm.mul %20, %18  : i64
    %134 = llvm.mul %20, %17  : i64
    %135 = llvm.add %133, %134  : i64
    %136 = llvm.mul %21, %16  : i64
    %137 = llvm.add %135, %136  : i64
    %138 = llvm.add %137, %132  : i64
    %139 = llvm.getelementptr %arg0[%138] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %140 = llvm.load %139 : !llvm.ptr -> f32
    %141 = llvm.fcmp "ugt" %140, %0 : f32
    %142 = llvm.select %141, %140, %0 : i1, f32
    %143 = llvm.mul %20, %18  : i64
    %144 = llvm.mul %20, %17  : i64
    %145 = llvm.add %143, %144  : i64
    %146 = llvm.mul %21, %16  : i64
    %147 = llvm.add %145, %146  : i64
    %148 = llvm.add %147, %132  : i64
    %149 = llvm.getelementptr %arg1[%148] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %142, %149 : f32, !llvm.ptr
    %150 = llvm.add %23, %7  : i64
    %151 = llvm.mul %20, %18  : i64
    %152 = llvm.mul %20, %17  : i64
    %153 = llvm.add %151, %152  : i64
    %154 = llvm.mul %21, %16  : i64
    %155 = llvm.add %153, %154  : i64
    %156 = llvm.add %155, %150  : i64
    %157 = llvm.getelementptr %arg0[%156] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %158 = llvm.load %157 : !llvm.ptr -> f32
    %159 = llvm.fcmp "ugt" %158, %0 : f32
    %160 = llvm.select %159, %158, %0 : i1, f32
    %161 = llvm.mul %20, %18  : i64
    %162 = llvm.mul %20, %17  : i64
    %163 = llvm.add %161, %162  : i64
    %164 = llvm.mul %21, %16  : i64
    %165 = llvm.add %163, %164  : i64
    %166 = llvm.add %165, %150  : i64
    %167 = llvm.getelementptr %arg1[%166] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %160, %167 : f32, !llvm.ptr
    %168 = llvm.add %23, %8  : i64
    %169 = llvm.mul %20, %18  : i64
    %170 = llvm.mul %20, %17  : i64
    %171 = llvm.add %169, %170  : i64
    %172 = llvm.mul %21, %16  : i64
    %173 = llvm.add %171, %172  : i64
    %174 = llvm.add %173, %168  : i64
    %175 = llvm.getelementptr %arg0[%174] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %176 = llvm.load %175 : !llvm.ptr -> f32
    %177 = llvm.fcmp "ugt" %176, %0 : f32
    %178 = llvm.select %177, %176, %0 : i1, f32
    %179 = llvm.mul %20, %18  : i64
    %180 = llvm.mul %20, %17  : i64
    %181 = llvm.add %179, %180  : i64
    %182 = llvm.mul %21, %16  : i64
    %183 = llvm.add %181, %182  : i64
    %184 = llvm.add %183, %168  : i64
    %185 = llvm.getelementptr %arg1[%184] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %178, %185 : f32, !llvm.ptr
    %186 = llvm.add %23, %9  : i64
    %187 = llvm.mul %20, %18  : i64
    %188 = llvm.mul %20, %17  : i64
    %189 = llvm.add %187, %188  : i64
    %190 = llvm.mul %21, %16  : i64
    %191 = llvm.add %189, %190  : i64
    %192 = llvm.add %191, %186  : i64
    %193 = llvm.getelementptr %arg0[%192] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %194 = llvm.load %193 : !llvm.ptr -> f32
    %195 = llvm.fcmp "ugt" %194, %0 : f32
    %196 = llvm.select %195, %194, %0 : i1, f32
    %197 = llvm.mul %20, %18  : i64
    %198 = llvm.mul %20, %17  : i64
    %199 = llvm.add %197, %198  : i64
    %200 = llvm.mul %21, %16  : i64
    %201 = llvm.add %199, %200  : i64
    %202 = llvm.add %201, %186  : i64
    %203 = llvm.getelementptr %arg1[%202] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %196, %203 : f32, !llvm.ptr
    %204 = llvm.add %23, %10  : i64
    %205 = llvm.mul %20, %18  : i64
    %206 = llvm.mul %20, %17  : i64
    %207 = llvm.add %205, %206  : i64
    %208 = llvm.mul %21, %16  : i64
    %209 = llvm.add %207, %208  : i64
    %210 = llvm.add %209, %204  : i64
    %211 = llvm.getelementptr %arg0[%210] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %212 = llvm.load %211 : !llvm.ptr -> f32
    %213 = llvm.fcmp "ugt" %212, %0 : f32
    %214 = llvm.select %213, %212, %0 : i1, f32
    %215 = llvm.mul %20, %18  : i64
    %216 = llvm.mul %20, %17  : i64
    %217 = llvm.add %215, %216  : i64
    %218 = llvm.mul %21, %16  : i64
    %219 = llvm.add %217, %218  : i64
    %220 = llvm.add %219, %204  : i64
    %221 = llvm.getelementptr %arg1[%220] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %214, %221 : f32, !llvm.ptr
    %222 = llvm.add %23, %11  : i64
    %223 = llvm.mul %20, %18  : i64
    %224 = llvm.mul %20, %17  : i64
    %225 = llvm.add %223, %224  : i64
    %226 = llvm.mul %21, %16  : i64
    %227 = llvm.add %225, %226  : i64
    %228 = llvm.add %227, %222  : i64
    %229 = llvm.getelementptr %arg0[%228] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %230 = llvm.load %229 : !llvm.ptr -> f32
    %231 = llvm.fcmp "ugt" %230, %0 : f32
    %232 = llvm.select %231, %230, %0 : i1, f32
    %233 = llvm.mul %20, %18  : i64
    %234 = llvm.mul %20, %17  : i64
    %235 = llvm.add %233, %234  : i64
    %236 = llvm.mul %21, %16  : i64
    %237 = llvm.add %235, %236  : i64
    %238 = llvm.add %237, %222  : i64
    %239 = llvm.getelementptr %arg1[%238] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %232, %239 : f32, !llvm.ptr
    %240 = llvm.add %23, %12  : i64
    %241 = llvm.mul %20, %18  : i64
    %242 = llvm.mul %20, %17  : i64
    %243 = llvm.add %241, %242  : i64
    %244 = llvm.mul %21, %16  : i64
    %245 = llvm.add %243, %244  : i64
    %246 = llvm.add %245, %240  : i64
    %247 = llvm.getelementptr %arg0[%246] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %248 = llvm.load %247 : !llvm.ptr -> f32
    %249 = llvm.fcmp "ugt" %248, %0 : f32
    %250 = llvm.select %249, %248, %0 : i1, f32
    %251 = llvm.mul %20, %18  : i64
    %252 = llvm.mul %20, %17  : i64
    %253 = llvm.add %251, %252  : i64
    %254 = llvm.mul %21, %16  : i64
    %255 = llvm.add %253, %254  : i64
    %256 = llvm.add %255, %240  : i64
    %257 = llvm.getelementptr %arg1[%256] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %250, %257 : f32, !llvm.ptr
    %258 = llvm.add %23, %13  : i64
    %259 = llvm.mul %20, %18  : i64
    %260 = llvm.mul %20, %17  : i64
    %261 = llvm.add %259, %260  : i64
    %262 = llvm.mul %21, %16  : i64
    %263 = llvm.add %261, %262  : i64
    %264 = llvm.add %263, %258  : i64
    %265 = llvm.getelementptr %arg0[%264] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %266 = llvm.load %265 : !llvm.ptr -> f32
    %267 = llvm.fcmp "ugt" %266, %0 : f32
    %268 = llvm.select %267, %266, %0 : i1, f32
    %269 = llvm.mul %20, %18  : i64
    %270 = llvm.mul %20, %17  : i64
    %271 = llvm.add %269, %270  : i64
    %272 = llvm.mul %21, %16  : i64
    %273 = llvm.add %271, %272  : i64
    %274 = llvm.add %273, %258  : i64
    %275 = llvm.getelementptr %arg1[%274] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %268, %275 : f32, !llvm.ptr
    %276 = llvm.add %23, %14  : i64
    %277 = llvm.mul %20, %18  : i64
    %278 = llvm.mul %20, %17  : i64
    %279 = llvm.add %277, %278  : i64
    %280 = llvm.mul %21, %16  : i64
    %281 = llvm.add %279, %280  : i64
    %282 = llvm.add %281, %276  : i64
    %283 = llvm.getelementptr %arg0[%282] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %284 = llvm.load %283 : !llvm.ptr -> f32
    %285 = llvm.fcmp "ugt" %284, %0 : f32
    %286 = llvm.select %285, %284, %0 : i1, f32
    %287 = llvm.mul %20, %18  : i64
    %288 = llvm.mul %20, %17  : i64
    %289 = llvm.add %287, %288  : i64
    %290 = llvm.mul %21, %16  : i64
    %291 = llvm.add %289, %290  : i64
    %292 = llvm.add %291, %276  : i64
    %293 = llvm.getelementptr %arg1[%292] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %286, %293 : f32, !llvm.ptr
    %294 = llvm.add %23, %15  : i64
    %295 = llvm.mul %20, %18  : i64
    %296 = llvm.mul %20, %17  : i64
    %297 = llvm.add %295, %296  : i64
    %298 = llvm.mul %21, %16  : i64
    %299 = llvm.add %297, %298  : i64
    %300 = llvm.add %299, %294  : i64
    %301 = llvm.getelementptr %arg0[%300] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %302 = llvm.load %301 : !llvm.ptr -> f32
    %303 = llvm.fcmp "ugt" %302, %0 : f32
    %304 = llvm.select %303, %302, %0 : i1, f32
    %305 = llvm.mul %20, %18  : i64
    %306 = llvm.mul %20, %17  : i64
    %307 = llvm.add %305, %306  : i64
    %308 = llvm.mul %21, %16  : i64
    %309 = llvm.add %307, %308  : i64
    %310 = llvm.add %309, %294  : i64
    %311 = llvm.getelementptr %arg1[%310] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %304, %311 : f32, !llvm.ptr
    %312 = llvm.add %23, %1  : i64
    llvm.br ^bb4(%312 : i64)
  ^bb6:  // pred: ^bb4
    %313 = llvm.add %21, %19  : i64
    llvm.br ^bb2(%313 : i64)
  ^bb7:  // pred: ^bb2
    llvm.return
  }
}

