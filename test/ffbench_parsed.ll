; ModuleID = 'test/ffbench.ll'
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
  %1 = mul nsw i32 256, 256
  %2 = sext i32 %1 to i64
  %3 = add nsw i64 %2, 1
  %4 = mul nsw i64 %3, 2
  %5 = mul i64 %4, 8
  store i32 256, ptr getelementptr inbounds ([3 x i32], ptr @main.nsize, i64 0, i64 2), align 4
  store i32 256, ptr getelementptr inbounds ([3 x i32], ptr @main.nsize, i64 0, i64 1), align 4
  %6 = call noalias ptr @malloc(i64 noundef %5) #7
  %7 = icmp eq ptr %6, null
  br i1 %7, label %8, label %11

8:                                                ; preds = %0
  %9 = load ptr, ptr @stderr, align 8
  %10 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %9, ptr noundef @.str)
  call void @exit(i32 noundef 1) #8
  unreachable

11:                                               ; preds = %0
  call void @llvm.memset.p0.i64(ptr align 8 %6, i8 0, i64 %5, i1 false)
  br label %12

12:                                               ; preds = %34, %11
  %.01 = phi i32 [ 0, %11 ], [ %35, %34 ]
  %13 = icmp slt i32 %.01, 256
  br i1 %13, label %14, label %36

14:                                               ; preds = %12
  br label %15

15:                                               ; preds = %31, %14
  %.02 = phi i32 [ 0, %14 ], [ %32, %31 ]
  %16 = icmp slt i32 %.02, 256
  br i1 %16, label %17, label %33

17:                                               ; preds = %15
  %18 = and i32 %.01, 15
  %19 = icmp eq i32 %18, 8
  br i1 %19, label %23, label %20

20:                                               ; preds = %17
  %21 = and i32 %.02, 15
  %22 = icmp eq i32 %21, 8
  br i1 %22, label %23, label %30

23:                                               ; preds = %20, %17
  %24 = mul nsw i32 256, %.01
  %25 = add nsw i32 %24, %.02
  %26 = mul nsw i32 %25, 2
  %27 = add nsw i32 1, %26
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds double, ptr %6, i64 %28
  store double 1.280000e+02, ptr %29, align 8
  br label %30

30:                                               ; preds = %23, %20
  br label %31

31:                                               ; preds = %30
  %32 = add nsw i32 %.02, 1
  br label %15, !llvm.loop !6

33:                                               ; preds = %15
  br label %34

34:                                               ; preds = %33
  %35 = add nsw i32 %.01, 1
  br label %12, !llvm.loop !8

36:                                               ; preds = %12
  br label %37

37:                                               ; preds = %40, %36
  %.1 = phi i32 [ 0, %36 ], [ %41, %40 ]
  %38 = icmp slt i32 %.1, 63
  br i1 %38, label %39, label %42

39:                                               ; preds = %37
  call void @fourn(ptr noundef %6, ptr noundef @main.nsize, i32 noundef 2, i32 noundef 1)
  call void @fourn(ptr noundef %6, ptr noundef @main.nsize, i32 noundef 2, i32 noundef -1)
  br label %40

40:                                               ; preds = %39
  %41 = add nsw i32 %.1, 1
  br label %37, !llvm.loop !9

42:                                               ; preds = %37
  br label %43

43:                                               ; preds = %76, %42
  %.011 = phi double [ 1.000000e+10, %42 ], [ %60, %76 ]
  %.010 = phi double [ -1.000000e+10, %42 ], [ %65, %76 ]
  %.09 = phi double [ 1.000000e+10, %42 ], [ %70, %76 ]
  %.05 = phi double [ -1.000000e+10, %42 ], [ %75, %76 ]
  %.04 = phi double [ 0.000000e+00, %42 ], [ %54, %76 ]
  %.2 = phi i32 [ 1, %42 ], [ %77, %76 ]
  %.0 = phi double [ 0.000000e+00, %42 ], [ %55, %76 ]
  %44 = sext i32 %.2 to i64
  %45 = icmp sle i64 %44, %2
  br i1 %45, label %46, label %78

46:                                               ; preds = %43
  %47 = sext i32 %.2 to i64
  %48 = getelementptr inbounds double, ptr %6, i64 %47
  %49 = load double, ptr %48, align 8
  %50 = add nsw i32 %.2, 1
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds double, ptr %6, i64 %51
  %53 = load double, ptr %52, align 8
  %54 = fadd double %.04, %49
  %55 = fadd double %.0, %53
  %56 = fcmp ole double %49, %.011
  br i1 %56, label %57, label %58

57:                                               ; preds = %46
  br label %59

58:                                               ; preds = %46
  br label %59

