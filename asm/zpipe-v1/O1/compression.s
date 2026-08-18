	.arch armv8-a
	.file	"compression.c"
	.text
	.align	2
	.global	compress_sample
	.type	compress_sample, %function
compress_sample:
.LFB80:
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
.LFE80:
	.size	compress_sample, .-compress_sample
	.align	2
	.global	decompress_sample
	.type	decompress_sample, %function
decompress_sample:
.LFB81:
	.cfi_startproc
	mvn	w0, w0
	and	w1, w0, 15
	orr	w1, w1, 16
	ubfx	x2, x0, 4, 3
	add	w2, w2, 3
	lsl	w1, w1, w2
	and	w1, w1, 65535
	sbfiz	w2, w0, 8, 8
	sub	w1, w1, #132
	eor	w1, w1, w2, asr 15
	ubfx	x0, x0, 7, 1
	add	w0, w1, w0
	ret
	.cfi_endproc
.LFE81:
	.size	decompress_sample, .-decompress_sample
	.align	2
	.global	compress_wav
	.type	compress_wav, %function
compress_wav:
.LFB82:
	.cfi_startproc
	stp	x29, x30, [sp, -112]!
	.cfi_def_cfa_offset 112
	.cfi_offset 29, -112
	.cfi_offset 30, -104
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	.cfi_offset 19, -96
	.cfi_offset 20, -88
	.cfi_offset 25, -48
	.cfi_offset 26, -40
	.cfi_offset 27, -32
	.cfi_offset 28, -24
	mov	x26, x0
	ldr	w20, [x0, 40]
	ldrh	w27, [x0, 32]
	udiv	w28, w20, w27
	mov	w4, 7
	mov	w3, w28
	mov	w2, 8
	ldr	w1, [x0, 24]
	ldrh	w0, [x0, 22]
	bl	new_wav
	cbz	x0, .L9
	mov	x25, x0
	ldrh	w0, [x0, 32]
	str	w0, [sp, 108]
	add	x19, x26, 44
	ldrb	w0, [x26, 45]
	ubfiz	w0, w0, 8, 8
	ldrb	w1, [x26, 44]
	orr	w0, w0, w1
	sxth	w0, w0
	ldrb	w1, [x26, 47]
	ubfiz	w1, w1, 8, 8
	ldrb	w2, [x26, 46]
	orr	w1, w1, w2
	sxth	w1, w1
	str	w1, [sp, 100]
	cmp	w20, w27
	bcc	.L3
	stp	x21, x22, [sp, 32]
	.cfi_offset 22, -72
	.cfi_offset 21, -80
	stp	x23, x24, [sp, 48]
	.cfi_offset 24, -56
	.cfi_offset 23, -64
	mov	w24, w27
	mov	w23, 0
	mov	w22, 0
.L6:
	uxtw	x20, w23
	add	x21, x20, 44
	add	x21, x25, x21
	bl	compress_sample
	strb	w0, [sp, 107]
	ldrh	w0, [sp, 100]
	bl	compress_sample
	add	x20, x25, x20
	ldrb	w1, [sp, 107]
	strb	w1, [x20, 44]
	strb	w0, [x21, 1]
	ldrb	w0, [x19, 3]
	ubfiz	w0, w0, 8, 8
	ldrb	w1, [x19, 2]
	orr	w0, w0, w1
	sxth	w0, w0
	ldrb	w1, [x19, 5]
	ubfiz	w1, w1, 8, 8
	ldrb	w2, [x19, 4]
	orr	w1, w1, w2
	sxth	w1, w1
	str	w1, [sp, 100]
	add	w22, w22, 1
	uxtw	x19, w24
	add	x19, x19, 44
	add	x19, x26, x19
	ldr	w1, [sp, 108]
	add	w23, w23, w1
	add	w24, w24, w27
	cmp	w22, w28
	bcc	.L6
	ldp	x21, x22, [sp, 32]
	.cfi_restore 22
	.cfi_restore 21
	ldp	x23, x24, [sp, 48]
	.cfi_restore 24
	.cfi_restore 23
.L3:
	mov	x0, x25
	ldp	x19, x20, [sp, 16]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
.L9:
	.cfi_restore_state
	stp	x21, x22, [sp, 32]
	.cfi_offset 22, -72
	.cfi_offset 21, -80
	stp	x23, x24, [sp, 48]
	.cfi_offset 24, -56
	.cfi_offset 23, -64
	mov	w0, 1
	bl	exit
	.cfi_endproc
.LFE82:
	.size	compress_wav, .-compress_wav
	.align	2
	.global	decompress_wav
	.type	decompress_wav, %function
decompress_wav:
.LFB83:
	.cfi_startproc
	stp	x29, x30, [sp, -96]!
	.cfi_def_cfa_offset 96
	.cfi_offset 29, -96
	.cfi_offset 30, -88
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	.cfi_offset 19, -80
	.cfi_offset 20, -72
	.cfi_offset 21, -64
	.cfi_offset 22, -56
	.cfi_offset 23, -48
	.cfi_offset 24, -40
	.cfi_offset 25, -32
	.cfi_offset 26, -24
	.cfi_offset 27, -16
	.cfi_offset 28, -8
	mov	x23, x0
	ldr	w19, [x0, 40]
	ldrh	w24, [x0, 32]
	udiv	w25, w19, w24
	mov	w4, 1
	mov	w3, w25
	mov	w2, 16
	ldr	w1, [x0, 24]
	ldrh	w0, [x0, 22]
	bl	new_wav
	cbz	x0, .L16
	mov	x22, x0
	ldrh	w26, [x0, 32]
	ldrb	w0, [x23, 44]
	ldrb	w28, [x23, 45]
	cmp	w19, w24
	bcc	.L10
	mov	w21, w24
	mov	w20, 0
	mov	w19, 0
.L13:
	bl	decompress_sample
	sxth	w27, w0
	mov	w0, w28
	bl	decompress_sample
	sxth	w1, w0
	uxtw	x2, w20
	add	x0, x2, 44
	add	x0, x22, x0
	add	w19, w19, 1
	add	x2, x22, x2
	strb	w27, [x2, 44]
	asr	w27, w27, 8
	strb	w27, [x0, 1]
	strb	w1, [x0, 2]
	asr	w1, w1, 8
	strb	w1, [x0, 3]
	add	x1, x23, w21, uxtw
	ldrb	w0, [x1, 44]
	ldrb	w28, [x1, 45]
	add	w20, w20, w26
	add	w21, w21, w24
	cmp	w19, w25
	bcc	.L13
.L10:
	mov	x0, x22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
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
.L16:
	.cfi_restore_state
	mov	w0, 1
	bl	exit
	.cfi_endproc
.LFE83:
	.size	decompress_wav, .-decompress_wav
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
