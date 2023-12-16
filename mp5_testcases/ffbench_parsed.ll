; ModuleID = 'mp5_testcases/ffbench_c.ll'
source_filename = "mp5_testcases/ffbench.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@main.nsize = internal global [3 x i32] zeroinitializer, align 4
@stderr = external global ptr, align 8
@.str = private unnamed_addr constant [28 x i8] c"Can't allocate data array.\0A\00", align 1
@.str.1 = private unnamed_addr constant [48 x i8] c"Wrong answer at (%d,%d)!  Expected %d, got %d.\0A\00", align 1
@.str.2 = private unnamed_addr constant [35 x i8] c"%d passes.  No errors in results.\0A\00", align 1
@.str.3 = private unnamed_addr constant [35 x i8] c"%d passes.  %d errors in results.\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = sext i32 65536 to i64
  %2 = add nsw i64 %1, 1
  %3 = mul nsw i64 %2, 2
  %4 = mul i64 %3, 8
  store i32 256, ptr getelementptr inbounds ([3 x i32], ptr @main.nsize, i64 0, i64 2), align 4
  store i32 256, ptr getelementptr inbounds ([3 x i32], ptr @main.nsize, i64 0, i64 1), align 4
  %5 = call noalias ptr @malloc(i64 noundef %4) #7
  %6 = icmp eq ptr %5, null
  br i1 %6, label %7, label %10

7:                                                ; preds = %0
  %8 = load ptr, ptr @stderr, align 8
  %9 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %8, ptr noundef @.str)
  call void @exit(i32 noundef 1) #8
  unreachable

10:                                               ; preds = %0
  call void @llvm.memset.p0.i64(ptr align 8 %5, i8 0, i64 %4, i1 false)
  br label %11

11:                                               ; preds = %26, %10
  %.01 = phi i32 [ 0, %10 ], [ %27, %26 ]
  %12 = icmp slt i32 %.01, 256
  br i1 %12, label %.preheader4, label %.preheader3

.preheader4:                                      ; preds = %11, %24
  %.02 = phi i32 [ %25, %24 ], [ 0, %11 ]
  %13 = icmp slt i32 %.02, 256
  br i1 %13, label %14, label %26

14:                                               ; preds = %.preheader4
  %15 = and i32 %.01, 15
  %16 = icmp eq i32 %15, 8
  %or.cond = select i1 %16, i1 true, i1 false
  br i1 %or.cond, label %17, label %24

17:                                               ; preds = %14
  %18 = mul nsw i32 256, %.01
  %19 = add nsw i32 %18, %.02
  %20 = mul nsw i32 %19, 2
  %21 = add nsw i32 1, %20
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds double, ptr %5, i64 %22
  store double 1.280000e+02, ptr %23, align 8
  br label %24

24:                                               ; preds = %17, %14
  %25 = add nsw i32 %.02, 1
  br label %.preheader4, !llvm.loop !6

26:                                               ; preds = %.preheader4
  %27 = add nsw i32 %.01, 1
  br label %11, !llvm.loop !8

.preheader3:                                      ; preds = %11, %29
  %.1 = phi i32 [ %30, %29 ], [ 0, %11 ]
  %28 = icmp slt i32 %.1, 63
  br i1 %28, label %29, label %.preheader2

29:                                               ; preds = %.preheader3
  call void @fourn(ptr noundef %5, ptr noundef @main.nsize, i32 noundef 2, i32 noundef 1)
  call void @fourn(ptr noundef %5, ptr noundef @main.nsize, i32 noundef 2, i32 noundef -1)
  %30 = add nsw i32 %.1, 1
  br label %.preheader3, !llvm.loop !9

.preheader2:                                      ; preds = %.preheader3, %33
  %.011 = phi double [ %..011, %33 ], [ 1.000000e+10, %.preheader3 ]
  %.010 = phi double [ %39, %33 ], [ -1.000000e+10, %.preheader3 ]
  %.2 = phi i32 [ %40, %33 ], [ 1, %.preheader3 ]
  %31 = sext i32 %.2 to i64
  %32 = icmp sle i64 %31, %1
  br i1 %32, label %33, label %41

33:                                               ; preds = %.preheader2
  %34 = sext i32 %.2 to i64
  %35 = getelementptr inbounds double, ptr %5, i64 %34
  %36 = load double, ptr %35, align 8
  %37 = fcmp ole double %36, %.011
  %..011 = select i1 %37, double %36, double %.011
  %38 = fcmp ogt double %36, %.010
  %39 = select i1 %38, double %36, double %.010
  %40 = add nsw i32 %.2, 2
  br label %.preheader2, !llvm.loop !10

