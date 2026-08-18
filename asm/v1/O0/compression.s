	.arch armv8-a
	.file	"compression.c"
	.text
	.align	2
	.global	compress_sample
	.type	compress_sample, %function
compress_sample:
.LFB64:
	.cfi_startproc
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	strh	w0, [sp, 14]
	ldrsh	w0, [sp, 14]
	asr	w0, w0, 15
	strh	w0, [sp, 46]
	ldrh	w1, [sp, 14]
	ldrh	w0, [sp, 46]
	add	w0, w1, w0
	and	w0, w0, 65535
	sxth	w1, w0
	ldrh	w0, [sp, 46]
	eor	w0, w1, w0
	sxth	w0, w0
	strh	w0, [sp, 44]
	ldrh	w0, [sp, 14]
	and	w0, w0, -32768
	strh	w0, [sp, 42]
	ldrh	w0, [sp, 44]
	add	w0, w0, 132
	strh	w0, [sp, 44]
	ldrsh	w0, [sp, 44]
	asr	w0, w0, 15
	sxth	w0, w0
	strh	w0, [sp, 40]
	ldrsh	w0, [sp, 40]
	mvn	w0, w0
	sxth	w1, w0
	ldrsh	w0, [sp, 44]
	and	w0, w1, w0
	sxth	w1, w0
	ldrsh	w0, [sp, 40]
	and	w0, w0, 32767
	sxth	w0, w0
	orr	w0, w1, w0
	sxth	w0, w0
	strh	w0, [sp, 44]
	ldrh	w0, [sp, 44]
	strh	w0, [sp, 34]
	ldrh	w0, [sp, 34]
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	cmp	w0, 0
	beq	.L2
	ldr	w0, [sp, 28]
	clz	w0, w0
	b	.L7
.L2:
	mov	w0, 32
.L7:
	sub	w0, w0, #16
	and	w0, w0, 255
	sub	w0, w0, #1
	strb	w0, [sp, 39]
	ldrb	w0, [sp, 39]
	mov	w1, 7
	sub	w0, w1, w0
	strb	w0, [sp, 38]
	ldrb	w0, [sp, 38]
	ubfiz	w0, w0, 4, 4
	strb	w0, [sp, 37]
	ldrh	w0, [sp, 42]
	lsr	w0, w0, 8
	and	w0, w0, 65535
	and	w1, w0, 255
	ldrb	w0, [sp, 37]
	orr	w0, w1, w0
	and	w0, w0, 255
	sxtb	w1, w0
	ldrh	w2, [sp, 44]
	ldrb	w0, [sp, 39]
	mov	w3, 10
	sub	w0, w3, w0
	asr	w0, w2, w0
	sxtb	w0, w0
	and	w0, w0, 15
	sxtb	w0, w0
	orr	w0, w1, w0
	sxtb	w0, w0
	strb	w0, [sp, 36]
	ldrb	w0, [sp, 36]
	add	sp, sp, 48
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE64:
	.size	compress_sample, .-compress_sample
	.align	2
	.global	decompress_sample
	.type	decompress_sample, %function
decompress_sample:
.LFB65:
	.cfi_startproc
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	strb	w0, [sp, 15]
	ldrb	w0, [sp, 15]
	and	w0, w0, -128
	strb	w0, [sp, 31]
	ldrb	w1, [sp, 15]
	ldrb	w0, [sp, 31]
	eor	w0, w1, w0
	and	w0, w0, 255
	lsr	w0, w0, 4
	strb	w0, [sp, 30]
	ldrb	w0, [sp, 15]
	and	w0, w0, 15
	orr	w1, w0, 16
	ldrb	w0, [sp, 30]
	add	w0, w0, 3
	lsl	w0, w1, w0
	strh	w0, [sp, 28]
	ldrh	w0, [sp, 28]
	sub	w0, w0, #132
	strh	w0, [sp, 28]
	ldrb	w0, [sp, 15]
	sxth	w0, w0
	ubfiz	w0, w0, 8, 8
	sxth	w0, w0
	asr	w0, w0, 15
	strh	w0, [sp, 26]
	ldrsh	w1, [sp, 28]
	ldrh	w0, [sp, 26]
	eor	w0, w1, w0
	sxth	w0, w0
	and	w0, w0, 65535
	ldrb	w1, [sp, 31]
	lsr	w1, w1, 7
	and	w1, w1, 255
	add	w0, w0, w1
	and	w0, w0, 65535
	strh	w0, [sp, 24]
	ldrsh	w0, [sp, 24]
	add	sp, sp, 32
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE65:
	.size	decompress_sample, .-decompress_sample
	.align	2
	.global	compress_wav
	.type	compress_wav, %function
