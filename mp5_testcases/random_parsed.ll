; ModuleID = 'mp5_testcases/random_c.ll'
source_filename = "mp5_testcases/random.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @foo(i32 noundef %0) #0 {
  br label %2

2:                                                ; preds = %4, %1
  %.01 = phi i32 [ 1, %1 ], [ %spec.select, %4 ]
  %.0 = phi i32 [ %0, %1 ], [ %9, %4 ]
  %3 = icmp slt i32 0, %.0
  br i1 %3, label %4, label %11

4:                                                ; preds = %2
  %5 = call i32 @rand() #2
  %6 = srem i32 %5, 4
  %7 = add nsw i32 1, %.01
  %8 = sub nsw i32 %6, %7
  %9 = add nsw i32 %.0, %8
  %10 = icmp sgt i32 %.01, 0
  %spec.select = select i1 %10, i32 %.01, i32 %8
  br label %2, !llvm.loop !6

11:                                               ; preds = %2
  ret i32 %.01
}

; Function Attrs: nounwind
declare i32 @rand() #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind }

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
