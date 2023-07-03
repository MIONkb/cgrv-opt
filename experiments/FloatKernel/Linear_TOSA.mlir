module attributes {torch.debug_module_name = "L"} {
  func.func @forward(%arg0: tensor<2x3xf32>) -> tensor<2x3xf32> {
    %0 = "tosa.const"() <{value = dense<[[-0.415798277, 0.157707065, 0.13065134], [-0.458860725, -0.0944703146, -0.40910387], [0.19170782, -0.139193341, -0.414218515]]> : tensor<3x3xf32>}> : () -> tensor<3x3xf32>
    %1 = "tosa.const"() <{value = dense<[1, 0]> : tensor<2xi32>}> : () -> tensor<2xi32>
    %2 = "tosa.transpose"(%0, %1) : (tensor<3x3xf32>, tensor<2xi32>) -> tensor<3x3xf32>
    %3 = "tosa.reshape"(%arg0) <{new_shape = array<i64: 1, 2, 3>}> : (tensor<2x3xf32>) -> tensor<1x2x3xf32>
    %4 = "tosa.reshape"(%2) <{new_shape = array<i64: 1, 3, 3>}> : (tensor<3x3xf32>) -> tensor<1x3x3xf32>
    %5 = "tosa.matmul"(%3, %4) : (tensor<1x2x3xf32>, tensor<1x3x3xf32>) -> tensor<1x2x3xf32>
    %6 = "tosa.reshape"(%5) <{new_shape = array<i64: 2, 3>}> : (tensor<1x2x3xf32>) -> tensor<2x3xf32>
    return %6 : tensor<2x3xf32>
  }
}

