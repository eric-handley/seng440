	.arch armv8-a
	.file	"compression.c"
	.text
	.align	2
	.global	vector_compress_samples
	.type	vector_compress_samples, %function
vector_compress_samples:
.LFB3996:
	.cfi_startproc
	abs	v31.8h, v0.8h
	shrn	v30.8b, v0.8h, 8
	movi	v29.8h, 0x84
	add	v31.8h, v31.8h, v29.8h
	mvni	v29.8h, 0x80, lsl 8
	umin	v31.8h, v31.8h, v29.8h
	clz	v29.8h, v31.8h
	xtn	v28.8b, v29.8h
	movi	v27.8h, 0xb
	sub	v29.8h, v29.8h, v27.8h
	ushl	v0.8h, v31.8h, v29.8h
	xtn	v0.8b, v0.8h
	movi	v31.8b, 0xf
	and	v0.8b, v0.8b, v31.8b
	movi	v31.8b, 0xffffffffffffff80
	and	v31.8b, v30.8b, v31.8b
	orr	v0.8b, v0.8b, v31.8b
	movi	v31.8b, 0x8
	sub	v31.8b, v31.8b, v28.8b
	shl	v31.8b, v31.8b, 4
	orr	v0.8b, v0.8b, v31.8b
	not	v0.8b, v0.8b
	ret
	.cfi_endproc
.LFE3996:
	.size	vector_compress_samples, .-vector_compress_samples
	.align	2
	.global	vector_decompress_samples
	.type	vector_decompress_samples, %function
vector_decompress_samples:
.LFB3997:
	.cfi_startproc
	not	v30.8b, v0.8b
	movi	v31.8b, 0x70
	bic	v31.8b, v31.8b, v0.8b
	movi	v29.8b, 0x3
	usra	v29.8b, v31.8b, 4
	sxtl	v29.8h, v29.8b
	movi	v31.8b, 0xf
	bic	v31.8b, v31.8b, v0.8b
	movi	v28.8b, 0x10
	orr	v31.8b, v31.8b, v28.8b
	uxtl	v31.8h, v31.8b
	ushl	v31.8h, v31.8h, v29.8h
	sxtl	v0.8h, v30.8b
	sshr	v0.8h, v0.8h, 7
	mvni	v30.8h, 0x83
	add	v31.8h, v31.8h, v30.8h
	eor	v31.16b, v31.16b, v0.16b
	sub	v0.8h, v31.8h, v0.8h
	ret
	.cfi_endproc
.LFE3997:
	.size	vector_decompress_samples, .-vector_decompress_samples
	.align	2
	.global	compress_sample
	.type	compress_sample, %function
compress_sample:
.LFB3998:
	.cfi_startproc
	and	w2, w0, 65535
	sbfx	w0, w0, 15, 1
	add	w1, w2, w0, uxth
	eor	w0, w1, w0
	and	w0, w0, 65535
	add	w0, w0, 132
	and	w3, w0, 65535
	sbfx	x1, x0, 15, 1
	eor	w3, w3, 32767
	and	w1, w1, w3
	eor	w0, w0, w1
	and	w1, w0, 65535
	clz	w3, w1
	sub	w3, w3, #17
	and	w0, w2, 32768
	mov	w2, 7
	sub	w2, w2, w3, uxtb
	ubfiz	w2, w2, 4, 4
	orr	w0, w2, w0, lsr 8
	mov	w2, 10
	sub	w2, w2, w3, uxtb
	asr	w1, w1, w2
	and	w1, w1, 15
	orr	w0, w0, w1
	mvn	w0, w0
	ret
	.cfi_endproc
.LFE3998:
	.size	compress_sample, .-compress_sample
	.align	2
	.global	decompress_sample
	.type	decompress_sample, %function
decompress_sample:
.LFB3999:
	.cfi_startproc
	mvn	w0, w0
	and	w1, w0, 15
	orr	w1, w1, 16
	ubfx	x2, x0, 4, 3
	add	w2, w2, 3
	lsl	w1, w1, w2
	and	w1, w1, 65535
	sbfiz	w0, w0, 8, 8
	sub	w1, w1, #132
	eor	w1, w1, w0, lsr 16
	sub	w0, w1, w0, lsr 16
	ret
	.cfi_endproc
.LFE3999:
	.size	decompress_sample, .-decompress_sample
	.align	2
	.global	compress_wav
	.type	compress_wav, %function
compress_wav:
.LFB4000:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	x19, [sp, 16]
	.cfi_offset 19, -16
	mov	x19, x0
	ldrh	w0, [x0, 32]
	ldr	w3, [x19, 40]
	mov	w4, 7
	udiv	w3, w3, w0
	mov	w2, 8
	ldr	w1, [x19, 24]
	ldrh	w0, [x19, 22]
	bl	new_wav
	cbz	x0, .L15
	ldr	w1, [x19, 40]
	lsr	w7, w1, 1
	cmp	w1, 15
	bls	.L11
	add	x3, x19, 44
	add	x2, x0, 44
	mov	w1, 8
	movi	v22.8h, 0x84
	mvni	v23.8h, 0x80, lsl 8
	movi	v24.8h, 0xb
	movi	v25.8b, 0xffffffffffffff80
	movi	v26.8b, 0xf
	movi	v27.8b, 0x8
