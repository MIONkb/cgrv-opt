module attributes {llvm.data_layout = "", torch.debug_module_name = "L"} {
  llvm.func @malloc(i64) -> !llvm.ptr<i8>
  llvm.mlir.global private constant @__constant_12x3xf32(dense<[[-0.259240121, -0.234688252, 0.510510147], [0.233562827, -0.0331445783, 0.384852856], [-0.508802652, 0.173100084, -0.456325561], [0.334649473, 0.101393677, -0.0848175361], [0.415013522, 0.548246503, -0.0517567173], [0.558391511, -0.239463642, -0.212957352], [0.0163944438, -0.32234925, 0.205953121], [-0.284711599, 0.075589411, 0.142221317], [-5.766300e-01, -0.231847823, -0.161687583], [-0.538891375, 0.341592878, -0.576503336], [0.443732411, -0.319553018, -0.167551935], [0.142661244, 0.165032223, -0.576377869]]> : tensor<12x3xf32>) : !llvm.array<12 x array<3 x f32>>
  llvm.mlir.global private constant @__constant_3x12xf32(dense<[[0.161275461, 0.0990483835, 0.140225306, 0.0738267228, -0.0230169389, -0.191564813, 0.1457607, 0.197757319, -0.0972366183, 0.126508623, 0.139206693, -0.0688978806], [-0.176147208, -0.213960767, -0.198053509, -0.0384910479, -0.245581821, 0.139692709, -2.673340e-01, -0.223085925, -0.196028829, -0.226647332, -0.0104687046, 0.127765238], [0.0994836315, -0.128047019, -0.0917707682, 0.115462713, 0.0437031351, -0.0613443516, 0.0145246265, 0.240862086, 0.133553818, -0.0305191949, -0.286686301, -0.204464972]]> : tensor<3x12xf32>) : !llvm.array<3 x array<12 x f32>>
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

