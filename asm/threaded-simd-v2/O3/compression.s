	.arch armv8-a
	.file	"compression.c"
	.text
	.align	2
	.p2align 5,,15
	.global	compress_wav_thread
	.type	compress_wav_thread, %function
compress_wav_thread:
.LFB4002:
	.cfi_startproc
	ldr	w5, [x0, 16]
	ldp	x6, x3, [x0]
	cmp	w5, 15
	bls	.L2
	movi	v28.8b, 0xffffffffffffff80
	movi	v27.8b, 0xf
	movi	v31.8h, 0x84
	mov	w0, 0
	mvni	v30.8h, 0x80, lsl 8
	movi	v29.8h, 0xb
	movi	v26.8b, 0x8
	.p2align 5,,15
.L3:
	add	w2, w0, 8
	ubfiz	x4, x0, 1, 32
	add	w1, w0, 32
	lsl	x2, x2, 1
	ldr	q25, [x3, x4]
	ldr	q21, [x3, x2]
	abs	v0.8h, v25.8h
	shrn	v25.8b, v25.8h, 8
	abs	v20.8h, v21.8h
	shrn	v21.8b, v21.8h, 8
	add	v0.8h, v0.8h, v31.8h
	and	v25.8b, v25.8b, v28.8b
	add	v20.8h, v20.8h, v31.8h
	and	v21.8b, v21.8b, v28.8b
	umin	v0.8h, v0.8h, v30.8h
	umin	v20.8h, v20.8h, v30.8h
	clz	v23.8h, v0.8h
	clz	v19.8h, v20.8h
	xtn	v22.8b, v23.8h
	sub	v23.8h, v23.8h, v29.8h
	xtn	v24.8b, v19.8h
	sub	v19.8h, v19.8h, v29.8h
	sub	v22.8b, v26.8b, v22.8b
	ushl	v23.8h, v0.8h, v23.8h
	sub	v24.8b, v26.8b, v24.8b
	ushl	v19.8h, v20.8h, v19.8h
	shl	v22.8b, v22.8b, 4
	xtn	v23.8b, v23.8h
	shl	v24.8b, v24.8b, 4
	xtn	v19.8b, v19.8h
	and	v23.8b, v23.8b, v27.8b
	and	v19.8b, v19.8b, v27.8b
	orr	v23.8b, v25.8b, v23.8b
	orr	v19.8b, v21.8b, v19.8b
	orr	v22.8b, v23.8b, v22.8b
	orr	v24.8b, v19.8b, v24.8b
	not	v22.8b, v22.8b
	not	v24.8b, v24.8b
	ins	v22.d[1], v24.d[0]
	str	q22, [x6, w0, uxtw]
	add	w0, w0, 16
	cmp	w5, w1
	bcs	.L3
.L2:
	mov	x0, 0
	ret
	.cfi_endproc
.LFE4002:
	.size	compress_wav_thread, .-compress_wav_thread
	.align	2
	.p2align 5,,15
	.global	decompress_wav_thread
	.type	decompress_wav_thread, %function
decompress_wav_thread:
.LFB4003:
	.cfi_startproc
	movi	v31.4s, 0
	ldr	w3, [x0, 16]
	ldp	x5, x4, [x0]
	cmp	w3, 7
	bls	.L7
	movi	v30.8b, 0x3
	movi	v29.8b, 0x70
	movi	v28.8b, 0xf
	movi	v27.8b, 0x10
	mvni	v26.8h, 0x83
	mov	w0, 0
	.p2align 5,,15
.L8:
	ldr	d25, [x5, w0, uxtw]
	mov	v22.8b, v30.8b
	ubfiz	x2, x0, 1, 32
	add	w1, w0, 16
	add	w0, w0, 8
	not	v24.8b, v25.8b
	bic	v23.8b, v29.8b, v25.8b
	bic	v25.8b, v28.8b, v25.8b
	usra	v22.8b, v23.8b, 4
	orr	v25.8b, v25.8b, v27.8b
	sxtl	v24.8h, v24.8b
	sxtl	v22.8h, v22.8b
	zip1	v25.16b, v25.16b, v31.16b
	sshr	v24.8h, v24.8h, 7
	ushl	v25.8h, v25.8h, v22.8h
	add	v25.8h, v25.8h, v26.8h
	eor	v25.16b, v25.16b, v24.16b
	sub	v25.8h, v25.8h, v24.8h
	str	q25, [x4, x2]
	cmp	w3, w1
	bcs	.L8
