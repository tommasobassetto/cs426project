; ModuleID = 'mp5_testcases/almabench_c.ll'
source_filename = "mp5_testcases/almabench.c"
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
  %5 = fcmp olt double %0, 0.000000e+00
  %6 = select i1 %5, double 0xC01921FB54442D18, double 0x401921FB54442D18
  %7 = fsub double %2, %6
  %.0 = select i1 %4, double %7, double %2
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
  %15 = getelementptr inbounds [3 x double], ptr %12, i64 0, i64 1
  %16 = load double, ptr %15, align 8
  %17 = getelementptr inbounds [3 x double], ptr %12, i64 0, i64 2
  %18 = load double, ptr %17, align 8
  %19 = call double @llvm.fmuladd.f64(double %18, double %10, double %16)
  %20 = call double @llvm.fmuladd.f64(double %19, double %10, double %14)
  %21 = getelementptr inbounds [8 x [3 x double]], ptr @dlm, i64 0, i64 %11
  %22 = getelementptr inbounds [3 x double], ptr %21, i64 0, i64 0
  %23 = load double, ptr %22, align 8
  %24 = getelementptr inbounds [3 x double], ptr %21, i64 0, i64 1
  %25 = load double, ptr %24, align 8
  %26 = getelementptr inbounds [3 x double], ptr %21, i64 0, i64 2
  %27 = load double, ptr %26, align 8
  %28 = call double @llvm.fmuladd.f64(double %27, double %10, double %25)
  %29 = fmul double %28, %10
  %30 = call double @llvm.fmuladd.f64(double 3.600000e+03, double %23, double %29)
  %31 = fmul double %30, 0x3ED455A5B2FF8F9D
  %32 = getelementptr inbounds [8 x [3 x double]], ptr @e, i64 0, i64 %11
  %33 = getelementptr inbounds [3 x double], ptr %32, i64 0, i64 0
  %34 = load double, ptr %33, align 8
  %35 = getelementptr inbounds [3 x double], ptr %32, i64 0, i64 1
  %36 = load double, ptr %35, align 8
  %37 = getelementptr inbounds [3 x double], ptr %32, i64 0, i64 2
  %38 = load double, ptr %37, align 8
  %39 = call double @llvm.fmuladd.f64(double %38, double %10, double %36)
  %40 = call double @llvm.fmuladd.f64(double %39, double %10, double %34)
  %41 = getelementptr inbounds [8 x [3 x double]], ptr @pi, i64 0, i64 %11
  %42 = getelementptr inbounds [3 x double], ptr %41, i64 0, i64 0
  %43 = load double, ptr %42, align 8
  %44 = getelementptr inbounds [3 x double], ptr %41, i64 0, i64 1
  %45 = load double, ptr %44, align 8
  %46 = getelementptr inbounds [3 x double], ptr %41, i64 0, i64 2
  %47 = load double, ptr %46, align 8
  %48 = call double @llvm.fmuladd.f64(double %47, double %10, double %45)
  %49 = fmul double %48, %10
  %50 = call double @llvm.fmuladd.f64(double 3.600000e+03, double %43, double %49)
  %51 = fmul double %50, 0x3ED455A5B2FF8F9D
  %52 = call double @anpm(double noundef %51)
  %53 = getelementptr inbounds [8 x [3 x double]], ptr @dinc, i64 0, i64 %11
  %54 = getelementptr inbounds [3 x double], ptr %53, i64 0, i64 0
  %55 = load double, ptr %54, align 8
  %56 = getelementptr inbounds [3 x double], ptr %53, i64 0, i64 1
  %57 = load double, ptr %56, align 8
  %58 = getelementptr inbounds [3 x double], ptr %53, i64 0, i64 2
  %59 = load double, ptr %58, align 8
  %60 = call double @llvm.fmuladd.f64(double %59, double %10, double %57)
  %61 = fmul double %60, %10
  %62 = call double @llvm.fmuladd.f64(double 3.600000e+03, double %55, double %61)
  %63 = fmul double %62, 0x3ED455A5B2FF8F9D
  %64 = getelementptr inbounds [8 x [3 x double]], ptr @omega, i64 0, i64 %11
  %65 = getelementptr inbounds [3 x double], ptr %64, i64 0, i64 0
  %66 = load double, ptr %65, align 8
  %67 = getelementptr inbounds [3 x double], ptr %64, i64 0, i64 1
  %68 = load double, ptr %67, align 8
  %69 = getelementptr inbounds [3 x double], ptr %64, i64 0, i64 2
  %70 = load double, ptr %69, align 8
  %71 = call double @llvm.fmuladd.f64(double %70, double %10, double %68)
  %72 = fmul double %71, %10
  %73 = call double @llvm.fmuladd.f64(double 3.600000e+03, double %66, double %72)
  %74 = fmul double %73, 0x3ED455A5B2FF8F9D
  %75 = call double @anpm(double noundef %74)
  %76 = fmul double 0x3FD702A41F2E9970, %10
  br label %77

