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
	cbz	x0, .L15
	ldrh	w13, [x19, 44]
	add	x4, x19, 44
	ldrh	w2, [x19, 46]
	sub	w10, w21, #1
	ldrh	w11, [x0, 32]
	sxth	w12, w13
	sxth	w14, w2
	cmp	w21, 1
	beq	.L10
	cmp	w11, 1
	bne	.L16
	mov	w5, w20
	mov	w7, 0
	mov	w6, 0
	mov	w9, 7
	mov	w8, 10
	.p2align 5,,15
.L7:
	asr	w2, w12, 15
	asr	w1, w14, 15
	and	w2, w2, 65535
	and	w1, w1, 65535
	add	w13, w2, w12, uxth
	add	w3, w1, w14, uxth
	eor	w2, w2, w13
	eor	w1, w1, w3
	and	w2, w2, 65535
	and	w1, w1, 65535
	add	w2, w2, 132
	add	w1, w1, 132
	and	w13, w2, 65535
	and	w3, w1, 65535
	sbfx	x15, x2, 15, 1
	eor	w13, w13, 32767
	and	w13, w13, w15
	eor	w3, w3, 32767
	sbfx	x15, x1, 15, 1
	eor	w2, w2, w13
	and	w3, w3, w15
	and	w2, w2, 65535
	eor	w1, w1, w3
	clz	w3, w2
	and	w1, w1, 65535
	sub	w3, w3, #17
	clz	w13, w1
	ubfx	x18, x12, 8, 8
	sub	w13, w13, #17
	sub	w12, w9, w3, uxtb
	sub	w15, w8, w3, uxtb
	uxtw	x16, w7
	sub	w3, w9, w13, uxtb
	and	w18, w18, 128
	sub	w13, w8, w13, uxtb
	ubfx	x14, x14, 8, 8
	add	x17, x0, x16
	and	w14, w14, 128
	orr	w12, w18, w12, lsl 4
	asr	w2, w2, w15
	and	w2, w2, 15
	asr	w1, w1, w13
	orr	w12, w12, w2
	and	w1, w1, 15
	orr	w2, w14, w3, lsl 4
	mvn	w3, w12
	orr	w1, w2, w1
	strb	w3, [x17, 44]
	mvn	w1, w1
	strb	w1, [x17, 45]
	uxtw	x1, w5
	add	w6, w6, 1
	ldrh	w13, [x4, 2]
	add	x1, x1, 44
	ldrh	w2, [x4, 4]
	add	w7, w7, 1
	add	w5, w5, w20
	add	x4, x19, x1
	sxth	w12, w13
	sxth	w14, w2
	cmp	w10, w6
	bne	.L7
.L9:
	mul	w11, w10, w11
	add	x8, x11, 44
.L6:
	asr	w12, w12, 15
	asr	w14, w14, 15
	mov	w4, 7
	mov	w7, 10
	add	w3, w13, w12, uxth
	add	w1, w2, w14, uxth
	eor	w3, w3, w12
	eor	w1, w1, w14
	and	w3, w3, 65535
	and	w1, w1, 65535
	add	w3, w3, 132
	add	w1, w1, 132
	and	w5, w3, 65535
	and	w6, w1, 65535
	eor	w5, w5, 32767
	sbfx	x9, x3, 15, 1
	and	w9, w9, w5
	eor	w6, w6, 32767
	sbfx	x5, x1, 15, 1
	eor	w3, w3, w9
	and	w5, w5, w6
	and	w3, w3, 65535
	eor	w1, w1, w5
	clz	w6, w3
	and	w1, w1, 65535
	sub	w6, w6, #17
	clz	w9, w1
	lsr	w13, w13, 8
	sub	w9, w9, #17
	sub	w5, w4, w6, uxtb
	sub	w6, w7, w6, uxtb
	add	x11, x0, x11
	and	w13, w13, 128
	sub	w4, w4, w9, uxtb
	sub	w7, w7, w9, uxtb
	lsr	w2, w2, 8
	add	x8, x0, x8
	orr	w5, w13, w5, lsl 4
	and	w2, w2, 128
	asr	w3, w3, w6
	and	w3, w3, 15
	orr	w4, w2, w4, lsl 4
	asr	w1, w1, w7
	orr	w2, w5, w3
	and	w1, w1, 15
	mvn	w2, w2
	orr	w1, w4, w1
	strb	w2, [x11, 44]
	mvn	w1, w1
	strb	w1, [x8, 1]
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
.L16:
	.cfi_restore_state
	mov	w3, w20
	mov	w6, 0
	mov	w5, 0
	mov	w8, 7
	mov	w7, 10
	.p2align 5,,15
