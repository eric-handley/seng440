	.arch armv8-a
	.file	"compression.c"
	.text
	.align	2
	.global	compress_wav_thread
	.type	compress_wav_thread, %function
compress_wav_thread:
.LFB3984:
	.cfi_startproc
	sub	sp, sp, #1136
	.cfi_def_cfa_offset 1136
	str	x0, [sp, 8]
	ldr	x1, [sp, 8]
	add	x0, sp, 16
	ldp	x2, x3, [x1]
	ldr	x1, [x1, 16]
	stp	x2, x3, [x0]
	str	x1, [x0, 16]
	ldr	x0, [sp, 24]
	str	x0, [sp, 1120]
	ldr	x0, [sp, 16]
	str	x0, [sp, 1112]
	ldr	w0, [sp, 32]
	str	w0, [sp, 1108]
	str	wzr, [sp, 1132]
	b	.L2
.L49:
	ldr	w0, [sp, 1132]
	lsl	x0, x0, 1
	ldr	x1, [sp, 1120]
	add	x0, x1, x0
	str	x0, [sp, 40]
	ldr	x0, [sp, 40]
	ldr	q31, [x0]
	str	q31, [sp, 1088]
	ldr	w0, [sp, 1132]
	add	w0, w0, 8
	uxtw	x0, w0
	lsl	x0, x0, 1
	ldr	x1, [sp, 1120]
	add	x0, x1, x0
	str	x0, [sp, 48]
	ldr	x0, [sp, 48]
	ldr	q31, [x0]
	str	q31, [sp, 1072]
	mov	w0, 132
	strh	w0, [sp, 62]
	ldr	h31, [sp, 62]
	dup	v31.8h, v31.h[0]
	str	q31, [sp, 1056]
	ldr	q31, [sp, 1088]
	str	q31, [sp, 64]
	ldr	q31, [sp, 64]
	abs	v31.8h, v31.8h
	str	q31, [sp, 1040]
	ldr	q31, [sp, 1072]
	str	q31, [sp, 80]
	ldr	q31, [sp, 80]
	abs	v31.8h, v31.8h
	str	q31, [sp, 1024]
	ldr	q31, [sp, 1088]
	str	q31, [sp, 96]
	ldr	q31, [sp, 96]
	shrn	v30.8b, v31.8h, 8
	mov	w0, -128
	strb	w0, [sp, 127]
	ldr	b31, [sp, 127]
	dup	v31.8b, v31.b[0]
	str	d30, [sp, 136]
	str	d31, [sp, 128]
	ldr	d30, [sp, 136]
	ldr	d31, [sp, 128]
	and	v31.8b, v30.8b, v31.8b
	str	d31, [sp, 1016]
	ldr	q31, [sp, 1072]
	str	q31, [sp, 144]
	ldr	q31, [sp, 144]
	shrn	v30.8b, v31.8h, 8
	mov	w0, -128
	strb	w0, [sp, 175]
	ldr	b31, [sp, 175]
	dup	v31.8b, v31.b[0]
	str	d30, [sp, 184]
	str	d31, [sp, 176]
	ldr	d30, [sp, 184]
	ldr	d31, [sp, 176]
	and	v31.8b, v30.8b, v31.8b
	str	d31, [sp, 1008]
	ldr	q31, [sp, 1040]
	str	q31, [sp, 208]
	ldr	q31, [sp, 1056]
	str	q31, [sp, 192]
	ldr	q30, [sp, 208]
	ldr	q31, [sp, 192]
	add	v31.8h, v30.8h, v31.8h
	str	q31, [sp, 1040]
	ldr	q31, [sp, 1024]
	str	q31, [sp, 240]
	ldr	q31, [sp, 1056]
	str	q31, [sp, 224]
	ldr	q30, [sp, 240]
	ldr	q31, [sp, 224]
	add	v31.8h, v30.8h, v31.8h
	str	q31, [sp, 1024]
	mov	w0, 32767
	strh	w0, [sp, 270]
	ldr	h31, [sp, 270]
	dup	v31.8h, v31.h[0]
	mov	v30.16b, v31.16b
	ldr	q31, [sp, 1040]
	str	q31, [sp, 288]
	str	q30, [sp, 272]
	ldr	q30, [sp, 288]
	ldr	q31, [sp, 272]
	umin	v31.8h, v30.8h, v31.8h
	str	q31, [sp, 1040]
	mov	w0, 32767
	strh	w0, [sp, 318]
	ldr	h31, [sp, 318]
	dup	v31.8h, v31.h[0]
	mov	v30.16b, v31.16b
	ldr	q31, [sp, 1024]
	str	q31, [sp, 336]
	str	q30, [sp, 320]
	ldr	q30, [sp, 336]
	ldr	q31, [sp, 320]
	umin	v31.8h, v30.8h, v31.8h
	str	q31, [sp, 1024]
	ldr	q31, [sp, 1040]
	str	q31, [sp, 352]
	ldr	q31, [sp, 352]
	clz	v31.8h, v31.8h
	str	q31, [sp, 992]
	ldr	q31, [sp, 1024]
	str	q31, [sp, 368]
	ldr	q31, [sp, 368]
	clz	v31.8h, v31.8h
	str	q31, [sp, 976]
	ldr	q31, [sp, 992]
	str	q31, [sp, 384]
	ldr	q31, [sp, 384]
	xtn	v31.8b, v31.8h
	str	d31, [sp, 968]
	ldr	q31, [sp, 976]
	str	q31, [sp, 400]
	ldr	q31, [sp, 400]
	xtn	v31.8b, v31.8h
	str	d31, [sp, 960]
	ldr	q30, [sp, 992]
	mov	w0, 11
	strh	w0, [sp, 430]
	ldr	h31, [sp, 430]
	dup	v31.8h, v31.h[0]
	str	q30, [sp, 448]
	str	q31, [sp, 432]
	ldr	q30, [sp, 448]
	ldr	q31, [sp, 432]
	sub	v31.8h, v30.8h, v31.8h
	str	q31, [sp, 944]
	ldr	q30, [sp, 976]
	mov	w0, 11
	strh	w0, [sp, 478]
	ldr	h31, [sp, 478]
	dup	v31.8h, v31.h[0]
	str	q30, [sp, 496]
	str	q31, [sp, 480]
	ldr	q30, [sp, 496]
	ldr	q31, [sp, 480]
	sub	v31.8h, v30.8h, v31.8h
	str	q31, [sp, 928]
	mov	w0, 8
	strb	w0, [sp, 519]
	ldr	b31, [sp, 519]
	dup	v31.8b, v31.b[0]
	str	d31, [sp, 528]
	ldr	d31, [sp, 968]
	str	d31, [sp, 520]
	ldr	d30, [sp, 528]
	ldr	d31, [sp, 520]
	sub	v31.8b, v30.8b, v31.8b
	str	d31, [sp, 920]
	mov	w0, 8
	strb	w0, [sp, 543]
	ldr	b31, [sp, 543]
	dup	v31.8b, v31.b[0]
	str	d31, [sp, 552]
	ldr	d31, [sp, 960]
	str	d31, [sp, 544]
	ldr	d30, [sp, 552]
	ldr	d31, [sp, 544]
	sub	v31.8b, v30.8b, v31.8b
	str	d31, [sp, 912]
	ldr	d31, [sp, 920]
	str	d31, [sp, 560]
	ldr	d31, [sp, 560]
	shl	v31.8b, v31.8b, 4
	str	d31, [sp, 904]
	ldr	d31, [sp, 912]
	str	d31, [sp, 568]
	ldr	d31, [sp, 568]
	shl	v31.8b, v31.8b, 4
	str	d31, [sp, 896]
	ldr	d31, [sp, 904]
	str	d31, [sp, 584]
	ldr	d31, [sp, 1016]
	str	d31, [sp, 576]
	ldr	d30, [sp, 584]
	ldr	d31, [sp, 576]
	orr	v29.8b, v30.8b, v31.8b
	ldr	q31, [sp, 1040]
	str	q31, [sp, 608]
	ldr	q31, [sp, 944]
	str	q31, [sp, 592]
	ldr	q31, [sp, 608]
	ldr	q30, [sp, 592]
	ushl	v31.8h, v31.8h, v30.8h
	str	q31, [sp, 624]
	ldr	q31, [sp, 624]
	xtn	v30.8b, v31.8h
	mov	w0, 15
	strb	w0, [sp, 655]
	ldr	b31, [sp, 655]
	dup	v31.8b, v31.b[0]
	str	d30, [sp, 664]
	str	d31, [sp, 656]
	ldr	d30, [sp, 664]
	ldr	d31, [sp, 656]
	and	v31.8b, v30.8b, v31.8b
	str	d29, [sp, 680]
	str	d31, [sp, 672]
	ldr	d30, [sp, 680]
	ldr	d31, [sp, 672]
	orr	v31.8b, v30.8b, v31.8b
	str	d31, [sp, 888]
	ldr	d31, [sp, 896]
	str	d31, [sp, 696]
	ldr	d31, [sp, 1008]
	str	d31, [sp, 688]
	ldr	d30, [sp, 696]
	ldr	d31, [sp, 688]
	orr	v29.8b, v30.8b, v31.8b
	ldr	q31, [sp, 1024]
	str	q31, [sp, 720]
	ldr	q31, [sp, 928]
	str	q31, [sp, 704]
	ldr	q31, [sp, 720]
	ldr	q30, [sp, 704]
	ushl	v31.8h, v31.8h, v30.8h
	str	q31, [sp, 736]
	ldr	q31, [sp, 736]
	xtn	v30.8b, v31.8h
	mov	w0, 15
	strb	w0, [sp, 767]
	ldr	b31, [sp, 767]
	dup	v31.8b, v31.b[0]
	str	d30, [sp, 776]
	str	d31, [sp, 768]
	ldr	d30, [sp, 776]
	ldr	d31, [sp, 768]
	and	v31.8b, v30.8b, v31.8b
	str	d29, [sp, 792]
	str	d31, [sp, 784]
	ldr	d30, [sp, 792]
	ldr	d31, [sp, 784]
	orr	v31.8b, v30.8b, v31.8b
	str	d31, [sp, 880]
	ldr	d31, [sp, 888]
	str	d31, [sp, 800]
	ldr	d31, [sp, 800]
	not	v31.8b, v31.8b
	str	d31, [sp, 872]
	ldr	d31, [sp, 880]
	str	d31, [sp, 808]
	ldr	d31, [sp, 808]
	not	v31.8b, v31.8b
	str	d31, [sp, 864]
	ldr	w0, [sp, 1132]
	ldr	x1, [sp, 1112]
	add	x1, x1, x0
	ldr	d31, [sp, 872]
	str	d31, [sp, 824]
	ldr	d31, [sp, 864]
	str	d31, [sp, 816]
	ldr	d31, [sp, 824]
	add	x0, sp, 816
	ld1	{v31.d}[1], [x0]
	str	x1, [sp, 856]
	str	q31, [sp, 832]
	ldr	q31, [sp, 832]
	ldr	x0, [sp, 856]
	str	q31, [x0]
	nop
	ldr	w0, [sp, 1132]
	add	w0, w0, 16
	str	w0, [sp, 1132]
