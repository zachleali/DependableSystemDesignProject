; ModuleID = 'blackscholes.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.OptionData_ = type { float, float, float, float, float, float, i8, float, float }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@numError = global i32 0, align 4
@numOptions = common global i32 0, align 4
@nThreads = common global i32 0, align 4
@sptprice = common global float* null, align 8
@strike = common global float* null, align 8
@rate = common global float* null, align 8
@volatility = common global float* null, align 8
@otime = common global float* null, align 8
@otype = common global i32* null, align 8
@prices = common global float* null, align 8
@.str = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str1 = private unnamed_addr constant [34 x i8] c"ERROR: Unable to open file `%s'.\0A\00", align 1
@.str2 = private unnamed_addr constant [3 x i8] c"%i\00", align 1
@.str3 = private unnamed_addr constant [39 x i8] c"ERROR: Unable to read from file `%s'.\0A\00", align 1
@.str4 = private unnamed_addr constant [82 x i8] c"WARNING: Not enough work, reducing number of threads to match number of options.\0A\00", align 1
@.str5 = private unnamed_addr constant [46 x i8] c"Error: <nthreads> must be 1 (serial version)\0A\00", align 1
@data = common global %struct.OptionData_* null, align 8
@.str6 = private unnamed_addr constant [27 x i8] c"%f %f %f %f %f %f %c %f %f\00", align 1
@.str7 = private unnamed_addr constant [35 x i8] c"ERROR: Unable to close file `%s'.\0A\00", align 1
@.str8 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str9 = private unnamed_addr constant [4 x i8] c"%i\0A\00", align 1
@.str10 = private unnamed_addr constant [7 x i8] c"%.18f\0A\00", align 1

; Function Attrs: nounwind uwtable
define float @CNDF(float %InputX) #0 {
  %1 = alloca float, align 4
  %sign = alloca i32, align 4
  %OutputX = alloca float, align 4
  %xInput = alloca float, align 4
  %xNPrimeofX = alloca float, align 4
  %expValues = alloca float, align 4
  %xK2 = alloca float, align 4
  %xK2_2 = alloca float, align 4
  %xK2_3 = alloca float, align 4
  %xK2_4 = alloca float, align 4
  %xK2_5 = alloca float, align 4
  %xLocal = alloca float, align 4
  %xLocal_1 = alloca float, align 4
  %xLocal_2 = alloca float, align 4
  %xLocal_3 = alloca float, align 4
  store float %InputX, float* %1, align 4
  %2 = load float* %1, align 4
  %3 = fpext float %2 to double
  %4 = fcmp olt double %3, 0.000000e+00
  br i1 %4, label %5, label %8

; <label>:5                                       ; preds = %0
  %6 = load float* %1, align 4
  %7 = fsub float -0.000000e+00, %6
  store float %7, float* %1, align 4
  store i32 1, i32* %sign, align 4
  br label %9

; <label>:8                                       ; preds = %0
  store i32 0, i32* %sign, align 4
  br label %9

