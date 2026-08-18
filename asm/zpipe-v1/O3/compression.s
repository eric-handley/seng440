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
	cbz	x0, .L15
	ldrh	w8, [x0, 32]
	add	x3, x19, 44
	ldrsh	w4, [x19, 44]
	ldrsh	w12, [x19, 46]
	cmp	w22, w20
	bcc	.L4
	cmp	w8, 1
	bne	.L16
	mov	w6, w20
	mov	w8, 0
	mov	w7, 0
	mov	w10, 7
	mov	w9, 10
	.p2align 5,,15
.L7:
	asr	w2, w4, 15
	asr	w1, w12, 15
	and	w2, w2, 65535
	and	w1, w1, 65535
	add	w11, w2, w4, uxth
	add	w5, w1, w12, uxth
	eor	w2, w2, w11
	eor	w1, w1, w5
	and	w2, w2, 65535
	and	w1, w1, 65535
	add	w2, w2, 132
	add	w1, w1, 132
	and	w13, w2, 65535
	and	w5, w1, 65535
	eor	w13, w13, 32767
	sbfx	x11, x2, 15, 1
	and	w11, w11, w13
	eor	w5, w5, 32767
	sbfx	x13, x1, 15, 1
	eor	w2, w2, w11
	and	w5, w5, w13
	and	w2, w2, 65535
	eor	w1, w1, w5
	clz	w13, w2
	and	w1, w1, 65535
	sub	w13, w13, #17
	clz	w11, w1
	ubfx	x4, x4, 8, 8
	sub	w11, w11, #17
	sub	w5, w10, w13, uxtb
	sub	w13, w9, w13, uxtb
	uxtw	x14, w8
	and	w16, w4, 128
	ubfx	x12, x12, 8, 8
	sub	w4, w10, w11, uxtb
	sub	w11, w9, w11, uxtb
	add	x15, x0, x14
	and	w12, w12, 128
	orr	w5, w16, w5, lsl 4
	asr	w2, w2, w13
	and	w2, w2, 15
	asr	w1, w1, w11
	orr	w5, w5, w2
	and	w1, w1, 15
	orr	w2, w12, w4, lsl 4
	mvn	w4, w5
	orr	w1, w2, w1
	uxtw	x2, w6
	mvn	w1, w1
	strb	w4, [x15, 44]
	strb	w1, [x15, 45]
	add	w7, w7, 1
	add	x1, x2, 44
	add	w8, w8, 1
	ldrsh	w4, [x3, 2]
	add	w6, w6, w20
	ldrsh	w12, [x3, 4]
	add	x3, x19, x1
	cmp	w21, w7
	bhi	.L7
.L4:
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
	.p2align 2,,3
.L16:
	.cfi_restore_state
	mov	w5, w20
	mov	w7, 0
	mov	w6, 0
	mov	w10, 7
	mov	w9, 10
	.p2align 5,,15
.L8:
	asr	w2, w4, 15
	asr	w1, w12, 15
	and	w2, w2, 65535
	and	w1, w1, 65535
	add	w13, w2, w4, uxth
	add	w11, w1, w12, uxth
	eor	w2, w2, w13
	eor	w1, w1, w11
	and	w2, w2, 65535
	and	w1, w1, 65535
	add	w2, w2, 132
	add	w1, w1, 132
	and	w11, w2, 65535
	and	w13, w1, 65535
	eor	w11, w11, 32767
	sbfx	x14, x2, 15, 1
	and	w14, w14, w11
	eor	w13, w13, 32767
	sbfx	x11, x1, 15, 1
	eor	w2, w2, w14
	and	w11, w11, w13
	and	w2, w2, 65535
	eor	w1, w1, w11
	clz	w11, w2
	and	w1, w1, 65535
	sub	w11, w11, #17
	clz	w13, w1
	ubfx	x17, x4, 8, 8
	sub	w13, w13, #17
	sub	w4, w10, w11, uxtb
	sub	w14, w9, w11, uxtb
	uxtw	x15, w7
	sub	w11, w10, w13, uxtb
	and	w17, w17, 128
	ubfx	x12, x12, 8, 8
	sub	w13, w9, w13, uxtb
	add	x16, x0, x15
	and	w12, w12, 128
	orr	w4, w17, w4, lsl 4
	asr	w2, w2, w14
	and	w2, w2, 15
	asr	w1, w1, w13
	orr	w4, w4, w2
	and	w1, w1, 15
	orr	w2, w12, w11, lsl 4
	mvn	w4, w4
	orr	w1, w2, w1
	uxtw	x2, w5
	mvn	w1, w1
	strb	w4, [x16, 44]
	strb	w1, [x16, 45]
	add	w6, w6, 1
	add	x1, x2, 44
	add	w7, w7, w8
	ldrsh	w4, [x3, 2]
	add	w5, w5, w20
	ldrsh	w12, [x3, 4]
	add	x3, x19, x1
	cmp	w6, w21
	bcc	.L8
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
.L15:
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
	ldrh	w21, [x0, 32]
	ldr	w22, [x0, 40]
	ldr	w1, [x19, 24]
	ldrh	w0, [x0, 22]
	udiv	w20, w22, w21
	mov	w3, w20
	bl	new_wav
	cbz	x0, .L28
	ldrh	w9, [x0, 32]
	ldrb	w2, [x19, 44]
	ldrb	w1, [x19, 45]
	cmp	w22, w21
	bcc	.L17
	cmp	w9, 1
	ccmp	w21, 1, 0, eq
	bne	.L29
	mov	w9, 0
	mov	w8, 0
	mov	w7, 1
	.p2align 5,,15