.L2:
	ldr	w0, [sp, 1132]
	add	w0, w0, 16
	ldr	w1, [sp, 1108]
	cmp	w1, w0
	bcs	.L49
	mov	x0, 0
	add	sp, sp, 1136
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
	sub	sp, sp, #512
	.cfi_def_cfa_offset 512
	str	x0, [sp, 8]
	ldr	x1, [sp, 8]
	add	x0, sp, 16
	ldp	x2, x3, [x1]
	ldr	x1, [x1, 16]
	stp	x2, x3, [x0]
	str	x1, [x0, 16]
	ldr	x0, [sp, 16]
	str	x0, [sp, 496]
	ldr	x0, [sp, 24]
	str	x0, [sp, 488]
	ldr	w0, [sp, 32]
	str	w0, [sp, 484]
	str	wzr, [sp, 508]
	b	.L52
.L73:
	ldr	w0, [sp, 508]
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
	ldr	w0, [sp, 508]
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
	ldr	w0, [sp, 508]
	add	w0, w0, 8
	str	w0, [sp, 508]
.L52:
	ldr	w0, [sp, 508]
	add	w0, w0, 8
	ldr	w1, [sp, 484]
	cmp	w1, w0
	bcs	.L73
	mov	x0, 0
	add	sp, sp, 512
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
	stp	x29, x30, [sp, -464]!
	.cfi_def_cfa_offset 464
	.cfi_offset 29, -464
	.cfi_offset 30, -456
	mov	x29, sp
	str	x0, [sp, 24]
	ldr	x0, [sp, 24]
	ldrh	w0, [x0, 32]
	strh	w0, [sp, 450]
	ldr	x0, [sp, 24]
	ldr	w1, [x0, 40]
	ldrh	w0, [sp, 450]
	udiv	w0, w1, w0
	str	w0, [sp, 444]
	ldr	x0, [sp, 24]
	ldrh	w5, [x0, 22]
	ldr	x0, [sp, 24]
	ldr	w0, [x0, 24]
	mov	w4, 7
	ldr	w3, [sp, 444]
	mov	w2, 8
	mov	w1, w0
	mov	w0, w5
	bl	new_wav
	str	x0, [sp, 432]
	ldr	x0, [sp, 432]
	cmp	x0, 0
	bne	.L76
	mov	w0, 1
	bl	exit
