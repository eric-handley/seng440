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
	ldr	w4, [x0, 16]
	ldp	x5, x6, [x0]
	cmp	w4, 7
	bls	.L6
	movi	v31.8h, 0x84
	mov	w0, 8
	mvni	v30.8h, 0x80, lsl 8
	movi	v29.8h, 0xb
	movi	v28.8b, 0xffffffffffffff80
	movi	v27.8b, 0xf
	movi	v26.8b, 0x8
	.p2align 5,,15
.L3:
	sub	w1, w0, #8
	sub	w2, w0, #8
	mov	w3, w0
	add	w0, w0, 8
	lsl	x1, x1, 1
	ldr	q25, [x6, x1]
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
	str	d22, [x5, w2, uxtw]
	cmp	w4, w0
	bcs	.L3
.L2:
	cmp	w4, w3
	bls	.L4
	ldrsh	w7, [x6, w3, uxtw 1]
	mov	w1, 7
	mov	w2, 10
	add	w9, w3, 1
	asr	w0, w7, 15
	ubfx	x10, x7, 8, 8
	and	w0, w0, 65535
	and	w10, w10, 128
	add	w7, w0, w7, uxth
	eor	w0, w0, w7
	and	w0, w0, 65535
	add	w0, w0, 132
	and	w8, w0, 65535
	eor	w8, w8, 32767
	sbfx	x7, x0, 15, 1
	and	w7, w7, w8
	eor	w0, w0, w7
	and	w0, w0, 65535
	clz	w8, w0
	sub	w8, w8, #17
	sub	w7, w1, w8, uxtb
	sub	w8, w2, w8, uxtb
	orr	w7, w10, w7, lsl 4
	asr	w0, w0, w8
	and	w0, w0, 15
	orr	w0, w7, w0
	mvn	w0, w0
	strb	w0, [x5, w3, uxtw]
	cmp	w4, w9
	bls	.L4
	ldrsh	w7, [x6, w9, uxtw 1]
	add	w8, w3, 2
	asr	w0, w7, 15
	ubfx	x11, x7, 8, 8
	and	w0, w0, 65535
	and	w11, w11, 128
	add	w7, w0, w7, uxth
	eor	w0, w0, w7
	and	w0, w0, 65535
	add	w0, w0, 132
	and	w10, w0, 65535
	eor	w10, w10, 32767
	sbfx	x7, x0, 15, 1
	and	w7, w7, w10
	eor	w0, w0, w7
	and	w0, w0, 65535
	clz	w10, w0
	sub	w10, w10, #17
	sub	w7, w1, w10, uxtb
	sub	w10, w2, w10, uxtb
	orr	w7, w11, w7, lsl 4
	asr	w0, w0, w10
	and	w0, w0, 15
	orr	w0, w7, w0
	mvn	w0, w0
	strb	w0, [x5, w9, uxtw]
	cmp	w4, w8
	bls	.L4
	ldrsh	w7, [x6, w8, uxtw 1]
	add	w9, w3, 3
	asr	w0, w7, 15
	ubfx	x11, x7, 8, 8
	and	w0, w0, 65535
	and	w11, w11, 128
	add	w7, w0, w7, uxth
	eor	w0, w0, w7
	and	w0, w0, 65535
	add	w0, w0, 132
	and	w7, w0, 65535
	sbfx	x10, x0, 15, 1
	eor	w7, w7, 32767
	and	w7, w7, w10
	eor	w0, w0, w7
	and	w0, w0, 65535
	clz	w10, w0
	sub	w10, w10, #17
	sub	w7, w1, w10, uxtb
	sub	w10, w2, w10, uxtb
	orr	w7, w11, w7, lsl 4
	asr	w0, w0, w10
	and	w0, w0, 15
	orr	w0, w7, w0
	mvn	w0, w0
	strb	w0, [x5, w8, uxtw]
	cmp	w4, w9
	bls	.L4
	ldrsh	w7, [x6, w9, uxtw 1]
	add	w8, w3, 4
	asr	w0, w7, 15
	ubfx	x11, x7, 8, 8
	and	w0, w0, 65535
	and	w11, w11, 128
	add	w7, w0, w7, uxth
	eor	w0, w0, w7
	and	w0, w0, 65535
	add	w0, w0, 132
	and	w7, w0, 65535
	sbfx	x10, x0, 15, 1
	eor	w7, w7, 32767
	and	w7, w7, w10
	eor	w0, w0, w7
	and	w0, w0, 65535
	clz	w10, w0
	sub	w10, w10, #17
	sub	w7, w1, w10, uxtb
	sub	w10, w2, w10, uxtb
	orr	w7, w11, w7, lsl 4
	asr	w0, w0, w10
	and	w0, w0, 15
	orr	w0, w7, w0
	mvn	w0, w0
	strb	w0, [x5, w9, uxtw]
	cmp	w4, w8
	bls	.L4
	ldrsh	w7, [x6, w8, uxtw 1]
	add	w9, w3, 5
	asr	w0, w7, 15
	ubfx	x11, x7, 8, 8
	and	w0, w0, 65535
	and	w11, w11, 128
	add	w7, w0, w7, uxth
	eor	w0, w0, w7
	and	w0, w0, 65535
	add	w0, w0, 132
	and	w10, w0, 65535
	eor	w10, w10, 32767
	sbfx	x7, x0, 15, 1
	and	w7, w7, w10
	eor	w0, w0, w7
	and	w0, w0, 65535
	clz	w10, w0
	sub	w10, w10, #17
	sub	w7, w1, w10, uxtb
	sub	w10, w2, w10, uxtb
	orr	w7, w11, w7, lsl 4
	asr	w0, w0, w10
	and	w0, w0, 15
	orr	w0, w7, w0
	mvn	w0, w0
	strb	w0, [x5, w8, uxtw]
	cmp	w4, w9
	bls	.L4
	ldrsh	w7, [x6, w9, uxtw 1]
	add	w3, w3, 6
	asr	w0, w7, 15
	ubfx	x10, x7, 8, 8
	and	w0, w0, 65535
	and	w10, w10, 128
	add	w7, w0, w7, uxth
	eor	w0, w0, w7
	and	w0, w0, 65535
	add	w0, w0, 132
	and	w8, w0, 65535
	eor	w8, w8, 32767
	sbfx	x7, x0, 15, 1
	and	w7, w7, w8
	eor	w0, w0, w7
	and	w0, w0, 65535
	clz	w8, w0
	sub	w8, w8, #17
	sub	w7, w1, w8, uxtb
	sub	w8, w2, w8, uxtb
	orr	w7, w10, w7, lsl 4
	asr	w0, w0, w8
	and	w0, w0, 15
	orr	w0, w7, w0
	mvn	w0, w0
	strb	w0, [x5, w9, uxtw]
	cmp	w4, w3
	bls	.L4
	ldrsh	w4, [x6, w3, uxtw 1]
	asr	w0, w4, 15
	ubfx	x7, x4, 8, 8
	and	w0, w0, 65535
	and	w7, w7, 128
	add	w4, w0, w4, uxth
	eor	w0, w0, w4
	and	w0, w0, 65535
	add	w0, w0, 132
	and	w6, w0, 65535
	eor	w6, w6, 32767
	sbfx	x4, x0, 15, 1
	and	w4, w4, w6
	eor	w0, w0, w4
	and	w4, w0, 65535
	clz	w6, w4
	sub	w6, w6, #17
	sub	w0, w1, w6, uxtb
	sub	w2, w2, w6, uxtb
	orr	w0, w7, w0, lsl 4
	asr	w4, w4, w2
	and	w4, w4, 15
	orr	w0, w0, w4
	mvn	w0, w0
	strb	w0, [x5, w3, uxtw]