59:                                               ; preds = %58, %57
  %60 = phi double [ %49, %57 ], [ %.011, %58 ]
  %61 = fcmp ogt double %49, %.010
  br i1 %61, label %62, label %63

62:                                               ; preds = %59
  br label %64

63:                                               ; preds = %59
  br label %64

64:                                               ; preds = %63, %62
  %65 = phi double [ %49, %62 ], [ %.010, %63 ]
  %66 = fcmp ole double %53, %.09
  br i1 %66, label %67, label %68

67:                                               ; preds = %64
  br label %69

68:                                               ; preds = %64
  br label %69

69:                                               ; preds = %68, %67
  %70 = phi double [ %53, %67 ], [ %.09, %68 ]
  %71 = fcmp ogt double %53, %.05
  br i1 %71, label %72, label %73

72:                                               ; preds = %69
  br label %74

73:                                               ; preds = %69
  br label %74

74:                                               ; preds = %73, %72
  %75 = phi double [ %53, %72 ], [ %.05, %73 ]
  br label %76

76:                                               ; preds = %74
  %77 = add nsw i32 %.2, 2
  br label %43, !llvm.loop !10

78:                                               ; preds = %43
  %79 = fsub double %.010, %.011
  %80 = fdiv double 2.550000e+02, %79
  br label %81

81:                                               ; preds = %115, %78
  %.06 = phi i32 [ 0, %78 ], [ %.17, %115 ]
  %.3 = phi i32 [ 0, %78 ], [ %116, %115 ]
  %82 = icmp slt i32 %.3, 256
  br i1 %82, label %83, label %117

83:                                               ; preds = %81
  br label %84

84:                                               ; preds = %112, %83
  %.17 = phi i32 [ %.06, %83 ], [ %.28, %112 ]
  %.13 = phi i32 [ 0, %83 ], [ %113, %112 ]
  %85 = icmp slt i32 %.13, 256
  br i1 %85, label %86, label %114

86:                                               ; preds = %84
  %87 = mul nsw i32 256, %.3
  %88 = add nsw i32 %87, %.13
  %89 = mul nsw i32 %88, 2
  %90 = add nsw i32 1, %89
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds double, ptr %6, i64 %91
  %93 = load double, ptr %92, align 8
  %94 = fsub double %93, %.011
  %95 = fmul double %94, %80
  %96 = fptosi double %95 to i32
  %97 = and i32 %.3, 15
  %98 = icmp eq i32 %97, 8
  br i1 %98, label %102, label %99

99:                                               ; preds = %86
  %100 = and i32 %.13, 15
  %101 = icmp eq i32 %100, 8
  br label %102

102:                                              ; preds = %99, %86
  %103 = phi i1 [ true, %86 ], [ %101, %99 ]
  %104 = zext i1 %103 to i64
  %105 = select i1 %103, i32 255, i32 0
  %106 = icmp ne i32 %96, %105
  br i1 %106, label %107, label %111

107:                                              ; preds = %102
  %108 = add nsw i32 %.17, 1
  %109 = load ptr, ptr @stderr, align 8
  %110 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %109, ptr noundef @.str.1, i32 noundef %.3, i32 noundef %.13, i32 noundef %105, i32 noundef %96)
  br label %111

111:                                              ; preds = %107, %102
  %.28 = phi i32 [ %108, %107 ], [ %.17, %102 ]
  br label %112

112:                                              ; preds = %111
  %113 = add nsw i32 %.13, 1
  br label %84, !llvm.loop !11

114:                                              ; preds = %84
  br label %115

115:                                              ; preds = %114
  %116 = add nsw i32 %.3, 1
  br label %81, !llvm.loop !12

117:                                              ; preds = %81
  %118 = icmp eq i32 %.06, 0
  br i1 %118, label %119, label %122

119:                                              ; preds = %117
  %120 = load ptr, ptr @stderr, align 8
  %121 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %120, ptr noundef @.str.2, i32 noundef 63)
  br label %125

122:                                              ; preds = %117
  %123 = load ptr, ptr @stderr, align 8
  %124 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %123, ptr noundef @.str.3, i32 noundef 63, i32 noundef %.06)
  br label %125

125:                                              ; preds = %122, %119
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

5:                                                ; preds = %12, %4
  %.011 = phi i32 [ 1, %4 ], [ %13, %12 ]
  %.09 = phi i32 [ 1, %4 ], [ %11, %12 ]
  %6 = icmp sle i32 %.011, %2
  br i1 %6, label %7, label %14

7:                                                ; preds = %5
  %8 = sext i32 %.011 to i64
  %9 = getelementptr inbounds i32, ptr %1, i64 %8
  %10 = load i32, ptr %9, align 4
  %11 = mul nsw i32 %.09, %10
  br label %12

12:                                               ; preds = %7
  %13 = add nsw i32 %.011, 1
  br label %5, !llvm.loop !13

