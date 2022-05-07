; ModuleID = 'nr_routines.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*
@.str = private unnamed_addr constant [37 x i8] c"Numerical Recipes run-time error...\0A\00", align 1
@.str1 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str2 = private unnamed_addr constant [29 x i8] c"...now exiting to system...\0A\00", align 1
@.str3 = private unnamed_addr constant [26 x i8] c"gaussj: Singular Matrix-1\00", align 1
@.str4 = private unnamed_addr constant [26 x i8] c"gaussj: Singular Matrix-2\00", align 1
@.str5 = private unnamed_addr constant [32 x i8] c"allocation failure in ivector()\00", align 1
@.str6 = private unnamed_addr constant [32 x i8] c"allocation failure in dvector()\00", align 1
@.str7 = private unnamed_addr constant [34 x i8] c"allocation failure 1 in dmatrix()\00", align 1
@.str8 = private unnamed_addr constant [34 x i8] c"allocation failure 2 in dmatrix()\00", align 1

; Function Attrs: uwtable
define void @_Z7nrerrorPKc(i8* %error_text) #0 {
  %1 = alloca i8*, align 8
  store i8* %error_text, i8** %1, align 8
  %2 = load %struct._IO_FILE** @stderr, align 8
  %3 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([37 x i8]* @.str, i32 0, i32 0))
  %4 = load %struct._IO_FILE** @stderr, align 8
  %5 = load i8** %1, align 8
  %6 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i8* %5)
  %7 = load %struct._IO_FILE** @stderr, align 8
  %8 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([29 x i8]* @.str2, i32 0, i32 0))
  call void @exit(i32 1) #6
  unreachable
                                                  ; No predecessors!
  ret void
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: nounwind uwtable
define i32 @_Z6choldcPPdi(double** %a, i32 %n) #3 {
  %1 = alloca i32, align 4
  %2 = alloca double**, align 8
  %3 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %sum = alloca double, align 8
  store double** %a, double*** %2, align 8
  store i32 %n, i32* %3, align 4
  store i32 1, i32* %i, align 4
  br label %4

; <label>:4                                       ; preds = %98, %0
  %5 = load i32* %i, align 4
  %6 = load i32* %3, align 4
  %7 = icmp sle i32 %5, %6
  br i1 %7, label %8, label %101

; <label>:8                                       ; preds = %4
  %9 = load i32* %i, align 4
  store i32 %9, i32* %j, align 4
  br label %10

; <label>:10                                      ; preds = %94, %8
  %11 = load i32* %j, align 4
  %12 = load i32* %3, align 4
  %13 = icmp sle i32 %11, %12
  br i1 %13, label %14, label %97

; <label>:14                                      ; preds = %10
  %15 = load i32* %j, align 4
  %16 = sext i32 %15 to i64
  %17 = load i32* %i, align 4
  %18 = sext i32 %17 to i64
  %19 = load double*** %2, align 8
  %20 = getelementptr inbounds double** %19, i64 %18
  %21 = load double** %20, align 8
  %22 = getelementptr inbounds double* %21, i64 %16
  %23 = load double* %22, align 8
  store double %23, double* %sum, align 8
  %24 = load i32* %i, align 4
  %25 = sub nsw i32 %24, 1
  store i32 %25, i32* %k, align 4
  br label %26

; <label>:26                                      ; preds = %51, %14
  %27 = load i32* %k, align 4
  %28 = icmp sge i32 %27, 1
  br i1 %28, label %29, label %54

; <label>:29                                      ; preds = %26
  %30 = load i32* %k, align 4
  %31 = sext i32 %30 to i64
  %32 = load i32* %i, align 4
  %33 = sext i32 %32 to i64
  %34 = load double*** %2, align 8
  %35 = getelementptr inbounds double** %34, i64 %33
  %36 = load double** %35, align 8
  %37 = getelementptr inbounds double* %36, i64 %31
  %38 = load double* %37, align 8
  %39 = load i32* %k, align 4
  %40 = sext i32 %39 to i64
  %41 = load i32* %j, align 4
  %42 = sext i32 %41 to i64
  %43 = load double*** %2, align 8
  %44 = getelementptr inbounds double** %43, i64 %42
  %45 = load double** %44, align 8
  %46 = getelementptr inbounds double* %45, i64 %40
  %47 = load double* %46, align 8
  %48 = fmul double %38, %47
  %49 = load double* %sum, align 8
  %50 = fsub double %49, %48
  store double %50, double* %sum, align 8
  br label %51

; <label>:51                                      ; preds = %29
  %52 = load i32* %k, align 4
  %53 = add nsw i32 %52, -1
  store i32 %53, i32* %k, align 4
  br label %26

; <label>:54                                      ; preds = %26
  %55 = load i32* %i, align 4
  %56 = load i32* %j, align 4
  %57 = icmp eq i32 %55, %56
  br i1 %57, label %58, label %73

; <label>:58                                      ; preds = %54
  %59 = load double* %sum, align 8
  %60 = fcmp ole double %59, 0.000000e+00
  br i1 %60, label %61, label %62

; <label>:61                                      ; preds = %58
  store i32 0, i32* %1
  br label %131

; <label>:62                                      ; preds = %58
  %63 = load double* %sum, align 8
  %64 = call double @sqrt(double %63) #7
  %65 = load i32* %i, align 4
  %66 = sext i32 %65 to i64
  %67 = load i32* %i, align 4
  %68 = sext i32 %67 to i64
  %69 = load double*** %2, align 8
  %70 = getelementptr inbounds double** %69, i64 %68
  %71 = load double** %70, align 8
  %72 = getelementptr inbounds double* %71, i64 %66
  store double %64, double* %72, align 8
  br label %93