.L4:
	mov	x0, 0
	ret
	.p2align 2,,3
.L6:
	mov	w3, 0
	b	.L2
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
	ldr	w4, [x0, 16]
	ldp	x6, x5, [x0]
	cmp	w4, 7
	bls	.L14
	movi	v30.8b, 0x3
	movi	v29.8b, 0x70
	movi	v28.8b, 0xf
	movi	v27.8b, 0x10
	mvni	v26.8h, 0x83
	mov	w0, 8
	.p2align 5,,15
.L11:
	sub	w2, w0, #8
	mov	v22.8b, v30.8b
	sub	w1, w0, #8
	mov	w3, w0
	add	w0, w0, 8
	ldr	d25, [x6, w2, uxtw]
	lsl	x1, x1, 1
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
	str	q25, [x5, x1]
	cmp	w4, w0
	bcs	.L11
.L10:
	cmp	w4, w3
	bls	.L12
	ldrb	w1, [x6, w3, uxtw]
	add	w7, w3, 1
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
	strh	w0, [x5, w3, uxtw 1]
	cmp	w4, w7
	bls	.L12
	ldrb	w1, [x6, w7, uxtw]
	add	w8, w3, 2
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
	strh	w0, [x5, w7, uxtw 1]
	cmp	w4, w8
	bls	.L12
	ldrb	w1, [x6, w8, uxtw]
	add	w7, w3, 3
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
	strh	w0, [x5, w8, uxtw 1]
	cmp	w4, w7
	bls	.L12
	ldrb	w1, [x6, w7, uxtw]
	add	w8, w3, 4
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
	strh	w0, [x5, w7, uxtw 1]
	cmp	w4, w8
	bls	.L12
	ldrb	w1, [x6, w8, uxtw]
	add	w7, w3, 5
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
	strh	w0, [x5, w8, uxtw 1]
	cmp	w4, w7
	bls	.L12
	ldrb	w1, [x6, w7, uxtw]
	add	w3, w3, 6
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
	strh	w0, [x5, w7, uxtw 1]
	cmp	w4, w3
	bls	.L12
	ldrb	w1, [x6, w3, uxtw]
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
	strh	w0, [x5, w3, uxtw 1]
