; ModuleID = '/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/2_kernels_llvm/forward_kernel_2.ll'
source_filename = "LLVMDialectModule"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define void @forward_kernel_2(ptr nocapture %0, ptr nocapture readonly %1, ptr nocapture readonly %2) local_unnamed_addr #0 {
.preheader5:
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader5, %54
  %3 = phi i64 [ 0, %.preheader5 ], [ %55, %54 ]
  %4 = mul nuw nsw i64 %3, 12544
  %5 = mul nuw nsw i64 %3, 147
  br label %.preheader3

.preheader3:                                      ; preds = %.preheader4, %51
  %6 = phi i64 [ 0, %.preheader4 ], [ %52, %51 ]
  %7 = mul nuw nsw i64 %6, 112
  %8 = add nuw nsw i64 %4, %7
  %9 = shl nuw nsw i64 %6, 1
  br label %10

10:                                               ; preds = %.preheader3, %48
  %11 = phi i64 [ 0, %.preheader3 ], [ %49, %48 ]
  %12 = add nuw nsw i64 %8, %11
  %13 = getelementptr float, ptr %0, i64 %12
  %14 = load float, ptr %13, align 4
  %15 = shl nuw nsw i64 %11, 1
  br label %.preheader2

.preheader2:                                      ; preds = %10, %45
  %16 = phi float [ %14, %10 ], [ %39, %45 ]
  %17 = phi i64 [ 0, %10 ], [ %46, %45 ]
  %18 = mul nuw nsw i64 %17, 52900
  %19 = add nuw nsw i64 %15, %18
  %20 = mul nuw nsw i64 %17, 49
  %21 = add nuw nsw i64 %20, %5
  br label %.preheader

.preheader:                                       ; preds = %.preheader2, %42
  %22 = phi float [ %16, %.preheader2 ], [ %39, %42 ]
  %23 = phi i64 [ 0, %.preheader2 ], [ %43, %42 ]
  %24 = add nuw nsw i64 %23, %9
  %25 = mul nuw nsw i64 %24, 230
  %26 = add nuw nsw i64 %19, %25
  %27 = mul nuw nsw i64 %23, 7
  %28 = add nuw nsw i64 %21, %27
  br label %29

29:                                               ; preds = %.preheader, %29
  %30 = phi float [ %22, %.preheader ], [ %39, %29 ]
  %31 = phi i64 [ 0, %.preheader ], [ %40, %29 ]
  %32 = add nuw nsw i64 %26, %31
  %33 = getelementptr float, ptr %1, i64 %32
  %34 = load float, ptr %33, align 4
  %35 = add nuw nsw i64 %28, %31
  %36 = getelementptr float, ptr %2, i64 %35
  %37 = load float, ptr %36, align 4
  %38 = fmul float %34, %37
  %39 = fadd float %30, %38
  %40 = add nuw nsw i64 %31, 1
  %41 = icmp ult i64 %31, 6
  br i1 %41, label %29, label %42

42:                                               ; preds = %29
  %43 = add nuw nsw i64 %23, 1
  %44 = icmp ult i64 %23, 6
  br i1 %44, label %.preheader, label %45

45:                                               ; preds = %42
  %46 = add nuw nsw i64 %17, 1
  %47 = icmp ult i64 %17, 2
  br i1 %47, label %.preheader2, label %48

48:                                               ; preds = %45
  store float %39, ptr %13, align 4
  %49 = add nuw nsw i64 %11, 1
  %50 = icmp ult i64 %11, 111
  br i1 %50, label %10, label %51

51:                                               ; preds = %48
  %52 = add nuw nsw i64 %6, 1
  %53 = icmp ult i64 %6, 111
  br i1 %53, label %.preheader3, label %54

54:                                               ; preds = %51
  %55 = add nuw nsw i64 %3, 1
  %56 = icmp ult i64 %3, 63
  br i1 %56, label %.preheader4, label %57

57:                                               ; preds = %54
  ret void
}

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: readwrite) }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
