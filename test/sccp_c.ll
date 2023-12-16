; ModuleID = 'test/sccp.ll'
source_filename = "test/sccp.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@a = internal constant [8 x [3 x double]] [[3 x double] [double 0x3FD8C637FD3B6253, double 0.000000e+00, double 0.000000e+00], [3 x double] [double 0x3FE725849423E3E0, double 0.000000e+00, double 0.000000e+00], [3 x double] [double 0x3FF000011136AEF5, double 0.000000e+00, double 0.000000e+00], [3 x double] [double 0x3FF860FD96F0D223, double 3.000000e-10, double 0.000000e+00], [3 x double] [double 0x4014CF7737365089, double 1.913200e-06, double -3.900000e-09], [3 x double] [double 0x40231C1D0EBB7C0F, double -2.138960e-05, double 4.440000e-08], [3 x double] [double 0x403337EC14C35EFA, double -3.716000e-07, double 0x3E7A47A3038502A4], [3 x double] [double 0x403E1C425059FB17, double -1.663500e-06, double 6.860000e-08]], align 16
@dlm = internal constant [8 x [3 x double]] [[3 x double] [double 0x406F88076B035926, double 0x41F40BBCADEE3CB4, double -1.927890e+00], [3 x double] [double 0x4066BF5A874FEAFA, double 0x41DF6432F5157881, double 5.938100e-01], [3 x double] [double 0x40591DDA6DBF7622, double 0x41D34FC2F3B56502, double -2.044110e+00], [3 x double] [double 0x407636ED90F7B482, double 0x41C4890A4B784DFD, double 9.426400e-01], [3 x double] [double 0x40412CFE90EA1D96, double 0x419A0C7E6F1EA0BA, double 0xC03E9A915379FA98], [3 x double] [double 0x404909E9B1DFE17D, double 0x4184FA9E14756430, double 0x4052E76ED677707A], [3 x double] [double 0x4073A0E14D09C902, double 0x416D6BA57E0EFDCA, double -1.750830e+00], [3 x double] [double 0x4073059422411D82, double 0x415E0127CD46B26C, double 2.110300e-01]], align 16
@e = internal constant [8 x [3 x double]] [[3 x double] [double 0x3FCA52242A37D430, double 0x3F2ABF4B9459E7F4, double -2.834900e-06], [3 x double] [double 0x3F7BBCDE77820827, double 0xBF3F4DAC25FB4BC2, double 9.812700e-06], [3 x double] [double 0x3F911C1175CC9F7B, double 0xBF3B8C8FA536F731, double -1.267340e-05], [3 x double] [double 0x3FB7E91AD74BF5B0, double 0x3F4DA66143B5E407, double -8.064100e-06], [3 x double] [double 0x3FA8D4B857E48742, double 0x3F5ABE2B9A18B7B5, double -4.713660e-05], [3 x double] [double 0x3FAC70CE5FA41E66, double 0xBF6C6594A86FD58E, double -6.436390e-05], [3 x double] [double 0x3FA7BF479022D287, double 0xBF31E2FE6AE927D8, double 7.891300e-06], [3 x double] [double 0x3F835D88E0FE76D8, double 6.032630e-05, double 0.000000e+00]], align 16
@pi = internal constant [8 x [3 x double]] [[3 x double] [double 0x40535D310DE9F882, double 0x40B6571DAB9F559B, double -4.830160e+00], [3 x double] [double 0x40607209DADFB507, double 0x4065EF9096BB98C8, double 0xC07F27B59DDC1E79], [3 x double] [double 0x4059BBFD82CD2461, double 0x40C6AE2D2BD3C361, double 0x404AA34C6E6D9BE5], [3 x double] [double 0x407500F6B7DFD5BE, double 0x40CF363AC3222920, double -6.232800e+01], [3 x double] [double 0x402CA993F265B897, double 0x40BE4EC06AD2DCB1, double 0x40703F599ED7C6FC], [3 x double] [double 0x405743A9C7642D26, double 0x40D3EADFA415F45E, double 0x4067C84DFCE3150E], [3 x double] [double 0x4065A02B58283528, double 0x40A91F1FF04577D9, double 0xC0410BE37DE939EB], [3 x double] [double 0x40480F65305B6785, double 0x40906AE060FE4799, double 0x403B65ACEEE0F3CB]], align 16
@dinc = internal constant [8 x [3 x double]] [[3 x double] [double 0x401C051B1D92B7FE, double 0xC06AC83387160957, double 2.897700e-01], [3 x double] [double 0x400B28447E34386C, double 0xC03ED828A1DFB939, double 0xC0275B52007DD441], [3 x double] [double 0.000000e+00, double 0x407D5F90F51AC9B0, double -3.350530e+00], [3 x double] [double 0x3FFD987ACB2252BB, double 0xC072551355475A32, double -8.118300e+00], [3 x double] [double 0x3FF4DA2E7A10E830, double 0xC051E3C504816F00, double 0x4027E7EBAF102364], [3 x double] [double 0x4003E939471E778F, double 0x4056F686594AF4F1, double 0xC031A989374BC6A8], [3 x double] [double 0x3FE8BE07677D67B5, double 0xC04E5D15DF6555C5, double 1.257590e+00], [3 x double] [double 0x3FFC51B9CE9853F4, double 0x40203F251C193B3A, double 8.135000e-02]], align 16
@omega = internal constant [8 x [3 x double]] [[3 x double] [double 0x40482A5AB400A313, double 0xC0B1A3379F01B867, double 0xC03FCC8605681ECD], [3 x double] [double 0x40532B83CFF8FC2B, double 0xC0C38C3DA31A4BDC, double 0xC049A9BEF49CF56F], [3 x double] [double 0x4065DBF10E4FF9E8, double 0xC0C0F3A29A804966, double 0x402EAF0ED3D859C9], [3 x double] [double 0x4048C76F992A88EB, double 0xC0C4BE7350092CCF, double 0xC06CD25F84CAD57C], [3 x double] [double 0x40591DB8D838BBB3, double 0x40B8DA091DBCA969, double 0x4074685935FC3B4F], [3 x double] [double 0x405C6A9797E1B38F, double 0xC0C20C1986983516, double 0xC0508F320D9945B7], [3 x double] [double 0x405280619982C872, double 0x40A4DA4CF80DC337, double 0x40623E1187E7C06E], [3 x double] [double 0x40607916FEBF632D, double 0xC06BBE2EDBB59DDC, double -7.872800e-01]], align 16
@kp = internal constant [8 x [9 x double]] [[9 x double] [double 6.961300e+04, double 7.564500e+04, double 8.830600e+04, double 5.989900e+04, double 1.574600e+04, double 7.108700e+04, double 1.421730e+05, double 3.086000e+03, double 0.000000e+00], [9 x double] [double 2.186300e+04, double 3.279400e+04, double 2.693400e+04, double 1.093100e+04, double 2.625000e+04, double 4.372500e+04, double 5.386700e+04, double 2.893900e+04, double 0.000000e+00], [9 x double] [double 1.600200e+04, double 2.186300e+04, double 3.200400e+04, double 1.093100e+04, double 1.452900e+04, double 1.636800e+04, double 1.531800e+04, double 3.279400e+04, double 0.000000e+00], [9 x double] [double 6.345000e+03, double 7.818000e+03, double 1.563600e+04, double 7.077000e+03, double 8.184000e+03, double 1.416300e+04, double 1.107000e+03, double 4.872000e+03, double 0.000000e+00], [9 x double] [double 1.760000e+03, double 1.454000e+03, double 1.167000e+03, double 8.800000e+02, double 2.870000e+02, double 2.640000e+03, double 1.900000e+01, double 2.047000e+03, double 1.454000e+03], [9 x double] [double 5.740000e+02, double 0.000000e+00, double 8.800000e+02, double 2.870000e+02, double 1.900000e+01, double 1.760000e+03, double 1.167000e+03, double 3.060000e+02, double 5.740000e+02], [9 x double] [double 2.040000e+02, double 0.000000e+00, double 1.770000e+02, double 1.265000e+03, double 4.000000e+00, double 3.850000e+02, double 2.000000e+02, double 2.080000e+02, double 2.040000e+02], [9 x double] [double 0.000000e+00, double 1.020000e+02, double 1.060000e+02, double 4.000000e+00, double 9.800000e+01, double 1.367000e+03, double 4.870000e+02, double 2.040000e+02, double 0.000000e+00]], align 16
@kq = internal constant [8 x [10 x double]] [[10 x double] [double 3.086000e+03, double 1.574600e+04, double 6.961300e+04, double 5.989900e+04, double 7.564500e+04, double 8.830600e+04, double 1.266100e+04, double 2.658000e+03, double 0.000000e+00, double 0.000000e+00], [10 x double] [double 2.186300e+04, double 3.279400e+04, double 1.093100e+04, double 7.300000e+01, double 4.387000e+03, double 2.693400e+04, double 1.473000e+03, double 2.157000e+03, double 0.000000e+00, double 0.000000e+00], [10 x double] [double 1.000000e+01, double 1.600200e+04, double 2.186300e+04, double 1.093100e+04, double 1.473000e+03, double 3.200400e+04, double 4.387000e+03, double 7.300000e+01, double 0.000000e+00, double 0.000000e+00], [10 x double] [double 1.000000e+01, double 6.345000e+03, double 7.818000e+03, double 1.107000e+03, double 1.563600e+04, double 7.077000e+03, double 8.184000e+03, double 5.320000e+02, double 1.000000e+01, double 0.000000e+00], [10 x double] [double 1.900000e+01, double 1.760000e+03, double 1.454000e+03, double 2.870000e+02, double 1.167000e+03, double 8.800000e+02, double 5.740000e+02, double 2.640000e+03, double 1.900000e+01, double 1.454000e+03], [10 x double] [double 1.900000e+01, double 5.740000e+02, double 2.870000e+02, double 3.060000e+02, double 1.760000e+03, double 1.200000e+01, double 3.100000e+01, double 3.800000e+01, double 1.900000e+01, double 5.740000e+02], [10 x double] [double 4.000000e+00, double 2.040000e+02, double 1.770000e+02, double 8.000000e+00, double 3.100000e+01, double 2.000000e+02, double 1.265000e+03, double 1.020000e+02, double 4.000000e+00, double 2.040000e+02], [10 x double] [double 4.000000e+00, double 1.020000e+02, double 1.060000e+02, double 8.000000e+00, double 9.800000e+01, double 1.367000e+03, double 4.870000e+02, double 2.040000e+02, double 4.000000e+00, double 1.020000e+02]], align 16
@ca = internal constant [8 x [9 x double]] [[9 x double] [double 4.000000e+00, double -1.300000e+01, double 1.100000e+01, double -9.000000e+00, double -9.000000e+00, double -3.000000e+00, double -1.000000e+00, double 4.000000e+00, double 0.000000e+00], [9 x double] [double -1.560000e+02, double 5.900000e+01, double -4.200000e+01, double 6.000000e+00, double 1.900000e+01, double -2.000000e+01, double -1.000000e+01, double -1.200000e+01, double 0.000000e+00], [9 x double] [double 6.400000e+01, double -1.520000e+02, double 6.200000e+01, double -8.000000e+00, double 3.200000e+01, double -4.100000e+01, double 1.900000e+01, double -1.100000e+01, double 0.000000e+00], [9 x double] [double 1.240000e+02, double 6.210000e+02, double -1.450000e+02, double 2.080000e+02, double 5.400000e+01, double -5.700000e+01, double 3.000000e+01, double 1.500000e+01, double 0.000000e+00], [9 x double] [double -2.343700e+04, double -2.634000e+03, double 6.601000e+03, double 6.259000e+03, double -1.507000e+03, double -1.821000e+03, double 2.620000e+03, double -2.115000e+03, double -1.489000e+03], [9 x double] [double 6.291100e+04, double -1.199190e+05, double 7.933600e+04, double 1.781400e+04, double -2.424100e+04, double 1.206800e+04, double 8.306000e+03, double -4.893000e+03, double 8.902000e+03], [9 x double] [double 3.890610e+05, double -2.621250e+05, double -4.408800e+04, double 8.387000e+03, double -2.297600e+04, double -2.093000e+03, double -6.150000e+02, double -9.720000e+03, double 6.633000e+03], [9 x double] [double -4.122350e+05, double -1.570460e+05, double -3.143000e+04, double 3.781700e+04, double -9.740000e+03, double -1.300000e+01, double -7.449000e+03, double 9.644000e+03, double 0.000000e+00]], align 16
@sa = internal constant [8 x [9 x double]] [[9 x double] [double -2.900000e+01, double -1.000000e+00, double 9.000000e+00, double 6.000000e+00, double -6.000000e+00, double 5.000000e+00, double 4.000000e+00, double 0.000000e+00, double 0.000000e+00], [9 x double] [double -4.800000e+01, double -1.250000e+02, double -2.600000e+01, double -3.700000e+01, double 1.800000e+01, double -1.300000e+01, double -2.000000e+01, double -2.000000e+00, double 0.000000e+00], [9 x double] [double -1.500000e+02, double -4.600000e+01, double 6.800000e+01, double 5.400000e+01, double 1.400000e+01, double 2.400000e+01, double -2.800000e+01, double 2.200000e+01, double 0.000000e+00], [9 x double] [double -6.210000e+02, double 5.320000e+02, double -6.940000e+02, double -2.000000e+01, double 1.920000e+02, double -9.400000e+01, double 7.100000e+01, double -7.300000e+01, double 0.000000e+00], [9 x double] [double -1.461400e+04, double -1.982800e+04, double -5.869000e+03, double 1.881000e+03, double -4.372000e+03, double -2.255000e+03, double 7.820000e+02, double 9.300000e+02, double 9.130000e+02], [9 x double] [double 1.397370e+05, double 0.000000e+00, double 2.466700e+04, double 5.112300e+04, double -5.102000e+03, double 7.429000e+03, double -4.095000e+03, double -1.976000e+03, double -9.566000e+03], [9 x double] [double -1.380810e+05, double 0.000000e+00, double 3.720500e+04, double -4.903900e+04, double -4.190100e+04, double -3.387200e+04, double -2.703700e+04, double -1.247400e+04, double 1.879700e+04], [9 x double] [double 0.000000e+00, double 2.849200e+04, double 1.332360e+05, double 6.965400e+04, double 5.232200e+04, double -4.957700e+04, double -2.643000e+04, double -3.593000e+03, double 0.000000e+00]], align 16
@cl = internal constant [8 x [10 x double]] [[10 x double] [double 2.100000e+01, double -9.500000e+01, double -1.570000e+02, double 4.100000e+01, double -5.000000e+00, double 4.200000e+01, double 2.300000e+01, double 3.000000e+01, double 0.000000e+00, double 0.000000e+00], [10 x double] [double -1.600000e+02, double -3.130000e+02, double -2.350000e+02, double 6.000000e+01, double -7.400000e+01, double -7.600000e+01, double -2.700000e+01, double 3.400000e+01, double 0.000000e+00, double 0.000000e+00], [10 x double] [double -3.250000e+02, double -3.220000e+02, double -7.900000e+01, double 2.320000e+02, double -5.200000e+01, double 9.700000e+01, double 5.500000e+01, double -4.100000e+01, double 0.000000e+00, double 0.000000e+00], [10 x double] [double 2.268000e+03, double -9.790000e+02, double 8.020000e+02, double 6.020000e+02, double -6.680000e+02, double -3.300000e+01, double 3.450000e+02, double 2.010000e+02, double -5.500000e+01, double 0.000000e+00], [10 x double] [double 7.610000e+03, double -4.997000e+03, double -7.689000e+03, double -5.841000e+03, double -2.617000e+03, double 1.115000e+03, double -7.480000e+02, double -6.070000e+02, double 6.074000e+03, double 3.540000e+02], [10 x double] [double -1.854900e+04, double 3.012500e+04, double 2.001200e+04, double -7.300000e+02, double 8.240000e+02, double 2.300000e+01, double 1.289000e+03, double -3.520000e+02, double -1.476700e+04, double -2.062000e+03], [10 x double] [double -1.352450e+05, double -1.459400e+04, double 4.197000e+03, double -4.030000e+03, double -5.630000e+03, double -2.898000e+03, double 2.540000e+03, double -3.060000e+02, double 2.939000e+03, double 1.986000e+03], [10 x double] [double 8.994800e+04, double 2.103000e+03, double 8.963000e+03, double 2.695000e+03, double 3.682000e+03, double 1.648000e+03, double 8.660000e+02, double -1.540000e+02, double -1.963000e+03, double -2.830000e+02]], align 16
@sl = internal constant [8 x [10 x double]] [[10 x double] [double -3.420000e+02, double 1.360000e+02, double -2.300000e+01, double 6.200000e+01, double 6.600000e+01, double -5.200000e+01, double -3.300000e+01, double 1.700000e+01, double 0.000000e+00, double 0.000000e+00], [10 x double] [double 5.240000e+02, double -1.490000e+02, double -3.500000e+01, double 1.170000e+02, double 1.510000e+02, double 1.220000e+02, double -7.100000e+01, double -6.200000e+01, double 0.000000e+00, double 0.000000e+00], [10 x double] [double -1.050000e+02, double -1.370000e+02, double 2.580000e+02, double 3.500000e+01, double -1.160000e+02, double -8.800000e+01, double -1.120000e+02, double -8.000000e+01, double 0.000000e+00, double 0.000000e+00], [10 x double] [double 8.540000e+02, double -2.050000e+02, double -9.360000e+02, double -2.400000e+02, double 1.400000e+02, double -3.410000e+02, double -9.700000e+01, double -2.320000e+02, double 5.360000e+02, double 0.000000e+00], [10 x double] [double -5.698000e+04, double 8.016000e+03, double 1.012000e+03, double 1.448000e+03, double -3.024000e+03, double -3.710000e+03, double 3.180000e+02, double 5.030000e+02, double 3.767000e+03, double 5.770000e+02], [10 x double] [double 1.386060e+05, double -1.347800e+04, double -4.964000e+03, double 1.441000e+03, double -1.319000e+03, double -1.482000e+03, double 4.270000e+02, double 1.236000e+03, double -9.167000e+03, double -1.918000e+03], [10 x double] [double 7.123400e+04, double -4.111600e+04, double 5.334000e+03, double -4.935000e+03, double -1.848000e+03, double 6.600000e+01, double 4.340000e+02, double -1.748000e+03, double 3.780000e+03, double -7.010000e+02], [10 x double] [double -4.764500e+04, double 1.164700e+04, double 2.166000e+03, double 3.194000e+03, double 6.790000e+02, double 0.000000e+00, double -2.440000e+02, double -4.190000e+02, double -2.531000e+03, double 4.800000e+01]], align 16
@amas = internal constant [8 x double] [double 6.023600e+06, double 0x4118EF2E00000000, double 0x4114131200000000, double 3.098710e+06, double 0x40905D6B851EB852, double 3.498500e+03, double 2.286900e+04, double 1.931400e+04], align 16
@.str = private unnamed_addr constant [4 x i8] c"-ga\00", align 1
@.str.1 = private unnamed_addr constant [10 x i8] c"%f %f %f\0A\00", align 1
@stdout = external global ptr, align 8