.L12:
	mov	x0, 0
	ret
	.p2align 2,,3
.L14:
	mov	w3, 0
	b	.L10
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
	stp	x29, x30, [sp, -448]!
	.cfi_def_cfa_offset 448
	.cfi_offset 29, -448
	.cfi_offset 30, -440
	mov	w4, 7
	mov	w2, 8
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	.cfi_offset 19, -432
	.cfi_offset 20, -424
	.cfi_offset 21, -416
	.cfi_offset 22, -408
	.cfi_offset 23, -400
	.cfi_offset 24, -392
	mov	x23, x0
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	.cfi_offset 25, -384
	.cfi_offset 26, -376
	.cfi_offset 27, -368
	.cfi_offset 28, -360
	ldrh	w3, [x0, 32]
	ldr	w5, [x0, 40]
	ldr	w1, [x23, 24]
	ldrh	w0, [x0, 22]
	udiv	w3, w5, w3
	bl	new_wav
	str	x0, [sp, 120]
	cbz	x0, .L43
	ldr	w7, [x23, 40]
	adrp	x26, compress_wav_thread
	add	x0, x26, :lo12:compress_wav_thread
	str	x0, [sp, 104]
	ldr	x0, [sp, 120]
	add	x21, x23, 44
	add	x26, sp, 224
	add	x24, sp, 160
	add	x28, sp, 328
	add	x25, sp, 128
	lsr	w20, w7, 1
	lsr	w27, w7, 3
	add	x22, x0, 44
	mov	w6, 0
	add	x0, sp, 320
	mov	x19, 0
	str	x0, [sp, 112]
.L18:
	uxtw	x1, w6
	str	w6, [sp, 100]
	add	x2, x22, x1
	str	w27, [x26, 16]
	add	x1, x21, x1, lsl 1
	stp	x2, x1, [x26]
	mov	x0, x24
	bl	pthread_attr_init
	str	xzr, [x28, 112]
	ldr	x2, [sp, 112]
	mov	x0, 1
	movi	v31.4s, 0
	lsl	x8, x0, x19
	str	x8, [sp, 320]
	mov	x1, 128
	mov	x0, x24
	stp	q31, q31, [x28]
	stp	q31, q31, [x28, 32]
	stp	q31, q31, [x28, 64]
	str	q31, [x28, 96]
	bl	pthread_attr_setaffinity_np
	mov	x3, x26
	ldr	x2, [sp, 104]
	mov	x1, x24
	add	x0, x25, w19, uxtw 3
	add	x19, x19, 1
	add	x26, x26, 24
	bl	pthread_create
	mov	x0, x24
	bl	pthread_attr_destroy
	ldr	w6, [sp, 100]
	add	w6, w6, w27
	cmp	x19, 4
	bne	.L18
	mov	x24, 1
