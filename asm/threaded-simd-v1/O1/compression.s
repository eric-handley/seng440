	.arch armv8-a
	.file	"compression.c"
	.text
	.align	2
	.global	compress_wav_thread
	.type	compress_wav_thread, %function
compress_wav_thread:
.LFB4002:
	.cfi_startproc
	ldp	x7, x6, [x0]
	ldr	w5, [x0, 16]
	cmp	w5, 7
	bls	.L6
	mov	w0, 8
	movi	v22.8h, 0x84
	mvni	v23.8h, 0x80, lsl 8
	movi	v24.8h, 0xb
	movi	v25.8b, 0xffffffffffffff80
	movi	v26.8b, 0xf
	movi	v27.8b, 0x8
.L3:
	sub	w2, w0, #8
	sub	w1, w0, #8
	lsl	x1, x1, 1
	ldr	q31, [x6, x1]
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
	str	d31, [x7, w2, uxtw]
	mov	w3, w0
	add	w0, w0, 8
	cmp	w0, w5
	bls	.L3
.L2:
	cmp	w5, w3
	bls	.L4
	uxtw	x3, w3
	mov	w9, 7
	mov	w8, 10
.L5:
	ldrsh	w1, [x6, x3, lsl 1]
	lsr	w0, w1, 16
	add	w2, w0, w1, uxth
	eor	w0, w0, w2
	and	w0, w0, 65535
	add	w0, w0, 132
	and	w4, w0, 65535
	sbfx	x2, x0, 15, 1
	eor	w4, w4, 32767
	and	w2, w2, w4
	eor	w0, w0, w2
	and	w0, w0, 65535
	clz	w2, w0
	sub	w2, w2, #17
	sub	w4, w9, w2, uxtb
	ubfiz	w4, w4, 4, 4
	ubfx	x1, x1, 8, 8
	and	w1, w1, 128
	orr	w1, w1, w4
	sub	w2, w8, w2, uxtb
	asr	w0, w0, w2
	and	w0, w0, 15
	orr	w0, w1, w0
	mvn	w0, w0
	strb	w0, [x7, x3]
	add	x3, x3, 1
	cmp	w5, w3
	bhi	.L5
.L4:
	mov	x0, 0
	ret
.L6:
	mov	w3, 0
	b	.L2
	.cfi_endproc
.LFE4002:
	.size	compress_wav_thread, .-compress_wav_thread
	.align	2
	.global	decompress_wav_thread
	.type	decompress_wav_thread, %function
decompress_wav_thread:
.LFB4003:
	.cfi_startproc
	movi	v27.4s, 0
	ldp	x6, x5, [x0]
	ldr	w4, [x0, 16]
	cmp	w4, 7
	bls	.L14
	mov	w0, 8
	movi	v22.8b, 0x3
	movi	v23.8b, 0x70
	movi	v24.8b, 0xf
	movi	v25.8b, 0x10
	mvni	v26.8h, 0x83
.L11:
	sub	w2, w0, #8
	sub	w1, w0, #8
	ldr	d31, [x6, w2, uxtw]
	not	v30.8b, v31.8b
	bic	v28.8b, v23.8b, v31.8b
	mov	v29.8b, v22.8b
	usra	v29.8b, v28.8b, 4
	sxtl	v29.8h, v29.8b
	bic	v31.8b, v24.8b, v31.8b
	orr	v31.8b, v31.8b, v25.8b
	zip1	v31.16b, v31.16b, v27.16b
	ushl	v31.8h, v31.8h, v29.8h
	sxtl	v30.8h, v30.8b
	sshr	v30.8h, v30.8h, 7
	add	v31.8h, v31.8h, v26.8h
	eor	v31.16b, v31.16b, v30.16b
	sub	v31.8h, v31.8h, v30.8h
	lsl	x1, x1, 1
	str	q31, [x5, x1]
	mov	w2, w0
	add	w0, w0, 8
	cmp	w4, w0
	bcs	.L11
.L10:
	cmp	w4, w2
	bls	.L12
	uxtw	x2, w2
.L13:
	ldrb	w1, [x6, x2]
	mvn	w1, w1
	and	w0, w1, 15
	orr	w0, w0, 16
	ubfx	x3, x1, 4, 3
	add	w3, w3, 3
	lsl	w0, w0, w3
	and	w0, w0, 65535
	sbfiz	w1, w1, 8, 8
	sub	w0, w0, #132
	eor	w0, w0, w1, lsr 16
	sub	w1, w0, w1, lsr 16
	strh	w1, [x5, x2, lsl 1]
	add	x2, x2, 1
	cmp	w4, w2
	bhi	.L13