; <label>:9                                       ; preds = %8, %5
  %10 = load float* %1, align 4
  store float %10, float* %xInput, align 4
  %11 = load float* %1, align 4
  %12 = fmul float -5.000000e-01, %11
  %13 = load float* %1, align 4
  %14 = fmul float %12, %13
  %15 = fpext float %14 to double
  %16 = call double @exp(double %15) #5
  %17 = fptrunc double %16 to float
  store float %17, float* %expValues, align 4
  %18 = load float* %expValues, align 4
  store float %18, float* %xNPrimeofX, align 4
  %19 = load float* %xNPrimeofX, align 4
  %20 = fpext float %19 to double
  %21 = fmul double %20, 0x3FD9884533D43651
  %22 = fptrunc double %21 to float
  store float %22, float* %xNPrimeofX, align 4
  %23 = load float* %xInput, align 4
  %24 = fpext float %23 to double
  %25 = fmul double 2.316419e-01, %24
  %26 = fptrunc double %25 to float
  store float %26, float* %xK2, align 4
  %27 = load float* %xK2, align 4
  %28 = fpext float %27 to double
  %29 = fadd double 1.000000e+00, %28
  %30 = fptrunc double %29 to float
  store float %30, float* %xK2, align 4
  %31 = load float* %xK2, align 4
  %32 = fpext float %31 to double
  %33 = fdiv double 1.000000e+00, %32
  %34 = fptrunc double %33 to float
  store float %34, float* %xK2, align 4
  %35 = load float* %xK2, align 4
  %36 = load float* %xK2, align 4
  %37 = fmul float %35, %36
  store float %37, float* %xK2_2, align 4
  %38 = load float* %xK2_2, align 4
  %39 = load float* %xK2, align 4
  %40 = fmul float %38, %39
  store float %40, float* %xK2_3, align 4
  %41 = load float* %xK2_3, align 4
  %42 = load float* %xK2, align 4
  %43 = fmul float %41, %42
  store float %43, float* %xK2_4, align 4
  %44 = load float* %xK2_4, align 4
  %45 = load float* %xK2, align 4
  %46 = fmul float %44, %45
  store float %46, float* %xK2_5, align 4
  %47 = load float* %xK2, align 4
  %48 = fpext float %47 to double
  %49 = fmul double %48, 0x3FD470BF3A92F8EC
  %50 = fptrunc double %49 to float
  store float %50, float* %xLocal_1, align 4
  %51 = load float* %xK2_2, align 4
  %52 = fpext float %51 to double
  %53 = fmul double %52, 0xBFD6D1F0E5A8325B
  %54 = fptrunc double %53 to float
  store float %54, float* %xLocal_2, align 4
  %55 = load float* %xK2_3, align 4
  %56 = fpext float %55 to double
  %57 = fmul double %56, 0x3FFC80EF025F5E68
  %58 = fptrunc double %57 to float
  store float %58, float* %xLocal_3, align 4
  %59 = load float* %xLocal_2, align 4
  %60 = load float* %xLocal_3, align 4
  %61 = fadd float %59, %60
  store float %61, float* %xLocal_2, align 4
  %62 = load float* %xK2_4, align 4
  %63 = fpext float %62 to double
  %64 = fmul double %63, 0xBFFD23DD4EF278D0
  %65 = fptrunc double %64 to float
  store float %65, float* %xLocal_3, align 4
  %66 = load float* %xLocal_2, align 4
  %67 = load float* %xLocal_3, align 4
  %68 = fadd float %66, %67
  store float %68, float* %xLocal_2, align 4
  %69 = load float* %xK2_5, align 4
  %70 = fpext float %69 to double
  %71 = fmul double %70, 0x3FF548CDD6F42943
  %72 = fptrunc double %71 to float
  store float %72, float* %xLocal_3, align 4
  %73 = load float* %xLocal_2, align 4
  %74 = load float* %xLocal_3, align 4
  %75 = fadd float %73, %74
  store float %75, float* %xLocal_2, align 4
  %76 = load float* %xLocal_2, align 4
  %77 = load float* %xLocal_1, align 4
  %78 = fadd float %76, %77
  store float %78, float* %xLocal_1, align 4
  %79 = load float* %xLocal_1, align 4
  %80 = load float* %xNPrimeofX, align 4
  %81 = fmul float %79, %80
  store float %81, float* %xLocal, align 4
  %82 = load float* %xLocal, align 4
  %83 = fpext float %82 to double
  %84 = fsub double 1.000000e+00, %83
  %85 = fptrunc double %84 to float
  store float %85, float* %xLocal, align 4
  %86 = load float* %xLocal, align 4
  store float %86, float* %OutputX, align 4
  %87 = load i32* %sign, align 4
  %88 = icmp ne i32 %87, 0
  br i1 %88, label %89, label %94

; <label>:89                                      ; preds = %9
  %90 = load float* %OutputX, align 4
  %91 = fpext float %90 to double
  %92 = fsub double 1.000000e+00, %91
  %93 = fptrunc double %92 to float
  store float %93, float* %OutputX, align 4
  br label %94

; <label>:94                                      ; preds = %89, %9
  %95 = load float* %OutputX, align 4
  ret float %95
}

; Function Attrs: nounwind
declare double @exp(double) #1

