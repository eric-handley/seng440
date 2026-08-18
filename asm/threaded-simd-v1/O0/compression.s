	.arch armv8-a
	.file	"compression.c"
	.text
	.align	2
	.global	compress_wav_thread
	.type	compress_wav_thread, %function
compress_wav_thread:
.LFB3984:
	.cfi_startproc
	sub	sp, sp, #640
	.cfi_def_cfa_offset 640
	str	x0, [sp, 8]
	ldr	x1, [sp, 8]
	add	x0, sp, 16
	ldp	x2, x3, [x1]
	ldr	x1, [x1, 16]
	stp	x2, x3, [x0]
	str	x1, [x0, 16]
	ldr	x0, [sp, 24]
	str	x0, [sp, 624]
	ldr	x0, [sp, 16]
	str	x0, [sp, 616]
	ldr	w0, [sp, 32]
	str	w0, [sp, 612]
	str	wzr, [sp, 636]
	b	.L2
.L27:
	ldr	w0, [sp, 636]
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
	ldr	w0, [sp, 636]
	ldr	x1, [sp, 616]
	add	x0, x1, x0
	str	x0, [sp, 576]
	ldr	d31, [sp, 584]
	str	d31, [sp, 568]
	ldr	d31, [sp, 568]
	ldr	x0, [sp, 576]
	str	d31, [x0]
	nop
	ldr	w0, [sp, 636]
	add	w0, w0, 8
	str	w0, [sp, 636]
.L2:
	ldr	w0, [sp, 636]
	add	w0, w0, 8
	ldr	w1, [sp, 612]
	cmp	w1, w0
	bcs	.L27
	b	.L28
.L34:
	ldr	w0, [sp, 636]
	lsl	x0, x0, 1
	ldr	x1, [sp, 624]
	add	x0, x1, x0
	ldrsh	w2, [x0]
	ldr	w0, [sp, 636]
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
	beq	.L29
	ldr	w0, [sp, 48]
	clz	w0, w0
	b	.L36
.L29:
	mov	w0, 32
.L36:
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
	ldr	w0, [sp, 636]
	add	w0, w0, 1
	str	w0, [sp, 636]
.L28:
	ldr	w1, [sp, 636]
	ldr	w0, [sp, 612]
	cmp	w1, w0
	bcc	.L34
	mov	x0, 0
	add	sp, sp, 640
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE3984:
	.size	compress_wav_thread, .-compress_wav_thread
	.align	2
	.global	decompress_wav_thread
	.type	decompress_wav_thread, %function
decompress_wav_thread:
.LFB3985:
	.cfi_startproc
	sub	sp, sp, #528
	.cfi_def_cfa_offset 528
	str	x0, [sp, 8]
	ldr	x1, [sp, 8]
	add	x0, sp, 24
	ldp	x2, x3, [x1]
	ldr	x1, [x1, 16]
	stp	x2, x3, [x0]
	str	x1, [x0, 16]
	ldr	x0, [sp, 24]
	str	x0, [sp, 512]
	ldr	x0, [sp, 32]
	str	x0, [sp, 504]
	ldr	w0, [sp, 40]
	str	w0, [sp, 500]
	str	wzr, [sp, 524]
	b	.L38
