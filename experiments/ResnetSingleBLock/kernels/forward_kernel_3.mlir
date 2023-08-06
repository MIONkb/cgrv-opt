"func.func"() <{function_type = (memref<1x64x112x112xf32>, index, index, f32, f32, f32, f32, memref<1x64x112x112xf32>, index) -> (), sym_name = "forward_kernel_3"}> ({
^bb0(%arg0: memref<1x64x112x112xf32>, %arg1: index, %arg2: index, %arg3: f32, %arg4: f32, %arg5: f32, %arg6: f32, %arg7: memref<1x64x112x112xf32>, %arg8: index):
  "cf.br"()[^bb1] : () -> ()
^bb1:  // pred: ^bb0
  %0 = "arith.constant"() <{value = 1.000000e-05 : f64}> : () -> f64
  "affine.for"(%arg8, %arg8) ({
  ^bb0(%arg9: index):
    "affine.for"() ({
    ^bb0(%arg10: index):
      %1 = "affine.load"(%arg0, %arg1, %arg2, %arg9, %arg10) {map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>} : (memref<1x64x112x112xf32>, index, index, index, index) -> f32
      %2 = "arith.truncf"(%0) : (f64) -> f32
      %3 = "arith.addf"(%arg3, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.constant"() <{value = 5.000000e-01 : f32}> : () -> f32
      %5 = "arith.mulf"(%3, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %6 = "arith.bitcast"(%3) : (f32) -> i32
      %7 = "arith.constant"() <{value = 1 : i32}> : () -> i32
      %8 = "arith.shrui"(%6, %7) : (i32, i32) -> i32
      %9 = "arith.constant"() <{value = 1597463007 : i32}> : () -> i32
      %10 = "arith.subi"(%9, %8) : (i32, i32) -> i32
      %11 = "arith.bitcast"(%10) : (i32) -> f32
      %12 = "arith.constant"() <{value = 1.500000e+00 : f32}> : () -> f32
      %13 = "arith.mulf"(%11, %11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %14 = "arith.mulf"(%13, %5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %15 = "arith.subf"(%12, %14) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %16 = "arith.mulf"(%15, %13) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %17 = "arith.subf"(%1, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %18 = "arith.mulf"(%17, %16) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %19 = "arith.mulf"(%18, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %20 = "arith.addf"(%19, %arg6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.store"(%20, %arg7, %arg1, %arg2, %arg9, %arg10) {map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>} : (f32, memref<1x64x112x112xf32>, index, index, index, index) -> ()
      "affine.yield"() : () -> ()
    }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (112)>} : () -> ()
    "affine.yield"() : () -> ()
  }) {lower_bound = affine_map<(d0) -> (d0)>, step = 1 : index, upper_bound = affine_map<(d0) -> (d0 + 16)>} : (index, index) -> ()
  "func.return"() : () -> ()
}) {Kernel, forward_kernel_3} : () -> ()