.L76:
	ldr	x0, [sp, 24]
	add	x0, x0, 44
	str	x0, [sp, 424]
	ldr	x0, [sp, 432]
	add	x0, x0, 44
	str	x0, [sp, 416]
	ldr	x0, [sp, 24]
	ldr	w0, [x0, 40]
	lsr	w0, w0, 1
	str	w0, [sp, 412]
	ldr	w0, [sp, 412]
	lsr	w0, w0, 4
	str	w0, [sp, 408]
	ldr	w0, [sp, 408]
	lsr	w0, w0, 2
	str	w0, [sp, 404]
	ldr	w0, [sp, 408]
	and	w0, w0, 3
	str	w0, [sp, 400]
	str	wzr, [sp, 460]
	strb	wzr, [sp, 459]
	b	.L77
.L82:
	ldrb	w0, [sp, 459]
	ldr	w1, [sp, 400]
	cmp	w1, w0
	bls	.L78
	mov	w0, 1
	b	.L79
.L78:
	mov	w0, 0
.L79:
	ldr	w1, [sp, 404]
	add	w0, w0, w1
	lsl	w0, w0, 4
	str	w0, [sp, 396]
	ldr	w0, [sp, 460]
	ldrb	w3, [sp, 459]
	ldr	x1, [sp, 416]
	add	x2, x1, x0
	sxtw	x1, w3
	mov	x0, x1
	lsl	x0, x0, 1
	add	x0, x0, x1
	lsl	x0, x0, 3
	add	x1, sp, 232
	str	x2, [x1, x0]
	ldr	w0, [sp, 460]
	lsl	x0, x0, 1
	ldrb	w3, [sp, 459]
	ldr	x1, [sp, 424]
	add	x2, x1, x0
	sxtw	x1, w3
	mov	x0, x1
	lsl	x0, x0, 1
	add	x0, x0, x1
	lsl	x0, x0, 3
	add	x1, sp, 240
	str	x2, [x1, x0]
	ldrb	w0, [sp, 459]
	sxtw	x1, w0
	mov	x0, x1
	lsl	x0, x0, 1
	add	x0, x0, x1
	lsl	x0, x0, 3
	add	x1, sp, 248
	ldr	w2, [sp, 396]
	str	w2, [x1, x0]
	ldr	w1, [sp, 460]
	ldr	w0, [sp, 396]
	add	w0, w1, w0
	str	w0, [sp, 460]
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
	ldrb	w0, [sp, 459]
	str	x0, [sp, 384]
	ldr	x0, [sp, 384]
	cmp	x0, 1023
	bhi	.L81
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
.L81:
	add	x1, sp, 104
	add	x0, sp, 40
	mov	x2, x1
	mov	x1, 128
	bl	pthread_attr_setaffinity_np
	ldrb	w0, [sp, 459]
	add	x1, sp, 328
	sxtw	x0, w0
	lsl	x0, x0, 3
	add	x4, x1, x0
	ldrb	w0, [sp, 459]
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
	ldrb	w0, [sp, 459]
	add	w0, w0, 1
	strb	w0, [sp, 459]