14:                                               ; preds = %5
  %15 = sitofp i32 %3 to double
  %16 = fmul double %15, 0x401921FB54442D1C
  br label %17

17:                                               ; preds = %173, %14
  %.112 = phi i32 [ %2, %14 ], [ %174, %173 ]
  %.010 = phi i32 [ 1, %14 ], [ %172, %173 ]
  %18 = icmp sge i32 %.112, 1
  br i1 %18, label %19, label %175

19:                                               ; preds = %17
  %20 = sext i32 %.112 to i64
  %21 = getelementptr inbounds i32, ptr %1, i64 %20
  %22 = load i32, ptr %21, align 4
  %23 = mul nsw i32 %22, %.010
  %24 = sdiv i32 %.09, %23
  %25 = shl i32 %.010, 1
  %26 = mul nsw i32 %25, %22
  %27 = mul nsw i32 %26, %24
  br label %28

28:                                               ; preds = %86, %19
  %.07 = phi i32 [ 1, %19 ], [ %85, %86 ]
  %.03 = phi i32 [ 1, %19 ], [ %87, %86 ]
  %29 = icmp sle i32 %.03, %26
  br i1 %29, label %30, label %88

30:                                               ; preds = %28
  %31 = icmp slt i32 %.03, %.07
  br i1 %31, label %32, label %73

32:                                               ; preds = %30
  br label %33

33:                                               ; preds = %70, %32
  %.02 = phi i32 [ %.03, %32 ], [ %71, %70 ]
  %34 = add nsw i32 %.03, %25
  %35 = sub nsw i32 %34, 2
  %36 = icmp sle i32 %.02, %35
  br i1 %36, label %37, label %72

37:                                               ; preds = %33
  br label %38

38:                                               ; preds = %67, %37
  %.05 = phi i32 [ %.02, %37 ], [ %68, %67 ]
  %39 = icmp sle i32 %.05, %27
  br i1 %39, label %40, label %69

40:                                               ; preds = %38
  %41 = add nsw i32 %.07, %.05
  %42 = sub nsw i32 %41, %.03
  %43 = sext i32 %.05 to i64
  %44 = getelementptr inbounds double, ptr %0, i64 %43
  %45 = load double, ptr %44, align 8
  %46 = sext i32 %42 to i64
  %47 = getelementptr inbounds double, ptr %0, i64 %46
  %48 = load double, ptr %47, align 8
  %49 = sext i32 %.05 to i64
  %50 = getelementptr inbounds double, ptr %0, i64 %49
  store double %48, ptr %50, align 8
  %51 = sext i32 %42 to i64
  %52 = getelementptr inbounds double, ptr %0, i64 %51
  store double %45, ptr %52, align 8
  %53 = add nsw i32 %.05, 1
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds double, ptr %0, i64 %54
  %56 = load double, ptr %55, align 8
  %57 = add nsw i32 %42, 1
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds double, ptr %0, i64 %58
  %60 = load double, ptr %59, align 8
  %61 = add nsw i32 %.05, 1
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds double, ptr %0, i64 %62
  store double %60, ptr %63, align 8
  %64 = add nsw i32 %42, 1
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds double, ptr %0, i64 %65
  store double %56, ptr %66, align 8
  br label %67

67:                                               ; preds = %40
  %68 = add nsw i32 %.05, %26
  br label %38, !llvm.loop !14

69:                                               ; preds = %38
  br label %70

70:                                               ; preds = %69
  %71 = add nsw i32 %.02, 2
  br label %33, !llvm.loop !15

72:                                               ; preds = %33
  br label %73

73:                                               ; preds = %72, %30
  %74 = ashr i32 %26, 1
  br label %75

75:                                               ; preds = %81, %73
  %.013 = phi i32 [ %74, %73 ], [ %83, %81 ]
  %.18 = phi i32 [ %.07, %73 ], [ %82, %81 ]
  %76 = icmp sge i32 %.013, %25
  br i1 %76, label %77, label %79

77:                                               ; preds = %75
  %78 = icmp sgt i32 %.18, %.013
  br label %79

79:                                               ; preds = %77, %75
  %80 = phi i1 [ false, %75 ], [ %78, %77 ]
  br i1 %80, label %81, label %84

81:                                               ; preds = %79
  %82 = sub nsw i32 %.18, %.013
  %83 = ashr i32 %.013, 1
  br label %75, !llvm.loop !16

84:                                               ; preds = %79
  %85 = add nsw i32 %.18, %.013
  br label %86

86:                                               ; preds = %84
  %87 = add nsw i32 %.03, %25
  br label %28, !llvm.loop !17

88:                                               ; preds = %28
  br label %89

