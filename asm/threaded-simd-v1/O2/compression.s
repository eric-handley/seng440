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
	ldp	x7, x6, [x0]
	cmp	w5, 7
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
	uxtw	x3, w0
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
	str	d22, [x7, w2, uxtw]
	cmp	w5, w0
	bcs	.L3
.L2:
	cmp	w5, w3
	bls	.L4
	mov	w9, 7
	mov	w8, 10
	.p2align 5,,15
.L5:
	ldrsh	w1, [x6, x3, lsl 1]
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
	sub	w1, w9, w2, uxtb
	sub	w2, w8, w2, uxtb
	orr	w1, w4, w1, lsl 4
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
	.p2align 2,,3
.L6:
	mov	x3, 0
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
	bls	.L15
	movi	v30.8b, 0x3
	movi	v29.8b, 0x70
	movi	v28.8b, 0xf
	movi	v27.8b, 0x10
	mvni	v26.8h, 0x83
	mov	w0, 8
	.p2align 5,,15
.L12:
	sub	w3, w0, #8
	mov	v22.8b, v30.8b
	sub	w1, w0, #8
	uxtw	x2, w0
	add	w0, w0, 8
	ldr	d25, [x6, w3, uxtw]
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
	bcs	.L12
	cmp	w4, w2
	bls	.L19
	.p2align 5,,15
.L14:
	ldrb	w1, [x6, x2]
	mvn	w1, w1
	and	w0, w1, 15
	ubfx	x3, x1, 4, 3
	orr	w0, w0, 16
	add	w3, w3, 3
	sbfx	x1, x1, 7, 1
	and	w1, w1, 65535
	lsl	w0, w0, w3
	and	w0, w0, 65535
	sub	w0, w0, #132
	eor	w0, w1, w0
	sub	w0, w0, w1
	strh	w0, [x5, x2, lsl 1]
	add	x2, x2, 1
.L18:
	cmp	w4, w2
	bhi	.L14
.L19:
	mov	x0, 0
	ret
	.p2align 2,,3
.L15:
	mov	x2, 0
	b	.L18
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
	.cfi_offset 19, -432
	.cfi_offset 20, -424
	.cfi_offset 21, -416
	.cfi_offset 22, -408
	mov	x21, x0
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	.cfi_offset 23, -400
	.cfi_offset 24, -392
	.cfi_offset 25, -384
	.cfi_offset 26, -376
	.cfi_offset 27, -368
	.cfi_offset 28, -360
	ldrh	w3, [x0, 32]
	ldr	w5, [x0, 40]
	ldr	w1, [x21, 24]
	ldrh	w0, [x0, 22]
	udiv	w3, w5, w3
	bl	new_wav
	str	x0, [sp, 120]
	cbz	x0, .L32
	ldr	w6, [x21, 40]
	adrp	x0, compress_wav_thread
	add	x0, x0, :lo12:compress_wav_thread
	str	x0, [sp, 104]
	ldr	x0, [sp, 120]
	add	x20, sp, 224
	add	x24, sp, 160
	add	x23, sp, 328
	add	x25, sp, 128
	add	x21, x21, 44
	lsr	w19, w6, 1
	lsr	w28, w6, 3
	add	x22, x0, 44
	mov	w26, 0
	add	x0, sp, 320
	mov	x27, 0
	str	x0, [sp, 112]
.L22:
	uxtw	x1, w26
	str	w28, [x20, 16]
	add	x2, x22, x1
	mov	x0, x24
	add	x1, x21, x1, lsl 1
	stp	x2, x1, [x20]
	add	w26, w26, w28
	bl	pthread_attr_init
	str	xzr, [x23, 112]
	ldr	x2, [sp, 112]
	mov	x0, 1
	movi	v31.4s, 0
	lsl	x7, x0, x27
	str	x7, [sp, 320]
	mov	x1, 128
	mov	x0, x24
	stp	q31, q31, [x23]
	stp	q31, q31, [x23, 32]
	stp	q31, q31, [x23, 64]
	str	q31, [x23, 96]
	bl	pthread_attr_setaffinity_np
	mov	x3, x20
	ldr	x2, [sp, 104]
	mov	x1, x24
	add	x0, x25, w27, uxtw 3
	add	x20, x20, 24
	add	x27, x27, 1
	bl	pthread_create
	mov	x0, x24
	bl	pthread_attr_destroy
	cmp	x27, 4
	bne	.L22
	mov	x23, 1
