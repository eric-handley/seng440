	.arch armv8-a
	.file	"compression.c"
	.text
	.align	2
	.p2align 5,,15
	.global	compress_sample
	.type	compress_sample, %function
compress_sample:
.LFB80:
	.cfi_startproc
	sbfx	w3, w0, 15, 1
	and	w0, w0, 65535
	mov	w4, 10
	mov	w2, 7
	add	w1, w0, w3, uxth
	lsr	w0, w0, 8
	eor	w1, w1, w3
	and	w0, w0, 128
	and	w1, w1, 65535
	add	w1, w1, 132
	and	w5, w1, 65535
	eor	w5, w5, 32767
	sbfx	x3, x1, 15, 1
	and	w3, w3, w5
	eor	w1, w1, w3
	and	w1, w1, 65535
	clz	w3, w1
	sub	w3, w3, #17
	sub	w2, w2, w3, uxtb
	sub	w3, w4, w3, uxtb
	orr	w0, w0, w2, lsl 4
	asr	w1, w1, w3
	and	w1, w1, 15
	orr	w0, w0, w1
	ret
	.cfi_endproc
.LFE80:
	.size	compress_sample, .-compress_sample
	.align	2
	.p2align 5,,15
	.global	decompress_sample
	.type	decompress_sample, %function
decompress_sample:
.LFB81:
	.cfi_startproc
	and	w1, w0, 15
	ubfx	w3, w0, 4, 3
	add	w3, w3, 3
	orr	w1, w1, 16
	sbfiz	w2, w0, 8, 8
	ubfx	w0, w0, 7, 1
	lsl	w1, w1, w3
	and	w1, w1, 65535
	sub	w1, w1, #132
	eor	w2, w1, w2, asr 31
	add	w0, w2, w0
	ret
	.cfi_endproc
.LFE81:
	.size	decompress_sample, .-decompress_sample
	.align	2
	.p2align 5,,15
	.global	compress_wav
	.type	compress_wav, %function
compress_wav:
.LFB82:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	w2, 8
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	.cfi_offset 19, -32
	.cfi_offset 20, -24
	.cfi_offset 21, -16
	.cfi_offset 22, -8
	mov	x21, x0
	ldrh	w19, [x0, 32]
	ldr	w22, [x0, 40]
	ldr	w1, [x21, 24]
	ldrh	w0, [x0, 22]
	udiv	w20, w22, w19
	mov	w3, w20
	bl	new_wav
	cbz	x0, .L12
	ldrh	w11, [x0, 32]
	mov	x10, x0
	mov	w9, 0
	mov	w8, 0
	mov	w7, 0
	cmp	w22, w19
	bcc	.L4
	.p2align 5,,15
.L7:
	uxtw	x1, w8
	add	w7, w7, 1
	mov	x6, x1
	add	x1, x21, x1
	add	x6, x21, x6
	add	w8, w8, w19
	ldrb	w0, [x1, 44]
	ldrb	w1, [x6, 45]
	ubfiz	w1, w1, 8, 8
	orr	w0, w1, w0
	bl	compress_sample
	mov	w1, w0
	ldrh	w0, [x6, 46]
	mov	w6, w1
	bl	compress_sample
	add	x1, x10, w9, uxtw
	add	w9, w9, w11
	strb	w6, [x1, 44]
	strb	w0, [x1, 45]
	cmp	w20, w7
	bhi	.L7
.L4:
	ldp	x19, x20, [sp, 16]
	mov	x0, x10
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
.L12:
	.cfi_restore_state
	mov	w0, 1
	bl	exit
	.cfi_endproc
.LFE82:
	.size	compress_wav, .-compress_wav
	.align	2
	.p2align 5,,15
	.global	decompress_wav
	.type	decompress_wav, %function
decompress_wav:
.LFB83:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	w2, 16
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -32
	.cfi_offset 20, -24
	mov	x19, x0
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -16
	.cfi_offset 22, -8
	ldrh	w20, [x0, 32]
	ldr	w22, [x0, 40]
	ldr	w1, [x19, 24]
	ldrh	w0, [x0, 22]
	udiv	w21, w22, w20
	mov	w3, w21
	bl	new_wav
	cbz	x0, .L21
	ldrh	w10, [x0, 32]
	mov	w9, 0
	mov	w8, 0
	mov	w7, 0
	cmp	w22, w20
	bcc	.L13
	.p2align 5,,15
.L16:
	add	x2, x19, w8, uxtw
	uxtw	x5, w9
	add	x11, x0, x5
	add	x5, x0, x5
	add	w7, w7, 1
	add	w8, w8, w20
	ldrb	w1, [x2, 44]
	add	w9, w9, w10
	ldrb	w6, [x2, 45]
	and	w4, w1, 15
	ubfx	x13, x1, 4, 3
	orr	w4, w4, 16
	add	w13, w13, 3
	and	w2, w6, 15
	ubfx	x3, x6, 4, 3
	sbfx	x12, x1, 7, 1
	lsl	w4, w4, w13
	and	w4, w4, 65535
	sub	w4, w4, #132
	orr	w2, w2, 16
	add	w3, w3, 3
	eor	w4, w12, w4
	add	w1, w4, w1, lsr 7
	sbfx	x4, x6, 7, 1
	lsl	w2, w2, w3
	and	w2, w2, 65535
	and	w1, w1, 65535
	sub	w2, w2, #132
	eor	w2, w4, w2
	strb	w1, [x11, 44]
	add	w6, w2, w6, lsr 7
	sbfx	x1, x1, 8, 8
	strb	w1, [x5, 45]
	strh	w6, [x5, 46]
	cmp	w21, w7
	bhi	.L16
.L13:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
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
.LFE83:
	.size	decompress_wav, .-decompress_wav
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