.L8:
	asr	w2, w12, 15
	asr	w1, w14, 15
	and	w2, w2, 65535
	and	w1, w1, 65535
	add	w13, w2, w12, uxth
	add	w9, w1, w14, uxth
	eor	w2, w2, w13
	eor	w1, w1, w9
	and	w2, w2, 65535
	and	w1, w1, 65535
	add	w2, w2, 132
	add	w1, w1, 132
	and	w9, w2, 65535
	and	w13, w1, 65535
	eor	w9, w9, 32767
	sbfx	x15, x2, 15, 1
	and	w15, w15, w9
	eor	w13, w13, 32767
	sbfx	x9, x1, 15, 1
	eor	w2, w2, w15
	and	w9, w9, w13
	and	w2, w2, 65535
	eor	w1, w1, w9
	clz	w9, w2
	and	w1, w1, 65535
	sub	w9, w9, #17
	clz	w13, w1
	ubfx	x18, x12, 8, 8
	sub	w13, w13, #17
	sub	w12, w8, w9, uxtb
	sub	w15, w7, w9, uxtb
	uxtw	x16, w6
	sub	w9, w8, w13, uxtb
	and	w18, w18, 128
	sub	w13, w7, w13, uxtb
	ubfx	x14, x14, 8, 8
	add	x17, x0, x16
	and	w14, w14, 128
	orr	w12, w18, w12, lsl 4
	asr	w2, w2, w15
	and	w2, w2, 15
	asr	w1, w1, w13
	orr	w12, w12, w2
	and	w1, w1, 15
	orr	w2, w14, w9, lsl 4
	mvn	w9, w12
	orr	w1, w2, w1
	strb	w9, [x17, 44]
	mvn	w1, w1
	strb	w1, [x17, 45]
	uxtw	x1, w3
	add	w5, w5, 1
	ldrh	w13, [x4, 2]
	add	x1, x1, 44
	ldrh	w2, [x4, 4]
	add	w6, w6, w11
	add	w3, w3, w20
	add	x4, x19, x1
	sxth	w12, w13
	sxth	w14, w2
	cmp	w5, w10
	bne	.L8
	b	.L9
	.p2align 2,,3
.L10:
	mov	x11, 0
	mov	x8, 44
	b	.L6
.L15:
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
	cbz	x0, .L28
	ldrh	w10, [x0, 32]
	sub	w7, w21, #1
	ldrb	w2, [x19, 44]
	ldrb	w1, [x19, 45]
	cmp	w21, 1
	beq	.L17
	cmp	w10, 1
	ccmp	w20, 1, 0, eq
	bne	.L29
	mov	w10, 0
	mov	w9, 0
	mov	w8, 1
	.p2align 5,,15
.L20:
	mvn	w2, w2
	mvn	w1, w1
	and	w5, w2, 15
	and	w4, w1, 15
	ubfx	x12, x2, 4, 3
	orr	w5, w5, 16
	add	w12, w12, 3
	ubfx	x11, x1, 4, 3
	uxtw	x6, w10
	sbfx	x3, x2, 7, 1
	lsl	w5, w5, w12
	and	w5, w5, 65535
	sub	w5, w5, #132
	orr	w4, w4, 16
	add	w11, w11, 3
	eor	w3, w3, w5
	ubfx	x2, x2, 7, 1
	add	x12, x0, x6
	add	w2, w3, w2
	add	x5, x0, x6
	lsl	w3, w4, w11
	and	w3, w3, 65535
	sbfx	x4, x1, 7, 1
	and	w2, w2, 65535
	sub	w3, w3, #132
	ubfx	x1, x1, 7, 1
	eor	w3, w4, w3
	add	x4, x19, w8, uxtw
	strb	w2, [x12, 44]
	add	w1, w3, w1
	sbfx	x2, x2, 8, 8
	strb	w2, [x5, 45]
	strh	w1, [x5, 46]
	add	w9, w9, 1
	add	w10, w10, 1
	add	w8, w8, 1
	ldrb	w2, [x4, 44]
	ldrb	w1, [x4, 45]
	cmp	w7, w9
	bne	.L20
.L17:
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
.L29:
	.cfi_restore_state
	mov	w6, w20
	mov	w9, 0
	mov	w8, 0
	.p2align 5,,15
.L21:
	mvn	w2, w2
	mvn	w1, w1
	and	w5, w2, 15
	and	w4, w1, 15
	ubfx	x13, x2, 4, 3
	orr	w5, w5, 16
	add	w13, w13, 3
	ubfx	x12, x1, 4, 3
	uxtw	x11, w9
	sbfx	x3, x2, 7, 1
	lsl	w5, w5, w13
	and	w5, w5, 65535
	sub	w5, w5, #132
	orr	w4, w4, 16
	add	w12, w12, 3
	eor	w3, w3, w5
	ubfx	x2, x2, 7, 1
	add	x13, x0, x11
	add	w2, w3, w2
	add	x5, x0, x11
	lsl	w3, w4, w12
	and	w3, w3, 65535
	sbfx	x4, x1, 7, 1
	and	w2, w2, 65535
	sub	w3, w3, #132
	ubfx	x1, x1, 7, 1
	eor	w3, w4, w3
	add	x4, x19, w6, uxtw
	strb	w2, [x13, 44]
	add	w1, w3, w1
	sbfx	x2, x2, 8, 8
	strb	w2, [x5, 45]
	strh	w1, [x5, 46]
	add	w8, w8, 1
	add	w9, w9, w10
	add	w6, w6, w20
	ldrb	w2, [x4, 44]
	ldrb	w1, [x4, 45]
	cmp	w8, w7
	bne	.L21
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
.L28:
	.cfi_restore_state
	mov	w0, 1
	bl	exit
	.cfi_endproc
.LFE83:
	.size	decompress_wav, .-decompress_wav
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