89:                                               ; preds = %170, %88
  %.014 = phi i32 [ %25, %88 ], [ %92, %170 ]
  %90 = icmp slt i32 %.014, %26
  br i1 %90, label %91, label %171

91:                                               ; preds = %89
  %92 = shl i32 %.014, 1
  %93 = sdiv i32 %92, %25
  %94 = sitofp i32 %93 to double
  %95 = fdiv double %16, %94
  %96 = fmul double 5.000000e-01, %95
  %97 = call double @sin(double noundef %96) #9
  %98 = fmul double -2.000000e+00, %97
  %99 = fmul double %98, %97
  %100 = call double @sin(double noundef %95) #9
  br label %101

101:                                              ; preds = %168, %91
  %.16 = phi i32 [ 1, %91 ], [ %169, %168 ]
  %.01 = phi double [ 0.000000e+00, %91 ], [ %167, %168 ]
  %.0 = phi double [ 1.000000e+00, %91 ], [ %164, %168 ]
  %102 = icmp sle i32 %.16, %.014
  br i1 %102, label %103, label %170

103:                                              ; preds = %101
  br label %104

104:                                              ; preds = %158, %103
  %.1 = phi i32 [ %.16, %103 ], [ %159, %158 ]
  %105 = add nsw i32 %.16, %25
  %106 = sub nsw i32 %105, 2
  %107 = icmp sle i32 %.1, %106
  br i1 %107, label %108, label %160

108:                                              ; preds = %104
  br label %109

109:                                              ; preds = %155, %108
  %.14 = phi i32 [ %.1, %108 ], [ %156, %155 ]
  %110 = icmp sle i32 %.14, %27
  br i1 %110, label %111, label %157

111:                                              ; preds = %109
  %112 = add nsw i32 %.14, %.014
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds double, ptr %0, i64 %113
  %115 = load double, ptr %114, align 8
  %116 = add nsw i32 %112, 1
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds double, ptr %0, i64 %117
  %119 = load double, ptr %118, align 8
  %120 = fmul double %.01, %119
  %121 = fneg double %120
  %122 = call double @llvm.fmuladd.f64(double %.0, double %115, double %121)
  %123 = add nsw i32 %112, 1
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds double, ptr %0, i64 %124
  %126 = load double, ptr %125, align 8
  %127 = sext i32 %112 to i64
  %128 = getelementptr inbounds double, ptr %0, i64 %127
  %129 = load double, ptr %128, align 8
  %130 = fmul double %.01, %129
  %131 = call double @llvm.fmuladd.f64(double %.0, double %126, double %130)
  %132 = sext i32 %.14 to i64
  %133 = getelementptr inbounds double, ptr %0, i64 %132
  %134 = load double, ptr %133, align 8
  %135 = fsub double %134, %122
  %136 = sext i32 %112 to i64
  %137 = getelementptr inbounds double, ptr %0, i64 %136
  store double %135, ptr %137, align 8
  %138 = add nsw i32 %.14, 1
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds double, ptr %0, i64 %139
  %141 = load double, ptr %140, align 8
  %142 = fsub double %141, %131
  %143 = add nsw i32 %112, 1
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds double, ptr %0, i64 %144
  store double %142, ptr %145, align 8
  %146 = sext i32 %.14 to i64
  %147 = getelementptr inbounds double, ptr %0, i64 %146
  %148 = load double, ptr %147, align 8
  %149 = fadd double %148, %122
  store double %149, ptr %147, align 8
  %150 = add nsw i32 %.14, 1
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds double, ptr %0, i64 %151
  %153 = load double, ptr %152, align 8
  %154 = fadd double %153, %131
  store double %154, ptr %152, align 8
  br label %155

155:                                              ; preds = %111
  %156 = add nsw i32 %.14, %92
  br label %109, !llvm.loop !18

157:                                              ; preds = %109
  br label %158

158:                                              ; preds = %157
  %159 = add nsw i32 %.1, 2
  br label %104, !llvm.loop !19

160:                                              ; preds = %104
  %161 = fmul double %.01, %100
  %162 = fneg double %161
  %163 = call double @llvm.fmuladd.f64(double %.0, double %99, double %162)
  %164 = fadd double %163, %.0
  %165 = fmul double %.0, %100
  %166 = call double @llvm.fmuladd.f64(double %.01, double %99, double %165)
  %167 = fadd double %166, %.01
  br label %168

168:                                              ; preds = %160
  %169 = add nsw i32 %.16, %25
  br label %101, !llvm.loop !20

170:                                              ; preds = %101
  br label %89, !llvm.loop !21

171:                                              ; preds = %89
  %172 = mul nsw i32 %.010, %22
  br label %173

173:                                              ; preds = %171
  %174 = add nsw i32 %.112, -1
  br label %17, !llvm.loop !22

175:                                              ; preds = %17
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
