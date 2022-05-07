; ModuleID = 'HJM_Securities.cpp'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }
%struct.parm = type { i32, double, double, double, double, double, double, double, i32, double, i32, double*, double** }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@NUM_TRIALS = global i32 102400, align 4
@nThreads = global i32 1, align 4
@nSwaptions = global i32 1, align 4
@iN = global i32 11, align 4
@iFactors = global i32 3, align 4
@swaptions = global %struct.parm* null, align 8
@seed = global i64 1979, align 8
@swaption_seed = global i64 0, align 8
@dSumSimSwaptionPrice_global_ptr = global double* null, align 8
@dSumSquareSimSwaptionPrice_global_ptr = global double* null, align 8
@chunksize = global i32 0, align 4
@.str = private unnamed_addr constant [14 x i8] c"iSuccess == 1\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"HJM_Securities.cpp\00", align 1
@__PRETTY_FUNCTION__._Z6workerPv = private unnamed_addr constant [21 x i8] c"void *worker(void *)\00", align 1
@stderr = external global %struct._IO_FILE*
@.str2 = private unnamed_addr constant [31 x i8] c"Usage: %s OPTION [OPTIONS]...\0A\00", align 1
@.str3 = private unnamed_addr constant [10 x i8] c"Options:\0A\00", align 1
@.str4 = private unnamed_addr constant [59 x i8] c"\09-ns [number of swaptions (should be > number of threads]\0A\00", align 1
@.str5 = private unnamed_addr constant [30 x i8] c"\09-sm [number of simulations]\0A\00", align 1
@.str6 = private unnamed_addr constant [26 x i8] c"\09-nt [number of threads]\0A\00", align 1
@.str7 = private unnamed_addr constant [27 x i8] c"\09-sd [random number seed]\0A\00", align 1
@.str8 = private unnamed_addr constant [4 x i8] c"-sm\00", align 1
@.str9 = private unnamed_addr constant [4 x i8] c"-nt\00", align 1
@.str10 = private unnamed_addr constant [4 x i8] c"-ns\00", align 1
@.str11 = private unnamed_addr constant [4 x i8] c"-sd\00", align 1
@.str12 = private unnamed_addr constant [27 x i8] c"Error: Unknown option: %s\0A\00", align 1
@.str13 = private unnamed_addr constant [38 x i8] c"Error: Fewer swaptions than threads.\0A\00", align 1
@.str14 = private unnamed_addr constant [46 x i8] c"Number of threads must be 1 (serial version)\0A\00", align 1
@stdout = external global %struct._IO_FILE*
@.str15 = private unnamed_addr constant [8 x i8] c"%.10lf\0A\00", align 1
@llvm.global_ctors = appending global [1 x { i32, void ()* }] [{ i32, void ()* } { i32 65535, void ()* @_GLOBAL__I_a }]

define internal void @__cxx_global_var_init() section ".text.startup" {
  call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* @_ZStL8__ioinit)
  %1 = call i32 @atexit(void ()* @__dtor__ZStL8__ioinit) #1
  ret void
}

declare void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"*) #0

declare void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"*) #0

define internal void @__dtor__ZStL8__ioinit() section ".text.startup" {
  call void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"* @_ZStL8__ioinit)
  ret void
}

; Function Attrs: nounwind
declare i32 @atexit(void ()*) #1

; Function Attrs: uwtable
define i8* @_Z6workerPv(i8* %arg) #2 {
  %1 = alloca i8*, align 8
  %tid = alloca i32, align 4
  %pdSwaptionPrice = alloca [2 x double], align 16
  %beg = alloca i32, align 4
  %end = alloca i32, align 4
  %chunksize = alloca i32, align 4
  %offsetThread = alloca i32, align 4
  %offset = alloca i32, align 4
  %i = alloca i32, align 4
  %iSuccess = alloca i32, align 4
  store i8* %arg, i8** %1, align 8
  %2 = load i8** %1, align 8
  %3 = bitcast i8* %2 to i32*
  %4 = load i32* %3, align 4
  store i32 %4, i32* %tid, align 4
  %5 = load i32* %tid, align 4
  %6 = load i32* @nSwaptions, align 4
  %7 = load i32* @nThreads, align 4
  %8 = srem i32 %6, %7
  %9 = icmp slt i32 %5, %8
  br i1 %9, label %10, label %22

; <label>:10                                      ; preds = %0
  %11 = load i32* @nSwaptions, align 4
  %12 = load i32* @nThreads, align 4
  %13 = sdiv i32 %11, %12
  %14 = add nsw i32 %13, 1
  store i32 %14, i32* %chunksize, align 4
  %15 = load i32* %tid, align 4
  %16 = load i32* %chunksize, align 4
  %17 = mul nsw i32 %15, %16
  store i32 %17, i32* %beg, align 4
  %18 = load i32* %tid, align 4
  %19 = add nsw i32 %18, 1
  %20 = load i32* %chunksize, align 4
  %21 = mul nsw i32 %19, %20
  store i32 %21, i32* %end, align 4
  br label %48

; <label>:22                                      ; preds = %0
  %23 = load i32* @nSwaptions, align 4
  %24 = load i32* @nThreads, align 4
  %25 = sdiv i32 %23, %24
  store i32 %25, i32* %chunksize, align 4
  %26 = load i32* @nSwaptions, align 4
  %27 = load i32* @nThreads, align 4
  %28 = srem i32 %26, %27
  store i32 %28, i32* %offsetThread, align 4
  %29 = load i32* %offsetThread, align 4
  %30 = load i32* %chunksize, align 4
  %31 = add nsw i32 %30, 1
  %32 = mul nsw i32 %29, %31
  store i32 %32, i32* %offset, align 4
  %33 = load i32* %offset, align 4
  %34 = load i32* %tid, align 4
  %35 = load i32* %offsetThread, align 4
  %36 = sub nsw i32 %34, %35
  %37 = load i32* %chunksize, align 4
  %38 = mul nsw i32 %36, %37
  %39 = add nsw i32 %33, %38
  store i32 %39, i32* %beg, align 4
  %40 = load i32* %offset, align 4
  %41 = load i32* %tid, align 4
  %42 = load i32* %offsetThread, align 4
  %43 = sub nsw i32 %41, %42
  %44 = add nsw i32 %43, 1
  %45 = load i32* %chunksize, align 4
  %46 = mul nsw i32 %44, %45
  %47 = add nsw i32 %40, %46
  store i32 %47, i32* %end, align 4
  br label %48