.L59:
	ldr	w0, [sp, 524]
	ldr	x1, [sp, 512]
	add	x0, x1, x0
	str	x0, [sp, 56]
	ldr	x0, [sp, 56]
	ldr	d31, [x0]
	str	d31, [sp, 488]
	ldr	d31, [sp, 488]
	str	d31, [sp, 424]
	mov	w0, 3
	strb	w0, [sp, 423]
	ldr	b31, [sp, 423]
	dup	v31.8b, v31.b[0]
	mov	v29.8b, v31.8b
	mov	w0, 112
	strb	w0, [sp, 422]
	ldr	b31, [sp, 422]
	dup	v31.8b, v31.b[0]
	str	d31, [sp, 408]
	ldr	d31, [sp, 424]
	str	d31, [sp, 400]
	ldr	d31, [sp, 400]
	not	v30.8b, v31.8b
	ldr	d31, [sp, 408]
	and	v31.8b, v30.8b, v31.8b
	str	d29, [sp, 392]
	str	d31, [sp, 384]
	ldr	d31, [sp, 392]
	ldr	d30, [sp, 384]
	usra	v31.8b, v30.8b, 4
	str	d31, [sp, 376]
	ldr	d31, [sp, 376]
	sxtl	v31.8h, v31.8b
	str	q31, [sp, 352]
	mov	w0, 15
	strb	w0, [sp, 351]
	ldr	b31, [sp, 351]
	dup	v31.8b, v31.b[0]
	str	d31, [sp, 336]
	ldr	d31, [sp, 424]
	str	d31, [sp, 328]
	ldr	d31, [sp, 328]
	not	v30.8b, v31.8b
	ldr	d31, [sp, 336]
	and	v30.8b, v30.8b, v31.8b
	mov	w0, 16
	strb	w0, [sp, 327]
	ldr	b31, [sp, 327]
	dup	v31.8b, v31.b[0]
	str	d30, [sp, 312]
	str	d31, [sp, 304]
	ldr	d30, [sp, 312]
	ldr	d31, [sp, 304]
	orr	v31.8b, v30.8b, v31.8b
	str	d31, [sp, 296]
	ldr	d31, [sp, 296]
	uxtl	v31.8h, v31.8b
	str	q31, [sp, 272]
	ldr	q31, [sp, 352]
	str	q31, [sp, 256]
	ldr	q31, [sp, 272]
	ldr	q30, [sp, 256]
	ushl	v31.8h, v31.8h, v30.8h
	str	q31, [sp, 240]
	mov	w0, 132
	strh	w0, [sp, 238]
	ldr	h31, [sp, 238]
	dup	v31.8h, v31.h[0]
	mov	v30.16b, v31.16b
	ldr	q31, [sp, 240]
	str	q31, [sp, 208]
	str	q30, [sp, 192]
	ldr	q30, [sp, 208]
	ldr	q31, [sp, 192]
	sub	v31.8h, v30.8h, v31.8h
	str	q31, [sp, 240]
	ldr	d31, [sp, 424]
	str	d31, [sp, 184]
	ldr	d31, [sp, 184]
	not	v31.8b, v31.8b
	str	d31, [sp, 176]
	ldr	d31, [sp, 176]
	sxtl	v31.8h, v31.8b
	str	q31, [sp, 160]
	ldr	q31, [sp, 160]
	sshr	v31.8h, v31.8h, 7
	str	q31, [sp, 144]
	ldr	q31, [sp, 240]
	str	q31, [sp, 128]
	ldr	q31, [sp, 144]
	str	q31, [sp, 112]
	ldr	q30, [sp, 128]
	ldr	q31, [sp, 112]
	eor	v31.16b, v30.16b, v31.16b
	str	q31, [sp, 96]
	ldr	q31, [sp, 144]
	str	q31, [sp, 80]
	ldr	q30, [sp, 96]
	ldr	q31, [sp, 80]
	sub	v31.8h, v30.8h, v31.8h
	str	q31, [sp, 64]
	ldr	q31, [sp, 64]
	str	q31, [sp, 464]
	ldr	w0, [sp, 524]
	lsl	x0, x0, 1
	ldr	x1, [sp, 504]
	add	x0, x1, x0
	str	x0, [sp, 456]
	ldr	q31, [sp, 464]
	str	q31, [sp, 432]
	ldr	q31, [sp, 432]
	ldr	x0, [sp, 456]
	str	q31, [x0]
	nop
	ldr	w0, [sp, 524]
	add	w0, w0, 8
	str	w0, [sp, 524]