; Function Attrs: noinline nounwind uwtable
define dso_local double @anpm(double noundef %0) #0 {
  %2 = call double @fmod(double noundef %0, double noundef 0x401921FB54442D18) #5
  %3 = call double @llvm.fabs.f64(double %2)
  %4 = fcmp oge double %3, 0x400921FB54442D18
  br i1 %4, label %5, label %10

5:                                                ; preds = %1
  %6 = fcmp olt double %0, 0.000000e+00
  %7 = zext i1 %6 to i64
  %8 = select i1 %6, double 0xC01921FB54442D18, double 0x401921FB54442D18
  %9 = fsub double %2, %8
  br label %10

10:                                               ; preds = %5, %1
  %.0 = phi double [ %9, %5 ], [ %2, %1 ]
  ret double %.0
}

; Function Attrs: nounwind
declare double @fmod(double noundef, double noundef) #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @planetpv(ptr noundef %0, i32 noundef %1, ptr noundef %2) #0 {
  %4 = getelementptr inbounds double, ptr %0, i64 0
  %5 = load double, ptr %4, align 8
  %6 = fsub double %5, 0x4142B42C80000000
  %7 = getelementptr inbounds double, ptr %0, i64 1
  %8 = load double, ptr %7, align 8
  %9 = fadd double %6, %8
  %10 = fdiv double %9, 3.652500e+05
  %11 = sext i32 %1 to i64
  %12 = getelementptr inbounds [8 x [3 x double]], ptr @a, i64 0, i64 %11
  %13 = getelementptr inbounds [3 x double], ptr %12, i64 0, i64 0
  %14 = load double, ptr %13, align 8
  %15 = sext i32 %1 to i64
  %16 = getelementptr inbounds [8 x [3 x double]], ptr @a, i64 0, i64 %15
  %17 = getelementptr inbounds [3 x double], ptr %16, i64 0, i64 1
  %18 = load double, ptr %17, align 8
  %19 = sext i32 %1 to i64
  %20 = getelementptr inbounds [8 x [3 x double]], ptr @a, i64 0, i64 %19
  %21 = getelementptr inbounds [3 x double], ptr %20, i64 0, i64 2
  %22 = load double, ptr %21, align 8
  %23 = call double @llvm.fmuladd.f64(double %22, double %10, double %18)
  %24 = call double @llvm.fmuladd.f64(double %23, double %10, double %14)
  %25 = sext i32 %1 to i64
  %26 = getelementptr inbounds [8 x [3 x double]], ptr @dlm, i64 0, i64 %25
  %27 = getelementptr inbounds [3 x double], ptr %26, i64 0, i64 0
  %28 = load double, ptr %27, align 8
  %29 = sext i32 %1 to i64
  %30 = getelementptr inbounds [8 x [3 x double]], ptr @dlm, i64 0, i64 %29
  %31 = getelementptr inbounds [3 x double], ptr %30, i64 0, i64 1
  %32 = load double, ptr %31, align 8
  %33 = sext i32 %1 to i64
  %34 = getelementptr inbounds [8 x [3 x double]], ptr @dlm, i64 0, i64 %33
  %35 = getelementptr inbounds [3 x double], ptr %34, i64 0, i64 2
  %36 = load double, ptr %35, align 8
  %37 = call double @llvm.fmuladd.f64(double %36, double %10, double %32)
  %38 = fmul double %37, %10
  %39 = call double @llvm.fmuladd.f64(double 3.600000e+03, double %28, double %38)
  %40 = fmul double %39, 0x3ED455A5B2FF8F9D
  %41 = sext i32 %1 to i64
  %42 = getelementptr inbounds [8 x [3 x double]], ptr @e, i64 0, i64 %41
  %43 = getelementptr inbounds [3 x double], ptr %42, i64 0, i64 0
  %44 = load double, ptr %43, align 8
  %45 = sext i32 %1 to i64
  %46 = getelementptr inbounds [8 x [3 x double]], ptr @e, i64 0, i64 %45
  %47 = getelementptr inbounds [3 x double], ptr %46, i64 0, i64 1
  %48 = load double, ptr %47, align 8
  %49 = sext i32 %1 to i64
  %50 = getelementptr inbounds [8 x [3 x double]], ptr @e, i64 0, i64 %49
  %51 = getelementptr inbounds [3 x double], ptr %50, i64 0, i64 2
  %52 = load double, ptr %51, align 8
  %53 = call double @llvm.fmuladd.f64(double %52, double %10, double %48)
  %54 = call double @llvm.fmuladd.f64(double %53, double %10, double %44)
  %55 = sext i32 %1 to i64
  %56 = getelementptr inbounds [8 x [3 x double]], ptr @pi, i64 0, i64 %55
  %57 = getelementptr inbounds [3 x double], ptr %56, i64 0, i64 0
  %58 = load double, ptr %57, align 8
  %59 = sext i32 %1 to i64
  %60 = getelementptr inbounds [8 x [3 x double]], ptr @pi, i64 0, i64 %59
  %61 = getelementptr inbounds [3 x double], ptr %60, i64 0, i64 1
  %62 = load double, ptr %61, align 8
  %63 = sext i32 %1 to i64
  %64 = getelementptr inbounds [8 x [3 x double]], ptr @pi, i64 0, i64 %63
  %65 = getelementptr inbounds [3 x double], ptr %64, i64 0, i64 2
  %66 = load double, ptr %65, align 8
  %67 = call double @llvm.fmuladd.f64(double %66, double %10, double %62)
  %68 = fmul double %67, %10
  %69 = call double @llvm.fmuladd.f64(double 3.600000e+03, double %58, double %68)
  %70 = fmul double %69, 0x3ED455A5B2FF8F9D
  %71 = call double @anpm(double noundef %70)
  %72 = sext i32 %1 to i64
  %73 = getelementptr inbounds [8 x [3 x double]], ptr @dinc, i64 0, i64 %72
  %74 = getelementptr inbounds [3 x double], ptr %73, i64 0, i64 0
  %75 = load double, ptr %74, align 8
  %76 = sext i32 %1 to i64
  %77 = getelementptr inbounds [8 x [3 x double]], ptr @dinc, i64 0, i64 %76
  %78 = getelementptr inbounds [3 x double], ptr %77, i64 0, i64 1
  %79 = load double, ptr %78, align 8
  %80 = sext i32 %1 to i64
  %81 = getelementptr inbounds [8 x [3 x double]], ptr @dinc, i64 0, i64 %80
  %82 = getelementptr inbounds [3 x double], ptr %81, i64 0, i64 2
  %83 = load double, ptr %82, align 8
  %84 = call double @llvm.fmuladd.f64(double %83, double %10, double %79)
  %85 = fmul double %84, %10
  %86 = call double @llvm.fmuladd.f64(double 3.600000e+03, double %75, double %85)
  %87 = fmul double %86, 0x3ED455A5B2FF8F9D
  %88 = sext i32 %1 to i64
  %89 = getelementptr inbounds [8 x [3 x double]], ptr @omega, i64 0, i64 %88
  %90 = getelementptr inbounds [3 x double], ptr %89, i64 0, i64 0
  %91 = load double, ptr %90, align 8
  %92 = sext i32 %1 to i64
  %93 = getelementptr inbounds [8 x [3 x double]], ptr @omega, i64 0, i64 %92
  %94 = getelementptr inbounds [3 x double], ptr %93, i64 0, i64 1
  %95 = load double, ptr %94, align 8
  %96 = sext i32 %1 to i64
  %97 = getelementptr inbounds [8 x [3 x double]], ptr @omega, i64 0, i64 %96
  %98 = getelementptr inbounds [3 x double], ptr %97, i64 0, i64 2
  %99 = load double, ptr %98, align 8
  %100 = call double @llvm.fmuladd.f64(double %99, double %10, double %95)
  %101 = fmul double %100, %10
  %102 = call double @llvm.fmuladd.f64(double 3.600000e+03, double %91, double %101)
  %103 = fmul double %102, 0x3ED455A5B2FF8F9D
  %104 = call double @anpm(double noundef %103)
  %105 = fmul double 0x3FD702A41F2E9970, %10
  br label %106

