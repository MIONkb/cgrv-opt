"func.func"() ({
^bb0(%arg0: memref<4x4xf32>, %arg1: memref<4x4xf32>):
  "cf.br"()[^bb1] : () -> ()
^bb1:  // pred: ^bb0
  %0 = "arith.constant"() {value = 0.000000e+00 : f32} : () -> f32
  %1 = "arith.constant"() {value = 3.40282347E+38 : f32} : () -> f32
  "affine.for"() ({
  ^bb0(%arg2: index):
    "affine.for"() ({
    ^bb0(%arg3: index):
      %2 = "affine.load"(%arg0, %arg2, %arg3) {map = affine_map<(d0, d1) -> (d0, d1)>} : (memref<4x4xf32>, index, index) -> f32
      %3 = "arith.cmpf"(%2, %0) {predicate = 4 : i64} : (f32, f32) -> i1
      %4 = "arith.select"(%3, %0, %2) : (i1, f32, f32) -> f32
      %5 = "arith.cmpf"(%1, %2) {predicate = 4 : i64} : (f32, f32) -> i1
      %6 = "arith.select"(%5, %1, %4) : (i1, f32, f32) -> f32
      "affine.store"(%6, %arg1, %arg2, %arg3) {map = affine_map<(d0, d1) -> (d0, d1)>} : (f32, memref<4x4xf32>, index, index) -> ()
      "affine.yield"() : () -> ()
    }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (4)>} : () -> ()
    "affine.yield"() : () -> ()
  }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (4)>} : () -> ()
  "func.return"() : () -> ()
}) {function_type = (memref<4x4xf32>, memref<4x4xf32>) -> (), main_kernel_14, sym_name = "main_kernel_14"} : () -> ()