.L38:
	ldr	w0, [sp, 524]
	add	w0, w0, 8
	ldr	w1, [sp, 500]
	cmp	w1, w0
	bcs	.L59
	b	.L60
.L62:
	ldr	w0, [sp, 524]
	ldr	x1, [sp, 512]
	add	x0, x1, x0
	ldrb	w2, [x0]
	ldr	w0, [sp, 524]
	lsl	x0, x0, 1
	ldr	x1, [sp, 504]
	add	x0, x1, x0
	mov	w1, w2
	strb	w1, [sp, 55]
	ldrb	w1, [sp, 55]
	mvn	w1, w1
	strb	w1, [sp, 55]
	ldrb	w1, [sp, 55]
	lsr	w1, w1, 4
	and	w1, w1, 255
	and	w1, w1, 7
	strb	w1, [sp, 54]
	ldrb	w1, [sp, 55]
	and	w1, w1, 15
	orr	w2, w1, 16
	ldrb	w1, [sp, 54]
	add	w1, w1, 3
	lsl	w1, w2, w1
	strh	w1, [sp, 52]
	ldrh	w1, [sp, 52]
	sub	w1, w1, #132
	strh	w1, [sp, 52]
	ldrb	w1, [sp, 55]
	sxth	w1, w1
	ubfiz	w1, w1, 8, 8
	sxth	w1, w1
	asr	w1, w1, 15
	strh	w1, [sp, 50]
	ldrsh	w2, [sp, 52]
	ldrh	w1, [sp, 50]
	eor	w1, w2, w1
	sxth	w1, w1
	and	w2, w1, 65535
	ldrh	w1, [sp, 50]
	sub	w1, w2, w1
	and	w1, w1, 65535
	strh	w1, [sp, 48]
	ldrsh	w1, [sp, 48]
	strh	w1, [x0]
	ldr	w0, [sp, 524]
	add	w0, w0, 1
	str	w0, [sp, 524]
.L60:
	ldr	w1, [sp, 524]
	ldr	w0, [sp, 500]
	cmp	w1, w0
	bcc	.L62
	mov	x0, 0
	add	sp, sp, 528
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE3985:
	.size	decompress_wav_thread, .-decompress_wav_thread
	.align	2
	.global	compress_wav
	.type	compress_wav, %function
compress_wav:
.LFB3986:
	.cfi_startproc
	stp	x29, x30, [sp, -448]!
	.cfi_def_cfa_offset 448
	.cfi_offset 29, -448
	.cfi_offset 30, -440
	mov	x29, sp
	str	x0, [sp, 24]
	ldr	x0, [sp, 24]
	ldrh	w0, [x0, 32]
	strh	w0, [sp, 438]
	ldr	x0, [sp, 24]
	ldr	w1, [x0, 40]
	ldrh	w0, [sp, 438]
	udiv	w0, w1, w0
	str	w0, [sp, 432]
	ldr	x0, [sp, 24]
	ldrh	w5, [x0, 22]
	ldr	x0, [sp, 24]
	ldr	w0, [x0, 24]
	mov	w4, 7
	ldr	w3, [sp, 432]
	mov	w2, 8
	mov	w1, w0
	mov	w0, w5
	bl	new_wav
	str	x0, [sp, 424]
	ldr	x0, [sp, 424]
	cmp	x0, 0
	bne	.L65
	mov	w0, 1
	bl	exit
.L65:
	ldr	x0, [sp, 24]
	add	x0, x0, 44
	str	x0, [sp, 416]
	ldr	x0, [sp, 424]
	add	x0, x0, 44
	str	x0, [sp, 408]
	ldr	x0, [sp, 24]
	ldr	w0, [x0, 40]
	lsr	w0, w0, 1
	str	w0, [sp, 404]
	ldr	w0, [sp, 404]
	lsr	w0, w0, 2
	str	w0, [sp, 400]
	strb	wzr, [sp, 447]
	b	.L66