.L7:
	mov	x0, 0
	ret
	.cfi_endproc
.LFE4003:
	.size	decompress_wav_thread, .-decompress_wav_thread
	.align	2
	.p2align 5,,15
	.global	compress_wav
	.type	compress_wav, %function
compress_wav:
.LFB4004:
	.cfi_startproc
	stp	x29, x30, [sp, -464]!
	.cfi_def_cfa_offset 464
	.cfi_offset 29, -464
	.cfi_offset 30, -456
	mov	w4, 7
	mov	w2, 8
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	.cfi_offset 19, -448
	.cfi_offset 20, -440
	.cfi_offset 21, -432
	.cfi_offset 22, -424
	.cfi_offset 23, -416
	.cfi_offset 24, -408
	mov	x23, x0
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	.cfi_offset 25, -400
	.cfi_offset 26, -392
	.cfi_offset 27, -384
	.cfi_offset 28, -376
	ldrh	w3, [x0, 32]
	ldr	w5, [x0, 40]
	ldr	w1, [x23, 24]
	ldrh	w0, [x0, 22]
	udiv	w3, w5, w3
	bl	new_wav
	str	x0, [sp, 136]
	cbz	x0, .L37
	ldr	w25, [x23, 40]
	add	x0, sp, 144
	mov	x20, x0
	str	x0, [sp, 128]
	add	x21, x23, 44
	add	x26, sp, 240
	lsr	w0, w25, 7
	str	w0, [sp, 100]
	ubfx	x0, x25, 5, 2
	str	x0, [sp, 104]
	adrp	x0, compress_wav_thread
	add	x0, x0, :lo12:compress_wav_thread
	str	x0, [sp, 112]
	lsr	w24, w25, 1
	ldr	x0, [sp, 136]
	add	x19, sp, 176
	add	x25, sp, 344
	mov	w27, 0
	add	x22, x0, 44
	mov	w28, 0
	add	x0, sp, 336
	str	x0, [sp, 120]
.L12:
	ldp	w1, w0, [sp, 100]
	cmp	w0, w27
	uxtw	x0, w28
	cinc	w1, w1, hi
	add	x7, x22, x0
	add	x2, x21, x0, lsl 1
	stp	x7, x2, [x26]
	lsl	w1, w1, 4
	str	w1, [x26, 16]
	add	w28, w28, w1
	mov	x0, x19
	bl	pthread_attr_init
	str	xzr, [x25, 112]
	ldr	x2, [sp, 120]
	mov	x0, 1
	movi	v31.4s, 0
	lsl	x7, x0, x27
	str	x7, [sp, 336]
	mov	x1, 128
	mov	x0, x19
	add	w27, w27, 1
	stp	q31, q31, [x25]
	stp	q31, q31, [x25, 32]
	stp	q31, q31, [x25, 64]
	str	q31, [x25, 96]
	bl	pthread_attr_setaffinity_np
	mov	x3, x26
	ldr	x2, [sp, 112]
	mov	x1, x19
	mov	x0, x20
	add	x26, x26, 24
	add	x20, x20, 8
	bl	pthread_create
	mov	x0, x19
	bl	pthread_attr_destroy
	cmp	w27, 4
	bne	.L12
	mov	x19, 1
.L13:
	ldr	x0, [sp, 128]
	mov	x1, 0
	add	x0, x0, x19, lsl 3
	add	x19, x19, 1
	ldr	x0, [x0, -8]
	bl	pthread_join
	movi	v28.4s, 0
	cmp	x19, 5
	bne	.L13
	cmp	w24, w28
	bls	.L10
	sub	w8, w24, #1
	uxtw	x4, w28
	sub	w8, w8, w28
	cmp	w8, 14
	bls	.L15
	ldr	x5, [sp, 136]
	sub	w2, w24, w28
	add	x3, x4, 22
	add	x1, x4, 44
	add	x3, x2, x3
	add	w0, w4, 22
	add	x2, x2, x1
	add	x1, x5, x1
	add	x3, x23, x3, lsl 1
	add	x2, x5, x2
	add	x0, x23, x0, lsl 1
	cmp	x3, x1
	ccmp	x2, x0, 0, hi
	sub	w5, w24, w28
	bhi	.L15
	movi	v25.8h, 0x84
	lsr	w2, w5, 4
	mvni	v26.8h, 0x80, lsl 8
	movi	v21.16b, 0xffffffffffffffef
	add	x2, x1, w2, uxtw 4
	movi	v27.8h, 0xa
	movi	v22.16b, 0xf
	movi	v23.16b, 0xffffffffffffff80
	movi	v24.16b, 0x7
	.p2align 5,,15