; <label>:48                                      ; preds = %22, %10
  %49 = load i32* %tid, align 4
  %50 = load i32* @nThreads, align 4
  %51 = sub nsw i32 %50, 1
  %52 = icmp eq i32 %49, %51
  br i1 %52, label %53, label %55

; <label>:53                                      ; preds = %48
  %54 = load i32* @nSwaptions, align 4
  store i32 %54, i32* %end, align 4
  br label %55

; <label>:55                                      ; preds = %53, %48
  %56 = load i32* %beg, align 4
  store i32 %56, i32* %i, align 4
  br label %57

; <label>:57                                      ; preds = %150, %55
  %58 = load i32* %i, align 4
  %59 = load i32* %end, align 4
  %60 = icmp slt i32 %58, %59
  br i1 %60, label %61, label %153

; <label>:61                                      ; preds = %57
  %62 = getelementptr inbounds [2 x double]* %pdSwaptionPrice, i32 0, i32 0
  %63 = load i32* %i, align 4
  %64 = sext i32 %63 to i64
  %65 = load %struct.parm** @swaptions, align 8
  %66 = getelementptr inbounds %struct.parm* %65, i64 %64
  %67 = getelementptr inbounds %struct.parm* %66, i32 0, i32 3
  %68 = load double* %67, align 8
  %69 = load i32* %i, align 4
  %70 = sext i32 %69 to i64
  %71 = load %struct.parm** @swaptions, align 8
  %72 = getelementptr inbounds %struct.parm* %71, i64 %70
  %73 = getelementptr inbounds %struct.parm* %72, i32 0, i32 4
  %74 = load double* %73, align 8
  %75 = load i32* %i, align 4
  %76 = sext i32 %75 to i64
  %77 = load %struct.parm** @swaptions, align 8
  %78 = getelementptr inbounds %struct.parm* %77, i64 %76
  %79 = getelementptr inbounds %struct.parm* %78, i32 0, i32 5
  %80 = load double* %79, align 8
  %81 = load i32* %i, align 4
  %82 = sext i32 %81 to i64
  %83 = load %struct.parm** @swaptions, align 8
  %84 = getelementptr inbounds %struct.parm* %83, i64 %82
  %85 = getelementptr inbounds %struct.parm* %84, i32 0, i32 6
  %86 = load double* %85, align 8
  %87 = load i32* %i, align 4
  %88 = sext i32 %87 to i64
  %89 = load %struct.parm** @swaptions, align 8
  %90 = getelementptr inbounds %struct.parm* %89, i64 %88
  %91 = getelementptr inbounds %struct.parm* %90, i32 0, i32 7
  %92 = load double* %91, align 8
  %93 = load i32* %i, align 4
  %94 = sext i32 %93 to i64
  %95 = load %struct.parm** @swaptions, align 8
  %96 = getelementptr inbounds %struct.parm* %95, i64 %94
  %97 = getelementptr inbounds %struct.parm* %96, i32 0, i32 8
  %98 = load i32* %97, align 4
  %99 = load i32* %i, align 4
  %100 = sext i32 %99 to i64
  %101 = load %struct.parm** @swaptions, align 8
  %102 = getelementptr inbounds %struct.parm* %101, i64 %100
  %103 = getelementptr inbounds %struct.parm* %102, i32 0, i32 10
  %104 = load i32* %103, align 4
  %105 = load i32* %i, align 4
  %106 = sext i32 %105 to i64
  %107 = load %struct.parm** @swaptions, align 8
  %108 = getelementptr inbounds %struct.parm* %107, i64 %106
  %109 = getelementptr inbounds %struct.parm* %108, i32 0, i32 9
  %110 = load double* %109, align 8
  %111 = load i32* %i, align 4
  %112 = sext i32 %111 to i64
  %113 = load %struct.parm** @swaptions, align 8
  %114 = getelementptr inbounds %struct.parm* %113, i64 %112
  %115 = getelementptr inbounds %struct.parm* %114, i32 0, i32 11
  %116 = load double** %115, align 8
  %117 = load i32* %i, align 4
  %118 = sext i32 %117 to i64
  %119 = load %struct.parm** @swaptions, align 8
  %120 = getelementptr inbounds %struct.parm* %119, i64 %118
  %121 = getelementptr inbounds %struct.parm* %120, i32 0, i32 12
  %122 = load double*** %121, align 8
  %123 = load i64* @swaption_seed, align 8
  %124 = load i32* %i, align 4
  %125 = sext i32 %124 to i64
  %126 = add nsw i64 %123, %125
  %127 = load i32* @NUM_TRIALS, align 4
  %128 = sext i32 %127 to i64
  %129 = call i32 @_Z21HJM_Swaption_BlockingPddddddiidS_PS_llii(double* %62, double %68, double %74, double %80, double %86, double %92, i32 %98, i32 %104, double %110, double* %116, double** %122, i64 %126, i64 %128, i32 16, i32 0)
  store i32 %129, i32* %iSuccess, align 4
  %130 = load i32* %iSuccess, align 4
  %131 = icmp eq i32 %130, 1
  br i1 %131, label %132, label %133

; <label>:132                                     ; preds = %61
  br label %135