compress_wav:
.LFB66:
	.cfi_startproc
	stp	x29, x30, [sp, -96]!
	.cfi_def_cfa_offset 96
	.cfi_offset 29, -96
	.cfi_offset 30, -88
	mov	x29, sp
	str	x0, [sp, 24]
	ldr	x0, [sp, 24]
	ldrh	w0, [x0, 32]
	strh	w0, [sp, 90]
	ldr	x0, [sp, 24]
	ldr	w1, [x0, 40]
	ldrh	w0, [sp, 90]
	udiv	w0, w1, w0
	str	w0, [sp, 84]
	ldr	x0, [sp, 24]
	ldrh	w4, [x0, 22]
	ldr	x0, [sp, 24]
	ldr	w0, [x0, 24]
	ldr	w3, [sp, 84]
	mov	w2, 8
	mov	w1, w0
	mov	w0, w4
	bl	new_wav
	str	x0, [sp, 72]
	ldr	x0, [sp, 72]
	cmp	x0, 0
	bne	.L11
	mov	w0, 1
	bl	exit
.L11:
	ldr	x0, [sp, 72]
	ldrh	w0, [x0, 32]
	strh	w0, [sp, 70]
	str	wzr, [sp, 92]
	b	.L12
.L13:
	ldrh	w1, [sp, 90]
	ldr	w0, [sp, 92]
	mul	w0, w1, w0
	uxtw	x0, w0
	add	x0, x0, 32
	ldr	x1, [sp, 24]
	add	x0, x1, x0
	add	x0, x0, 12
	str	x0, [sp, 56]
	ldr	x0, [sp, 56]
	add	x0, x0, 1
	ldrb	w0, [x0]
	sxth	w0, w0
	ubfiz	w0, w0, 8, 8
	sxth	w1, w0
	ldr	x0, [sp, 56]
	ldrb	w0, [x0]
	sxth	w0, w0
	orr	w0, w1, w0
	strh	w0, [sp, 54]
	ldr	x0, [sp, 56]
	add	x0, x0, 3
	ldrb	w0, [x0]
	sxth	w0, w0
	ubfiz	w0, w0, 8, 8
	sxth	w1, w0
	ldr	x0, [sp, 56]
	add	x0, x0, 2
	ldrb	w0, [x0]
	sxth	w0, w0
	orr	w0, w1, w0
	strh	w0, [sp, 52]
	ldrh	w0, [sp, 54]
	bl	compress_sample
	strb	w0, [sp, 51]
	ldrh	w0, [sp, 52]
	bl	compress_sample
	strb	w0, [sp, 50]
	ldrh	w1, [sp, 70]
	ldr	w0, [sp, 92]
	mul	w0, w1, w0
	uxtw	x0, w0
	add	x0, x0, 32
	ldr	x1, [sp, 72]
	add	x0, x1, x0
	add	x0, x0, 12
	str	x0, [sp, 40]
	ldr	x0, [sp, 40]
	ldrb	w1, [sp, 51]
	strb	w1, [x0]
	ldr	x0, [sp, 40]
	add	x0, x0, 1
	ldrb	w1, [sp, 50]
	strb	w1, [x0]
	ldr	w0, [sp, 92]
	add	w0, w0, 1
	str	w0, [sp, 92]
