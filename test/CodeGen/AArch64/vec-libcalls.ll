; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=aarch64-- | FileCheck %s

; PR38527 - https://bugs.llvm.org/show_bug.cgi?id=38527

; Use fsin as the representative test for various data types.

declare <1 x float> @llvm.sin.v1f32(<1 x float>)
declare <2 x float> @llvm.sin.v2f32(<2 x float>)
declare <3 x float> @llvm.sin.v3f32(<3 x float>)
declare <4 x float> @llvm.sin.v4f32(<4 x float>)
declare <5 x float> @llvm.sin.v5f32(<5 x float>)
declare <6 x float> @llvm.sin.v6f32(<6 x float>)
declare <3 x double> @llvm.sin.v3f64(<3 x double>)

; Verify that all of the potential libcall candidates are handled.
; Some of these have custom lowering, so those cases won't have
; libcalls.

declare <3 x float> @llvm.fabs.v3f32(<3 x float>)
declare <3 x float> @llvm.ceil.v3f32(<3 x float>)
declare <3 x float> @llvm.cos.v3f32(<3 x float>)
declare <3 x float> @llvm.exp.v3f32(<3 x float>)
declare <3 x float> @llvm.exp2.v3f32(<3 x float>)
declare <3 x float> @llvm.floor.v3f32(<3 x float>)
declare <3 x float> @llvm.log.v3f32(<3 x float>)
declare <3 x float> @llvm.log10.v3f32(<3 x float>)
declare <3 x float> @llvm.log2.v3f32(<3 x float>)
declare <3 x float> @llvm.nearbyint.v3f32(<3 x float>)
declare <3 x float> @llvm.rint.v3f32(<3 x float>)
declare <3 x float> @llvm.round.v3f32(<3 x float>)
declare <3 x float> @llvm.sqrt.v3f32(<3 x float>)
declare <3 x float> @llvm.trunc.v3f32(<3 x float>)