.L16:
	ldp	q29, q30, [x0], 32
	cmlt	v20.8h, v29.8h, #0
	cmlt	v31.8h, v30.8h, #0
	uzp2	v19.16b, v29.16b, v30.16b
	add	v29.8h, v29.8h, v20.8h
	add	v30.8h, v30.8h, v31.8h
	and	v19.16b, v19.16b, v23.16b
	eor	v29.16b, v29.16b, v20.16b
	eor	v30.16b, v30.16b, v31.16b
	add	v29.8h, v29.8h, v25.8h
	add	v30.8h, v30.8h, v25.8h
	cmlt	v31.8h, v29.8h, #0
	cmlt	v20.8h, v30.8h, #0
	bsl	v31.16b, v26.16b, v29.16b
	mov	v29.16b, v20.16b
	zip2	v17.8h, v31.8h, v28.8h
	bsl	v29.16b, v26.16b, v30.16b
	zip1	v30.8h, v31.8h, v28.8h
	clz	v17.4s, v17.4s
	zip1	v20.8h, v29.8h, v28.8h
	zip2	v18.8h, v29.8h, v28.8h
	clz	v30.4s, v30.4s
	clz	v20.4s, v20.4s
	clz	v18.4s, v18.4s
	uzp1	v30.8h, v30.8h, v17.8h
	uzp1	v20.8h, v20.8h, v18.8h
	uzp1	v30.16b, v30.16b, v20.16b
	add	v30.16b, v30.16b, v21.16b
	usubw	v18.8h, v27.8h, v30.8b
	usubw2	v20.8h, v27.8h, v30.16b
	sub	v30.16b, v24.16b, v30.16b
	neg	v18.8h, v18.8h
	neg	v20.8h, v20.8h
	shl	v30.16b, v30.16b, 4
	ushl	v31.8h, v31.8h, v18.8h
	ushl	v29.8h, v29.8h, v20.8h
	orr	v30.16b, v19.16b, v30.16b
	uzp1	v31.16b, v31.16b, v29.16b
	and	v31.16b, v31.16b, v22.16b
	orr	v31.16b, v31.16b, v30.16b
	not	v31.16b, v31.16b
	str	q31, [x1], 16
	cmp	x2, x1
	bne	.L16
	and	w3, w5, -16
	add	w3, w3, w28
	tst	x5, 15
	beq	.L10
	mov	w6, 7
	mov	w5, 10
	.p2align 5,,15
.L20:
	ldrsh	w1, [x21, w3, uxtw 1]
	asr	w0, w1, 15
	ubfx	x4, x1, 8, 8
	and	w0, w0, 65535
	and	w4, w4, 128
	add	w1, w0, w1, uxth
	eor	w0, w0, w1
	and	w0, w0, 65535
	add	w0, w0, 132
	and	w2, w0, 65535
	eor	w2, w2, 32767
	sbfx	x1, x0, 15, 1
	and	w1, w1, w2
	eor	w0, w0, w1
	and	w0, w0, 65535
	clz	w2, w0
	sub	w2, w2, #17
	sub	w1, w6, w2, uxtb
	sub	w2, w5, w2, uxtb
	orr	w1, w4, w1, lsl 4
	asr	w0, w0, w2
	and	w0, w0, 15
	orr	w0, w1, w0
	mvn	w0, w0
	strb	w0, [x22, w3, uxtw]
	add	w3, w3, 1
	cmp	w24, w3
	bhi	.L20
.L10:
	ldr	x0, [sp, 136]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 464
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L15:
	.cfi_restore_state
	mov	x0, 44
	add	x7, x4, x0
	add	x1, x0, w28, uxtw 1
	mov	x4, 0
	ldr	x0, [sp, 136]
	add	x1, x23, x1
	mov	w10, 7
	mov	w9, 10
	add	x7, x0, x7
	.p2align 5,,15
