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
	stp	x29, x30, [sp, -416]!
	.cfi_def_cfa_offset 416
	.cfi_offset 29, -416
	.cfi_offset 30, -408
	mov	w4, 7
	mov	w2, 8
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	.cfi_offset 19, -400
	.cfi_offset 20, -392
	.cfi_offset 21, -384
	.cfi_offset 22, -376
	.cfi_offset 23, -368
	.cfi_offset 24, -360
	.cfi_offset 25, -352
	.cfi_offset 26, -344
	.cfi_offset 27, -336
	.cfi_offset 28, -328
	mov	x28, x0
	ldrh	w3, [x0, 32]
	ldr	w5, [x0, 40]
	ldr	w1, [x28, 24]
	ldrh	w0, [x0, 22]
	udiv	w3, w5, w3
	bl	new_wav
	str	x0, [sp, 120]
	cbz	x0, .L35
	ldr	w20, [x28, 40]
	mov	w8, 43691
	movk	w8, 0xaaaa, lsl 16
	adrp	x26, compress_wav_thread
	add	x0, x26, :lo12:compress_wav_thread
	str	x0, [sp, 104]
	lsr	w1, w20, 5
	add	x21, x28, 44
	ldr	x0, [sp, 120]
	add	x26, sp, 216
	umull	x8, w1, w8
	add	x24, sp, 128
	add	x22, x0, 44
	add	x0, sp, 288
	add	x23, sp, 152
	add	x19, sp, 296
	lsr	x4, x8, 33
	lsr	w20, w20, 1
	str	x0, [sp, 112]
	mov	w25, 0
	add	w0, w4, w4, lsl 1
	mov	w27, 0
	sub	w0, w1, w0
	str	w0, [sp, 100]
.L12:
	ldr	w0, [sp, 100]
	uxtw	x2, w27
	add	x9, x22, x2
	str	w4, [sp, 96]
	cmp	w0, w25
	add	x2, x21, x2, lsl 1
	cinc	w1, w4, hi
	stp	x9, x2, [x26]
	mov	x0, x23
	lsl	w1, w1, 4
	str	w1, [x26, 16]
	add	w27, w27, w1
	bl	pthread_attr_init
	str	xzr, [x19, 112]
	ldr	x2, [sp, 112]
	mov	x0, 1
	movi	v31.4s, 0
	lsl	x9, x0, x25
	str	x9, [sp, 288]
	mov	x1, 128
	mov	x0, x23
	add	w25, w25, 1
	stp	q31, q31, [x19]
	stp	q31, q31, [x19, 32]
	stp	q31, q31, [x19, 64]
	str	q31, [x19, 96]
	bl	pthread_attr_setaffinity_np
	mov	x3, x26
	ldr	x2, [sp, 104]
	mov	x1, x23
	mov	x0, x24
	add	x26, x26, 24
	add	x24, x24, 8
	bl	pthread_create
	mov	x0, x23
	bl	pthread_attr_destroy
	ldr	w4, [sp, 96]
	cmp	w25, 3
	bne	.L12
	ldr	x0, [sp, 128]
	mov	x1, 0
	bl	pthread_join
	ldr	x0, [sp, 136]
	mov	x1, 0
	bl	pthread_join
	ldr	x0, [sp, 144]
	mov	x1, 0
	bl	pthread_join
	cmp	w20, w27
	bls	.L10
	sub	w4, w20, w27
	uxtw	x5, w27
	movi	v28.4s, 0
	sub	w0, w4, #1
	cmp	w0, 14
	bls	.L14
	ldr	x3, [sp, 120]
	add	x0, x5, w4, uxtw
	add	x8, x0, 22
	add	x2, x5, 44
	add	w1, w5, 22
	add	x0, x0, 44
	add	x2, x3, x2
	add	x8, x28, x8, lsl 1
	add	x3, x3, x0
	cmp	x8, x2
	add	x0, x28, x1, lsl 1
	ccmp	x3, x0, 0, hi
	bhi	.L14
	lsr	w3, w4, 4
	mov	x1, x2
	movi	v25.8h, 0x84
	mvni	v26.8h, 0x80, lsl 8
	add	x2, x2, w3, uxtw 4
	movi	v21.16b, 0xffffffffffffffef
	movi	v27.8h, 0xa
	movi	v22.16b, 0xf
	movi	v23.16b, 0xffffffffffffff80
	movi	v24.16b, 0x7
	.p2align 5,,15
.L15:
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
	bne	.L15
	and	w3, w4, -16
	add	w3, w3, w27
	tst	x4, 15
	beq	.L10
	mov	w6, 7
	mov	w5, 10
	.p2align 5,,15
