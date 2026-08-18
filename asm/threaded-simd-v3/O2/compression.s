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
	stp	x29, x30, [sp, -432]!
	.cfi_def_cfa_offset 432
	.cfi_offset 29, -432
	.cfi_offset 30, -424
	mov	w4, 7
	mov	w2, 8
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	.cfi_offset 19, -416
	.cfi_offset 20, -408
	.cfi_offset 21, -400
	.cfi_offset 22, -392
	.cfi_offset 23, -384
	.cfi_offset 24, -376
	.cfi_offset 25, -368
	.cfi_offset 26, -360
	mov	x26, x0
	stp	x27, x28, [sp, 80]
	.cfi_offset 27, -352
	.cfi_offset 28, -344
	ldrh	w3, [x0, 32]
	ldr	w5, [x0, 40]
	ldr	w1, [x26, 24]
	ldrh	w0, [x0, 22]
	udiv	w3, w5, w3
	bl	new_wav
	cbz	x0, .L19
	mov	x19, x0
	ldr	w0, [x26, 40]
	mov	w7, 43691
	adrp	x24, compress_wav_thread
	movk	w7, 0xaaaa, lsl 16
	add	x27, sp, 232
	lsr	w23, w0, 5
	lsr	w0, w0, 1
	str	w0, [sp, 140]
	add	x0, x24, :lo12:compress_wav_thread
	str	x0, [sp, 120]
	add	x0, x26, 44
	umull	x7, w23, w7
	str	x0, [sp, 104]
	add	x0, x19, 44
	str	x0, [sp, 112]
	add	x0, sp, 304
	str	x0, [sp, 128]
	lsr	x24, x7, 33
	add	x21, sp, 144
	add	x20, sp, 168
	add	x25, sp, 312
	add	w0, w24, w24, lsl 1
	mov	w28, 0
	sub	w23, w23, w0
	mov	w22, 0
.L12:
	ldr	x0, [sp, 112]
	uxtw	x2, w22
	cmp	w23, w28
	add	x8, x0, x2
	cinc	w1, w24, hi
	ldr	x0, [sp, 104]
	lsl	w1, w1, 4
	str	w1, [x27, 16]
	add	w22, w22, w1
	add	x2, x0, x2, lsl 1
	stp	x8, x2, [x27]
	mov	x0, x20
	bl	pthread_attr_init
	str	xzr, [x25, 112]
	ldr	x2, [sp, 128]
	mov	x0, 1
	movi	v31.4s, 0
	lsl	x8, x0, x28
	str	x8, [sp, 304]
	mov	x1, 128
	mov	x0, x20
	add	w28, w28, 1
	stp	q31, q31, [x25]
	stp	q31, q31, [x25, 32]
	stp	q31, q31, [x25, 64]
	str	q31, [x25, 96]
	bl	pthread_attr_setaffinity_np
	mov	x3, x27
	ldr	x2, [sp, 120]
	mov	x1, x20
	mov	x0, x21
	add	x27, x27, 24
	add	x21, x21, 8
	bl	pthread_create
	mov	x0, x20
	bl	pthread_attr_destroy
	cmp	w28, 3
	bne	.L12
	ldr	x0, [sp, 144]
	mov	x1, 0
	bl	pthread_join
	ldr	x0, [sp, 152]
	mov	x1, 0
	bl	pthread_join
	ldr	x0, [sp, 160]
	mov	x1, 0
	bl	pthread_join
	ldr	w1, [sp, 140]
	cmp	w1, w22
	bls	.L10
	mov	x0, 44
	uxtw	x8, w22
	add	x8, x8, x0
	sub	w7, w1, #1
	add	x0, x0, w22, uxtw 1
	sub	w7, w7, w22
	add	x8, x19, x8
	add	x0, x26, x0
	mov	x4, 0
	mov	w10, 7
	mov	w9, 10
	.p2align 5,,15
.L14:
	ldrsh	w2, [x0, x4, lsl 1]
	cmp	x7, x4
	asr	w1, w2, 15
	ubfx	x6, x2, 8, 8
	and	w1, w1, 65535
	and	w6, w6, 128
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
	sub	w2, w10, w3, uxtb
	sub	w3, w9, w3, uxtb
	orr	w2, w6, w2, lsl 4
	asr	w1, w1, w3
	and	w1, w1, 15
	orr	w1, w2, w1
	mvn	w1, w1
	strb	w1, [x8, x4]
	add	x4, x4, 1
	bne	.L14