77:                                               ; preds = %79, %3
  %.03 = phi i32 [ 0, %3 ], [ %111, %79 ]
  %.02 = phi double [ %20, %3 ], [ %99, %79 ]
  %.01 = phi double [ %31, %3 ], [ %110, %79 ]
  %78 = icmp slt i32 %.03, 8
  br i1 %78, label %79, label %112

79:                                               ; preds = %77
  %80 = getelementptr inbounds [8 x [9 x double]], ptr @kp, i64 0, i64 %11
  %81 = sext i32 %.03 to i64
  %82 = getelementptr inbounds [9 x double], ptr %80, i64 0, i64 %81
  %83 = load double, ptr %82, align 8
  %84 = fmul double %83, %76
  %85 = getelementptr inbounds [8 x [10 x double]], ptr @kq, i64 0, i64 %11
  %86 = getelementptr inbounds [10 x double], ptr %85, i64 0, i64 %81
  %87 = load double, ptr %86, align 8
  %88 = fmul double %87, %76
  %89 = getelementptr inbounds [8 x [9 x double]], ptr @ca, i64 0, i64 %11
  %90 = getelementptr inbounds [9 x double], ptr %89, i64 0, i64 %81
  %91 = load double, ptr %90, align 8
  %92 = call double @cos(double noundef %84) #5
  %93 = getelementptr inbounds [8 x [9 x double]], ptr @sa, i64 0, i64 %11
  %94 = getelementptr inbounds [9 x double], ptr %93, i64 0, i64 %81
  %95 = load double, ptr %94, align 8
  %96 = call double @sin(double noundef %84) #5
  %97 = fmul double %95, %96
  %98 = call double @llvm.fmuladd.f64(double %91, double %92, double %97)
  %99 = call double @llvm.fmuladd.f64(double %98, double 0x3E7AD7F29ABCAF48, double %.02)
  %100 = getelementptr inbounds [8 x [10 x double]], ptr @cl, i64 0, i64 %11
  %101 = getelementptr inbounds [10 x double], ptr %100, i64 0, i64 %81
  %102 = load double, ptr %101, align 8
  %103 = call double @cos(double noundef %88) #5
  %104 = getelementptr inbounds [8 x [10 x double]], ptr @sl, i64 0, i64 %11
  %105 = getelementptr inbounds [10 x double], ptr %104, i64 0, i64 %81
  %106 = load double, ptr %105, align 8
  %107 = call double @sin(double noundef %88) #5
  %108 = fmul double %106, %107
  %109 = call double @llvm.fmuladd.f64(double %102, double %103, double %108)
  %110 = call double @llvm.fmuladd.f64(double %109, double 0x3E7AD7F29ABCAF48, double %.01)
  %111 = add nsw i32 %.03, 1
  br label %77, !llvm.loop !6

