	.arch armv8-a
	.file	"compression.c"
	.text
	.align	2
	.global	vector_compress_samples
	.type	vector_compress_samples, %function
vector_compress_samples:
.LFB3980:
	.cfi_startproc
	sub	sp, sp, #672
	.cfi_def_cfa_offset 672
	str	q0, [sp]
	ldr	q31, [sp]
	str	q31, [sp, 16]
	ldr	q31, [sp, 16]
	cmlt	v31.8h, v31.8h, #0
	str	q31, [sp, 656]
	ldr	q31, [sp]
	str	q31, [sp, 48]
	ldr	q31, [sp, 656]
	str	q31, [sp, 32]
	ldr	q30, [sp, 48]
	ldr	q31, [sp, 32]
	add	v31.8h, v30.8h, v31.8h
	mov	v30.16b, v31.16b
	ldr	q31, [sp, 656]
	str	q30, [sp, 80]
	str	q31, [sp, 64]
	ldr	q30, [sp, 80]
	ldr	q31, [sp, 64]
	eor	v31.16b, v30.16b, v31.16b
	str	q31, [sp, 640]
	ldr	q30, [sp]
	mov	w0, -32768
	strh	w0, [sp, 110]
	ldr	h31, [sp, 110]
	dup	v31.8h, v31.h[0]
	str	q30, [sp, 128]
	str	q31, [sp, 112]
	ldr	q30, [sp, 128]
	ldr	q31, [sp, 112]
	and	v31.16b, v30.16b, v31.16b
	str	q31, [sp, 624]
	mov	w0, 132
	strh	w0, [sp, 158]
	ldr	h31, [sp, 158]
	dup	v31.8h, v31.h[0]
	str	q31, [sp, 608]
	ldr	q31, [sp, 640]
	str	q31, [sp, 176]
	ldr	q31, [sp, 608]
	str	q31, [sp, 160]
	ldr	q30, [sp, 176]
	ldr	q31, [sp, 160]
	add	v31.8h, v30.8h, v31.8h
	str	q31, [sp, 640]
	mov	w0, 32767
	strh	w0, [sp, 206]
	ldr	h31, [sp, 206]
	dup	v31.8h, v31.h[0]
	mov	v30.16b, v31.16b
	ldr	q31, [sp, 640]
	str	q31, [sp, 224]
	str	q30, [sp, 208]
	ldr	q30, [sp, 224]
	ldr	q31, [sp, 208]
	umin	v31.8h, v30.8h, v31.8h
	str	q31, [sp, 640]
	ldr	q31, [sp, 640]
	str	q31, [sp, 240]
	ldr	q31, [sp, 240]
	clz	v31.8h, v31.8h
	mov	v30.16b, v31.16b
	mov	w0, 1
	strh	w0, [sp, 270]
	ldr	h31, [sp, 270]
	dup	v31.8h, v31.h[0]
	str	q30, [sp, 288]
	str	q31, [sp, 272]
	ldr	q30, [sp, 288]
	ldr	q31, [sp, 272]
	sub	v31.8h, v30.8h, v31.8h
	str	q31, [sp, 304]
	ldr	q31, [sp, 304]
	xtn	v31.8b, v31.8h
	str	d31, [sp, 600]
	mov	w0, 7
	strb	w0, [sp, 327]
	ldr	b31, [sp, 327]
	dup	v31.8b, v31.b[0]
	str	d31, [sp, 336]
	ldr	d31, [sp, 600]
	str	d31, [sp, 328]
	ldr	d30, [sp, 336]
	ldr	d31, [sp, 328]
	sub	v31.8b, v30.8b, v31.8b
	str	d31, [sp, 592]
	ldr	d31, [sp, 592]
	str	d31, [sp, 344]
	ldr	d31, [sp, 344]
	shl	v31.8b, v31.8b, 4
	str	d31, [sp, 584]
	ldr	d31, [sp, 600]
	str	d31, [sp, 352]
	ldr	d31, [sp, 352]
	uxtl	v31.8h, v31.8b
	mov	v30.16b, v31.16b
	mov	w0, 10
	strh	w0, [sp, 366]
	ldr	h31, [sp, 366]
	dup	v31.8h, v31.h[0]
	str	q30, [sp, 384]
	str	q31, [sp, 368]
	ldr	q30, [sp, 384]
	ldr	q31, [sp, 368]
	sub	v31.8h, v30.8h, v31.8h
	str	q31, [sp, 560]
	ldr	q31, [sp, 624]
	str	q31, [sp, 400]
	ldr	q31, [sp, 400]
	ushr	v31.8h, v31.8h, 8
	str	q31, [sp, 416]
	ldr	q31, [sp, 416]
	xtn	v31.8b, v31.8h
	ldr	d30, [sp, 584]
	str	d30, [sp, 440]
	str	d31, [sp, 432]
	ldr	d30, [sp, 440]
	ldr	d31, [sp, 432]
	orr	v29.8b, v30.8b, v31.8b
	ldr	q31, [sp, 640]
	str	q31, [sp, 464]
	ldr	q31, [sp, 560]
	str	q31, [sp, 448]
	ldr	q31, [sp, 464]
	ldr	q30, [sp, 448]
	ushl	v31.8h, v31.8h, v30.8h
	str	q31, [sp, 480]
	ldr	q31, [sp, 480]
	xtn	v30.8b, v31.8h
	mov	w0, 15
	strb	w0, [sp, 511]
	ldr	b31, [sp, 511]
	dup	v31.8b, v31.b[0]
	str	d30, [sp, 520]
	str	d31, [sp, 512]
	ldr	d30, [sp, 520]
	ldr	d31, [sp, 512]
	and	v31.8b, v30.8b, v31.8b
	str	d29, [sp, 536]
	str	d31, [sp, 528]
	ldr	d30, [sp, 536]
	ldr	d31, [sp, 528]
	orr	v31.8b, v30.8b, v31.8b
	str	d31, [sp, 552]
	ldr	d31, [sp, 552]
	str	d31, [sp, 544]
	ldr	d31, [sp, 544]
	not	v31.8b, v31.8b
	mov	v0.8b, v31.8b
	add	sp, sp, 672
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE3980:
	.size	vector_compress_samples, .-vector_compress_samples
	.align	2
	.global	vector_decompress_samples
	.type	vector_decompress_samples, %function
