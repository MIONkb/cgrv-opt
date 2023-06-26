module attributes {llvm.data_layout = "", torch.debug_module_name = "L"} {
  llvm.func @malloc(i64) -> !llvm.ptr<i8>
  llvm.mlir.global private constant @__constant_12x3xf32(dense<[[0.27852425, 0.428360164, 0.127971411], [-0.224476889, 0.417616963, 0.542268753], [-0.56569916, -0.483246773, -0.363143295], [-0.233854845, -0.383786887, 0.0384527445], [0.089038536, -0.285620868, 0.48163715], [0.192216307, -0.148962632, 0.418001354], [-0.0734101906, -0.302333951, 0.338895798], [-0.469630271, -0.0872598066, -0.323459685], [0.528689742, -0.533850551, 0.0165391155], [-0.234667405, -0.123299189, 0.291907042], [-0.147872105, -0.502636909, -0.412599385], [-0.166963682, 0.0951236709, -0.0930589064]]> : tensor<12x3xf32>) : !llvm.array<12 x array<3 x f32>>
  llvm.mlir.global private constant @__constant_3x12xf32(dense<[[-0.0757213831, -0.114497334, -0.127711043, -0.117315672, 0.202118784, -0.25997752, -0.178096369, -0.140102699, -0.118545718, -0.251658499, -0.10871245, -0.26336953], [0.228148803, 0.233722836, 0.27056843, 0.101991534, -0.103726208, 0.00336164469, -0.0788406953, 0.233368948, 0.0752476901, 0.191837281, -0.273358136, -0.281090826], [-0.0345517844, 0.242331296, -0.184581935, 0.266173184, -0.142459035, -0.231992438, -0.237851128, 0.227577239, 0.245558485, -0.042840682, 0.137139797, 0.094666332]]> : tensor<3x12xf32>) : !llvm.array<3 x array<12 x f32>>
  llvm.func @forward(%arg0: !llvm.ptr<f32>) -> !llvm.ptr<f32> {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.mlir.constant(4 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.mlir.constant(3 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %9 = llvm.mlir.constant(3 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.mlir.constant(1 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = llvm.mlir.constant(3 : index) : i64
    %14 = llvm.mlir.constant(12 : index) : i64
    %15 = llvm.mlir.constant(1 : index) : i64
    %16 = llvm.mlir.constant(36 : index) : i64
    %17 = llvm.mlir.null : !llvm.ptr<f32>
    %18 = llvm.getelementptr %17[36] : (!llvm.ptr<f32>) -> !llvm.ptr<f32>
    %19 = llvm.ptrtoint %18 : !llvm.ptr<f32> to i64
    %20 = llvm.mlir.addressof @__constant_3x12xf32 : !llvm.ptr<array<3 x array<12 x f32>>>
    %21 = llvm.getelementptr %20[0, 0, 0] : (!llvm.ptr<array<3 x array<12 x f32>>>) -> !llvm.ptr<f32>
    %22 = llvm.mlir.constant(3735928559 : index) : i64
    %23 = llvm.inttoptr %22 : i64 to !llvm.ptr<f32>
    %24 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %25 = llvm.insertvalue %23, %24[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %26 = llvm.insertvalue %21, %25[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %27 = llvm.mlir.constant(0 : index) : i64
    %28 = llvm.insertvalue %27, %26[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %29 = llvm.insertvalue %13, %28[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %30 = llvm.insertvalue %14, %29[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %31 = llvm.insertvalue %14, %30[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %32 = llvm.insertvalue %15, %31[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %33 = llvm.mlir.constant(12 : index) : i64
    %34 = llvm.mlir.constant(3 : index) : i64
    %35 = llvm.mlir.constant(1 : index) : i64
    %36 = llvm.mlir.constant(36 : index) : i64
    %37 = llvm.mlir.null : !llvm.ptr<f32>
    %38 = llvm.getelementptr %37[36] : (!llvm.ptr<f32>) -> !llvm.ptr<f32>
    %39 = llvm.ptrtoint %38 : !llvm.ptr<f32> to i64
    %40 = llvm.mlir.addressof @__constant_12x3xf32 : !llvm.ptr<array<12 x array<3 x f32>>>
    %41 = llvm.getelementptr %40[0, 0, 0] : (!llvm.ptr<array<12 x array<3 x f32>>>) -> !llvm.ptr<f32>
    %42 = llvm.mlir.constant(3735928559 : index) : i64
    %43 = llvm.inttoptr %42 : i64 to !llvm.ptr<f32>
    %44 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %45 = llvm.insertvalue %43, %44[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %46 = llvm.insertvalue %41, %45[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %47 = llvm.mlir.constant(0 : index) : i64
    %48 = llvm.insertvalue %47, %46[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %49 = llvm.insertvalue %33, %48[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %50 = llvm.insertvalue %34, %49[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %51 = llvm.insertvalue %34, %50[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %52 = llvm.insertvalue %35, %51[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %53 = llvm.mlir.constant(3 : index) : i64
    %54 = llvm.mlir.constant(12 : index) : i64
    %55 = llvm.mlir.constant(1 : index) : i64
    %56 = llvm.mlir.constant(36 : index) : i64
    %57 = llvm.mlir.null : !llvm.ptr<f32>
    %58 = llvm.getelementptr %57[36] : (!llvm.ptr<f32>) -> !llvm.ptr<f32>
    %59 = llvm.ptrtoint %58 : !llvm.ptr<f32> to i64
    %60 = llvm.alloca %59 x f32 {alignment = 64 : i64} : (i64) -> !llvm.ptr<f32>
    %61 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %62 = llvm.insertvalue %60, %61[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %63 = llvm.insertvalue %60, %62[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %64 = llvm.mlir.constant(0 : index) : i64
    %65 = llvm.insertvalue %64, %63[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %66 = llvm.insertvalue %53, %65[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %67 = llvm.insertvalue %54, %66[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %68 = llvm.insertvalue %54, %67[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %69 = llvm.insertvalue %55, %68[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %70 = llvm.extractvalue %52[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %71 = llvm.extractvalue %69[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_0(%70, %71) : (!llvm.ptr<f32>, !llvm.ptr<f32>) -> ()
    %72 = llvm.mlir.constant(4 : index) : i64
    %73 = llvm.mlir.constant(12 : index) : i64
    %74 = llvm.mlir.constant(1 : index) : i64
    %75 = llvm.mlir.constant(48 : index) : i64
    %76 = llvm.mlir.null : !llvm.ptr<f32>
    %77 = llvm.getelementptr %76[48] : (!llvm.ptr<f32>) -> !llvm.ptr<f32>
    %78 = llvm.ptrtoint %77 : !llvm.ptr<f32> to i64
    %79 = llvm.alloca %78 x f32 : (i64) -> !llvm.ptr<f32>
    %80 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %81 = llvm.insertvalue %79, %80[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %82 = llvm.insertvalue %79, %81[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %83 = llvm.mlir.constant(0 : index) : i64
    %84 = llvm.insertvalue %83, %82[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %85 = llvm.insertvalue %72, %84[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %86 = llvm.insertvalue %73, %85[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %87 = llvm.insertvalue %73, %86[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %88 = llvm.insertvalue %74, %87[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %89 = llvm.extractvalue %88[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_1(%89) : (!llvm.ptr<f32>) -> ()
    %90 = llvm.mlir.constant(4 : index) : i64
    %91 = llvm.mlir.constant(12 : index) : i64
    %92 = llvm.mlir.constant(1 : index) : i64
    %93 = llvm.mlir.constant(48 : index) : i64
    %94 = llvm.mlir.null : !llvm.ptr<f32>
    %95 = llvm.getelementptr %94[48] : (!llvm.ptr<f32>) -> !llvm.ptr<f32>
    %96 = llvm.ptrtoint %95 : !llvm.ptr<f32> to i64
    %97 = llvm.alloca %96 x f32 : (i64) -> !llvm.ptr<f32>
    %98 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %99 = llvm.insertvalue %97, %98[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %100 = llvm.insertvalue %97, %99[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %101 = llvm.mlir.constant(0 : index) : i64
    %102 = llvm.insertvalue %101, %100[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %103 = llvm.insertvalue %90, %102[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %104 = llvm.insertvalue %91, %103[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %105 = llvm.insertvalue %91, %104[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %106 = llvm.insertvalue %92, %105[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %107 = llvm.mlir.constant(1 : index) : i64
    %108 = llvm.mul %107, %72  : i64
    %109 = llvm.mul %108, %73  : i64
    %110 = llvm.mlir.null : !llvm.ptr<f32>
    %111 = llvm.getelementptr %110[1] : (!llvm.ptr<f32>) -> !llvm.ptr<f32>
    %112 = llvm.ptrtoint %111 : !llvm.ptr<f32> to i64
    %113 = llvm.mul %109, %112  : i64
    %114 = llvm.getelementptr %79[%83] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %115 = llvm.getelementptr %97[%101] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %116 = llvm.mlir.constant(false) : i1
    "llvm.intr.memcpy"(%115, %114, %113, %116) : (!llvm.ptr<f32>, !llvm.ptr<f32>, i64, i1) -> ()
    %117 = llvm.extractvalue %69[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %118 = llvm.extractvalue %106[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_2(%arg0, %117, %118) : (!llvm.ptr<f32>, !llvm.ptr<f32>, !llvm.ptr<f32>) -> ()
    %119 = llvm.mlir.constant(12 : index) : i64
    %120 = llvm.mlir.constant(3 : index) : i64
    %121 = llvm.mlir.constant(1 : index) : i64
    %122 = llvm.mlir.constant(36 : index) : i64
    %123 = llvm.mlir.null : !llvm.ptr<f32>
    %124 = llvm.getelementptr %123[36] : (!llvm.ptr<f32>) -> !llvm.ptr<f32>
    %125 = llvm.ptrtoint %124 : !llvm.ptr<f32> to i64
    %126 = llvm.alloca %125 x f32 {alignment = 64 : i64} : (i64) -> !llvm.ptr<f32>
    %127 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %128 = llvm.insertvalue %126, %127[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %129 = llvm.insertvalue %126, %128[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %130 = llvm.mlir.constant(0 : index) : i64
    %131 = llvm.insertvalue %130, %129[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %132 = llvm.insertvalue %119, %131[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %133 = llvm.insertvalue %120, %132[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %134 = llvm.insertvalue %120, %133[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %135 = llvm.insertvalue %121, %134[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %136 = llvm.extractvalue %32[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %137 = llvm.extractvalue %135[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_3(%136, %137) : (!llvm.ptr<f32>, !llvm.ptr<f32>) -> ()
    %138 = llvm.mlir.constant(4 : index) : i64
    %139 = llvm.mlir.constant(3 : index) : i64
    %140 = llvm.mlir.constant(1 : index) : i64
    %141 = llvm.mlir.constant(12 : index) : i64
    %142 = llvm.mlir.null : !llvm.ptr<f32>
    %143 = llvm.getelementptr %142[12] : (!llvm.ptr<f32>) -> !llvm.ptr<f32>
    %144 = llvm.ptrtoint %143 : !llvm.ptr<f32> to i64
    %145 = llvm.alloca %144 x f32 : (i64) -> !llvm.ptr<f32>
    %146 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %147 = llvm.insertvalue %145, %146[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %148 = llvm.insertvalue %145, %147[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %149 = llvm.mlir.constant(0 : index) : i64
    %150 = llvm.insertvalue %149, %148[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %151 = llvm.insertvalue %138, %150[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %152 = llvm.insertvalue %139, %151[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %153 = llvm.insertvalue %139, %152[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %154 = llvm.insertvalue %140, %153[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %155 = llvm.extractvalue %154[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_4(%155) : (!llvm.ptr<f32>) -> ()
    %156 = llvm.mlir.constant(4 : index) : i64
    %157 = llvm.mlir.constant(3 : index) : i64
    %158 = llvm.mlir.constant(1 : index) : i64
    %159 = llvm.mlir.constant(12 : index) : i64
    %160 = llvm.mlir.null : !llvm.ptr<f32>
    %161 = llvm.getelementptr %160[12] : (!llvm.ptr<f32>) -> !llvm.ptr<f32>
    %162 = llvm.ptrtoint %161 : !llvm.ptr<f32> to i64
    %163 = llvm.mlir.constant(64 : index) : i64
    %164 = llvm.add %162, %163  : i64
    %165 = llvm.call @malloc(%164) : (i64) -> !llvm.ptr<i8>
    %166 = llvm.bitcast %165 : !llvm.ptr<i8> to !llvm.ptr<f32>
    %167 = llvm.ptrtoint %166 : !llvm.ptr<f32> to i64
    %168 = llvm.mlir.constant(1 : index) : i64
    %169 = llvm.sub %163, %168  : i64
    %170 = llvm.add %167, %169  : i64
    %171 = llvm.urem %170, %163  : i64
    %172 = llvm.sub %170, %171  : i64
    %173 = llvm.inttoptr %172 : i64 to !llvm.ptr<f32>
    %174 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %175 = llvm.insertvalue %166, %174[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %176 = llvm.insertvalue %173, %175[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %177 = llvm.mlir.constant(0 : index) : i64
    %178 = llvm.insertvalue %177, %176[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %179 = llvm.insertvalue %156, %178[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %180 = llvm.insertvalue %157, %179[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %181 = llvm.insertvalue %157, %180[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %182 = llvm.insertvalue %158, %181[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %183 = llvm.mlir.constant(1 : index) : i64
    %184 = llvm.mul %183, %138  : i64
    %185 = llvm.mul %184, %139  : i64
    %186 = llvm.mlir.null : !llvm.ptr<f32>
    %187 = llvm.getelementptr %186[1] : (!llvm.ptr<f32>) -> !llvm.ptr<f32>
    %188 = llvm.ptrtoint %187 : !llvm.ptr<f32> to i64
    %189 = llvm.mul %185, %188  : i64
    %190 = llvm.getelementptr %145[%149] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %191 = llvm.getelementptr %173[%177] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %192 = llvm.mlir.constant(false) : i1
    "llvm.intr.memcpy"(%191, %190, %189, %192) : (!llvm.ptr<f32>, !llvm.ptr<f32>, i64, i1) -> ()
    %193 = llvm.extractvalue %106[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %194 = llvm.extractvalue %135[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %195 = llvm.extractvalue %182[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_5(%193, %194, %195) : (!llvm.ptr<f32>, !llvm.ptr<f32>, !llvm.ptr<f32>) -> ()
    %196 = llvm.extractvalue %182[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.return %196 : !llvm.ptr<f32>
  }
  llvm.func @forward_kernel_0(!llvm.ptr<f32>, !llvm.ptr<f32>) attributes {Kernel, forward_kernel_0}
  llvm.func @forward_kernel_1(!llvm.ptr<f32>) attributes {Kernel, forward_kernel_1}
  llvm.func @forward_kernel_2(!llvm.ptr<f32>, !llvm.ptr<f32>, !llvm.ptr<f32>) attributes {Kernel, forward_kernel_2}
  llvm.func @forward_kernel_3(!llvm.ptr<f32>, !llvm.ptr<f32>) attributes {Kernel, forward_kernel_3}
  llvm.func @forward_kernel_4(!llvm.ptr<f32>) attributes {Kernel, forward_kernel_4}
  llvm.func @forward_kernel_5(!llvm.ptr<f32>, !llvm.ptr<f32>, !llvm.ptr<f32>) attributes {Kernel, forward_kernel_5}
}