; Function Attrs: nounwind uwtable
define float @BlkSchlsEqEuroNoDiv(float %sptprice, float %strike, float %rate, float %volatility, float %time, i32 %otype, float %timet) #0 {
  %1 = alloca float, align 4
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  %5 = alloca float, align 4
  %6 = alloca i32, align 4
  %7 = alloca float, align 4
  %OptionPrice = alloca float, align 4
  %xStockPrice = alloca float, align 4
  %xStrikePrice = alloca float, align 4
  %xRiskFreeRate = alloca float, align 4
  %xVolatility = alloca float, align 4
  %xTime = alloca float, align 4
  %xSqrtTime = alloca float, align 4
  %logValues = alloca float, align 4
  %xLogTerm = alloca float, align 4
  %xD1 = alloca float, align 4
  %xD2 = alloca float, align 4
  %xPowerTerm = alloca float, align 4
  %xDen = alloca float, align 4
  %d1 = alloca float, align 4
  %d2 = alloca float, align 4
  %FutureValueX = alloca float, align 4
  %NofXd1 = alloca float, align 4
  %NofXd2 = alloca float, align 4
  %NegNofXd1 = alloca float, align 4
  %NegNofXd2 = alloca float, align 4
  store float %sptprice, float* %1, align 4
  store float %strike, float* %2, align 4
  store float %rate, float* %3, align 4
  store float %volatility, float* %4, align 4
  store float %time, float* %5, align 4
  store i32 %otype, i32* %6, align 4
  store float %timet, float* %7, align 4
  %8 = load float* %1, align 4
  store float %8, float* %xStockPrice, align 4
  %9 = load float* %2, align 4
  store float %9, float* %xStrikePrice, align 4
  %10 = load float* %3, align 4
  store float %10, float* %xRiskFreeRate, align 4
  %11 = load float* %4, align 4
  store float %11, float* %xVolatility, align 4
  %12 = load float* %5, align 4
  store float %12, float* %xTime, align 4
  %13 = load float* %xTime, align 4
  %14 = fpext float %13 to double
  %15 = call double @sqrt(double %14) #5
  %16 = fptrunc double %15 to float
  store float %16, float* %xSqrtTime, align 4
  %17 = load float* %1, align 4
  %18 = load float* %2, align 4
  %19 = fdiv float %17, %18
  %20 = fpext float %19 to double
  %21 = call double @log(double %20) #5
  %22 = fptrunc double %21 to float
  store float %22, float* %logValues, align 4
  %23 = load float* %logValues, align 4
  store float %23, float* %xLogTerm, align 4
  %24 = load float* %xVolatility, align 4
  %25 = load float* %xVolatility, align 4
  %26 = fmul float %24, %25
  store float %26, float* %xPowerTerm, align 4
  %27 = load float* %xPowerTerm, align 4
  %28 = fpext float %27 to double
  %29 = fmul double %28, 5.000000e-01
  %30 = fptrunc double %29 to float
  store float %30, float* %xPowerTerm, align 4
  %31 = load float* %xRiskFreeRate, align 4
  %32 = load float* %xPowerTerm, align 4
  %33 = fadd float %31, %32
  store float %33, float* %xD1, align 4
  %34 = load float* %xD1, align 4
  %35 = load float* %xTime, align 4
  %36 = fmul float %34, %35
  store float %36, float* %xD1, align 4
  %37 = load float* %xD1, align 4
  %38 = load float* %xLogTerm, align 4
  %39 = fadd float %37, %38
  store float %39, float* %xD1, align 4
  %40 = load float* %xVolatility, align 4
  %41 = load float* %xSqrtTime, align 4
  %42 = fmul float %40, %41
  store float %42, float* %xDen, align 4
  %43 = load float* %xD1, align 4
  %44 = load float* %xDen, align 4
  %45 = fdiv float %43, %44
  store float %45, float* %xD1, align 4
  %46 = load float* %xD1, align 4
  %47 = load float* %xDen, align 4
  %48 = fsub float %46, %47
  store float %48, float* %xD2, align 4
  %49 = load float* %xD1, align 4
  store float %49, float* %d1, align 4
  %50 = load float* %xD2, align 4
  store float %50, float* %d2, align 4
  %51 = load float* %d1, align 4
  %52 = call float @CNDF(float %51)
  store float %52, float* %NofXd1, align 4
  %53 = load float* %d2, align 4
  %54 = call float @CNDF(float %53)
  store float %54, float* %NofXd2, align 4
  %55 = load float* %2, align 4
  %56 = fpext float %55 to double
  %57 = load float* %3, align 4
  %58 = fsub float -0.000000e+00, %57
  %59 = load float* %5, align 4
  %60 = fmul float %58, %59
  %61 = fpext float %60 to double
  %62 = call double @exp(double %61) #5
  %63 = fmul double %56, %62
  %64 = fptrunc double %63 to float
  store float %64, float* %FutureValueX, align 4
  %65 = load i32* %6, align 4
  %66 = icmp eq i32 %65, 0
  br i1 %66, label %67, label %75

; <label>:67                                      ; preds = %0
  %68 = load float* %1, align 4
  %69 = load float* %NofXd1, align 4
  %70 = fmul float %68, %69
  %71 = load float* %FutureValueX, align 4
  %72 = load float* %NofXd2, align 4
  %73 = fmul float %71, %72
  %74 = fsub float %70, %73
  store float %74, float* %OptionPrice, align 4
  br label %91