; <label>:133                                     ; preds = %61
  call void @__assert_fail(i8* getelementptr inbounds ([14 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 110, i8* getelementptr inbounds ([21 x i8]* @__PRETTY_FUNCTION__._Z6workerPv, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %135

; <label>:135                                     ; preds = %134, %132
  %136 = getelementptr inbounds [2 x double]* %pdSwaptionPrice, i32 0, i64 0
  %137 = load double* %136, align 8
  %138 = load i32* %i, align 4
  %139 = sext i32 %138 to i64
  %140 = load %struct.parm** @swaptions, align 8
  %141 = getelementptr inbounds %struct.parm* %140, i64 %139
  %142 = getelementptr inbounds %struct.parm* %141, i32 0, i32 1
  store double %137, double* %142, align 8
  %143 = getelementptr inbounds [2 x double]* %pdSwaptionPrice, i32 0, i64 1
  %144 = load double* %143, align 8
  %145 = load i32* %i, align 4
  %146 = sext i32 %145 to i64
  %147 = load %struct.parm** @swaptions, align 8
  %148 = getelementptr inbounds %struct.parm* %147, i64 %146
  %149 = getelementptr inbounds %struct.parm* %148, i32 0, i32 2
  store double %144, double* %149, align 8
  br label %150

; <label>:150                                     ; preds = %135
  %151 = load i32* %i, align 4
  %152 = add nsw i32 %151, 1
  store i32 %152, i32* %i, align 4
  br label %57

; <label>:153                                     ; preds = %57
  ret i8* null
}

declare i32 @_Z21HJM_Swaption_BlockingPddddddiidS_PS_llii(double*, double, double, double, double, double, i32, i32, double, double*, double**, i64, i64, i32, i32) #0

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #3

; Function Attrs: uwtable
define void @_Z11print_usagePc(i8* %name) #2 {
  %1 = alloca i8*, align 8
  store i8* %name, i8** %1, align 8
  %2 = load %struct._IO_FILE** @stderr, align 8
  %3 = load i8** %1, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([31 x i8]* @.str2, i32 0, i32 0), i8* %3)
  %5 = load %struct._IO_FILE** @stderr, align 8
  %6 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([10 x i8]* @.str3, i32 0, i32 0))
  %7 = load %struct._IO_FILE** @stderr, align 8
  %8 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([59 x i8]* @.str4, i32 0, i32 0))
  %9 = load %struct._IO_FILE** @stderr, align 8
  %10 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([30 x i8]* @.str5, i32 0, i32 0))
  %11 = load %struct._IO_FILE** @stderr, align 8
  %12 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([26 x i8]* @.str6, i32 0, i32 0))
  %13 = load %struct._IO_FILE** @stderr, align 8
  %14 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([27 x i8]* @.str7, i32 0, i32 0))
  ret void
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #0

; Function Attrs: uwtable
define i32 @main(i32 %argc, i8** %argv) #2 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %iSuccess = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %factors = alloca double**, align 8
  %j1 = alloca i32, align 4
  %k = alloca i32, align 4
  %threadID = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  store i32 0, i32* %iSuccess, align 4
  store double** null, double*** %factors, align 8
  %4 = call i32 @fflush(%struct._IO_FILE* null)
  %5 = load i32* %2, align 4
  %6 = icmp eq i32 %5, 1
  br i1 %6, label %7, label %11

; <label>:7                                       ; preds = %0
  %8 = load i8*** %3, align 8
  %9 = getelementptr inbounds i8** %8, i64 0
  %10 = load i8** %9, align 8
  call void @_Z11print_usagePc(i8* %10)
  call void @exit(i32 1) #6
  unreachable

; <label>:11                                      ; preds = %0
  store i32 1, i32* %j1, align 4
  br label %12

; <label>:12                                      ; preds = %96, %11
  %13 = load i32* %j1, align 4
  %14 = load i32* %2, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %99

; <label>:16                                      ; preds = %12
  %17 = load i32* %j1, align 4
  %18 = sext i32 %17 to i64
  %19 = load i8*** %3, align 8
  %20 = getelementptr inbounds i8** %19, i64 %18
  %21 = load i8** %20, align 8
  %22 = call i32 @strcmp(i8* getelementptr inbounds ([4 x i8]* @.str8, i32 0, i32 0), i8* %21) #7
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %32, label %24

; <label>:24                                      ; preds = %16
  %25 = load i32* %j1, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, i32* %j1, align 4
  %27 = sext i32 %26 to i64
  %28 = load i8*** %3, align 8
  %29 = getelementptr inbounds i8** %28, i64 %27
  %30 = load i8** %29, align 8
  %31 = call i32 @atoi(i8* %30) #7
  store i32 %31, i32* @NUM_TRIALS, align 4
  br label %95

; <label>:32                                      ; preds = %16
  %33 = load i32* %j1, align 4
  %34 = sext i32 %33 to i64
  %35 = load i8*** %3, align 8
  %36 = getelementptr inbounds i8** %35, i64 %34
  %37 = load i8** %36, align 8
  %38 = call i32 @strcmp(i8* getelementptr inbounds ([4 x i8]* @.str9, i32 0, i32 0), i8* %37) #7
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %48, label %40

; <label>:40                                      ; preds = %32
  %41 = load i32* %j1, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, i32* %j1, align 4
  %43 = sext i32 %42 to i64
  %44 = load i8*** %3, align 8
  %45 = getelementptr inbounds i8** %44, i64 %43
  %46 = load i8** %45, align 8
  %47 = call i32 @atoi(i8* %46) #7
  store i32 %47, i32* @nThreads, align 4
  br label %94

; <label>:48                                      ; preds = %32
  %49 = load i32* %j1, align 4
  %50 = sext i32 %49 to i64
  %51 = load i8*** %3, align 8
  %52 = getelementptr inbounds i8** %51, i64 %50
  %53 = load i8** %52, align 8
  %54 = call i32 @strcmp(i8* getelementptr inbounds ([4 x i8]* @.str10, i32 0, i32 0), i8* %53) #7
  %55 = icmp ne i32 %54, 0
  br i1 %55, label %64, label %56

