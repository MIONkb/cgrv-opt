module attributes {torch.debug_module_name = "L"} {
  func.func @forward(%arg0: tensor<3x3xf32>) -> tensor<3x3xf32> {
    %0 = "tosa.const"() <{value = dense<[[-0.533737481, 0.0726815313, 0.548144102], [0.339588523, -0.212466493, 0.129553705], [0.423136026, 0.46056211, -0.0355117619]]> : tensor<3x3xf32>}> : () -> tensor<3x3xf32>
    %1 = "tosa.const"() <{value = dense<[1, 0]> : tensor<2xi32>}> : () -> tensor<2xi32>
    %2 = "tosa.transpose"(%0, %1) : (tensor<3x3xf32>, tensor<2xi32>) -> tensor<3x3xf32>
    %3 = "tosa.reshape"(%arg0) <{new_shape = array<i64: 1, 3, 3>}> : (tensor<3x3xf32>) -> tensor<1x3x3xf32>
    %4 = "tosa.reshape"(%2) <{new_shape = array<i64: 1, 3, 3>}> : (tensor<3x3xf32>) -> tensor<1x3x3xf32>
    %5 = "tosa.matmul"(%3, %4) : (tensor<1x3x3xf32>, tensor<1x3x3xf32>) -> tensor<1x3x3xf32>
    %6 = "tosa.reshape"(%5) <{new_shape = array<i64: 3, 3>}> : (tensor<1x3x3xf32>) -> tensor<3x3xf32>
    return %6 : tensor<3x3xf32>
  }
}