.L19:
	add	x0, x25, x24, lsl 3
	mov	x1, 0
	add	x24, x24, 1
	ldr	x0, [x0, -8]
	bl	pthread_join
	movi	v28.4s, 0
	cmp	x24, 5
	bne	.L19
	and	w3, w20, -4
	cmp	w3, w20
	bcs	.L16
	sub	w0, w20, #1
	uxtw	x5, w3
	sub	w0, w0, w3
	cmp	w0, 14
	bls	.L21
	ldr	x6, [sp, 120]
	sub	w0, w20, w3
	add	x4, x5, 22
	add	x2, x5, 44
	add	x4, x0, x4
	add	x1, x5, 22
	add	x0, x0, x2
	add	x2, x6, x2
	add	x4, x23, x4, lsl 1
	add	x1, x23, x1, lsl 1
	cmp	x4, x2
	add	x0, x6, x0
	ccmp	x0, x1, 0, hi
	sub	w4, w20, w3
	bhi	.L21
	movi	v25.8h, 0x84
	lsr	w0, w4, 4
	mvni	v26.8h, 0x80, lsl 8
	movi	v21.16b, 0xffffffffffffffef
	add	x0, x2, w0, uxtw 4
	movi	v27.8h, 0xa
	movi	v22.16b, 0xf
	movi	v23.16b, 0xffffffffffffff80
	movi	v24.16b, 0x7
	.p2align 5,,15
.L22:
	ldp	q29, q30, [x1], 32
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
	str	q31, [x2], 16
	cmp	x0, x2
	bne	.L22
	and	w6, w4, -16
	add	w6, w6, w3
	tst	x4, 15
	beq	.L16
	ldr	x0, [sp, 120]
	mov	x7, 44
	uxtw	x5, w6
	mov	x4, 0
	add	x5, x5, x7
	add	x7, x7, w6, uxtw 1
	add	x7, x23, x7
	add	x5, x0, x5
	mov	w9, 7
	mov	w8, 10
	.p2align 5,,15
.L26:
	ldrsh	w2, [x7, x4, lsl 1]
	asr	w1, w2, 15
	ubfx	x0, x2, 8, 8
	and	w1, w1, 65535
	and	w0, w0, 128
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
	orr	w2, w0, w2, lsl 4
	asr	w1, w1, w3
	and	w1, w1, 15
	orr	w1, w2, w1
	mvn	w1, w1
	strb	w1, [x5, x4]
	add	x4, x4, 1
	add	w0, w6, w4
	cmp	w20, w0
	bhi	.L26
.L16:
	ldr	x0, [sp, 120]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 448
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
.L21:
	.cfi_restore_state
	mov	x2, x5
	mov	w6, 7
	mov	w5, 10
	.p2align 5,,15
.L27:
	ldrsh	w1, [x21, x2, lsl 1]
	asr	w0, w1, 15
	ubfx	x4, x1, 8, 8
	and	w0, w0, 65535
	and	w4, w4, 128
	add	w1, w0, w1, uxth
	eor	w0, w0, w1
	and	w0, w0, 65535
	add	w0, w0, 132
	and	w3, w0, 65535
	eor	w3, w3, 32767
	sbfx	x1, x0, 15, 1
	and	w1, w1, w3
	eor	w0, w0, w1
	and	w0, w0, 65535
	clz	w3, w0
	sub	w3, w3, #17
	sub	w1, w6, w3, uxtb
	sub	w3, w5, w3, uxtb
	orr	w1, w4, w1, lsl 4
	asr	w0, w0, w3
	and	w0, w0, 15
	orr	w0, w1, w0
	mvn	w0, w0
	strb	w0, [x22, x2]
	add	x2, x2, 1
	cmp	w20, w2
	bhi	.L27
	ldr	x0, [sp, 120]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 448
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
.L43:
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
	stp	x29, x30, [sp, -448]!
	.cfi_def_cfa_offset 448
	.cfi_offset 29, -448
	.cfi_offset 30, -440
	mov	w4, 1
	mov	w2, 16
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -432
	.cfi_offset 20, -424
	mov	x20, x0
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	.cfi_offset 21, -416
	.cfi_offset 22, -408
	.cfi_offset 23, -400
	.cfi_offset 24, -392
	.cfi_offset 25, -384
	.cfi_offset 26, -376
	.cfi_offset 27, -368
	.cfi_offset 28, -360
	ldrh	w3, [x0, 32]
	ldr	w5, [x0, 40]
	ldr	w1, [x20, 24]
	ldrh	w0, [x0, 22]
	udiv	w3, w5, w3
	bl	new_wav
	str	x0, [sp, 120]
	cbz	x0, .L76
	adrp	x26, decompress_wav_thread
	ldr	w21, [x20, 40]
	add	x0, x26, :lo12:decompress_wav_thread
	str	x0, [sp, 104]
	ldr	x0, [sp, 120]
	add	x23, x20, 44
	add	x26, sp, 224
	add	x24, sp, 160
	add	x28, sp, 328
	add	x25, sp, 128
	lsr	w27, w21, 2
	add	x22, x0, 44
	mov	w6, 0
	add	x0, sp, 320
	mov	x19, 0
	str	x0, [sp, 112]