.L19:
	ldrsh	w0, [x21, w3, uxtw 1]
	asr	w1, w0, 15
	ubfx	x4, x0, 8, 8
	and	w1, w1, 65535
	and	w4, w4, 128
	add	w0, w1, w0, uxth
	eor	w1, w1, w0
	and	w1, w1, 65535
	add	w1, w1, 132
	and	w2, w1, 65535
	eor	w2, w2, 32767
	sbfx	x0, x1, 15, 1
	and	w0, w0, w2
	eor	w1, w1, w0
	and	w1, w1, 65535
	clz	w2, w1
	sub	w2, w2, #17
	sub	w0, w6, w2, uxtb
	sub	w2, w5, w2, uxtb
	orr	w0, w4, w0, lsl 4
	asr	w1, w1, w2
	and	w1, w1, 15
	orr	w0, w0, w1
	mvn	w0, w0
	strb	w0, [x22, w3, uxtw]
	add	w3, w3, 1
	cmp	w20, w3
	bhi	.L19
.L10:
	ldr	x0, [sp, 120]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 416
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
.L14:
	.cfi_restore_state
	ldr	x1, [sp, 120]
	mov	x0, 44
	sub	w3, w20, #1
	add	x5, x5, x0
	add	x0, x0, w27, uxtw 1
	sub	w3, w3, w27
	add	x7, x28, x0
	add	x8, x1, x5
	mov	x4, 0
	mov	w10, 7
	mov	w9, 10
	.p2align 5,,15
.L20:
	ldrsh	w0, [x7, x4, lsl 1]
	cmp	x3, x4
	asr	w1, w0, 15
	ubfx	x6, x0, 8, 8
	and	w1, w1, 65535
	and	w6, w6, 128
	add	w0, w1, w0, uxth
	eor	w1, w1, w0
	and	w1, w1, 65535
	add	w1, w1, 132
	and	w2, w1, 65535
	eor	w2, w2, 32767
	sbfx	x0, x1, 15, 1
	and	w0, w0, w2
	eor	w1, w1, w0
	and	w1, w1, 65535
	clz	w2, w1
	sub	w2, w2, #17
	sub	w0, w10, w2, uxtb
	sub	w2, w9, w2, uxtb
	orr	w0, w6, w0, lsl 4
	asr	w1, w1, w2
	and	w1, w1, 15
	orr	w0, w0, w1
	mvn	w0, w0
	strb	w0, [x8, x4]
	add	x4, x4, 1
	bne	.L20
	ldr	x0, [sp, 120]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 416
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
.L35:
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
	stp	x29, x30, [sp, -416]!
	.cfi_def_cfa_offset 416
	.cfi_offset 29, -416
	.cfi_offset 30, -408
	mov	w4, 1
	mov	w2, 16
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	.cfi_offset 19, -400
	.cfi_offset 20, -392
	.cfi_offset 21, -384
	.cfi_offset 22, -376
	.cfi_offset 23, -368
	.cfi_offset 24, -360
	.cfi_offset 25, -352
	.cfi_offset 26, -344
	.cfi_offset 27, -336
	.cfi_offset 28, -328
	mov	x28, x0
	ldrh	w3, [x0, 32]
	ldr	w6, [x0, 40]
	ldr	w1, [x28, 24]
	ldrh	w0, [x0, 22]
	udiv	w3, w6, w3
	bl	new_wav
	str	x0, [sp, 104]
	cbz	x0, .L66
	ldr	w6, [x28, 40]
	mov	w9, 43691
	movk	w9, 0xaaaa, lsl 16
	adrp	x26, decompress_wav_thread
	add	x0, x26, :lo12:decompress_wav_thread
	str	x0, [sp, 112]
	lsr	w25, w6, 3
	add	x19, x28, 44
	ldr	x0, [sp, 104]
	add	x22, sp, 216
	umull	x9, w25, w9
	add	x24, sp, 128
	add	x26, x0, 44
	add	x0, sp, 288
	str	x0, [sp, 120]
	add	x23, sp, 152
	lsr	x9, x9, 33
	add	x21, sp, 296
	mov	w27, 0
	mov	w20, 0
	add	w0, w9, w9, lsl 1
	sub	w25, w25, w0