; <label>:75                                      ; preds = %0
  %76 = load float* %NofXd1, align 4
  %77 = fpext float %76 to double
  %78 = fsub double 1.000000e+00, %77
  %79 = fptrunc double %78 to float
  store float %79, float* %NegNofXd1, align 4
  %80 = load float* %NofXd2, align 4
  %81 = fpext float %80 to double
  %82 = fsub double 1.000000e+00, %81
  %83 = fptrunc double %82 to float
  store float %83, float* %NegNofXd2, align 4
  %84 = load float* %FutureValueX, align 4
  %85 = load float* %NegNofXd2, align 4
  %86 = fmul float %84, %85
  %87 = load float* %1, align 4
  %88 = load float* %NegNofXd1, align 4
  %89 = fmul float %87, %88
  %90 = fsub float %86, %89
  store float %90, float* %OptionPrice, align 4
  br label %91

; <label>:91                                      ; preds = %75, %67
  %92 = load float* %OptionPrice, align 4
  ret float %92
}

; Function Attrs: nounwind
declare double @sqrt(double) #1

; Function Attrs: nounwind
declare double @log(double) #1

; Function Attrs: nounwind uwtable
define i32 @bs_thread(i8* %tid_ptr) #0 {
  %1 = alloca i8*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %price = alloca float, align 4
  %priceDelta = alloca float, align 4
  %tid = alloca i32, align 4
  %start = alloca i32, align 4
  %end = alloca i32, align 4
  store i8* %tid_ptr, i8** %1, align 8
  %2 = load i8** %1, align 8
  %3 = bitcast i8* %2 to i32*
  %4 = load i32* %3, align 4
  store i32 %4, i32* %tid, align 4
  %5 = load i32* %tid, align 4
  %6 = load i32* @numOptions, align 4
  %7 = load i32* @nThreads, align 4
  %8 = sdiv i32 %6, %7
  %9 = mul nsw i32 %5, %8
  store i32 %9, i32* %start, align 4
  %10 = load i32* %start, align 4
  %11 = load i32* @numOptions, align 4
  %12 = load i32* @nThreads, align 4
  %13 = sdiv i32 %11, %12
  %14 = add nsw i32 %10, %13
  store i32 %14, i32* %end, align 4
  store i32 0, i32* %j, align 4
  br label %15

; <label>:15                                      ; preds = %65, %0
  %16 = load i32* %j, align 4
  %17 = icmp slt i32 %16, 100
  br i1 %17, label %18, label %68

; <label>:18                                      ; preds = %15
  %19 = load i32* %start, align 4
  store i32 %19, i32* %i, align 4
  br label %20

; <label>:20                                      ; preds = %61, %18
  %21 = load i32* %i, align 4
  %22 = load i32* %end, align 4
  %23 = icmp slt i32 %21, %22
  br i1 %23, label %24, label %64

; <label>:24                                      ; preds = %20
  %25 = load i32* %i, align 4
  %26 = sext i32 %25 to i64
  %27 = load float** @sptprice, align 8
  %28 = getelementptr inbounds float* %27, i64 %26
  %29 = load float* %28, align 4
  %30 = load i32* %i, align 4
  %31 = sext i32 %30 to i64
  %32 = load float** @strike, align 8
  %33 = getelementptr inbounds float* %32, i64 %31
  %34 = load float* %33, align 4
  %35 = load i32* %i, align 4
  %36 = sext i32 %35 to i64
  %37 = load float** @rate, align 8
  %38 = getelementptr inbounds float* %37, i64 %36
  %39 = load float* %38, align 4
  %40 = load i32* %i, align 4
  %41 = sext i32 %40 to i64
  %42 = load float** @volatility, align 8
  %43 = getelementptr inbounds float* %42, i64 %41
  %44 = load float* %43, align 4
  %45 = load i32* %i, align 4
  %46 = sext i32 %45 to i64
  %47 = load float** @otime, align 8
  %48 = getelementptr inbounds float* %47, i64 %46
  %49 = load float* %48, align 4
  %50 = load i32* %i, align 4
  %51 = sext i32 %50 to i64
  %52 = load i32** @otype, align 8
  %53 = getelementptr inbounds i32* %52, i64 %51
  %54 = load i32* %53, align 4
  %55 = call float @BlkSchlsEqEuroNoDiv(float %29, float %34, float %39, float %44, float %49, i32 %54, float 0.000000e+00)
  store float %55, float* %price, align 4
  %56 = load float* %price, align 4
  %57 = load i32* %i, align 4
  %58 = sext i32 %57 to i64
  %59 = load float** @prices, align 8
  %60 = getelementptr inbounds float* %59, i64 %58
  store float %56, float* %60, align 4
  br label %61

; <label>:61                                      ; preds = %24
  %62 = load i32* %i, align 4
  %63 = add nsw i32 %62, 1
  store i32 %63, i32* %i, align 4
  br label %20