41:                                               ; preds = %.preheader2
  %42 = fsub double %.010, %.011
  %43 = fdiv double 2.550000e+02, %42
  br label %44

44:                                               ; preds = %71, %41
  %.06 = phi i32 [ 0, %41 ], [ %.17, %71 ]
  %.3 = phi i32 [ 0, %41 ], [ %72, %71 ]
  %45 = icmp slt i32 %.3, 256
  br i1 %45, label %.preheader, label %73

.preheader:                                       ; preds = %44, %69
  %.17 = phi i32 [ %.28, %69 ], [ %.06, %44 ]
  %.13 = phi i32 [ %70, %69 ], [ 0, %44 ]
  %46 = icmp slt i32 %.13, 256
  br i1 %46, label %47, label %71

47:                                               ; preds = %.preheader
  %48 = mul nsw i32 256, %.3
  %49 = add nsw i32 %48, %.13
  %50 = mul nsw i32 %49, 2
  %51 = add nsw i32 1, %50
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds double, ptr %5, i64 %52
  %54 = load double, ptr %53, align 8
  %55 = fsub double %54, %.011
  %56 = fmul double %55, %43
  %57 = fptosi double %56 to i32
  %58 = and i32 %.3, 15
  %59 = icmp eq i32 %58, 8
  %60 = and i32 %.13, 15
  %61 = icmp eq i32 %60, 8
  %62 = select i1 %59, i1 true, i1 %61
  %63 = select i1 %62, i32 255, i32 0
  %64 = icmp ne i32 %57, %63
  br i1 %64, label %65, label %69

65:                                               ; preds = %47
  %66 = add nsw i32 %.17, 1
  %67 = load ptr, ptr @stderr, align 8
  %68 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %67, ptr noundef @.str.1, i32 noundef %.3, i32 noundef %.13, i32 noundef %63, i32 noundef %57)
  br label %69

69:                                               ; preds = %47, %65
  %.28 = phi i32 [ %66, %65 ], [ %.17, %47 ]
  %70 = add nsw i32 %.13, 1
  br label %.preheader, !llvm.loop !11

71:                                               ; preds = %.preheader
  %72 = add nsw i32 %.3, 1
  br label %44, !llvm.loop !12

73:                                               ; preds = %44
  %74 = icmp eq i32 %.06, 0
  br i1 %74, label %75, label %78

75:                                               ; preds = %73
  %76 = load ptr, ptr @stderr, align 8
  %77 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %76, ptr noundef @.str.2, i32 noundef 63)
  br label %81

78:                                               ; preds = %73
  %79 = load ptr, ptr @stderr, align 8
  %80 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %79, ptr noundef @.str.3, i32 noundef 63, i32 noundef %.06)
  br label %81

81:                                               ; preds = %78, %75
  ret i32 0
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #3