.L77:
	ldrb	w0, [sp, 459]
	cmp	w0, 3
	bls	.L82
	strb	wzr, [sp, 458]
	b	.L83
.L84:
	ldrb	w1, [sp, 458]
	add	x0, sp, 472
	sub	x0, x0, #144
	sxtw	x1, w1
	ldr	x0, [x0, x1, lsl 3]
	mov	x1, 0
	bl	pthread_join
	ldrb	w0, [sp, 458]
	add	w0, w0, 1
	strb	w0, [sp, 458]
.L83:
	ldrb	w0, [sp, 458]
	cmp	w0, 3
	bls	.L84
	ldr	w0, [sp, 460]
	str	w0, [sp, 452]
	b	.L85
.L91:
	ldr	w0, [sp, 452]
	lsl	x0, x0, 1
	ldr	x1, [sp, 424]
	add	x0, x1, x0
	ldrsh	w2, [x0]
	ldr	w0, [sp, 452]
	ldr	x1, [sp, 416]
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
	beq	.L86
	ldr	w0, [sp, 368]
	clz	w0, w0
	b	.L93
.L86:
	mov	w0, 32
.L93:
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
	ldr	w0, [sp, 452]
	add	w0, w0, 1
	str	w0, [sp, 452]
.L85:
	ldr	w1, [sp, 452]
	ldr	w0, [sp, 412]
	cmp	w1, w0
	bcc	.L91
	ldr	x0, [sp, 432]
	ldp	x29, x30, [sp], 464
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
	stp	x29, x30, [sp, -448]!
	.cfi_def_cfa_offset 448
	.cfi_offset 29, -448
	.cfi_offset 30, -440
	mov	x29, sp
	str	x0, [sp, 24]
	ldr	x0, [sp, 24]
	ldrh	w0, [x0, 32]
	strh	w0, [sp, 434]
	ldr	x0, [sp, 24]
	ldr	w1, [x0, 40]
	ldrh	w0, [sp, 434]
	udiv	w0, w1, w0
	str	w0, [sp, 428]
	ldr	x0, [sp, 24]
	ldrh	w5, [x0, 22]
	ldr	x0, [sp, 24]
	ldr	w0, [x0, 24]
	mov	w4, 1
	ldr	w3, [sp, 428]
	mov	w2, 16
	mov	w1, w0
	mov	w0, w5
	bl	new_wav
	str	x0, [sp, 416]
	ldr	x0, [sp, 416]
	cmp	x0, 0
	bne	.L95
	mov	w0, 1
	bl	exit