; <label>:64                                      ; preds = %20
  br label %65

; <label>:65                                      ; preds = %64
  %66 = load i32* %j, align 4
  %67 = add nsw i32 %66, 1
  store i32 %67, i32* %j, align 4
  br label %15

; <label>:68                                      ; preds = %15
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %file = alloca %struct._IO_FILE*, align 8
  %i = alloca i32, align 4
  %loopnum = alloca i32, align 4
  %buffer = alloca float*, align 8
  %buffer2 = alloca i32*, align 8
  %rv = alloca i32, align 4
  %inputFile = alloca i8*, align 8
  %outputFile = alloca i8*, align 8
  %tid = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @fflush(%struct._IO_FILE* null)
  %5 = load i32* %2, align 4
  %6 = icmp ne i32 %5, 4
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  call void @exit(i32 1) #6
  unreachable

; <label>:8                                       ; preds = %0
  %9 = load i8*** %3, align 8
  %10 = getelementptr inbounds i8** %9, i64 1
  %11 = load i8** %10, align 8
  %12 = call i32 @atoi(i8* %11) #7
  store i32 %12, i32* @nThreads, align 4
  %13 = load i8*** %3, align 8
  %14 = getelementptr inbounds i8** %13, i64 2
  %15 = load i8** %14, align 8
  store i8* %15, i8** %inputFile, align 8
  %16 = load i8*** %3, align 8
  %17 = getelementptr inbounds i8** %16, i64 3
  %18 = load i8** %17, align 8
  store i8* %18, i8** %outputFile, align 8
  %19 = load i8** %inputFile, align 8
  %20 = call %struct._IO_FILE* @fopen(i8* %19, i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0))
  store %struct._IO_FILE* %20, %struct._IO_FILE** %file, align 8
  %21 = load %struct._IO_FILE** %file, align 8
  %22 = icmp eq %struct._IO_FILE* %21, null
  br i1 %22, label %23, label %26

; <label>:23                                      ; preds = %8
  %24 = load i8** %inputFile, align 8
  %25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([34 x i8]* @.str1, i32 0, i32 0), i8* %24)
  call void @exit(i32 1) #6
  unreachable

; <label>:26                                      ; preds = %8
  %27 = load %struct._IO_FILE** %file, align 8
  %28 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([3 x i8]* @.str2, i32 0, i32 0), i32* @numOptions)
  store i32 %28, i32* %rv, align 4
  %29 = load i32* %rv, align 4
  %30 = icmp ne i32 %29, 1
  br i1 %30, label %31, label %36

; <label>:31                                      ; preds = %26
  %32 = load i8** %inputFile, align 8
  %33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str3, i32 0, i32 0), i8* %32)
  %34 = load %struct._IO_FILE** %file, align 8
  %35 = call i32 @fclose(%struct._IO_FILE* %34)
  call void @exit(i32 1) #6
  unreachable

; <label>:36                                      ; preds = %26
  %37 = load i32* @nThreads, align 4
  %38 = load i32* @numOptions, align 4
  %39 = icmp sgt i32 %37, %38
  br i1 %39, label %40, label %43

; <label>:40                                      ; preds = %36
  %41 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([82 x i8]* @.str4, i32 0, i32 0))
  %42 = load i32* @numOptions, align 4
  store i32 %42, i32* @nThreads, align 4
  br label %43

; <label>:43                                      ; preds = %40, %36
  %44 = load i32* @nThreads, align 4
  %45 = icmp ne i32 %44, 1
  br i1 %45, label %46, label %48

; <label>:46                                      ; preds = %43
  %47 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([46 x i8]* @.str5, i32 0, i32 0))
  call void @exit(i32 1) #6
  unreachable

; <label>:48                                      ; preds = %43
  %49 = load i32* @numOptions, align 4
  %50 = sext i32 %49 to i64
  %51 = mul i64 %50, 36
  %52 = call noalias i8* @malloc(i64 %51) #5
  %53 = bitcast i8* %52 to %struct.OptionData_*
  store %struct.OptionData_* %53, %struct.OptionData_** @data, align 8
  %54 = load i32* @numOptions, align 4
  %55 = sext i32 %54 to i64
  %56 = mul i64 %55, 4
  %57 = call noalias i8* @malloc(i64 %56) #5
  %58 = bitcast i8* %57 to float*
  store float* %58, float** @prices, align 8
  store i32 0, i32* %loopnum, align 4
  br label %59

; <label>:59                                      ; preds = %119, %48
  %60 = load i32* %loopnum, align 4
  %61 = load i32* @numOptions, align 4
  %62 = icmp slt i32 %60, %61
  br i1 %62, label %63, label %122