; <label>:73                                      ; preds = %54
  %74 = load double* %sum, align 8
  %75 = load i32* %i, align 4
  %76 = sext i32 %75 to i64
  %77 = load i32* %i, align 4
  %78 = sext i32 %77 to i64
  %79 = load double*** %2, align 8
  %80 = getelementptr inbounds double** %79, i64 %78
  %81 = load double** %80, align 8
  %82 = getelementptr inbounds double* %81, i64 %76
  %83 = load double* %82, align 8
  %84 = fdiv double %74, %83
  %85 = load i32* %i, align 4
  %86 = sext i32 %85 to i64
  %87 = load i32* %j, align 4
  %88 = sext i32 %87 to i64
  %89 = load double*** %2, align 8
  %90 = getelementptr inbounds double** %89, i64 %88
  %91 = load double** %90, align 8
  %92 = getelementptr inbounds double* %91, i64 %86
  store double %84, double* %92, align 8
  br label %93

; <label>:93                                      ; preds = %73, %62
  br label %94

; <label>:94                                      ; preds = %93
  %95 = load i32* %j, align 4
  %96 = add nsw i32 %95, 1
  store i32 %96, i32* %j, align 4
  br label %10

; <label>:97                                      ; preds = %10
  br label %98

; <label>:98                                      ; preds = %97
  %99 = load i32* %i, align 4
  %100 = add nsw i32 %99, 1
  store i32 %100, i32* %i, align 4
  br label %4

; <label>:101                                     ; preds = %4
  store i32 1, i32* %i, align 4
  br label %102

; <label>:102                                     ; preds = %127, %101
  %103 = load i32* %i, align 4
  %104 = load i32* %3, align 4
  %105 = sub nsw i32 %104, 1
  %106 = icmp sle i32 %103, %105
  br i1 %106, label %107, label %130

; <label>:107                                     ; preds = %102
  %108 = load i32* %i, align 4
  %109 = add nsw i32 %108, 1
  store i32 %109, i32* %j, align 4
  br label %110

; <label>:110                                     ; preds = %123, %107
  %111 = load i32* %j, align 4
  %112 = load i32* %3, align 4
  %113 = icmp sle i32 %111, %112
  br i1 %113, label %114, label %126

; <label>:114                                     ; preds = %110
  %115 = load i32* %j, align 4
  %116 = sext i32 %115 to i64
  %117 = load i32* %i, align 4
  %118 = sext i32 %117 to i64
  %119 = load double*** %2, align 8
  %120 = getelementptr inbounds double** %119, i64 %118
  %121 = load double** %120, align 8
  %122 = getelementptr inbounds double* %121, i64 %116
  store double 0.000000e+00, double* %122, align 8
  br label %123

; <label>:123                                     ; preds = %114
  %124 = load i32* %j, align 4
  %125 = add nsw i32 %124, 1
  store i32 %125, i32* %j, align 4
  br label %110

; <label>:126                                     ; preds = %110
  br label %127

; <label>:127                                     ; preds = %126
  %128 = load i32* %i, align 4
  %129 = add nsw i32 %128, 1
  store i32 %129, i32* %i, align 4
  br label %102

; <label>:130                                     ; preds = %102
  store i32 1, i32* %1
  br label %131

; <label>:131                                     ; preds = %130, %61
  %132 = load i32* %1
  ret i32 %132
}

; Function Attrs: nounwind
declare double @sqrt(double) #4

; Function Attrs: uwtable
define void @_Z6gaussjPPdiS0_i(double** %a, i32 %n, double** %b, i32 %m) #0 {
  %1 = alloca double**, align 8
  %2 = alloca i32, align 4
  %3 = alloca double**, align 8
  %4 = alloca i32, align 4
  %indxc = alloca i32*, align 8
  %indxr = alloca i32*, align 8
  %ipiv = alloca i32*, align 8
  %i = alloca i32, align 4
  %icol = alloca i32, align 4
  %irow = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %ll = alloca i32, align 4
  %big = alloca double, align 8
  %dum = alloca double, align 8
  %pivinv = alloca double, align 8
  %temp = alloca double, align 8
  store double** %a, double*** %1, align 8
  store i32 %n, i32* %2, align 4
  store double** %b, double*** %3, align 8
  store i32 %m, i32* %4, align 4
  %5 = load i32* %2, align 4
  %6 = sext i32 %5 to i64
  %7 = call i32* @_Z7ivectorll(i64 1, i64 %6)
  store i32* %7, i32** %indxc, align 8
  %8 = load i32* %2, align 4
  %9 = sext i32 %8 to i64
  %10 = call i32* @_Z7ivectorll(i64 1, i64 %9)
  store i32* %10, i32** %indxr, align 8
  %11 = load i32* %2, align 4
  %12 = sext i32 %11 to i64
  %13 = call i32* @_Z7ivectorll(i64 1, i64 %12)
  store i32* %13, i32** %ipiv, align 8
  store i32 -1, i32* %icol, align 4
  store i32 -1, i32* %irow, align 4
  store i32 1, i32* %j, align 4
  br label %14

; <label>:14                                      ; preds = %23, %0
  %15 = load i32* %j, align 4
  %16 = load i32* %2, align 4
  %17 = icmp sle i32 %15, %16
  br i1 %17, label %18, label %26

; <label>:18                                      ; preds = %14
  %19 = load i32* %j, align 4
  %20 = sext i32 %19 to i64
  %21 = load i32** %ipiv, align 8
  %22 = getelementptr inbounds i32* %21, i64 %20
  store i32 0, i32* %22, align 4
  br label %23

; <label>:23                                      ; preds = %18
  %24 = load i32* %j, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, i32* %j, align 4
  br label %14

