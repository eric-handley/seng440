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
	sub	sp, sp, #368
	.cfi_def_cfa_offset 368
	str	d0, [sp, 8]
	mov	w0, 3
	strb	w0, [sp, 30]
	ldr	b31, [sp, 30]
	dup	v31.8b, v31.b[0]
	mov	v29.8b, v31.8b
	mov	w0, 112
	strb	w0, [sp, 31]
	ldr	b31, [sp, 31]
	dup	v31.8b, v31.b[0]
	str	d31, [sp, 40]
	ldr	d31, [sp, 8]
	str	d31, [sp, 32]
	ldr	d31, [sp, 32]
	not	v30.8b, v31.8b
	ldr	d31, [sp, 40]
	and	v31.8b, v30.8b, v31.8b
	str	d29, [sp, 56]
	str	d31, [sp, 48]
	ldr	d31, [sp, 56]
	ldr	d30, [sp, 48]
	usra	v31.8b, v30.8b, 4
	str	d31, [sp, 64]
	ldr	d31, [sp, 64]
	sxtl	v31.8h, v31.8b
	str	q31, [sp, 352]
	mov	w0, 15
	strb	w0, [sp, 79]
	ldr	b31, [sp, 79]
	dup	v31.8b, v31.b[0]
	str	d31, [sp, 88]
	ldr	d31, [sp, 8]
	str	d31, [sp, 80]
	ldr	d31, [sp, 80]
	not	v30.8b, v31.8b
	ldr	d31, [sp, 88]
	and	v30.8b, v30.8b, v31.8b
	mov	w0, 16
	strb	w0, [sp, 103]
	ldr	b31, [sp, 103]
	dup	v31.8b, v31.b[0]
	str	d30, [sp, 112]
	str	d31, [sp, 104]
	ldr	d30, [sp, 112]
	ldr	d31, [sp, 104]
	orr	v31.8b, v30.8b, v31.8b
	str	d31, [sp, 120]
	ldr	d31, [sp, 120]
	uxtl	v31.8h, v31.8b
	str	q31, [sp, 144]
	ldr	q31, [sp, 352]
	str	q31, [sp, 128]
	ldr	q31, [sp, 144]
	ldr	q30, [sp, 128]
	ushl	v31.8h, v31.8h, v30.8h
	str	q31, [sp, 336]
	mov	w0, 132
	strh	w0, [sp, 174]
	ldr	h31, [sp, 174]
	dup	v31.8h, v31.h[0]
	mov	v30.16b, v31.16b
	ldr	q31, [sp, 336]
	str	q31, [sp, 192]
	str	q30, [sp, 176]
	ldr	q30, [sp, 192]
	ldr	q31, [sp, 176]
	sub	v31.8h, v30.8h, v31.8h
	str	q31, [sp, 336]
	ldr	d31, [sp, 8]
	str	d31, [sp, 208]
	ldr	d31, [sp, 208]
	not	v31.8b, v31.8b
	str	d31, [sp, 216]
	ldr	d31, [sp, 216]
	sxtl	v31.8h, v31.8b
	str	q31, [sp, 224]
	ldr	q31, [sp, 224]
	sshr	v31.8h, v31.8h, 7
	str	q31, [sp, 320]
	ldr	q31, [sp, 336]
	str	q31, [sp, 256]
	ldr	q31, [sp, 320]
	str	q31, [sp, 240]
	ldr	q30, [sp, 256]
	ldr	q31, [sp, 240]
	eor	v31.16b, v30.16b, v31.16b
	str	q31, [sp, 288]
	ldr	q31, [sp, 320]
	str	q31, [sp, 272]
	ldr	q30, [sp, 288]
	ldr	q31, [sp, 272]
	sub	v31.8h, v30.8h, v31.8h
	str	q31, [sp, 304]
	ldr	q31, [sp, 304]
	mov	v0.16b, v31.16b
	add	sp, sp, 368
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
	beq	.L46
	ldr	w0, [sp, 28]
	clz	w0, w0
	b	.L51
.L46:
	mov	w0, 32
.L51:
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
	sub	sp, sp, #656
	.cfi_def_cfa_offset 656
	stp	x29, x30, [sp]
	.cfi_offset 29, -656
	.cfi_offset 30, -648
	mov	x29, sp
	str	x0, [sp, 24]
	ldr	x0, [sp, 24]
	ldrh	w0, [x0, 32]
	strh	w0, [sp, 650]
	ldr	x0, [sp, 24]
	ldr	w1, [x0, 40]
	ldrh	w0, [sp, 650]
	udiv	w0, w1, w0
	str	w0, [sp, 644]
	ldr	x0, [sp, 24]
	ldrh	w5, [x0, 22]
	ldr	x0, [sp, 24]
	ldr	w0, [x0, 24]
	mov	w4, 7
	ldr	w3, [sp, 644]
	mov	w2, 8
	mov	w1, w0
	mov	w0, w5
	bl	new_wav
	str	x0, [sp, 632]
	ldr	x0, [sp, 632]
	cmp	x0, 0
	bne	.L55
	mov	w0, 1
	bl	exit