112:                                              ; preds = %77
  %113 = getelementptr inbounds [8 x [9 x double]], ptr @kp, i64 0, i64 %11
  %114 = getelementptr inbounds [9 x double], ptr %113, i64 0, i64 8
  %115 = load double, ptr %114, align 8
  %116 = fmul double %115, %76
  %117 = getelementptr inbounds [8 x [9 x double]], ptr @ca, i64 0, i64 %11
  %118 = getelementptr inbounds [9 x double], ptr %117, i64 0, i64 8
  %119 = load double, ptr %118, align 8
  %120 = call double @cos(double noundef %116) #5
  %121 = getelementptr inbounds [8 x [9 x double]], ptr @sa, i64 0, i64 %11
  %122 = getelementptr inbounds [9 x double], ptr %121, i64 0, i64 8
  %123 = load double, ptr %122, align 8
  %124 = call double @sin(double noundef %116) #5
  %125 = fmul double %123, %124
  %126 = call double @llvm.fmuladd.f64(double %119, double %120, double %125)
  %127 = fmul double %10, %126
  %128 = call double @llvm.fmuladd.f64(double %127, double 0x3E7AD7F29ABCAF48, double %.02)
  br label %129

129:                                              ; preds = %131, %112
  %.14 = phi i32 [ 8, %112 ], [ %149, %131 ]
  %.1 = phi double [ %.01, %112 ], [ %148, %131 ]
  %130 = icmp sle i32 %.14, 9
  br i1 %130, label %131, label %150

131:                                              ; preds = %129
  %132 = getelementptr inbounds [8 x [10 x double]], ptr @kq, i64 0, i64 %11
  %133 = sext i32 %.14 to i64
  %134 = getelementptr inbounds [10 x double], ptr %132, i64 0, i64 %133
  %135 = load double, ptr %134, align 8
  %136 = fmul double %135, %76
  %137 = getelementptr inbounds [8 x [10 x double]], ptr @cl, i64 0, i64 %11
  %138 = getelementptr inbounds [10 x double], ptr %137, i64 0, i64 %133
  %139 = load double, ptr %138, align 8
  %140 = call double @cos(double noundef %136) #5
  %141 = getelementptr inbounds [8 x [10 x double]], ptr @sl, i64 0, i64 %11
  %142 = getelementptr inbounds [10 x double], ptr %141, i64 0, i64 %133
  %143 = load double, ptr %142, align 8
  %144 = call double @sin(double noundef %136) #5
  %145 = fmul double %143, %144
  %146 = call double @llvm.fmuladd.f64(double %139, double %140, double %145)
  %147 = fmul double %10, %146
  %148 = call double @llvm.fmuladd.f64(double %147, double 0x3E7AD7F29ABCAF48, double %.1)
  %149 = add nsw i32 %.14, 1
  br label %129, !llvm.loop !8

150:                                              ; preds = %129
  %151 = call double @fmod(double noundef %.1, double noundef 0x401921FB54442D18) #5
  %152 = fsub double %151, %52
  %153 = call double @sin(double noundef %152) #5
  %154 = call double @llvm.fmuladd.f64(double %40, double %153, double %152)
  br label %155

155:                                              ; preds = %155, %150
  %.2 = phi i32 [ 0, %150 ], [ %164, %155 ]
  %.0 = phi double [ %154, %150 ], [ %163, %155 ]
  %156 = fsub double %152, %.0
  %157 = call double @sin(double noundef %.0) #5
  %158 = call double @llvm.fmuladd.f64(double %40, double %157, double %156)
  %159 = call double @cos(double noundef %.0) #5
  %160 = fneg double %40
  %161 = call double @llvm.fmuladd.f64(double %160, double %159, double 1.000000e+00)
  %162 = fdiv double %158, %161
  %163 = fadd double %.0, %162
  %164 = add nsw i32 %.2, 1
  %165 = icmp sge i32 %164, 10
  %166 = call double @llvm.fabs.f64(double %162)
  %167 = fcmp olt double %166, 0x3D719799812DEA11
  %or.cond = select i1 %165, i1 true, i1 %167
  br i1 %or.cond, label %168, label %155