vector_decompress_samples:
.LFB3981:
	.cfi_startproc
	sub	sp, sp, #464
	.cfi_def_cfa_offset 464
	str	d0, [sp, 8]
	ldr	d31, [sp, 8]
	str	d31, [sp, 16]
	ldr	d31, [sp, 16]
	not	v31.8b, v31.8b
	str	d31, [sp, 8]
	mov	w0, -128
	strb	w0, [sp, 31]
	ldr	b31, [sp, 31]
	dup	v31.8b, v31.b[0]
	mov	v30.8b, v31.8b
	ldr	d31, [sp, 8]
	str	d31, [sp, 40]
	str	d30, [sp, 32]
	ldr	d30, [sp, 40]
	ldr	d31, [sp, 32]
	and	v31.8b, v30.8b, v31.8b
	str	d31, [sp, 456]
	ldr	d31, [sp, 8]
	str	d31, [sp, 56]
	ldr	d31, [sp, 456]
	str	d31, [sp, 48]
	ldr	d30, [sp, 56]
	ldr	d31, [sp, 48]
	eor	v31.8b, v30.8b, v31.8b
	str	d31, [sp, 64]
	ldr	d31, [sp, 64]
	ushr	v31.8b, v31.8b, 4
	str	d31, [sp, 448]
	mov	w0, 3
	strb	w0, [sp, 79]
	ldr	b31, [sp, 79]
	dup	v31.8b, v31.b[0]
	mov	v30.8b, v31.8b
	ldr	d31, [sp, 448]
	str	d31, [sp, 88]
	str	d30, [sp, 80]
	ldr	d30, [sp, 88]
	ldr	d31, [sp, 80]
	add	v31.8b, v30.8b, v31.8b
	str	d31, [sp, 96]
	ldr	d31, [sp, 96]
	sxtl	v31.8h, v31.8b
	str	q31, [sp, 432]
	mov	w0, 15
	strb	w0, [sp, 111]
	ldr	b31, [sp, 111]
	dup	v31.8b, v31.b[0]
	mov	v30.8b, v31.8b
	ldr	d31, [sp, 8]
	str	d31, [sp, 120]
	str	d30, [sp, 112]
	ldr	d30, [sp, 120]
	ldr	d31, [sp, 112]
	and	v30.8b, v30.8b, v31.8b
	mov	w0, 16
	strb	w0, [sp, 135]
	ldr	b31, [sp, 135]
	dup	v31.8b, v31.b[0]
	str	d30, [sp, 144]
	str	d31, [sp, 136]
	ldr	d30, [sp, 144]
	ldr	d31, [sp, 136]
	orr	v31.8b, v30.8b, v31.8b
	str	d31, [sp, 152]
	ldr	d31, [sp, 152]
	uxtl	v31.8h, v31.8b
	str	q31, [sp, 176]
	ldr	q31, [sp, 432]
	str	q31, [sp, 160]
	ldr	q31, [sp, 176]
	ldr	q30, [sp, 160]
	ushl	v31.8h, v31.8h, v30.8h
	str	q31, [sp, 416]
	mov	w0, 132
	strh	w0, [sp, 206]
	ldr	h31, [sp, 206]
	dup	v31.8h, v31.h[0]
	mov	v30.16b, v31.16b
	ldr	q31, [sp, 416]
	str	q31, [sp, 224]
	str	q30, [sp, 208]
	ldr	q30, [sp, 224]
	ldr	q31, [sp, 208]
	sub	v31.8h, v30.8h, v31.8h
	str	q31, [sp, 416]
	ldr	d31, [sp, 8]
	str	d31, [sp, 248]
	ldr	d31, [sp, 248]
	uxtl	v31.8h, v31.8b
	str	q31, [sp, 256]
	ldr	q31, [sp, 256]
	shl	v31.8h, v31.8h, 8
	str	q31, [sp, 272]
	ldr	q31, [sp, 272]
	cmlt	v31.8h, v31.8h, #0
	str	q31, [sp, 400]
	ldr	q31, [sp, 416]
	str	q31, [sp, 304]
	ldr	q31, [sp, 400]
	str	q31, [sp, 288]
	ldr	q30, [sp, 304]
	ldr	q31, [sp, 288]
	eor	v30.16b, v30.16b, v31.16b
	ldr	d31, [sp, 456]
	str	d31, [sp, 328]
	ldr	d31, [sp, 328]
	uxtl	v31.8h, v31.8b
	str	q31, [sp, 336]
	ldr	q31, [sp, 336]
	sshr	v31.8h, v31.8h, 7
	str	q30, [sp, 368]
	str	q31, [sp, 352]
	ldr	q30, [sp, 368]
	ldr	q31, [sp, 352]
	add	v31.8h, v30.8h, v31.8h
	str	q31, [sp, 384]
	ldr	q31, [sp, 384]
	mov	v0.16b, v31.16b
	add	sp, sp, 464
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE3981:
	.size	vector_decompress_samples, .-vector_decompress_samples
	.align	2
	.global	compress_sample
	.type	compress_sample, %function