.L8:
	ldr	q31, [x3], 16
	abs	v30.8h, v31.8h
	shrn	v31.8b, v31.8h, 8
	add	v30.8h, v30.8h, v22.8h
	umin	v30.8h, v30.8h, v23.8h
	clz	v28.8h, v30.8h
	xtn	v29.8b, v28.8h
	sub	v28.8h, v28.8h, v24.8h
	ushl	v30.8h, v30.8h, v28.8h
	xtn	v30.8b, v30.8h
	and	v31.8b, v31.8b, v25.8b
	and	v30.8b, v30.8b, v26.8b
	orr	v31.8b, v31.8b, v30.8b
	sub	v30.8b, v27.8b, v29.8b
	shl	v30.8b, v30.8b, 4
	orr	v31.8b, v31.8b, v30.8b
	not	v31.8b, v31.8b
	str	d31, [x2], 8
	mov	w4, w1
	add	w1, w1, 8
	cmp	w7, w1
	bcs	.L8
.L7:
	cmp	w7, w4
	bls	.L5
	uxtw	x4, w4
	add	x6, x19, 44
	add	x10, x0, 44
	mov	w9, 7
	mov	w8, 10
.L10:
	ldrsh	w2, [x6, x4, lsl 1]
	lsr	w1, w2, 16
	add	w3, w1, w2, uxth
	eor	w1, w1, w3
	and	w1, w1, 65535
	add	w1, w1, 132
	and	w5, w1, 65535
	sbfx	x3, x1, 15, 1
	eor	w5, w5, 32767
	and	w3, w3, w5
	eor	w1, w1, w3
	and	w1, w1, 65535
	clz	w3, w1
	sub	w3, w3, #17
	sub	w5, w9, w3, uxtb
	ubfiz	w5, w5, 4, 4
	ubfx	x2, x2, 8, 8
	and	w2, w2, 128
	orr	w2, w2, w5
	sub	w3, w8, w3, uxtb
	asr	w1, w1, w3
	and	w1, w1, 15
	orr	w1, w2, w1
	mvn	w1, w1
	strb	w1, [x10, x4]
	add	x4, x4, 1
	cmp	w7, w4
	bhi	.L10
.L5:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa_offset 0
	ret
.L15:
	.cfi_restore_state
	mov	w0, 1
	bl	exit
.L11:
	mov	w4, 0
	b	.L7
	.cfi_endproc
.LFE4000:
	.size	compress_wav, .-compress_wav
	.align	2
	.global	decompress_wav
	.type	decompress_wav, %function
decompress_wav:
.LFB4001:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	x19, [sp, 16]
	.cfi_offset 19, -16
	mov	x19, x0
	ldrh	w0, [x0, 32]
	ldr	w3, [x19, 40]
	mov	w4, 1
	udiv	w3, w3, w0
	mov	w2, 16
	ldr	w1, [x19, 24]
	ldrh	w0, [x19, 22]
	bl	new_wav
	cbz	x0, .L26
	add	x4, x19, 44
	add	x6, x0, 44
	ldr	w5, [x19, 40]
	cmp	w5, 7
	bls	.L22
	mov	w1, 8
	movi	v23.8b, 0x3
	movi	v24.8b, 0x70
	movi	v25.8b, 0xf
	movi	v26.8b, 0x10
	mvni	v27.8h, 0x83
.L19:
	sub	w3, w1, #8
	sub	w2, w1, #8
	ldr	d31, [x4, w3, uxtw]
	not	v30.8b, v31.8b
	bic	v28.8b, v24.8b, v31.8b
	mov	v29.8b, v23.8b
	usra	v29.8b, v28.8b, 4
	sxtl	v29.8h, v29.8b
	bic	v31.8b, v25.8b, v31.8b
	orr	v31.8b, v31.8b, v26.8b
	movi	v28.2s, 0
	zip1	v31.16b, v31.16b, v28.16b
	ushl	v31.8h, v31.8h, v29.8h
	sxtl	v30.8h, v30.8b
	sshr	v30.8h, v30.8h, 7
	add	v31.8h, v31.8h, v27.8h
	eor	v31.16b, v31.16b, v30.16b
	sub	v31.8h, v31.8h, v30.8h
	lsl	x2, x2, 1
	str	q31, [x6, x2]
	mov	w3, w1
	add	w1, w1, 8
	cmp	w5, w1
	bcs	.L19
.L18:
	cmp	w5, w3
	bls	.L16
	uxtw	x3, w3
	add	x19, x19, 44
	add	x6, x0, 44
.L21:
	ldrb	w2, [x19, x3]
	mvn	w2, w2
	and	w1, w2, 15
	orr	w1, w1, 16
	ubfx	x4, x2, 4, 3
	add	w4, w4, 3
	lsl	w1, w1, w4
	and	w1, w1, 65535
	sbfiz	w2, w2, 8, 8
	sub	w1, w1, #132
	eor	w1, w1, w2, lsr 16
	sub	w2, w1, w2, lsr 16
	strh	w2, [x6, x3, lsl 1]
	add	x3, x3, 1
	cmp	w5, w3
	bhi	.L21
.L16:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa_offset 0
	ret
.L26:
	.cfi_restore_state
	mov	w0, 1
	bl	exit
.L22:
	mov	w3, 0
	b	.L18
	.cfi_endproc
.LFE4001:
	.size	decompress_wav, .-decompress_wav
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