.L69:
	ldrb	w1, [sp, 447]
	ldr	w0, [sp, 400]
	mul	w0, w1, w0
	uxtw	x0, w0
	ldrb	w3, [sp, 447]
	ldr	x1, [sp, 408]
	add	x2, x1, x0
	sxtw	x1, w3
	mov	x0, x1
	lsl	x0, x0, 1
	add	x0, x0, x1
	lsl	x0, x0, 3
	add	x1, sp, 232
	str	x2, [x1, x0]
	ldrb	w1, [sp, 447]
	ldr	w0, [sp, 400]
	mul	w0, w1, w0
	uxtw	x0, w0
	lsl	x0, x0, 1
	ldrb	w3, [sp, 447]
	ldr	x1, [sp, 416]
	add	x2, x1, x0
	sxtw	x1, w3
	mov	x0, x1
	lsl	x0, x0, 1
	add	x0, x0, x1
	lsl	x0, x0, 3
	add	x1, sp, 240
	str	x2, [x1, x0]
	ldrb	w0, [sp, 447]
	sxtw	x1, w0
	mov	x0, x1
	lsl	x0, x0, 1
	add	x0, x0, x1
	lsl	x0, x0, 3
	add	x1, sp, 248
	ldr	w2, [sp, 400]
	str	w2, [x1, x0]
	add	x0, sp, 40
	bl	pthread_attr_init
	add	x0, sp, 104
	movi	v31.4s, 0
	str	q31, [x0]
	str	q31, [x0, 16]
	str	q31, [x0, 32]
	str	q31, [x0, 48]
	str	q31, [x0, 64]
	str	q31, [x0, 80]
	str	q31, [x0, 96]
	str	q31, [x0, 112]
	ldrb	w0, [sp, 447]
	str	x0, [sp, 384]
	ldr	x0, [sp, 384]
	cmp	x0, 1023
	bhi	.L68
	ldr	x0, [sp, 384]
	lsr	x0, x0, 6
	lsl	x1, x0, 3
	add	x2, sp, 104
	add	x1, x2, x1
	ldr	x2, [x1]
	ldr	x1, [sp, 384]
	and	w1, w1, 63
	mov	x3, 1
	lsl	x1, x3, x1
	lsl	x0, x0, 3
	add	x3, sp, 104
	add	x0, x3, x0
	orr	x1, x2, x1
	str	x1, [x0]
.L68:
	add	x1, sp, 104
	add	x0, sp, 40
	mov	x2, x1
	mov	x1, 128
	bl	pthread_attr_setaffinity_np
	ldrb	w0, [sp, 447]
	add	x1, sp, 328
	sxtw	x0, w0
	lsl	x0, x0, 3
	add	x4, x1, x0
	ldrb	w0, [sp, 447]
	add	x2, sp, 232
	sxtw	x1, w0
	mov	x0, x1
	lsl	x0, x0, 1
	add	x0, x0, x1
	lsl	x0, x0, 3
	add	x0, x2, x0
	add	x1, sp, 40
	mov	x3, x0
	adrp	x0, compress_wav_thread
	add	x2, x0, :lo12:compress_wav_thread
	mov	x0, x4
	bl	pthread_create
	add	x0, sp, 40
	bl	pthread_attr_destroy
	ldrb	w0, [sp, 447]
	add	w0, w0, 1
	strb	w0, [sp, 447]
.L66:
	ldrb	w0, [sp, 447]
	cmp	w0, 3
	bls	.L69
	strb	wzr, [sp, 446]
	b	.L70
.L71:
	ldrb	w1, [sp, 446]
	add	x0, sp, 456
	sub	x0, x0, #128
	sxtw	x1, w1
	ldr	x0, [x0, x1, lsl 3]
	mov	x1, 0
	bl	pthread_join
	ldrb	w0, [sp, 446]
	add	w0, w0, 1
	strb	w0, [sp, 446]
