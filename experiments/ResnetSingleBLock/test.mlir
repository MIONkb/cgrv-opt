module attributes {torch.debug_module_name = "ResNet"} {
  ml_program.global private mutable @global_seed(dense<0> : tensor<i64>) : tensor<i64>
  func.func @forward() -> f32 {
    %1 = arith.constant 1.000000e-05 : f32
    %2 = math.rsqrt %1 : f32
    return %2 : f32
  }
}