; <label>:56                                      ; preds = %48
  %57 = load i32* %j1, align 4
  %58 = add nsw i32 %57, 1
  store i32 %58, i32* %j1, align 4
  %59 = sext i32 %58 to i64
  %60 = load i8*** %3, align 8
  %61 = getelementptr inbounds i8** %60, i64 %59
  %62 = load i8** %61, align 8
  %63 = call i32 @atoi(i8* %62) #7
  store i32 %63, i32* @nSwaptions, align 4
  br label %93

; <label>:64                                      ; preds = %48
  %65 = load i32* %j1, align 4
  %66 = sext i32 %65 to i64
  %67 = load i8*** %3, align 8
  %68 = getelementptr inbounds i8** %67, i64 %66
  %69 = load i8** %68, align 8
  %70 = call i32 @strcmp(i8* getelementptr inbounds ([4 x i8]* @.str11, i32 0, i32 0), i8* %69) #7
  %71 = icmp ne i32 %70, 0
  br i1 %71, label %81, label %72

; <label>:72                                      ; preds = %64
  %73 = load i32* %j1, align 4
  %74 = add nsw i32 %73, 1
  store i32 %74, i32* %j1, align 4
  %75 = sext i32 %74 to i64
  %76 = load i8*** %3, align 8
  %77 = getelementptr inbounds i8** %76, i64 %75
  %78 = load i8** %77, align 8
  %79 = call i32 @atoi(i8* %78) #7
  %80 = sext i32 %79 to i64
  store i64 %80, i64* @seed, align 8
  br label %92

; <label>:81                                      ; preds = %64
  %82 = load %struct._IO_FILE** @stderr, align 8
  %83 = load i32* %j1, align 4
  %84 = sext i32 %83 to i64
  %85 = load i8*** %3, align 8
  %86 = getelementptr inbounds i8** %85, i64 %84
  %87 = load i8** %86, align 8
  %88 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %82, i8* getelementptr inbounds ([27 x i8]* @.str12, i32 0, i32 0), i8* %87)
  %89 = load i8*** %3, align 8
  %90 = getelementptr inbounds i8** %89, i64 0
  %91 = load i8** %90, align 8
  call void @_Z11print_usagePc(i8* %91)
  call void @exit(i32 1) #6
  unreachable

; <label>:92                                      ; preds = %72
  br label %93

; <label>:93                                      ; preds = %92, %56
  br label %94

; <label>:94                                      ; preds = %93, %40
  br label %95

; <label>:95                                      ; preds = %94, %24
  br label %96

; <label>:96                                      ; preds = %95
  %97 = load i32* %j1, align 4
  %98 = add nsw i32 %97, 1
  store i32 %98, i32* %j1, align 4
  br label %12

; <label>:99                                      ; preds = %12
  %100 = load i32* @nSwaptions, align 4
  %101 = load i32* @nThreads, align 4
  %102 = icmp slt i32 %100, %101
  br i1 %102, label %103, label %109

; <label>:103                                     ; preds = %99
  %104 = load %struct._IO_FILE** @stderr, align 8
  %105 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %104, i8* getelementptr inbounds ([38 x i8]* @.str13, i32 0, i32 0))
  %106 = load i8*** %3, align 8
  %107 = getelementptr inbounds i8** %106, i64 0
  %108 = load i8** %107, align 8
  call void @_Z11print_usagePc(i8* %108)
  call void @exit(i32 1) #6
  unreachable

; <label>:109                                     ; preds = %99
  %110 = call double @_Z7RanUnifPl(i64* @seed)
  %111 = fmul double 0x41DFFFFFFFC00000, %110
  %112 = fptosi double %111 to i64
  store i64 %112, i64* @swaption_seed, align 8
  %113 = load i32* @nThreads, align 4
  %114 = icmp ne i32 %113, 1
  br i1 %114, label %115, label %118

; <label>:115                                     ; preds = %109
  %116 = load %struct._IO_FILE** @stderr, align 8
  %117 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %116, i8* getelementptr inbounds ([46 x i8]* @.str14, i32 0, i32 0))
  call void @exit(i32 1) #6
  unreachable