.L70:
	ldrb	w0, [sp, 446]
	cmp	w0, 3
	bls	.L71
	ldr	w0, [sp, 404]
	and	w0, w0, 3
	str	w0, [sp, 396]
	ldr	w1, [sp, 404]
	ldr	w0, [sp, 396]
	sub	w0, w1, w0
	str	w0, [sp, 440]
	b	.L72
.L78:
	ldr	w0, [sp, 440]
	lsl	x0, x0, 1
	ldr	x1, [sp, 416]
	add	x0, x1, x0
	ldrsh	w2, [x0]
	ldr	w0, [sp, 440]
	ldr	x1, [sp, 408]
	add	x1, x1, x0
	mov	w0, w2
	strh	w0, [sp, 382]
	ldrsh	w0, [sp, 382]
	asr	w0, w0, 15
	strh	w0, [sp, 380]
	ldrh	w2, [sp, 382]
	ldrh	w0, [sp, 380]
	add	w0, w2, w0
	and	w0, w0, 65535
	sxth	w2, w0
	ldrh	w0, [sp, 380]
	eor	w0, w2, w0
	sxth	w0, w0
	strh	w0, [sp, 378]
	ldrh	w0, [sp, 382]
	and	w0, w0, -32768
	strh	w0, [sp, 376]
	ldrh	w0, [sp, 378]
	add	w0, w0, 132
	strh	w0, [sp, 378]
	ldrsh	w0, [sp, 378]
	asr	w0, w0, 15
	sxth	w0, w0
	strh	w0, [sp, 374]
	ldrsh	w0, [sp, 374]
	mvn	w0, w0
	sxth	w2, w0
	ldrsh	w0, [sp, 378]
	and	w0, w2, w0
	sxth	w2, w0
	ldrsh	w0, [sp, 374]
	and	w0, w0, 32767
	sxth	w0, w0
	orr	w0, w2, w0
	sxth	w0, w0
	strh	w0, [sp, 378]
	ldrh	w0, [sp, 378]
	strh	w0, [sp, 372]
	ldrh	w0, [sp, 372]
	str	w0, [sp, 368]
	ldr	w0, [sp, 368]
	cmp	w0, 0
	beq	.L73
	ldr	w0, [sp, 368]
	clz	w0, w0
	b	.L80
.L73:
	mov	w0, 32
.L80:
	sub	w0, w0, #16
	and	w0, w0, 255
	sub	w0, w0, #1
	strb	w0, [sp, 367]
	ldrb	w0, [sp, 367]
	mov	w2, 7
	sub	w0, w2, w0
	strb	w0, [sp, 366]
	ldrb	w0, [sp, 366]
	ubfiz	w0, w0, 4, 4
	strb	w0, [sp, 365]
	ldrh	w0, [sp, 376]
	lsr	w0, w0, 8
	and	w0, w0, 65535
	and	w2, w0, 255
	ldrb	w0, [sp, 365]
	orr	w0, w2, w0
	and	w0, w0, 255
	sxtb	w2, w0
	ldrh	w3, [sp, 378]
	ldrb	w0, [sp, 367]
	mov	w4, 10
	sub	w0, w4, w0
	asr	w0, w3, w0
	sxtb	w0, w0
	and	w0, w0, 15
	sxtb	w0, w0
	orr	w0, w2, w0
	sxtb	w0, w0
	strb	w0, [sp, 364]
	ldrb	w0, [sp, 364]
	mvn	w0, w0
	and	w0, w0, 255
	strb	w0, [x1]
	ldr	w0, [sp, 440]
	add	w0, w0, 1
	str	w0, [sp, 440]
.L72:
	ldr	w1, [sp, 440]
	ldr	w0, [sp, 404]
	cmp	w1, w0
	bcc	.L78
	ldr	x0, [sp, 424]
	ldp	x29, x30, [sp], 448
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE3986:
	.size	compress_wav, .-compress_wav
	.align	2
	.global	decompress_wav
	.type	decompress_wav, %function