; <label>:63                                      ; preds = %59
  %64 = load %struct._IO_FILE** %file, align 8
  %65 = load i32* %loopnum, align 4
  %66 = sext i32 %65 to i64
  %67 = load %struct.OptionData_** @data, align 8
  %68 = getelementptr inbounds %struct.OptionData_* %67, i64 %66
  %69 = getelementptr inbounds %struct.OptionData_* %68, i32 0, i32 0
  %70 = load i32* %loopnum, align 4
  %71 = sext i32 %70 to i64
  %72 = load %struct.OptionData_** @data, align 8
  %73 = getelementptr inbounds %struct.OptionData_* %72, i64 %71
  %74 = getelementptr inbounds %struct.OptionData_* %73, i32 0, i32 1
  %75 = load i32* %loopnum, align 4
  %76 = sext i32 %75 to i64
  %77 = load %struct.OptionData_** @data, align 8
  %78 = getelementptr inbounds %struct.OptionData_* %77, i64 %76
  %79 = getelementptr inbounds %struct.OptionData_* %78, i32 0, i32 2
  %80 = load i32* %loopnum, align 4
  %81 = sext i32 %80 to i64
  %82 = load %struct.OptionData_** @data, align 8
  %83 = getelementptr inbounds %struct.OptionData_* %82, i64 %81
  %84 = getelementptr inbounds %struct.OptionData_* %83, i32 0, i32 3
  %85 = load i32* %loopnum, align 4
  %86 = sext i32 %85 to i64
  %87 = load %struct.OptionData_** @data, align 8
  %88 = getelementptr inbounds %struct.OptionData_* %87, i64 %86
  %89 = getelementptr inbounds %struct.OptionData_* %88, i32 0, i32 4
  %90 = load i32* %loopnum, align 4
  %91 = sext i32 %90 to i64
  %92 = load %struct.OptionData_** @data, align 8
  %93 = getelementptr inbounds %struct.OptionData_* %92, i64 %91
  %94 = getelementptr inbounds %struct.OptionData_* %93, i32 0, i32 5
  %95 = load i32* %loopnum, align 4
  %96 = sext i32 %95 to i64
  %97 = load %struct.OptionData_** @data, align 8
  %98 = getelementptr inbounds %struct.OptionData_* %97, i64 %96
  %99 = getelementptr inbounds %struct.OptionData_* %98, i32 0, i32 6
  %100 = load i32* %loopnum, align 4
  %101 = sext i32 %100 to i64
  %102 = load %struct.OptionData_** @data, align 8
  %103 = getelementptr inbounds %struct.OptionData_* %102, i64 %101
  %104 = getelementptr inbounds %struct.OptionData_* %103, i32 0, i32 7
  %105 = load i32* %loopnum, align 4
  %106 = sext i32 %105 to i64
  %107 = load %struct.OptionData_** @data, align 8
  %108 = getelementptr inbounds %struct.OptionData_* %107, i64 %106
  %109 = getelementptr inbounds %struct.OptionData_* %108, i32 0, i32 8
  %110 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %64, i8* getelementptr inbounds ([27 x i8]* @.str6, i32 0, i32 0), float* %69, float* %74, float* %79, float* %84, float* %89, float* %94, i8* %99, float* %104, float* %109)
  store i32 %110, i32* %rv, align 4
  %111 = load i32* %rv, align 4
  %112 = icmp ne i32 %111, 9
  br i1 %112, label %113, label %118

; <label>:113                                     ; preds = %63
  %114 = load i8** %inputFile, align 8
  %115 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str3, i32 0, i32 0), i8* %114)
  %116 = load %struct._IO_FILE** %file, align 8
  %117 = call i32 @fclose(%struct._IO_FILE* %116)
  call void @exit(i32 1) #6
  unreachable

; <label>:118                                     ; preds = %63
  br label %119

; <label>:119                                     ; preds = %118
  %120 = load i32* %loopnum, align 4
  %121 = add nsw i32 %120, 1
  store i32 %121, i32* %loopnum, align 4
  br label %59

; <label>:122                                     ; preds = %59
  %123 = load %struct._IO_FILE** %file, align 8
  %124 = call i32 @fclose(%struct._IO_FILE* %123)
  store i32 %124, i32* %rv, align 4
  %125 = load i32* %rv, align 4
  %126 = icmp ne i32 %125, 0
  br i1 %126, label %127, label %130

; <label>:127                                     ; preds = %122
  %128 = load i8** %inputFile, align 8
  %129 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8]* @.str7, i32 0, i32 0), i8* %128)
  call void @exit(i32 1) #6
  unreachable