; <label>:26                                      ; preds = %14
  store i32 1, i32* %i, align 4
  br label %27

; <label>:27                                      ; preds = %371, %26
  %28 = load i32* %i, align 4
  %29 = load i32* %2, align 4
  %30 = icmp sle i32 %28, %29
  br i1 %30, label %31, label %374

; <label>:31                                      ; preds = %27
  store double 0.000000e+00, double* %big, align 8
  store i32 1, i32* %j, align 4
  br label %32

; <label>:32                                      ; preds = %97, %31
  %33 = load i32* %j, align 4
  %34 = load i32* %2, align 4
  %35 = icmp sle i32 %33, %34
  br i1 %35, label %36, label %100

; <label>:36                                      ; preds = %32
  %37 = load i32* %j, align 4
  %38 = sext i32 %37 to i64
  %39 = load i32** %ipiv, align 8
  %40 = getelementptr inbounds i32* %39, i64 %38
  %41 = load i32* %40, align 4
  %42 = icmp ne i32 %41, 1
  br i1 %42, label %43, label %96

; <label>:43                                      ; preds = %36
  store i32 1, i32* %k, align 4
  br label %44

; <label>:44                                      ; preds = %92, %43
  %45 = load i32* %k, align 4
  %46 = load i32* %2, align 4
  %47 = icmp sle i32 %45, %46
  br i1 %47, label %48, label %95

; <label>:48                                      ; preds = %44
  %49 = load i32* %k, align 4
  %50 = sext i32 %49 to i64
  %51 = load i32** %ipiv, align 8
  %52 = getelementptr inbounds i32* %51, i64 %50
  %53 = load i32* %52, align 4
  %54 = icmp eq i32 %53, 0
  br i1 %54, label %55, label %82

; <label>:55                                      ; preds = %48
  %56 = load i32* %k, align 4
  %57 = sext i32 %56 to i64
  %58 = load i32* %j, align 4
  %59 = sext i32 %58 to i64
  %60 = load double*** %1, align 8
  %61 = getelementptr inbounds double** %60, i64 %59
  %62 = load double** %61, align 8
  %63 = getelementptr inbounds double* %62, i64 %57
  %64 = load double* %63, align 8
  %65 = call double @fabs(double %64) #8
  %66 = load double* %big, align 8
  %67 = fcmp oge double %65, %66
  br i1 %67, label %68, label %81

; <label>:68                                      ; preds = %55
  %69 = load i32* %k, align 4
  %70 = sext i32 %69 to i64
  %71 = load i32* %j, align 4
  %72 = sext i32 %71 to i64
  %73 = load double*** %1, align 8
  %74 = getelementptr inbounds double** %73, i64 %72
  %75 = load double** %74, align 8
  %76 = getelementptr inbounds double* %75, i64 %70
  %77 = load double* %76, align 8
  %78 = call double @fabs(double %77) #8
  store double %78, double* %big, align 8
  %79 = load i32* %j, align 4
  store i32 %79, i32* %irow, align 4
  %80 = load i32* %k, align 4
  store i32 %80, i32* %icol, align 4
  br label %81

; <label>:81                                      ; preds = %68, %55
  br label %91

; <label>:82                                      ; preds = %48
  %83 = load i32* %k, align 4
  %84 = sext i32 %83 to i64
  %85 = load i32** %ipiv, align 8
  %86 = getelementptr inbounds i32* %85, i64 %84
  %87 = load i32* %86, align 4
  %88 = icmp sgt i32 %87, 1
  br i1 %88, label %89, label %90

; <label>:89                                      ; preds = %82
  call void @_Z7nrerrorPKc(i8* getelementptr inbounds ([26 x i8]* @.str3, i32 0, i32 0))
  br label %90

; <label>:90                                      ; preds = %89, %82
  br label %91

; <label>:91                                      ; preds = %90, %81
  br label %92

; <label>:92                                      ; preds = %91
  %93 = load i32* %k, align 4
  %94 = add nsw i32 %93, 1
  store i32 %94, i32* %k, align 4
  br label %44

; <label>:95                                      ; preds = %44
  br label %96

; <label>:96                                      ; preds = %95, %36
  br label %97

; <label>:97                                      ; preds = %96
  %98 = load i32* %j, align 4
  %99 = add nsw i32 %98, 1
  store i32 %99, i32* %j, align 4
  br label %32

; <label>:100                                     ; preds = %32
  %101 = load i32* %icol, align 4
  %102 = sext i32 %101 to i64
  %103 = load i32** %ipiv, align 8
  %104 = getelementptr inbounds i32* %103, i64 %102
  %105 = load i32* %104, align 4
  %106 = add nsw i32 %105, 1
  store i32 %106, i32* %104, align 4
  %107 = load i32* %irow, align 4
  %108 = load i32* %icol, align 4
  %109 = icmp ne i32 %107, %108
  br i1 %109, label %110, label %199

; <label>:110                                     ; preds = %100
  store i32 1, i32* %l, align 4
  br label %111

; <label>:111                                     ; preds = %151, %110
  %112 = load i32* %l, align 4
  %113 = load i32* %2, align 4
  %114 = icmp sle i32 %112, %113
  br i1 %114, label %115, label %154

