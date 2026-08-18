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
	cbz	x0, .L15
	ldr	w1, [x19, 40]
	add	x5, x19, 44
	add	x7, x0, 44
	lsr	w6, w1, 1
	cmp	w1, 15
	bls	.L12
	movi	v27.4s, 0
	mov	x3, x5
	movi	v20.8h, 0x84
	mov	x2, x7
	mvni	v21.8h, 0x80, lsl 8
	mov	w1, 8
	mvni	v22.4s, 0
	movi	v23.8h, 0x80, lsl 8
	movi	v24.8h, 0xa
	movi	v25.8b, 0x7
	movi	v26.8b, 0xf
	.p2align 5,,15
.L9:
	ldr	q31, [x3], 16
	mov	w4, w1
	add	w1, w1, 8
	cmlt	v30.8h, v31.8h, #0
	and	v29.16b, v31.16b, v23.16b
	add	v31.8h, v31.8h, v30.8h
	shrn	v29.8b, v29.8h, 8
	eor	v31.16b, v31.16b, v30.16b
	add	v31.8h, v31.8h, v20.8h
	umin	v31.8h, v31.8h, v21.8h
	clz	v30.8h, v31.8h
	add	v30.8h, v30.8h, v22.8h
	xtn	v30.8b, v30.8h
	zip1	v28.16b, v30.16b, v27.16b
	sub	v30.8b, v25.8b, v30.8b
	sub	v28.8h, v28.8h, v24.8h
	shl	v30.8b, v30.8b, 4
	ushl	v31.8h, v31.8h, v28.8h
	xtn	v31.8b, v31.8h
	and	v31.8b, v31.8b, v26.8b
	orr	v31.8b, v31.8b, v29.8b
	orr	v30.8b, v30.8b, v31.8b
	not	v30.8b, v30.8b
	str	d30, [x2], 8
	cmp	w6, w1
	bcs	.L9