; <label>:118                                     ; preds = %109
  %119 = load i32* @iFactors, align 4
  %120 = sub nsw i32 %119, 1
  %121 = sext i32 %120 to i64
  %122 = load i32* @iN, align 4
  %123 = sub nsw i32 %122, 2
  %124 = sext i32 %123 to i64
  %125 = call double** @_Z7dmatrixllll(i64 0, i64 %121, i64 0, i64 %124)
  store double** %125, double*** %factors, align 8
  %126 = load double*** %factors, align 8
  %127 = getelementptr inbounds double** %126, i64 0
  %128 = load double** %127, align 8
  %129 = getelementptr inbounds double* %128, i64 0
  store double 1.000000e-02, double* %129, align 8
  %130 = load double*** %factors, align 8
  %131 = getelementptr inbounds double** %130, i64 0
  %132 = load double** %131, align 8
  %133 = getelementptr inbounds double* %132, i64 1
  store double 1.000000e-02, double* %133, align 8
  %134 = load double*** %factors, align 8
  %135 = getelementptr inbounds double** %134, i64 0
  %136 = load double** %135, align 8
  %137 = getelementptr inbounds double* %136, i64 2
  store double 1.000000e-02, double* %137, align 8
  %138 = load double*** %factors, align 8
  %139 = getelementptr inbounds double** %138, i64 0
  %140 = load double** %139, align 8
  %141 = getelementptr inbounds double* %140, i64 3
  store double 1.000000e-02, double* %141, align 8
  %142 = load double*** %factors, align 8
  %143 = getelementptr inbounds double** %142, i64 0
  %144 = load double** %143, align 8
  %145 = getelementptr inbounds double* %144, i64 4
  store double 1.000000e-02, double* %145, align 8
  %146 = load double*** %factors, align 8
  %147 = getelementptr inbounds double** %146, i64 0
  %148 = load double** %147, align 8
  %149 = getelementptr inbounds double* %148, i64 5
  store double 1.000000e-02, double* %149, align 8
  %150 = load double*** %factors, align 8
  %151 = getelementptr inbounds double** %150, i64 0
  %152 = load double** %151, align 8
  %153 = getelementptr inbounds double* %152, i64 6
  store double 1.000000e-02, double* %153, align 8
  %154 = load double*** %factors, align 8
  %155 = getelementptr inbounds double** %154, i64 0
  %156 = load double** %155, align 8
  %157 = getelementptr inbounds double* %156, i64 7
  store double 1.000000e-02, double* %157, align 8
  %158 = load double*** %factors, align 8
  %159 = getelementptr inbounds double** %158, i64 0
  %160 = load double** %159, align 8
  %161 = getelementptr inbounds double* %160, i64 8
  store double 1.000000e-02, double* %161, align 8
  %162 = load double*** %factors, align 8
  %163 = getelementptr inbounds double** %162, i64 0
  %164 = load double** %163, align 8
  %165 = getelementptr inbounds double* %164, i64 9
  store double 1.000000e-02, double* %165, align 8
  %166 = load double*** %factors, align 8
  %167 = getelementptr inbounds double** %166, i64 1
  %168 = load double** %167, align 8
  %169 = getelementptr inbounds double* %168, i64 0
  store double 9.048000e-03, double* %169, align 8
  %170 = load double*** %factors, align 8
  %171 = getelementptr inbounds double** %170, i64 1
  %172 = load double** %171, align 8
  %173 = getelementptr inbounds double* %172, i64 1
  store double 8.187000e-03, double* %173, align 8
  %174 = load double*** %factors, align 8
  %175 = getelementptr inbounds double** %174, i64 1
  %176 = load double** %175, align 8
  %177 = getelementptr inbounds double* %176, i64 2
  store double 7.408000e-03, double* %177, align 8
  %178 = load double*** %factors, align 8
  %179 = getelementptr inbounds double** %178, i64 1
  %180 = load double** %179, align 8
  %181 = getelementptr inbounds double* %180, i64 3
  store double 6.703000e-03, double* %181, align 8
  %182 = load double*** %factors, align 8
  %183 = getelementptr inbounds double** %182, i64 1
  %184 = load double** %183, align 8
  %185 = getelementptr inbounds double* %184, i64 4
  store double 6.065000e-03, double* %185, align 8
  %186 = load double*** %factors, align 8
  %187 = getelementptr inbounds double** %186, i64 1
  %188 = load double** %187, align 8
  %189 = getelementptr inbounds double* %188, i64 5
  store double 5.488000e-03, double* %189, align 8
  %190 = load double*** %factors, align 8
  %191 = getelementptr inbounds double** %190, i64 1
  %192 = load double** %191, align 8
  %193 = getelementptr inbounds double* %192, i64 6
  store double 4.966000e-03, double* %193, align 8
  %194 = load double*** %factors, align 8
  %195 = getelementptr inbounds double** %194, i64 1
  %196 = load double** %195, align 8
  %197 = getelementptr inbounds double* %196, i64 7
  store double 4.493000e-03, double* %197, align 8
  %198 = load double*** %factors, align 8
  %199 = getelementptr inbounds double** %198, i64 1
  %200 = load double** %199, align 8
  %201 = getelementptr inbounds double* %200, i64 8
  store double 4.066000e-03, double* %201, align 8
  %202 = load double*** %factors, align 8
  %203 = getelementptr inbounds double** %202, i64 1
  %204 = load double** %203, align 8
  %205 = getelementptr inbounds double* %204, i64 9
  store double 3.679000e-03, double* %205, align 8
  %206 = load double*** %factors, align 8
  %207 = getelementptr inbounds double** %206, i64 2
  %208 = load double** %207, align 8
  %209 = getelementptr inbounds double* %208, i64 0
  store double 1.000000e-03, double* %209, align 8
  %210 = load double*** %factors, align 8
  %211 = getelementptr inbounds double** %210, i64 2
  %212 = load double** %211, align 8
  %213 = getelementptr inbounds double* %212, i64 1
  store double 7.500000e-04, double* %213, align 8
  %214 = load double*** %factors, align 8
  %215 = getelementptr inbounds double** %214, i64 2
  %216 = load double** %215, align 8
  %217 = getelementptr inbounds double* %216, i64 2
  store double 5.000000e-04, double* %217, align 8
  %218 = load double*** %factors, align 8
  %219 = getelementptr inbounds double** %218, i64 2
  %220 = load double** %219, align 8
  %221 = getelementptr inbounds double* %220, i64 3
  store double 2.500000e-04, double* %221, align 8
  %222 = load double*** %factors, align 8
  %223 = getelementptr inbounds double** %222, i64 2
  %224 = load double** %223, align 8
  %225 = getelementptr inbounds double* %224, i64 4
  store double 0.000000e+00, double* %225, align 8
  %226 = load double*** %factors, align 8
  %227 = getelementptr inbounds double** %226, i64 2
  %228 = load double** %227, align 8
  %229 = getelementptr inbounds double* %228, i64 5
  store double -2.500000e-04, double* %229, align 8
  %230 = load double*** %factors, align 8
  %231 = getelementptr inbounds double** %230, i64 2
  %232 = load double** %231, align 8
  %233 = getelementptr inbounds double* %232, i64 6
  store double -5.000000e-04, double* %233, align 8
  %234 = load double*** %factors, align 8
  %235 = getelementptr inbounds double** %234, i64 2
  %236 = load double** %235, align 8
  %237 = getelementptr inbounds double* %236, i64 7
  store double -7.500000e-04, double* %237, align 8
  %238 = load double*** %factors, align 8
  %239 = getelementptr inbounds double** %238, i64 2
  %240 = load double** %239, align 8
  %241 = getelementptr inbounds double* %240, i64 8
  store double -1.000000e-03, double* %241, align 8
  %242 = load double*** %factors, align 8
  %243 = getelementptr inbounds double** %242, i64 2
  %244 = load double** %243, align 8
  %245 = getelementptr inbounds double* %244, i64 9
  store double -1.250000e-03, double* %245, align 8
  %246 = load i32* @nSwaptions, align 4
  %247 = sext i32 %246 to i64
  %248 = mul i64 104, %247
  %249 = call noalias i8* @malloc(i64 %248) #1
  %250 = bitcast i8* %249 to %struct.parm*
  store %struct.parm* %250, %struct.parm** @swaptions, align 8
  store i32 0, i32* %i, align 4
  br label %251

