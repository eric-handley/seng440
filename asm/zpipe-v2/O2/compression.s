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
	.cfi_offset 19, -32
	.cfi_offset 20, -24
	mov	x20, x0
	ldrh	w19, [x0, 32]
	ldr	w1, [x0, 24]
	str	x21, [sp, 32]
	.cfi_offset 21, -16
	ldr	w21, [x0, 40]
	ldrh	w0, [x0, 22]
	udiv	w21, w21, w19
	mov	w3, w21
	bl	new_wav
	cbz	x0, .L11
	mov	x13, x0
	ldrsh	w14, [x20, 46]
	ldrsh	w0, [x20, 44]
	add	x10, x20, 44
	sub	w18, w21, #1
	ldrh	w15, [x13, 32]
	cmp	w21, 1
	beq	.L8
	mov	w11, w19
	mov	w12, 0
	mov	w9, 0
	.p2align 5,,15
.L7:
	uxtw	x6, w12
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
	add	w12, w12, w15
	add	w11, w11, w19
	ldrsh	w0, [x10, 2]
	ldrsh	w14, [x10, 4]
	add	x10, x20, x1
	cmp	w9, w18
	bne	.L7
	mul	w9, w9, w15
	add	x7, x9, 44
.L6:
	add	x9, x13, x9
	add	x7, x13, x7
	bl	compress_sample
	mov	w6, w0
	mov	w0, w14
	bl	compress_sample
	strb	w6, [x9, 44]
	mov	w1, w0
	strb	w1, [x7, 1]
	mov	x0, x13
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 21
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L8:
	.cfi_restore_state
	mov	x9, 0
	mov	x7, 44
	b	.L6
.L11:
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
	ldrh	w20, [x0, 32]
	ldr	w1, [x0, 24]
	str	x21, [sp, 32]
	.cfi_offset 21, -16
	ldr	w21, [x0, 40]
	ldrh	w0, [x0, 22]
	udiv	w21, w21, w20
	mov	w3, w21
	bl	new_wav
	cbz	x0, .L20
	ldrh	w10, [x0, 32]
	sub	w9, w21, #1
	ldrb	w5, [x19, 44]
	mov	w8, w20
	ldrb	w4, [x19, 45]
	mov	w7, 0
	mov	w6, 0
	cmp	w21, 1
	beq	.L12
	.p2align 5,,15
.L15:
	mvn	w5, w5
	mvn	w4, w4
	and	w3, w5, 15
	and	w2, w4, 15
	ubfx	x13, x5, 4, 3
	orr	w3, w3, 16
	add	w13, w13, 3
	ubfx	x12, x4, 4, 3
	uxtw	x11, w7
	sbfx	x1, x5, 7, 1
	lsl	w3, w3, w13
	and	w3, w3, 65535
	sub	w3, w3, #132
	orr	w2, w2, 16
	add	w12, w12, 3
	eor	w1, w1, w3
	ubfx	x5, x5, 7, 1
	add	x13, x0, x11
	add	x3, x0, x11
	add	w1, w1, w5
	lsl	w2, w2, w12
	and	w2, w2, 65535
	sbfx	x5, x4, 7, 1
	and	w1, w1, 65535
	sub	w2, w2, #132
	add	x11, x19, w8, uxtw
	eor	w2, w5, w2
	ubfx	x4, x4, 7, 1
	strb	w1, [x13, 44]
	add	w2, w2, w4
	sbfx	x1, x1, 8, 8
	strb	w1, [x3, 45]
	strh	w2, [x3, 46]
	add	w6, w6, 1
	add	w7, w7, w10
	add	w8, w8, w20
	ldrb	w5, [x11, 44]
	ldrb	w4, [x11, 45]
	cmp	w6, w9
	bne	.L15
.L12:
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 21
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
.L20:
	.cfi_restore_state
	mov	w0, 1
	bl	exit
	.cfi_endproc
.LFE83:
	.size	decompress_wav, .-decompress_wav
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