.L10:
	ldp	x21, x22, [sp, 32]
	mov	x0, x19
	ldp	x19, x20, [sp, 16]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 432
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
.L19:
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
	stp	x29, x30, [sp, -432]!
	.cfi_def_cfa_offset 432
	.cfi_offset 29, -432
	.cfi_offset 30, -424
	mov	w4, 1
	mov	w2, 16
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	.cfi_offset 19, -416
	.cfi_offset 20, -408
	.cfi_offset 21, -400
	.cfi_offset 22, -392
	.cfi_offset 23, -384
	.cfi_offset 24, -376
	.cfi_offset 25, -368
	.cfi_offset 26, -360
	mov	x26, x0
	stp	x27, x28, [sp, 80]
	.cfi_offset 27, -352
	.cfi_offset 28, -344
	ldrh	w3, [x0, 32]
	ldr	w6, [x0, 40]
	ldr	w1, [x26, 24]
	ldrh	w0, [x0, 22]
	udiv	w3, w6, w3
	bl	new_wav
	cbz	x0, .L29
	mov	x19, x0
	ldr	w0, [x26, 40]
	mov	w8, 43691
	adrp	x24, decompress_wav_thread
	movk	w8, 0xaaaa, lsl 16
	str	w0, [sp, 140]
	lsr	w23, w0, 3
	add	x0, x24, :lo12:decompress_wav_thread
	str	x0, [sp, 120]
	add	x0, x26, 44
	str	x0, [sp, 104]
	add	x0, x19, 44
	umull	x8, w23, w8
	str	x0, [sp, 112]
	add	x0, sp, 304
	str	x0, [sp, 128]
	add	x27, sp, 232
	add	x22, sp, 144
	lsr	x24, x8, 33
	add	x21, sp, 168
	add	x20, sp, 312
	mov	w28, 0
	add	w0, w24, w24, lsl 1
	mov	w25, 0
	sub	w23, w23, w0
.L22:
	ldr	x2, [sp, 104]
	uxtw	x0, w25
	cmp	w23, w28
	add	x9, x2, x0
	cinc	w1, w24, hi
	ldr	x2, [sp, 112]
	lsl	w1, w1, 3
	str	w1, [x27, 16]
	add	w25, w25, w1
	add	x2, x2, x0, lsl 1
	stp	x9, x2, [x27]
	mov	x0, x21
	bl	pthread_attr_init
	str	xzr, [x20, 112]
	ldr	x2, [sp, 128]
	mov	x0, 1
	movi	v31.4s, 0
	lsl	x9, x0, x28
	str	x9, [sp, 304]
	mov	x1, 128
	mov	x0, x21
	add	w28, w28, 1
	stp	q31, q31, [x20]
	stp	q31, q31, [x20, 32]
	stp	q31, q31, [x20, 64]
	str	q31, [x20, 96]
	bl	pthread_attr_setaffinity_np
	mov	x3, x27
	ldr	x2, [sp, 120]
	mov	x1, x21
	mov	x0, x22
	add	x27, x27, 24
	add	x22, x22, 8
	bl	pthread_create
	mov	x0, x21
	bl	pthread_attr_destroy
	cmp	w28, 3
	bne	.L22
	ldr	x0, [sp, 144]
	mov	x1, 0
	bl	pthread_join
	ldr	x0, [sp, 152]
	mov	x1, 0
	bl	pthread_join
	ldr	x0, [sp, 160]
	mov	x1, 0
	bl	pthread_join
	ldr	w1, [sp, 140]
	cmp	w1, w25
	bls	.L20
	mov	x6, 44
	uxtw	x0, w25
	add	x0, x0, x6
	sub	w20, w1, #1
	add	x6, x6, w25, uxtw 1
	sub	w20, w20, w25
	add	x0, x26, x0
	add	x6, x19, x6
	mov	x3, 0
	.p2align 5,,15
.L24:
	ldrb	w2, [x0, x3]
	cmp	x20, x3
	mvn	w2, w2
	and	w1, w2, 15
	ubfx	x5, x2, 4, 3
	orr	w1, w1, 16
	add	w5, w5, 3
	sbfx	x2, x2, 7, 1
	and	w2, w2, 65535
	lsl	w1, w1, w5
	and	w1, w1, 65535
	sub	w1, w1, #132
	eor	w1, w2, w1
	sub	w1, w1, w2
	strh	w1, [x6, x3, lsl 1]
	add	x3, x3, 1
	bne	.L24
.L20:
	ldp	x21, x22, [sp, 32]
	mov	x0, x19
	ldp	x19, x20, [sp, 16]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 432
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
.L29:
	.cfi_restore_state
	mov	w0, 1
	bl	exit
	.cfi_endproc
.LFE4005:
	.size	decompress_wav, .-decompress_wav
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