; <label>:115                                     ; preds = %111
  %116 = load i32* %l, align 4
  %117 = sext i32 %116 to i64
  %118 = load i32* %irow, align 4
  %119 = sext i32 %118 to i64
  %120 = load double*** %1, align 8
  %121 = getelementptr inbounds double** %120, i64 %119
  %122 = load double** %121, align 8
  %123 = getelementptr inbounds double* %122, i64 %117
  %124 = load double* %123, align 8
  store double %124, double* %temp, align 8
  %125 = load i32* %l, align 4
  %126 = sext i32 %125 to i64
  %127 = load i32* %icol, align 4
  %128 = sext i32 %127 to i64
  %129 = load double*** %1, align 8
  %130 = getelementptr inbounds double** %129, i64 %128
  %131 = load double** %130, align 8
  %132 = getelementptr inbounds double* %131, i64 %126
  %133 = load double* %132, align 8
  %134 = load i32* %l, align 4
  %135 = sext i32 %134 to i64
  %136 = load i32* %irow, align 4
  %137 = sext i32 %136 to i64
  %138 = load double*** %1, align 8
  %139 = getelementptr inbounds double** %138, i64 %137
  %140 = load double** %139, align 8
  %141 = getelementptr inbounds double* %140, i64 %135
  store double %133, double* %141, align 8
  %142 = load double* %temp, align 8
  %143 = load i32* %l, align 4
  %144 = sext i32 %143 to i64
  %145 = load i32* %icol, align 4
  %146 = sext i32 %145 to i64
  %147 = load double*** %1, align 8
  %148 = getelementptr inbounds double** %147, i64 %146
  %149 = load double** %148, align 8
  %150 = getelementptr inbounds double* %149, i64 %144
  store double %142, double* %150, align 8
  br label %151

; <label>:151                                     ; preds = %115
  %152 = load i32* %l, align 4
  %153 = add nsw i32 %152, 1
  store i32 %153, i32* %l, align 4
  br label %111

; <label>:154                                     ; preds = %111
  store i32 1, i32* %l, align 4
  br label %155

; <label>:155                                     ; preds = %195, %154
  %156 = load i32* %l, align 4
  %157 = load i32* %4, align 4
  %158 = icmp sle i32 %156, %157
  br i1 %158, label %159, label %198

; <label>:159                                     ; preds = %155
  %160 = load i32* %l, align 4
  %161 = sext i32 %160 to i64
  %162 = load i32* %irow, align 4
  %163 = sext i32 %162 to i64
  %164 = load double*** %3, align 8
  %165 = getelementptr inbounds double** %164, i64 %163
  %166 = load double** %165, align 8
  %167 = getelementptr inbounds double* %166, i64 %161
  %168 = load double* %167, align 8
  store double %168, double* %temp, align 8
  %169 = load i32* %l, align 4
  %170 = sext i32 %169 to i64
  %171 = load i32* %icol, align 4
  %172 = sext i32 %171 to i64
  %173 = load double*** %3, align 8
  %174 = getelementptr inbounds double** %173, i64 %172
  %175 = load double** %174, align 8
  %176 = getelementptr inbounds double* %175, i64 %170
  %177 = load double* %176, align 8
  %178 = load i32* %l, align 4
  %179 = sext i32 %178 to i64
  %180 = load i32* %irow, align 4
  %181 = sext i32 %180 to i64
  %182 = load double*** %3, align 8
  %183 = getelementptr inbounds double** %182, i64 %181
  %184 = load double** %183, align 8
  %185 = getelementptr inbounds double* %184, i64 %179
  store double %177, double* %185, align 8
  %186 = load double* %temp, align 8
  %187 = load i32* %l, align 4
  %188 = sext i32 %187 to i64
  %189 = load i32* %icol, align 4
  %190 = sext i32 %189 to i64
  %191 = load double*** %3, align 8
  %192 = getelementptr inbounds double** %191, i64 %190
  %193 = load double** %192, align 8
  %194 = getelementptr inbounds double* %193, i64 %188
  store double %186, double* %194, align 8
  br label %195

; <label>:195                                     ; preds = %159
  %196 = load i32* %l, align 4
  %197 = add nsw i32 %196, 1
  store i32 %197, i32* %l, align 4
  br label %155

; <label>:198                                     ; preds = %155
  br label %199

; <label>:199                                     ; preds = %198, %100
  %200 = load i32* %irow, align 4
  %201 = load i32* %i, align 4
  %202 = sext i32 %201 to i64
  %203 = load i32** %indxr, align 8
  %204 = getelementptr inbounds i32* %203, i64 %202
  store i32 %200, i32* %204, align 4
  %205 = load i32* %icol, align 4
  %206 = load i32* %i, align 4
  %207 = sext i32 %206 to i64
  %208 = load i32** %indxc, align 8
  %209 = getelementptr inbounds i32* %208, i64 %207
  store i32 %205, i32* %209, align 4
  %210 = load i32* %icol, align 4
  %211 = sext i32 %210 to i64
  %212 = load i32* %icol, align 4
  %213 = sext i32 %212 to i64
  %214 = load double*** %1, align 8
  %215 = getelementptr inbounds double** %214, i64 %213
  %216 = load double** %215, align 8
  %217 = getelementptr inbounds double* %216, i64 %211
  %218 = load double* %217, align 8
  %219 = fcmp oeq double %218, 0.000000e+00
  br i1 %219, label %220, label %221

; <label>:220                                     ; preds = %199
  call void @_Z7nrerrorPKc(i8* getelementptr inbounds ([26 x i8]* @.str4, i32 0, i32 0))
  br label %221

; <label>:221                                     ; preds = %220, %199
  %222 = load i32* %icol, align 4
  %223 = sext i32 %222 to i64
  %224 = load i32* %icol, align 4
  %225 = sext i32 %224 to i64
  %226 = load double*** %1, align 8
  %227 = getelementptr inbounds double** %226, i64 %225
  %228 = load double** %227, align 8
  %229 = getelementptr inbounds double* %228, i64 %223
  %230 = load double* %229, align 8
  %231 = fdiv double 1.000000e+00, %230
  store double %231, double* %pivinv, align 8
  %232 = load i32* %icol, align 4
  %233 = sext i32 %232 to i64
  %234 = load i32* %icol, align 4
  %235 = sext i32 %234 to i64
  %236 = load double*** %1, align 8
  %237 = getelementptr inbounds double** %236, i64 %235
  %238 = load double** %237, align 8
  %239 = getelementptr inbounds double* %238, i64 %233
  store double 1.000000e+00, double* %239, align 8
  store i32 1, i32* %l, align 4
  br label %240

