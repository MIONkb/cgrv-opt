module attributes {torch.debug_module_name = "L"} {
  func.func @forward(%arg0: tensor<32x8xf32>) -> tensor<32x3xf32> {
    %0 = "tosa.const"() <{value = dense<[[0.478304356, 0.0737004951, -0.306562811], [-0.154098406, 0.0599629208, 0.489726633], [-0.0092765782, 0.0638684258, 0.418594033]]> : tensor<3x3xf32>}> : () -> tensor<3x3xf32>
    %1 = "tosa.const"() <{value = dense<[[-0.245211661, 0.016516339, -0.211933449, -0.203029081, 0.0475900285, -0.188470215, -0.0511890315, -0.202807844], [0.30564326, 0.0950599387, -0.103473589, 0.214562356, -0.0420327149, -0.0714734271, 0.290375561, -0.131697685], [-0.285068959, -0.215491697, -0.086695984, 3.299140e-01, 0.23083432, 0.0646392331, -0.128012449, 0.185790092]]> : tensor<3x8xf32>}> : () -> tensor<3x8xf32>
    %2 = "tosa.const"() <{value = dense<8.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %3 = "tosa.const"() <{value = dense<[1, 0]> : tensor<2xi32>}> : () -> tensor<2xi32>
    %4 = "tosa.const"() <{value = dense<3.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %5 = "tosa.const"() <{value = dense<5.000000e-01> : tensor<1x1xf32>}> : () -> tensor<1x1xf32>
    %6 = "tosa.const"() <{value = dense<7.810800e-02> : tensor<1x1xf32>}> : () -> tensor<1x1xf32>
    %7 = "tosa.const"() <{value = dense<9.720000e-04> : tensor<1x1xf32>}> : () -> tensor<1x1xf32>
    %8 = "tosa.const"() <{value = dense<2.303890e-01> : tensor<1x1xf32>}> : () -> tensor<1x1xf32>
    %9 = "tosa.const"() <{value = dense<2.783930e-01> : tensor<1x1xf32>}> : () -> tensor<1x1xf32>
    %10 = "tosa.const"() <{value = dense<1.000000e+00> : tensor<1x1xf32>}> : () -> tensor<1x1xf32>
    %11 = "tosa.const"() <{value = dense<0.000000e+00> : tensor<1x1xf32>}> : () -> tensor<1x1xf32>
    %12 = "tosa.const"() <{value = dense<0.707106769> : tensor<1x1xf32>}> : () -> tensor<1x1xf32>
    %13 = "tosa.const"() <{value = dense<9.99999974E-6> : tensor<1x1xf32>}> : () -> tensor<1x1xf32>
    %14 = "tosa.const"() <{value = dense<[[-5.868270e-02, 0.177850768, -0.0847491771]]> : tensor<1x3xf32>}> : () -> tensor<1x3xf32>
    %15 = "tosa.reciprocal"(%2) : (tensor<1xf32>) -> tensor<1xf32>
    %16 = "tosa.reduce_sum"(%arg0) <{axis = 1 : i64}> : (tensor<32x8xf32>) -> tensor<32x1xf32>
    %17 = "tosa.reshape"(%15) <{new_shape = array<i64: 1, 1>}> : (tensor<1xf32>) -> tensor<1x1xf32>
    %18 = "tosa.mul"(%16, %17) <{shift = 0 : i32}> : (tensor<32x1xf32>, tensor<1x1xf32>) -> tensor<32x1xf32>
    %19 = "tosa.sub"(%arg0, %18) : (tensor<32x8xf32>, tensor<32x1xf32>) -> tensor<32x8xf32>
    %20 = "tosa.mul"(%19, %19) <{shift = 0 : i32}> : (tensor<32x8xf32>, tensor<32x8xf32>) -> tensor<32x8xf32>
    %21 = "tosa.reduce_sum"(%20) <{axis = 1 : i64}> : (tensor<32x8xf32>) -> tensor<32x1xf32>
    %22 = "tosa.mul"(%21, %17) <{shift = 0 : i32}> : (tensor<32x1xf32>, tensor<1x1xf32>) -> tensor<32x1xf32>
    %23 = "tosa.add"(%22, %13) : (tensor<32x1xf32>, tensor<1x1xf32>) -> tensor<32x1xf32>
    %24 = "tosa.rsqrt"(%23) : (tensor<32x1xf32>) -> tensor<32x1xf32>
    %25 = "tosa.mul"(%19, %24) <{shift = 0 : i32}> : (tensor<32x8xf32>, tensor<32x1xf32>) -> tensor<32x8xf32>
    %26 = "tosa.transpose"(%1, %3) : (tensor<3x8xf32>, tensor<2xi32>) -> tensor<8x3xf32>
    %27 = "tosa.reshape"(%25) <{new_shape = array<i64: 1, 32, 8>}> : (tensor<32x8xf32>) -> tensor<1x32x8xf32>
    %28 = "tosa.reshape"(%26) <{new_shape = array<i64: 1, 8, 3>}> : (tensor<8x3xf32>) -> tensor<1x8x3xf32>
    %29 = "tosa.matmul"(%27, %28) : (tensor<1x32x8xf32>, tensor<1x8x3xf32>) -> tensor<1x32x3xf32>
    %30 = "tosa.reshape"(%29) <{new_shape = array<i64: 32, 3>}> : (tensor<1x32x3xf32>) -> tensor<32x3xf32>
    %31 = "tosa.add"(%30, %14) : (tensor<32x3xf32>, tensor<1x3xf32>) -> tensor<32x3xf32>
    %32 = "tosa.reciprocal"(%4) : (tensor<1xf32>) -> tensor<1xf32>
    %33 = "tosa.reduce_sum"(%31) <{axis = 1 : i64}> : (tensor<32x3xf32>) -> tensor<32x1xf32>
    %34 = "tosa.reshape"(%32) <{new_shape = array<i64: 1, 1>}> : (tensor<1xf32>) -> tensor<1x1xf32>
    %35 = "tosa.mul"(%33, %34) <{shift = 0 : i32}> : (tensor<32x1xf32>, tensor<1x1xf32>) -> tensor<32x1xf32>
    %36 = "tosa.sub"(%31, %35) : (tensor<32x3xf32>, tensor<32x1xf32>) -> tensor<32x3xf32>
    %37 = "tosa.mul"(%36, %36) <{shift = 0 : i32}> : (tensor<32x3xf32>, tensor<32x3xf32>) -> tensor<32x3xf32>
    %38 = "tosa.reduce_sum"(%37) <{axis = 1 : i64}> : (tensor<32x3xf32>) -> tensor<32x1xf32>
    %39 = "tosa.mul"(%38, %34) <{shift = 0 : i32}> : (tensor<32x1xf32>, tensor<1x1xf32>) -> tensor<32x1xf32>
    %40 = "tosa.add"(%39, %13) : (tensor<32x1xf32>, tensor<1x1xf32>) -> tensor<32x1xf32>
    %41 = "tosa.rsqrt"(%40) : (tensor<32x1xf32>) -> tensor<32x1xf32>
    %42 = "tosa.mul"(%36, %41) <{shift = 0 : i32}> : (tensor<32x3xf32>, tensor<32x1xf32>) -> tensor<32x3xf32>
    %43 = "tosa.transpose"(%0, %3) : (tensor<3x3xf32>, tensor<2xi32>) -> tensor<3x3xf32>
    %44 = "tosa.reshape"(%42) <{new_shape = array<i64: 1, 32, 3>}> : (tensor<32x3xf32>) -> tensor<1x32x3xf32>
    %45 = "tosa.reshape"(%43) <{new_shape = array<i64: 1, 3, 3>}> : (tensor<3x3xf32>) -> tensor<1x3x3xf32>
    %46 = "tosa.matmul"(%44, %45) : (tensor<1x32x3xf32>, tensor<1x3x3xf32>) -> tensor<1x32x3xf32>
    %47 = "tosa.reshape"(%46) <{new_shape = array<i64: 32, 3>}> : (tensor<1x32x3xf32>) -> tensor<32x3xf32>
    %48 = "tosa.mul"(%47, %12) <{shift = 0 : i32}> : (tensor<32x3xf32>, tensor<1x1xf32>) -> tensor<32x3xf32>
    %49 = "tosa.abs"(%48) : (tensor<32x3xf32>) -> tensor<32x3xf32>
    %50 = "tosa.mul"(%49, %9) <{shift = 0 : i32}> : (tensor<32x3xf32>, tensor<1x1xf32>) -> tensor<32x3xf32>
    %51 = "tosa.add"(%50, %10) : (tensor<32x3xf32>, tensor<1x1xf32>) -> tensor<32x3xf32>
    %52 = "tosa.mul"(%49, %49) <{shift = 0 : i32}> : (tensor<32x3xf32>, tensor<32x3xf32>) -> tensor<32x3xf32>
    %53 = "tosa.mul"(%52, %8) <{shift = 0 : i32}> : (tensor<32x3xf32>, tensor<1x1xf32>) -> tensor<32x3xf32>
    %54 = "tosa.add"(%51, %53) : (tensor<32x3xf32>, tensor<32x3xf32>) -> tensor<32x3xf32>
    %55 = "tosa.mul"(%52, %49) <{shift = 0 : i32}> : (tensor<32x3xf32>, tensor<32x3xf32>) -> tensor<32x3xf32>
    %56 = "tosa.mul"(%55, %7) <{shift = 0 : i32}> : (tensor<32x3xf32>, tensor<1x1xf32>) -> tensor<32x3xf32>
    %57 = "tosa.add"(%54, %56) : (tensor<32x3xf32>, tensor<32x3xf32>) -> tensor<32x3xf32>
    %58 = "tosa.mul"(%55, %49) <{shift = 0 : i32}> : (tensor<32x3xf32>, tensor<32x3xf32>) -> tensor<32x3xf32>
    %59 = "tosa.mul"(%58, %6) <{shift = 0 : i32}> : (tensor<32x3xf32>, tensor<1x1xf32>) -> tensor<32x3xf32>
    %60 = "tosa.add"(%57, %59) : (tensor<32x3xf32>, tensor<32x3xf32>) -> tensor<32x3xf32>
    %61 = "tosa.reciprocal"(%60) : (tensor<32x3xf32>) -> tensor<32x3xf32>
    %62 = "tosa.mul"(%61, %61) <{shift = 0 : i32}> : (tensor<32x3xf32>, tensor<32x3xf32>) -> tensor<32x3xf32>
    %63 = "tosa.mul"(%62, %62) <{shift = 0 : i32}> : (tensor<32x3xf32>, tensor<32x3xf32>) -> tensor<32x3xf32>
    %64 = "tosa.sub"(%10, %63) : (tensor<1x1xf32>, tensor<32x3xf32>) -> tensor<32x3xf32>
    %65 = "tosa.greater_equal"(%48, %11) : (tensor<32x3xf32>, tensor<1x1xf32>) -> tensor<32x3xi1>
    %66 = "tosa.negate"(%64) : (tensor<32x3xf32>) -> tensor<32x3xf32>
    %67 = "tosa.select"(%65, %64, %66) : (tensor<32x3xi1>, tensor<32x3xf32>, tensor<32x3xf32>) -> tensor<32x3xf32>
    %68 = "tosa.add"(%67, %10) : (tensor<32x3xf32>, tensor<1x1xf32>) -> tensor<32x3xf32>
    %69 = "tosa.mul"(%68, %5) <{shift = 0 : i32}> : (tensor<32x3xf32>, tensor<1x1xf32>) -> tensor<32x3xf32>
    %70 = "tosa.mul"(%47, %69) <{shift = 0 : i32}> : (tensor<32x3xf32>, tensor<32x3xf32>) -> tensor<32x3xf32>
    %71 = "tosa.reduce_max"(%70) <{axis = 1 : i64}> : (tensor<32x3xf32>) -> tensor<32x1xf32>
    %72 = "tosa.sub"(%70, %71) : (tensor<32x3xf32>, tensor<32x1xf32>) -> tensor<32x3xf32>
    %73 = "tosa.exp"(%72) : (tensor<32x3xf32>) -> tensor<32x3xf32>
    %74 = "tosa.reduce_sum"(%73) <{axis = 1 : i64}> : (tensor<32x3xf32>) -> tensor<32x1xf32>
    %75 = "tosa.reciprocal"(%74) : (tensor<32x1xf32>) -> tensor<32x1xf32>
    %76 = "tosa.mul"(%73, %75) <{shift = 0 : i32}> : (tensor<32x3xf32>, tensor<32x1xf32>) -> tensor<32x3xf32>
    return %76 : tensor<32x3xf32>
  }
}