decompress_wav:
.LFB3987:
	.cfi_startproc
	stp	x29, x30, [sp, -432]!
	.cfi_def_cfa_offset 432
	.cfi_offset 29, -432
	.cfi_offset 30, -424
	mov	x29, sp
	str	x0, [sp, 24]
	ldr	x0, [sp, 24]
	ldrh	w0, [x0, 32]
	strh	w0, [sp, 422]
	ldr	x0, [sp, 24]
	ldr	w1, [x0, 40]
	ldrh	w0, [sp, 422]
	udiv	w0, w1, w0
	str	w0, [sp, 416]
	ldr	x0, [sp, 24]
	ldrh	w5, [x0, 22]
	ldr	x0, [sp, 24]
	ldr	w0, [x0, 24]
	mov	w4, 1
	ldr	w3, [sp, 416]
	mov	w2, 16
	mov	w1, w0
	mov	w0, w5
	bl	new_wav
	str	x0, [sp, 408]
	ldr	x0, [sp, 408]
	cmp	x0, 0
	bne	.L82
	mov	w0, 1
	bl	exit
.L82:
	ldr	x0, [sp, 24]
	add	x0, x0, 44
	str	x0, [sp, 400]
	ldr	x0, [sp, 408]
	add	x0, x0, 44
	str	x0, [sp, 392]
	ldr	x0, [sp, 24]
	ldr	w0, [x0, 40]
	str	w0, [sp, 388]
	ldr	w0, [sp, 388]
	lsr	w0, w0, 2
	str	w0, [sp, 384]
	strb	wzr, [sp, 431]
	b	.L83
.L86:
	ldrb	w1, [sp, 431]
	ldr	w0, [sp, 384]
	mul	w0, w1, w0
	uxtw	x0, w0
	ldrb	w3, [sp, 431]
	ldr	x1, [sp, 400]
	add	x2, x1, x0
	sxtw	x1, w3
	mov	x0, x1
	lsl	x0, x0, 1
	add	x0, x0, x1
	lsl	x0, x0, 3
	add	x1, sp, 232
	str	x2, [x1, x0]
	ldrb	w1, [sp, 431]
	ldr	w0, [sp, 384]
	mul	w0, w1, w0
	uxtw	x0, w0
	lsl	x0, x0, 1
	ldrb	w3, [sp, 431]
	ldr	x1, [sp, 392]
	add	x2, x1, x0
	sxtw	x1, w3
	mov	x0, x1
	lsl	x0, x0, 1
	add	x0, x0, x1
	lsl	x0, x0, 3
	add	x1, sp, 240
	str	x2, [x1, x0]
	ldrb	w0, [sp, 431]
	sxtw	x1, w0
	mov	x0, x1
	lsl	x0, x0, 1
	add	x0, x0, x1
	lsl	x0, x0, 3
	add	x1, sp, 248
	ldr	w2, [sp, 384]
	str	w2, [x1, x0]
	add	x0, sp, 40
	bl	pthread_attr_init
	add	x0, sp, 104
	movi	v31.4s, 0
	str	q31, [x0]
	str	q31, [x0, 16]
	str	q31, [x0, 32]
	str	q31, [x0, 48]
	str	q31, [x0, 64]
	str	q31, [x0, 80]
	str	q31, [x0, 96]
	str	q31, [x0, 112]
	ldrb	w0, [sp, 431]
	str	x0, [sp, 368]
	ldr	x0, [sp, 368]
	cmp	x0, 1023
	bhi	.L85
	ldr	x0, [sp, 368]
	lsr	x0, x0, 6
	lsl	x1, x0, 3
	add	x2, sp, 104
	add	x1, x2, x1
	ldr	x2, [x1]
	ldr	x1, [sp, 368]
	and	w1, w1, 63
	mov	x3, 1
	lsl	x1, x3, x1
	lsl	x0, x0, 3
	add	x3, sp, 104
	add	x0, x3, x0
	orr	x1, x2, x1
	str	x1, [x0]