; <label>:240                                     ; preds = %256, %221
  %241 = load i32* %l, align 4
  %242 = load i32* %2, align 4
  %243 = icmp sle i32 %241, %242
  br i1 %243, label %244, label %259

; <label>:244                                     ; preds = %240
  %245 = load double* %pivinv, align 8
  %246 = load i32* %l, align 4
  %247 = sext i32 %246 to i64
  %248 = load i32* %icol, align 4
  %249 = sext i32 %248 to i64
  %250 = load double*** %1, align 8
  %251 = getelementptr inbounds double** %250, i64 %249
  %252 = load double** %251, align 8
  %253 = getelementptr inbounds double* %252, i64 %247
  %254 = load double* %253, align 8
  %255 = fmul double %254, %245
  store double %255, double* %253, align 8
  br label %256

; <label>:256                                     ; preds = %244
  %257 = load i32* %l, align 4
  %258 = add nsw i32 %257, 1
  store i32 %258, i32* %l, align 4
  br label %240

; <label>:259                                     ; preds = %240
  store i32 1, i32* %l, align 4
  br label %260

; <label>:260                                     ; preds = %276, %259
  %261 = load i32* %l, align 4
  %262 = load i32* %4, align 4
  %263 = icmp sle i32 %261, %262
  br i1 %263, label %264, label %279

; <label>:264                                     ; preds = %260
  %265 = load double* %pivinv, align 8
  %266 = load i32* %l, align 4
  %267 = sext i32 %266 to i64
  %268 = load i32* %icol, align 4
  %269 = sext i32 %268 to i64
  %270 = load double*** %3, align 8
  %271 = getelementptr inbounds double** %270, i64 %269
  %272 = load double** %271, align 8
  %273 = getelementptr inbounds double* %272, i64 %267
  %274 = load double* %273, align 8
  %275 = fmul double %274, %265
  store double %275, double* %273, align 8
  br label %276

; <label>:276                                     ; preds = %264
  %277 = load i32* %l, align 4
  %278 = add nsw i32 %277, 1
  store i32 %278, i32* %l, align 4
  br label %260

; <label>:279                                     ; preds = %260
  store i32 1, i32* %ll, align 4
  br label %280

; <label>:280                                     ; preds = %367, %279
  %281 = load i32* %ll, align 4
  %282 = load i32* %2, align 4
  %283 = icmp sle i32 %281, %282
  br i1 %283, label %284, label %370

; <label>:284                                     ; preds = %280
  %285 = load i32* %ll, align 4
  %286 = load i32* %icol, align 4
  %287 = icmp ne i32 %285, %286
  br i1 %287, label %288, label %366

; <label>:288                                     ; preds = %284
  %289 = load i32* %icol, align 4
  %290 = sext i32 %289 to i64
  %291 = load i32* %ll, align 4
  %292 = sext i32 %291 to i64
  %293 = load double*** %1, align 8
  %294 = getelementptr inbounds double** %293, i64 %292
  %295 = load double** %294, align 8
  %296 = getelementptr inbounds double* %295, i64 %290
  %297 = load double* %296, align 8
  store double %297, double* %dum, align 8
  %298 = load i32* %icol, align 4
  %299 = sext i32 %298 to i64
  %300 = load i32* %ll, align 4
  %301 = sext i32 %300 to i64
  %302 = load double*** %1, align 8
  %303 = getelementptr inbounds double** %302, i64 %301
  %304 = load double** %303, align 8
  %305 = getelementptr inbounds double* %304, i64 %299
  store double 0.000000e+00, double* %305, align 8
  store i32 1, i32* %l, align 4
  br label %306

; <label>:306                                     ; preds = %332, %288
  %307 = load i32* %l, align 4
  %308 = load i32* %2, align 4
  %309 = icmp sle i32 %307, %308
  br i1 %309, label %310, label %335

; <label>:310                                     ; preds = %306
  %311 = load i32* %l, align 4
  %312 = sext i32 %311 to i64
  %313 = load i32* %icol, align 4
  %314 = sext i32 %313 to i64
  %315 = load double*** %1, align 8
  %316 = getelementptr inbounds double** %315, i64 %314
  %317 = load double** %316, align 8
  %318 = getelementptr inbounds double* %317, i64 %312
  %319 = load double* %318, align 8
  %320 = load double* %dum, align 8
  %321 = fmul double %319, %320
  %322 = load i32* %l, align 4
  %323 = sext i32 %322 to i64
  %324 = load i32* %ll, align 4
  %325 = sext i32 %324 to i64
  %326 = load double*** %1, align 8
  %327 = getelementptr inbounds double** %326, i64 %325
  %328 = load double** %327, align 8
  %329 = getelementptr inbounds double* %328, i64 %323
  %330 = load double* %329, align 8
  %331 = fsub double %330, %321
  store double %331, double* %329, align 8
  br label %332

; <label>:332                                     ; preds = %310
  %333 = load i32* %l, align 4
  %334 = add nsw i32 %333, 1
  store i32 %334, i32* %l, align 4
  br label %306

; <label>:335                                     ; preds = %306
  store i32 1, i32* %l, align 4
  br label %336

