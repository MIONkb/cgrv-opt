module attributes {torch.debug_module_name = "L"} {
  func.func @forward(%arg0: tensor<4x3xf32>) -> tensor<4x3xf32> {
    %0 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<3x12xf32>}> : () -> tensor<3x12xf32>
    %1 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<12x3xf32>}> : () -> tensor<12x3xf32>
    %2 = "tosa.const"() <{value = dense<[1, 0]> : tensor<2xi32>}> : () -> tensor<2xi32>
    %3 = "tosa.transpose"(%1, %2) : (tensor<12x3xf32>, tensor<2xi32>) -> tensor<3x12xf32>
    %4 = "tosa.reshape"(%arg0) <{new_shape = array<i64: 1, 4, 3>}> : (tensor<4x3xf32>) -> tensor<1x4x3xf32>
    %5 = "tosa.reshape"(%3) <{new_shape = array<i64: 1, 3, 12>}> : (tensor<3x12xf32>) -> tensor<1x3x12xf32>
    %6 = "tosa.matmul"(%4, %5) : (tensor<1x4x3xf32>, tensor<1x3x12xf32>) -> tensor<1x4x12xf32>
    %7 = "tosa.transpose"(%0, %2) : (tensor<3x12xf32>, tensor<2xi32>) -> tensor<12x3xf32>
    %8 = "tosa.reshape"(%7) <{new_shape = array<i64: 1, 12, 3>}> : (tensor<12x3xf32>) -> tensor<1x12x3xf32>
    %9 = "tosa.matmul"(%6, %8) : (tensor<1x4x12xf32>, tensor<1x12x3xf32>) -> tensor<1x4x3xf32>
    %10 = "tosa.reshape"(%9) <{new_shape = array<i64: 4, 3>}> : (tensor<1x4x3xf32>) -> tensor<4x3xf32>
    return %10 : tensor<4x3xf32>
  }
}

