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
	mov	w4, 10
	mov	w2, 7
	add	w1, w0, w3, uxth
	lsr	w0, w0, 8
	eor	w1, w1, w3
	and	w0, w0, 128
	and	w1, w1, 65535
	add	w1, w1, 132
	and	w5, w1, 65535
	eor	w5, w5, 32767
	sbfx	x3, x1, 15, 1
	and	w3, w3, w5
	eor	w1, w1, w3
	and	w1, w1, 65535
	clz	w3, w1
	sub	w3, w3, #17
	sub	w2, w2, w3, uxtb
	sub	w3, w4, w3, uxtb
	orr	w0, w0, w2, lsl 4
	asr	w1, w1, w3
	and	w1, w1, 15
	orr	w0, w0, w1
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
	and	w1, w0, 15
	ubfx	w3, w0, 4, 3
	add	w3, w3, 3
	orr	w1, w1, 16
	sbfiz	w2, w0, 8, 8
	ubfx	w0, w0, 7, 1
	lsl	w1, w1, w3
	and	w1, w1, 65535
	sub	w1, w1, #132
	eor	w2, w1, w2, asr 31
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
	mov	w2, 8
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
	cbz	x0, .L15
	ldrh	w7, [x0, 32]
	cmp	w22, w21
	bcc	.L4
	cmp	w21, 1
	ccmp	w7, 1, 0, eq
	bne	.L16
	mov	w7, 0
	mov	w6, 0
	mov	w3, 0
	mov	w9, 7
	mov	w8, 10
	.p2align 5,,15
.L7:
	uxtw	x1, w6
	add	x5, x0, w7, uxtw
	mov	x2, x1
	add	x1, x19, x1
	add	x2, x19, x2
	add	w3, w3, 1
	add	w6, w6, 1
	add	w7, w7, 1
	ldrb	w4, [x1, 44]
	ldrb	w1, [x2, 45]
	ldrh	w2, [x2, 46]
	ubfiz	w1, w1, 8, 8
	orr	w4, w1, w4
	sbfx	x10, x2, 15, 1
	sbfx	x1, x1, 15, 1
	lsr	w12, w2, 8
	and	w1, w1, 65535
	add	w2, w2, w10, uxth
	add	w11, w1, w4, uxth
	eor	w2, w2, w10
	eor	w1, w1, w11
	and	w2, w2, 65535
	and	w1, w1, 65535
	add	w2, w2, 132
	add	w1, w1, 132
	and	w10, w2, 65535
	and	w11, w1, 65535
	sbfx	x13, x2, 15, 1
	sbfx	x14, x1, 15, 1
	eor	w10, w10, 32767
	eor	w11, w11, 32767
	and	w10, w10, w13
	and	w11, w11, w14
	eor	w2, w2, w10
	eor	w1, w1, w11
	and	w2, w2, 65535
	and	w1, w1, 65535
	clz	w10, w2
	clz	w11, w1
	sub	w10, w10, #17
	sub	w11, w11, #17
	ubfx	x4, x4, 8, 8
	sub	w13, w9, w10, uxtb
	sub	w10, w8, w10, uxtb
	sub	w14, w9, w11, uxtb
	sub	w11, w8, w11, uxtb
	and	w4, w4, 128
	and	w12, w12, 128
	orr	w4, w4, w14, lsl 4
	orr	w12, w12, w13, lsl 4
	asr	w1, w1, w11
	and	w1, w1, 15
	asr	w2, w2, w10
	and	w2, w2, 15
	orr	w4, w4, w1
	orr	w1, w12, w2
	strb	w4, [x5, 44]
	strb	w1, [x5, 45]
	cmp	w20, w3
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
	mov	w5, 0
	mov	w4, 0
	mov	w3, 0
	mov	w9, 7
	mov	w8, 10
	.p2align 5,,15