.L85:
	add	x1, sp, 104
	add	x0, sp, 40
	mov	x2, x1
	mov	x1, 128
	bl	pthread_attr_setaffinity_np
	ldrb	w0, [sp, 431]
	add	x1, sp, 328
	sxtw	x0, w0
	lsl	x0, x0, 3
	add	x4, x1, x0
	ldrb	w0, [sp, 431]
	add	x2, sp, 232
	sxtw	x1, w0
	mov	x0, x1
	lsl	x0, x0, 1
	add	x0, x0, x1
	lsl	x0, x0, 3
	add	x0, x2, x0
	add	x1, sp, 40
	mov	x3, x0
	adrp	x0, decompress_wav_thread
	add	x2, x0, :lo12:decompress_wav_thread
	mov	x0, x4
	bl	pthread_create
	add	x0, sp, 40
	bl	pthread_attr_destroy
	ldrb	w0, [sp, 431]
	add	w0, w0, 1
	strb	w0, [sp, 431]
.L83:
	ldrb	w0, [sp, 431]
	cmp	w0, 3
	bls	.L86
	strb	wzr, [sp, 430]
	b	.L87
.L88:
	ldrb	w1, [sp, 430]
	add	x0, sp, 440
	sub	x0, x0, #112
	sxtw	x1, w1
	ldr	x0, [x0, x1, lsl 3]
	mov	x1, 0
	bl	pthread_join
	ldrb	w0, [sp, 430]
	add	w0, w0, 1
	strb	w0, [sp, 430]
.L87:
	ldrb	w0, [sp, 430]
	cmp	w0, 3
	bls	.L88
	ldr	w0, [sp, 388]
	and	w0, w0, 3
	str	w0, [sp, 380]
	ldr	w1, [sp, 388]
	ldr	w0, [sp, 380]
	sub	w0, w1, w0
	str	w0, [sp, 424]
	b	.L89
.L91:
	ldr	w0, [sp, 424]
	ldr	x1, [sp, 400]
	add	x0, x1, x0
	ldrb	w2, [x0]
	ldr	w0, [sp, 424]
	lsl	x0, x0, 1
	ldr	x1, [sp, 392]
	add	x0, x1, x0
	mov	w1, w2
	strb	w1, [sp, 367]
	ldrb	w1, [sp, 367]
	mvn	w1, w1
	strb	w1, [sp, 367]
	ldrb	w1, [sp, 367]
	lsr	w1, w1, 4
	and	w1, w1, 255
	and	w1, w1, 7
	strb	w1, [sp, 366]
	ldrb	w1, [sp, 367]
	and	w1, w1, 15
	orr	w2, w1, 16
	ldrb	w1, [sp, 366]
	add	w1, w1, 3
	lsl	w1, w2, w1
	strh	w1, [sp, 364]
	ldrh	w1, [sp, 364]
	sub	w1, w1, #132
	strh	w1, [sp, 364]
	ldrb	w1, [sp, 367]
	sxth	w1, w1
	ubfiz	w1, w1, 8, 8
	sxth	w1, w1
	asr	w1, w1, 15
	strh	w1, [sp, 362]
	ldrsh	w2, [sp, 364]
	ldrh	w1, [sp, 362]
	eor	w1, w2, w1
	sxth	w1, w1
	and	w2, w1, 65535
	ldrh	w1, [sp, 362]
	sub	w1, w2, w1
	and	w1, w1, 65535
	strh	w1, [sp, 360]
	ldrsh	w1, [sp, 360]
	strh	w1, [x0]
	ldr	w0, [sp, 424]
	add	w0, w0, 1
	str	w0, [sp, 424]
.L89:
	ldr	w1, [sp, 424]
	ldr	w0, [sp, 388]
	cmp	w1, w0
	bcc	.L91
	ldr	x0, [sp, 408]
	ldp	x29, x30, [sp], 432
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE3987:
	.size	decompress_wav, .-decompress_wav
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