.L55:
	ldr	x0, [sp, 24]
	add	x0, x0, 44
	str	x0, [sp, 624]
	ldr	x0, [sp, 632]
	add	x0, x0, 44
	str	x0, [sp, 616]
	ldr	x0, [sp, 24]
	ldr	w0, [x0, 40]
	lsr	w0, w0, 1
	str	w0, [sp, 612]
	str	wzr, [sp, 652]
	b	.L56
.L81:
	ldr	w0, [sp, 652]
	lsl	x0, x0, 1
	ldr	x1, [sp, 624]
	add	x0, x1, x0
	str	x0, [sp, 64]
	ldr	x0, [sp, 64]
	ldr	q31, [x0]
	str	q31, [sp, 592]
	ldr	q31, [sp, 592]
	str	q31, [sp, 544]
	ldr	q31, [sp, 544]
	str	q31, [sp, 528]
	ldr	q31, [sp, 528]
	abs	v31.8h, v31.8h
	str	q31, [sp, 512]
	ldr	q31, [sp, 544]
	str	q31, [sp, 496]
	ldr	q31, [sp, 496]
	shrn	v30.8b, v31.8h, 8
	mov	w0, -128
	strb	w0, [sp, 495]
	ldr	b31, [sp, 495]
	dup	v31.8b, v31.b[0]
	str	d30, [sp, 480]
	str	d31, [sp, 472]
	ldr	d30, [sp, 480]
	ldr	d31, [sp, 472]
	and	v31.8b, v30.8b, v31.8b
	str	d31, [sp, 464]
	mov	w0, 132
	strh	w0, [sp, 462]
	ldr	h31, [sp, 462]
	dup	v31.8h, v31.h[0]
	str	q31, [sp, 432]
	ldr	q31, [sp, 512]
	str	q31, [sp, 416]
	ldr	q31, [sp, 432]
	str	q31, [sp, 400]
	ldr	q30, [sp, 416]
	ldr	q31, [sp, 400]
	add	v31.8h, v30.8h, v31.8h
	str	q31, [sp, 512]
	mov	w0, 32767
	strh	w0, [sp, 398]
	ldr	h31, [sp, 398]
	dup	v31.8h, v31.h[0]
	mov	v30.16b, v31.16b
	ldr	q31, [sp, 512]
	str	q31, [sp, 368]
	str	q30, [sp, 352]
	ldr	q30, [sp, 368]
	ldr	q31, [sp, 352]
	umin	v31.8h, v30.8h, v31.8h
	str	q31, [sp, 512]
	ldr	q31, [sp, 512]
	str	q31, [sp, 336]
	ldr	q31, [sp, 336]
	clz	v31.8h, v31.8h
	str	q31, [sp, 320]
	ldr	q31, [sp, 320]
	str	q31, [sp, 304]
	ldr	q31, [sp, 304]
	xtn	v31.8b, v31.8h
	str	d31, [sp, 296]
	mov	w0, 8
	strb	w0, [sp, 295]
	ldr	b31, [sp, 295]
	dup	v31.8b, v31.b[0]
	str	d31, [sp, 280]
	ldr	d31, [sp, 296]
	str	d31, [sp, 272]
	ldr	d30, [sp, 280]
	ldr	d31, [sp, 272]
	sub	v31.8b, v30.8b, v31.8b
	str	d31, [sp, 264]
	ldr	d31, [sp, 264]
	str	d31, [sp, 256]
	ldr	d31, [sp, 256]
	shl	v31.8b, v31.8b, 4
	str	d31, [sp, 248]
	ldr	q30, [sp, 320]
	mov	w0, 11
	strh	w0, [sp, 246]
	ldr	h31, [sp, 246]
	dup	v31.8h, v31.h[0]
	str	q30, [sp, 224]
	str	q31, [sp, 208]
	ldr	q30, [sp, 224]
	ldr	q31, [sp, 208]
	sub	v31.8h, v30.8h, v31.8h
	str	q31, [sp, 192]
	ldr	d31, [sp, 248]
	str	d31, [sp, 184]
	ldr	d31, [sp, 464]
	str	d31, [sp, 176]
	ldr	d30, [sp, 184]
	ldr	d31, [sp, 176]
	orr	v29.8b, v30.8b, v31.8b
	ldr	q31, [sp, 512]
	str	q31, [sp, 160]
	ldr	q31, [sp, 192]
	str	q31, [sp, 144]
	ldr	q31, [sp, 160]
	ldr	q30, [sp, 144]
	ushl	v31.8h, v31.8h, v30.8h
	str	q31, [sp, 128]
	ldr	q31, [sp, 128]
	xtn	v30.8b, v31.8h
	mov	w0, 15
	strb	w0, [sp, 127]
	ldr	b31, [sp, 127]
	dup	v31.8b, v31.b[0]
	str	d30, [sp, 112]
	str	d31, [sp, 104]
	ldr	d30, [sp, 112]
	ldr	d31, [sp, 104]
	and	v31.8b, v30.8b, v31.8b
	str	d29, [sp, 96]
	str	d31, [sp, 88]
	ldr	d30, [sp, 96]
	ldr	d31, [sp, 88]
	orr	v31.8b, v30.8b, v31.8b
	str	d31, [sp, 80]
	ldr	d31, [sp, 80]
	str	d31, [sp, 72]
	ldr	d31, [sp, 72]
	not	v31.8b, v31.8b
	nop
	str	d31, [sp, 584]
	ldr	w0, [sp, 652]
	ldr	x1, [sp, 616]
	add	x0, x1, x0
	str	x0, [sp, 576]
	ldr	d31, [sp, 584]
	str	d31, [sp, 568]
	ldr	d31, [sp, 568]
	ldr	x0, [sp, 576]
	str	d31, [x0]
	nop
	ldr	w0, [sp, 652]
	add	w0, w0, 8
	str	w0, [sp, 652]