.L21:
	ldrsh	w2, [x1, x4, lsl 1]
	cmp	x8, x4
	asr	w0, w2, 15
	ubfx	x6, x2, 8, 8
	and	w0, w0, 65535
	and	w6, w6, 128
	add	w2, w0, w2, uxth
	eor	w0, w0, w2
	and	w0, w0, 65535
	add	w0, w0, 132
	and	w3, w0, 65535
	eor	w3, w3, 32767
	sbfx	x2, x0, 15, 1
	and	w2, w2, w3
	eor	w0, w0, w2
	and	w0, w0, 65535
	clz	w3, w0
	sub	w3, w3, #17
	sub	w2, w10, w3, uxtb
	sub	w3, w9, w3, uxtb
	orr	w2, w6, w2, lsl 4
	asr	w0, w0, w3
	and	w0, w0, 15
	orr	w0, w2, w0
	mvn	w0, w0
	strb	w0, [x7, x4]
	add	x4, x4, 1
	bne	.L21
	ldr	x0, [sp, 136]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 464
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
.L37:
	.cfi_restore_state
	mov	w0, 1
	bl	exit
	.cfi_endproc
.LFE4004:
	.size	compress_wav, .-compress_wav
	.align	2
	.p2align 5,,15
	.global	decompress_wav
	.type	decompress_wav, %function
decompress_wav:
.LFB4005:
	.cfi_startproc
	stp	x29, x30, [sp, -464]!
	.cfi_def_cfa_offset 464
	.cfi_offset 29, -464
	.cfi_offset 30, -456
	mov	w4, 1
	mov	w2, 16
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -448
	.cfi_offset 20, -440
	mov	x20, x0
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	.cfi_offset 21, -432
	.cfi_offset 22, -424
	.cfi_offset 23, -416
	.cfi_offset 24, -408
	.cfi_offset 25, -400
	.cfi_offset 26, -392
	.cfi_offset 27, -384
	.cfi_offset 28, -376
	ldrh	w3, [x0, 32]
	ldr	w5, [x0, 40]
	ldr	w1, [x20, 24]
	ldrh	w0, [x0, 22]
	udiv	w3, w5, w3
	bl	new_wav
	str	x0, [sp, 136]
	cbz	x0, .L70
	ldr	w22, [x20, 40]
	add	x0, sp, 144
	mov	x21, x0
	str	x0, [sp, 128]
	add	x25, x20, 44
	add	x26, sp, 240
	lsr	w0, w22, 5
	str	w0, [sp, 100]
	ubfx	x0, x22, 3, 2
	str	x0, [sp, 104]
	adrp	x0, decompress_wav_thread
	add	x0, x0, :lo12:decompress_wav_thread
	str	x0, [sp, 112]
	add	x19, sp, 176
	ldr	x0, [sp, 136]
	add	x28, sp, 344
	mov	w23, 0
	mov	w27, 0
	add	x24, x0, 44
	add	x0, sp, 336
	str	x0, [sp, 120]
.L40:
	ldp	w1, w0, [sp, 100]
	cmp	w0, w23
	uxtw	x0, w27
	cinc	w1, w1, hi
	add	x7, x25, x0
	add	x2, x24, x0, lsl 1
	stp	x7, x2, [x26]
	lsl	w1, w1, 3
	str	w1, [x26, 16]
	add	w27, w27, w1
	mov	x0, x19
	bl	pthread_attr_init
	str	xzr, [x28, 112]
	ldr	x2, [sp, 120]
	mov	x0, 1
	movi	v31.4s, 0
	lsl	x7, x0, x23
	str	x7, [sp, 336]
	mov	x1, 128
	mov	x0, x19
	add	w23, w23, 1
	stp	q31, q31, [x28]
	stp	q31, q31, [x28, 32]
	stp	q31, q31, [x28, 64]
	str	q31, [x28, 96]
	bl	pthread_attr_setaffinity_np
	mov	x3, x26
	ldr	x2, [sp, 112]
	mov	x1, x19
	mov	x0, x21
	add	x26, x26, 24
	add	x21, x21, 8
	bl	pthread_create
	mov	x0, x19
	bl	pthread_attr_destroy
	cmp	w23, 4
	bne	.L40
	mov	x19, 1
