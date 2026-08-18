	.arch armv8-a
	.file	"compression.c"
	.text
	.align	2
	.global	vector_compress_samples
	.type	vector_compress_samples, %function
vector_compress_samples:
.LFB3980:
	.cfi_startproc
	sub	sp, sp, #512
	.cfi_def_cfa_offset 512
	str	q0, [sp]
	ldr	q31, [sp]
	str	q31, [sp, 16]
	ldr	q31, [sp, 16]
	abs	v31.8h, v31.8h
	str	q31, [sp, 496]
	ldr	q31, [sp]
	str	q31, [sp, 32]
	ldr	q31, [sp, 32]
	shrn	v30.8b, v31.8h, 8
	mov	w0, -128
	strb	w0, [sp, 55]
	ldr	b31, [sp, 55]
	dup	v31.8b, v31.b[0]
	str	d30, [sp, 64]
	str	d31, [sp, 56]
	ldr	d30, [sp, 64]
	ldr	d31, [sp, 56]
	and	v31.8b, v30.8b, v31.8b
	str	d31, [sp, 488]
	mov	w0, 132
	strh	w0, [sp, 78]
	ldr	h31, [sp, 78]
	dup	v31.8h, v31.h[0]
	str	q31, [sp, 464]
	ldr	q31, [sp, 496]
	str	q31, [sp, 96]
	ldr	q31, [sp, 464]
	str	q31, [sp, 80]
	ldr	q30, [sp, 96]
	ldr	q31, [sp, 80]
	add	v31.8h, v30.8h, v31.8h
	str	q31, [sp, 496]
	mov	w0, 32767
	strh	w0, [sp, 126]
	ldr	h31, [sp, 126]
	dup	v31.8h, v31.h[0]
	mov	v30.16b, v31.16b
	ldr	q31, [sp, 496]
	str	q31, [sp, 144]
	str	q30, [sp, 128]
	ldr	q30, [sp, 144]
	ldr	q31, [sp, 128]
	umin	v31.8h, v30.8h, v31.8h
	str	q31, [sp, 496]
	ldr	q31, [sp, 496]
	str	q31, [sp, 160]
	ldr	q31, [sp, 160]
	clz	v31.8h, v31.8h
	str	q31, [sp, 448]
	ldr	q31, [sp, 448]
	str	q31, [sp, 176]
	ldr	q31, [sp, 176]
	xtn	v31.8b, v31.8h
	str	d31, [sp, 440]
	mov	w0, 8
	strb	w0, [sp, 207]
	ldr	b31, [sp, 207]
	dup	v31.8b, v31.b[0]
	str	d31, [sp, 216]
	ldr	d31, [sp, 440]
	str	d31, [sp, 208]
	ldr	d30, [sp, 216]
	ldr	d31, [sp, 208]
	sub	v31.8b, v30.8b, v31.8b
	str	d31, [sp, 432]
	ldr	d31, [sp, 432]
	str	d31, [sp, 224]
	ldr	d31, [sp, 224]
	shl	v31.8b, v31.8b, 4
	str	d31, [sp, 424]
	ldr	q30, [sp, 448]
	mov	w0, 11
	strh	w0, [sp, 238]
	ldr	h31, [sp, 238]
	dup	v31.8h, v31.h[0]
	str	q30, [sp, 256]
	str	q31, [sp, 240]
	ldr	q30, [sp, 256]
	ldr	q31, [sp, 240]
	sub	v31.8h, v30.8h, v31.8h
	str	q31, [sp, 400]
	ldr	d31, [sp, 424]
	str	d31, [sp, 280]
	ldr	d31, [sp, 488]
	str	d31, [sp, 272]
	ldr	d30, [sp, 280]
	ldr	d31, [sp, 272]
	orr	v29.8b, v30.8b, v31.8b
	ldr	q31, [sp, 496]
	str	q31, [sp, 304]
	ldr	q31, [sp, 400]
	str	q31, [sp, 288]
	ldr	q31, [sp, 304]
	ldr	q30, [sp, 288]
	ushl	v31.8h, v31.8h, v30.8h
	str	q31, [sp, 320]
	ldr	q31, [sp, 320]
	xtn	v30.8b, v31.8h
	mov	w0, 15
	strb	w0, [sp, 351]
	ldr	b31, [sp, 351]
	dup	v31.8b, v31.b[0]
	str	d30, [sp, 360]
	str	d31, [sp, 352]
	ldr	d30, [sp, 360]
	ldr	d31, [sp, 352]
	and	v31.8b, v30.8b, v31.8b
	str	d29, [sp, 376]
	str	d31, [sp, 368]
	ldr	d30, [sp, 376]
	ldr	d31, [sp, 368]
	orr	v31.8b, v30.8b, v31.8b
	str	d31, [sp, 392]
	ldr	d31, [sp, 392]
	str	d31, [sp, 384]
	ldr	d31, [sp, 384]
	not	v31.8b, v31.8b
	mov	v0.8b, v31.8b
	add	sp, sp, 512
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
	sub	sp, sp, #400
	.cfi_def_cfa_offset 400
	str	d0, [sp, 8]
	ldr	d31, [sp, 8]
	str	d31, [sp, 16]
	ldr	d31, [sp, 16]
	not	v31.8b, v31.8b
	str	d31, [sp, 8]
	ldr	d31, [sp, 8]
	str	d31, [sp, 24]
	ldr	d31, [sp, 24]
	ushr	v30.8b, v31.8b, 4
	mov	w0, 7
	strb	w0, [sp, 39]
	ldr	b31, [sp, 39]
	dup	v31.8b, v31.b[0]
	str	d30, [sp, 48]
	str	d31, [sp, 40]
	ldr	d30, [sp, 48]
	ldr	d31, [sp, 40]
	and	v31.8b, v30.8b, v31.8b
	str	d31, [sp, 392]
	mov	w0, 3
	strb	w0, [sp, 63]
	ldr	b31, [sp, 63]
	dup	v31.8b, v31.b[0]
	mov	v30.8b, v31.8b
	ldr	d31, [sp, 392]
	str	d31, [sp, 72]
	str	d30, [sp, 64]
	ldr	d30, [sp, 72]
	ldr	d31, [sp, 64]
	add	v31.8b, v30.8b, v31.8b
	str	d31, [sp, 80]
	ldr	d31, [sp, 80]
	sxtl	v31.8h, v31.8b
	str	q31, [sp, 368]
	mov	w0, 15
	strb	w0, [sp, 95]
	ldr	b31, [sp, 95]
	dup	v31.8b, v31.b[0]
	mov	v30.8b, v31.8b
	ldr	d31, [sp, 8]
	str	d31, [sp, 104]
	str	d30, [sp, 96]
	ldr	d30, [sp, 104]
	ldr	d31, [sp, 96]
	and	v30.8b, v30.8b, v31.8b
	mov	w0, 16
	strb	w0, [sp, 119]
	ldr	b31, [sp, 119]
	dup	v31.8b, v31.b[0]
	str	d30, [sp, 128]
	str	d31, [sp, 120]
	ldr	d30, [sp, 128]
	ldr	d31, [sp, 120]
	orr	v31.8b, v30.8b, v31.8b
	str	d31, [sp, 136]
	ldr	d31, [sp, 136]
	uxtl	v31.8h, v31.8b
	str	q31, [sp, 160]
	ldr	q31, [sp, 368]
	str	q31, [sp, 144]
	ldr	q31, [sp, 160]
	ldr	q30, [sp, 144]
	ushl	v31.8h, v31.8h, v30.8h
	str	q31, [sp, 352]
	mov	w0, 132
	strh	w0, [sp, 190]
	ldr	h31, [sp, 190]
	dup	v31.8h, v31.h[0]
	mov	v30.16b, v31.16b
	ldr	q31, [sp, 352]
	str	q31, [sp, 208]
	str	q30, [sp, 192]
	ldr	q30, [sp, 208]
	ldr	q31, [sp, 192]
	sub	v31.8h, v30.8h, v31.8h
	str	q31, [sp, 352]
	ldr	d31, [sp, 8]
	str	d31, [sp, 232]
	ldr	d31, [sp, 232]
	sxtl	v31.8h, v31.8b
	str	q31, [sp, 240]
	ldr	q31, [sp, 240]
	sshr	v31.8h, v31.8h, 7
	str	q31, [sp, 336]
	ldr	q31, [sp, 352]
	str	q31, [sp, 272]
	ldr	q31, [sp, 336]
	str	q31, [sp, 256]
	ldr	q30, [sp, 272]
	ldr	q31, [sp, 256]
	eor	v31.16b, v30.16b, v31.16b
	str	q31, [sp, 304]
	ldr	q31, [sp, 336]
	str	q31, [sp, 288]
	ldr	q30, [sp, 304]
	ldr	q31, [sp, 288]
	sub	v31.8h, v30.8h, v31.8h
	str	q31, [sp, 320]
	ldr	q31, [sp, 320]
	mov	v0.16b, v31.16b
	add	sp, sp, 400
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
	beq	.L47
	ldr	w0, [sp, 28]
	clz	w0, w0
	b	.L52