168:                                              ; preds = %155
  %169 = fdiv double %163, 2.000000e+00
  %170 = fadd double 1.000000e+00, %40
  %171 = fsub double 1.000000e+00, %40
  %172 = fdiv double %170, %171
  %173 = call double @sqrt(double noundef %172) #5
  %174 = call double @sin(double noundef %169) #5
  %175 = fmul double %173, %174
  %176 = call double @cos(double noundef %169) #5
  %177 = call double @atan2(double noundef %175, double noundef %176) #5
  %178 = fmul double 2.000000e+00, %177
  %179 = call double @cos(double noundef %163) #5
  %180 = call double @llvm.fmuladd.f64(double %160, double %179, double 1.000000e+00)
  %181 = fmul double %128, %180
  %182 = getelementptr inbounds [8 x double], ptr @amas, i64 0, i64 %11
  %183 = load double, ptr %182, align 8
  %184 = fdiv double 1.000000e+00, %183
  %185 = fadd double 1.000000e+00, %184
  %186 = fmul double %128, %128
  %187 = fmul double %186, %128
  %188 = fdiv double %185, %187
  %189 = call double @sqrt(double noundef %188) #5
  %190 = fmul double 0x3F919D6D51A6B69A, %189
  %191 = fdiv double %63, 2.000000e+00
  %192 = call double @sin(double noundef %191) #5
  %193 = call double @cos(double noundef %75) #5
  %194 = fmul double %192, %193
  %195 = call double @sin(double noundef %75) #5
  %196 = fmul double %192, %195
  %197 = fadd double %178, %52
  %198 = call double @sin(double noundef %197) #5
  %199 = call double @cos(double noundef %197) #5
  %200 = fmul double %194, %198
  %201 = fneg double %200
  %202 = call double @llvm.fmuladd.f64(double %196, double %199, double %201)
  %203 = fmul double 2.000000e+00, %202
  %204 = call double @llvm.fmuladd.f64(double %160, double %40, double 1.000000e+00)
  %205 = call double @sqrt(double noundef %204) #5
  %206 = fdiv double %128, %205
  %207 = call double @cos(double noundef %191) #5
  %208 = call double @sin(double noundef %52) #5
  %209 = call double @llvm.fmuladd.f64(double %40, double %208, double %198)
  %210 = fmul double %209, %206
  %211 = call double @cos(double noundef %52) #5
  %212 = call double @llvm.fmuladd.f64(double %40, double %211, double %199)
  %213 = fmul double %212, %206
  %214 = fmul double 2.000000e+00, %196
  %215 = fmul double %214, %194
  %216 = fneg double %203
  %217 = call double @llvm.fmuladd.f64(double %216, double %196, double %199)
  %218 = fmul double %181, %217
  %219 = call double @llvm.fmuladd.f64(double %203, double %194, double %198)
  %220 = fmul double %181, %219
  %221 = fmul double %216, %207
  %222 = fmul double %181, %221
  %223 = getelementptr inbounds [3 x double], ptr %2, i64 0
  %224 = getelementptr inbounds [3 x double], ptr %223, i64 0, i64 0
  store double %218, ptr %224, align 8
  %225 = fmul double %222, 0x3FD9752E50F4B399
  %226 = fneg double %225
  %227 = call double @llvm.fmuladd.f64(double %220, double 0x3FED5C0357681EF3, double %226)
  %228 = getelementptr inbounds [3 x double], ptr %223, i64 0, i64 1
  store double %227, ptr %228, align 8
  %229 = fmul double %222, 0x3FED5C0357681EF3
  %230 = call double @llvm.fmuladd.f64(double %220, double 0x3FD9752E50F4B399, double %229)
  %231 = getelementptr inbounds [3 x double], ptr %223, i64 0, i64 2
  store double %230, ptr %231, align 8
  %232 = call double @llvm.fmuladd.f64(double %214, double %196, double -1.000000e+00)
  %233 = fmul double %215, %213
  %234 = call double @llvm.fmuladd.f64(double %232, double %210, double %233)
  %235 = fmul double %190, %234
  %236 = fmul double 2.000000e+00, %194
  %237 = fneg double %236
  %238 = call double @llvm.fmuladd.f64(double %237, double %194, double 1.000000e+00)
  %239 = fmul double %215, %210
  %240 = fneg double %239
  %241 = call double @llvm.fmuladd.f64(double %238, double %213, double %240)
  %242 = fmul double %190, %241
  %243 = fmul double 2.000000e+00, %207
  %244 = fmul double %194, %213
  %245 = call double @llvm.fmuladd.f64(double %196, double %210, double %244)
  %246 = fmul double %243, %245
  %247 = fmul double %190, %246
  %248 = getelementptr inbounds [3 x double], ptr %2, i64 1
  %249 = getelementptr inbounds [3 x double], ptr %248, i64 0, i64 0
  store double %235, ptr %249, align 8
  %250 = fmul double %247, 0x3FD9752E50F4B399
  %251 = fneg double %250
  %252 = call double @llvm.fmuladd.f64(double %242, double 0x3FED5C0357681EF3, double %251)
  %253 = getelementptr inbounds [3 x double], ptr %248, i64 0, i64 1
  store double %252, ptr %253, align 8
  %254 = fmul double %247, 0x3FED5C0357681EF3
  %255 = call double @llvm.fmuladd.f64(double %242, double 0x3FD9752E50F4B399, double %254)
  %256 = getelementptr inbounds [3 x double], ptr %248, i64 0, i64 2
  store double %255, ptr %256, align 8
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
  %6 = load double, ptr %4, align 8
  %7 = getelementptr inbounds [3 x double], ptr %3, i64 0, i64 1
  %8 = load double, ptr %7, align 8
  %9 = load double, ptr %7, align 8
  %10 = fmul double %8, %9
  %11 = call double @llvm.fmuladd.f64(double %5, double %6, double %10)
  %12 = getelementptr inbounds [3 x double], ptr %3, i64 0, i64 2
  %13 = load double, ptr %12, align 8
  %14 = load double, ptr %12, align 8
  %15 = call double @llvm.fmuladd.f64(double %13, double %14, double %11)
  %16 = call double @sqrt(double noundef %15) #5
  %17 = getelementptr inbounds double, ptr %1, i64 2
  store double %16, ptr %17, align 8
  %18 = load double, ptr %7, align 8
  %19 = load double, ptr %4, align 8
  %20 = call double @atan2(double noundef %18, double noundef %19) #5
  %21 = fmul double %20, 0x400E8EC8A4AEACC4
  %22 = getelementptr inbounds double, ptr %1, i64 0
  store double %21, ptr %22, align 8
  %23 = load double, ptr %22, align 8
  %24 = fcmp olt double %23, 0.000000e+00
  br i1 %24, label %25, label %28