.L41:
	ldr	x0, [sp, 128]
	mov	x1, 0
	add	x0, x0, x19, lsl 3
	add	x19, x19, 1
	ldr	x0, [x0, -8]
	bl	pthread_join
	movi	v26.4s, 0
	cmp	x19, 5
	bne	.L41
	cmp	w22, w27
	bls	.L38
	sub	w3, w22, w27
	uxtw	x5, w27
	sub	w7, w3, #1
	cmp	w7, 6
	bls	.L43
	ldr	x4, [sp, 136]
	add	x2, x5, w3, uxtw
	add	x6, x2, 22
	add	x1, x5, 44
	add	x0, x5, 22
	add	x2, x2, 44
	add	x1, x20, x1
	add	x6, x4, x6, lsl 1
	add	x2, x20, x2
	cmp	x6, x1
	add	x0, x4, x0, lsl 1
	ccmp	x0, x2, 2, hi
	bcc	.L43
	cmp	w7, 14
	bls	.L53
	movi	v20.16b, 0xf
	lsr	w2, w3, 4
	movi	v21.16b, 0x10
	movi	v22.16b, 0x7
	add	x2, x1, w2, uxtw 4
	movi	v23.16b, 0x3
	mvni	v25.8h, 0x83
	.p2align 5,,15
.L45:
	ldr	q31, [x1], 16
	not	v30.16b, v31.16b
	bic	v31.16b, v20.16b, v31.16b
	ushr	v28.16b, v30.16b, 4
	orr	v31.16b, v31.16b, v21.16b
	shll	v27.8h, v30.8b, 8
	shll2	v29.8h, v30.16b, 8
	and	v28.16b, v28.16b, v22.16b
	zip1	v30.16b, v31.16b, v26.16b
	zip2	v31.16b, v31.16b, v26.16b
	cmlt	v27.8h, v27.8h, #0
	add	v28.16b, v28.16b, v23.16b
	cmlt	v29.8h, v29.8h, #0
	zip1	v24.16b, v28.16b, v26.16b
	zip2	v28.16b, v28.16b, v26.16b
	sshl	v30.8h, v30.8h, v24.8h
	sshl	v31.8h, v31.8h, v28.8h
	add	v30.8h, v30.8h, v25.8h
	add	v31.8h, v31.8h, v25.8h
	eor	v30.16b, v30.16b, v27.16b
	eor	v31.16b, v31.16b, v29.16b
	sub	v30.8h, v30.8h, v27.8h
	sub	v31.8h, v31.8h, v29.8h
	stp	q30, q31, [x0], 32
	cmp	x2, x1
	bne	.L45
	and	w0, w3, -16
	add	w27, w27, w0
	tst	x3, 15
	beq	.L38
	sub	w3, w3, w0
	sub	w1, w3, #1
	cmp	w1, 6
	bls	.L49
.L44:
	add	x0, x5, w0, uxtw
	movi	v2.8b, 0xf
	add	x20, x20, x0
	movi	v0.8b, 0x7
	movi	v31.8b, 0x3
	movi	v28.8b, 0x10
	mvni	v29.8h, 0x83
	ldr	d1, [x20, 44]
	ldr	x1, [sp, 136]
	not	v1.8b, v1.8b
	add	x0, x1, x0, lsl 1
	and	w1, w3, -8
	add	w27, w27, w1
	shll	v30.8h, v1.8b, 8
	and	v2.8b, v1.8b, v2.8b
	ushr	v1.8b, v1.8b, 4
	cmlt	v30.8h, v30.8h, #0
	and	v0.8b, v1.8b, v0.8b
	orr	v28.8b, v2.8b, v28.8b
	add	v31.8b, v0.8b, v31.8b
	uxtl	v28.8h, v28.8b
	uxtl	v31.8h, v31.8b
	sshl	v31.8h, v28.8h, v31.8h
	add	v29.8h, v31.8h, v29.8h
	eor	v29.16b, v29.16b, v30.16b
	sub	v29.8h, v29.8h, v30.8h
	str	q29, [x0, 44]
	tst	x3, 7
	beq	.L38
