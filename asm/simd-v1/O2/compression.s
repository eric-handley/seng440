	.arch armv8-a
	.file	"compression.c"
	.text
	.align	2
	.p2align 5,,15
	.global	vector_compress_samples
	.type	vector_compress_samples, %function
vector_compress_samples:
.LFB3996:
	.cfi_startproc
	cmlt	v29.8h, v0.8h, #0
	movi	v23.8h, 0x84
	mvni	v24.8h, 0x80, lsl 8
	mvni	v27.4s, 0
	add	v31.8h, v0.8h, v29.8h
	movi	v25.8h, 0xa
	movi	v30.8b, 0x7
	movi	v26.8b, 0xf
	movi	v28.8h, 0x80, lsl 8
	eor	v31.16b, v31.16b, v29.16b
	and	v28.16b, v0.16b, v28.16b
	add	v31.8h, v31.8h, v23.8h
	shrn	v28.8b, v28.8h, 8
	umin	v31.8h, v31.8h, v24.8h
	clz	v29.8h, v31.8h
	add	v29.8h, v29.8h, v27.8h
	xtn	v29.8b, v29.8h
	uxtl	v27.8h, v29.8b
	sub	v0.8b, v30.8b, v29.8b
	sub	v30.8h, v27.8h, v25.8h
	shl	v0.8b, v0.8b, 4
	ushl	v31.8h, v31.8h, v30.8h
	xtn	v31.8b, v31.8h
	and	v31.8b, v31.8b, v26.8b
	orr	v31.8b, v31.8b, v28.8b
	orr	v0.8b, v0.8b, v31.8b
	not	v0.8b, v0.8b
	ret
	.cfi_endproc
.LFE3996:
	.size	vector_compress_samples, .-vector_compress_samples
	.align	2
	.p2align 5,,15
	.global	vector_decompress_samples
	.type	vector_decompress_samples, %function
vector_decompress_samples:
.LFB3997:
	.cfi_startproc
	movi	v27.8b, 0x7f
	movi	v31.8b, 0xf
	movi	v25.8b, 0x10
	movi	v29.8b, 0x3
	movi	v28.8b, 0xffffffffffffff80
	not	v30.8b, v0.8b
	mvni	v26.8h, 0x83
	bic	v27.8b, v27.8b, v0.8b
	bic	v31.8b, v31.8b, v0.8b
	bic	v0.8b, v28.8b, v0.8b
	usra	v29.8b, v27.8b, 4
	orr	v31.8b, v31.8b, v25.8b
	sxtl	v28.8h, v29.8b
	uxtl	v31.8h, v31.8b
	shll	v29.8h, v30.8b, 8
	uxtl	v30.8h, v0.8b
	ushl	v31.8h, v31.8h, v28.8h
	cmlt	v0.8h, v29.8h, #0
	add	v31.8h, v31.8h, v26.8h
	eor	v0.16b, v0.16b, v31.16b
	ssra	v0.8h, v30.8h, 7
	ret
	.cfi_endproc
.LFE3997:
	.size	vector_decompress_samples, .-vector_decompress_samples
	.align	2
	.p2align 5,,15
	.global	compress_sample
	.type	compress_sample, %function
compress_sample:
.LFB3998:
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
.LFE3998:
	.size	compress_sample, .-compress_sample
	.align	2
	.p2align 5,,15
	.global	decompress_sample
	.type	decompress_sample, %function
decompress_sample:
.LFB3999:
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
.LFE3999:
	.size	decompress_sample, .-decompress_sample
	.align	2
	.p2align 5,,15
	.global	compress_wav
	.type	compress_wav, %function
compress_wav:
.LFB4000:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	w4, 7
	mov	w2, 8
	mov	x29, sp
	ldrh	w3, [x0, 32]
	ldr	w5, [x0, 40]
	str	x19, [sp, 16]
	.cfi_offset 19, -16
	mov	x19, x0
	ldrh	w0, [x0, 22]
	udiv	w3, w5, w3
	ldr	w1, [x19, 24]
	bl	new_wav
	cbz	x0, .L16
	mov	x10, x0
	ldr	w0, [x19, 40]
	lsr	w7, w0, 1
	cmp	w0, 15
	bls	.L12
	add	x3, x19, 44
	add	x2, x10, 44
	mov	w1, 8
	.p2align 5,,15
.L9:
	ldr	q0, [x3], 16
	uxtw	x6, w1
	add	w1, w1, 8
	bl	vector_compress_samples
	str	d0, [x2], 8
	cmp	w7, w1
	bcs	.L9
.L8:
	cmp	w7, w6
	bls	.L6
	add	x19, x19, 44
	add	x9, x10, 44
	.p2align 5,,15
.L11:
	ldrh	w0, [x19, x6, lsl 1]
	bl	compress_sample
	strb	w0, [x9, x6]
	add	x6, x6, 1
	cmp	w7, w6
	bhi	.L11
.L6:
	ldr	x19, [sp, 16]
	mov	x0, x10
	ldp	x29, x30, [sp], 32
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L12:
	.cfi_restore_state
	mov	x6, 0
	b	.L8
.L16:
	mov	w0, 1
	bl	exit
	.cfi_endproc
.LFE4000:
	.size	compress_wav, .-compress_wav
	.align	2
	.p2align 5,,15
	.global	decompress_wav
	.type	decompress_wav, %function
decompress_wav:
.LFB4001:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	w4, 1
	mov	w2, 16
	mov	x29, sp
	ldrh	w3, [x0, 32]
	ldr	w5, [x0, 40]
	str	x19, [sp, 16]
	.cfi_offset 19, -16
	mov	x19, x0
	ldrh	w0, [x0, 22]
	udiv	w3, w5, w3
	ldr	w1, [x19, 24]
	bl	new_wav
	cbz	x0, .L28
	ldr	w7, [x19, 40]
	add	x8, x0, 44
	add	x19, x19, 44
	cmp	w7, 7
	bls	.L23
	mov	w1, 8
	.p2align 5,,15
.L20:
	sub	w3, w1, #8
	sub	w2, w1, #8
	lsl	x2, x2, 1
	ldr	d0, [x19, w3, uxtw]
	uxtw	x3, w1
	add	w1, w1, 8
	bl	vector_decompress_samples
	str	q0, [x8, x2]
	cmp	w7, w1
	bcs	.L20
	cmp	w7, w3
	bls	.L29
	.p2align 5,,15
.L22:
	ldrb	w2, [x19, x3]
	mvn	w2, w2
	and	w1, w2, 15
	ubfx	x5, x2, 4, 3
	orr	w1, w1, 16
	add	w5, w5, 3
	sbfx	x4, x2, 7, 1
	ubfx	x2, x2, 7, 1
	lsl	w1, w1, w5
	and	w1, w1, 65535
	sub	w1, w1, #132
	eor	w1, w4, w1
	add	w1, w1, w2
	strh	w1, [x8, x3, lsl 1]
	add	x3, x3, 1
.L27:
	cmp	w7, w3
	bhi	.L22
.L29:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L23:
	.cfi_restore_state
	mov	x3, 0
	b	.L27
.L28:
	mov	w0, 1
	bl	exit
	.cfi_endproc
.LFE4001:
	.size	decompress_wav, .-decompress_wav
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
