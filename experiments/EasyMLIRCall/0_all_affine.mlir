module attributes {torch.debug_module_name = "L"} {
  func.func @forward(%a: memref<2xi32>, %b: memref<2xi32>) -> memref<2xi32> {
    %c = memref.alloc() {alignment = 64 : i64} : memref<2xi32> 
    affine.for %arg0 = 0 to 2 {
      %0 = affine.load %a[%arg0] : memref<2xi32>
      %1 = affine.load %b[%arg0] : memref<2xi32>
      %2 = arith.addi %0, %1 : i32
      affine.store  %2, %c[%arg0] : memref<2xi32>
    }
    return  %c : memref<2xi32>
  }
}

