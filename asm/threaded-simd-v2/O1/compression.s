	.arch armv8-a
	.file	"compression.c"
	.text
	.align	2
	.global	compress_wav_thread
	.type	compress_wav_thread, %function
compress_wav_thread:
.LFB4002:
	.cfi_startproc
	ldp	x4, x2, [x0]
	ldr	w3, [x0, 16]
	cmp	w3, 15
	bls	.L2
	mov	w0, 0
	movi	v22.8h, 0x84
	mvni	v23.8h, 0x80, lsl 8
	movi	v24.8h, 0xb
	movi	v25.8b, 0xffffffffffffff80
	movi	v26.8b, 0xf
	movi	v27.8b, 0x8
.L3:
	ubfiz	x1, x0, 1, 32
	ldr	q31, [x2, x1]
	abs	v30.8h, v31.8h
	shrn	v31.8b, v31.8h, 8
	add	v30.8h, v30.8h, v22.8h
	umin	v30.8h, v30.8h, v23.8h
	clz	v29.8h, v30.8h
	xtn	v20.8b, v29.8h
	sub	v29.8h, v29.8h, v24.8h
	ushl	v28.8h, v30.8h, v29.8h
	xtn	v28.8b, v28.8h
	add	w1, w0, 8
	lsl	x1, x1, 1
	ldr	q30, [x2, x1]
	abs	v29.8h, v30.8h
	shrn	v30.8b, v30.8h, 8
	add	v29.8h, v29.8h, v22.8h
	umin	v29.8h, v29.8h, v23.8h
	clz	v19.8h, v29.8h
	xtn	v21.8b, v19.8h
	sub	v19.8h, v19.8h, v24.8h
	ushl	v29.8h, v29.8h, v19.8h
	xtn	v29.8b, v29.8h
	and	v31.8b, v31.8b, v25.8b
	and	v28.8b, v28.8b, v26.8b
	orr	v31.8b, v31.8b, v28.8b
	sub	v28.8b, v27.8b, v20.8b
	shl	v28.8b, v28.8b, 4
	orr	v31.8b, v31.8b, v28.8b
	not	v31.8b, v31.8b
	and	v30.8b, v30.8b, v25.8b
	and	v29.8b, v29.8b, v26.8b
	orr	v30.8b, v30.8b, v29.8b
	sub	v29.8b, v27.8b, v21.8b
	shl	v29.8b, v29.8b, 4
	orr	v30.8b, v30.8b, v29.8b
	not	v30.8b, v30.8b
	ins	v31.d[1], v30.d[0]
	str	q31, [x4, w0, uxtw]
	add	w1, w0, 32
	add	w0, w0, 16
	cmp	w3, w1
	bcs	.L3
.L2:
	mov	x0, 0
	ret
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
	ldp	x4, x3, [x0]
	ldr	w2, [x0, 16]
	cmp	w2, 7
	bls	.L6
	mov	w1, 0
	movi	v22.8b, 0x3
	movi	v23.8b, 0x70
	movi	v24.8b, 0xf
	movi	v25.8b, 0x10
	mvni	v26.8h, 0x83
.L7:
	ldr	d31, [x4, w1, uxtw]
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
	ubfiz	x0, x1, 1, 32
	str	q31, [x3, x0]
	add	w0, w1, 16
	add	w1, w1, 8
	cmp	w2, w0
	bcs	.L7
.L6:
	mov	x0, 0
	ret
	.cfi_endproc
.LFE4003:
	.size	decompress_wav_thread, .-decompress_wav_thread
	.align	2
	.global	compress_wav
	.type	compress_wav, %function
compress_wav:
.LFB4004:
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
	mov	x25, x0
	ldrh	w0, [x0, 32]
	ldr	w3, [x25, 40]
	mov	w4, 7
	udiv	w3, w3, w0
	mov	w2, 8
	ldr	w1, [x25, 24]
	ldrh	w0, [x25, 22]
	bl	new_wav
	str	x0, [sp, 112]
	cbz	x0, .L19
	add	x28, x25, 44
	ldr	x0, [sp, 112]
	add	x27, x0, 44
	ldr	w0, [x25, 40]
	lsr	w1, w0, 1
	str	w1, [sp, 124]
	lsr	w26, w0, 7
	ubfx	x0, x0, 5, 2
	str	x0, [sp, 96]
	add	x22, sp, 320
	add	x24, sp, 416
	mov	w21, 0
	mov	w19, 0
	add	x23, sp, 128
	add	x20, sp, 192
	adrp	x0, compress_wav_thread
	add	x0, x0, :lo12:compress_wav_thread
	str	x0, [sp, 104]