; <label>:251                                     ; preds = %442, %118
  %252 = load i32* %i, align 4
  %253 = load i32* @nSwaptions, align 4
  %254 = icmp slt i32 %252, %253
  br i1 %254, label %255, label %445

; <label>:255                                     ; preds = %251
  %256 = load i32* %i, align 4
  %257 = load i32* %i, align 4
  %258 = sext i32 %257 to i64
  %259 = load %struct.parm** @swaptions, align 8
  %260 = getelementptr inbounds %struct.parm* %259, i64 %258
  %261 = getelementptr inbounds %struct.parm* %260, i32 0, i32 0
  store i32 %256, i32* %261, align 4
  %262 = load i32* @iN, align 4
  %263 = load i32* %i, align 4
  %264 = sext i32 %263 to i64
  %265 = load %struct.parm** @swaptions, align 8
  %266 = getelementptr inbounds %struct.parm* %265, i64 %264
  %267 = getelementptr inbounds %struct.parm* %266, i32 0, i32 8
  store i32 %262, i32* %267, align 4
  %268 = load i32* @iFactors, align 4
  %269 = load i32* %i, align 4
  %270 = sext i32 %269 to i64
  %271 = load %struct.parm** @swaptions, align 8
  %272 = getelementptr inbounds %struct.parm* %271, i64 %270
  %273 = getelementptr inbounds %struct.parm* %272, i32 0, i32 10
  store i32 %268, i32* %273, align 4
  %274 = call double @_Z7RanUnifPl(i64* @seed)
  %275 = fmul double 6.000000e+01, %274
  %276 = fptosi double %275 to i32
  %277 = sitofp i32 %276 to double
  %278 = fmul double %277, 2.500000e-01
  %279 = fadd double 5.000000e+00, %278
  %280 = load i32* %i, align 4
  %281 = sext i32 %280 to i64
  %282 = load %struct.parm** @swaptions, align 8
  %283 = getelementptr inbounds %struct.parm* %282, i64 %281
  %284 = getelementptr inbounds %struct.parm* %283, i32 0, i32 9
  store double %279, double* %284, align 8
  %285 = call double @_Z7RanUnifPl(i64* @seed)
  %286 = fmul double 4.900000e+01, %285
  %287 = fptosi double %286 to i32
  %288 = sitofp i32 %287 to double
  %289 = fmul double %288, 1.000000e-01
  %290 = fadd double 1.000000e-01, %289
  %291 = load i32* %i, align 4
  %292 = sext i32 %291 to i64
  %293 = load %struct.parm** @swaptions, align 8
  %294 = getelementptr inbounds %struct.parm* %293, i64 %292
  %295 = getelementptr inbounds %struct.parm* %294, i32 0, i32 3
  store double %290, double* %295, align 8
  %296 = load i32* %i, align 4
  %297 = sext i32 %296 to i64
  %298 = load %struct.parm** @swaptions, align 8
  %299 = getelementptr inbounds %struct.parm* %298, i64 %297
  %300 = getelementptr inbounds %struct.parm* %299, i32 0, i32 4
  store double 0.000000e+00, double* %300, align 8
  %301 = load i32* %i, align 4
  %302 = sext i32 %301 to i64
  %303 = load %struct.parm** @swaptions, align 8
  %304 = getelementptr inbounds %struct.parm* %303, i64 %302
  %305 = getelementptr inbounds %struct.parm* %304, i32 0, i32 5
  store double 1.000000e+00, double* %305, align 8
  %306 = load i32* %i, align 4
  %307 = sext i32 %306 to i64
  %308 = load %struct.parm** @swaptions, align 8
  %309 = getelementptr inbounds %struct.parm* %308, i64 %307
  %310 = getelementptr inbounds %struct.parm* %309, i32 0, i32 6
  store double 2.000000e+00, double* %310, align 8
  %311 = load i32* %i, align 4
  %312 = sext i32 %311 to i64
  %313 = load %struct.parm** @swaptions, align 8
  %314 = getelementptr inbounds %struct.parm* %313, i64 %312
  %315 = getelementptr inbounds %struct.parm* %314, i32 0, i32 7
  store double 1.000000e+00, double* %315, align 8
  %316 = load i32* @iN, align 4
  %317 = sub nsw i32 %316, 1
  %318 = sext i32 %317 to i64
  %319 = call double* @_Z7dvectorll(i64 0, i64 %318)
  %320 = load i32* %i, align 4
  %321 = sext i32 %320 to i64
  %322 = load %struct.parm** @swaptions, align 8
  %323 = getelementptr inbounds %struct.parm* %322, i64 %321
  %324 = getelementptr inbounds %struct.parm* %323, i32 0, i32 11
  store double* %319, double** %324, align 8
  %325 = load i32* %i, align 4
  %326 = sext i32 %325 to i64
  %327 = load %struct.parm** @swaptions, align 8
  %328 = getelementptr inbounds %struct.parm* %327, i64 %326
  %329 = getelementptr inbounds %struct.parm* %328, i32 0, i32 11
  %330 = load double** %329, align 8
  %331 = getelementptr inbounds double* %330, i64 0
  store double 1.000000e-01, double* %331, align 8
  store i32 1, i32* %j, align 4
  br label %332

