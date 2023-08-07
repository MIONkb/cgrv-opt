"func.func"() <{function_type = (memref<1x64x112x112xf32>, memref<64xf32>, memref<64xf32>, memref<64xf32>, memref<64xf32>, memref<1x64x112x112xf32>) -> (), sym_name = "forward_kernel_3"}> ({
^bb0(%arg0: memref<1x64x112x112xf32>, %arg1: memref<64xf32>, %arg2: memref<64xf32>, %arg3: memref<64xf32>, %arg4: memref<64xf32>, %arg5: memref<1x64x112x112xf32>):
  "cf.br"()[^bb1] : () -> ()
^bb1:  // pred: ^bb0
  %0 = "arith.constant"() <{value = 1.000000e-05 : f64}> : () -> f64
  "affine.for"() ({
  ^bb0(%arg6: index):
    "affine.for"() ({
    ^bb0(%arg7: index):
      %1 = "affine.load"(%arg0, %arg6, %arg7) {map = affine_map<(d0, d1) -> (0, 0, d0, d1)>} : (memref<1x64x112x112xf32>, index, index) -> f32
      %2 = "affine.load"(%arg1) {map = affine_map<() -> (0)>} : (memref<64xf32>) -> f32
      %3 = "affine.load"(%arg2) {map = affine_map<() -> (0)>} : (memref<64xf32>) -> f32
      %4 = "affine.load"(%arg3) {map = affine_map<() -> (0)>} : (memref<64xf32>) -> f32
      %5 = "affine.load"(%arg4) {map = affine_map<() -> (0)>} : (memref<64xf32>) -> f32
      %6 = "arith.truncf"(%0) : (f64) -> f32
      %7 = "arith.addf"(%5, %6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %8 = "arith.constant"() <{value = 5.000000e-01 : f32}> : () -> f32
      %9 = "arith.mulf"(%7, %8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %10 = "arith.bitcast"(%7) : (f32) -> i32
      %11 = "arith.constant"() <{value = 1 : i32}> : () -> i32
      %12 = "arith.shrui"(%10, %11) : (i32, i32) -> i32
      %13 = "arith.constant"() <{value = 1597463007 : i32}> : () -> i32
      %14 = "arith.subi"(%13, %12) : (i32, i32) -> i32
      %15 = "arith.bitcast"(%14) : (i32) -> f32
      %16 = "arith.constant"() <{value = 1.500000e+00 : f32}> : () -> f32
      %17 = "arith.mulf"(%15, %15) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %18 = "arith.mulf"(%17, %9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %19 = "arith.subf"(%16, %18) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %20 = "arith.mulf"(%19, %17) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %21 = "arith.subf"(%1, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %22 = "arith.mulf"(%21, %20) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %23 = "arith.mulf"(%22, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %24 = "arith.addf"(%23, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.store"(%24, %arg5, %arg6, %arg7) {map = affine_map<(d0, d1) -> (0, 0, d0, d1)>} : (f32, memref<1x64x112x112xf32>, index, index) -> ()
      "affine.yield"() : () -> ()
    }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (112)>} : () -> ()
    "affine.yield"() : () -> ()
  }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (16)>} : () -> ()
  "func.return"() : () -> ()
}) {Kernel, forward_kernel_3} : () -> ()