"func.func"() <{function_type = (memref<1x64x112x112xf32>, memref<1x64x112x112xf32>) -> (), sym_name = "forward_kernel_2"}> ({
^bb0(%arg0: memref<1x64x112x112xf32>, %arg1: memref<1x64x112x112xf32>):
  "cf.br"()[^bb1] : () -> ()
^bb1:  // pred: ^bb0
  %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
  "affine.for"() ({
  ^bb0(%arg2: index):
    "affine.for"() ({
    ^bb0(%arg3: index):
      %1 = "affine.load"(%arg0, %arg2, %arg3) {map = affine_map<(d0, d1) -> (0, 0, d0, d1)>} : (memref<1x64x112x112xf32>, index, index) -> f32
      %2 = "arith.cmpf"(%1, %0) <{predicate = 9 : i64}> : (f32, f32) -> i1
      %3 = "arith.select"(%2, %1, %0) : (i1, f32, f32) -> f32
      "affine.store"(%3, %arg1, %arg2, %arg3) {map = affine_map<(d0, d1) -> (0, 0, d0, d1)>} : (f32, memref<1x64x112x112xf32>, index, index) -> ()
      "affine.yield"() : () -> ()
    }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (112)>} : () -> ()
    "affine.yield"() : () -> ()
  }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (16)>} : () -> ()
  "func.return"() : () -> ()
}) {Kernel, forward_kernel_2} : () -> ()