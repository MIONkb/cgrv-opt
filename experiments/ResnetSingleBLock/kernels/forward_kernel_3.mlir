"func.func"() <{function_type = (memref<1x64x112x112xf32>, f32, f32, f32, f32, memref<1x64x112x112xf32>) -> (), sym_name = "forward_kernel_3"}> ({
^bb0(%arg0: memref<1x64x112x112xf32>, %arg1: f32, %arg2: f32, %arg3: f32, %arg4: f32, %arg5: memref<1x64x112x112xf32>):
  "cf.br"()[^bb1] : () -> ()
^bb1:  // pred: ^bb0
  %0 = "arith.constant"() <{value = 1.000000e-05 : f64}> : () -> f64
  "affine.for"() ({
  ^bb0(%arg6: index):
    "affine.for"() ({
    ^bb0(%arg7: index):
      %1 = "affine.load"(%arg0, %arg6, %arg7) {map = affine_map<(d0, d1) -> (0, 0, d0, d1)>} : (memref<1x64x112x112xf32>, index, index) -> f32
      %2 = "arith.truncf"(%0) : (f64) -> f32
      %3 = "arith.addf"(%arg1, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
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
      %17 = "arith.subf"(%1, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %18 = "arith.mulf"(%17, %16) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %19 = "arith.mulf"(%18, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %20 = "arith.addf"(%19, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.store"(%20, %arg5, %arg6, %arg7) {map = affine_map<(d0, d1) -> (0, 0, d0, d1)>} : (f32, memref<1x64x112x112xf32>, index, index) -> ()
      "affine.yield"() : () -> ()
    }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (112)>} : () -> ()
    "affine.yield"() : () -> ()
  }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (16)>} : () -> ()
  "func.return"() : () -> ()
}) {Kernel, forward_kernel_3} : () -> ()