.L56:
	ldr	w0, [sp, 652]
	add	w0, w0, 8
	ldr	w1, [sp, 612]
	cmp	w1, w0
	bcs	.L81
	b	.L82
.L88:
	ldr	w0, [sp, 652]
	lsl	x0, x0, 1
	ldr	x1, [sp, 624]
	add	x0, x1, x0
	ldrsh	w2, [x0]
	ldr	w0, [sp, 652]
	ldr	x1, [sp, 616]
	add	x1, x1, x0
	mov	w0, w2
	strh	w0, [sp, 62]
	ldrsh	w0, [sp, 62]
	asr	w0, w0, 15
	strh	w0, [sp, 60]
	ldrh	w2, [sp, 62]
	ldrh	w0, [sp, 60]
	add	w0, w2, w0
	and	w0, w0, 65535
	sxth	w2, w0
	ldrh	w0, [sp, 60]
	eor	w0, w2, w0
	sxth	w0, w0
	strh	w0, [sp, 58]
	ldrh	w0, [sp, 62]
	and	w0, w0, -32768
	strh	w0, [sp, 56]
	ldrh	w0, [sp, 58]
	add	w0, w0, 132
	strh	w0, [sp, 58]
	ldrsh	w0, [sp, 58]
	asr	w0, w0, 15
	sxth	w0, w0
	strh	w0, [sp, 54]
	ldrsh	w0, [sp, 54]
	mvn	w0, w0
	sxth	w2, w0
	ldrsh	w0, [sp, 58]
	and	w0, w2, w0
	sxth	w2, w0
	ldrsh	w0, [sp, 54]
	and	w0, w0, 32767
	sxth	w0, w0
	orr	w0, w2, w0
	sxth	w0, w0
	strh	w0, [sp, 58]
	ldrh	w0, [sp, 58]
	strh	w0, [sp, 52]
	ldrh	w0, [sp, 52]
	str	w0, [sp, 48]
	ldr	w0, [sp, 48]
	cmp	w0, 0
	beq	.L83
	ldr	w0, [sp, 48]
	clz	w0, w0
	b	.L90
.L83:
	mov	w0, 32
.L90:
	sub	w0, w0, #16
	and	w0, w0, 255
	sub	w0, w0, #1
	strb	w0, [sp, 47]
	ldrb	w0, [sp, 47]
	mov	w2, 7
	sub	w0, w2, w0
	strb	w0, [sp, 46]
	ldrb	w0, [sp, 46]
	ubfiz	w0, w0, 4, 4
	strb	w0, [sp, 45]
	ldrh	w0, [sp, 56]
	lsr	w0, w0, 8
	and	w0, w0, 65535
	and	w2, w0, 255
	ldrb	w0, [sp, 45]
	orr	w0, w2, w0
	and	w0, w0, 255
	sxtb	w2, w0
	ldrh	w3, [sp, 58]
	ldrb	w0, [sp, 47]
	mov	w4, 10
	sub	w0, w4, w0
	asr	w0, w3, w0
	sxtb	w0, w0
	and	w0, w0, 15
	sxtb	w0, w0
	orr	w0, w2, w0
	sxtb	w0, w0
	strb	w0, [sp, 44]
	ldrb	w0, [sp, 44]
	mvn	w0, w0
	and	w0, w0, 255
	strb	w0, [x1]
	ldr	w0, [sp, 652]
	add	w0, w0, 1
	str	w0, [sp, 652]
