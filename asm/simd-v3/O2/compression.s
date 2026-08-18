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
	movi	v25.8h, 0x84
	abs	v31.8h, v0.8h
	mvni	v28.8h, 0x80, lsl 8
	movi	v27.8h, 0xb
	shrn	v0.8b, v0.8h, 8
	add	v31.8h, v31.8h, v25.8h
	movi	v30.8b, 0xffffffffffffff80
	movi	v26.8b, 0xf
	movi	v29.8b, 0x8
	umin	v31.8h, v31.8h, v28.8h
	and	v30.8b, v0.8b, v30.8b
	clz	v28.8h, v31.8h
	sub	v27.8h, v28.8h, v27.8h
	xtn	v28.8b, v28.8h
	ushl	v0.8h, v31.8h, v27.8h
	sub	v31.8b, v29.8b, v28.8b
	xtn	v0.8b, v0.8h
	shl	v31.8b, v31.8b, 4
	and	v0.8b, v0.8b, v26.8b
	orr	v0.8b, v0.8b, v30.8b
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
	movi	v28.8b, 0x70
	movi	v31.8b, 0xf
	movi	v26.8b, 0x10
	movi	v29.8b, 0x3
	not	v30.8b, v0.8b
	mvni	v27.8h, 0x83
	bic	v28.8b, v28.8b, v0.8b
	bic	v31.8b, v31.8b, v0.8b
	sxtl	v0.8h, v30.8b
	usra	v29.8b, v28.8b, 4
	orr	v31.8b, v31.8b, v26.8b
	sshr	v0.8h, v0.8h, 7
	sxtl	v29.8h, v29.8b
	uxtl	v31.8h, v31.8b
	ushl	v31.8h, v31.8h, v29.8h
	add	v31.8h, v31.8h, v27.8h
	eor	v31.16b, v31.16b, v0.16b
	sub	v0.8h, v31.8h, v0.8h
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
	sbfx	x0, x0, 7, 1
	and	w2, w0, 65535
	lsl	w0, w1, w3
	and	w0, w0, 65535
	sub	w0, w0, #132
	eor	w0, w2, w0
	sub	w0, w0, w2
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
	ldr	w1, [x19, 40]
	lsr	w7, w1, 1
	cmp	w1, 15
	bls	.L12
	movi	v31.8h, 0x84
	add	x3, x19, 44
	mvni	v30.8h, 0x80, lsl 8
	add	x2, x0, 44
	movi	v29.8h, 0xb
	mov	w1, 8
	movi	v28.8b, 0xffffffffffffff80
	movi	v27.8b, 0xf
	movi	v26.8b, 0x8
	.p2align 5,,15
.L9:
	ldr	q25, [x3], 16
	uxtw	x4, w1
	add	w1, w1, 8
	abs	v24.8h, v25.8h
	shrn	v25.8b, v25.8h, 8
	add	v24.8h, v24.8h, v31.8h
	and	v25.8b, v25.8b, v28.8b
	umin	v24.8h, v24.8h, v30.8h
	clz	v23.8h, v24.8h
	xtn	v22.8b, v23.8h
	sub	v23.8h, v23.8h, v29.8h
	sub	v22.8b, v26.8b, v22.8b
	ushl	v23.8h, v24.8h, v23.8h
	shl	v22.8b, v22.8b, 4
	xtn	v23.8b, v23.8h
	and	v23.8b, v23.8b, v27.8b
	orr	v23.8b, v25.8b, v23.8b
	orr	v22.8b, v23.8b, v22.8b
	not	v22.8b, v22.8b
	str	d22, [x2], 8
	cmp	w7, w1
	bcs	.L9
.L8:
	cmp	w7, w4
	bls	.L6
	add	x6, x19, 44
	add	x10, x0, 44
	mov	w9, 7
	mov	w8, 10
	.p2align 5,,15
.L11:
	ldrsh	w2, [x6, x4, lsl 1]
	asr	w1, w2, 15
	ubfx	x5, x2, 8, 8
	and	w1, w1, 65535
	and	w5, w5, 128
	add	w2, w1, w2, uxth
	eor	w1, w1, w2
	and	w1, w1, 65535
	add	w1, w1, 132
	and	w3, w1, 65535
	eor	w3, w3, 32767
	sbfx	x2, x1, 15, 1
	and	w2, w2, w3
	eor	w1, w1, w2
	and	w1, w1, 65535
	clz	w3, w1
	sub	w3, w3, #17
	sub	w2, w9, w3, uxtb
	sub	w3, w8, w3, uxtb
	orr	w2, w5, w2, lsl 4
	asr	w1, w1, w3
	and	w1, w1, 15
	orr	w1, w2, w1
	mvn	w1, w1
	strb	w1, [x10, x4]
	add	x4, x4, 1
	cmp	w7, w4
	bhi	.L11
.L6:
	ldr	x19, [sp, 16]
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
	mov	x4, 0
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
	ldr	w6, [x19, 40]
	add	x5, x19, 44
	add	x7, x0, 44
	cmp	w6, 7
	bls	.L23
	movi	v27.4s, 0
	mov	w1, 8
	movi	v22.8b, 0x3
	movi	v23.8b, 0x70
	movi	v24.8b, 0xf
	movi	v25.8b, 0x10
	mvni	v26.8h, 0x83
	.p2align 5,,15
.L20:
	sub	w4, w1, #8
	mov	v29.8b, v22.8b
	sub	w2, w1, #8
	uxtw	x3, w1
	add	w1, w1, 8
	ldr	d30, [x5, w4, uxtw]
	lsl	x2, x2, 1
	bic	v28.8b, v23.8b, v30.8b
	bic	v31.8b, v24.8b, v30.8b
	not	v30.8b, v30.8b
	usra	v29.8b, v28.8b, 4
	orr	v31.8b, v31.8b, v25.8b
	sxtl	v30.8h, v30.8b
	sxtl	v29.8h, v29.8b
	zip1	v31.16b, v31.16b, v27.16b
	sshr	v30.8h, v30.8h, 7
	ushl	v31.8h, v31.8h, v29.8h
	add	v31.8h, v31.8h, v26.8h
	eor	v31.16b, v31.16b, v30.16b
	sub	v31.8h, v31.8h, v30.8h
	str	q31, [x7, x2]
	cmp	w6, w1
	bcs	.L20
	cmp	w6, w3
	bls	.L29
	.p2align 5,,15
.L22:
	ldrb	w2, [x5, x3]
	mvn	w2, w2
	and	w1, w2, 15
	ubfx	x4, x2, 4, 3
	orr	w1, w1, 16
	add	w4, w4, 3
	sbfx	x2, x2, 7, 1
	and	w2, w2, 65535
	lsl	w1, w1, w4
	and	w1, w1, 65535
	sub	w1, w1, #132
	eor	w1, w2, w1
	sub	w1, w1, w2
	strh	w1, [x7, x3, lsl 1]
	add	x3, x3, 1
.L27:
	cmp	w6, w3
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