.L8:
	cmp	w6, w4
	bls	.L6
	ldrsh	w8, [x5, w4, uxtw 1]
	mov	w2, 7
	mov	w3, 10
	add	w9, w4, 1
	asr	w1, w8, 15
	ubfx	x11, x8, 8, 8
	and	w1, w1, 65535
	and	w11, w11, 128
	add	w8, w1, w8, uxth
	eor	w1, w1, w8
	and	w1, w1, 65535
	add	w1, w1, 132
	and	w10, w1, 65535
	eor	w10, w10, 32767
	sbfx	x8, x1, 15, 1
	and	w8, w8, w10
	eor	w1, w1, w8
	and	w1, w1, 65535
	clz	w10, w1
	sub	w10, w10, #17
	sub	w8, w2, w10, uxtb
	sub	w10, w3, w10, uxtb
	orr	w8, w11, w8, lsl 4
	asr	w1, w1, w10
	and	w1, w1, 15
	orr	w1, w8, w1
	mvn	w1, w1
	strb	w1, [x7, w4, uxtw]
	cmp	w6, w9
	bls	.L6
	ldrsh	w8, [x5, w9, uxtw 1]
	add	w10, w4, 2
	asr	w1, w8, 15
	ubfx	x12, x8, 8, 8
	and	w1, w1, 65535
	and	w12, w12, 128
	add	w8, w1, w8, uxth
	eor	w1, w1, w8
	and	w1, w1, 65535
	add	w1, w1, 132
	and	w11, w1, 65535
	eor	w11, w11, 32767
	sbfx	x8, x1, 15, 1
	and	w8, w8, w11
	eor	w1, w1, w8
	and	w1, w1, 65535
	clz	w11, w1
	sub	w11, w11, #17
	sub	w8, w2, w11, uxtb
	sub	w11, w3, w11, uxtb
	orr	w8, w12, w8, lsl 4
	asr	w1, w1, w11
	and	w1, w1, 15
	orr	w1, w8, w1
	mvn	w1, w1
	strb	w1, [x7, w9, uxtw]
	cmp	w6, w10
	bls	.L6
	ldrsh	w8, [x5, w10, uxtw 1]
	add	w9, w4, 3
	asr	w1, w8, 15
	ubfx	x12, x8, 8, 8
	and	w1, w1, 65535
	and	w12, w12, 128
	add	w8, w1, w8, uxth
	eor	w1, w1, w8
	and	w1, w1, 65535
	add	w1, w1, 132
	and	w8, w1, 65535
	sbfx	x11, x1, 15, 1
	eor	w8, w8, 32767
	and	w8, w8, w11
	eor	w1, w1, w8
	and	w1, w1, 65535
	clz	w11, w1
	sub	w11, w11, #17
	sub	w8, w2, w11, uxtb
	sub	w11, w3, w11, uxtb
	orr	w8, w12, w8, lsl 4
	asr	w1, w1, w11
	and	w1, w1, 15
	orr	w1, w8, w1
	mvn	w1, w1
	strb	w1, [x7, w10, uxtw]
	cmp	w6, w9
	bls	.L6
	ldrsh	w8, [x5, w9, uxtw 1]
	add	w10, w4, 4
	asr	w1, w8, 15
	ubfx	x12, x8, 8, 8
	and	w1, w1, 65535
	and	w12, w12, 128
	add	w8, w1, w8, uxth
	eor	w1, w1, w8
	and	w1, w1, 65535
	add	w1, w1, 132
	and	w8, w1, 65535
	sbfx	x11, x1, 15, 1
	eor	w8, w8, 32767
	and	w8, w8, w11
	eor	w1, w1, w8
	and	w1, w1, 65535
	clz	w11, w1
	sub	w11, w11, #17
	sub	w8, w2, w11, uxtb
	sub	w11, w3, w11, uxtb
	orr	w8, w12, w8, lsl 4
	asr	w1, w1, w11
	and	w1, w1, 15
	orr	w1, w8, w1
	mvn	w1, w1
	strb	w1, [x7, w9, uxtw]
	cmp	w6, w10
	bls	.L6
	ldrsh	w9, [x5, w10, uxtw 1]
	add	w8, w4, 5
	asr	w1, w9, 15
	ubfx	x12, x9, 8, 8
	and	w1, w1, 65535
	and	w12, w12, 128
	add	w9, w1, w9, uxth
	eor	w1, w1, w9
	and	w1, w1, 65535
	add	w1, w1, 132
	and	w11, w1, 65535
	eor	w11, w11, 32767
	sbfx	x9, x1, 15, 1
	and	w9, w9, w11
	eor	w1, w1, w9
	and	w1, w1, 65535
	clz	w11, w1
	sub	w11, w11, #17
	sub	w9, w2, w11, uxtb
	sub	w11, w3, w11, uxtb
	orr	w9, w12, w9, lsl 4
	asr	w1, w1, w11
	and	w1, w1, 15
	orr	w1, w9, w1
	mvn	w1, w1
	strb	w1, [x7, w10, uxtw]
	cmp	w6, w8
	bls	.L6
	ldrsh	w9, [x5, w8, uxtw 1]
	add	w4, w4, 6
	asr	w1, w9, 15
	ubfx	x11, x9, 8, 8
	and	w1, w1, 65535
	and	w11, w11, 128
	add	w9, w1, w9, uxth
	eor	w1, w1, w9
	and	w1, w1, 65535
	add	w1, w1, 132
	and	w10, w1, 65535
	eor	w10, w10, 32767
	sbfx	x9, x1, 15, 1
	and	w9, w9, w10
	eor	w1, w1, w9
	and	w1, w1, 65535
	clz	w10, w1
	sub	w10, w10, #17
	sub	w9, w2, w10, uxtb
	sub	w10, w3, w10, uxtb
	orr	w9, w11, w9, lsl 4
	asr	w1, w1, w10
	and	w1, w1, 15
	orr	w1, w9, w1
	mvn	w1, w1
	strb	w1, [x7, w8, uxtw]
	cmp	w6, w4
	bls	.L6
	ldrsh	w5, [x5, w4, uxtw 1]
	asr	w1, w5, 15
	ubfx	x8, x5, 8, 8
	and	w1, w1, 65535
	and	w8, w8, 128
	add	w5, w1, w5, uxth
	eor	w1, w1, w5
	and	w1, w1, 65535
	add	w1, w1, 132
	and	w6, w1, 65535
	eor	w6, w6, 32767
	sbfx	x5, x1, 15, 1
	and	w5, w5, w6
	eor	w1, w1, w5
	and	w5, w1, 65535
	clz	w6, w5
	sub	w6, w6, #17
	sub	w1, w2, w6, uxtb
	sub	w3, w3, w6, uxtb
	orr	w1, w8, w1, lsl 4
	asr	w5, w5, w3
	and	w5, w5, 15
	orr	w1, w1, w5
	mvn	w1, w1
	strb	w1, [x7, w4, uxtw]
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
	mov	w4, 0
	b	.L8
.L15:
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
	cbz	x0, .L25
	ldr	w7, [x19, 40]
	add	x3, x19, 44
	add	x5, x0, 44
	cmp	w7, 7
	bls	.L22
	movi	v27.4s, 0
	mov	w1, 8
	movi	v20.8b, 0x7f
	movi	v21.8b, 0x3
	movi	v22.8b, 0xf
	movi	v23.8b, 0x10
	movi	v24.8b, 0xffffffffffffff80
	mvni	v25.8h, 0x83
	.p2align 5,,15
.L19:
	sub	w4, w1, #8
	mov	v28.8b, v21.8b
	sub	w2, w1, #8
	mov	w6, w1
	add	w1, w1, 8
	ldr	d29, [x3, w4, uxtw]
	lsl	x2, x2, 1
	bic	v26.8b, v20.8b, v29.8b
	bic	v30.8b, v22.8b, v29.8b
	not	v31.8b, v29.8b
	bic	v29.8b, v24.8b, v29.8b
	usra	v28.8b, v26.8b, 4
	orr	v30.8b, v30.8b, v23.8b
	shll	v31.8h, v31.8b, 8
	zip1	v29.16b, v29.16b, v27.16b
	sxtl	v28.8h, v28.8b
	zip1	v30.16b, v30.16b, v27.16b
	cmlt	v31.8h, v31.8h, #0
	ushl	v30.8h, v30.8h, v28.8h
	add	v30.8h, v30.8h, v25.8h
	eor	v31.16b, v31.16b, v30.16b
	ssra	v31.8h, v29.8h, 7
	str	q31, [x5, x2]
	cmp	w7, w1
	bcs	.L19