compress_sample:
.LFB3982:
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
	beq	.L57
	ldr	w0, [sp, 28]
	clz	w0, w0
	b	.L62
.L57:
	mov	w0, 32
.L62:
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
	mvn	w0, w0
	and	w0, w0, 255
	add	sp, sp, 48
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE3982:
	.size	compress_sample, .-compress_sample
	.align	2
	.global	decompress_sample
	.type	decompress_sample, %function
decompress_sample:
.LFB3983:
	.cfi_startproc
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	strb	w0, [sp, 15]
	ldrb	w0, [sp, 15]
	mvn	w0, w0
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
.LFE3983:
	.size	decompress_sample, .-decompress_sample
	.align	2
	.global	compress_wav
	.type	compress_wav, %function
compress_wav:
.LFB3984:
	.cfi_startproc
	stp	x29, x30, [sp, -144]!
	.cfi_def_cfa_offset 144
	.cfi_offset 29, -144
	.cfi_offset 30, -136
	mov	x29, sp
	str	x19, [sp, 16]
	.cfi_offset 19, -128
	str	x0, [sp, 40]
	ldr	x0, [sp, 40]
	ldrh	w0, [x0, 32]
	strh	w0, [sp, 138]
	ldr	x0, [sp, 40]
	ldr	w1, [x0, 40]
	ldrh	w0, [sp, 138]
	udiv	w0, w1, w0
	str	w0, [sp, 132]
	ldr	x0, [sp, 40]
	ldrh	w5, [x0, 22]
	ldr	x0, [sp, 40]
	ldr	w0, [x0, 24]
	mov	w4, 7
	ldr	w3, [sp, 132]
	mov	w2, 8
	mov	w1, w0
	mov	w0, w5
	bl	new_wav
	str	x0, [sp, 120]
	ldr	x0, [sp, 120]
	cmp	x0, 0
	bne	.L66
	mov	w0, 1
	bl	exit
.L66:
	ldr	x0, [sp, 40]
	add	x0, x0, 44
	str	x0, [sp, 112]
	ldr	x0, [sp, 120]
	add	x0, x0, 44
	str	x0, [sp, 104]
	ldr	x0, [sp, 40]
	ldr	w0, [x0, 40]
	lsr	w0, w0, 1
	str	w0, [sp, 100]
	str	wzr, [sp, 140]
	b	.L67
.L69:
	ldr	w0, [sp, 140]
	lsl	x0, x0, 1
	ldr	x1, [sp, 112]
	add	x0, x1, x0
	str	x0, [sp, 48]
	ldr	x0, [sp, 48]
	ldr	q31, [x0]
	str	q31, [sp, 80]
	ldr	q0, [sp, 80]
	bl	vector_compress_samples
	str	d0, [sp, 72]
	ldr	w0, [sp, 140]
	ldr	x1, [sp, 104]
	add	x0, x1, x0
	str	x0, [sp, 64]
	ldr	d31, [sp, 72]
	str	d31, [sp, 56]
	ldr	d31, [sp, 56]
	ldr	x0, [sp, 64]
	str	d31, [x0]
	nop
	ldr	w0, [sp, 140]
	add	w0, w0, 8
	str	w0, [sp, 140]