106:                                              ; preds = %108, %3
  %.03 = phi i32 [ 0, %3 ], [ %151, %108 ]
  %.02 = phi double [ %24, %3 ], [ %135, %108 ]
  %.01 = phi double [ %40, %3 ], [ %150, %108 ]
  %107 = icmp slt i32 %.03, 8
  br i1 %107, label %108, label %152

108:                                              ; preds = %106
  %109 = sext i32 %1 to i64
  %110 = getelementptr inbounds [8 x [9 x double]], ptr @kp, i64 0, i64 %109
  %111 = sext i32 %.03 to i64
  %112 = getelementptr inbounds [9 x double], ptr %110, i64 0, i64 %111
  %113 = load double, ptr %112, align 8
  %114 = fmul double %113, %105
  %115 = sext i32 %1 to i64
  %116 = getelementptr inbounds [8 x [10 x double]], ptr @kq, i64 0, i64 %115
  %117 = sext i32 %.03 to i64
  %118 = getelementptr inbounds [10 x double], ptr %116, i64 0, i64 %117
  %119 = load double, ptr %118, align 8
  %120 = fmul double %119, %105
  %121 = sext i32 %1 to i64
  %122 = getelementptr inbounds [8 x [9 x double]], ptr @ca, i64 0, i64 %121
  %123 = sext i32 %.03 to i64
  %124 = getelementptr inbounds [9 x double], ptr %122, i64 0, i64 %123
  %125 = load double, ptr %124, align 8
  %126 = call double @cos(double noundef %114) #5
  %127 = sext i32 %1 to i64
  %128 = getelementptr inbounds [8 x [9 x double]], ptr @sa, i64 0, i64 %127
  %129 = sext i32 %.03 to i64
  %130 = getelementptr inbounds [9 x double], ptr %128, i64 0, i64 %129
  %131 = load double, ptr %130, align 8
  %132 = call double @sin(double noundef %114) #5
  %133 = fmul double %131, %132
  %134 = call double @llvm.fmuladd.f64(double %125, double %126, double %133)
  %135 = call double @llvm.fmuladd.f64(double %134, double 0x3E7AD7F29ABCAF48, double %.02)
  %136 = sext i32 %1 to i64
  %137 = getelementptr inbounds [8 x [10 x double]], ptr @cl, i64 0, i64 %136
  %138 = sext i32 %.03 to i64
  %139 = getelementptr inbounds [10 x double], ptr %137, i64 0, i64 %138
  %140 = load double, ptr %139, align 8
  %141 = call double @cos(double noundef %120) #5
  %142 = sext i32 %1 to i64
  %143 = getelementptr inbounds [8 x [10 x double]], ptr @sl, i64 0, i64 %142
  %144 = sext i32 %.03 to i64
  %145 = getelementptr inbounds [10 x double], ptr %143, i64 0, i64 %144
  %146 = load double, ptr %145, align 8
  %147 = call double @sin(double noundef %120) #5
  %148 = fmul double %146, %147
  %149 = call double @llvm.fmuladd.f64(double %140, double %141, double %148)
  %150 = call double @llvm.fmuladd.f64(double %149, double 0x3E7AD7F29ABCAF48, double %.01)
  %151 = add nsw i32 %.03, 1
  br label %106, !llvm.loop !6

