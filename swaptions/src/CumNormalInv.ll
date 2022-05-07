; ModuleID = 'CumNormalInv.cpp'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@_ZL1a = internal global [4 x double] [double 0x40040D931B28620D, double 0xC0329D70AE54A3DE, double 0x4044B212C473C6FC, double 0xC03970E957377778], align 16
@_ZL1b = internal global [4 x double] [double 0xC020F2700655072D, double 0x403715579181502C, double 0xC0350FEF0701E57D, double 0x40090BF020558A47], align 16
@_ZL1c = internal global [9 x double] [double 0x3FD59932C3E40368, double 0x3FEF3CC6CF8BC12D, double 0x3FC4950726690682, double 0x3F9C4EAD73E44237, double 0x3F6F7643E53E6785, double 0x3F39E62EA0A98846, double 0x3F00DEB205F58208, double 0x3E9361D5709B7B56, double 0x3E9A93C50A02D5AD], align 16

; Function Attrs: nounwind uwtable
define double @_Z12CumNormalInvd(double %u) #0 {
  %1 = alloca double, align 8
  %2 = alloca double, align 8
  %x = alloca double, align 8
  %r = alloca double, align 8
  store double %u, double* %2, align 8
  %3 = load double* %2, align 8
  %4 = fsub double %3, 5.000000e-01
  store double %4, double* %x, align 8
  %5 = load double* %x, align 8
  %6 = call double @fabs(double %5) #3
  %7 = fcmp olt double %6, 4.200000e-01
  br i1 %7, label %8, label %45

; <label>:8                                       ; preds = %0
  %9 = load double* %x, align 8
  %10 = load double* %x, align 8
  %11 = fmul double %9, %10
  store double %11, double* %r, align 8
  %12 = load double* %x, align 8
  %13 = load double* getelementptr inbounds ([4 x double]* @_ZL1a, i32 0, i64 3), align 8
  %14 = load double* %r, align 8
  %15 = fmul double %13, %14
  %16 = load double* getelementptr inbounds ([4 x double]* @_ZL1a, i32 0, i64 2), align 8
  %17 = fadd double %15, %16
  %18 = load double* %r, align 8
  %19 = fmul double %17, %18
  %20 = load double* getelementptr inbounds ([4 x double]* @_ZL1a, i32 0, i64 1), align 8
  %21 = fadd double %19, %20
  %22 = load double* %r, align 8
  %23 = fmul double %21, %22
  %24 = load double* getelementptr inbounds ([4 x double]* @_ZL1a, i32 0, i64 0), align 8
  %25 = fadd double %23, %24
  %26 = fmul double %12, %25
  %27 = load double* getelementptr inbounds ([4 x double]* @_ZL1b, i32 0, i64 3), align 8
  %28 = load double* %r, align 8
  %29 = fmul double %27, %28
  %30 = load double* getelementptr inbounds ([4 x double]* @_ZL1b, i32 0, i64 2), align 8
  %31 = fadd double %29, %30
  %32 = load double* %r, align 8
  %33 = fmul double %31, %32
  %34 = load double* getelementptr inbounds ([4 x double]* @_ZL1b, i32 0, i64 1), align 8
  %35 = fadd double %33, %34
  %36 = load double* %r, align 8
  %37 = fmul double %35, %36
  %38 = load double* getelementptr inbounds ([4 x double]* @_ZL1b, i32 0, i64 0), align 8
  %39 = fadd double %37, %38
  %40 = load double* %r, align 8
  %41 = fmul double %39, %40
  %42 = fadd double %41, 1.000000e+00
  %43 = fdiv double %26, %42
  store double %43, double* %r, align 8
  %44 = load double* %r, align 8
  store double %44, double* %1
  br label %97

; <label>:45                                      ; preds = %0
  %46 = load double* %2, align 8
  store double %46, double* %r, align 8
  %47 = load double* %x, align 8
  %48 = fcmp ogt double %47, 0.000000e+00
  br i1 %48, label %49, label %52

; <label>:49                                      ; preds = %45
  %50 = load double* %2, align 8
  %51 = fsub double 1.000000e+00, %50
  store double %51, double* %r, align 8
  br label %52

; <label>:52                                      ; preds = %49, %45
  %53 = load double* %r, align 8
  %54 = call double @log(double %53) #4
  %55 = fsub double -0.000000e+00, %54
  %56 = call double @log(double %55) #4
  store double %56, double* %r, align 8
  %57 = load double* getelementptr inbounds ([9 x double]* @_ZL1c, i32 0, i64 0), align 8
  %58 = load double* %r, align 8
  %59 = load double* getelementptr inbounds ([9 x double]* @_ZL1c, i32 0, i64 1), align 8
  %60 = load double* %r, align 8
  %61 = load double* getelementptr inbounds ([9 x double]* @_ZL1c, i32 0, i64 2), align 8
  %62 = load double* %r, align 8
  %63 = load double* getelementptr inbounds ([9 x double]* @_ZL1c, i32 0, i64 3), align 8
  %64 = load double* %r, align 8
  %65 = load double* getelementptr inbounds ([9 x double]* @_ZL1c, i32 0, i64 4), align 8
  %66 = load double* %r, align 8
  %67 = load double* getelementptr inbounds ([9 x double]* @_ZL1c, i32 0, i64 5), align 8
  %68 = load double* %r, align 8
  %69 = load double* getelementptr inbounds ([9 x double]* @_ZL1c, i32 0, i64 6), align 8
  %70 = load double* %r, align 8
  %71 = load double* getelementptr inbounds ([9 x double]* @_ZL1c, i32 0, i64 7), align 8
  %72 = load double* %r, align 8
  %73 = load double* getelementptr inbounds ([9 x double]* @_ZL1c, i32 0, i64 8), align 8
  %74 = fmul double %72, %73
  %75 = fadd double %71, %74
  %76 = fmul double %70, %75
  %77 = fadd double %69, %76
  %78 = fmul double %68, %77
  %79 = fadd double %67, %78
  %80 = fmul double %66, %79
  %81 = fadd double %65, %80
  %82 = fmul double %64, %81
  %83 = fadd double %63, %82
  %84 = fmul double %62, %83
  %85 = fadd double %61, %84
  %86 = fmul double %60, %85
  %87 = fadd double %59, %86
  %88 = fmul double %58, %87
  %89 = fadd double %57, %88
  store double %89, double* %r, align 8
  %90 = load double* %x, align 8
  %91 = fcmp olt double %90, 0.000000e+00
  br i1 %91, label %92, label %95

; <label>:92                                      ; preds = %52
  %93 = load double* %r, align 8
  %94 = fsub double -0.000000e+00, %93
  store double %94, double* %r, align 8
  br label %95

; <label>:95                                      ; preds = %92, %52
  %96 = load double* %r, align 8
  store double %96, double* %1
  br label %97

; <label>:97                                      ; preds = %95, %8
  %98 = load double* %1
  ret double %98
}

; Function Attrs: nounwind readnone
declare double @fabs(double) #1

; Function Attrs: nounwind
declare double @log(double) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}