.L49:
	ldrb	w1, [x25, w27, uxtw]
	add	w3, w27, 1
	mvn	w1, w1
	and	w0, w1, 15
	ubfx	x2, x1, 4, 3
	orr	w0, w0, 16
	add	w2, w2, 3
	sbfx	x1, x1, 7, 1
	and	w1, w1, 65535
	lsl	w0, w0, w2
	and	w0, w0, 65535
	sub	w0, w0, #132
	eor	w0, w1, w0
	sub	w0, w0, w1
	strh	w0, [x24, w27, uxtw 1]
	cmp	w22, w3
	bls	.L38
	ldrb	w1, [x25, w3, uxtw]
	add	w5, w27, 2
	mvn	w1, w1
	and	w0, w1, 15
	ubfx	x2, x1, 4, 3
	orr	w0, w0, 16
	add	w2, w2, 3
	sbfx	x1, x1, 7, 1
	and	w1, w1, 65535
	lsl	w0, w0, w2
	and	w0, w0, 65535
	sub	w0, w0, #132
	eor	w0, w1, w0
	sub	w0, w0, w1
	strh	w0, [x24, w3, uxtw 1]
	cmp	w22, w5
	bls	.L38
	ldrb	w1, [x25, w5, uxtw]
	add	w3, w27, 3
	mvn	w1, w1
	and	w0, w1, 15
	ubfx	x2, x1, 4, 3
	orr	w0, w0, 16
	add	w2, w2, 3
	sbfx	x1, x1, 7, 1
	and	w1, w1, 65535
	lsl	w0, w0, w2
	and	w0, w0, 65535
	sub	w0, w0, #132
	eor	w0, w1, w0
	sub	w0, w0, w1
	strh	w0, [x24, w5, uxtw 1]
	cmp	w22, w3
	bls	.L38
	ldrb	w1, [x25, w3, uxtw]
	add	w5, w27, 4
	mvn	w1, w1
	and	w0, w1, 15
	ubfx	x2, x1, 4, 3
	orr	w0, w0, 16
	add	w2, w2, 3
	sbfx	x1, x1, 7, 1
	and	w1, w1, 65535
	lsl	w0, w0, w2
	and	w0, w0, 65535
	sub	w0, w0, #132
	eor	w0, w1, w0
	sub	w0, w0, w1
	strh	w0, [x24, w3, uxtw 1]
	cmp	w22, w5
	bls	.L38
	ldrb	w1, [x25, w5, uxtw]
	add	w3, w27, 5
	mvn	w1, w1
	and	w0, w1, 15
	ubfx	x2, x1, 4, 3
	orr	w0, w0, 16
	add	w2, w2, 3
	sbfx	x1, x1, 7, 1
	and	w1, w1, 65535
	lsl	w0, w0, w2
	and	w0, w0, 65535
	sub	w0, w0, #132
	eor	w0, w1, w0
	sub	w0, w0, w1
	strh	w0, [x24, w5, uxtw 1]
	cmp	w22, w3
	bls	.L38
	ldrb	w1, [x25, w3, uxtw]
	add	w4, w27, 6
	mvn	w1, w1
	and	w0, w1, 15
	ubfx	x2, x1, 4, 3
	orr	w0, w0, 16
	add	w2, w2, 3
	sbfx	x1, x1, 7, 1
	and	w1, w1, 65535
	lsl	w0, w0, w2
	and	w0, w0, 65535
	sub	w0, w0, #132
	eor	w0, w1, w0
	sub	w0, w0, w1
	strh	w0, [x24, w3, uxtw 1]
	cmp	w22, w4
	bls	.L38
	ldrb	w1, [x25, w4, uxtw]
	mvn	w1, w1
	and	w0, w1, 15
	ubfx	x2, x1, 4, 3
	orr	w0, w0, 16
	add	w2, w2, 3
	sbfx	x1, x1, 7, 1
	and	w1, w1, 65535
	lsl	w0, w0, w2
	and	w0, w0, 65535
	sub	w0, w0, #132
	eor	w0, w1, w0
	sub	w0, w0, w1
	strh	w0, [x24, w4, uxtw 1]
.L38:
	ldr	x0, [sp, 136]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 464
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L43:
	.cfi_restore_state
	ldr	x0, [sp, 136]
	mov	x6, 44
	sub	w2, w22, #1
	add	x5, x5, x6
	add	x6, x6, w27, uxtw 1
	sub	w2, w2, w27
	add	x20, x20, x5
	add	x6, x0, x6
	mov	x3, 0
	.p2align 5,,15
.L51:
	ldrb	w1, [x20, x3]
	cmp	x2, x3
	mvn	w1, w1
	and	w0, w1, 15
	ubfx	x5, x1, 4, 3
	orr	w0, w0, 16
	add	w5, w5, 3
	sbfx	x1, x1, 7, 1
	and	w1, w1, 65535
	lsl	w0, w0, w5
	and	w0, w0, 65535
	sub	w0, w0, #132
	eor	w0, w1, w0
	sub	w0, w0, w1
	strh	w0, [x6, x3, lsl 1]
	add	x3, x3, 1
	bne	.L51
	ldr	x0, [sp, 136]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 464
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
.L53:
	.cfi_restore_state
	mov	w0, 0
	b	.L44
.L70:
	mov	w0, 1
	bl	exit
	.cfi_endproc
.LFE4005:
	.size	decompress_wav, .-decompress_wav
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