.L67:
	ldr	w0, [sp, 140]
	add	w0, w0, 8
	ldr	w1, [sp, 100]
	cmp	w1, w0
	bcs	.L69
	b	.L70
.L71:
	ldr	w0, [sp, 140]
	lsl	x0, x0, 1
	ldr	x1, [sp, 112]
	add	x0, x1, x0
	ldrsh	w2, [x0]
	ldr	w0, [sp, 140]
	ldr	x1, [sp, 104]
	add	x19, x1, x0
	mov	w0, w2
	bl	compress_sample
	and	w0, w0, 255
	strb	w0, [x19]
	ldr	w0, [sp, 140]
	add	w0, w0, 1
	str	w0, [sp, 140]
.L70:
	ldr	w1, [sp, 140]
	ldr	w0, [sp, 100]
	cmp	w1, w0
	bcc	.L71
	ldr	x0, [sp, 120]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 144
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE3984:
	.size	compress_wav, .-compress_wav
	.align	2
	.global	decompress_wav
	.type	decompress_wav, %function
decompress_wav:
.LFB3985:
	.cfi_startproc
	stp	x29, x30, [sp, -176]!
	.cfi_def_cfa_offset 176
	.cfi_offset 29, -176
	.cfi_offset 30, -168
	mov	x29, sp
	str	x19, [sp, 16]
	.cfi_offset 19, -160
	str	x0, [sp, 40]
	ldr	x0, [sp, 40]
	ldrh	w0, [x0, 32]
	strh	w0, [sp, 170]
	ldr	x0, [sp, 40]
	ldr	w1, [x0, 40]
	ldrh	w0, [sp, 170]
	udiv	w0, w1, w0
	str	w0, [sp, 164]
	ldr	x0, [sp, 40]
	ldrh	w5, [x0, 22]
	ldr	x0, [sp, 40]
	ldr	w0, [x0, 24]
	mov	w4, 1
	ldr	w3, [sp, 164]
	mov	w2, 16
	mov	w1, w0
	mov	w0, w5
	bl	new_wav
	str	x0, [sp, 152]
	ldr	x0, [sp, 152]
	cmp	x0, 0
	bne	.L74
	mov	w0, 1
	bl	exit
.L74:
	ldr	x0, [sp, 40]
	add	x0, x0, 44
	str	x0, [sp, 144]
	ldr	x0, [sp, 152]
	add	x0, x0, 44
	str	x0, [sp, 136]
	ldr	x0, [sp, 40]
	ldr	w0, [x0, 40]
	str	w0, [sp, 132]
	str	wzr, [sp, 172]
	b	.L75
.L77:
	ldr	w0, [sp, 172]
	ldr	x1, [sp, 144]
	add	x0, x1, x0
	str	x0, [sp, 56]
	ldr	x0, [sp, 56]
	ldr	d31, [x0]
	str	d31, [sp, 120]
	ldr	d0, [sp, 120]
	bl	vector_decompress_samples
	str	q0, [sp, 96]
	ldr	w0, [sp, 172]
	lsl	x0, x0, 1
	ldr	x1, [sp, 136]
	add	x0, x1, x0
	str	x0, [sp, 88]
	ldr	q31, [sp, 96]
	str	q31, [sp, 64]
	ldr	q31, [sp, 64]
	ldr	x0, [sp, 88]
	str	q31, [x0]
	nop
	ldr	w0, [sp, 172]
	add	w0, w0, 8
	str	w0, [sp, 172]
.L75:
	ldr	w0, [sp, 172]
	add	w0, w0, 8
	ldr	w1, [sp, 132]
	cmp	w1, w0
	bcs	.L77
	b	.L78
.L79:
	ldr	w0, [sp, 172]
	ldr	x1, [sp, 144]
	add	x0, x1, x0
	ldrb	w2, [x0]
	ldr	w0, [sp, 172]
	lsl	x0, x0, 1
	ldr	x1, [sp, 136]
	add	x19, x1, x0
	mov	w0, w2
	bl	decompress_sample
	sxth	w0, w0
	strh	w0, [x19]
	ldr	w0, [sp, 172]
	add	w0, w0, 1
	str	w0, [sp, 172]
.L78:
	ldr	w1, [sp, 172]
	ldr	w0, [sp, 132]
	cmp	w1, w0
	bcc	.L79
	ldr	x0, [sp, 152]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 176
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE3985:
	.size	decompress_wav, .-decompress_wav
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
