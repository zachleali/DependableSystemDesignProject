; ModuleID = 'icdf.cpp'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @_Z13icdf_baselineiPdS_(i32 %N, double* %in, double* %out) #0 {
  %1 = alloca i32, align 4
  %2 = alloca double*, align 8
  %3 = alloca double*, align 8
  %z = alloca double, align 8
  %r = alloca double, align 8
  %a1 = alloca double, align 8
  %a2 = alloca double, align 8
  %a3 = alloca double, align 8
  %a4 = alloca double, align 8
  %a5 = alloca double, align 8
  %a6 = alloca double, align 8
  %b1 = alloca double, align 8
  %b2 = alloca double, align 8
  %b3 = alloca double, align 8
  %b4 = alloca double, align 8
  %b5 = alloca double, align 8
  %c1 = alloca double, align 8
  %c2 = alloca double, align 8
  %c3 = alloca double, align 8
  %c4 = alloca double, align 8
  %c5 = alloca double, align 8
  %c6 = alloca double, align 8
  %d1 = alloca double, align 8
  %d2 = alloca double, align 8
  %d3 = alloca double, align 8
  %d4 = alloca double, align 8
  %u_low = alloca double, align 8
  %u_high = alloca double, align 8
  %i = alloca i32, align 4
  %u = alloca double, align 8
  store i32 %N, i32* %1, align 4
  store double* %in, double** %2, align 8
  store double* %out, double** %3, align 8
  store double 0xC043D931BC1E0525, double* %a1, align 8
  store double 0x406B9E467034039B, double* %a2, align 8
  store double 0xC0713EDB2DC53B99, double* %a3, align 8
  store double 0x40614B72B40B401B, double* %a4, align 8
  store double 0xC03EAA3034C08BCD, double* %a5, align 8
  store double 0x40040D9320575479, double* %a6, align 8
  store double 0xC04B3CF0CE3004C4, double* %b1, align 8
  store double 0x406432BF2CF04277, double* %b2, align 8
  store double 0xC063765E0B02D8D2, double* %b3, align 8
  store double 0x4050B348B1A7E9BE, double* %b4, align 8
  store double 0xC02A8FB57E147826, double* %b5, align 8
  store double 0xBF7FE30D924ACFE0, double* %c1, align 8
  store double 0xBFD4A224C0E881B8, double* %c2, align 8
  store double 0xC00334C0C1701758, double* %c3, align 8
  store double 0xC00465DA2C703A1A, double* %c4, align 8
  store double 0x40117FA7F4EA4DC7, double* %c5, align 8
  store double 0x4007815C1E3FCFA2, double* %c6, align 8
  store double 0x3F7FE2D857AC9FD4, double* %d1, align 8
  store double 0x3FD4A34D2B590364, double* %d2, align 8
  store double 0x40038FA27C8AE616, double* %d3, align 8
  store double 0x400E09076895B119, double* %d4, align 8
  store double 2.425000e-02, double* %u_low, align 8
  store double 9.757500e-01, double* %u_high, align 8
  store i32 0, i32* %i, align 4
  br label %4

; <label>:4                                       ; preds = %133, %0
  %5 = load i32* %i, align 4
  %6 = load i32* %1, align 4
  %7 = icmp slt i32 %5, %6
  br i1 %7, label %8, label %136

; <label>:8                                       ; preds = %4
  %9 = load i32* %i, align 4
  %10 = sext i32 %9 to i64
  %11 = load double** %2, align 8
  %12 = getelementptr inbounds double* %11, i64 %10
  %13 = load double* %12, align 8
  store double %13, double* %u, align 8
  %14 = load double* %u, align 8
  %15 = fcmp olt double %14, 2.425000e-02
  br i1 %15, label %16, label %49

; <label>:16                                      ; preds = %8
  %17 = load double* %u, align 8
  %18 = call double @log(double %17) #2
  %19 = fmul double -2.000000e+00, %18
  %20 = call double @sqrt(double %19) #2
  store double %20, double* %z, align 8
  %21 = load double* %z, align 8
  %22 = fmul double 0xBF7FE30D924ACFE0, %21
  %23 = fadd double %22, 0xBFD4A224C0E881B8
  %24 = load double* %z, align 8
  %25 = fmul double %23, %24
  %26 = fadd double %25, 0xC00334C0C1701758
  %27 = load double* %z, align 8
  %28 = fmul double %26, %27
  %29 = fadd double %28, 0xC00465DA2C703A1A
  %30 = load double* %z, align 8
  %31 = fmul double %29, %30
  %32 = fadd double %31, 0x40117FA7F4EA4DC7
  %33 = load double* %z, align 8
  %34 = fmul double %32, %33
  %35 = fadd double %34, 0x4007815C1E3FCFA2
  %36 = load double* %z, align 8
  %37 = fmul double 0x3F7FE2D857AC9FD4, %36
  %38 = fadd double %37, 0x3FD4A34D2B590364
  %39 = load double* %z, align 8
  %40 = fmul double %38, %39
  %41 = fadd double %40, 0x40038FA27C8AE616
  %42 = load double* %z, align 8
  %43 = fmul double %41, %42
  %44 = fadd double %43, 0x400E09076895B119
  %45 = load double* %z, align 8
  %46 = fmul double %44, %45
  %47 = fadd double %46, 1.000000e+00
  %48 = fdiv double %35, %47
  store double %48, double* %z, align 8
  br label %127