; <label>:336                                     ; preds = %362, %335
  %337 = load i32* %l, align 4
  %338 = load i32* %4, align 4
  %339 = icmp sle i32 %337, %338
  br i1 %339, label %340, label %365

; <label>:340                                     ; preds = %336
  %341 = load i32* %l, align 4
  %342 = sext i32 %341 to i64
  %343 = load i32* %icol, align 4
  %344 = sext i32 %343 to i64
  %345 = load double*** %3, align 8
  %346 = getelementptr inbounds double** %345, i64 %344
  %347 = load double** %346, align 8
  %348 = getelementptr inbounds double* %347, i64 %342
  %349 = load double* %348, align 8
  %350 = load double* %dum, align 8
  %351 = fmul double %349, %350
  %352 = load i32* %l, align 4
  %353 = sext i32 %352 to i64
  %354 = load i32* %ll, align 4
  %355 = sext i32 %354 to i64
  %356 = load double*** %3, align 8
  %357 = getelementptr inbounds double** %356, i64 %355
  %358 = load double** %357, align 8
  %359 = getelementptr inbounds double* %358, i64 %353
  %360 = load double* %359, align 8
  %361 = fsub double %360, %351
  store double %361, double* %359, align 8
  br label %362

; <label>:362                                     ; preds = %340
  %363 = load i32* %l, align 4
  %364 = add nsw i32 %363, 1
  store i32 %364, i32* %l, align 4
  br label %336

; <label>:365                                     ; preds = %336
  br label %366

; <label>:366                                     ; preds = %365, %284
  br label %367

; <label>:367                                     ; preds = %366
  %368 = load i32* %ll, align 4
  %369 = add nsw i32 %368, 1
  store i32 %369, i32* %ll, align 4
  br label %280

; <label>:370                                     ; preds = %280
  br label %371

; <label>:371                                     ; preds = %370
  %372 = load i32* %i, align 4
  %373 = add nsw i32 %372, 1
  store i32 %373, i32* %i, align 4
  br label %27

; <label>:374                                     ; preds = %27
  %375 = load i32* %2, align 4
  store i32 %375, i32* %l, align 4
  br label %376

; <label>:376                                     ; preds = %453, %374
  %377 = load i32* %l, align 4
  %378 = icmp sge i32 %377, 1
  br i1 %378, label %379, label %456

; <label>:379                                     ; preds = %376
  %380 = load i32* %l, align 4
  %381 = sext i32 %380 to i64
  %382 = load i32** %indxr, align 8
  %383 = getelementptr inbounds i32* %382, i64 %381
  %384 = load i32* %383, align 4
  %385 = load i32* %l, align 4
  %386 = sext i32 %385 to i64
  %387 = load i32** %indxc, align 8
  %388 = getelementptr inbounds i32* %387, i64 %386
  %389 = load i32* %388, align 4
  %390 = icmp ne i32 %384, %389
  br i1 %390, label %391, label %452

; <label>:391                                     ; preds = %379
  store i32 1, i32* %k, align 4
  br label %392

; <label>:392                                     ; preds = %448, %391
  %393 = load i32* %k, align 4
  %394 = load i32* %2, align 4
  %395 = icmp sle i32 %393, %394
  br i1 %395, label %396, label %451

; <label>:396                                     ; preds = %392
  %397 = load i32* %l, align 4
  %398 = sext i32 %397 to i64
  %399 = load i32** %indxr, align 8
  %400 = getelementptr inbounds i32* %399, i64 %398
  %401 = load i32* %400, align 4
  %402 = sext i32 %401 to i64
  %403 = load i32* %k, align 4
  %404 = sext i32 %403 to i64
  %405 = load double*** %1, align 8
  %406 = getelementptr inbounds double** %405, i64 %404
  %407 = load double** %406, align 8
  %408 = getelementptr inbounds double* %407, i64 %402
  %409 = load double* %408, align 8
  store double %409, double* %temp, align 8
  %410 = load i32* %l, align 4
  %411 = sext i32 %410 to i64
  %412 = load i32** %indxc, align 8
  %413 = getelementptr inbounds i32* %412, i64 %411
  %414 = load i32* %413, align 4
  %415 = sext i32 %414 to i64
  %416 = load i32* %k, align 4
  %417 = sext i32 %416 to i64
  %418 = load double*** %1, align 8
  %419 = getelementptr inbounds double** %418, i64 %417
  %420 = load double** %419, align 8
  %421 = getelementptr inbounds double* %420, i64 %415
  %422 = load double* %421, align 8
  %423 = load i32* %l, align 4
  %424 = sext i32 %423 to i64
  %425 = load i32** %indxr, align 8
  %426 = getelementptr inbounds i32* %425, i64 %424
  %427 = load i32* %426, align 4
  %428 = sext i32 %427 to i64
  %429 = load i32* %k, align 4
  %430 = sext i32 %429 to i64
  %431 = load double*** %1, align 8
  %432 = getelementptr inbounds double** %431, i64 %430
  %433 = load double** %432, align 8
  %434 = getelementptr inbounds double* %433, i64 %428
  store double %422, double* %434, align 8
  %435 = load double* %temp, align 8
  %436 = load i32* %l, align 4
  %437 = sext i32 %436 to i64
  %438 = load i32** %indxc, align 8
  %439 = getelementptr inbounds i32* %438, i64 %437
  %440 = load i32* %439, align 4
  %441 = sext i32 %440 to i64
  %442 = load i32* %k, align 4
  %443 = sext i32 %442 to i64
  %444 = load double*** %1, align 8
  %445 = getelementptr inbounds double** %444, i64 %443
  %446 = load double** %445, align 8
  %447 = getelementptr inbounds double* %446, i64 %441
  store double %435, double* %447, align 8
  br label %448

