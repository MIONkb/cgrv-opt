module attributes {llvm.data_layout = ""} {
  llvm.func @forward_kernel_1(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr, %arg3: !llvm.ptr, %arg4: !llvm.ptr, %arg5: !llvm.ptr) attributes {Kernel, forward_kernel_1} {
    %0 = llvm.mlir.constant(1.000000e-05 : f64) : f64
    %1 = llvm.mlir.constant(16 : index) : i64
    %2 = llvm.mlir.constant(2 : index) : i64
    %3 = llvm.mlir.constant(5.000000e-01 : f32) : f32
    %4 = llvm.mlir.constant(1 : i32) : i32
    %5 = llvm.mlir.constant(1597463007 : i32) : i32
    %6 = llvm.mlir.constant(1.500000e+00 : f32) : f32
    %7 = llvm.mlir.constant(112 : index) : i64
    %8 = llvm.mlir.constant(12544 : index) : i64
    %9 = llvm.mlir.constant(802816 : index) : i64
    %10 = llvm.mlir.constant(1 : index) : i64
    %11 = llvm.mlir.constant(0 : index) : i64
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%11 : i64)
  ^bb2(%12: i64):  // 2 preds: ^bb1, ^bb6
    %13 = llvm.icmp "slt" %12, %1 : i64
    llvm.cond_br %13, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    %14 = llvm.load %arg0 : !llvm.ptr -> f32
    %15 = llvm.load %arg1 : !llvm.ptr -> f32
    %16 = llvm.load %arg2 : !llvm.ptr -> f32
    %17 = llvm.load %arg3 : !llvm.ptr -> f32
    llvm.br ^bb4(%11 : i64)
  ^bb4(%18: i64):  // 2 preds: ^bb3, ^bb5
    %19 = llvm.icmp "slt" %18, %7 : i64
    llvm.cond_br %19, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %20 = llvm.mul %11, %9  : i64
    %21 = llvm.mul %11, %8  : i64
    %22 = llvm.add %20, %21  : i64
    %23 = llvm.mul %12, %7  : i64
    %24 = llvm.add %22, %23  : i64
    %25 = llvm.add %24, %18  : i64
    %26 = llvm.getelementptr %arg4[%25] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %27 = llvm.load %26 : !llvm.ptr -> f32
    %28 = llvm.fptrunc %0 : f64 to f32
    %29 = llvm.fadd %17, %28  : f32
    %30 = llvm.fmul %29, %3  : f32
    %31 = llvm.bitcast %29 : f32 to i32
    %32 = llvm.lshr %31, %4  : i32
    %33 = llvm.sub %5, %32  : i32
    %34 = llvm.bitcast %33 : i32 to f32
    %35 = llvm.fmul %34, %34  : f32
    %36 = llvm.fmul %35, %30  : f32
    %37 = llvm.fsub %6, %36  : f32
    %38 = llvm.fmul %37, %35  : f32
    %39 = llvm.fsub %27, %16  : f32
    %40 = llvm.fmul %39, %38  : f32
    %41 = llvm.fmul %40, %14  : f32
    %42 = llvm.fadd %41, %15  : f32
    %43 = llvm.mul %11, %9  : i64
    %44 = llvm.mul %11, %8  : i64
    %45 = llvm.add %43, %44  : i64
    %46 = llvm.mul %12, %7  : i64
    %47 = llvm.add %45, %46  : i64
    %48 = llvm.add %47, %18  : i64
    %49 = llvm.getelementptr %arg5[%48] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %42, %49 : f32, !llvm.ptr
    %50 = llvm.add %18, %10  : i64
    %51 = llvm.mul %11, %9  : i64
    %52 = llvm.mul %11, %8  : i64
    %53 = llvm.add %51, %52  : i64
    %54 = llvm.mul %12, %7  : i64
    %55 = llvm.add %53, %54  : i64
    %56 = llvm.add %55, %50  : i64
    %57 = llvm.getelementptr %arg4[%56] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %58 = llvm.load %57 : !llvm.ptr -> f32
    %59 = llvm.fptrunc %0 : f64 to f32
    %60 = llvm.fadd %17, %59  : f32
    %61 = llvm.fmul %60, %3  : f32
    %62 = llvm.bitcast %60 : f32 to i32
    %63 = llvm.lshr %62, %4  : i32
    %64 = llvm.sub %5, %63  : i32
    %65 = llvm.bitcast %64 : i32 to f32
    %66 = llvm.fmul %65, %65  : f32
    %67 = llvm.fmul %66, %61  : f32
    %68 = llvm.fsub %6, %67  : f32
    %69 = llvm.fmul %68, %66  : f32
    %70 = llvm.fsub %58, %16  : f32
    %71 = llvm.fmul %70, %69  : f32
    %72 = llvm.fmul %71, %14  : f32
    %73 = llvm.fadd %72, %15  : f32
    %74 = llvm.mul %11, %9  : i64
    %75 = llvm.mul %11, %8  : i64
    %76 = llvm.add %74, %75  : i64
    %77 = llvm.mul %12, %7  : i64
    %78 = llvm.add %76, %77  : i64
    %79 = llvm.add %78, %50  : i64
    %80 = llvm.getelementptr %arg5[%79] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %73, %80 : f32, !llvm.ptr
    %81 = llvm.add %18, %2  : i64
    llvm.br ^bb4(%81 : i64)
  ^bb6:  // pred: ^bb4
    %82 = llvm.add %12, %10  : i64
    llvm.br ^bb2(%82 : i64)
  ^bb7:  // pred: ^bb2
    llvm.return
  }
}