.L11:
	ldr	w0, [sp, 96]
	cmp	w0, w21
	cinc	w0, w26, hi
	lsl	w0, w0, 4
	uxtw	x1, w19
	add	x2, x27, x1
	add	x1, x28, x1, lsl 1
	stp	x2, x1, [x22]
	str	w0, [x22, 16]
	add	w19, w19, w0
	mov	x0, x23
	bl	pthread_attr_init
	movi	v31.4s, 0
	stp	q31, q31, [x20]
	stp	q31, q31, [x20, 32]
	stp	q31, q31, [x20, 64]
	stp	q31, q31, [x20, 96]
	mov	x0, 1
	lsl	x0, x0, x21
	str	x0, [sp, 192]
	mov	x2, x20
	mov	x1, 128
	mov	x0, x23
	bl	pthread_attr_setaffinity_np
	mov	x3, x22
	ldr	x2, [sp, 104]
	mov	x1, x23
	mov	x0, x24
	bl	pthread_create
	mov	x0, x23
	bl	pthread_attr_destroy
	add	w21, w21, 1
	add	x22, x22, 24
	add	x24, x24, 8
	cmp	w21, 4
	bne	.L11
	mov	x20, 1
	add	x21, sp, 416
.L12:
	add	x0, x21, x20, lsl 3
	mov	x1, 0
	ldr	x0, [x0, -8]
	bl	pthread_join
	add	x20, x20, 1
	cmp	x20, 5
	bne	.L12
	ldr	w0, [sp, 124]
	cmp	w0, w19
	bls	.L9
	sub	w6, w0, #1
	sub	w6, w6, w19
	uxtw	x7, w19
	ubfiz	x5, x19, 1, 32
	add	x5, x5, 44
	add	x5, x25, x5
	mov	x3, 0
	add	x7, x7, 44
	ldr	x0, [sp, 112]
	add	x7, x0, x7
	mov	w9, 7
	mov	w8, 10
.L14:
	ldrsh	w1, [x5, x3, lsl 1]
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
	cmp	x3, x6
	add	x3, x3, 1
	bne	.L14
.L9:
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
.L19:
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
	mov	x23, x0
	ldrh	w0, [x0, 32]
	ldr	w3, [x23, 40]
	mov	w4, 1
	udiv	w3, w3, w0
	mov	w2, 16
	ldr	w1, [x23, 24]
	ldrh	w0, [x23, 22]
	bl	new_wav
	str	x0, [sp, 112]
	cbz	x0, .L30
	add	x28, x23, 44
	ldr	x0, [sp, 112]
	add	x27, x0, 44
	ldr	w0, [x23, 40]
	str	w0, [sp, 124]
	lsr	w26, w0, 5
	ubfx	x0, x0, 3, 2
	str	x0, [sp, 96]
	add	x22, sp, 320
	add	x25, sp, 416
	mov	w21, 0
	mov	w19, 0
	add	x24, sp, 128
	add	x20, sp, 192
	adrp	x0, decompress_wav_thread
	add	x0, x0, :lo12:decompress_wav_thread
	str	x0, [sp, 104]
.L22:
	ldr	w0, [sp, 96]
	cmp	w0, w21
	cinc	w0, w26, hi
	lsl	w0, w0, 3
	uxtw	x1, w19
	add	x2, x28, x1
	add	x1, x27, x1, lsl 1
	stp	x2, x1, [x22]
	str	w0, [x22, 16]
	add	w19, w19, w0
	mov	x0, x24
	bl	pthread_attr_init
	movi	v31.4s, 0
	stp	q31, q31, [x20]
	stp	q31, q31, [x20, 32]
	stp	q31, q31, [x20, 64]
	stp	q31, q31, [x20, 96]
	mov	x0, 1
	lsl	x0, x0, x21
	str	x0, [sp, 192]
	mov	x2, x20
	mov	x1, 128
	mov	x0, x24
	bl	pthread_attr_setaffinity_np
	mov	x3, x22
	ldr	x2, [sp, 104]
	mov	x1, x24
	mov	x0, x25
	bl	pthread_create
	mov	x0, x24
	bl	pthread_attr_destroy
	add	w21, w21, 1
	add	x22, x22, 24
	add	x25, x25, 8
	cmp	w21, 4
	bne	.L22
	mov	x20, 1
	add	x21, sp, 416
.L23:
	add	x0, x21, x20, lsl 3
	mov	x1, 0
	ldr	x0, [x0, -8]
	bl	pthread_join
	add	x20, x20, 1
	cmp	x20, 5
	bne	.L23
	ldr	w0, [sp, 124]
	cmp	w0, w19
	bls	.L20
	sub	w5, w0, #1
	sub	w5, w5, w19
	uxtw	x0, w19
	ubfiz	x4, x19, 1, 32
	add	x4, x4, 44
	ldr	x1, [sp, 112]
	add	x4, x1, x4
	mov	x2, 0
	add	x0, x0, 44
	add	x23, x23, x0
.L25:
	ldrb	w1, [x23, x2]
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
	strh	w1, [x4, x2, lsl 1]
	cmp	x2, x5
	add	x2, x2, 1
	bne	.L25
.L20:
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
.L30:
	.cfi_restore_state
	mov	w0, 1
	bl	exit
	.cfi_endproc
.LFE4005:
	.size	decompress_wav, .-decompress_wav
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