.L46:
	uxtw	x1, w6
	str	w6, [sp, 100]
	add	x2, x23, x1
	str	w27, [x26, 16]
	add	x1, x22, x1, lsl 1
	stp	x2, x1, [x26]
	mov	x0, x24
	bl	pthread_attr_init
	str	xzr, [x28, 112]
	ldr	x2, [sp, 112]
	mov	x0, 1
	movi	v31.4s, 0
	lsl	x8, x0, x19
	str	x8, [sp, 320]
	mov	x1, 128
	mov	x0, x24
	stp	q31, q31, [x28]
	stp	q31, q31, [x28, 32]
	stp	q31, q31, [x28, 64]
	str	q31, [x28, 96]
	bl	pthread_attr_setaffinity_np
	mov	x3, x26
	ldr	x2, [sp, 104]
	mov	x1, x24
	add	x0, x25, w19, uxtw 3
	add	x19, x19, 1
	add	x26, x26, 24
	bl	pthread_create
	mov	x0, x24
	bl	pthread_attr_destroy
	ldr	w6, [sp, 100]
	add	w6, w6, w27
	cmp	x19, 4
	bne	.L46
	mov	x24, 1
.L47:
	add	x0, x25, x24, lsl 3
	mov	x1, 0
	add	x24, x24, 1
	ldr	x0, [x0, -8]
	bl	pthread_join
	movi	v26.4s, 0
	cmp	x24, 5
	bne	.L47
	and	w0, w21, -4
	cmp	w0, w21
	bcs	.L44
	sub	w4, w21, w0
	uxtw	x5, w0
	sub	w7, w4, #1
	cmp	w7, 6
	bls	.L49
	ldr	x8, [sp, 120]
	add	x3, x5, w4, uxtw
	add	x6, x3, 22
	add	x2, x5, 44
	add	x1, x5, 22
	add	x3, x3, 44
	add	x2, x20, x2
	add	x6, x8, x6, lsl 1
	add	x3, x20, x3
	cmp	x6, x2
	add	x1, x8, x1, lsl 1
	ccmp	x1, x3, 2, hi
	bcc	.L49
	cmp	w7, 14
	bls	.L59
	movi	v20.16b, 0xf
	lsr	w3, w4, 4
	movi	v21.16b, 0x10
	movi	v22.16b, 0x7
	add	x3, x2, w3, uxtw 4
	movi	v23.16b, 0x3
	mvni	v25.8h, 0x83
	.p2align 5,,15
.L51:
	ldr	q31, [x2], 16
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
	stp	q30, q31, [x1], 32
	cmp	x3, x2
	bne	.L51
	and	w1, w4, -16
	add	w0, w0, w1
	tst	x4, 15
	beq	.L44
	sub	w4, w4, w1
	sub	w2, w4, #1
	cmp	w2, 6
	bls	.L55
.L50:
	add	x1, x5, w1, uxtw
	movi	v2.8b, 0xf
	add	x20, x20, x1
	movi	v0.8b, 0x7
	movi	v31.8b, 0x3
	movi	v28.8b, 0x10
	mvni	v29.8h, 0x83
	ldr	d1, [x20, 44]
	ldr	x2, [sp, 120]
	not	v1.8b, v1.8b
	add	x1, x2, x1, lsl 1
	and	w2, w4, -8
	add	w0, w0, w2
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
	str	q29, [x1, 44]
	tst	x4, 7
	beq	.L44