.L95:
	ldr	x0, [sp, 24]
	add	x0, x0, 44
	str	x0, [sp, 408]
	ldr	x0, [sp, 416]
	add	x0, x0, 44
	str	x0, [sp, 400]
	ldr	x0, [sp, 24]
	ldr	w0, [x0, 40]
	str	w0, [sp, 396]
	ldr	w0, [sp, 396]
	lsr	w0, w0, 3
	str	w0, [sp, 392]
	ldr	w0, [sp, 392]
	lsr	w0, w0, 2
	str	w0, [sp, 388]
	ldr	w0, [sp, 392]
	and	w0, w0, 3
	str	w0, [sp, 384]
	str	wzr, [sp, 444]
	strb	wzr, [sp, 443]
	b	.L96
.L101:
	ldrb	w0, [sp, 443]
	ldr	w1, [sp, 384]
	cmp	w1, w0
	bls	.L97
	mov	w0, 1
	b	.L98
.L97:
	mov	w0, 0
.L98:
	ldr	w1, [sp, 388]
	add	w0, w0, w1
	lsl	w0, w0, 3
	str	w0, [sp, 380]
	ldr	w0, [sp, 444]
	ldrb	w3, [sp, 443]
	ldr	x1, [sp, 408]
	add	x2, x1, x0
	sxtw	x1, w3
	mov	x0, x1
	lsl	x0, x0, 1
	add	x0, x0, x1
	lsl	x0, x0, 3
	add	x1, sp, 232
	str	x2, [x1, x0]
	ldr	w0, [sp, 444]
	lsl	x0, x0, 1
	ldrb	w3, [sp, 443]
	ldr	x1, [sp, 400]
	add	x2, x1, x0
	sxtw	x1, w3
	mov	x0, x1
	lsl	x0, x0, 1
	add	x0, x0, x1
	lsl	x0, x0, 3
	add	x1, sp, 240
	str	x2, [x1, x0]
	ldrb	w0, [sp, 443]
	sxtw	x1, w0
	mov	x0, x1
	lsl	x0, x0, 1
	add	x0, x0, x1
	lsl	x0, x0, 3
	add	x1, sp, 248
	ldr	w2, [sp, 380]
	str	w2, [x1, x0]
	ldr	w1, [sp, 444]
	ldr	w0, [sp, 380]
	add	w0, w1, w0
	str	w0, [sp, 444]
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
	ldrb	w0, [sp, 443]
	str	x0, [sp, 368]
	ldr	x0, [sp, 368]
	cmp	x0, 1023
	bhi	.L100
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
.L100:
	add	x1, sp, 104
	add	x0, sp, 40
	mov	x2, x1
	mov	x1, 128
	bl	pthread_attr_setaffinity_np
	ldrb	w0, [sp, 443]
	add	x1, sp, 328
	sxtw	x0, w0
	lsl	x0, x0, 3
	add	x4, x1, x0
	ldrb	w0, [sp, 443]
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
	ldrb	w0, [sp, 443]
	add	w0, w0, 1
	strb	w0, [sp, 443]