.L82:
	ldr	w1, [sp, 652]
	ldr	w0, [sp, 612]
	cmp	w1, w0
	bcc	.L88
	ldr	x0, [sp, 632]
	ldp	x29, x30, [sp]
	add	sp, sp, 656
	.cfi_restore 29
	.cfi_restore 30
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
	sub	sp, sp, #528
	.cfi_def_cfa_offset 528
	stp	x29, x30, [sp]
	.cfi_offset 29, -528
	.cfi_offset 30, -520
	mov	x29, sp
	str	x0, [sp, 24]
	ldr	x0, [sp, 24]
	ldrh	w0, [x0, 32]
	strh	w0, [sp, 522]
	ldr	x0, [sp, 24]
	ldr	w1, [x0, 40]
	ldrh	w0, [sp, 522]
	udiv	w0, w1, w0
	str	w0, [sp, 516]
	ldr	x0, [sp, 24]
	ldrh	w5, [x0, 22]
	ldr	x0, [sp, 24]
	ldr	w0, [x0, 24]
	mov	w4, 1
	ldr	w3, [sp, 516]
	mov	w2, 16
	mov	w1, w0
	mov	w0, w5
	bl	new_wav
	str	x0, [sp, 504]
	ldr	x0, [sp, 504]
	cmp	x0, 0
	bne	.L92
	mov	w0, 1
	bl	exit
.L92:
	ldr	x0, [sp, 24]
	add	x0, x0, 44
	str	x0, [sp, 496]
	ldr	x0, [sp, 504]
	add	x0, x0, 44
	str	x0, [sp, 488]
	ldr	x0, [sp, 24]
	ldr	w0, [x0, 40]
	str	w0, [sp, 484]
	str	wzr, [sp, 524]
	b	.L93
