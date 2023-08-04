; ModuleID = '/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/2_kernels_llvm/forward_kernel_4.ll'
source_filename = "LLVMDialectModule"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define void @forward_kernel_4(ptr nocapture readonly %0, ptr nocapture writeonly %1) local_unnamed_addr #0 {
.preheader2:
  br label %.preheader1

.preheader1:                                      ; preds = %.preheader2, %19
  %2 = phi i64 [ 0, %.preheader2 ], [ %20, %19 ]
  %3 = mul nuw nsw i64 %2, 12544
  br label %.preheader

.preheader:                                       ; preds = %.preheader1, %16
  %4 = phi i64 [ 0, %.preheader1 ], [ %17, %16 ]
  %5 = mul nuw nsw i64 %4, 112
  %6 = add nuw nsw i64 %5, %3
  br label %7

7:                                                ; preds = %.preheader, %7
  %8 = phi i64 [ 0, %.preheader ], [ %14, %7 ]
  %9 = add nuw nsw i64 %6, %8
  %10 = getelementptr float, ptr %0, i64 %9
  %11 = load float, ptr %10, align 4
  %.inv = fcmp ole float %11, 0.000000e+00
  %12 = select i1 %.inv, float 0.000000e+00, float %11
  %13 = getelementptr float, ptr %1, i64 %9
  store float %12, ptr %13, align 4
  %14 = add nuw nsw i64 %8, 1
  %15 = icmp ult i64 %8, 111
  br i1 %15, label %7, label %16

16:                                               ; preds = %7
  %17 = add nuw nsw i64 %4, 1
  %18 = icmp ult i64 %4, 111
  br i1 %18, label %.preheader, label %19

19:                                               ; preds = %16
  %20 = add nuw nsw i64 %2, 1
  %21 = icmp ult i64 %2, 63
  br i1 %21, label %.preheader1, label %22

22:                                               ; preds = %19
  ret void
}

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: readwrite) }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