.L23:
	add	x0, x25, x23, lsl 3
	mov	x1, 0
	add	x23, x23, 1
	ldr	x0, [x0, -8]
	bl	pthread_join
	cmp	x23, 5
	bne	.L23
	and	w0, w19, -4
	and	x3, x19, 2147483644
	mov	w6, 7
	mov	w5, 10
	cmp	w0, w19
	bcs	.L20
	.p2align 5,,15
.L25:
	ldrsh	w0, [x21, x3, lsl 1]
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
	strb	w0, [x22, x3]
	add	x3, x3, 1
	cmp	w19, w3
	bhi	.L25
.L20:
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
.L32:
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
	str	x0, [sp, 112]
	cbz	x0, .L44
	ldr	w0, [x20, 40]
	adrp	x24, decompress_wav_thread
	str	w0, [sp, 124]
	add	x1, x24, :lo12:decompress_wav_thread
	add	x28, x20, 44
	add	x24, sp, 224
	lsr	w19, w0, 2
	add	x21, sp, 160
	ldr	x0, [sp, 112]
	add	x26, sp, 328
	add	x23, sp, 128
	mov	w25, 0
	add	x27, x0, 44
	mov	x22, 0
	add	x0, sp, 320
	stp	x1, x0, [sp, 96]
.L35:
	uxtw	x1, w25
	add	x2, x28, x1
	str	w19, [x24, 16]
	add	x1, x27, x1, lsl 1
	stp	x2, x1, [x24]
	mov	x0, x21
	add	w25, w25, w19
	bl	pthread_attr_init
	str	xzr, [x26, 112]
	ldr	x2, [sp, 104]
	mov	x0, 1
	movi	v31.4s, 0
	lsl	x8, x0, x22
	str	x8, [sp, 320]
	mov	x1, 128
	mov	x0, x21
	stp	q31, q31, [x26]
	stp	q31, q31, [x26, 32]
	stp	q31, q31, [x26, 64]
	str	q31, [x26, 96]
	bl	pthread_attr_setaffinity_np
	mov	x3, x24
	ldr	x2, [sp, 96]
	mov	x1, x21
	add	x0, x23, w22, uxtw 3
	add	x24, x24, 24
	add	x22, x22, 1
	bl	pthread_create
	mov	x0, x21
	bl	pthread_attr_destroy
	cmp	x22, 4
	bne	.L35
	mov	x21, 1
.L36:
	add	x0, x23, x21, lsl 3
	mov	x1, 0
	add	x21, x21, 1
	ldr	x0, [x0, -8]
	bl	pthread_join
	cmp	x21, 5
	bne	.L36
	ldr	w3, [sp, 124]
	and	w1, w3, -4
	cmp	w1, w3
	bcs	.L33
	uxtw	x2, w1
	sub	w22, w3, #1
	mov	x0, 44
	sub	w22, w22, w1
	add	x2, x2, x0
	add	x0, x0, w1, uxtw 1
	ldr	x1, [sp, 112]
	add	x20, x20, x2
	mov	x3, 0
	add	x0, x1, x0
	.p2align 5,,15
.L38:
	ldrb	w2, [x20, x3]
	cmp	x22, x3
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
	strh	w1, [x0, x3, lsl 1]
	add	x3, x3, 1
	bne	.L38
.L33:
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
.L44:
	.cfi_restore_state
	mov	w0, 1
	bl	exit
	.cfi_endproc
.LFE4005:
	.size	decompress_wav, .-decompress_wav
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