.L8:
	uxtw	x1, w4
	add	x6, x0, w5, uxtw
	mov	x2, x1
	add	x1, x19, x1
	add	x2, x19, x2
	add	w3, w3, 1
	add	w4, w4, w21
	add	w5, w5, w7
	ldrb	w10, [x1, 44]
	ldrb	w1, [x2, 45]
	ldrh	w2, [x2, 46]
	ubfiz	w1, w1, 8, 8
	orr	w10, w1, w10
	sbfx	x11, x2, 15, 1
	sbfx	x1, x1, 15, 1
	lsr	w12, w2, 8
	and	w1, w1, 65535
	add	w2, w2, w11, uxth
	add	w13, w1, w10, uxth
	eor	w2, w2, w11
	eor	w1, w1, w13
	and	w2, w2, 65535
	and	w1, w1, 65535
	add	w2, w2, 132
	add	w1, w1, 132
	and	w14, w2, 65535
	and	w15, w1, 65535
	eor	w14, w14, 32767
	eor	w15, w15, 32767
	sbfx	x13, x1, 15, 1
	sbfx	x11, x2, 15, 1
	and	w13, w13, w15
	and	w11, w11, w14
	eor	w1, w1, w13
	eor	w2, w2, w11
	and	w1, w1, 65535
	and	w2, w2, 65535
	clz	w13, w1
	clz	w11, w2
	sub	w13, w13, #17
	sub	w11, w11, #17
	ubfx	x10, x10, 8, 8
	sub	w15, w9, w13, uxtb
	sub	w13, w8, w13, uxtb
	sub	w14, w9, w11, uxtb
	sub	w11, w8, w11, uxtb
	and	w10, w10, 128
	and	w12, w12, 128
	orr	w15, w10, w15, lsl 4
	asr	w2, w2, w11
	orr	w10, w12, w14, lsl 4
	and	w2, w2, 15
	asr	w1, w1, w13
	and	w1, w1, 15
	orr	w11, w15, w1
	orr	w1, w10, w2
	strb	w11, [x6, 44]
	strb	w1, [x6, 45]
	cmp	w20, w3
	bhi	.L8
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
	ldrh	w10, [x0, 32]
	cmp	w22, w21
	bcc	.L17
	cmp	w10, 1
	ccmp	w21, 1, 0, eq
	bne	.L29
	mov	w10, 0
	mov	w9, 0
	mov	w8, 0
	.p2align 5,,15
.L20:
	add	x2, x19, w9, uxtw
	uxtw	x5, w10
	add	x11, x0, x5
	add	x5, x0, x5
	add	w8, w8, 1
	add	w9, w9, 1
	ldrb	w1, [x2, 44]
	add	w10, w10, 1
	ldrb	w6, [x2, 45]
	and	w4, w1, 15
	ubfx	x12, x1, 4, 3
	orr	w4, w4, 16
	add	w12, w12, 3
	and	w2, w6, 15
	ubfx	x7, x6, 4, 3
	sbfx	x3, x1, 7, 1
	lsl	w4, w4, w12
	and	w4, w4, 65535
	sub	w4, w4, #132
	orr	w2, w2, 16
	add	w7, w7, 3
	eor	w3, w3, w4
	add	w1, w3, w1, lsr 7
	sbfx	x4, x6, 7, 1
	lsl	w2, w2, w7
	and	w2, w2, 65535
	and	w1, w1, 65535
	sub	w2, w2, #132
	eor	w2, w4, w2
	strb	w1, [x11, 44]
	add	w6, w2, w6, lsr 7
	sbfx	x1, x1, 8, 8
	strb	w1, [x5, 45]
	strh	w6, [x5, 46]
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
	mov	w9, 0
	mov	w8, 0
	mov	w7, 0
	.p2align 5,,15
.L21:
	add	x2, x19, w8, uxtw
	uxtw	x4, w9
	add	x11, x0, x4
	add	x4, x0, x4
	add	w7, w7, 1
	add	w8, w8, w21
	ldrb	w1, [x2, 44]
	add	w9, w9, w10
	ldrb	w5, [x2, 45]
	and	w3, w1, 15
	ubfx	x13, x1, 4, 3
	orr	w3, w3, 16
	add	w13, w13, 3
	and	w2, w5, 15
	ubfx	x6, x5, 4, 3
	sbfx	x12, x1, 7, 1
	lsl	w3, w3, w13
	and	w3, w3, 65535
	sub	w3, w3, #132
	orr	w2, w2, 16
	add	w6, w6, 3
	eor	w3, w12, w3
	add	w1, w3, w1, lsr 7
	sbfx	x3, x5, 7, 1
	lsl	w2, w2, w6
	and	w2, w2, 65535
	and	w1, w1, 65535
	sub	w2, w2, #132
	eor	w2, w3, w2
	strb	w1, [x11, 44]
	add	w5, w2, w5, lsr 7
	sbfx	x1, x1, 8, 8
	strb	w1, [x4, 45]
	strh	w5, [x4, 46]
	cmp	w20, w7
	bhi	.L21
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
