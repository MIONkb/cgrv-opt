module attributes {soda.bambu.container_module, soda.container_module, tf.versions = {bad_consumers = [], min_consumer = 0 : i32, producer = 1087 : i32}} {
  func.func @main_kernel(%arg0: memref<4x35x35x1xf32> {llvm.noalias}, %arg1: memref<5x5x1x1xf32> {llvm.noalias}, %arg2: memref<4x16x16x1xf32> {llvm.noalias}) {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    linalg.conv_2d_nhwc_hwcf {dilations = dense<1> : tensor<2xi64>, strides = dense<2> : tensor<2xi64>} ins(%arg0, %arg1 : memref<4x35x35x1xf32>, memref<5x5x1x1xf32>) outs(%arg2 : memref<4x16x16x1xf32>)
    return
  }
}