152:                                              ; preds = %106
  %153 = sext i32 %1 to i64
  %154 = getelementptr inbounds [8 x [9 x double]], ptr @kp, i64 0, i64 %153
  %155 = getelementptr inbounds [9 x double], ptr %154, i64 0, i64 8
  %156 = load double, ptr %155, align 8
  %157 = fmul double %156, %105
  %158 = sext i32 %1 to i64
  %159 = getelementptr inbounds [8 x [9 x double]], ptr @ca, i64 0, i64 %158
  %160 = getelementptr inbounds [9 x double], ptr %159, i64 0, i64 8
  %161 = load double, ptr %160, align 8
  %162 = call double @cos(double noundef %157) #5
  %163 = sext i32 %1 to i64
  %164 = getelementptr inbounds [8 x [9 x double]], ptr @sa, i64 0, i64 %163
  %165 = getelementptr inbounds [9 x double], ptr %164, i64 0, i64 8
  %166 = load double, ptr %165, align 8
  %167 = call double @sin(double noundef %157) #5
  %168 = fmul double %166, %167
  %169 = call double @llvm.fmuladd.f64(double %161, double %162, double %168)
  %170 = fmul double %10, %169
  %171 = call double @llvm.fmuladd.f64(double %170, double 0x3E7AD7F29ABCAF48, double %.02)
  br label %172

