; ModuleID = 'test/matmul.ll'
source_filename = "mp5_testcases/matmul.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @matmul(i32 noundef %0, i32 noundef %1, i32 noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5) #0 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  store i32 %0, ptr %7, align 4
  store i32 %1, ptr %8, align 4
  store i32 %2, ptr %9, align 4
  store ptr %3, ptr %10, align 8
  store ptr %4, ptr %11, align 8
  store ptr %5, ptr %12, align 8
  %16 = load i32, ptr %7, align 4
  %17 = zext i32 %16 to i64
  %18 = load i32, ptr %8, align 4
  %19 = zext i32 %18 to i64
  %20 = load i32, ptr %8, align 4
  %21 = zext i32 %20 to i64
  %22 = load i32, ptr %9, align 4
  %23 = zext i32 %22 to i64
  %24 = load i32, ptr %7, align 4
  %25 = zext i32 %24 to i64
  %26 = load i32, ptr %9, align 4
  %27 = zext i32 %26 to i64
  store i32 0, ptr %13, align 4
  br label %28

28:                                               ; preds = %88, %6
  %29 = load i32, ptr %13, align 4
  %30 = load i32, ptr %7, align 4
  %31 = icmp slt i32 %29, %30
  br i1 %31, label %32, label %91

32:                                               ; preds = %28
  store i32 0, ptr %14, align 4
  br label %33

33:                                               ; preds = %84, %32
  %34 = load i32, ptr %14, align 4
  %35 = load i32, ptr %9, align 4
  %36 = icmp slt i32 %34, %35
  br i1 %36, label %37, label %87

37:                                               ; preds = %33
  %38 = load ptr, ptr %12, align 8
  %39 = load i32, ptr %13, align 4
  %40 = sext i32 %39 to i64
  %41 = mul nsw i64 %40, %27
  %42 = getelementptr inbounds i32, ptr %38, i64 %41
  %43 = load i32, ptr %14, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i32, ptr %42, i64 %44
  store i32 0, ptr %45, align 4
  store i32 0, ptr %15, align 4
  br label %46

46:                                               ; preds = %80, %37
  %47 = load i32, ptr %15, align 4
  %48 = load i32, ptr %8, align 4
  %49 = icmp slt i32 %47, %48
  br i1 %49, label %50, label %83

50:                                               ; preds = %46
  %51 = load ptr, ptr %10, align 8
  %52 = load i32, ptr %13, align 4
  %53 = sext i32 %52 to i64
  %54 = mul nsw i64 %53, %19
  %55 = getelementptr inbounds i32, ptr %51, i64 %54
  %56 = load i32, ptr %15, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i32, ptr %55, i64 %57
  %59 = load i32, ptr %58, align 4
  %60 = load ptr, ptr %11, align 8
  %61 = load i32, ptr %15, align 4
  %62 = sext i32 %61 to i64
  %63 = mul nsw i64 %62, %23
  %64 = getelementptr inbounds i32, ptr %60, i64 %63
  %65 = load i32, ptr %14, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i32, ptr %64, i64 %66
  %68 = load i32, ptr %67, align 4
  %69 = mul nsw i32 %59, %68
  %70 = load ptr, ptr %12, align 8
  %71 = load i32, ptr %13, align 4
  %72 = sext i32 %71 to i64
  %73 = mul nsw i64 %72, %27
  %74 = getelementptr inbounds i32, ptr %70, i64 %73
  %75 = load i32, ptr %14, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds i32, ptr %74, i64 %76
  %78 = load i32, ptr %77, align 4
  %79 = add nsw i32 %78, %69
  store i32 %79, ptr %77, align 4
  br label %80

80:                                               ; preds = %50
  %81 = load i32, ptr %15, align 4
  %82 = add nsw i32 %81, 1
  store i32 %82, ptr %15, align 4
  br label %46, !llvm.loop !6

83:                                               ; preds = %46
  br label %84

84:                                               ; preds = %83
  %85 = load i32, ptr %14, align 4
  %86 = add nsw i32 %85, 1
  store i32 %86, ptr %14, align 4
  br label %33, !llvm.loop !8

87:                                               ; preds = %33
  br label %88

88:                                               ; preds = %87
  %89 = load i32, ptr %13, align 4
  %90 = add nsw i32 %89, 1
  store i32 %90, ptr %13, align 4
  br label %28, !llvm.loop !9

91:                                               ; preds = %28
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