.L12:
	ldr	w1, [sp, 92]
	ldr	w0, [sp, 84]
	cmp	w1, w0
	bcc	.L13
	ldr	x0, [sp, 72]
	ldp	x29, x30, [sp], 96
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE66:
	.size	compress_wav, .-compress_wav
	.align	2
	.global	decompress_wav
	.type	decompress_wav, %function
decompress_wav:
.LFB67:
	.cfi_startproc
	stp	x29, x30, [sp, -96]!
	.cfi_def_cfa_offset 96
	.cfi_offset 29, -96
	.cfi_offset 30, -88
	mov	x29, sp
	str	x0, [sp, 24]
	ldr	x0, [sp, 24]
	ldrh	w0, [x0, 32]
	strh	w0, [sp, 90]
	ldr	x0, [sp, 24]
	ldr	w1, [x0, 40]
	ldrh	w0, [sp, 90]
	udiv	w0, w1, w0
	str	w0, [sp, 84]
	ldr	x0, [sp, 24]
	ldrh	w4, [x0, 22]
	ldr	x0, [sp, 24]
	ldr	w0, [x0, 24]
	ldr	w3, [sp, 84]
	mov	w2, 16
	mov	w1, w0
	mov	w0, w4
	bl	new_wav
	str	x0, [sp, 72]
	ldr	x0, [sp, 72]
	cmp	x0, 0
	bne	.L16
	mov	w0, 1
	bl	exit
.L16:
	ldr	x0, [sp, 72]
	ldrh	w0, [x0, 32]
	strh	w0, [sp, 70]
	str	wzr, [sp, 92]
	b	.L17
.L18:
	ldrh	w1, [sp, 90]
	ldr	w0, [sp, 92]
	mul	w0, w1, w0
	uxtw	x0, w0
	add	x0, x0, 32
	ldr	x1, [sp, 24]
	add	x0, x1, x0
	add	x0, x0, 12
	str	x0, [sp, 56]
	ldr	x0, [sp, 56]
	ldrb	w0, [x0]
	strh	w0, [sp, 54]
	ldr	x0, [sp, 56]
	add	x0, x0, 1
	ldrb	w0, [x0]
	strh	w0, [sp, 52]
	ldrh	w0, [sp, 54]
	and	w0, w0, 255
	bl	decompress_sample
	strh	w0, [sp, 50]
	ldrh	w0, [sp, 52]
	and	w0, w0, 255
	bl	decompress_sample
	strh	w0, [sp, 48]
	ldrh	w1, [sp, 70]
	ldr	w0, [sp, 92]
	mul	w0, w1, w0
	uxtw	x0, w0
	add	x0, x0, 32
	ldr	x1, [sp, 72]
	add	x0, x1, x0
	add	x0, x0, 12
	str	x0, [sp, 40]
	ldrh	w0, [sp, 50]
	strb	w0, [sp, 39]
	ldrsh	w0, [sp, 50]
	asr	w0, w0, 8
	sxth	w0, w0
	strb	w0, [sp, 38]
	ldrh	w0, [sp, 48]
	strb	w0, [sp, 37]
	ldrsh	w0, [sp, 48]
	asr	w0, w0, 8
	sxth	w0, w0
	strb	w0, [sp, 36]
	ldr	x0, [sp, 40]
	ldrb	w1, [sp, 39]
	strb	w1, [x0]
	ldr	x0, [sp, 40]
	add	x0, x0, 1
	ldrb	w1, [sp, 38]
	strb	w1, [x0]
	ldr	x0, [sp, 40]
	add	x0, x0, 2
	ldrb	w1, [sp, 37]
	strb	w1, [x0]
	ldr	x0, [sp, 40]
	add	x0, x0, 3
	ldrb	w1, [sp, 36]
	strb	w1, [x0]
	ldr	w0, [sp, 92]
	add	w0, w0, 1
	str	w0, [sp, 92]
.L17:
	ldr	w1, [sp, 92]
	ldr	w0, [sp, 84]
	cmp	w1, w0
	bcc	.L18
	ldr	x0, [sp, 72]
	ldp	x29, x30, [sp], 96
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE67:
	.size	decompress_wav, .-decompress_wav
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