; <label>:448                                     ; preds = %396
  %449 = load i32* %k, align 4
  %450 = add nsw i32 %449, 1
  store i32 %450, i32* %k, align 4
  br label %392

; <label>:451                                     ; preds = %392
  br label %452

; <label>:452                                     ; preds = %451, %379
  br label %453

; <label>:453                                     ; preds = %452
  %454 = load i32* %l, align 4
  %455 = add nsw i32 %454, -1
  store i32 %455, i32* %l, align 4
  br label %376

; <label>:456                                     ; preds = %376
  %457 = load i32** %ipiv, align 8
  %458 = load i32* %2, align 4
  %459 = sext i32 %458 to i64
  call void @_Z12free_ivectorPill(i32* %457, i64 1, i64 %459)
  %460 = load i32** %indxr, align 8
  %461 = load i32* %2, align 4
  %462 = sext i32 %461 to i64
  call void @_Z12free_ivectorPill(i32* %460, i64 1, i64 %462)
  %463 = load i32** %indxc, align 8
  %464 = load i32* %2, align 4
  %465 = sext i32 %464 to i64
  call void @_Z12free_ivectorPill(i32* %463, i64 1, i64 %465)
  ret void
}

; Function Attrs: uwtable
define i32* @_Z7ivectorll(i64 %nl, i64 %nh) #0 {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  %v = alloca i32*, align 8
  store i64 %nl, i64* %1, align 8
  store i64 %nh, i64* %2, align 8
  %3 = load i64* %2, align 8
  %4 = load i64* %1, align 8
  %5 = sub nsw i64 %3, %4
  %6 = add nsw i64 %5, 2
  %7 = mul i64 %6, 4
  %8 = call noalias i8* @malloc(i64 %7) #7
  %9 = bitcast i8* %8 to i32*
  store i32* %9, i32** %v, align 8
  %10 = load i32** %v, align 8
  %11 = icmp ne i32* %10, null
  br i1 %11, label %13, label %12

; <label>:12                                      ; preds = %0
  call void @_Z7nrerrorPKc(i8* getelementptr inbounds ([32 x i8]* @.str5, i32 0, i32 0))
  br label %13

; <label>:13                                      ; preds = %12, %0
  %14 = load i32** %v, align 8
  %15 = load i64* %1, align 8
  %16 = sub i64 0, %15
  %17 = getelementptr inbounds i32* %14, i64 %16
  %18 = getelementptr inbounds i32* %17, i64 1
  ret i32* %18
}

; Function Attrs: nounwind readnone
declare double @fabs(double) #5

; Function Attrs: nounwind uwtable
define void @_Z12free_ivectorPill(i32* %v, i64 %nl, i64 %nh) #3 {
  %1 = alloca i32*, align 8
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  store i32* %v, i32** %1, align 8
  store i64 %nl, i64* %2, align 8
  store i64 %nh, i64* %3, align 8
  %4 = load i32** %1, align 8
  %5 = load i64* %2, align 8
  %6 = getelementptr inbounds i32* %4, i64 %5
  %7 = getelementptr inbounds i32* %6, i64 -1
  %8 = bitcast i32* %7 to i8*
  call void @free(i8* %8) #7
  ret void
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #4

; Function Attrs: nounwind
declare void @free(i8*) #4

; Function Attrs: uwtable
define double* @_Z7dvectorll(i64 %nl, i64 %nh) #0 {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  %v = alloca double*, align 8
  store i64 %nl, i64* %1, align 8
  store i64 %nh, i64* %2, align 8
  %3 = load i64* %2, align 8
  %4 = load i64* %1, align 8
  %5 = sub nsw i64 %3, %4
  %6 = add nsw i64 %5, 2
  %7 = mul i64 %6, 8
  %8 = call noalias i8* @malloc(i64 %7) #7
  %9 = bitcast i8* %8 to double*
  store double* %9, double** %v, align 8
  %10 = load double** %v, align 8
  %11 = icmp ne double* %10, null
  br i1 %11, label %13, label %12

; <label>:12                                      ; preds = %0
  call void @_Z7nrerrorPKc(i8* getelementptr inbounds ([32 x i8]* @.str6, i32 0, i32 0))
  br label %13

; <label>:13                                      ; preds = %12, %0
  %14 = load double** %v, align 8
  %15 = load i64* %1, align 8
  %16 = sub i64 0, %15
  %17 = getelementptr inbounds double* %14, i64 %16
  %18 = getelementptr inbounds double* %17, i64 1
  ret double* %18
}

; Function Attrs: nounwind uwtable
define void @_Z12free_dvectorPdll(double* %v, i64 %nl, i64 %nh) #3 {
  %1 = alloca double*, align 8
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  store double* %v, double** %1, align 8
  store i64 %nl, i64* %2, align 8
  store i64 %nh, i64* %3, align 8
  %4 = load double** %1, align 8
  %5 = load i64* %2, align 8
  %6 = getelementptr inbounds double* %4, i64 %5
  %7 = getelementptr inbounds double* %6, i64 -1
  %8 = bitcast double* %7 to i8*
  call void @free(i8* %8) #7
  ret void
}