172:                                              ; preds = %174, %152
  %.14 = phi i32 [ 8, %152 ], [ %197, %174 ]
  %.1 = phi double [ %.01, %152 ], [ %196, %174 ]
  %173 = icmp sle i32 %.14, 9
  br i1 %173, label %174, label %198

174:                                              ; preds = %172
  %175 = sext i32 %1 to i64
  %176 = getelementptr inbounds [8 x [10 x double]], ptr @kq, i64 0, i64 %175
  %177 = sext i32 %.14 to i64
  %178 = getelementptr inbounds [10 x double], ptr %176, i64 0, i64 %177
  %179 = load double, ptr %178, align 8
  %180 = fmul double %179, %105
  %181 = sext i32 %1 to i64
  %182 = getelementptr inbounds [8 x [10 x double]], ptr @cl, i64 0, i64 %181
  %183 = sext i32 %.14 to i64
  %184 = getelementptr inbounds [10 x double], ptr %182, i64 0, i64 %183
  %185 = load double, ptr %184, align 8
  %186 = call double @cos(double noundef %180) #5
  %187 = sext i32 %1 to i64
  %188 = getelementptr inbounds [8 x [10 x double]], ptr @sl, i64 0, i64 %187
  %189 = sext i32 %.14 to i64
  %190 = getelementptr inbounds [10 x double], ptr %188, i64 0, i64 %189
  %191 = load double, ptr %190, align 8
  %192 = call double @sin(double noundef %180) #5
  %193 = fmul double %191, %192
  %194 = call double @llvm.fmuladd.f64(double %185, double %186, double %193)
  %195 = fmul double %10, %194
  %196 = call double @llvm.fmuladd.f64(double %195, double 0x3E7AD7F29ABCAF48, double %.1)
  %197 = add nsw i32 %.14, 1
  br label %172, !llvm.loop !8