; <label>:130                                     ; preds = %122
  %131 = load i32* @numOptions, align 4
  %132 = mul nsw i32 5, %131
  %133 = sext i32 %132 to i64
  %134 = mul i64 %133, 4
  %135 = add i64 %134, 256
  %136 = call noalias i8* @malloc(i64 %135) #5
  %137 = bitcast i8* %136 to float*
  store float* %137, float** %buffer, align 8
  %138 = load float** %buffer, align 8
  %139 = ptrtoint float* %138 to i64
  %140 = add i64 %139, 256
  %141 = and i64 %140, -64
  %142 = inttoptr i64 %141 to float*
  store float* %142, float** @sptprice, align 8
  %143 = load float** @sptprice, align 8
  %144 = load i32* @numOptions, align 4
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds float* %143, i64 %145
  store float* %146, float** @strike, align 8
  %147 = load float** @strike, align 8
  %148 = load i32* @numOptions, align 4
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds float* %147, i64 %149
  store float* %150, float** @rate, align 8
  %151 = load float** @rate, align 8
  %152 = load i32* @numOptions, align 4
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds float* %151, i64 %153
  store float* %154, float** @volatility, align 8
  %155 = load float** @volatility, align 8
  %156 = load i32* @numOptions, align 4
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds float* %155, i64 %157
  store float* %158, float** @otime, align 8
  %159 = load i32* @numOptions, align 4
  %160 = sext i32 %159 to i64
  %161 = mul i64 %160, 4
  %162 = add i64 %161, 256
  %163 = call noalias i8* @malloc(i64 %162) #5
  %164 = bitcast i8* %163 to i32*
  store i32* %164, i32** %buffer2, align 8
  %165 = load i32** %buffer2, align 8
  %166 = ptrtoint i32* %165 to i64
  %167 = add i64 %166, 256
  %168 = and i64 %167, -64
  %169 = inttoptr i64 %168 to i32*
  store i32* %169, i32** @otype, align 8
  store i32 0, i32* %i, align 4
  br label %170

; <label>:170                                     ; preds = %238, %130
  %171 = load i32* %i, align 4
  %172 = load i32* @numOptions, align 4
  %173 = icmp slt i32 %171, %172
  br i1 %173, label %174, label %241

; <label>:174                                     ; preds = %170
  %175 = load i32* %i, align 4
  %176 = sext i32 %175 to i64
  %177 = load %struct.OptionData_** @data, align 8
  %178 = getelementptr inbounds %struct.OptionData_* %177, i64 %176
  %179 = getelementptr inbounds %struct.OptionData_* %178, i32 0, i32 6
  %180 = load i8* %179, align 1
  %181 = sext i8 %180 to i32
  %182 = icmp eq i32 %181, 80
  %183 = select i1 %182, i32 1, i32 0
  %184 = load i32* %i, align 4
  %185 = sext i32 %184 to i64
  %186 = load i32** @otype, align 8
  %187 = getelementptr inbounds i32* %186, i64 %185
  store i32 %183, i32* %187, align 4
  %188 = load i32* %i, align 4
  %189 = sext i32 %188 to i64
  %190 = load %struct.OptionData_** @data, align 8
  %191 = getelementptr inbounds %struct.OptionData_* %190, i64 %189
  %192 = getelementptr inbounds %struct.OptionData_* %191, i32 0, i32 0
  %193 = load float* %192, align 4
  %194 = load i32* %i, align 4
  %195 = sext i32 %194 to i64
  %196 = load float** @sptprice, align 8
  %197 = getelementptr inbounds float* %196, i64 %195
  store float %193, float* %197, align 4
  %198 = load i32* %i, align 4
  %199 = sext i32 %198 to i64
  %200 = load %struct.OptionData_** @data, align 8
  %201 = getelementptr inbounds %struct.OptionData_* %200, i64 %199
  %202 = getelementptr inbounds %struct.OptionData_* %201, i32 0, i32 1
  %203 = load float* %202, align 4
  %204 = load i32* %i, align 4
  %205 = sext i32 %204 to i64
  %206 = load float** @strike, align 8
  %207 = getelementptr inbounds float* %206, i64 %205
  store float %203, float* %207, align 4
  %208 = load i32* %i, align 4
  %209 = sext i32 %208 to i64
  %210 = load %struct.OptionData_** @data, align 8
  %211 = getelementptr inbounds %struct.OptionData_* %210, i64 %209
  %212 = getelementptr inbounds %struct.OptionData_* %211, i32 0, i32 2
  %213 = load float* %212, align 4
  %214 = load i32* %i, align 4
  %215 = sext i32 %214 to i64
  %216 = load float** @rate, align 8
  %217 = getelementptr inbounds float* %216, i64 %215
  store float %213, float* %217, align 4
  %218 = load i32* %i, align 4
  %219 = sext i32 %218 to i64
  %220 = load %struct.OptionData_** @data, align 8
  %221 = getelementptr inbounds %struct.OptionData_* %220, i64 %219
  %222 = getelementptr inbounds %struct.OptionData_* %221, i32 0, i32 4
  %223 = load float* %222, align 4
  %224 = load i32* %i, align 4
  %225 = sext i32 %224 to i64
  %226 = load float** @volatility, align 8
  %227 = getelementptr inbounds float* %226, i64 %225
  store float %223, float* %227, align 4
  %228 = load i32* %i, align 4
  %229 = sext i32 %228 to i64
  %230 = load %struct.OptionData_** @data, align 8
  %231 = getelementptr inbounds %struct.OptionData_* %230, i64 %229
  %232 = getelementptr inbounds %struct.OptionData_* %231, i32 0, i32 5
  %233 = load float* %232, align 4
  %234 = load i32* %i, align 4
  %235 = sext i32 %234 to i64
  %236 = load float** @otime, align 8
  %237 = getelementptr inbounds float* %236, i64 %235
  store float %233, float* %237, align 4
  br label %238