; Function Attrs: uwtable
define double** @_Z7dmatrixllll(i64 %nrl, i64 %nrh, i64 %ncl, i64 %nch) #0 {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %i = alloca i64, align 8
  %nrow = alloca i64, align 8
  %ncol = alloca i64, align 8
  %m = alloca double**, align 8
  store i64 %nrl, i64* %1, align 8
  store i64 %nrh, i64* %2, align 8
  store i64 %ncl, i64* %3, align 8
  store i64 %nch, i64* %4, align 8
  %5 = load i64* %2, align 8
  %6 = load i64* %1, align 8
  %7 = sub nsw i64 %5, %6
  %8 = add nsw i64 %7, 1
  store i64 %8, i64* %nrow, align 8
  %9 = load i64* %4, align 8
  %10 = load i64* %3, align 8
  %11 = sub nsw i64 %9, %10
  %12 = add nsw i64 %11, 1
  store i64 %12, i64* %ncol, align 8
  %13 = load i64* %nrow, align 8
  %14 = add nsw i64 %13, 1
  %15 = mul i64 %14, 8
  %16 = call noalias i8* @malloc(i64 %15) #7
  %17 = bitcast i8* %16 to double**
  store double** %17, double*** %m, align 8
  %18 = load double*** %m, align 8
  %19 = icmp ne double** %18, null
  br i1 %19, label %21, label %20

; <label>:20                                      ; preds = %0
  call void @_Z7nrerrorPKc(i8* getelementptr inbounds ([34 x i8]* @.str7, i32 0, i32 0))
  br label %21

; <label>:21                                      ; preds = %20, %0
  %22 = load double*** %m, align 8
  %23 = getelementptr inbounds double** %22, i64 1
  store double** %23, double*** %m, align 8
  %24 = load i64* %1, align 8
  %25 = load double*** %m, align 8
  %26 = sub i64 0, %24
  %27 = getelementptr inbounds double** %25, i64 %26
  store double** %27, double*** %m, align 8
  %28 = load i64* %nrow, align 8
  %29 = load i64* %ncol, align 8
  %30 = mul nsw i64 %28, %29
  %31 = add nsw i64 %30, 1
  %32 = mul i64 %31, 8
  %33 = call noalias i8* @malloc(i64 %32) #7
  %34 = bitcast i8* %33 to double*
  %35 = load i64* %1, align 8
  %36 = load double*** %m, align 8
  %37 = getelementptr inbounds double** %36, i64 %35
  store double* %34, double** %37, align 8
  %38 = load i64* %1, align 8
  %39 = load double*** %m, align 8
  %40 = getelementptr inbounds double** %39, i64 %38
  %41 = load double** %40, align 8
  %42 = icmp ne double* %41, null
  br i1 %42, label %44, label %43

; <label>:43                                      ; preds = %21
  call void @_Z7nrerrorPKc(i8* getelementptr inbounds ([34 x i8]* @.str8, i32 0, i32 0))
  br label %44

; <label>:44                                      ; preds = %43, %21
  %45 = load i64* %1, align 8
  %46 = load double*** %m, align 8
  %47 = getelementptr inbounds double** %46, i64 %45
  %48 = load double** %47, align 8
  %49 = getelementptr inbounds double* %48, i64 1
  store double* %49, double** %47, align 8
  %50 = load i64* %3, align 8
  %51 = load i64* %1, align 8
  %52 = load double*** %m, align 8
  %53 = getelementptr inbounds double** %52, i64 %51
  %54 = load double** %53, align 8
  %55 = sub i64 0, %50
  %56 = getelementptr inbounds double* %54, i64 %55
  store double* %56, double** %53, align 8
  %57 = load i64* %1, align 8
  %58 = add nsw i64 %57, 1
  store i64 %58, i64* %i, align 8
  br label %59

; <label>:59                                      ; preds = %74, %44
  %60 = load i64* %i, align 8
  %61 = load i64* %2, align 8
  %62 = icmp sle i64 %60, %61
  br i1 %62, label %63, label %77

; <label>:63                                      ; preds = %59
  %64 = load i64* %i, align 8
  %65 = sub nsw i64 %64, 1
  %66 = load double*** %m, align 8
  %67 = getelementptr inbounds double** %66, i64 %65
  %68 = load double** %67, align 8
  %69 = load i64* %ncol, align 8
  %70 = getelementptr inbounds double* %68, i64 %69
  %71 = load i64* %i, align 8
  %72 = load double*** %m, align 8
  %73 = getelementptr inbounds double** %72, i64 %71
  store double* %70, double** %73, align 8
  br label %74

; <label>:74                                      ; preds = %63
  %75 = load i64* %i, align 8
  %76 = add nsw i64 %75, 1
  store i64 %76, i64* %i, align 8
  br label %59

; <label>:77                                      ; preds = %59
  %78 = load double*** %m, align 8
  ret double** %78
}

; Function Attrs: nounwind uwtable
define void @_Z12free_dmatrixPPdllll(double** %m, i64 %nrl, i64 %nrh, i64 %ncl, i64 %nch) #3 {
  %1 = alloca double**, align 8
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  store double** %m, double*** %1, align 8
  store i64 %nrl, i64* %2, align 8
  store i64 %nrh, i64* %3, align 8
  store i64 %ncl, i64* %4, align 8
  store i64 %nch, i64* %5, align 8
  %6 = load i64* %2, align 8
  %7 = load double*** %1, align 8
  %8 = getelementptr inbounds double** %7, i64 %6
  %9 = load double** %8, align 8
  %10 = load i64* %4, align 8
  %11 = getelementptr inbounds double* %9, i64 %10
  %12 = getelementptr inbounds double* %11, i64 -1
  %13 = bitcast double* %12 to i8*
  call void @free(i8* %13) #7
  %14 = load double*** %1, align 8
  %15 = load i64* %2, align 8
  %16 = getelementptr inbounds double** %14, i64 %15
  %17 = getelementptr inbounds double** %16, i64 -1
  %18 = bitcast double** %17 to i8*
  call void @free(i8* %18) #7
  ret void
}

attributes #0 = { uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noreturn nounwind }
attributes #7 = { nounwind }
attributes #8 = { nounwind readnone }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}