25:                                               ; preds = %2
  %26 = load double, ptr %22, align 8
  %27 = fadd double %26, 2.400000e+01
  store double %27, ptr %22, align 8
  br label %28

28:                                               ; preds = %25, %2
  %29 = load double, ptr %12, align 8
  %30 = load double, ptr %17, align 8
  %31 = fdiv double %29, %30
  %32 = call double @asin(double noundef %31) #5
  %33 = fmul double %32, 0x404CA5DC1A63C1F8
  %34 = getelementptr inbounds double, ptr %1, i64 1
  store double %33, ptr %34, align 8
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
  br i1 %6, label %7, label %.loopexit

7:                                                ; preds = %2, %14
  %.02 = phi i32 [ %15, %14 ], [ 1, %2 ]
  %8 = icmp slt i32 %.02, %0
  br i1 %8, label %9, label %.loopexit

9:                                                ; preds = %7
  %10 = getelementptr inbounds ptr, ptr %1, i64 1
  %11 = load ptr, ptr %10, align 8
  %12 = call i32 @strcmp(ptr noundef %11, ptr noundef @.str) #6
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %14, label %.loopexit

14:                                               ; preds = %9
  %15 = add nsw i32 %.02, 1
  br label %7, !llvm.loop !9

.loopexit:                                        ; preds = %9, %7, %2
  br label %16