; <label>:49                                      ; preds = %8
  %50 = load double* %u, align 8
  %51 = fcmp ole double %50, 9.757500e-01
  br i1 %51, label %52, label %91

; <label>:52                                      ; preds = %49
  %53 = load double* %u, align 8
  %54 = fsub double %53, 5.000000e-01
  store double %54, double* %z, align 8
  %55 = load double* %z, align 8
  %56 = load double* %z, align 8
  %57 = fmul double %55, %56
  store double %57, double* %r, align 8
  %58 = load double* %r, align 8
  %59 = fmul double 0xC043D931BC1E0525, %58
  %60 = fadd double %59, 0x406B9E467034039B
  %61 = load double* %r, align 8
  %62 = fmul double %60, %61
  %63 = fadd double %62, 0xC0713EDB2DC53B99
  %64 = load double* %r, align 8
  %65 = fmul double %63, %64
  %66 = fadd double %65, 0x40614B72B40B401B
  %67 = load double* %r, align 8
  %68 = fmul double %66, %67
  %69 = fadd double %68, 0xC03EAA3034C08BCD
  %70 = load double* %r, align 8
  %71 = fmul double %69, %70
  %72 = fadd double %71, 0x40040D9320575479
  %73 = load double* %z, align 8
  %74 = fmul double %72, %73
  %75 = load double* %r, align 8
  %76 = fmul double 0xC04B3CF0CE3004C4, %75
  %77 = fadd double %76, 0x406432BF2CF04277
  %78 = load double* %r, align 8
  %79 = fmul double %77, %78
  %80 = fadd double %79, 0xC063765E0B02D8D2
  %81 = load double* %r, align 8
  %82 = fmul double %80, %81
  %83 = fadd double %82, 0x4050B348B1A7E9BE
  %84 = load double* %r, align 8
  %85 = fmul double %83, %84
  %86 = fadd double %85, 0xC02A8FB57E147826
  %87 = load double* %r, align 8
  %88 = fmul double %86, %87
  %89 = fadd double %88, 1.000000e+00
  %90 = fdiv double %74, %89
  store double %90, double* %z, align 8
  br label %126

; <label>:91                                      ; preds = %49
  %92 = load double* %u, align 8
  %93 = fsub double 1.000000e+00, %92
  %94 = call double @log(double %93) #2
  %95 = fmul double -2.000000e+00, %94
  %96 = call double @sqrt(double %95) #2
  store double %96, double* %z, align 8
  %97 = load double* %z, align 8
  %98 = fmul double 0xBF7FE30D924ACFE0, %97
  %99 = fadd double %98, 0xBFD4A224C0E881B8
  %100 = load double* %z, align 8
  %101 = fmul double %99, %100
  %102 = fadd double %101, 0xC00334C0C1701758
  %103 = load double* %z, align 8
  %104 = fmul double %102, %103
  %105 = fadd double %104, 0xC00465DA2C703A1A
  %106 = load double* %z, align 8
  %107 = fmul double %105, %106
  %108 = fadd double %107, 0x40117FA7F4EA4DC7
  %109 = load double* %z, align 8
  %110 = fmul double %108, %109
  %111 = fadd double %110, 0x4007815C1E3FCFA2
  %112 = fsub double -0.000000e+00, %111
  %113 = load double* %z, align 8
  %114 = fmul double 0x3F7FE2D857AC9FD4, %113
  %115 = fadd double %114, 0x3FD4A34D2B590364
  %116 = load double* %z, align 8
  %117 = fmul double %115, %116
  %118 = fadd double %117, 0x40038FA27C8AE616
  %119 = load double* %z, align 8
  %120 = fmul double %118, %119
  %121 = fadd double %120, 0x400E09076895B119
  %122 = load double* %z, align 8
  %123 = fmul double %121, %122
  %124 = fadd double %123, 1.000000e+00
  %125 = fdiv double %112, %124
  store double %125, double* %z, align 8
  br label %126

; <label>:126                                     ; preds = %91, %52
  br label %127

; <label>:127                                     ; preds = %126, %16
  %128 = load double* %z, align 8
  %129 = load i32* %i, align 4
  %130 = sext i32 %129 to i64
  %131 = load double** %3, align 8
  %132 = getelementptr inbounds double* %131, i64 %130
  store double %128, double* %132, align 8
  br label %133

; <label>:133                                     ; preds = %127
  %134 = load i32* %i, align 4
  %135 = add nsw i32 %134, 1
  store i32 %135, i32* %i, align 4
  br label %4

; <label>:136                                     ; preds = %4
  ret void
}

; Function Attrs: nounwind
declare double @sqrt(double) #1

; Function Attrs: nounwind
declare double @log(double) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}
