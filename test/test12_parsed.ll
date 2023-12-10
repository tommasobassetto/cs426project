; ModuleID = 'test/test12.ll'
source_filename = "test/test12.ll"

@.str = private unnamed_addr constant [40 x i8] c"sum of all array elements plus 2 was %d\00", align 1

define dso_local void @generateRandomArray(i32 noundef %0, ptr noundef %1) {
  call void @srand(i32 noundef 0)
  br label %3

3:                                                ; preds = %10, %2
  %.0 = phi i32 [ 0, %2 ], [ %11, %10 ]
  %4 = icmp slt i32 %.0, %0
  br i1 %4, label %5, label %12

5:                                                ; preds = %3
  %6 = call i32 @rand()
  %7 = srem i32 %6, 10
  %8 = sext i32 %.0 to i64
  %9 = getelementptr inbounds i32, ptr %1, i64 %8
  store i32 %7, ptr %9, align 4
  br label %10

10:                                               ; preds = %5
  %11 = add nsw i32 %.0, 1
  br label %3, !llvm.loop !6

12:                                               ; preds = %3
  ret void
}

declare void @srand(i32 noundef)

declare i32 @rand()

define dso_local i32 @main() {
  %1 = call noalias ptr @malloc(i64 noundef 80)
  call void @generateRandomArray(i32 noundef 20, ptr noundef %1)
  br label %2

2:                                                ; preds = %7, %0
  %.01 = phi i32 [ 0, %0 ], [ %6, %7 ]
  %.0 = phi i32 [ 0, %0 ], [ %8, %7 ]
  %3 = icmp slt i32 %.0, 20
  br i1 %3, label %4, label %9

4:                                                ; preds = %2
  %5 = add nsw i32 %.0, 2
  %6 = add nsw i32 %.01, %5
  br label %7

7:                                                ; preds = %4
  %8 = add nsw i32 %.0, 1
  br label %2, !llvm.loop !8

9:                                                ; preds = %2
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %.01)
  ret i32 0
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
