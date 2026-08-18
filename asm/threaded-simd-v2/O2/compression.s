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
	.cfi_offset 19, -448
	.cfi_offset 20, -440
	.cfi_offset 21, -432
	.cfi_offset 22, -424
	mov	x21, x0
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	.cfi_offset 23, -416
	.cfi_offset 24, -408
	.cfi_offset 25, -400
	.cfi_offset 26, -392
	.cfi_offset 27, -384
	.cfi_offset 28, -376
	ldrh	w3, [x0, 32]
	ldr	w5, [x0, 40]
	ldr	w1, [x21, 24]
	ldrh	w0, [x0, 22]
	udiv	w3, w5, w3
	bl	new_wav
	str	x0, [sp, 128]
	cbz	x0, .L21
	ldr	w22, [x21, 40]
	add	x24, sp, 144
	mov	x20, x24
	add	x26, sp, 240
	add	x19, sp, 176
	add	x25, sp, 344
	lsr	w0, w22, 1
	str	w0, [sp, 140]
	adrp	x0, compress_wav_thread
	add	x0, x0, :lo12:compress_wav_thread
	str	x0, [sp, 112]
	lsr	w28, w22, 7
	ldr	x0, [sp, 128]
	ubfx	x22, x22, 5, 2
	add	x1, x21, 44
	mov	w27, 0
	add	x0, x0, 44
	mov	w23, 0
	stp	x1, x0, [sp, 96]
	add	x0, sp, 336
	str	x0, [sp, 120]
.L12:
	ldr	x2, [sp, 104]
	uxtw	x0, w23
	cmp	w27, w22
	add	x6, x2, x0
	cinc	w1, w28, cc
	ldr	x2, [sp, 96]
	lsl	w1, w1, 4
	str	w1, [x26, 16]
	add	w23, w23, w1
	add	x2, x2, x0, lsl 1
	stp	x6, x2, [x26]
	mov	x0, x19
	bl	pthread_attr_init
	str	xzr, [x25, 112]
	ldr	x2, [sp, 120]
	mov	x0, 1
	movi	v31.4s, 0
	lsl	x6, x0, x27
	str	x6, [sp, 336]
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
	add	x0, x24, x19, lsl 3
	mov	x1, 0
	add	x19, x19, 1
	ldr	x0, [x0, -8]
	bl	pthread_join
	cmp	x19, 5
	bne	.L13
	ldr	w0, [sp, 140]
	cmp	w0, w23
	bls	.L10
	sub	w6, w0, #1
	mov	x7, 44
	ldr	x0, [sp, 128]
	uxtw	x8, w23
	add	x8, x8, x7
	add	x7, x7, w23, uxtw 1
	sub	w6, w6, w23
	add	x7, x21, x7
	add	x8, x0, x8
	mov	x3, 0
	mov	w10, 7
	mov	w9, 10
	.p2align 5,,15
.L15:
	ldrsh	w1, [x7, x3, lsl 1]
	cmp	x6, x3
	asr	w0, w1, 15
	ubfx	x5, x1, 8, 8
	and	w0, w0, 65535
	and	w5, w5, 128
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
	sub	w1, w10, w2, uxtb
	sub	w2, w9, w2, uxtb
	orr	w1, w5, w1, lsl 4
	asr	w0, w0, w2
	and	w0, w0, 15
	orr	w0, w1, w0
	mvn	w0, w0
	strb	w0, [x8, x3]
	add	x3, x3, 1
	bne	.L15
.L10:
	ldr	x0, [sp, 128]
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
.L21:
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
	mov	x19, x0
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
	ldr	w1, [x19, 24]
	ldrh	w0, [x0, 22]
	udiv	w3, w5, w3
	bl	new_wav
	str	x0, [sp, 128]
	cbz	x0, .L33
	ldr	w0, [x19, 40]
	add	x23, sp, 144
	str	w0, [sp, 140]
	mov	x21, x23
	add	x25, sp, 240
	add	x20, sp, 176
	lsr	w28, w0, 5
	ubfx	x27, x0, 3, 2
	adrp	x0, decompress_wav_thread
	add	x0, x0, :lo12:decompress_wav_thread
	str	x0, [sp, 112]
	add	x24, sp, 344
	ldr	x0, [sp, 128]
	add	x1, x19, 44
	mov	w26, 0
	mov	w22, 0
	add	x0, x0, 44
	stp	x1, x0, [sp, 96]
	add	x0, sp, 336
	str	x0, [sp, 120]
.L24:
	ldr	x2, [sp, 96]
	uxtw	x0, w22
	cmp	w26, w27
	add	x7, x2, x0
	cinc	w1, w28, cc
	ldr	x2, [sp, 104]
	lsl	w1, w1, 3
	str	w1, [x25, 16]
	add	w22, w22, w1
	add	x2, x2, x0, lsl 1
	stp	x7, x2, [x25]
	mov	x0, x20
	bl	pthread_attr_init
	str	xzr, [x24, 112]
	ldr	x2, [sp, 120]
	mov	x0, 1
	movi	v31.4s, 0
	lsl	x7, x0, x26
	str	x7, [sp, 336]
	mov	x1, 128
	mov	x0, x20
	add	w26, w26, 1
	stp	q31, q31, [x24]
	stp	q31, q31, [x24, 32]
	stp	q31, q31, [x24, 64]
	str	q31, [x24, 96]
	bl	pthread_attr_setaffinity_np
	mov	x3, x25
	ldr	x2, [sp, 112]
	mov	x1, x20
	mov	x0, x21
	add	x25, x25, 24
	add	x21, x21, 8
	bl	pthread_create
	mov	x0, x20
	bl	pthread_attr_destroy
	cmp	w26, 4
	bne	.L24
	mov	x20, 1
.L25:
	add	x0, x23, x20, lsl 3
	mov	x1, 0
	add	x20, x20, 1
	ldr	x0, [x0, -8]
	bl	pthread_join
	cmp	x20, 5
	bne	.L25
	ldr	w2, [sp, 140]
	cmp	w2, w22
	bls	.L22
	uxtw	x1, w22
	mov	x0, 44
	add	x1, x1, x0
	sub	w5, w2, #1
	add	x19, x19, x1
	add	x0, x0, w22, uxtw 1
	ldr	x1, [sp, 128]
	sub	w5, w5, w22
	mov	x2, 0
	add	x6, x1, x0
	.p2align 5,,15
.L27:
	ldrb	w1, [x19, x2]
	cmp	x5, x2
	mvn	w1, w1
	and	w0, w1, 15
	ubfx	x4, x1, 4, 3
	orr	w0, w0, 16
	add	w4, w4, 3
	sbfx	x1, x1, 7, 1
	and	w1, w1, 65535
	lsl	w0, w0, w4
	and	w0, w0, 65535
	sub	w0, w0, #132
	eor	w0, w1, w0
	sub	w0, w0, w1
	strh	w0, [x6, x2, lsl 1]
	add	x2, x2, 1
	bne	.L27
.L22:
	ldr	x0, [sp, 128]
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
.L33:
	.cfi_restore_state
	mov	w0, 1
	bl	exit
	.cfi_endproc
.LFE4005:
	.size	decompress_wav, .-decompress_wav
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