; <label>:238                                     ; preds = %174
  %239 = load i32* %i, align 4
  %240 = add nsw i32 %239, 1
  store i32 %240, i32* %i, align 4
  br label %170

; <label>:241                                     ; preds = %170
  store i32 0, i32* %tid, align 4
  %242 = bitcast i32* %tid to i8*
  %243 = call i32 @bs_thread(i8* %242)
  %244 = load i8** %outputFile, align 8
  %245 = call %struct._IO_FILE* @fopen(i8* %244, i8* getelementptr inbounds ([2 x i8]* @.str8, i32 0, i32 0))
  store %struct._IO_FILE* %245, %struct._IO_FILE** %file, align 8
  %246 = load %struct._IO_FILE** %file, align 8
  %247 = icmp eq %struct._IO_FILE* %246, null
  br i1 %247, label %248, label %251

; <label>:248                                     ; preds = %241
  %249 = load i8** %outputFile, align 8
  %250 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([34 x i8]* @.str1, i32 0, i32 0), i8* %249)
  call void @exit(i32 1) #6
  unreachable

; <label>:251                                     ; preds = %241
  %252 = load i32* @numOptions, align 4
  %253 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str9, i32 0, i32 0), i32 %252)
  store i32 0, i32* %i, align 4
  br label %254

; <label>:254                                     ; preds = %266, %251
  %255 = load i32* %i, align 4
  %256 = load i32* @numOptions, align 4
  %257 = icmp slt i32 %255, %256
  br i1 %257, label %258, label %269

; <label>:258                                     ; preds = %254
  %259 = load i32* %i, align 4
  %260 = sext i32 %259 to i64
  %261 = load float** @prices, align 8
  %262 = getelementptr inbounds float* %261, i64 %260
  %263 = load float* %262, align 4
  %264 = fpext float %263 to double
  %265 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str10, i32 0, i32 0), double %264)
  br label %266

; <label>:266                                     ; preds = %258
  %267 = load i32* %i, align 4
  %268 = add nsw i32 %267, 1
  store i32 %268, i32* %i, align 4
  br label %254

; <label>:269                                     ; preds = %254
  %270 = load %struct._IO_FILE** %file, align 8
  %271 = call i32 @fclose(%struct._IO_FILE* %270)
  store i32 %271, i32* %rv, align 4
  %272 = load i32* %rv, align 4
  %273 = icmp ne i32 %272, 0
  br i1 %273, label %274, label %277

; <label>:274                                     ; preds = %269
  %275 = load i8** %outputFile, align 8
  %276 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8]* @.str7, i32 0, i32 0), i8* %275)
  call void @exit(i32 1) #6
  unreachable

; <label>:277                                     ; preds = %269
  %278 = load %struct.OptionData_** @data, align 8
  %279 = bitcast %struct.OptionData_* %278 to i8*
  call void @free(i8* %279) #5
  %280 = load float** @prices, align 8
  %281 = bitcast float* %280 to i8*
  call void @free(i8* %281) #5
  ret i32 0
}

declare i32 @fflush(%struct._IO_FILE*) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #4

declare %struct._IO_FILE* @fopen(i8*, i8*) #2

declare i32 @printf(i8*, ...) #2

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

declare i32 @fclose(%struct._IO_FILE*) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare void @free(i8*) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }
attributes #7 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}
