; ModuleID = 'mp5_testcases/matmul_c.ll'
source_filename = "mp5_testcases/matmul.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @matmul(i32 noundef %0, i32 noundef %1, i32 noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5) #0 {
  %7 = zext i32 %1 to i64
  %8 = zext i32 %2 to i64
  br label %9

9:                                                ; preds = %36, %6
  %.02 = phi i32 [ 0, %6 ], [ %37, %36 ]
  %10 = icmp slt i32 %.02, %0
  br i1 %10, label %.preheader, label %38

.preheader:                                       ; preds = %9, %34
  %.01 = phi i32 [ %35, %34 ], [ 0, %9 ]
  %11 = icmp slt i32 %.01, %2
  br i1 %11, label %12, label %36

12:                                               ; preds = %.preheader
  %13 = sext i32 %.02 to i64
  %14 = mul nsw i64 %13, %8
  %15 = getelementptr inbounds i32, ptr %5, i64 %14
  %16 = sext i32 %.01 to i64
  %17 = getelementptr inbounds i32, ptr %15, i64 %16
  store i32 0, ptr %17, align 4
  br label %18

18:                                               ; preds = %20, %12
  %.0 = phi i32 [ 0, %12 ], [ %33, %20 ]
  %19 = icmp slt i32 %.0, %1
  br i1 %19, label %20, label %34

20:                                               ; preds = %18
  %21 = mul nsw i64 %13, %7
  %22 = getelementptr inbounds i32, ptr %3, i64 %21
  %23 = sext i32 %.0 to i64
  %24 = getelementptr inbounds i32, ptr %22, i64 %23
  %25 = load i32, ptr %24, align 4
  %26 = mul nsw i64 %23, %8
  %27 = getelementptr inbounds i32, ptr %4, i64 %26
  %28 = getelementptr inbounds i32, ptr %27, i64 %16
  %29 = load i32, ptr %28, align 4
  %30 = mul nsw i32 %25, %29
  %31 = load i32, ptr %17, align 4
  %32 = add nsw i32 %31, %30
  store i32 %32, ptr %17, align 4
  %33 = add nsw i32 %.0, 1
  br label %18, !llvm.loop !6

34:                                               ; preds = %18
  %35 = add nsw i32 %.01, 1
  br label %.preheader, !llvm.loop !8

36:                                               ; preds = %.preheader
  %37 = add nsw i32 %.02, 1
  br label %9, !llvm.loop !9

38:                                               ; preds = %9
  ret void
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
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