16:                                               ; preds = %36, %.loopexit
  %.13 = phi i32 [ 0, %.loopexit ], [ %37, %36 ]
  %17 = icmp slt i32 %.13, 20
  br i1 %17, label %18, label %38

18:                                               ; preds = %16
  %19 = getelementptr inbounds [2 x double], ptr %3, i64 0, i64 0
  store double 0x4142B42C80000000, ptr %19, align 16
  %20 = getelementptr inbounds [2 x double], ptr %3, i64 0, i64 1
  store double 0.000000e+00, ptr %20, align 8
  br label %21

21:                                               ; preds = %34, %18
  %.01 = phi i32 [ 0, %18 ], [ %35, %34 ]
  %22 = icmp slt i32 %.01, 36525
  br i1 %22, label %23, label %36

23:                                               ; preds = %21
  %24 = load double, ptr %19, align 16
  %25 = fadd double %24, 1.000000e+00
  store double %25, ptr %19, align 16
  br label %26

26:                                               ; preds = %28, %23
  %.0 = phi i32 [ 0, %23 ], [ %33, %28 ]
  %27 = icmp slt i32 %.0, 8
  br i1 %27, label %28, label %34

28:                                               ; preds = %26
  %29 = getelementptr inbounds [2 x [3 x double]], ptr %4, i64 0, i64 0
  call void @planetpv(ptr noundef %19, i32 noundef %.0, ptr noundef %29)
  %30 = sext i32 %.0 to i64
  %31 = getelementptr inbounds [8 x [3 x double]], ptr %5, i64 0, i64 %30
  %32 = getelementptr inbounds [3 x double], ptr %31, i64 0, i64 0
  call void @radecdist(ptr noundef %29, ptr noundef %32)
  %33 = add nsw i32 %.0, 1
  br label %26, !llvm.loop !10

34:                                               ; preds = %26
  %35 = add nsw i32 %.01, 1
  br label %21, !llvm.loop !11

36:                                               ; preds = %21
  %37 = add nsw i32 %.13, 1
  br label %16, !llvm.loop !12

38:                                               ; preds = %16, %40
  %.1 = phi i32 [ %50, %40 ], [ 0, %16 ]
  %39 = icmp slt i32 %.1, 8
  br i1 %39, label %40, label %51

40:                                               ; preds = %38
  %41 = sext i32 %.1 to i64
  %42 = getelementptr inbounds [8 x [3 x double]], ptr %5, i64 0, i64 %41
  %43 = getelementptr inbounds [3 x double], ptr %42, i64 0, i64 0
  %44 = load double, ptr %43, align 8
  %45 = getelementptr inbounds [3 x double], ptr %42, i64 0, i64 1
  %46 = load double, ptr %45, align 8
  %47 = getelementptr inbounds [3 x double], ptr %42, i64 0, i64 2
  %48 = load double, ptr %47, align 8
  %49 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, double noundef %44, double noundef %46, double noundef %48)
  %50 = add nsw i32 %.1, 1
  br label %38, !llvm.loop !13

51:                                               ; preds = %38
  %52 = load ptr, ptr @stdout, align 8
  %53 = call i32 @fflush(ptr noundef %52)
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