.L96:
	ldrb	w0, [sp, 443]
	cmp	w0, 3
	bls	.L101
	strb	wzr, [sp, 442]
	b	.L102
.L103:
	ldrb	w1, [sp, 442]
	add	x0, sp, 456
	sub	x0, x0, #128
	sxtw	x1, w1
	ldr	x0, [x0, x1, lsl 3]
	mov	x1, 0
	bl	pthread_join
	ldrb	w0, [sp, 442]
	add	w0, w0, 1
	strb	w0, [sp, 442]
.L102:
	ldrb	w0, [sp, 442]
	cmp	w0, 3
	bls	.L103
	ldr	w0, [sp, 444]
	str	w0, [sp, 436]
	b	.L104
.L106:
	ldr	w0, [sp, 436]
	ldr	x1, [sp, 408]
	add	x0, x1, x0
	ldrb	w2, [x0]
	ldr	w0, [sp, 436]
	lsl	x0, x0, 1
	ldr	x1, [sp, 400]
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
	ldr	w0, [sp, 436]
	add	w0, w0, 1
	str	w0, [sp, 436]
.L104:
	ldr	w1, [sp, 436]
	ldr	w0, [sp, 396]
	cmp	w1, w0
	bcc	.L106
	ldr	x0, [sp, 416]
	ldp	x29, x30, [sp], 448
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE3987:
	.size	decompress_wav, .-decompress_wav
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