.L18:
	cmp	w7, w6
	bls	.L16
	ldrb	w2, [x3, w6, uxtw]
	add	w9, w6, 1
	mvn	w2, w2
	and	w1, w2, 15
	ubfx	x8, x2, 4, 3
	orr	w1, w1, 16
	add	w8, w8, 3
	sbfx	x4, x2, 7, 1
	ubfx	x2, x2, 7, 1
	lsl	w1, w1, w8
	and	w1, w1, 65535
	sub	w1, w1, #132
	eor	w1, w4, w1
	add	w1, w1, w2
	strh	w1, [x5, w6, uxtw 1]
	cmp	w7, w9
	bls	.L16
	ldrb	w2, [x3, w9, uxtw]
	add	w10, w6, 2
	mvn	w2, w2
	and	w1, w2, 15
	ubfx	x8, x2, 4, 3
	orr	w1, w1, 16
	add	w8, w8, 3
	sbfx	x4, x2, 7, 1
	ubfx	x2, x2, 7, 1
	lsl	w1, w1, w8
	and	w1, w1, 65535
	sub	w1, w1, #132
	eor	w1, w4, w1
	add	w1, w1, w2
	strh	w1, [x5, w9, uxtw 1]
	cmp	w7, w10
	bls	.L16
	ldrb	w2, [x3, w10, uxtw]
	add	w9, w6, 3
	mvn	w2, w2
	and	w1, w2, 15
	ubfx	x8, x2, 4, 3
	orr	w1, w1, 16
	add	w8, w8, 3
	sbfx	x4, x2, 7, 1
	ubfx	x2, x2, 7, 1
	lsl	w1, w1, w8
	and	w1, w1, 65535
	sub	w1, w1, #132
	eor	w1, w4, w1
	add	w1, w1, w2
	strh	w1, [x5, w10, uxtw 1]
	cmp	w7, w9
	bls	.L16
	ldrb	w2, [x3, w9, uxtw]
	add	w10, w6, 4
	mvn	w2, w2
	and	w1, w2, 15
	ubfx	x8, x2, 4, 3
	orr	w1, w1, 16
	add	w8, w8, 3
	sbfx	x4, x2, 7, 1
	ubfx	x2, x2, 7, 1
	lsl	w1, w1, w8
	and	w1, w1, 65535
	sub	w1, w1, #132
	eor	w1, w4, w1
	add	w1, w1, w2
	strh	w1, [x5, w9, uxtw 1]
	cmp	w10, w7
	bcs	.L16
	ldrb	w2, [x3, w10, uxtw]
	add	w9, w6, 5
	mvn	w2, w2
	and	w1, w2, 15
	ubfx	x8, x2, 4, 3
	orr	w1, w1, 16
	add	w8, w8, 3
	sbfx	x4, x2, 7, 1
	ubfx	x2, x2, 7, 1
	lsl	w1, w1, w8
	and	w1, w1, 65535
	sub	w1, w1, #132
	eor	w1, w4, w1
	add	w1, w1, w2
	strh	w1, [x5, w10, uxtw 1]
	cmp	w7, w9
	bls	.L16
	ldrb	w2, [x3, w9, uxtw]
	add	w6, w6, 6
	mvn	w2, w2
	and	w1, w2, 15
	ubfx	x8, x2, 4, 3
	orr	w1, w1, 16
	add	w8, w8, 3
	sbfx	x4, x2, 7, 1
	ubfx	x2, x2, 7, 1
	lsl	w1, w1, w8
	and	w1, w1, 65535
	sub	w1, w1, #132
	eor	w1, w4, w1
	add	w1, w1, w2
	strh	w1, [x5, w9, uxtw 1]
	cmp	w7, w6
	bls	.L16
	ldrb	w2, [x3, w6, uxtw]
	mvn	w2, w2
	and	w1, w2, 15
	ubfx	x4, x2, 4, 3
	orr	w1, w1, 16
	add	w4, w4, 3
	sbfx	x3, x2, 7, 1
	ubfx	x2, x2, 7, 1
	lsl	w1, w1, w4
	and	w1, w1, 65535
	sub	w1, w1, #132
	eor	w1, w3, w1
	add	w1, w1, w2
	strh	w1, [x5, w6, uxtw 1]
.L16:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L22:
	.cfi_restore_state
	mov	w6, 0
	b	.L18
.L25:
	mov	w0, 1
	bl	exit
	.cfi_endproc
.LFE4001:
	.size	decompress_wav, .-decompress_wav
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
