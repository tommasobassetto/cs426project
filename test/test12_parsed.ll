; ModuleID = 'test/test12.ll'
source_filename = "test/test12.ll"

@.str = private unnamed_addr constant [40 x i8] c"sum of all array elements plus 2 was %d\00", align 1

define dso_local void @generateRandomArray(i32 noundef %0, ptr noundef %1) {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store ptr %1, ptr %4, align 8
  call void @srand(i32 noundef 0)
  store i32 0, ptr %5, align 4
  br label %6

6:                                                ; preds = %17, %2
  %7 = load i32, ptr %5, align 4
  %8 = load i32, ptr %3, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %20

10:                                               ; preds = %6
  %11 = call i32 @rand()
  %12 = srem i32 %11, 10
  %13 = load ptr, ptr %4, align 8
  %14 = load i32, ptr %5, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i32, ptr %13, i64 %15
  store i32 %12, ptr %16, align 4
  br label %17

17:                                               ; preds = %10
  %18 = load i32, ptr %5, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, ptr %5, align 4
  br label %6, !llvm.loop !6

20:                                               ; preds = %6
  ret void
}

declare void @srand(i32 noundef)

declare i32 @rand()

define dso_local i32 @main() {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %6 = call noalias ptr @malloc(i64 noundef 80)
  store ptr %6, ptr %2, align 8
  %7 = load ptr, ptr %2, align 8
  call void @generateRandomArray(i32 noundef 20, ptr noundef %7)
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %8

8:                                                ; preds = %17, %0
  %9 = load i32, ptr %4, align 4
  %10 = icmp slt i32 %9, 20
  br i1 %10, label %11, label %20

11:                                               ; preds = %8
  store i32 2, ptr %5, align 4
  %12 = load i32, ptr %4, align 4
  %13 = load i32, ptr %5, align 4
  %14 = add nsw i32 %12, %13
  %15 = load i32, ptr %3, align 4
  %16 = add nsw i32 %15, %14
  store i32 %16, ptr %3, align 4
  br label %17

17:                                               ; preds = %11
  %18 = load i32, ptr %4, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, ptr %4, align 4
  br label %8, !llvm.loop !8

20:                                               ; preds = %8
  %21 = load i32, ptr %3, align 4
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %21)
  %23 = load i32, ptr %1, align 4
  ret i32 %23
}

declare noalias ptr @malloc(i64 noundef)

declare i32 @printf(ptr noundef, ...)

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