198:                                              ; preds = %172
  %199 = call double @fmod(double noundef %.1, double noundef 0x401921FB54442D18) #5
  %200 = fsub double %199, %71
  %201 = call double @sin(double noundef %200) #5
  %202 = call double @llvm.fmuladd.f64(double %54, double %201, double %200)
  br label %203

203:                                              ; preds = %203, %198
  %.2 = phi i32 [ 0, %198 ], [ %212, %203 ]
  %.0 = phi double [ %202, %198 ], [ %211, %203 ]
  %204 = fsub double %200, %.0
  %205 = call double @sin(double noundef %.0) #5
  %206 = call double @llvm.fmuladd.f64(double %54, double %205, double %204)
  %207 = call double @cos(double noundef %.0) #5
  %208 = fneg double %54
  %209 = call double @llvm.fmuladd.f64(double %208, double %207, double 1.000000e+00)
  %210 = fdiv double %206, %209
  %211 = fadd double %.0, %210
  %212 = add nsw i32 %.2, 1
  %213 = icmp sge i32 %212, 10
  %214 = call double @llvm.fabs.f64(double %210)
  %215 = fcmp olt double %214, 0x3D719799812DEA11
  %or.cond = select i1 %213, i1 true, i1 %215
  br i1 %or.cond, label %216, label %203

