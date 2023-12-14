; ModuleID = 'test/cse_c.ll'
source_filename = "test/cse.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"in c, ret = %f\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @add(i32 noundef %0) #0 {
  %2 = add nsw i32 3, %0
  ret i32 %2
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @bitcast(i8 noundef signext %0) #0 {
  %2 = sext i8 %0 to i32
  ret i32 %2
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @icmp(i32 noundef %0) #0 {
  %2 = add nsw i32 1, 2
  ret i32 %2
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = fcmp olt float 4.000000e+00, 2.000000e+00
  br i1 %1, label %2, label %3

2:                                                ; preds = %0
  br label %4

3:                                                ; preds = %0
  br label %4

4:                                                ; preds = %3, %2
  %5 = phi float [ 4.000000e+00, %2 ], [ 1.000000e+00, %3 ]
  %6 = fpext float %5 to double
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %6)
  ret i32 3
}

declare i32 @printf(ptr noundef, ...) #1

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