define <1 x float> @sin_v1f32(<1 x float> %x) nounwind {
; CHECK-LABEL: sin_v1f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    str x30, [sp, #-16]! // 8-byte Folded Spill
; CHECK-NEXT:    // kill: def $d0 killed $d0 def $q0
; CHECK-NEXT:    // kill: def $s0 killed $s0 killed $q0
; CHECK-NEXT:    bl sinf
; CHECK-NEXT:    // kill: def $s0 killed $s0 def $d0
; CHECK-NEXT:    ldr x30, [sp], #16 // 8-byte Folded Reload
; CHECK-NEXT:    ret
  %r = call <1 x float> @llvm.sin.v1f32(<1 x float> %x)
  ret <1 x float> %r
}

define <2 x float> @sin_v2f32(<2 x float> %x) nounwind {
; CHECK-LABEL: sin_v2f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    sub sp, sp, #48 // =48
; CHECK-NEXT:    // kill: def $d0 killed $d0 def $q0
; CHECK-NEXT:    str q0, [sp] // 16-byte Folded Spill
; CHECK-NEXT:    mov s0, v0.s[1]
; CHECK-NEXT:    str x30, [sp, #32] // 8-byte Folded Spill
; CHECK-NEXT:    bl sinf
; CHECK-NEXT:    str d0, [sp, #16] // 16-byte Folded Spill
; CHECK-NEXT:    ldr q0, [sp] // 16-byte Folded Reload
; CHECK-NEXT:    // kill: def $s0 killed $s0 killed $q0
; CHECK-NEXT:    bl sinf
; CHECK-NEXT:    ldr q1, [sp, #16] // 16-byte Folded Reload
; CHECK-NEXT:    ldr x30, [sp, #32] // 8-byte Folded Reload
; CHECK-NEXT:    // kill: def $s0 killed $s0 def $q0
; CHECK-NEXT:    mov v0.s[1], v1.s[0]
; CHECK-NEXT:    // kill: def $d0 killed $d0 killed $q0
; CHECK-NEXT:    add sp, sp, #48 // =48
; CHECK-NEXT:    ret
  %r = call <2 x float> @llvm.sin.v2f32(<2 x float> %x)
  ret <2 x float> %r
}

define <3 x float> @sin_v3f32(<3 x float> %x) nounwind {
; CHECK-LABEL: sin_v3f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    sub sp, sp, #48 // =48
; CHECK-NEXT:    str q0, [sp, #16] // 16-byte Folded Spill
; CHECK-NEXT:    mov s0, v0.s[1]
; CHECK-NEXT:    str x30, [sp, #32] // 8-byte Folded Spill
; CHECK-NEXT:    bl sinf
; CHECK-NEXT:    str d0, [sp] // 16-byte Folded Spill
; CHECK-NEXT:    ldr q0, [sp, #16] // 16-byte Folded Reload
; CHECK-NEXT:    // kill: def $s0 killed $s0 killed $q0
; CHECK-NEXT:    bl sinf
; CHECK-NEXT:    ldr q1, [sp] // 16-byte Folded Reload
; CHECK-NEXT:    // kill: def $s0 killed $s0 def $q0
; CHECK-NEXT:    mov v0.s[1], v1.s[0]
; CHECK-NEXT:    str q0, [sp] // 16-byte Folded Spill
; CHECK-NEXT:    ldr q0, [sp, #16] // 16-byte Folded Reload
; CHECK-NEXT:    mov s0, v0.s[2]
; CHECK-NEXT:    bl sinf
; CHECK-NEXT:    ldr q1, [sp] // 16-byte Folded Reload
; CHECK-NEXT:    ldr x30, [sp, #32] // 8-byte Folded Reload
; CHECK-NEXT:    // kill: def $s0 killed $s0 def $q0
; CHECK-NEXT:    mov v1.s[2], v0.s[0]
; CHECK-NEXT:    mov v0.16b, v1.16b
; CHECK-NEXT:    add sp, sp, #48 // =48
; CHECK-NEXT:    ret
  %r = call <3 x float> @llvm.sin.v3f32(<3 x float> %x)
  ret <3 x float> %r
}

define <4 x float> @sin_v4f32(<4 x float> %x) nounwind {
; CHECK-LABEL: sin_v4f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    sub sp, sp, #48 // =48
; CHECK-NEXT:    str q0, [sp, #16] // 16-byte Folded Spill
; CHECK-NEXT:    mov s0, v0.s[1]
; CHECK-NEXT:    str x30, [sp, #32] // 8-byte Folded Spill
; CHECK-NEXT:    bl sinf
; CHECK-NEXT:    str d0, [sp] // 16-byte Folded Spill
; CHECK-NEXT:    ldr q0, [sp, #16] // 16-byte Folded Reload
; CHECK-NEXT:    // kill: def $s0 killed $s0 killed $q0
; CHECK-NEXT:    bl sinf
; CHECK-NEXT:    ldr q1, [sp] // 16-byte Folded Reload
; CHECK-NEXT:    // kill: def $s0 killed $s0 def $q0
; CHECK-NEXT:    mov v0.s[1], v1.s[0]
; CHECK-NEXT:    str q0, [sp] // 16-byte Folded Spill
; CHECK-NEXT:    ldr q0, [sp, #16] // 16-byte Folded Reload
; CHECK-NEXT:    mov s0, v0.s[2]
; CHECK-NEXT:    bl sinf
; CHECK-NEXT:    ldr q1, [sp] // 16-byte Folded Reload
; CHECK-NEXT:    // kill: def $s0 killed $s0 def $q0
; CHECK-NEXT:    mov v1.s[2], v0.s[0]
; CHECK-NEXT:    ldr q0, [sp, #16] // 16-byte Folded Reload
; CHECK-NEXT:    str q1, [sp] // 16-byte Folded Spill
; CHECK-NEXT:    mov s0, v0.s[3]
; CHECK-NEXT:    bl sinf
; CHECK-NEXT:    ldr q1, [sp] // 16-byte Folded Reload
; CHECK-NEXT:    ldr x30, [sp, #32] // 8-byte Folded Reload
; CHECK-NEXT:    // kill: def $s0 killed $s0 def $q0
; CHECK-NEXT:    mov v1.s[3], v0.s[0]
; CHECK-NEXT:    mov v0.16b, v1.16b
; CHECK-NEXT:    add sp, sp, #48 // =48
; CHECK-NEXT:    ret
  %r = call <4 x float> @llvm.sin.v4f32(<4 x float> %x)
  ret <4 x float> %r
}

define <5 x float> @sin_v5f32(<5 x float> %x) nounwind {
; CHECK-LABEL: sin_v5f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    str d12, [sp, #-48]! // 8-byte Folded Spill
; CHECK-NEXT:    stp d11, d10, [sp, #8] // 8-byte Folded Spill
; CHECK-NEXT:    stp d9, d8, [sp, #24] // 8-byte Folded Spill
; CHECK-NEXT:    str x30, [sp, #40] // 8-byte Folded Spill
; CHECK-NEXT:    mov v8.16b, v4.16b
; CHECK-NEXT:    mov v9.16b, v3.16b
; CHECK-NEXT:    mov v10.16b, v2.16b
; CHECK-NEXT:    mov v11.16b, v1.16b
; CHECK-NEXT:    bl sinf
; CHECK-NEXT:    mov v12.16b, v0.16b
; CHECK-NEXT:    mov v0.16b, v11.16b
; CHECK-NEXT:    bl sinf
; CHECK-NEXT:    mov v11.16b, v0.16b
; CHECK-NEXT:    mov v0.16b, v10.16b
; CHECK-NEXT:    bl sinf
; CHECK-NEXT:    mov v10.16b, v0.16b
; CHECK-NEXT:    mov v0.16b, v9.16b
; CHECK-NEXT:    bl sinf
; CHECK-NEXT:    mov v9.16b, v0.16b
; CHECK-NEXT:    mov v0.16b, v8.16b
; CHECK-NEXT:    bl sinf
; CHECK-NEXT:    mov v1.16b, v11.16b
; CHECK-NEXT:    mov v2.16b, v10.16b
; CHECK-NEXT:    mov v3.16b, v9.16b
; CHECK-NEXT:    ldr x30, [sp, #40] // 8-byte Folded Reload
; CHECK-NEXT:    ldp d9, d8, [sp, #24] // 8-byte Folded Reload
; CHECK-NEXT:    ldp d11, d10, [sp, #8] // 8-byte Folded Reload
; CHECK-NEXT:    mov v4.16b, v0.16b
; CHECK-NEXT:    mov v0.16b, v12.16b
; CHECK-NEXT:    ldr d12, [sp], #48 // 8-byte Folded Reload
; CHECK-NEXT:    ret
  %r = call <5 x float> @llvm.sin.v5f32(<5 x float> %x)
  ret <5 x float> %r
}

define <6 x float> @sin_v6f32(<6 x float> %x) nounwind {
; CHECK-LABEL: sin_v6f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    stp d13, d12, [sp, #-64]! // 8-byte Folded Spill
; CHECK-NEXT:    stp d11, d10, [sp, #16] // 8-byte Folded Spill
; CHECK-NEXT:    stp d9, d8, [sp, #32] // 8-byte Folded Spill
; CHECK-NEXT:    str x30, [sp, #48] // 8-byte Folded Spill
; CHECK-NEXT:    mov v8.16b, v5.16b
; CHECK-NEXT:    mov v9.16b, v4.16b
; CHECK-NEXT:    mov v10.16b, v3.16b
; CHECK-NEXT:    mov v11.16b, v2.16b
; CHECK-NEXT:    mov v12.16b, v1.16b
; CHECK-NEXT:    bl sinf
; CHECK-NEXT:    mov v13.16b, v0.16b
; CHECK-NEXT:    mov v0.16b, v12.16b
; CHECK-NEXT:    bl sinf
; CHECK-NEXT:    mov v12.16b, v0.16b
; CHECK-NEXT:    mov v0.16b, v11.16b
; CHECK-NEXT:    bl sinf
; CHECK-NEXT:    mov v11.16b, v0.16b
; CHECK-NEXT:    mov v0.16b, v10.16b
; CHECK-NEXT:    bl sinf
; CHECK-NEXT:    mov v10.16b, v0.16b
; CHECK-NEXT:    mov v0.16b, v9.16b
; CHECK-NEXT:    bl sinf
; CHECK-NEXT:    mov v9.16b, v0.16b
; CHECK-NEXT:    mov v0.16b, v8.16b
; CHECK-NEXT:    bl sinf
; CHECK-NEXT:    mov v2.16b, v11.16b
; CHECK-NEXT:    mov v3.16b, v10.16b
; CHECK-NEXT:    mov v4.16b, v9.16b
; CHECK-NEXT:    ldr x30, [sp, #48] // 8-byte Folded Reload
; CHECK-NEXT:    ldp d9, d8, [sp, #32] // 8-byte Folded Reload
; CHECK-NEXT:    ldp d11, d10, [sp, #16] // 8-byte Folded Reload
; CHECK-NEXT:    mov v5.16b, v0.16b
; CHECK-NEXT:    mov v0.16b, v13.16b
; CHECK-NEXT:    mov v1.16b, v12.16b
; CHECK-NEXT:    ldp d13, d12, [sp], #64 // 8-byte Folded Reload
; CHECK-NEXT:    ret
  %r = call <6 x float> @llvm.sin.v6f32(<6 x float> %x)
  ret <6 x float> %r
}

define <3 x double> @sin_v3f64(<3 x double> %x) nounwind {
; CHECK-LABEL: sin_v3f64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    str d10, [sp, #-32]! // 8-byte Folded Spill
; CHECK-NEXT:    stp d9, d8, [sp, #8] // 8-byte Folded Spill
; CHECK-NEXT:    str x30, [sp, #24] // 8-byte Folded Spill
; CHECK-NEXT:    mov v8.16b, v2.16b
; CHECK-NEXT:    mov v9.16b, v1.16b
; CHECK-NEXT:    bl sin
; CHECK-NEXT:    mov v10.16b, v0.16b
; CHECK-NEXT:    mov v0.16b, v9.16b
; CHECK-NEXT:    bl sin
; CHECK-NEXT:    mov v9.16b, v0.16b
; CHECK-NEXT:    mov v0.16b, v8.16b
; CHECK-NEXT:    bl sin
; CHECK-NEXT:    mov v1.16b, v9.16b
; CHECK-NEXT:    ldr x30, [sp, #24] // 8-byte Folded Reload
; CHECK-NEXT:    ldp d9, d8, [sp, #8] // 8-byte Folded Reload
; CHECK-NEXT:    mov v2.16b, v0.16b
; CHECK-NEXT:    mov v0.16b, v10.16b
; CHECK-NEXT:    ldr d10, [sp], #32 // 8-byte Folded Reload
; CHECK-NEXT:    ret
  %r = call <3 x double> @llvm.sin.v3f64(<3 x double> %x)
  ret <3 x double> %r
}

define <3 x float> @fabs_v3f32(<3 x float> %x) nounwind {
; CHECK-LABEL: fabs_v3f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    fabs v0.4s, v0.4s
; CHECK-NEXT:    ret
  %r = call <3 x float> @llvm.fabs.v3f32(<3 x float> %x)
  ret <3 x float> %r
}

define <3 x float> @ceil_v3f32(<3 x float> %x) nounwind {
; CHECK-LABEL: ceil_v3f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    frintp v0.4s, v0.4s
; CHECK-NEXT:    ret
  %r = call <3 x float> @llvm.ceil.v3f32(<3 x float> %x)
  ret <3 x float> %r
}

define <3 x float> @cos_v3f32(<3 x float> %x) nounwind {
; CHECK-LABEL: cos_v3f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    sub sp, sp, #48 // =48
; CHECK-NEXT:    str q0, [sp, #16] // 16-byte Folded Spill
; CHECK-NEXT:    mov s0, v0.s[1]
; CHECK-NEXT:    str x30, [sp, #32] // 8-byte Folded Spill
; CHECK-NEXT:    bl cosf
; CHECK-NEXT:    str d0, [sp] // 16-byte Folded Spill
; CHECK-NEXT:    ldr q0, [sp, #16] // 16-byte Folded Reload
; CHECK-NEXT:    // kill: def $s0 killed $s0 killed $q0
; CHECK-NEXT:    bl cosf
; CHECK-NEXT:    ldr q1, [sp] // 16-byte Folded Reload
; CHECK-NEXT:    // kill: def $s0 killed $s0 def $q0
; CHECK-NEXT:    mov v0.s[1], v1.s[0]
; CHECK-NEXT:    str q0, [sp] // 16-byte Folded Spill
; CHECK-NEXT:    ldr q0, [sp, #16] // 16-byte Folded Reload
; CHECK-NEXT:    mov s0, v0.s[2]
; CHECK-NEXT:    bl cosf
; CHECK-NEXT:    ldr q1, [sp] // 16-byte Folded Reload
; CHECK-NEXT:    ldr x30, [sp, #32] // 8-byte Folded Reload
; CHECK-NEXT:    // kill: def $s0 killed $s0 def $q0
; CHECK-NEXT:    mov v1.s[2], v0.s[0]
; CHECK-NEXT:    mov v0.16b, v1.16b
; CHECK-NEXT:    add sp, sp, #48 // =48
; CHECK-NEXT:    ret
  %r = call <3 x float> @llvm.cos.v3f32(<3 x float> %x)
  ret <3 x float> %r
}

define <3 x float> @exp_v3f32(<3 x float> %x) nounwind {
; CHECK-LABEL: exp_v3f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    sub sp, sp, #48 // =48
; CHECK-NEXT:    str q0, [sp, #16] // 16-byte Folded Spill
; CHECK-NEXT:    mov s0, v0.s[1]
; CHECK-NEXT:    str x30, [sp, #32] // 8-byte Folded Spill
; CHECK-NEXT:    bl expf
; CHECK-NEXT:    str d0, [sp] // 16-byte Folded Spill
; CHECK-NEXT:    ldr q0, [sp, #16] // 16-byte Folded Reload
; CHECK-NEXT:    // kill: def $s0 killed $s0 killed $q0
; CHECK-NEXT:    bl expf
; CHECK-NEXT:    ldr q1, [sp] // 16-byte Folded Reload
; CHECK-NEXT:    // kill: def $s0 killed $s0 def $q0
; CHECK-NEXT:    mov v0.s[1], v1.s[0]
; CHECK-NEXT:    str q0, [sp] // 16-byte Folded Spill
; CHECK-NEXT:    ldr q0, [sp, #16] // 16-byte Folded Reload
; CHECK-NEXT:    mov s0, v0.s[2]
; CHECK-NEXT:    bl expf
; CHECK-NEXT:    ldr q1, [sp] // 16-byte Folded Reload
; CHECK-NEXT:    ldr x30, [sp, #32] // 8-byte Folded Reload
; CHECK-NEXT:    // kill: def $s0 killed $s0 def $q0
; CHECK-NEXT:    mov v1.s[2], v0.s[0]
; CHECK-NEXT:    mov v0.16b, v1.16b
; CHECK-NEXT:    add sp, sp, #48 // =48
; CHECK-NEXT:    ret
  %r = call <3 x float> @llvm.exp.v3f32(<3 x float> %x)
  ret <3 x float> %r
}

define <3 x float> @exp2_v3f32(<3 x float> %x) nounwind {
; CHECK-LABEL: exp2_v3f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    sub sp, sp, #48 // =48
; CHECK-NEXT:    str q0, [sp, #16] // 16-byte Folded Spill
; CHECK-NEXT:    mov s0, v0.s[1]
; CHECK-NEXT:    str x30, [sp, #32] // 8-byte Folded Spill
; CHECK-NEXT:    bl exp2f
; CHECK-NEXT:    str d0, [sp] // 16-byte Folded Spill
; CHECK-NEXT:    ldr q0, [sp, #16] // 16-byte Folded Reload
; CHECK-NEXT:    // kill: def $s0 killed $s0 killed $q0
; CHECK-NEXT:    bl exp2f
; CHECK-NEXT:    ldr q1, [sp] // 16-byte Folded Reload
; CHECK-NEXT:    // kill: def $s0 killed $s0 def $q0
; CHECK-NEXT:    mov v0.s[1], v1.s[0]
; CHECK-NEXT:    str q0, [sp] // 16-byte Folded Spill
; CHECK-NEXT:    ldr q0, [sp, #16] // 16-byte Folded Reload
; CHECK-NEXT:    mov s0, v0.s[2]
; CHECK-NEXT:    bl exp2f
; CHECK-NEXT:    ldr q1, [sp] // 16-byte Folded Reload
; CHECK-NEXT:    ldr x30, [sp, #32] // 8-byte Folded Reload
; CHECK-NEXT:    // kill: def $s0 killed $s0 def $q0
; CHECK-NEXT:    mov v1.s[2], v0.s[0]
; CHECK-NEXT:    mov v0.16b, v1.16b
; CHECK-NEXT:    add sp, sp, #48 // =48
; CHECK-NEXT:    ret
  %r = call <3 x float> @llvm.exp2.v3f32(<3 x float> %x)
  ret <3 x float> %r
}

define <3 x float> @floor_v3f32(<3 x float> %x) nounwind {
; CHECK-LABEL: floor_v3f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    frintm v0.4s, v0.4s
; CHECK-NEXT:    ret
  %r = call <3 x float> @llvm.floor.v3f32(<3 x float> %x)
  ret <3 x float> %r
}

define <3 x float> @log_v3f32(<3 x float> %x) nounwind {
; CHECK-LABEL: log_v3f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    sub sp, sp, #48 // =48
; CHECK-NEXT:    str q0, [sp, #16] // 16-byte Folded Spill
; CHECK-NEXT:    mov s0, v0.s[1]
; CHECK-NEXT:    str x30, [sp, #32] // 8-byte Folded Spill
; CHECK-NEXT:    bl logf
; CHECK-NEXT:    str d0, [sp] // 16-byte Folded Spill
; CHECK-NEXT:    ldr q0, [sp, #16] // 16-byte Folded Reload
; CHECK-NEXT:    // kill: def $s0 killed $s0 killed $q0
; CHECK-NEXT:    bl logf
; CHECK-NEXT:    ldr q1, [sp] // 16-byte Folded Reload
; CHECK-NEXT:    // kill: def $s0 killed $s0 def $q0
; CHECK-NEXT:    mov v0.s[1], v1.s[0]
; CHECK-NEXT:    str q0, [sp] // 16-byte Folded Spill
; CHECK-NEXT:    ldr q0, [sp, #16] // 16-byte Folded Reload
; CHECK-NEXT:    mov s0, v0.s[2]
; CHECK-NEXT:    bl logf
; CHECK-NEXT:    ldr q1, [sp] // 16-byte Folded Reload
; CHECK-NEXT:    ldr x30, [sp, #32] // 8-byte Folded Reload
; CHECK-NEXT:    // kill: def $s0 killed $s0 def $q0
; CHECK-NEXT:    mov v1.s[2], v0.s[0]
; CHECK-NEXT:    mov v0.16b, v1.16b
; CHECK-NEXT:    add sp, sp, #48 // =48
; CHECK-NEXT:    ret
  %r = call <3 x float> @llvm.log.v3f32(<3 x float> %x)
  ret <3 x float> %r
}

define <3 x float> @log10_v3f32(<3 x float> %x) nounwind {
; CHECK-LABEL: log10_v3f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    sub sp, sp, #48 // =48
; CHECK-NEXT:    str q0, [sp, #16] // 16-byte Folded Spill
; CHECK-NEXT:    mov s0, v0.s[1]
; CHECK-NEXT:    str x30, [sp, #32] // 8-byte Folded Spill
; CHECK-NEXT:    bl log10f
; CHECK-NEXT:    str d0, [sp] // 16-byte Folded Spill
; CHECK-NEXT:    ldr q0, [sp, #16] // 16-byte Folded Reload
; CHECK-NEXT:    // kill: def $s0 killed $s0 killed $q0
; CHECK-NEXT:    bl log10f
; CHECK-NEXT:    ldr q1, [sp] // 16-byte Folded Reload
; CHECK-NEXT:    // kill: def $s0 killed $s0 def $q0
; CHECK-NEXT:    mov v0.s[1], v1.s[0]
; CHECK-NEXT:    str q0, [sp] // 16-byte Folded Spill
; CHECK-NEXT:    ldr q0, [sp, #16] // 16-byte Folded Reload
; CHECK-NEXT:    mov s0, v0.s[2]
; CHECK-NEXT:    bl log10f
; CHECK-NEXT:    ldr q1, [sp] // 16-byte Folded Reload
; CHECK-NEXT:    ldr x30, [sp, #32] // 8-byte Folded Reload
; CHECK-NEXT:    // kill: def $s0 killed $s0 def $q0
; CHECK-NEXT:    mov v1.s[2], v0.s[0]
; CHECK-NEXT:    mov v0.16b, v1.16b
; CHECK-NEXT:    add sp, sp, #48 // =48
; CHECK-NEXT:    ret
  %r = call <3 x float> @llvm.log10.v3f32(<3 x float> %x)
  ret <3 x float> %r
}

define <3 x float> @log2_v3f32(<3 x float> %x) nounwind {
; CHECK-LABEL: log2_v3f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    sub sp, sp, #48 // =48
; CHECK-NEXT:    str q0, [sp, #16] // 16-byte Folded Spill
; CHECK-NEXT:    mov s0, v0.s[1]
; CHECK-NEXT:    str x30, [sp, #32] // 8-byte Folded Spill
; CHECK-NEXT:    bl log2f
; CHECK-NEXT:    str d0, [sp] // 16-byte Folded Spill
; CHECK-NEXT:    ldr q0, [sp, #16] // 16-byte Folded Reload
; CHECK-NEXT:    // kill: def $s0 killed $s0 killed $q0
; CHECK-NEXT:    bl log2f
; CHECK-NEXT:    ldr q1, [sp] // 16-byte Folded Reload
; CHECK-NEXT:    // kill: def $s0 killed $s0 def $q0
; CHECK-NEXT:    mov v0.s[1], v1.s[0]
; CHECK-NEXT:    str q0, [sp] // 16-byte Folded Spill
; CHECK-NEXT:    ldr q0, [sp, #16] // 16-byte Folded Reload
; CHECK-NEXT:    mov s0, v0.s[2]
; CHECK-NEXT:    bl log2f
; CHECK-NEXT:    ldr q1, [sp] // 16-byte Folded Reload
; CHECK-NEXT:    ldr x30, [sp, #32] // 8-byte Folded Reload
; CHECK-NEXT:    // kill: def $s0 killed $s0 def $q0
; CHECK-NEXT:    mov v1.s[2], v0.s[0]
; CHECK-NEXT:    mov v0.16b, v1.16b
; CHECK-NEXT:    add sp, sp, #48 // =48
; CHECK-NEXT:    ret
  %r = call <3 x float> @llvm.log2.v3f32(<3 x float> %x)
  ret <3 x float> %r
}

define <3 x float> @nearbyint__v3f32(<3 x float> %x) nounwind {
; CHECK-LABEL: nearbyint__v3f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    frinti v0.4s, v0.4s
; CHECK-NEXT:    ret
  %r = call <3 x float> @llvm.nearbyint.v3f32(<3 x float> %x)
  ret <3 x float> %r
}

define <3 x float> @rint_v3f32(<3 x float> %x) nounwind {
; CHECK-LABEL: rint_v3f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    frintx v0.4s, v0.4s
; CHECK-NEXT:    ret
  %r = call <3 x float> @llvm.rint.v3f32(<3 x float> %x)
  ret <3 x float> %r
}

define <3 x float> @round_v3f32(<3 x float> %x) nounwind {
; CHECK-LABEL: round_v3f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    frinta v0.4s, v0.4s
; CHECK-NEXT:    ret
  %r = call <3 x float> @llvm.round.v3f32(<3 x float> %x)
  ret <3 x float> %r
}

define <3 x float> @sqrt_v3f32(<3 x float> %x) nounwind {
; CHECK-LABEL: sqrt_v3f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    fsqrt v0.4s, v0.4s
; CHECK-NEXT:    ret
  %r = call <3 x float> @llvm.sqrt.v3f32(<3 x float> %x)
  ret <3 x float> %r
}

define <3 x float> @trunc_v3f32(<3 x float> %x) nounwind {
; CHECK-LABEL: trunc_v3f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    frintz v0.4s, v0.4s
; CHECK-NEXT:    ret
  %r = call <3 x float> @llvm.trunc.v3f32(<3 x float> %x)
  ret <3 x float> %r
}

