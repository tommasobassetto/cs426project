; ModuleID = 'mp5_testcases/matmul_c.ll'
source_filename = "mp5_testcases/matmul.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @matmul(i32 noundef %0, i32 noundef %1, i32 noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5) #0 {
  %7 = zext i32 %1 to i64
  %8 = zext i32 %2 to i64
  %9 = zext i32 %2 to i64
  br label %10

10:                                               ; preds = %46, %6
  %.02 = phi i32 [ 0, %6 ], [ %47, %46 ]
  %11 = icmp slt i32 %.02, %0
  br i1 %11, label %12, label %48

12:                                               ; preds = %10, %44
  %.01 = phi i32 [ %45, %44 ], [ 0, %10 ]
  %13 = icmp slt i32 %.01, %2
  br i1 %13, label %14, label %46

14:                                               ; preds = %12
  %15 = sext i32 %.02 to i64
  %16 = mul nsw i64 %15, %9
  %17 = getelementptr inbounds i32, ptr %5, i64 %16
  %18 = sext i32 %.01 to i64
  %19 = getelementptr inbounds i32, ptr %17, i64 %18
  store i32 0, ptr %19, align 4
  br label %20

20:                                               ; preds = %22, %14
  %.0 = phi i32 [ 0, %14 ], [ %43, %22 ]
  %21 = icmp slt i32 %.0, %1
  br i1 %21, label %22, label %44

22:                                               ; preds = %20
  %23 = sext i32 %.02 to i64
  %24 = mul nsw i64 %23, %7
  %25 = getelementptr inbounds i32, ptr %3, i64 %24
  %26 = sext i32 %.0 to i64
  %27 = getelementptr inbounds i32, ptr %25, i64 %26
  %28 = load i32, ptr %27, align 4
  %29 = sext i32 %.0 to i64
  %30 = mul nsw i64 %29, %8
  %31 = getelementptr inbounds i32, ptr %4, i64 %30
  %32 = sext i32 %.01 to i64
  %33 = getelementptr inbounds i32, ptr %31, i64 %32
  %34 = load i32, ptr %33, align 4
  %35 = mul nsw i32 %28, %34
  %36 = sext i32 %.02 to i64
  %37 = mul nsw i64 %36, %9
  %38 = getelementptr inbounds i32, ptr %5, i64 %37
  %39 = sext i32 %.01 to i64
  %40 = getelementptr inbounds i32, ptr %38, i64 %39
  %41 = load i32, ptr %40, align 4
  %42 = add nsw i32 %41, %35
  store i32 %42, ptr %40, align 4
  %43 = add nsw i32 %.0, 1
  br label %20, !llvm.loop !6

44:                                               ; preds = %20
  %45 = add nsw i32 %.01, 1
  br label %12, !llvm.loop !8

46:                                               ; preds = %12
  %47 = add nsw i32 %.02, 1
  br label %10, !llvm.loop !9

48:                                               ; preds = %10
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
