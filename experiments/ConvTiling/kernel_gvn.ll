; ModuleID = 'kernel.ll'
source_filename = "kernel.c"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define dso_local void @conv_kernel(ptr nocapture noundef readonly %input, ptr nocapture noundef readonly %weights, ptr nocapture noundef readonly %bias, ptr nocapture noundef writeonly %output) local_unnamed_addr #0 {
entry:
  tail call void @loop_begin() #2
  %add.ptr33.1 = getelementptr inbounds i32, ptr %weights, i32 1
  %add.ptr33.2 = getelementptr inbounds i32, ptr %weights, i32 2
  %add.ptr32.1 = getelementptr inbounds i32, ptr %weights, i32 3
  %add.ptr33.1.1 = getelementptr inbounds i32, ptr %weights, i32 4
  %add.ptr33.2.1 = getelementptr inbounds i32, ptr %weights, i32 5
  %add.ptr32.2 = getelementptr inbounds i32, ptr %weights, i32 6
  %add.ptr33.1.2 = getelementptr inbounds i32, ptr %weights, i32 7
  %add.ptr33.2.2 = getelementptr inbounds i32, ptr %weights, i32 8
  %add.ptr30.1 = getelementptr inbounds i32, ptr %weights, i32 9
  %add.ptr33.1.1122 = getelementptr inbounds i32, ptr %weights, i32 10
  %add.ptr33.2.1129 = getelementptr inbounds i32, ptr %weights, i32 11
  %add.ptr32.1.1 = getelementptr inbounds i32, ptr %weights, i32 12
  %add.ptr33.1.1.1 = getelementptr inbounds i32, ptr %weights, i32 13
  %add.ptr33.2.1.1 = getelementptr inbounds i32, ptr %weights, i32 14
  %add.ptr32.2.1 = getelementptr inbounds i32, ptr %weights, i32 15
  %add.ptr33.1.2.1 = getelementptr inbounds i32, ptr %weights, i32 16
  %add.ptr33.2.2.1 = getelementptr inbounds i32, ptr %weights, i32 17
  %add.ptr30.2 = getelementptr inbounds i32, ptr %weights, i32 18
  %add.ptr33.1.2144 = getelementptr inbounds i32, ptr %weights, i32 19
  %add.ptr33.2.2151 = getelementptr inbounds i32, ptr %weights, i32 20
  %add.ptr32.1.2 = getelementptr inbounds i32, ptr %weights, i32 21
  %add.ptr33.1.1.2 = getelementptr inbounds i32, ptr %weights, i32 22
  %add.ptr33.2.1.2 = getelementptr inbounds i32, ptr %weights, i32 23
  %add.ptr32.2.2 = getelementptr inbounds i32, ptr %weights, i32 24
  %add.ptr33.1.2.2 = getelementptr inbounds i32, ptr %weights, i32 25
  %add.ptr33.2.2.2 = getelementptr inbounds i32, ptr %weights, i32 26
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond.cleanup3, %entry
  %orow.0100 = phi i32 [ 0, %entry ], [ %add.1, %for.cond.cleanup3 ]
  %mul57 = mul nuw nsw i32 %orow.0100, 7104
  %add.ptr58 = getelementptr inbounds i32, ptr %output, i32 %mul57
  %mul24 = mul nuw nsw i32 %orow.0100, 672
  %add.ptr = getelementptr inbounds i32, ptr %input, i32 %mul24
  %add.1 = add nuw nsw i32 %orow.0100, 1
  %mul24.1 = mul nuw nsw i32 %add.1, 672
  %add.ptr.1 = getelementptr inbounds i32, ptr %input, i32 %mul24.1
  %mul24.2 = add nuw nsw i32 %mul24, 1344
  %add.ptr.2 = getelementptr inbounds i32, ptr %input, i32 %mul24.2
  br label %cond.end.2.2.2

for.cond.cleanup:                                 ; preds = %for.cond.cleanup3
  tail call void @loop_end() #2
  ret void

for.cond.cleanup3:                                ; preds = %cond.end.2.2.2
  %exitcond155.not = icmp eq i32 %add.1, 3
  br i1 %exitcond155.not, label %for.cond.cleanup, label %for.cond1.preheader, !llvm.loop !6