.L20:
	mvn	w2, w2
	mvn	w1, w1
	and	w6, w2, 15
	and	w5, w1, 15
	ubfx	x11, x2, 4, 3
	orr	w6, w6, 16
	add	w11, w11, 3
	ubfx	x10, x1, 4, 3
	uxtw	x3, w9
	sbfx	x4, x2, 7, 1
	lsl	w6, w6, w11
	and	w6, w6, 65535
	sub	w6, w6, #132
	orr	w5, w5, 16
	add	w10, w10, 3
	eor	w4, w4, w6
	ubfx	x2, x2, 7, 1
	add	x6, x0, x3
	add	w2, w4, w2
	add	x3, x0, x3
	lsl	w4, w5, w10
	and	w4, w4, 65535
	sbfx	x5, x1, 7, 1
	and	w2, w2, 65535
	sub	w4, w4, #132
	ubfx	x1, x1, 7, 1
	eor	w4, w5, w4
	add	x5, x19, w7, uxtw
	strb	w2, [x6, 44]
	add	w1, w4, w1
	sbfx	x2, x2, 8, 8
	strb	w2, [x3, 45]
	strh	w1, [x3, 46]
	add	w8, w8, 1
	add	w9, w9, 1
	add	w7, w7, 1
	ldrb	w2, [x5, 44]
	ldrb	w1, [x5, 45]
	cmp	w20, w8
	bhi	.L20
.L17:
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
	.p2align 2,,3
.L29:
	.cfi_restore_state
	mov	w6, w21
	mov	w8, 0
	mov	w7, 0
	.p2align 5,,15
.L21:
	mvn	w2, w2
	mvn	w1, w1
	and	w5, w2, 15
	and	w4, w1, 15
	ubfx	x12, x2, 4, 3
	orr	w5, w5, 16
	add	w12, w12, 3
	ubfx	x11, x1, 4, 3
	uxtw	x10, w8
	sbfx	x3, x2, 7, 1
	lsl	w5, w5, w12
	and	w5, w5, 65535
	sub	w5, w5, #132
	orr	w4, w4, 16
	add	w11, w11, 3
	eor	w3, w3, w5
	ubfx	x2, x2, 7, 1
	add	x12, x0, x10
	add	w2, w3, w2
	add	x5, x0, x10
	lsl	w3, w4, w11
	and	w3, w3, 65535
	sbfx	x4, x1, 7, 1
	and	w2, w2, 65535
	sub	w3, w3, #132
	ubfx	x1, x1, 7, 1
	eor	w3, w4, w3
	add	x4, x19, w6, uxtw
	strb	w2, [x12, 44]
	add	w1, w3, w1
	sbfx	x2, x2, 8, 8
	strb	w2, [x5, 45]
	strh	w1, [x5, 46]
	add	w7, w7, 1
	add	w8, w8, w9
	add	w6, w6, w21
	ldrb	w2, [x4, 44]
	ldrb	w1, [x4, 45]
	cmp	w7, w20
	bcc	.L21
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
.L28:
	.cfi_restore_state
	mov	w0, 1
	bl	exit
	.cfi_endproc
.LFE83:
	.size	decompress_wav, .-decompress_wav
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