.L114:
	ldr	w0, [sp, 524]
	ldr	x1, [sp, 496]
	add	x0, x1, x0
	str	x0, [sp, 40]
	ldr	x0, [sp, 40]
	ldr	d31, [x0]
	str	d31, [sp, 472]
	ldr	d31, [sp, 472]
	str	d31, [sp, 408]
	mov	w0, 3
	strb	w0, [sp, 407]
	ldr	b31, [sp, 407]
	dup	v31.8b, v31.b[0]
	mov	v29.8b, v31.8b
	mov	w0, 112
	strb	w0, [sp, 406]
	ldr	b31, [sp, 406]
	dup	v31.8b, v31.b[0]
	str	d31, [sp, 392]
	ldr	d31, [sp, 408]
	str	d31, [sp, 384]
	ldr	d31, [sp, 384]
	not	v30.8b, v31.8b
	ldr	d31, [sp, 392]
	and	v31.8b, v30.8b, v31.8b
	str	d29, [sp, 376]
	str	d31, [sp, 368]
	ldr	d31, [sp, 376]
	ldr	d30, [sp, 368]
	usra	v31.8b, v30.8b, 4
	str	d31, [sp, 360]
	ldr	d31, [sp, 360]
	sxtl	v31.8h, v31.8b
	str	q31, [sp, 336]
	mov	w0, 15
	strb	w0, [sp, 335]
	ldr	b31, [sp, 335]
	dup	v31.8b, v31.b[0]
	str	d31, [sp, 320]
	ldr	d31, [sp, 408]
	str	d31, [sp, 312]
	ldr	d31, [sp, 312]
	not	v30.8b, v31.8b
	ldr	d31, [sp, 320]
	and	v30.8b, v30.8b, v31.8b
	mov	w0, 16
	strb	w0, [sp, 311]
	ldr	b31, [sp, 311]
	dup	v31.8b, v31.b[0]
	str	d30, [sp, 296]
	str	d31, [sp, 288]
	ldr	d30, [sp, 296]
	ldr	d31, [sp, 288]
	orr	v31.8b, v30.8b, v31.8b
	str	d31, [sp, 280]
	ldr	d31, [sp, 280]
	uxtl	v31.8h, v31.8b
	str	q31, [sp, 256]
	ldr	q31, [sp, 336]
	str	q31, [sp, 240]
	ldr	q31, [sp, 256]
	ldr	q30, [sp, 240]
	ushl	v31.8h, v31.8h, v30.8h
	str	q31, [sp, 224]
	mov	w0, 132
	strh	w0, [sp, 222]
	ldr	h31, [sp, 222]
	dup	v31.8h, v31.h[0]
	mov	v30.16b, v31.16b
	ldr	q31, [sp, 224]
	str	q31, [sp, 192]
	str	q30, [sp, 176]
	ldr	q30, [sp, 192]
	ldr	q31, [sp, 176]
	sub	v31.8h, v30.8h, v31.8h
	str	q31, [sp, 224]
	ldr	d31, [sp, 408]
	str	d31, [sp, 168]
	ldr	d31, [sp, 168]
	not	v31.8b, v31.8b
	str	d31, [sp, 160]
	ldr	d31, [sp, 160]
	sxtl	v31.8h, v31.8b
	str	q31, [sp, 144]
	ldr	q31, [sp, 144]
	sshr	v31.8h, v31.8h, 7
	str	q31, [sp, 128]
	ldr	q31, [sp, 224]
	str	q31, [sp, 112]
	ldr	q31, [sp, 128]
	str	q31, [sp, 96]
	ldr	q30, [sp, 112]
	ldr	q31, [sp, 96]
	eor	v31.16b, v30.16b, v31.16b
	str	q31, [sp, 80]
	ldr	q31, [sp, 128]
	str	q31, [sp, 64]
	ldr	q30, [sp, 80]
	ldr	q31, [sp, 64]
	sub	v31.8h, v30.8h, v31.8h
	str	q31, [sp, 48]
	ldr	q31, [sp, 48]
	str	q31, [sp, 448]
	ldr	w0, [sp, 524]
	lsl	x0, x0, 1
	ldr	x1, [sp, 488]
	add	x0, x1, x0
	str	x0, [sp, 440]
	ldr	q31, [sp, 448]
	str	q31, [sp, 416]
	ldr	q31, [sp, 416]
	ldr	x0, [sp, 440]
	str	q31, [x0]
	nop
	ldr	w0, [sp, 524]
	add	w0, w0, 8
	str	w0, [sp, 524]
.L93:
	ldr	w0, [sp, 524]
	add	w0, w0, 8
	ldr	w1, [sp, 484]
	cmp	w1, w0
	bcs	.L114
	b	.L115
.L117:
	ldr	w0, [sp, 524]
	ldr	x1, [sp, 496]
	add	x0, x1, x0
	ldrb	w2, [x0]
	ldr	w0, [sp, 524]
	lsl	x0, x0, 1
	ldr	x1, [sp, 488]
	add	x0, x1, x0
	mov	w1, w2
	strb	w1, [sp, 39]
	ldrb	w1, [sp, 39]
	mvn	w1, w1
	strb	w1, [sp, 39]
	ldrb	w1, [sp, 39]
	lsr	w1, w1, 4
	and	w1, w1, 255
	and	w1, w1, 7
	strb	w1, [sp, 38]
	ldrb	w1, [sp, 39]
	and	w1, w1, 15
	orr	w2, w1, 16
	ldrb	w1, [sp, 38]
	add	w1, w1, 3
	lsl	w1, w2, w1
	strh	w1, [sp, 36]
	ldrh	w1, [sp, 36]
	sub	w1, w1, #132
	strh	w1, [sp, 36]
	ldrb	w1, [sp, 39]
	sxth	w1, w1
	ubfiz	w1, w1, 8, 8
	sxth	w1, w1
	asr	w1, w1, 15
	strh	w1, [sp, 34]
	ldrsh	w2, [sp, 36]
	ldrh	w1, [sp, 34]
	eor	w1, w2, w1
	sxth	w1, w1
	and	w2, w1, 65535
	ldrh	w1, [sp, 34]
	sub	w1, w2, w1
	and	w1, w1, 65535
	strh	w1, [sp, 32]
	ldrsh	w1, [sp, 32]
	strh	w1, [x0]
	ldr	w0, [sp, 524]
	add	w0, w0, 1
	str	w0, [sp, 524]
.L115:
	ldr	w1, [sp, 524]
	ldr	w0, [sp, 484]
	cmp	w1, w0
	bcc	.L117
	ldr	x0, [sp, 504]
	ldp	x29, x30, [sp]
	add	sp, sp, 528
	.cfi_restore 29
	.cfi_restore 30
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE3985:
	.size	decompress_wav, .-decompress_wav
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
