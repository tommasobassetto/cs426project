; ModuleID = 'mp5_testcases/nsieve-bits.c'
source_filename = "mp5_testcases/nsieve-bits.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [22 x i8] c"Primes up to %8d %8d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store i32 40960000, ptr %7, align 4
  %13 = load i32, ptr %7, align 4
  %14 = udiv i32 %13, 8
  %15 = zext i32 %14 to i64
  %16 = add i64 %15, 4
  %17 = call noalias ptr @malloc(i64 noundef %16) #5
  store ptr %17, ptr %8, align 8
  %18 = load ptr, ptr %8, align 8
  %19 = icmp ne ptr %18, null
  br i1 %19, label %21, label %20

20:                                               ; preds = %2
  store i32 1, ptr %3, align 4
  br label %108

21:                                               ; preds = %2
  store i32 0, ptr %6, align 4
  br label %22

22:                                               ; preds = %103, %21
  %23 = load i32, ptr %6, align 4
  %24 = icmp ule i32 %23, 2
  br i1 %24, label %25, label %106

25:                                               ; preds = %22
  store i32 0, ptr %11, align 4
  %26 = load i32, ptr %7, align 4
  %27 = load i32, ptr %6, align 4
  %28 = lshr i32 %26, %27
  store i32 %28, ptr %12, align 4
  %29 = load ptr, ptr %8, align 8
  %30 = load i32, ptr %12, align 4
  %31 = udiv i32 %30, 8
  %32 = zext i32 %31 to i64
  %33 = add i64 %32, 4
  call void @llvm.memset.p0.i64(ptr align 4 %29, i8 -1, i64 %33, i1 false)
  store i32 2, ptr %9, align 4
  br label %34

34:                                               ; preds = %96, %25
  %35 = load i32, ptr %9, align 4
  %36 = load i32, ptr %12, align 4
  %37 = icmp ule i32 %35, %36
  br i1 %37, label %38, label %99

38:                                               ; preds = %34
  %39 = load ptr, ptr %8, align 8
  %40 = load i32, ptr %9, align 4
  %41 = zext i32 %40 to i64
  %42 = udiv i64 %41, 32
  %43 = getelementptr inbounds i32, ptr %39, i64 %42
  %44 = load i32, ptr %43, align 4
  %45 = load i32, ptr %9, align 4
  %46 = zext i32 %45 to i64
  %47 = urem i64 %46, 32
  %48 = trunc i64 %47 to i32
  %49 = shl i32 1, %48
  %50 = and i32 %44, %49
  %51 = icmp ne i32 %50, 0
  br i1 %51, label %52, label %95

52:                                               ; preds = %38
  %53 = load i32, ptr %11, align 4
  %54 = add i32 %53, 1
  store i32 %54, ptr %11, align 4
  %55 = load i32, ptr %9, align 4
  %56 = load i32, ptr %9, align 4
  %57 = add i32 %55, %56
  store i32 %57, ptr %10, align 4
  br label %58

58:                                               ; preds = %90, %52
  %59 = load i32, ptr %10, align 4
  %60 = load i32, ptr %12, align 4
  %61 = icmp ule i32 %59, %60
  br i1 %61, label %62, label %94

62:                                               ; preds = %58
  %63 = load ptr, ptr %8, align 8
  %64 = load i32, ptr %10, align 4
  %65 = zext i32 %64 to i64
  %66 = udiv i64 %65, 32
  %67 = getelementptr inbounds i32, ptr %63, i64 %66
  %68 = load i32, ptr %67, align 4
  %69 = load i32, ptr %10, align 4
  %70 = zext i32 %69 to i64
  %71 = urem i64 %70, 32
  %72 = trunc i64 %71 to i32
  %73 = shl i32 1, %72
  %74 = and i32 %68, %73
  %75 = icmp ne i32 %74, 0
  br i1 %75, label %76, label %89

76:                                               ; preds = %62
  %77 = load i32, ptr %10, align 4
  %78 = zext i32 %77 to i64
  %79 = urem i64 %78, 32
  %80 = trunc i64 %79 to i32
  %81 = shl i32 1, %80
  %82 = load ptr, ptr %8, align 8
  %83 = load i32, ptr %10, align 4
  %84 = zext i32 %83 to i64
  %85 = udiv i64 %84, 32
  %86 = getelementptr inbounds i32, ptr %82, i64 %85
  %87 = load i32, ptr %86, align 4
  %88 = xor i32 %87, %81
  store i32 %88, ptr %86, align 4
  br label %89

89:                                               ; preds = %76, %62
  br label %90

90:                                               ; preds = %89
  %91 = load i32, ptr %9, align 4
  %92 = load i32, ptr %10, align 4
  %93 = add i32 %92, %91
  store i32 %93, ptr %10, align 4
  br label %58, !llvm.loop !6

94:                                               ; preds = %58
  br label %95

95:                                               ; preds = %94, %38
  br label %96

96:                                               ; preds = %95
  %97 = load i32, ptr %9, align 4
  %98 = add i32 %97, 1
  store i32 %98, ptr %9, align 4
  br label %34, !llvm.loop !8

99:                                               ; preds = %34
  %100 = load i32, ptr %12, align 4
  %101 = load i32, ptr %11, align 4
  %102 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %100, i32 noundef %101)
  br label %103

103:                                              ; preds = %99
  %104 = load i32, ptr %6, align 4
  %105 = add i32 %104, 1
  store i32 %105, ptr %6, align 4
  br label %22, !llvm.loop !9

106:                                              ; preds = %22
  %107 = load ptr, ptr %8, align 8
  call void @free(ptr noundef %107) #6
  store i32 0, ptr %3, align 4
  br label %108

108:                                              ; preds = %106, %20
  %109 = load i32, ptr %3, align 4
  ret i32 %109
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: argmemonly nocallback nofree nounwind willreturn writeonly
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #2

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: nounwind
declare void @free(ptr noundef) #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { argmemonly nocallback nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind allocsize(0) }
attributes #6 = { nounwind }

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
