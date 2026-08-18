	.arch armv8-a
	.file	"compression.c"
	.text
	.align	2
	.p2align 5,,15
	.global	compress_sample
	.type	compress_sample, %function
compress_sample:
.LFB80:
	.cfi_startproc
	sbfx	w3, w0, 15, 1
	and	w0, w0, 65535
	mov	w2, 7
	mov	w5, 10
	add	w1, w0, w3, uxth
	lsr	w0, w0, 8
	eor	w1, w1, w3
	and	w3, w0, 128
	and	w1, w1, 65535
	add	w1, w1, 132
	and	w4, w1, 65535
	eor	w4, w4, 32767
	sbfx	x0, x1, 15, 1
	and	w0, w0, w4
	eor	w1, w1, w0
	and	w1, w1, 65535
	clz	w4, w1
	sub	w4, w4, #17
	sub	w0, w2, w4, uxtb
	sub	w5, w5, w4, uxtb
	orr	w0, w3, w0, lsl 4
	asr	w1, w1, w5
	and	w1, w1, 15
	orr	w0, w0, w1
	mvn	w0, w0
	ret
	.cfi_endproc
.LFE80:
	.size	compress_sample, .-compress_sample
	.align	2
	.p2align 5,,15
	.global	decompress_sample
	.type	decompress_sample, %function
decompress_sample:
.LFB81:
	.cfi_startproc
	mvn	w0, w0
	and	w1, w0, 15
	ubfx	x3, x0, 4, 3
	orr	w1, w1, 16
	add	w3, w3, 3
	sbfx	x2, x0, 7, 1
	ubfx	x0, x0, 7, 1
	lsl	w1, w1, w3
	and	w1, w1, 65535
	sub	w1, w1, #132
	eor	w2, w2, w1
	add	w0, w2, w0
	ret
	.cfi_endproc
.LFE81:
	.size	decompress_sample, .-decompress_sample
	.align	2
	.p2align 5,,15
	.global	compress_wav
	.type	compress_wav, %function
compress_wav:
.LFB82:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	w4, 7
	mov	w2, 8
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	.cfi_offset 19, -32
	.cfi_offset 20, -24
	.cfi_offset 21, -16
	.cfi_offset 22, -8
	mov	x21, x0
	ldrh	w19, [x0, 32]
	ldr	w22, [x0, 40]
	ldr	w1, [x21, 24]
	ldrh	w0, [x0, 22]
	udiv	w20, w22, w19
	mov	w3, w20
	bl	new_wav
	cbz	x0, .L12
	ldrh	w15, [x0, 32]
	mov	x13, x0
	ldrsh	w14, [x21, 46]
	add	x12, x21, 44
	ldrsh	w0, [x21, 44]
	mov	w11, w19
	mov	w10, 0
	mov	w9, 0
	cmp	w22, w19
	bcc	.L4
	.p2align 5,,15
.L7:
	uxtw	x6, w10
	bl	compress_sample
	add	x7, x13, x6
	add	x6, x13, x6
	mov	w8, w0
	mov	w0, w14
	bl	compress_sample
	add	w9, w9, 1
	strb	w8, [x6, 44]
	uxtw	x1, w11
	strb	w0, [x7, 45]
	add	x1, x1, 44
	add	w10, w10, w15
	add	w11, w11, w19
	ldrsh	w0, [x12, 2]
	ldrsh	w14, [x12, 4]
	add	x12, x21, x1
	cmp	w9, w20
	bcc	.L7
.L4:
	ldp	x19, x20, [sp, 16]
	mov	x0, x13
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
.L12:
	.cfi_restore_state
	mov	w0, 1
	bl	exit
	.cfi_endproc
.LFE82:
	.size	compress_wav, .-compress_wav
	.align	2
	.p2align 5,,15
	.global	decompress_wav
	.type	decompress_wav, %function
decompress_wav:
.LFB83:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	w4, 1
	mov	w2, 16
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -32
	.cfi_offset 20, -24
	mov	x19, x0
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -16
	.cfi_offset 22, -8
	ldrh	w20, [x0, 32]
	ldr	w22, [x0, 40]
	ldr	w1, [x19, 24]
	ldrh	w0, [x0, 22]
	udiv	w21, w22, w20
	mov	w3, w21
	bl	new_wav
	cbz	x0, .L21
	ldrh	w10, [x0, 32]
	mov	w9, w20
	ldrb	w6, [x19, 44]
	mov	w8, 0
	ldrb	w5, [x19, 45]
	mov	w7, 0
	cmp	w22, w20
	bcc	.L13
	.p2align 5,,15
.L16:
	mvn	w6, w6
	mvn	w5, w5
	and	w4, w6, 15
	and	w2, w5, 15
	ubfx	x12, x6, 4, 3
	orr	w4, w4, 16
	add	w12, w12, 3
	ubfx	x11, x5, 4, 3
	uxtw	x3, w8
	sbfx	x1, x6, 7, 1
	lsl	w4, w4, w12
	and	w4, w4, 65535
	sub	w4, w4, #132
	orr	w2, w2, 16
	add	w11, w11, 3
	eor	w1, w1, w4
	ubfx	x6, x6, 7, 1
	add	x12, x0, x3
	add	w1, w1, w6
	add	x3, x0, x3
	lsl	w2, w2, w11
	and	w2, w2, 65535
	sbfx	x4, x5, 7, 1
	and	w1, w1, 65535
	sub	w2, w2, #132
	ubfx	x5, x5, 7, 1
	eor	w2, w4, w2
	add	x4, x19, w9, uxtw
	strb	w1, [x12, 44]
	add	w2, w2, w5
	sbfx	x1, x1, 8, 8
	strb	w1, [x3, 45]
	strh	w2, [x3, 46]
	add	w7, w7, 1
	add	w8, w8, w10
	add	w9, w9, w20
	ldrb	w6, [x4, 44]
	ldrb	w5, [x4, 45]
	cmp	w7, w21
	bcc	.L16
.L13:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
.L21:
	.cfi_restore_state
	mov	w0, 1
	bl	exit
	.cfi_endproc
.LFE83:
	.size	decompress_wav, .-decompress_wav
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