; <label>:332                                     ; preds = %364, %255
  %333 = load i32* %j, align 4
  %334 = load i32* %i, align 4
  %335 = sext i32 %334 to i64
  %336 = load %struct.parm** @swaptions, align 8
  %337 = getelementptr inbounds %struct.parm* %336, i64 %335
  %338 = getelementptr inbounds %struct.parm* %337, i32 0, i32 8
  %339 = load i32* %338, align 4
  %340 = sub nsw i32 %339, 1
  %341 = icmp sle i32 %333, %340
  br i1 %341, label %342, label %367

; <label>:342                                     ; preds = %332
  %343 = load i32* %j, align 4
  %344 = sub nsw i32 %343, 1
  %345 = sext i32 %344 to i64
  %346 = load i32* %i, align 4
  %347 = sext i32 %346 to i64
  %348 = load %struct.parm** @swaptions, align 8
  %349 = getelementptr inbounds %struct.parm* %348, i64 %347
  %350 = getelementptr inbounds %struct.parm* %349, i32 0, i32 11
  %351 = load double** %350, align 8
  %352 = getelementptr inbounds double* %351, i64 %345
  %353 = load double* %352, align 8
  %354 = fadd double %353, 5.000000e-03
  %355 = load i32* %j, align 4
  %356 = sext i32 %355 to i64
  %357 = load i32* %i, align 4
  %358 = sext i32 %357 to i64
  %359 = load %struct.parm** @swaptions, align 8
  %360 = getelementptr inbounds %struct.parm* %359, i64 %358
  %361 = getelementptr inbounds %struct.parm* %360, i32 0, i32 11
  %362 = load double** %361, align 8
  %363 = getelementptr inbounds double* %362, i64 %356
  store double %354, double* %363, align 8
  br label %364

; <label>:364                                     ; preds = %342
  %365 = load i32* %j, align 4
  %366 = add nsw i32 %365, 1
  store i32 %366, i32* %j, align 4
  br label %332

; <label>:367                                     ; preds = %332
  %368 = load i32* %i, align 4
  %369 = sext i32 %368 to i64
  %370 = load %struct.parm** @swaptions, align 8
  %371 = getelementptr inbounds %struct.parm* %370, i64 %369
  %372 = getelementptr inbounds %struct.parm* %371, i32 0, i32 10
  %373 = load i32* %372, align 4
  %374 = sub nsw i32 %373, 1
  %375 = sext i32 %374 to i64
  %376 = load i32* %i, align 4
  %377 = sext i32 %376 to i64
  %378 = load %struct.parm** @swaptions, align 8
  %379 = getelementptr inbounds %struct.parm* %378, i64 %377
  %380 = getelementptr inbounds %struct.parm* %379, i32 0, i32 8
  %381 = load i32* %380, align 4
  %382 = sub nsw i32 %381, 2
  %383 = sext i32 %382 to i64
  %384 = call double** @_Z7dmatrixllll(i64 0, i64 %375, i64 0, i64 %383)
  %385 = load i32* %i, align 4
  %386 = sext i32 %385 to i64
  %387 = load %struct.parm** @swaptions, align 8
  %388 = getelementptr inbounds %struct.parm* %387, i64 %386
  %389 = getelementptr inbounds %struct.parm* %388, i32 0, i32 12
  store double** %384, double*** %389, align 8
  store i32 0, i32* %k, align 4
  br label %390

; <label>:390                                     ; preds = %438, %367
  %391 = load i32* %k, align 4
  %392 = load i32* %i, align 4
  %393 = sext i32 %392 to i64
  %394 = load %struct.parm** @swaptions, align 8
  %395 = getelementptr inbounds %struct.parm* %394, i64 %393
  %396 = getelementptr inbounds %struct.parm* %395, i32 0, i32 10
  %397 = load i32* %396, align 4
  %398 = sub nsw i32 %397, 1
  %399 = icmp sle i32 %391, %398
  br i1 %399, label %400, label %441

; <label>:400                                     ; preds = %390
  store i32 0, i32* %j, align 4
  br label %401

; <label>:401                                     ; preds = %434, %400
  %402 = load i32* %j, align 4
  %403 = load i32* %i, align 4
  %404 = sext i32 %403 to i64
  %405 = load %struct.parm** @swaptions, align 8
  %406 = getelementptr inbounds %struct.parm* %405, i64 %404
  %407 = getelementptr inbounds %struct.parm* %406, i32 0, i32 8
  %408 = load i32* %407, align 4
  %409 = sub nsw i32 %408, 2
  %410 = icmp sle i32 %402, %409
  br i1 %410, label %411, label %437

; <label>:411                                     ; preds = %401
  %412 = load i32* %j, align 4
  %413 = sext i32 %412 to i64
  %414 = load i32* %k, align 4
  %415 = sext i32 %414 to i64
  %416 = load double*** %factors, align 8
  %417 = getelementptr inbounds double** %416, i64 %415
  %418 = load double** %417, align 8
  %419 = getelementptr inbounds double* %418, i64 %413
  %420 = load double* %419, align 8
  %421 = load i32* %j, align 4
  %422 = sext i32 %421 to i64
  %423 = load i32* %k, align 4
  %424 = sext i32 %423 to i64
  %425 = load i32* %i, align 4
  %426 = sext i32 %425 to i64
  %427 = load %struct.parm** @swaptions, align 8
  %428 = getelementptr inbounds %struct.parm* %427, i64 %426
  %429 = getelementptr inbounds %struct.parm* %428, i32 0, i32 12
  %430 = load double*** %429, align 8
  %431 = getelementptr inbounds double** %430, i64 %424
  %432 = load double** %431, align 8
  %433 = getelementptr inbounds double* %432, i64 %422
  store double %420, double* %433, align 8
  br label %434

