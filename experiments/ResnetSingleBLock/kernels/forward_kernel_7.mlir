"func.func"() <{function_type = (memref<1x64x114x114xf32>, memref<1x64x56x56xf32>, memref<1x64x56x56xf32>) -> (), sym_name = "forward_kernel_7"}> ({
^bb0(%arg0: memref<1x64x114x114xf32>, %arg1: memref<1x64x56x56xf32>, %arg2: memref<1x64x56x56xf32>):
  "cf.br"()[^bb1] : () -> ()
^bb1:  // pred: ^bb0
  "affine.for"() ({
  ^bb0(%arg3: index):
    "affine.for"() ({
    ^bb0(%arg4: index):
      "affine.for"() ({
      ^bb0(%arg5: index):
        "affine.for"() ({
        ^bb0(%arg6: index):
          %0 = "affine.load"(%arg0, %arg3, %arg5, %arg4, %arg6) {map = affine_map<(d0, d1, d2, d3) -> (0, 0, d0 * 2 + d1, d2 * 2 + d3)>} : (memref<1x64x114x114xf32>, index, index, index, index) -> f32
          %1 = "affine.load"(%arg1, %arg3, %arg4) {map = affine_map<(d0, d1) -> (0, 0, d0, d1)>} : (memref<1x64x56x56xf32>, index, index) -> f32
          %2 = "arith.cmpf"(%1, %0) <{predicate = 9 : i64}> : (f32, f32) -> i1
          %3 = "arith.select"(%2, %1, %0) : (i1, f32, f32) -> f32
          %4 = "arith.cmpf"(%0, %0) <{predicate = 14 : i64}> : (f32, f32) -> i1
          %5 = "arith.select"(%4, %0, %3) : (i1, f32, f32) -> f32
          "affine.store"(%5, %arg2, %arg3, %arg4) {map = affine_map<(d0, d1) -> (0, 0, d0, d1)>} : (f32, memref<1x64x56x56xf32>, index, index) -> ()
          "affine.yield"() : () -> ()
        }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (3)>} : () -> ()
        "affine.yield"() : () -> ()
      }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (3)>} : () -> ()
      "affine.yield"() : () -> ()
    }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (56)>} : () -> ()
    "affine.yield"() : () -> ()
  }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (4)>} : () -> ()
  "func.return"() : () -> ()
}) {Kernel, forward_kernel_7} : () -> ()