; Function Attrs: argmemonly nocallback nofree nounwind willreturn writeonly
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: noinline nounwind uwtable
define internal void @fourn(ptr noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  br label %5

5:                                                ; preds = %7, %4
  %.011 = phi i32 [ 1, %4 ], [ %12, %7 ]
  %.09 = phi i32 [ 1, %4 ], [ %11, %7 ]
  %6 = icmp sle i32 %.011, %2
  br i1 %6, label %7, label %.preheader6

7:                                                ; preds = %5
  %8 = sext i32 %.011 to i64
  %9 = getelementptr inbounds i32, ptr %1, i64 %8
  %10 = load i32, ptr %9, align 4
  %11 = mul nsw i32 %.09, %10
  %12 = add nsw i32 %.011, 1
  br label %5, !llvm.loop !13

.preheader6:                                      ; preds = %5, %146
  %.112 = phi i32 [ %148, %146 ], [ %2, %5 ]
  %.010 = phi i32 [ %147, %146 ], [ 1, %5 ]
  %13 = icmp sge i32 %.112, 1
  br i1 %13, label %14, label %149

14:                                               ; preds = %.preheader6
  %15 = sext i32 %.112 to i64
  %16 = getelementptr inbounds i32, ptr %1, i64 %15
  %17 = load i32, ptr %16, align 4
  %18 = mul nsw i32 %17, %.010
  %19 = sdiv i32 %.09, %18
  %20 = shl i32 %.010, 1
  %21 = mul nsw i32 %20, %17
  %22 = mul nsw i32 %21, %19
  br label %23

23:                                               ; preds = %68, %14
  %.07 = phi i32 [ 1, %14 ], [ %69, %68 ]
  %.03 = phi i32 [ 1, %14 ], [ %70, %68 ]
  %24 = icmp sle i32 %.03, %21
  br i1 %24, label %25, label %.preheader5

25:                                               ; preds = %23
  %26 = icmp slt i32 %.03, %.07
  br i1 %26, label %.preheader3, label %.loopexit4

.preheader3:                                      ; preds = %25, %59
  %.02 = phi i32 [ %60, %59 ], [ %.03, %25 ]
  %27 = add nsw i32 %.03, %20
  %28 = sub nsw i32 %27, 2
  %29 = icmp sle i32 %.02, %28
  br i1 %29, label %.preheader2, label %.loopexit4

.preheader2:                                      ; preds = %.preheader3, %31
  %.05 = phi i32 [ %58, %31 ], [ %.02, %.preheader3 ]
  %30 = icmp sle i32 %.05, %22
  br i1 %30, label %31, label %59

31:                                               ; preds = %.preheader2
  %32 = add nsw i32 %.07, %.05
  %33 = sub nsw i32 %32, %.03
  %34 = sext i32 %.05 to i64
  %35 = getelementptr inbounds double, ptr %0, i64 %34
  %36 = load double, ptr %35, align 8
  %37 = sext i32 %33 to i64
  %38 = getelementptr inbounds double, ptr %0, i64 %37
  %39 = load double, ptr %38, align 8
  %40 = sext i32 %.05 to i64
  %41 = getelementptr inbounds double, ptr %0, i64 %40
  store double %39, ptr %41, align 8
  %42 = sext i32 %33 to i64
  %43 = getelementptr inbounds double, ptr %0, i64 %42
  store double %36, ptr %43, align 8
  %44 = add nsw i32 %.05, 1
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds double, ptr %0, i64 %45
  %47 = load double, ptr %46, align 8
  %48 = add nsw i32 %33, 1
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds double, ptr %0, i64 %49
  %51 = load double, ptr %50, align 8
  %52 = add nsw i32 %.05, 1
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds double, ptr %0, i64 %53
  store double %51, ptr %54, align 8
  %55 = add nsw i32 %33, 1
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds double, ptr %0, i64 %56
  store double %47, ptr %57, align 8
  %58 = add nsw i32 %.05, %21
  br label %.preheader2, !llvm.loop !14

59:                                               ; preds = %.preheader2
  %60 = add nsw i32 %.02, 2
  br label %.preheader3, !llvm.loop !15

.loopexit4:                                       ; preds = %.preheader3, %25
  %61 = ashr i32 %21, 1
  br label %62

62:                                               ; preds = %65, %.loopexit4
  %.013 = phi i32 [ %61, %.loopexit4 ], [ %67, %65 ]
  %.18 = phi i32 [ %.07, %.loopexit4 ], [ %66, %65 ]
  %63 = icmp sge i32 %.013, %20
  %64 = icmp sgt i32 %.18, %.013
  %spec.select = select i1 %63, i1 %64, i1 false
  br i1 %spec.select, label %65, label %68

65:                                               ; preds = %62
  %66 = sub nsw i32 %.18, %.013
  %67 = ashr i32 %.013, 1
  br label %62, !llvm.loop !16

68:                                               ; preds = %62
  %69 = add nsw i32 %.18, %.013
  %70 = add nsw i32 %.03, %20
  br label %23, !llvm.loop !17

.preheader5:                                      ; preds = %84, %23
  %.014 = phi i32 [ %20, %23 ], [ %73, %84 ]
  %71 = icmp slt i32 %.014, %21
  br i1 %71, label %72, label %146

72:                                               ; preds = %.preheader5
  %73 = shl i32 %.014, 1
  %74 = sitofp i32 %3 to double
  %75 = fmul double %74, 0x401921FB54442D1C
  %76 = sdiv i32 %73, %20
  %77 = sitofp i32 %76 to double
  %78 = fdiv double %75, %77
  %79 = fmul double 5.000000e-01, %78
  %80 = call double @sin(double noundef %79) #9
  %81 = fmul double -2.000000e+00, %80
  %82 = fmul double %81, %80
  %83 = call double @sin(double noundef %78) #9
  br label %84

84:                                               ; preds = %137, %72
  %.16 = phi i32 [ 1, %72 ], [ %145, %137 ]
  %.01 = phi double [ 0.000000e+00, %72 ], [ %144, %137 ]
  %.0 = phi double [ 1.000000e+00, %72 ], [ %141, %137 ]
  %85 = icmp sle i32 %.16, %.014
  br i1 %85, label %.preheader1, label %.preheader5, !llvm.loop !18

.preheader1:                                      ; preds = %84, %135
  %.1 = phi i32 [ %136, %135 ], [ %.16, %84 ]
  %86 = add nsw i32 %.16, %20
  %87 = sub nsw i32 %86, 2
  %88 = icmp sle i32 %.1, %87
  br i1 %88, label %.preheader, label %137

.preheader:                                       ; preds = %.preheader1, %90
  %.14 = phi i32 [ %134, %90 ], [ %.1, %.preheader1 ]
  %89 = icmp sle i32 %.14, %22
  br i1 %89, label %90, label %135

90:                                               ; preds = %.preheader
  %91 = add nsw i32 %.14, %.014
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds double, ptr %0, i64 %92
  %94 = load double, ptr %93, align 8
  %95 = add nsw i32 %91, 1
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds double, ptr %0, i64 %96
  %98 = load double, ptr %97, align 8
  %99 = fmul double %.01, %98
  %100 = fneg double %99
  %101 = call double @llvm.fmuladd.f64(double %.0, double %94, double %100)
  %102 = add nsw i32 %91, 1
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds double, ptr %0, i64 %103
  %105 = load double, ptr %104, align 8
  %106 = sext i32 %91 to i64
  %107 = getelementptr inbounds double, ptr %0, i64 %106
  %108 = load double, ptr %107, align 8
  %109 = fmul double %.01, %108
  %110 = call double @llvm.fmuladd.f64(double %.0, double %105, double %109)
  %111 = sext i32 %.14 to i64
  %112 = getelementptr inbounds double, ptr %0, i64 %111
  %113 = load double, ptr %112, align 8
  %114 = fsub double %113, %101
  %115 = sext i32 %91 to i64
  %116 = getelementptr inbounds double, ptr %0, i64 %115
  store double %114, ptr %116, align 8
  %117 = add nsw i32 %.14, 1
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds double, ptr %0, i64 %118
  %120 = load double, ptr %119, align 8
  %121 = fsub double %120, %110
  %122 = add nsw i32 %91, 1
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds double, ptr %0, i64 %123
  store double %121, ptr %124, align 8
  %125 = sext i32 %.14 to i64
  %126 = getelementptr inbounds double, ptr %0, i64 %125
  %127 = load double, ptr %126, align 8
  %128 = fadd double %127, %101
  store double %128, ptr %126, align 8
  %129 = add nsw i32 %.14, 1
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds double, ptr %0, i64 %130
  %132 = load double, ptr %131, align 8
  %133 = fadd double %132, %110
  store double %133, ptr %131, align 8
  %134 = add nsw i32 %.14, %73
  br label %.preheader, !llvm.loop !19

135:                                              ; preds = %.preheader
  %136 = add nsw i32 %.1, 2
  br label %.preheader1, !llvm.loop !20

137:                                              ; preds = %.preheader1
  %138 = fmul double %.01, %83
  %139 = fneg double %138
  %140 = call double @llvm.fmuladd.f64(double %.0, double %82, double %139)
  %141 = fadd double %140, %.0
  %142 = fmul double %.0, %83
  %143 = call double @llvm.fmuladd.f64(double %.01, double %82, double %142)
  %144 = fadd double %143, %.01
  %145 = add nsw i32 %.16, %20
  br label %84, !llvm.loop !21

146:                                              ; preds = %.preheader5
  %147 = mul nsw i32 %.010, %17
  %148 = add nsw i32 %.112, -1
  br label %.preheader6, !llvm.loop !22

149:                                              ; preds = %.preheader6
  ret void
}

; Function Attrs: nounwind
declare double @sin(double noundef) #5

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fmuladd.f64(double, double, double) #6

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nocallback nofree nounwind willreturn writeonly }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #7 = { nounwind allocsize(0) }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind }

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
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
!15 = distinct !{!15, !7}
!16 = distinct !{!16, !7}
!17 = distinct !{!17, !7}
!18 = distinct !{!18, !7}
!19 = distinct !{!19, !7}
!20 = distinct !{!20, !7}
!21 = distinct !{!21, !7}
!22 = distinct !{!22, !7}