.L55:
	ldrb	w2, [x23, w0, uxtw]
	add	w4, w0, 1
	mvn	w2, w2
	and	w1, w2, 15
	ubfx	x3, x2, 4, 3
	orr	w1, w1, 16
	add	w3, w3, 3
	sbfx	x2, x2, 7, 1
	and	w2, w2, 65535
	lsl	w1, w1, w3
	and	w1, w1, 65535
	sub	w1, w1, #132
	eor	w1, w2, w1
	sub	w1, w1, w2
	strh	w1, [x22, w0, uxtw 1]
	cmp	w21, w4
	bls	.L44
	ldrb	w2, [x23, w4, uxtw]
	add	w5, w0, 2
	mvn	w2, w2
	and	w1, w2, 15
	ubfx	x3, x2, 4, 3
	orr	w1, w1, 16
	add	w3, w3, 3
	sbfx	x2, x2, 7, 1
	and	w2, w2, 65535
	lsl	w1, w1, w3
	and	w1, w1, 65535
	sub	w1, w1, #132
	eor	w1, w2, w1
	sub	w1, w1, w2
	strh	w1, [x22, w4, uxtw 1]
	cmp	w21, w5
	bls	.L44
	ldrb	w2, [x23, w5, uxtw]
	add	w4, w0, 3
	mvn	w2, w2
	and	w1, w2, 15
	ubfx	x3, x2, 4, 3
	orr	w1, w1, 16
	add	w3, w3, 3
	sbfx	x2, x2, 7, 1
	and	w2, w2, 65535
	lsl	w1, w1, w3
	and	w1, w1, 65535
	sub	w1, w1, #132
	eor	w1, w2, w1
	sub	w1, w1, w2
	strh	w1, [x22, w5, uxtw 1]
	cmp	w21, w4
	bls	.L44
	ldrb	w2, [x23, w4, uxtw]
	add	w5, w0, 4
	mvn	w2, w2
	and	w1, w2, 15
	ubfx	x3, x2, 4, 3
	orr	w1, w1, 16
	add	w3, w3, 3
	sbfx	x2, x2, 7, 1
	and	w2, w2, 65535
	lsl	w1, w1, w3
	and	w1, w1, 65535
	sub	w1, w1, #132
	eor	w1, w2, w1
	sub	w1, w1, w2
	strh	w1, [x22, w4, uxtw 1]
	cmp	w21, w5
	bls	.L44
	ldrb	w2, [x23, w5, uxtw]
	add	w4, w0, 5
	mvn	w2, w2
	and	w1, w2, 15
	ubfx	x3, x2, 4, 3
	orr	w1, w1, 16
	add	w3, w3, 3
	sbfx	x2, x2, 7, 1
	and	w2, w2, 65535
	lsl	w1, w1, w3
	and	w1, w1, 65535
	sub	w1, w1, #132
	eor	w1, w2, w1
	sub	w1, w1, w2
	strh	w1, [x22, w5, uxtw 1]
	cmp	w21, w4
	bls	.L44
	ldrb	w2, [x23, w4, uxtw]
	add	w0, w0, 6
	mvn	w2, w2
	and	w1, w2, 15
	ubfx	x3, x2, 4, 3
	orr	w1, w1, 16
	add	w3, w3, 3
	sbfx	x2, x2, 7, 1
	and	w2, w2, 65535
	lsl	w1, w1, w3
	and	w1, w1, 65535
	sub	w1, w1, #132
	eor	w1, w2, w1
	sub	w1, w1, w2
	strh	w1, [x22, w4, uxtw 1]
	cmp	w21, w0
	bls	.L44
	ldrb	w2, [x23, w0, uxtw]
	mvn	w2, w2
	and	w1, w2, 15
	ubfx	x3, x2, 4, 3
	orr	w1, w1, 16
	add	w3, w3, 3
	sbfx	x2, x2, 7, 1
	and	w2, w2, 65535
	lsl	w1, w1, w3
	and	w1, w1, 65535
	sub	w1, w1, #132
	eor	w1, w2, w1
	sub	w1, w1, w2
	strh	w1, [x22, w0, uxtw 1]
.L44:
	ldr	x0, [sp, 120]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 448
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
.L49:
	.cfi_restore_state
	mov	x6, 44
	sub	w2, w21, #1
	add	x5, x5, x6
	sub	w2, w2, w0
	add	x6, x6, w0, uxtw 1
	add	x20, x20, x5
	ldr	x0, [sp, 120]
	mov	x3, 0
	add	x6, x0, x6
	.p2align 5,,15
.L57:
	ldrb	w0, [x20, x3]
	cmp	x2, x3
	mvn	w0, w0
	and	w1, w0, 15
	ubfx	x5, x0, 4, 3
	orr	w1, w1, 16
	add	w5, w5, 3
	sbfx	x0, x0, 7, 1
	and	w0, w0, 65535
	lsl	w1, w1, w5
	and	w1, w1, 65535
	sub	w1, w1, #132
	eor	w1, w0, w1
	sub	w1, w1, w0
	strh	w1, [x6, x3, lsl 1]
	add	x3, x3, 1
	bne	.L57
	ldr	x0, [sp, 120]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 448
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
.L59:
	.cfi_restore_state
	mov	w1, 0
	b	.L50
.L76:
	mov	w0, 1
	bl	exit
	.cfi_endproc
.LFE4005:
	.size	decompress_wav, .-decompress_wav
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