.L38:
	cmp	w25, w27
	uxtw	x0, w20
	cinc	w1, w9, hi
	add	x3, x19, x0
	add	x2, x26, x0, lsl 1
	mov	x0, x23
	lsl	w1, w1, 3
	str	w1, [x22, 16]
	stp	w9, w6, [sp, 96]
	add	w20, w20, w1
	stp	x3, x2, [x22]
	bl	pthread_attr_init
	str	xzr, [x21, 112]
	ldr	x2, [sp, 120]
	mov	x0, 1
	movi	v31.4s, 0
	lsl	x3, x0, x27
	str	x3, [sp, 288]
	mov	x1, 128
	mov	x0, x23
	add	w27, w27, 1
	stp	q31, q31, [x21]
	stp	q31, q31, [x21, 32]
	stp	q31, q31, [x21, 64]
	str	q31, [x21, 96]
	bl	pthread_attr_setaffinity_np
	mov	x3, x22
	ldr	x2, [sp, 112]
	mov	x1, x23
	mov	x0, x24
	add	x22, x22, 24
	add	x24, x24, 8
	bl	pthread_create
	mov	x0, x23
	bl	pthread_attr_destroy
	ldp	w9, w6, [sp, 96]
	cmp	w27, 3
	bne	.L38
	ldr	x0, [sp, 128]
	mov	x1, 0
	str	w6, [sp, 96]
	bl	pthread_join
	ldr	x0, [sp, 136]
	mov	x1, 0
	bl	pthread_join
	ldr	x0, [sp, 144]
	mov	x1, 0
	bl	pthread_join
	ldr	w6, [sp, 96]
	cmp	w6, w20
	bls	.L36
	sub	w3, w6, w20
	uxtw	x4, w20
	movi	v26.4s, 0
	sub	w10, w3, #1
	cmp	w10, 6
	bls	.L40
	ldr	x5, [sp, 104]
	add	x0, x4, w3, uxtw
	add	x9, x0, 22
	add	x2, x4, 44
	add	x1, x4, 22
	add	x0, x0, 44
	add	x2, x28, x2
	add	x9, x5, x9, lsl 1
	add	x0, x28, x0
	cmp	x9, x2
	add	x1, x5, x1, lsl 1
	ccmp	x1, x0, 2, hi
	bcc	.L40
	cmp	w10, 14
	bls	.L50
	movi	v20.16b, 0xf
	lsr	w0, w3, 4
	movi	v21.16b, 0x10
	movi	v22.16b, 0x7
	add	x0, x2, w0, uxtw 4
	movi	v23.16b, 0x3
	mvni	v25.8h, 0x83
	.p2align 5,,15
.L42:
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
	cmp	x0, x2
	bne	.L42
	and	w0, w3, -16
	add	w20, w20, w0
	tst	x3, 15
	beq	.L36
	sub	w3, w3, w0
	sub	w1, w3, #1
	cmp	w1, 6
	bls	.L46
.L41:
	add	x0, x4, w0, uxtw
	movi	v2.8b, 0xf
	add	x5, x28, x0
	movi	v0.8b, 0x7
	movi	v31.8b, 0x3
	movi	v28.8b, 0x10
	mvni	v29.8h, 0x83
	ldr	d1, [x5, 44]
	ldr	x1, [sp, 104]
	not	v1.8b, v1.8b
	add	x0, x1, x0, lsl 1
	and	w1, w3, -8
	add	w20, w20, w1
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
	beq	.L36
.L46:
	ldrb	w1, [x19, w20, uxtw]
	add	w3, w20, 1
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
	strh	w0, [x26, w20, uxtw 1]
	cmp	w6, w3
	bls	.L36
	ldrb	w1, [x19, w3, uxtw]
	add	w4, w20, 2
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
	strh	w0, [x26, w3, uxtw 1]
	cmp	w6, w4
	bls	.L36
	ldrb	w1, [x19, w4, uxtw]
	add	w3, w20, 3
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
	strh	w0, [x26, w4, uxtw 1]
	cmp	w6, w3
	bls	.L36
	ldrb	w1, [x19, w3, uxtw]
	add	w4, w20, 4
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
	strh	w0, [x26, w3, uxtw 1]
	cmp	w6, w4
	bls	.L36
	ldrb	w1, [x19, w4, uxtw]
	add	w3, w20, 5
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
	strh	w0, [x26, w4, uxtw 1]
	cmp	w6, w3
	bls	.L36
	ldrb	w1, [x19, w3, uxtw]
	add	w20, w20, 6
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
	strh	w0, [x26, w3, uxtw 1]
	cmp	w6, w20
	bls	.L36
	ldrb	w1, [x19, w20, uxtw]
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
	strh	w0, [x26, w20, uxtw 1]
.L36:
	ldr	x0, [sp, 104]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 416
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
.L40:
	.cfi_restore_state
	ldr	x1, [sp, 104]
	mov	x7, 44
	sub	w0, w6, #1
	add	x4, x4, x7
	add	x7, x7, w20, uxtw 1
	sub	w0, w0, w20
	add	x5, x28, x4
	add	x7, x1, x7
	mov	x3, 0
	.p2align 5,,15
.L48:
	ldrb	w2, [x5, x3]
	cmp	x0, x3
	mvn	w2, w2
	and	w1, w2, 15
	ubfx	x6, x2, 4, 3
	orr	w1, w1, 16
	add	w6, w6, 3
	sbfx	x2, x2, 7, 1
	and	w2, w2, 65535
	lsl	w1, w1, w6
	and	w1, w1, 65535
	sub	w1, w1, #132
	eor	w1, w2, w1
	sub	w1, w1, w2
	strh	w1, [x7, x3, lsl 1]
	add	x3, x3, 1
	bne	.L48
	ldr	x0, [sp, 104]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 416
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
.L50:
	.cfi_restore_state
	mov	w0, 0
	b	.L41
.L66:
	mov	w0, 1
	bl	exit
	.cfi_endproc
.LFE4005:
	.size	decompress_wav, .-decompress_wav
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