.L12:
	mov	x0, 0
	ret
.L14:
	mov	w2, 0
	b	.L10
	.cfi_endproc
.LFE4003:
	.size	decompress_wav_thread, .-decompress_wav_thread
	.align	2
	.global	compress_wav
	.type	compress_wav, %function
compress_wav:
.LFB4004:
	.cfi_startproc
	stp	x29, x30, [sp, -432]!
	.cfi_def_cfa_offset 432
	.cfi_offset 29, -432
	.cfi_offset 30, -424
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	.cfi_offset 19, -416
	.cfi_offset 20, -408
	.cfi_offset 21, -400
	.cfi_offset 22, -392
	.cfi_offset 23, -384
	.cfi_offset 24, -376
	.cfi_offset 25, -368
	.cfi_offset 26, -360
	.cfi_offset 27, -352
	.cfi_offset 28, -344
	mov	x22, x0
	ldrh	w0, [x0, 32]
	ldr	w3, [x22, 40]
	mov	w4, 7
	udiv	w3, w3, w0
	mov	w2, 8
	ldr	w1, [x22, 24]
	ldrh	w0, [x22, 22]
	bl	new_wav
	str	x0, [sp, 104]
	cbz	x0, .L27
	add	x28, x22, 44
	ldr	x0, [sp, 104]
	add	x27, x0, 44
	ldr	w25, [x22, 40]
	lsr	w26, w25, 1
	lsr	w25, w25, 3
	add	x21, sp, 304
	mov	w24, 0
	mov	x20, 0
	add	x23, sp, 112
	add	x19, sp, 176
	adrp	x0, compress_wav_thread
	add	x0, x0, :lo12:compress_wav_thread
	str	x0, [sp, 96]
.L19:
	uxtw	x0, w24
	add	x1, x27, x0
	add	x0, x28, x0, lsl 1
	stp	x1, x0, [x21]
	str	w25, [x21, 16]
	mov	x0, x23
	bl	pthread_attr_init
	movi	v31.4s, 0
	stp	q31, q31, [x19]
	stp	q31, q31, [x19, 32]
	stp	q31, q31, [x19, 64]
	stp	q31, q31, [x19, 96]
	mov	x0, 1
	lsl	x0, x0, x20
	str	x0, [sp, 176]
	mov	x2, x19
	mov	x1, 128
	mov	x0, x23
	bl	pthread_attr_setaffinity_np
	mov	x3, x21
	ldr	x2, [sp, 96]
	mov	x1, x23
	add	x0, sp, 400
	add	x0, x0, x20, lsl 3
	bl	pthread_create
	mov	x0, x23
	bl	pthread_attr_destroy
	add	x20, x20, 1
	add	w24, w24, w25
	add	x21, x21, 24
	cmp	x20, 4
	bne	.L19
	mov	x19, 1
	add	x20, sp, 400
.L20:
	add	x0, x20, x19, lsl 3
	mov	x1, 0
	ldr	x0, [x0, -8]
	bl	pthread_join
	add	x19, x19, 1
	cmp	x19, 5
	bne	.L20
	and	w3, w26, -4
	cmp	w3, w26
	bcs	.L17
	uxtw	x3, w3
	add	x22, x22, 44
	ldr	x0, [sp, 104]
	add	x7, x0, 44
	mov	w6, 7
	mov	w5, 10
.L22:
	ldrsh	w1, [x22, x3, lsl 1]
	lsr	w0, w1, 16
	add	w2, w0, w1, uxth
	eor	w0, w0, w2
	and	w0, w0, 65535
	add	w0, w0, 132
	and	w4, w0, 65535
	sbfx	x2, x0, 15, 1
	eor	w4, w4, 32767
	and	w2, w2, w4
	eor	w0, w0, w2
	and	w0, w0, 65535
	clz	w2, w0
	sub	w2, w2, #17
	sub	w4, w6, w2, uxtb
	ubfiz	w4, w4, 4, 4
	ubfx	x1, x1, 8, 8
	and	w1, w1, 128
	orr	w1, w1, w4
	sub	w2, w5, w2, uxtb
	asr	w0, w0, w2
	and	w0, w0, 15
	orr	w0, w1, w0
	mvn	w0, w0
	strb	w0, [x7, x3]
	add	x3, x3, 1
	cmp	w26, w3
	bhi	.L22
