; ModuleID = 'mp5_testcases/doloop_c.ll'
source_filename = "mp5_testcases/doloop.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @foo(i32 noundef %0, ptr noalias noundef %1, ptr noalias noundef %2) #0 {
  %4 = sdiv i32 %0, -3
  br label %5

5:                                                ; preds = %8, %3
  %.01 = phi i32 [ 1, %3 ], [ %spec.select, %8 ]
  %.0 = phi i32 [ %0, %3 ], [ %11, %8 ]
  %6 = icmp sgt i32 %.01, 0
  br i1 %6, label %7, label %8

7:                                                ; preds = %5
  store i32 %0, ptr %1, align 4
  br label %8

8:                                                ; preds = %7, %5
  %9 = add nsw i32 1, %.01
  %10 = sub nsw i32 %4, %9
  %11 = add nsw i32 %.0, %10
  %12 = icmp sgt i32 %.01, 0
  %spec.select = select i1 %12, i32 %.01, i32 %10
  store i32 %0, ptr %2, align 4
  %13 = icmp slt i32 0, %11
  br i1 %13, label %5, label %14, !llvm.loop !6

14:                                               ; preds = %8
  ret i32 %spec.select
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 15.0.7"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