.L47:
	mov	w0, 32
.L52:
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
	lsr	w0, w0, 4
	and	w0, w0, 255
	and	w0, w0, 7
	strb	w0, [sp, 31]
	ldrb	w0, [sp, 15]
	and	w0, w0, 15
	orr	w1, w0, 16
	ldrb	w0, [sp, 31]
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
	and	w1, w0, 65535
	ldrh	w0, [sp, 26]
	sub	w0, w1, w0
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
	bne	.L56
	mov	w0, 1
	bl	exit
.L56:
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
	b	.L57
.L59:
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
.L57:
	ldr	w0, [sp, 140]
	add	w0, w0, 8
	ldr	w1, [sp, 100]
	cmp	w1, w0
	bcs	.L59
	b	.L60
.L61:
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
.L60:
	ldr	w1, [sp, 140]
	ldr	w0, [sp, 100]
	cmp	w1, w0
	bcc	.L61
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
	bne	.L64
	mov	w0, 1
	bl	exit
.L64:
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
	b	.L65
.L67:
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
.L65:
	ldr	w0, [sp, 172]
	add	w0, w0, 8
	ldr	w1, [sp, 132]
	cmp	w1, w0
	bcs	.L67
	b	.L68
.L69:
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
.L68:
	ldr	w1, [sp, 172]
	ldr	w0, [sp, 132]
	cmp	w1, w0
	bcc	.L69
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