.L17:
	ldr	x0, [sp, 104]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
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
.L27:
	.cfi_restore_state
	mov	w0, 1
	bl	exit
	.cfi_endproc
.LFE4004:
	.size	compress_wav, .-compress_wav
	.align	2
	.global	decompress_wav
	.type	decompress_wav, %function
decompress_wav:
.LFB4005:
	.cfi_startproc
	stp	x29, x30, [sp, -448]!
	.cfi_def_cfa_offset 448
	.cfi_offset 29, -448
	.cfi_offset 30, -440
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	.cfi_offset 19, -432
	.cfi_offset 20, -424
	.cfi_offset 21, -416
	.cfi_offset 22, -408
	.cfi_offset 23, -400
	.cfi_offset 24, -392
	.cfi_offset 25, -384
	.cfi_offset 26, -376
	.cfi_offset 27, -368
	.cfi_offset 28, -360
	mov	x22, x0
	ldrh	w0, [x0, 32]
	ldr	w3, [x22, 40]
	mov	w4, 1
	udiv	w3, w3, w0
	mov	w2, 16
	ldr	w1, [x22, 24]
	ldrh	w0, [x22, 22]
	bl	new_wav
	str	x0, [sp, 112]
	cbz	x0, .L38
	add	x28, x22, 44
	ldr	x0, [sp, 112]
	add	x27, x0, 44
	ldr	w0, [x22, 40]
	str	w0, [sp, 124]
	lsr	w25, w0, 2
	add	x21, sp, 320
	mov	w24, 0
	mov	x20, 0
	add	x23, sp, 128
	add	x19, sp, 192
	mov	x26, 1
	adrp	x0, decompress_wav_thread
	add	x0, x0, :lo12:decompress_wav_thread
	str	x0, [sp, 104]
.L30:
	uxtw	x0, w24
	add	x1, x28, x0
	add	x0, x27, x0, lsl 1
	stp	x1, x0, [x21]
	str	w25, [x21, 16]
	mov	x0, x23
	bl	pthread_attr_init
	movi	v31.4s, 0
	stp	q31, q31, [x19]
	stp	q31, q31, [x19, 32]
	stp	q31, q31, [x19, 64]
	stp	q31, q31, [x19, 96]
	lsl	x0, x26, x20
	str	x0, [sp, 192]
	mov	x2, x19
	mov	x1, 128
	mov	x0, x23
	bl	pthread_attr_setaffinity_np
	mov	x3, x21
	ldr	x2, [sp, 104]
	mov	x1, x23
	add	x0, sp, 416
	add	x0, x0, x20, lsl 3
	bl	pthread_create
	mov	x0, x23
	bl	pthread_attr_destroy
	add	x20, x20, 1
	add	w24, w24, w25
	add	x21, x21, 24
	cmp	x20, 4
	bne	.L30
	mov	x19, 1
	add	x20, sp, 416
.L31:
	add	x0, x20, x19, lsl 3
	mov	x1, 0
	ldr	x0, [x0, -8]
	bl	pthread_join
	add	x19, x19, 1
	cmp	x19, 5
	bne	.L31
	ldr	w1, [sp, 124]
	and	w0, w1, -4
	cmp	w0, w1
	bcs	.L28
	sub	w4, w1, #1
	sub	w4, w4, w0
	uxtw	x0, w0
	ldr	x1, [sp, 112]
	add	x5, x1, x0, lsl 1
	add	x5, x5, 44
	mov	x2, 0
	add	x0, x0, 44
	add	x22, x22, x0
.L33:
	ldrb	w1, [x22, x2]
	mvn	w1, w1
	and	w0, w1, 15
	orr	w0, w0, 16
	ubfx	x3, x1, 4, 3
	add	w3, w3, 3
	lsl	w0, w0, w3
	and	w0, w0, 65535
	sbfiz	w1, w1, 8, 8
	sub	w0, w0, #132
	eor	w0, w0, w1, lsr 16
	sub	w1, w0, w1, lsr 16
	strh	w1, [x5, x2, lsl 1]
	cmp	x2, x4
	add	x2, x2, 1
	bne	.L33
.L28:
	ldr	x0, [sp, 112]
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
.L38:
	.cfi_restore_state
	mov	w0, 1
	bl	exit
	.cfi_endproc
.LFE4005:
	.size	decompress_wav, .-decompress_wav
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