; <label>:434                                     ; preds = %411
  %435 = load i32* %j, align 4
  %436 = add nsw i32 %435, 1
  store i32 %436, i32* %j, align 4
  br label %401

; <label>:437                                     ; preds = %401
  br label %438

; <label>:438                                     ; preds = %437
  %439 = load i32* %k, align 4
  %440 = add nsw i32 %439, 1
  store i32 %440, i32* %k, align 4
  br label %390

; <label>:441                                     ; preds = %390
  br label %442

; <label>:442                                     ; preds = %441
  %443 = load i32* %i, align 4
  %444 = add nsw i32 %443, 1
  store i32 %444, i32* %i, align 4
  br label %251

; <label>:445                                     ; preds = %251
  store i32 0, i32* %threadID, align 4
  %446 = bitcast i32* %threadID to i8*
  %447 = call i8* @_Z6workerPv(i8* %446)
  store i32 0, i32* %i, align 4
  br label %448

; <label>:448                                     ; preds = %461, %445
  %449 = load i32* %i, align 4
  %450 = load i32* @nSwaptions, align 4
  %451 = icmp slt i32 %449, %450
  br i1 %451, label %452, label %464

; <label>:452                                     ; preds = %448
  %453 = load %struct._IO_FILE** @stdout, align 8
  %454 = load i32* %i, align 4
  %455 = sext i32 %454 to i64
  %456 = load %struct.parm** @swaptions, align 8
  %457 = getelementptr inbounds %struct.parm* %456, i64 %455
  %458 = getelementptr inbounds %struct.parm* %457, i32 0, i32 1
  %459 = load double* %458, align 8
  %460 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %453, i8* getelementptr inbounds ([8 x i8]* @.str15, i32 0, i32 0), double %459)
  br label %461

; <label>:461                                     ; preds = %452
  %462 = load i32* %i, align 4
  %463 = add nsw i32 %462, 1
  store i32 %463, i32* %i, align 4
  br label %448

; <label>:464                                     ; preds = %448
  store i32 0, i32* %i, align 4
  br label %465

; <label>:465                                     ; preds = %506, %464
  %466 = load i32* %i, align 4
  %467 = load i32* @nSwaptions, align 4
  %468 = icmp slt i32 %466, %467
  br i1 %468, label %469, label %509

; <label>:469                                     ; preds = %465
  %470 = load i32* %i, align 4
  %471 = sext i32 %470 to i64
  %472 = load %struct.parm** @swaptions, align 8
  %473 = getelementptr inbounds %struct.parm* %472, i64 %471
  %474 = getelementptr inbounds %struct.parm* %473, i32 0, i32 11
  %475 = load double** %474, align 8
  %476 = load i32* %i, align 4
  %477 = sext i32 %476 to i64
  %478 = load %struct.parm** @swaptions, align 8
  %479 = getelementptr inbounds %struct.parm* %478, i64 %477
  %480 = getelementptr inbounds %struct.parm* %479, i32 0, i32 8
  %481 = load i32* %480, align 4
  %482 = sub nsw i32 %481, 1
  %483 = sext i32 %482 to i64
  call void @_Z12free_dvectorPdll(double* %475, i64 0, i64 %483)
  %484 = load i32* %i, align 4
  %485 = sext i32 %484 to i64
  %486 = load %struct.parm** @swaptions, align 8
  %487 = getelementptr inbounds %struct.parm* %486, i64 %485
  %488 = getelementptr inbounds %struct.parm* %487, i32 0, i32 12
  %489 = load double*** %488, align 8
  %490 = load i32* %i, align 4
  %491 = sext i32 %490 to i64
  %492 = load %struct.parm** @swaptions, align 8
  %493 = getelementptr inbounds %struct.parm* %492, i64 %491
  %494 = getelementptr inbounds %struct.parm* %493, i32 0, i32 10
  %495 = load i32* %494, align 4
  %496 = sub nsw i32 %495, 1
  %497 = sext i32 %496 to i64
  %498 = load i32* %i, align 4
  %499 = sext i32 %498 to i64
  %500 = load %struct.parm** @swaptions, align 8
  %501 = getelementptr inbounds %struct.parm* %500, i64 %499
  %502 = getelementptr inbounds %struct.parm* %501, i32 0, i32 8
  %503 = load i32* %502, align 4
  %504 = sub nsw i32 %503, 2
  %505 = sext i32 %504 to i64
  call void @_Z12free_dmatrixPPdllll(double** %489, i64 0, i64 %497, i64 0, i64 %505)
  br label %506

; <label>:506                                     ; preds = %469
  %507 = load i32* %i, align 4
  %508 = add nsw i32 %507, 1
  store i32 %508, i32* %i, align 4
  br label %465

; <label>:509                                     ; preds = %465
  %510 = load %struct.parm** @swaptions, align 8
  %511 = bitcast %struct.parm* %510 to i8*
  call void @free(i8* %511) #1
  %512 = load i32* %iSuccess, align 4
  ret i32 %512
}

declare i32 @fflush(%struct._IO_FILE*) #0

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #4

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #4

declare double @_Z7RanUnifPl(i64*) #0

declare double** @_Z7dmatrixllll(i64, i64, i64, i64) #0

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #5

declare double* @_Z7dvectorll(i64, i64) #0

declare void @_Z12free_dvectorPdll(double*, i64, i64) #0

declare void @_Z12free_dmatrixPPdllll(double**, i64, i64, i64, i64) #0

; Function Attrs: nounwind
declare void @free(i8*) #5

define internal void @_GLOBAL__I_a() section ".text.startup" {
  call void @__cxx_global_var_init()
  ret void
}

attributes #0 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noreturn nounwind }
attributes #7 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}
