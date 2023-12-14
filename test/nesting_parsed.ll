; ModuleID = 'test/nesting.ll'
source_filename = "mp5_testcases/nesting.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @foo(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 1, ptr %3, align 4
  br label %5

5:                                                ; preds = %33, %1
  %6 = load i32, ptr %2, align 4
  %7 = icmp slt i32 0, %6
  br i1 %7, label %8, label %34

8:                                                ; preds = %5
  %9 = load i32, ptr %3, align 4
  store i32 %9, ptr %4, align 4
  %10 = call i32 @rand() #2
  %11 = srem i32 %10, 7
  %12 = load i32, ptr %4, align 4
  %13 = add nsw i32 3, %12
  %14 = sub nsw i32 %11, %13
  store i32 %14, ptr %3, align 4
  %15 = load i32, ptr %3, align 4
  %16 = load i32, ptr %2, align 4
  %17 = add nsw i32 %16, %15
  store i32 %17, ptr %2, align 4
  %18 = load i32, ptr %4, align 4
  %19 = icmp sgt i32 %18, 0
  br i1 %19, label %20, label %22

20:                                               ; preds = %8
  %21 = load i32, ptr %4, align 4
  store i32 %21, ptr %3, align 4
  br label %33

22:                                               ; preds = %8
  br label %23

23:                                               ; preds = %27, %22
  %24 = load i32, ptr %3, align 4
  %25 = load i32, ptr %4, align 4
  %26 = icmp slt i32 %24, %25
  br i1 %26, label %27, label %32

27:                                               ; preds = %23
  %28 = load i32, ptr %4, align 4
  %29 = mul nsw i32 %28, 3
  store i32 %29, ptr %4, align 4
  %30 = load i32, ptr %3, align 4
  %31 = mul nsw i32 %30, 4
  store i32 %31, ptr %3, align 4
  br label %23, !llvm.loop !6

32:                                               ; preds = %23
  br label %33

33:                                               ; preds = %32, %20
  br label %5, !llvm.loop !8

34:                                               ; preds = %5
  %35 = load i32, ptr %3, align 4
  ret i32 %35
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
!8 = distinct !{!8, !7}
