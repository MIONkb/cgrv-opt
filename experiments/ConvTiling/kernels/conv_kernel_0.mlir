"func.func"() ({
^bb0(%arg0: memref<1x5x224x3xi32>, %arg1: memref<1x3x3x3xi32>, %arg2: i32, %arg3: memref<1x3x222x1xi32>, %arg4: index):
  "cf.br"()[^bb1] : () -> ()
^bb1:  // pred: ^bb0
  %0 = "arith.constant"() {value = true} : () -> i1
  %1 = "arith.constant"() {value = 224 : i32} : () -> i32
  %2 = "arith.constant"() {value = 0 : i32} : () -> i32
  %3 = "arith.constant"() {value = 2147483647 : i32} : () -> i32
  %4 = "arith.constant"() {value = 2147483647 : i64} : () -> i64
  %5 = "arith.constant"() {value = -2147483648 : i64} : () -> i64
  "affine.for"() ({
  ^bb0(%arg5: index):
    %6 = "arith.index_cast"(%arg5) : (index) -> i32
    "affine.for"() ({
    ^bb0(%arg6: index):
      %7 = "arith.index_cast"(%arg6) : (index) -> i32
      %8 = "affine.for"(%2) ({
      ^bb0(%arg7: index, %arg8: i32):
        %13 = "arith.index_cast"(%arg7) : (index) -> i32
        %14 = "arith.addi"(%6, %13) : (i32, i32) -> i32
        %15 = "affine.if"(%arg5, %arg7) ({
          "affine.yield"(%0) : (i1) -> ()
        }, {
          %17 = "arith.cmpi"(%14, %1) {predicate = 5 : i64} : (i32, i32) -> i1
          "affine.yield"(%17) : (i1) -> ()
        }) {condition = affine_set<(d0, d1) : (-d0 - d1 - 1 >= 0)>} : (index, index) -> i1
        %16 = "affine.for"(%arg8) ({
        ^bb0(%arg9: index, %arg10: i32):
          %17 = "arith.index_cast"(%arg9) : (index) -> i32
          %18 = "arith.addi"(%7, %17) : (i32, i32) -> i32
          %19 = "scf.if"(%15) ({
            "scf.yield"(%0) : (i1) -> ()
          }, {
            %22 = "arith.cmpi"(%18, %2) {predicate = 2 : i64} : (i32, i32) -> i1
            "scf.yield"(%22) : (i1) -> ()
          }) : (i1) -> i1
          %20 = "scf.if"(%19) ({
            "scf.yield"(%0) : (i1) -> ()
          }, {
            %22 = "arith.cmpi"(%18, %1) {predicate = 5 : i64} : (i32, i32) -> i1
            "scf.yield"(%22) : (i1) -> ()
          }) : (i1) -> i1
          %21 = "affine.for"(%arg10) ({
          ^bb0(%arg11: index, %arg12: i32):
            %22 = "scf.if"(%20) ({
              "scf.yield"(%2) : (i32) -> ()
            }, {
              %26 = "affine.load"(%arg0, %arg5, %arg7, %arg6, %arg9, %arg11) {map = affine_map<(d0, d1, d2, d3, d4) -> (0, d0 + d1, d2 + d3, d4)>} : (memref<1x5x224x3xi32>, index, index, index, index, index) -> i32
              "scf.yield"(%26) : (i32) -> ()
            }) : (i1) -> i32
            %23 = "affine.load"(%arg1, %arg7, %arg9, %arg11) {map = affine_map<(d0, d1, d2) -> (0, d0, d1, d2)>} : (memref<1x3x3x3xi32>, index, index, index) -> i32
            %24 = "arith.muli"(%23, %22) : (i32, i32) -> i32
            %25 = "arith.addi"(%arg12, %24) : (i32, i32) -> i32
            "affine.yield"(%25) : (i32) -> ()
          }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (3)>} : (i32) -> i32
          "affine.yield"(%21) : (i32) -> ()
        }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (3)>} : (i32) -> i32
        "affine.yield"(%16) : (i32) -> ()
      }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (3)>} : (i32) -> i32
      %9 = "arith.addi"(%8, %arg2) : (i32, i32) -> i32
      %10 = "arith.cmpi"(%9, %3) {predicate = 4 : i64} : (i32, i32) -> i1
      %11 = "scf.if"(%10) ({
        "scf.yield"(%4) : (i64) -> ()
      }, {
        %13 = "arith.extsi"(%9) : (i32) -> i64
        %14 = "arith.cmpi"(%13, %5) {predicate = 2 : i64} : (i64, i64) -> i1
        %15 = "arith.select"(%14, %5, %13) : (i1, i64, i64) -> i64
        "scf.yield"(%15) : (i64) -> ()
      }) : (i1) -> i64
      %12 = "arith.trunci"(%11) : (i64) -> i32
      "affine.store"(%12, %arg3, %arg5, %arg6, %arg4) {map = affine_map<(d0, d1, d2) -> (0, d0, d1, d2)>} : (i32, memref<1x3x222x1xi32>, index, index, index) -> ()
      "affine.yield"() : () -> ()
    }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (222)>} : () -> ()
    "affine.yield"() : () -> ()
  }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (3)>} : () -> ()
  "func.return"() : () -> ()
}) {Kernel, conv_kernel_0, function_type = (memref<1x5x224x3xi32>, memref<1x3x3x3xi32>, i32, memref<1x3x222x1xi32>, index) -> (), sym_name = "conv_kernel_0"} : () -> ()