216:                                              ; preds = %203
  %217 = fdiv double %211, 2.000000e+00
  %218 = fadd double 1.000000e+00, %54
  %219 = fsub double 1.000000e+00, %54
  %220 = fdiv double %218, %219
  %221 = call double @sqrt(double noundef %220) #5
  %222 = call double @sin(double noundef %217) #5
  %223 = fmul double %221, %222
  %224 = call double @cos(double noundef %217) #5
  %225 = call double @atan2(double noundef %223, double noundef %224) #5
  %226 = fmul double 2.000000e+00, %225
  %227 = call double @cos(double noundef %211) #5
  %228 = fneg double %54
  %229 = call double @llvm.fmuladd.f64(double %228, double %227, double 1.000000e+00)
  %230 = fmul double %171, %229
  %231 = sext i32 %1 to i64
  %232 = getelementptr inbounds [8 x double], ptr @amas, i64 0, i64 %231
  %233 = load double, ptr %232, align 8
  %234 = fdiv double 1.000000e+00, %233
  %235 = fadd double 1.000000e+00, %234
  %236 = fmul double %171, %171
  %237 = fmul double %236, %171
  %238 = fdiv double %235, %237
  %239 = call double @sqrt(double noundef %238) #5
  %240 = fmul double 0x3F919D6D51A6B69A, %239
  %241 = fdiv double %87, 2.000000e+00
  %242 = call double @sin(double noundef %241) #5
  %243 = call double @cos(double noundef %104) #5
  %244 = fmul double %242, %243
  %245 = call double @sin(double noundef %104) #5
  %246 = fmul double %242, %245
  %247 = fadd double %226, %71
  %248 = call double @sin(double noundef %247) #5
  %249 = call double @cos(double noundef %247) #5
  %250 = fmul double %244, %248
  %251 = fneg double %250
  %252 = call double @llvm.fmuladd.f64(double %246, double %249, double %251)
  %253 = fmul double 2.000000e+00, %252
  %254 = fneg double %54
  %255 = call double @llvm.fmuladd.f64(double %254, double %54, double 1.000000e+00)
  %256 = call double @sqrt(double noundef %255) #5
  %257 = fdiv double %171, %256
  %258 = fdiv double %87, 2.000000e+00
  %259 = call double @cos(double noundef %258) #5
  %260 = call double @sin(double noundef %71) #5
  %261 = call double @llvm.fmuladd.f64(double %54, double %260, double %248)
  %262 = fmul double %261, %257
  %263 = call double @cos(double noundef %71) #5
  %264 = call double @llvm.fmuladd.f64(double %54, double %263, double %249)
  %265 = fmul double %264, %257
  %266 = fmul double 2.000000e+00, %246
  %267 = fmul double %266, %244
  %268 = fneg double %253
  %269 = call double @llvm.fmuladd.f64(double %268, double %246, double %249)
  %270 = fmul double %230, %269
  %271 = call double @llvm.fmuladd.f64(double %253, double %244, double %248)
  %272 = fmul double %230, %271
  %273 = fneg double %253
  %274 = fmul double %273, %259
  %275 = fmul double %230, %274
  %276 = getelementptr inbounds [3 x double], ptr %2, i64 0
  %277 = getelementptr inbounds [3 x double], ptr %276, i64 0, i64 0
  store double %270, ptr %277, align 8
  %278 = fmul double %275, 0x3FD9752E50F4B399
  %279 = fneg double %278
  %280 = call double @llvm.fmuladd.f64(double %272, double 0x3FED5C0357681EF3, double %279)
  %281 = getelementptr inbounds [3 x double], ptr %2, i64 0
  %282 = getelementptr inbounds [3 x double], ptr %281, i64 0, i64 1
  store double %280, ptr %282, align 8
  %283 = fmul double %275, 0x3FED5C0357681EF3
  %284 = call double @llvm.fmuladd.f64(double %272, double 0x3FD9752E50F4B399, double %283)
  %285 = getelementptr inbounds [3 x double], ptr %2, i64 0
  %286 = getelementptr inbounds [3 x double], ptr %285, i64 0, i64 2
  store double %284, ptr %286, align 8
  %287 = fmul double 2.000000e+00, %246
  %288 = call double @llvm.fmuladd.f64(double %287, double %246, double -1.000000e+00)
  %289 = fmul double %267, %265
  %290 = call double @llvm.fmuladd.f64(double %288, double %262, double %289)
  %291 = fmul double %240, %290
  %292 = fmul double 2.000000e+00, %244
  %293 = fneg double %292
  %294 = call double @llvm.fmuladd.f64(double %293, double %244, double 1.000000e+00)
  %295 = fmul double %267, %262
  %296 = fneg double %295
  %297 = call double @llvm.fmuladd.f64(double %294, double %265, double %296)
  %298 = fmul double %240, %297
  %299 = fmul double 2.000000e+00, %259
  %300 = fmul double %244, %265
  %301 = call double @llvm.fmuladd.f64(double %246, double %262, double %300)
  %302 = fmul double %299, %301
  %303 = fmul double %240, %302
  %304 = getelementptr inbounds [3 x double], ptr %2, i64 1
  %305 = getelementptr inbounds [3 x double], ptr %304, i64 0, i64 0
  store double %291, ptr %305, align 8
  %306 = fmul double %303, 0x3FD9752E50F4B399
  %307 = fneg double %306
  %308 = call double @llvm.fmuladd.f64(double %298, double 0x3FED5C0357681EF3, double %307)
  %309 = getelementptr inbounds [3 x double], ptr %2, i64 1
  %310 = getelementptr inbounds [3 x double], ptr %309, i64 0, i64 1
  store double %308, ptr %310, align 8
  %311 = fmul double %303, 0x3FED5C0357681EF3
  %312 = call double @llvm.fmuladd.f64(double %298, double 0x3FD9752E50F4B399, double %311)
  %313 = getelementptr inbounds [3 x double], ptr %2, i64 1
  %314 = getelementptr inbounds [3 x double], ptr %313, i64 0, i64 2
  store double %312, ptr %314, align 8
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fmuladd.f64(double, double, double) #2

; Function Attrs: nounwind
declare double @cos(double noundef) #1

; Function Attrs: nounwind
declare double @sin(double noundef) #1

; Function Attrs: nounwind
declare double @atan2(double noundef, double noundef) #1

; Function Attrs: nounwind
declare double @sqrt(double noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @radecdist(ptr noundef %0, ptr noundef %1) #0 {
  %3 = getelementptr inbounds [3 x double], ptr %0, i64 0
  %4 = getelementptr inbounds [3 x double], ptr %3, i64 0, i64 0
  %5 = load double, ptr %4, align 8
  %6 = getelementptr inbounds [3 x double], ptr %0, i64 0
  %7 = getelementptr inbounds [3 x double], ptr %6, i64 0, i64 0
  %8 = load double, ptr %7, align 8
  %9 = getelementptr inbounds [3 x double], ptr %0, i64 0
  %10 = getelementptr inbounds [3 x double], ptr %9, i64 0, i64 1
  %11 = load double, ptr %10, align 8
  %12 = getelementptr inbounds [3 x double], ptr %0, i64 0
  %13 = getelementptr inbounds [3 x double], ptr %12, i64 0, i64 1
  %14 = load double, ptr %13, align 8
  %15 = fmul double %11, %14
  %16 = call double @llvm.fmuladd.f64(double %5, double %8, double %15)
  %17 = getelementptr inbounds [3 x double], ptr %0, i64 0
  %18 = getelementptr inbounds [3 x double], ptr %17, i64 0, i64 2
  %19 = load double, ptr %18, align 8
  %20 = getelementptr inbounds [3 x double], ptr %0, i64 0
  %21 = getelementptr inbounds [3 x double], ptr %20, i64 0, i64 2
  %22 = load double, ptr %21, align 8
  %23 = call double @llvm.fmuladd.f64(double %19, double %22, double %16)
  %24 = call double @sqrt(double noundef %23) #5
  %25 = getelementptr inbounds double, ptr %1, i64 2
  store double %24, ptr %25, align 8
  %26 = getelementptr inbounds [3 x double], ptr %0, i64 0
  %27 = getelementptr inbounds [3 x double], ptr %26, i64 0, i64 1
  %28 = load double, ptr %27, align 8
  %29 = getelementptr inbounds [3 x double], ptr %0, i64 0
  %30 = getelementptr inbounds [3 x double], ptr %29, i64 0, i64 0
  %31 = load double, ptr %30, align 8
  %32 = call double @atan2(double noundef %28, double noundef %31) #5
  %33 = fmul double %32, 0x400E8EC8A4AEACC4
  %34 = getelementptr inbounds double, ptr %1, i64 0
  store double %33, ptr %34, align 8
  %35 = getelementptr inbounds double, ptr %1, i64 0
  %36 = load double, ptr %35, align 8
  %37 = fcmp olt double %36, 0.000000e+00
  br i1 %37, label %38, label %42

38:                                               ; preds = %2
  %39 = getelementptr inbounds double, ptr %1, i64 0
  %40 = load double, ptr %39, align 8
  %41 = fadd double %40, 2.400000e+01
  store double %41, ptr %39, align 8
  br label %42

42:                                               ; preds = %38, %2
  %43 = getelementptr inbounds [3 x double], ptr %0, i64 0
  %44 = getelementptr inbounds [3 x double], ptr %43, i64 0, i64 2
  %45 = load double, ptr %44, align 8
  %46 = getelementptr inbounds double, ptr %1, i64 2
  %47 = load double, ptr %46, align 8
  %48 = fdiv double %45, %47
  %49 = call double @asin(double noundef %48) #5
  %50 = fmul double %49, 0x404CA5DC1A63C1F8
  %51 = getelementptr inbounds double, ptr %1, i64 1
  store double %50, ptr %51, align 8
  ret void
}

