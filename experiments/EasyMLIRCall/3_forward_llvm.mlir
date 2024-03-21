module attributes {llvm.data_layout = "", torch.debug_module_name = "L"} {
  llvm.func @malloc(i64) -> !llvm.ptr
  llvm.func @forward(%arg0: !llvm.ptr, %arg1: !llvm.ptr) -> !llvm.ptr {
    %0 = llvm.mlir.constant(64 : index) : i64
    %1 = llvm.mlir.constant(1 : index) : i64
    %2 = llvm.mlir.constant(5 : index) : i64
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.mlir.null : !llvm.ptr
    %5 = llvm.getelementptr %4[15] : (!llvm.ptr) -> !llvm.ptr, f32
    %6 = llvm.ptrtoint %5 : !llvm.ptr to i64
    %7 = llvm.add %6, %0  : i64
    %8 = llvm.call @malloc(%7) : (i64) -> !llvm.ptr
    %9 = llvm.ptrtoint %8 : !llvm.ptr to i64
    %10 = llvm.sub %0, %1  : i64
    %11 = llvm.add %9, %10  : i64
    %12 = llvm.urem %11, %0  : i64
    %13 = llvm.sub %11, %12  : i64
    %14 = llvm.inttoptr %13 : i64 to !llvm.ptr
    %15 = llvm.mul %3, %2  : i64
    %16 = llvm.add %15, %3  : i64
    %17 = llvm.getelementptr %arg0[%16] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %18 = llvm.getelementptr %arg1[%16] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %19 = llvm.getelementptr %14[%16] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.call @forward_kernel_0(%17, %18, %19) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    llvm.return %8 : !llvm.ptr
  }
  llvm.func @forward_kernel_0(!llvm.ptr, !llvm.ptr, !llvm.ptr) attributes {Kernel, forward_kernel_0}
}

