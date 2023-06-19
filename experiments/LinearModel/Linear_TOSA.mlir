module attributes {torch.debug_module_name = "L"} {
  func.func @forward(%arg0: tensor<4x3xf32>) -> tensor<4x3xf32> {
    %0 = "tosa.const"() <{value = dense<[[0.569071651, -0.473457456, 0.519209445], [-0.231614307, -0.085622929, 5.772530e-01], [-0.09853556, -0.0144386981, 0.368846387]]> : tensor<3x3xf32>}> : () -> tensor<3x3xf32>
    %1 = "tosa.const"() <{value = dense<[1, 0]> : tensor<2xi32>}> : () -> tensor<2xi32>
    %2 = "tosa.transpose"(%0, %1) : (tensor<3x3xf32>, tensor<2xi32>) -> tensor<3x3xf32>
    %3 = "tosa.reshape"(%arg0) <{new_shape = array<i64: 1, 4, 3>}> : (tensor<4x3xf32>) -> tensor<1x4x3xf32>
    %4 = "tosa.reshape"(%2) <{new_shape = array<i64: 1, 3, 3>}> : (tensor<3x3xf32>) -> tensor<1x3x3xf32>
    %5 = "tosa.matmul"(%3, %4) : (tensor<1x4x3xf32>, tensor<1x3x3xf32>) -> tensor<1x4x3xf32>
    %6 = "tosa.reshape"(%5) <{new_shape = array<i64: 4, 3>}> : (tensor<1x4x3xf32>) -> tensor<4x3xf32>
    return %6 : tensor<4x3xf32>
  }
}