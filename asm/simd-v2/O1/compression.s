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
	not	v0.8b, v0.8b
	ushr	v30.8b, v0.8b, 4
	movi	v31.8b, 0x7
	and	v30.8b, v30.8b, v31.8b
	movi	v31.8b, 0x3
	add	v30.8b, v30.8b, v31.8b
	sxtl	v30.8h, v30.8b
	movi	v31.8b, 0xf
	and	v31.8b, v0.8b, v31.8b
	movi	v29.8b, 0x10
	orr	v31.8b, v31.8b, v29.8b
	uxtl	v31.8h, v31.8b
	ushl	v31.8h, v31.8h, v30.8h
	sxtl	v0.8h, v0.8b
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
	stp	x29, x30, [sp, -80]!
	.cfi_def_cfa_offset 80
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	.cfi_offset 19, -64
	.cfi_offset 20, -56
	.cfi_offset 21, -48
	.cfi_offset 22, -40
	.cfi_offset 23, -32
	.cfi_offset 24, -24
	.cfi_offset 25, -16
	mov	x23, x0
	ldrh	w0, [x0, 32]
	ldr	w3, [x23, 40]
	mov	w4, 7
	udiv	w3, w3, w0
	mov	w2, 8
	ldr	w1, [x23, 24]
	ldrh	w0, [x23, 22]
	bl	new_wav
	cbz	x0, .L15
	mov	x25, x0
	ldr	w0, [x23, 40]
	lsr	w24, w0, 1
	cmp	w0, 15
	bls	.L11
	add	x22, x23, 44
	add	x21, x25, 44
	mov	w20, 8
.L8:
	ldr	q0, [x22], 16
	bl	vector_compress_samples
	str	d0, [x21], 8
	mov	w19, w20
	add	w20, w20, 8
	cmp	w24, w20
	bcs	.L8
.L7:
	cmp	w24, w19
	bls	.L5
	uxtw	x19, w19
	add	x23, x23, 44
	add	x21, x25, 44
.L10:
	ldrh	w0, [x23, x19, lsl 1]
	bl	compress_sample
	strb	w0, [x21, x19]
	add	x19, x19, 1
	cmp	w24, w19
	bhi	.L10
.L5:
	mov	x0, x25
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 25
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
.L15:
	.cfi_restore_state
	mov	w0, 1
	bl	exit
.L11:
	mov	w19, 0
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
	stp	x29, x30, [sp, -80]!
	.cfi_def_cfa_offset 80
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	.cfi_offset 19, -64
	.cfi_offset 20, -56
	.cfi_offset 21, -48
	.cfi_offset 22, -40
	.cfi_offset 23, -32
	.cfi_offset 24, -24
	.cfi_offset 25, -16
	mov	x22, x0
	ldrh	w0, [x0, 32]
	ldr	w3, [x22, 40]
	mov	w4, 1
	udiv	w3, w3, w0
	mov	w2, 16
	ldr	w1, [x22, 24]
	ldrh	w0, [x22, 22]
	bl	new_wav
	cbz	x0, .L26
	mov	x23, x0
	add	x24, x22, 44
	add	x25, x0, 44
	ldr	w21, [x22, 40]
	cmp	w21, 7
	bls	.L22
	mov	w19, 8
.L19:
	sub	w1, w19, #8
	sub	w20, w19, #8
	ldr	d0, [x24, w1, uxtw]
	bl	vector_decompress_samples
	lsl	x20, x20, 1
	str	q0, [x25, x20]
	mov	w1, w19
	add	w19, w19, 8
	cmp	w21, w19
	bcs	.L19
.L18:
	cmp	w21, w1
	bls	.L16
	uxtw	x19, w1
	add	x20, x22, 44
	add	x22, x23, 44
.L21:
	ldrb	w0, [x20, x19]
	bl	decompress_sample
	strh	w0, [x22, x19, lsl 1]
	add	x19, x19, 1
	cmp	w21, w19
	bhi	.L21
.L16:
	mov	x0, x23
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 25
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
.L26:
	.cfi_restore_state
	mov	w0, 1
	bl	exit
.L22:
	mov	w1, 0
	b	.L18
	.cfi_endproc
.LFE4001:
	.size	decompress_wav, .-decompress_wav
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