cond.end.2.2.2:                                   ; preds = %cond.end.2.2.2, %for.cond1.preheader
  %ocol.099 = phi i32 [ 0, %for.cond1.preheader ], [ %add17.1, %cond.end.2.2.2 ]
  %mul25 = mul nuw nsw i32 %ocol.099, 3
  %add.ptr26 = getelementptr inbounds i32, ptr %add.ptr, i32 %mul25
  %0 = load i32, ptr %add.ptr26, align 4, !tbaa !9
  %1 = load i32, ptr %weights, align 4, !tbaa !9
  %mul34 = mul nsw i32 %1, %0
  %add.ptr27.1 = getelementptr inbounds i32, ptr %add.ptr26, i32 1
  %2 = load i32, ptr %add.ptr27.1, align 4, !tbaa !9
  %3 = load i32, ptr %add.ptr33.1, align 4, !tbaa !9
  %mul34.1 = mul nsw i32 %3, %2
  %add35.1 = add nsw i32 %mul34.1, %mul34
  %add.ptr27.2 = getelementptr inbounds i32, ptr %add.ptr26, i32 2
  %4 = load i32, ptr %add.ptr27.2, align 4, !tbaa !9
  %5 = load i32, ptr %add.ptr33.2, align 4, !tbaa !9
  %mul34.2 = mul nsw i32 %5, %4
  %add35.2 = add nsw i32 %mul34.2, %add35.1
  %add17.1 = add nuw nsw i32 %ocol.099, 1
  %mul25.1 = mul nuw nsw i32 %add17.1, 3
  %add.ptr26.1 = getelementptr inbounds i32, ptr %add.ptr, i32 %mul25.1
  %6 = load i32, ptr %add.ptr26.1, align 4, !tbaa !9
  %7 = load i32, ptr %add.ptr32.1, align 4, !tbaa !9
  %mul34.1103 = mul nsw i32 %7, %6
  %add35.1104 = add nsw i32 %mul34.1103, %add35.2
  %add.ptr27.1.1 = getelementptr inbounds i32, ptr %add.ptr26.1, i32 1
  %8 = load i32, ptr %add.ptr27.1.1, align 4, !tbaa !9
  %9 = load i32, ptr %add.ptr33.1.1, align 4, !tbaa !9
  %mul34.1.1 = mul nsw i32 %9, %8
  %add35.1.1 = add nsw i32 %mul34.1.1, %add35.1104
  %add.ptr27.2.1 = getelementptr inbounds i32, ptr %add.ptr26.1, i32 2
  %10 = load i32, ptr %add.ptr27.2.1, align 4, !tbaa !9
  %11 = load i32, ptr %add.ptr33.2.1, align 4, !tbaa !9
  %mul34.2.1 = mul nsw i32 %11, %10
  %add35.2.1 = add nsw i32 %mul34.2.1, %add35.1.1
  %mul25.2 = add nuw nsw i32 %mul25, 6
  %add.ptr26.2 = getelementptr inbounds i32, ptr %add.ptr, i32 %mul25.2
  %12 = load i32, ptr %add.ptr26.2, align 4, !tbaa !9
  %13 = load i32, ptr %add.ptr32.2, align 4, !tbaa !9
  %mul34.2108 = mul nsw i32 %13, %12
  %add35.2109 = add nsw i32 %mul34.2108, %add35.2.1
  %add.ptr27.1.2 = getelementptr inbounds i32, ptr %add.ptr26.2, i32 1
  %14 = load i32, ptr %add.ptr27.1.2, align 4, !tbaa !9
  %15 = load i32, ptr %add.ptr33.1.2, align 4, !tbaa !9
  %mul34.1.2 = mul nsw i32 %15, %14
  %add35.1.2 = add nsw i32 %mul34.1.2, %add35.2109
  %add.ptr27.2.2 = getelementptr inbounds i32, ptr %add.ptr26.2, i32 2
  %16 = load i32, ptr %add.ptr27.2.2, align 4, !tbaa !9
  %17 = load i32, ptr %add.ptr33.2.2, align 4, !tbaa !9
  %mul34.2.2 = mul nsw i32 %17, %16
  %add35.2.2 = add nsw i32 %mul34.2.2, %add35.1.2
  %add.ptr26.1112 = getelementptr inbounds i32, ptr %add.ptr.1, i32 %mul25
  %18 = load i32, ptr %add.ptr26.1112, align 4, !tbaa !9
  %19 = load i32, ptr %add.ptr30.1, align 4, !tbaa !9
  %mul34.1116 = mul nsw i32 %19, %18
  %add35.1117 = add nsw i32 %mul34.1116, %add35.2.2
  %add.ptr27.1.1119 = getelementptr inbounds i32, ptr %add.ptr26.1112, i32 1
  %20 = load i32, ptr %add.ptr27.1.1119, align 4, !tbaa !9
  %21 = load i32, ptr %add.ptr33.1.1122, align 4, !tbaa !9
  %mul34.1.1123 = mul nsw i32 %21, %20
  %add35.1.1124 = add nsw i32 %mul34.1.1123, %add35.1117
  %add.ptr27.2.1126 = getelementptr inbounds i32, ptr %add.ptr26.1112, i32 2
  %22 = load i32, ptr %add.ptr27.2.1126, align 4, !tbaa !9
  %23 = load i32, ptr %add.ptr33.2.1129, align 4, !tbaa !9
  %mul34.2.1130 = mul nsw i32 %23, %22
  %add35.2.1131 = add nsw i32 %mul34.2.1130, %add35.1.1124
  %add.ptr26.1.1 = getelementptr inbounds i32, ptr %add.ptr.1, i32 %mul25.1
  %24 = load i32, ptr %add.ptr26.1.1, align 4, !tbaa !9
  %25 = load i32, ptr %add.ptr32.1.1, align 4, !tbaa !9
  %mul34.1103.1 = mul nsw i32 %25, %24
  %add35.1104.1 = add nsw i32 %mul34.1103.1, %add35.2.1131
  %add.ptr27.1.1.1 = getelementptr inbounds i32, ptr %add.ptr26.1.1, i32 1
  %26 = load i32, ptr %add.ptr27.1.1.1, align 4, !tbaa !9
  %27 = load i32, ptr %add.ptr33.1.1.1, align 4, !tbaa !9
  %mul34.1.1.1 = mul nsw i32 %27, %26
  %add35.1.1.1 = add nsw i32 %mul34.1.1.1, %add35.1104.1
  %add.ptr27.2.1.1 = getelementptr inbounds i32, ptr %add.ptr26.1.1, i32 2
  %28 = load i32, ptr %add.ptr27.2.1.1, align 4, !tbaa !9
  %29 = load i32, ptr %add.ptr33.2.1.1, align 4, !tbaa !9
  %mul34.2.1.1 = mul nsw i32 %29, %28
  %add35.2.1.1 = add nsw i32 %mul34.2.1.1, %add35.1.1.1
  %add.ptr26.2.1 = getelementptr inbounds i32, ptr %add.ptr.1, i32 %mul25.2
  %30 = load i32, ptr %add.ptr26.2.1, align 4, !tbaa !9
  %31 = load i32, ptr %add.ptr32.2.1, align 4, !tbaa !9
  %mul34.2108.1 = mul nsw i32 %31, %30
  %add35.2109.1 = add nsw i32 %mul34.2108.1, %add35.2.1.1
  %add.ptr27.1.2.1 = getelementptr inbounds i32, ptr %add.ptr26.2.1, i32 1
  %32 = load i32, ptr %add.ptr27.1.2.1, align 4, !tbaa !9
  %33 = load i32, ptr %add.ptr33.1.2.1, align 4, !tbaa !9
  %mul34.1.2.1 = mul nsw i32 %33, %32
  %add35.1.2.1 = add nsw i32 %mul34.1.2.1, %add35.2109.1
  %add.ptr27.2.2.1 = getelementptr inbounds i32, ptr %add.ptr26.2.1, i32 2
  %34 = load i32, ptr %add.ptr27.2.2.1, align 4, !tbaa !9
  %35 = load i32, ptr %add.ptr33.2.2.1, align 4, !tbaa !9
  %mul34.2.2.1 = mul nsw i32 %35, %34
  %add35.2.2.1 = add nsw i32 %mul34.2.2.1, %add35.1.2.1
  %add.ptr26.2134 = getelementptr inbounds i32, ptr %add.ptr.2, i32 %mul25
  %36 = load i32, ptr %add.ptr26.2134, align 4, !tbaa !9
  %37 = load i32, ptr %add.ptr30.2, align 4, !tbaa !9
  %mul34.2138 = mul nsw i32 %37, %36
  %add35.2139 = add nsw i32 %mul34.2138, %add35.2.2.1
  %add.ptr27.1.2141 = getelementptr inbounds i32, ptr %add.ptr26.2134, i32 1
  %38 = load i32, ptr %add.ptr27.1.2141, align 4, !tbaa !9
  %39 = load i32, ptr %add.ptr33.1.2144, align 4, !tbaa !9
  %mul34.1.2145 = mul nsw i32 %39, %38
  %add35.1.2146 = add nsw i32 %mul34.1.2145, %add35.2139
  %add.ptr27.2.2148 = getelementptr inbounds i32, ptr %add.ptr26.2134, i32 2
  %40 = load i32, ptr %add.ptr27.2.2148, align 4, !tbaa !9
  %41 = load i32, ptr %add.ptr33.2.2151, align 4, !tbaa !9
  %mul34.2.2152 = mul nsw i32 %41, %40
  %add35.2.2153 = add nsw i32 %mul34.2.2152, %add35.1.2146
  %add.ptr26.1.2 = getelementptr inbounds i32, ptr %add.ptr.2, i32 %mul25.1
  %42 = load i32, ptr %add.ptr26.1.2, align 4, !tbaa !9
  %43 = load i32, ptr %add.ptr32.1.2, align 4, !tbaa !9
  %mul34.1103.2 = mul nsw i32 %43, %42
  %add35.1104.2 = add nsw i32 %mul34.1103.2, %add35.2.2153
  %add.ptr27.1.1.2 = getelementptr inbounds i32, ptr %add.ptr26.1.2, i32 1
  %44 = load i32, ptr %add.ptr27.1.1.2, align 4, !tbaa !9
  %45 = load i32, ptr %add.ptr33.1.1.2, align 4, !tbaa !9
  %mul34.1.1.2 = mul nsw i32 %45, %44
  %add35.1.1.2 = add nsw i32 %mul34.1.1.2, %add35.1104.2
  %add.ptr27.2.1.2 = getelementptr inbounds i32, ptr %add.ptr26.1.2, i32 2
  %46 = load i32, ptr %add.ptr27.2.1.2, align 4, !tbaa !9
  %47 = load i32, ptr %add.ptr33.2.1.2, align 4, !tbaa !9
  %mul34.2.1.2 = mul nsw i32 %47, %46
  %add35.2.1.2 = add nsw i32 %mul34.2.1.2, %add35.1.1.2
  %add.ptr26.2.2 = getelementptr inbounds i32, ptr %add.ptr.2, i32 %mul25.2
  %48 = load i32, ptr %add.ptr26.2.2, align 4, !tbaa !9
  %49 = load i32, ptr %add.ptr32.2.2, align 4, !tbaa !9
  %mul34.2108.2 = mul nsw i32 %49, %48
  %add35.2109.2 = add nsw i32 %mul34.2108.2, %add35.2.1.2
  %add.ptr27.1.2.2 = getelementptr inbounds i32, ptr %add.ptr26.2.2, i32 1
  %50 = load i32, ptr %add.ptr27.1.2.2, align 4, !tbaa !9
  %51 = load i32, ptr %add.ptr33.1.2.2, align 4, !tbaa !9
  %mul34.1.2.2 = mul nsw i32 %51, %50
  %add35.1.2.2 = add nsw i32 %mul34.1.2.2, %add35.2109.2
  %add.ptr27.2.2.2 = getelementptr inbounds i32, ptr %add.ptr26.2.2, i32 2
  %52 = load i32, ptr %add.ptr27.2.2.2, align 4, !tbaa !9
  %53 = load i32, ptr %add.ptr33.2.2.2, align 4, !tbaa !9
  %mul34.2.2.2 = mul nsw i32 %53, %52
  %add35.2.2.2 = add nsw i32 %mul34.2.2.2, %add35.1.2.2
  %54 = load i32, ptr %bias, align 4, !tbaa !9
  %add42 = add nsw i32 %54, %add35.2.2.2
  %mul59 = shl nsw i32 %ocol.099, 5
  %add.ptr60 = getelementptr inbounds i32, ptr %add.ptr58, i32 %mul59
  store i32 %add42, ptr %add.ptr60, align 4, !tbaa !9
  %exitcond.not = icmp eq i32 %add17.1, 222
  br i1 %exitcond.not, label %for.cond.cleanup3, label %cond.end.2.2.2, !llvm.loop !13
}

declare void @loop_begin(...) local_unnamed_addr #1

declare void @loop_end(...) local_unnamed_addr #1

attributes #0 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"NumRegisterParameters", i32 0}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{!"clang version 16.0.0"}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.mustprogress"}
!8 = !{!"llvm.loop.unroll.disable"}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !11, i64 0}
!11 = !{!"omnipotent char", !12, i64 0}
!12 = !{!"Simple C/C++ TBAA"}
!13 = distinct !{!13, !7, !8}
