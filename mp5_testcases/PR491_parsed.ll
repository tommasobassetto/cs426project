; ModuleID = 'mp5_testcases/PR491_c.ll'
source_filename = "mp5_testcases/PR491.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%union.anon = type { i64 }

@.str = private unnamed_addr constant [11 x i8] c"u.l == 128\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"u.l < 0\00", align 1
@stderr = external global ptr, align 8
@.str.2 = private unnamed_addr constant [35 x i8] c"assertion failed in line %u: '%s'\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @test(i32 noundef %0) #0 {
  %2 = alloca %union.anon, align 8
  store i64 0, ptr %2, align 8
  %3 = getelementptr inbounds [8 x i8], ptr %2, i64 0, i64 0
  store i8 -128, ptr %3, align 8
  %4 = load i64, ptr %2, align 8
  %5 = icmp eq i64 %4, 128
  br i1 %5, label %8, label %6

6:                                                ; preds = %1
  %7 = call i32 @assert_fail(ptr noundef @.str, i32 noundef 22)
  br label %8

8:                                                ; preds = %1, %6
  %9 = phi i32 [ %7, %6 ], [ 1, %1 ]
  %10 = and i32 %0, %9
  store i64 0, ptr %2, align 8
  %11 = getelementptr inbounds [8 x i8], ptr %2, i64 0, i64 7
  store i8 -128, ptr %11, align 1
  %12 = load i64, ptr %2, align 8
  %13 = icmp slt i64 %12, 0
  br i1 %13, label %16, label %14

14:                                               ; preds = %8
  %15 = call i32 @assert_fail(ptr noundef @.str.1, i32 noundef 24)
  br label %16

16:                                               ; preds = %8, %14
  %17 = phi i32 [ %15, %14 ], [ 1, %8 ]
  %18 = and i32 %10, %17
  ret i32 %18
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @assert_fail(ptr noundef %0, i32 noundef %1) #0 {
  %3 = load ptr, ptr @stderr, align 8
  %4 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %3, ptr noundef @.str.2, i32 noundef %1, ptr noundef %0)
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = call i32 @test(i32 noundef 1)
  %2 = icmp ne i32 %1, 1
  %3 = zext i1 %2 to i32
  ret i32 %3
}

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 15.0.7"}