; Function Attrs: nounwind
declare double @asin(double noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca [2 x double], align 16
  %4 = alloca [2 x [3 x double]], align 16
  %5 = alloca [8 x [3 x double]], align 16
  %6 = icmp sgt i32 %0, 1
  br i1 %6, label %7, label %16

7:                                                ; preds = %2, %14
  %.02 = phi i32 [ %15, %14 ], [ 1, %2 ]
  %8 = icmp slt i32 %.02, %0
  br i1 %8, label %9, label %16

9:                                                ; preds = %7
  %10 = getelementptr inbounds ptr, ptr %1, i64 1
  %11 = load ptr, ptr %10, align 8
  %12 = call i32 @strcmp(ptr noundef %11, ptr noundef @.str) #6
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %14, label %16

14:                                               ; preds = %9
  %15 = add nsw i32 %.02, 1
  br label %7, !llvm.loop !9

16:                                               ; preds = %7, %9, %2
  br label %17

17:                                               ; preds = %40, %16
  %.13 = phi i32 [ 0, %16 ], [ %41, %40 ]
  %18 = icmp slt i32 %.13, 20
  br i1 %18, label %19, label %42

19:                                               ; preds = %17
  %20 = getelementptr inbounds [2 x double], ptr %3, i64 0, i64 0
  store double 0x4142B42C80000000, ptr %20, align 16
  %21 = getelementptr inbounds [2 x double], ptr %3, i64 0, i64 1
  store double 0.000000e+00, ptr %21, align 8
  br label %22

22:                                               ; preds = %38, %19
  %.01 = phi i32 [ 0, %19 ], [ %39, %38 ]
  %23 = icmp slt i32 %.01, 36525
  br i1 %23, label %24, label %40

24:                                               ; preds = %22
  %25 = getelementptr inbounds [2 x double], ptr %3, i64 0, i64 0
  %26 = load double, ptr %25, align 16
  %27 = fadd double %26, 1.000000e+00
  store double %27, ptr %25, align 16
  br label %28

28:                                               ; preds = %30, %24
  %.0 = phi i32 [ 0, %24 ], [ %37, %30 ]
  %29 = icmp slt i32 %.0, 8
  br i1 %29, label %30, label %38

30:                                               ; preds = %28
  %31 = getelementptr inbounds [2 x double], ptr %3, i64 0, i64 0
  %32 = getelementptr inbounds [2 x [3 x double]], ptr %4, i64 0, i64 0
  call void @planetpv(ptr noundef %31, i32 noundef %.0, ptr noundef %32)
  %33 = getelementptr inbounds [2 x [3 x double]], ptr %4, i64 0, i64 0
  %34 = sext i32 %.0 to i64
  %35 = getelementptr inbounds [8 x [3 x double]], ptr %5, i64 0, i64 %34
  %36 = getelementptr inbounds [3 x double], ptr %35, i64 0, i64 0
  call void @radecdist(ptr noundef %33, ptr noundef %36)
  %37 = add nsw i32 %.0, 1
  br label %28, !llvm.loop !10

38:                                               ; preds = %28
  %39 = add nsw i32 %.01, 1
  br label %22, !llvm.loop !11

40:                                               ; preds = %22
  %41 = add nsw i32 %.13, 1
  br label %17, !llvm.loop !12

42:                                               ; preds = %17, %44
  %.1 = phi i32 [ %58, %44 ], [ 0, %17 ]
  %43 = icmp slt i32 %.1, 8
  br i1 %43, label %44, label %59

44:                                               ; preds = %42
  %45 = sext i32 %.1 to i64
  %46 = getelementptr inbounds [8 x [3 x double]], ptr %5, i64 0, i64 %45
  %47 = getelementptr inbounds [3 x double], ptr %46, i64 0, i64 0
  %48 = load double, ptr %47, align 8
  %49 = sext i32 %.1 to i64
  %50 = getelementptr inbounds [8 x [3 x double]], ptr %5, i64 0, i64 %49
  %51 = getelementptr inbounds [3 x double], ptr %50, i64 0, i64 1
  %52 = load double, ptr %51, align 8
  %53 = sext i32 %.1 to i64
  %54 = getelementptr inbounds [8 x [3 x double]], ptr %5, i64 0, i64 %53
  %55 = getelementptr inbounds [3 x double], ptr %54, i64 0, i64 2
  %56 = load double, ptr %55, align 8
  %57 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, double noundef %48, double noundef %52, double noundef %56)
  %58 = add nsw i32 %.1, 1
  br label %42, !llvm.loop !13

59:                                               ; preds = %42
  %60 = load ptr, ptr @stdout, align 8
  %61 = call i32 @fflush(ptr noundef %60)
  ret i32 0
}

; Function Attrs: nounwind readonly willreturn
declare i32 @strcmp(ptr noundef, ptr noundef) #3

declare i32 @printf(ptr noundef, ...) #4

declare i32 @fflush(ptr noundef) #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly willreturn }

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
