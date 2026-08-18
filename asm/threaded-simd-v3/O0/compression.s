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
	add	x0, sp, 24
	ldp	x2, x3, [x1]
	ldr	x1, [x1, 16]
	stp	x2, x3, [x0]
	str	x1, [x0, 16]
	ldr	x0, [sp, 32]
	str	x0, [sp, 1120]
	ldr	x0, [sp, 24]
	str	x0, [sp, 1112]
	ldr	w0, [sp, 40]
	str	w0, [sp, 1108]
	str	wzr, [sp, 1132]
	b	.L2
.L52:
	ldr	w0, [sp, 1132]
	lsl	x0, x0, 1
	ldr	x1, [sp, 1120]
	add	x0, x1, x0
	str	x0, [sp, 48]
	ldr	x0, [sp, 48]
	ldr	q31, [x0]
	str	q31, [sp, 528]
	ldr	q31, [sp, 528]
	str	q31, [sp, 512]
	ldr	q31, [sp, 512]
	abs	v31.8h, v31.8h
	str	q31, [sp, 496]
	ldr	q31, [sp, 528]
	str	q31, [sp, 480]
	ldr	q31, [sp, 480]
	shrn	v30.8b, v31.8h, 8
	mov	w0, -128
	strb	w0, [sp, 479]
	ldr	b31, [sp, 479]
	dup	v31.8b, v31.b[0]
	str	d30, [sp, 464]
	str	d31, [sp, 456]
	ldr	d30, [sp, 464]
	ldr	d31, [sp, 456]
	and	v31.8b, v30.8b, v31.8b
	str	d31, [sp, 448]
	mov	w0, 132
	strh	w0, [sp, 446]
	ldr	h31, [sp, 446]
	dup	v31.8h, v31.h[0]
	str	q31, [sp, 416]
	ldr	q31, [sp, 496]
	str	q31, [sp, 400]
	ldr	q31, [sp, 416]
	str	q31, [sp, 384]
	ldr	q30, [sp, 400]
	ldr	q31, [sp, 384]
	add	v31.8h, v30.8h, v31.8h
	str	q31, [sp, 496]
	mov	w0, 32767
	strh	w0, [sp, 382]
	ldr	h31, [sp, 382]
	dup	v31.8h, v31.h[0]
	mov	v30.16b, v31.16b
	ldr	q31, [sp, 496]
	str	q31, [sp, 352]
	str	q30, [sp, 336]
	ldr	q30, [sp, 352]
	ldr	q31, [sp, 336]
	umin	v31.8h, v30.8h, v31.8h
	str	q31, [sp, 496]
	ldr	q31, [sp, 496]
	str	q31, [sp, 320]
	ldr	q31, [sp, 320]
	clz	v31.8h, v31.8h
	str	q31, [sp, 304]
	ldr	q31, [sp, 304]
	str	q31, [sp, 288]
	ldr	q31, [sp, 288]
	xtn	v31.8b, v31.8h
	str	d31, [sp, 280]
	mov	w0, 8
	strb	w0, [sp, 279]
	ldr	b31, [sp, 279]
	dup	v31.8b, v31.b[0]
	str	d31, [sp, 264]
	ldr	d31, [sp, 280]
	str	d31, [sp, 256]
	ldr	d30, [sp, 264]
	ldr	d31, [sp, 256]
	sub	v31.8b, v30.8b, v31.8b
	str	d31, [sp, 248]
	ldr	d31, [sp, 248]
	str	d31, [sp, 240]
	ldr	d31, [sp, 240]
	shl	v31.8b, v31.8b, 4
	str	d31, [sp, 232]
	ldr	q30, [sp, 304]
	mov	w0, 11
	strh	w0, [sp, 230]
	ldr	h31, [sp, 230]
	dup	v31.8h, v31.h[0]
	str	q30, [sp, 208]
	str	q31, [sp, 192]
	ldr	q30, [sp, 208]
	ldr	q31, [sp, 192]
	sub	v31.8h, v30.8h, v31.8h
	str	q31, [sp, 176]
	ldr	d31, [sp, 232]
	str	d31, [sp, 168]
	ldr	d31, [sp, 448]
	str	d31, [sp, 160]
	ldr	d30, [sp, 168]
	ldr	d31, [sp, 160]
	orr	v29.8b, v30.8b, v31.8b
	ldr	q31, [sp, 496]
	str	q31, [sp, 144]
	ldr	q31, [sp, 176]
	str	q31, [sp, 128]
	ldr	q31, [sp, 144]
	ldr	q30, [sp, 128]
	ushl	v31.8h, v31.8h, v30.8h
	str	q31, [sp, 112]
	ldr	q31, [sp, 112]
	xtn	v30.8b, v31.8h
	mov	w0, 15
	strb	w0, [sp, 111]
	ldr	b31, [sp, 111]
	dup	v31.8b, v31.b[0]
	str	d30, [sp, 96]
	str	d31, [sp, 88]
	ldr	d30, [sp, 96]
	ldr	d31, [sp, 88]
	and	v31.8b, v30.8b, v31.8b
	str	d29, [sp, 80]
	str	d31, [sp, 72]
	ldr	d30, [sp, 80]
	ldr	d31, [sp, 72]
	orr	v31.8b, v30.8b, v31.8b
	str	d31, [sp, 64]
	ldr	d31, [sp, 64]
	str	d31, [sp, 56]
	ldr	d31, [sp, 56]
	not	v31.8b, v31.8b
	nop
	str	d31, [sp, 1096]
	ldr	w0, [sp, 1132]
	add	w0, w0, 8
	uxtw	x0, w0
	lsl	x0, x0, 1
	ldr	x1, [sp, 1120]
	add	x0, x1, x0
	str	x0, [sp, 544]
	ldr	x0, [sp, 544]
	ldr	q31, [x0]
	str	q31, [sp, 1024]
	ldr	q31, [sp, 1024]
	str	q31, [sp, 1008]
	ldr	q31, [sp, 1008]
	abs	v31.8h, v31.8h
	str	q31, [sp, 992]
	ldr	q31, [sp, 1024]
	str	q31, [sp, 976]
	ldr	q31, [sp, 976]
	shrn	v30.8b, v31.8h, 8
	mov	w0, -128
	strb	w0, [sp, 975]
	ldr	b31, [sp, 975]
	dup	v31.8b, v31.b[0]
	str	d30, [sp, 960]
	str	d31, [sp, 952]
	ldr	d30, [sp, 960]
	ldr	d31, [sp, 952]
	and	v31.8b, v30.8b, v31.8b
	str	d31, [sp, 944]
	mov	w0, 132
	strh	w0, [sp, 942]
	ldr	h31, [sp, 942]
	dup	v31.8h, v31.h[0]
	str	q31, [sp, 912]
	ldr	q31, [sp, 992]
	str	q31, [sp, 896]
	ldr	q31, [sp, 912]
	str	q31, [sp, 880]
	ldr	q30, [sp, 896]
	ldr	q31, [sp, 880]
	add	v31.8h, v30.8h, v31.8h
	str	q31, [sp, 992]
	mov	w0, 32767
	strh	w0, [sp, 878]
	ldr	h31, [sp, 878]
	dup	v31.8h, v31.h[0]
	mov	v30.16b, v31.16b
	ldr	q31, [sp, 992]
	str	q31, [sp, 848]
	str	q30, [sp, 832]
	ldr	q30, [sp, 848]
	ldr	q31, [sp, 832]
	umin	v31.8h, v30.8h, v31.8h
	str	q31, [sp, 992]
	ldr	q31, [sp, 992]
	str	q31, [sp, 816]
	ldr	q31, [sp, 816]
	clz	v31.8h, v31.8h
	str	q31, [sp, 800]
	ldr	q31, [sp, 800]
	str	q31, [sp, 784]
	ldr	q31, [sp, 784]
	xtn	v31.8b, v31.8h
	str	d31, [sp, 776]
	mov	w0, 8
	strb	w0, [sp, 775]
	ldr	b31, [sp, 775]
	dup	v31.8b, v31.b[0]
	str	d31, [sp, 760]
	ldr	d31, [sp, 776]
	str	d31, [sp, 752]
	ldr	d30, [sp, 760]
	ldr	d31, [sp, 752]
	sub	v31.8b, v30.8b, v31.8b
	str	d31, [sp, 744]
	ldr	d31, [sp, 744]
	str	d31, [sp, 736]
	ldr	d31, [sp, 736]
	shl	v31.8b, v31.8b, 4
	str	d31, [sp, 728]
	ldr	q30, [sp, 800]
	mov	w0, 11
	strh	w0, [sp, 726]
	ldr	h31, [sp, 726]
	dup	v31.8h, v31.h[0]
	str	q30, [sp, 704]
	str	q31, [sp, 688]
	ldr	q30, [sp, 704]
	ldr	q31, [sp, 688]
	sub	v31.8h, v30.8h, v31.8h
	str	q31, [sp, 672]
	ldr	d31, [sp, 728]
	str	d31, [sp, 664]
	ldr	d31, [sp, 944]
	str	d31, [sp, 656]
	ldr	d30, [sp, 664]
	ldr	d31, [sp, 656]
	orr	v29.8b, v30.8b, v31.8b
	ldr	q31, [sp, 992]
	str	q31, [sp, 640]
	ldr	q31, [sp, 672]
	str	q31, [sp, 624]
	ldr	q31, [sp, 640]
	ldr	q30, [sp, 624]
	ushl	v31.8h, v31.8h, v30.8h
	str	q31, [sp, 608]
	ldr	q31, [sp, 608]
	xtn	v30.8b, v31.8h
	mov	w0, 15
	strb	w0, [sp, 607]
	ldr	b31, [sp, 607]
	dup	v31.8b, v31.b[0]
	str	d30, [sp, 592]
	str	d31, [sp, 584]
	ldr	d30, [sp, 592]
	ldr	d31, [sp, 584]
	and	v31.8b, v30.8b, v31.8b
	str	d29, [sp, 576]
	str	d31, [sp, 568]
	ldr	d30, [sp, 576]
	ldr	d31, [sp, 568]
	orr	v31.8b, v30.8b, v31.8b
	str	d31, [sp, 560]
	ldr	d31, [sp, 560]
	str	d31, [sp, 552]
	ldr	d31, [sp, 552]
	not	v31.8b, v31.8b
	nop
	str	d31, [sp, 1088]
	ldr	w0, [sp, 1132]
	ldr	x1, [sp, 1112]
	add	x1, x1, x0
	ldr	d31, [sp, 1096]
	str	d31, [sp, 1048]
	ldr	d31, [sp, 1088]
	str	d31, [sp, 1040]
	ldr	d31, [sp, 1048]
	add	x0, sp, 1040
	ld1	{v31.d}[1], [x0]
	str	x1, [sp, 1080]
	str	q31, [sp, 1056]
	ldr	q31, [sp, 1056]
	ldr	x0, [sp, 1080]
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
	bcs	.L52
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
	b	.L55
.L76:
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
.L55:
	ldr	w0, [sp, 508]
	add	w0, w0, 8
	ldr	w1, [sp, 484]
	cmp	w1, w0
	bcs	.L76
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
	stp	x29, x30, [sp, -432]!
	.cfi_def_cfa_offset 432
	.cfi_offset 29, -432
	.cfi_offset 30, -424
	mov	x29, sp
	str	x0, [sp, 24]
	ldr	x0, [sp, 24]
	ldrh	w0, [x0, 32]
	strh	w0, [sp, 418]
	ldr	x0, [sp, 24]
	ldr	w1, [x0, 40]
	ldrh	w0, [sp, 418]
	udiv	w0, w1, w0
	str	w0, [sp, 412]
	ldr	x0, [sp, 24]
	ldrh	w5, [x0, 22]
	ldr	x0, [sp, 24]
	ldr	w0, [x0, 24]
	mov	w4, 7
	ldr	w3, [sp, 412]
	mov	w2, 8
	mov	w1, w0
	mov	w0, w5
	bl	new_wav
	str	x0, [sp, 400]
	ldr	x0, [sp, 400]
	cmp	x0, 0
	bne	.L79
	mov	w0, 1
	bl	exit
.L79:
	ldr	x0, [sp, 24]
	add	x0, x0, 44
	str	x0, [sp, 392]
	ldr	x0, [sp, 400]
	add	x0, x0, 44
	str	x0, [sp, 384]
	ldr	x0, [sp, 24]
	ldr	w0, [x0, 40]
	lsr	w0, w0, 1
	str	w0, [sp, 380]
	ldr	w0, [sp, 380]
	lsr	w0, w0, 4
	str	w0, [sp, 376]
	ldr	w1, [sp, 376]
	mov	w0, 43691
	movk	w0, 0xaaaa, lsl 16
	umull	x0, w1, w0
	lsr	x0, x0, 32
	lsr	w0, w0, 1
	str	w0, [sp, 372]
	ldr	w1, [sp, 376]
	mov	w0, 43691
	movk	w0, 0xaaaa, lsl 16
	umull	x0, w1, w0
	lsr	x0, x0, 32
	lsr	w2, w0, 1
	mov	w0, w2
	lsl	w0, w0, 1
	add	w0, w0, w2
	sub	w0, w1, w0
	str	w0, [sp, 368]
	str	wzr, [sp, 428]
	strb	wzr, [sp, 427]
	b	.L80
.L85:
	ldrb	w0, [sp, 427]
	ldr	w1, [sp, 368]
	cmp	w1, w0
	bls	.L81
	mov	w0, 1
	b	.L82
.L81:
	mov	w0, 0
.L82:
	ldr	w1, [sp, 372]
	add	w0, w0, w1
	lsl	w0, w0, 4
	str	w0, [sp, 364]
	ldr	w0, [sp, 428]
	ldrb	w3, [sp, 427]
	ldr	x1, [sp, 384]
	add	x2, x1, x0
	sxtw	x1, w3
	mov	x0, x1
	lsl	x0, x0, 1
	add	x0, x0, x1
	lsl	x0, x0, 3
	add	x1, sp, 232
	str	x2, [x1, x0]
	ldr	w0, [sp, 428]
	lsl	x0, x0, 1
	ldrb	w3, [sp, 427]
	ldr	x1, [sp, 392]
	add	x2, x1, x0
	sxtw	x1, w3
	mov	x0, x1
	lsl	x0, x0, 1
	add	x0, x0, x1
	lsl	x0, x0, 3
	add	x1, sp, 240
	str	x2, [x1, x0]
	ldrb	w0, [sp, 427]
	sxtw	x1, w0
	mov	x0, x1
	lsl	x0, x0, 1
	add	x0, x0, x1
	lsl	x0, x0, 3
	add	x1, sp, 248
	ldr	w2, [sp, 364]
	str	w2, [x1, x0]
	ldr	w1, [sp, 428]
	ldr	w0, [sp, 364]
	add	w0, w1, w0
	str	w0, [sp, 428]
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
	ldrb	w0, [sp, 427]
	str	x0, [sp, 352]
	ldr	x0, [sp, 352]
	cmp	x0, 1023
	bhi	.L84
	ldr	x0, [sp, 352]
	lsr	x0, x0, 6
	lsl	x1, x0, 3
	add	x2, sp, 104
	add	x1, x2, x1
	ldr	x2, [x1]
	ldr	x1, [sp, 352]
	and	w1, w1, 63
	mov	x3, 1
	lsl	x1, x3, x1
	lsl	x0, x0, 3
	add	x3, sp, 104
	add	x0, x3, x0
	orr	x1, x2, x1
	str	x1, [x0]
.L84:
	add	x1, sp, 104
	add	x0, sp, 40
	mov	x2, x1
	mov	x1, 128
	bl	pthread_attr_setaffinity_np
	ldrb	w0, [sp, 427]
	add	x1, sp, 304
	sxtw	x0, w0
	lsl	x0, x0, 3
	add	x4, x1, x0
	ldrb	w0, [sp, 427]
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
	ldrb	w0, [sp, 427]
	add	w0, w0, 1
	strb	w0, [sp, 427]
.L80:
	ldrb	w0, [sp, 427]
	cmp	w0, 2
	bls	.L85
	strb	wzr, [sp, 426]
	b	.L86
.L87:
	ldrb	w0, [sp, 426]
	sxtw	x0, w0
	lsl	x0, x0, 3
	add	x1, sp, 304
	ldr	x0, [x1, x0]
	mov	x1, 0
	bl	pthread_join
	ldrb	w0, [sp, 426]
	add	w0, w0, 1
	strb	w0, [sp, 426]
.L86:
	ldrb	w0, [sp, 426]
	cmp	w0, 2
	bls	.L87
	ldr	w0, [sp, 428]
	str	w0, [sp, 420]
	b	.L88
.L94:
	ldr	w0, [sp, 420]
	lsl	x0, x0, 1
	ldr	x1, [sp, 392]
	add	x0, x1, x0
	ldrsh	w2, [x0]
	ldr	w0, [sp, 420]
	ldr	x1, [sp, 384]
	add	x1, x1, x0
	mov	w0, w2
	strh	w0, [sp, 350]
	ldrsh	w0, [sp, 350]
	asr	w0, w0, 15
	strh	w0, [sp, 348]
	ldrh	w2, [sp, 350]
	ldrh	w0, [sp, 348]
	add	w0, w2, w0
	and	w0, w0, 65535
	sxth	w2, w0
	ldrh	w0, [sp, 348]
	eor	w0, w2, w0
	sxth	w0, w0
	strh	w0, [sp, 346]
	ldrh	w0, [sp, 350]
	and	w0, w0, -32768
	strh	w0, [sp, 344]
	ldrh	w0, [sp, 346]
	add	w0, w0, 132
	strh	w0, [sp, 346]
	ldrsh	w0, [sp, 346]
	asr	w0, w0, 15
	sxth	w0, w0
	strh	w0, [sp, 342]
	ldrsh	w0, [sp, 342]
	mvn	w0, w0
	sxth	w2, w0
	ldrsh	w0, [sp, 346]
	and	w0, w2, w0
	sxth	w2, w0
	ldrsh	w0, [sp, 342]
	and	w0, w0, 32767
	sxth	w0, w0
	orr	w0, w2, w0
	sxth	w0, w0
	strh	w0, [sp, 346]
	ldrh	w0, [sp, 346]
	strh	w0, [sp, 340]
	ldrh	w0, [sp, 340]
	str	w0, [sp, 336]
	ldr	w0, [sp, 336]
	cmp	w0, 0
	beq	.L89
	ldr	w0, [sp, 336]
	clz	w0, w0
	b	.L96
.L89:
	mov	w0, 32
.L96:
	sub	w0, w0, #16
	and	w0, w0, 255
	sub	w0, w0, #1
	strb	w0, [sp, 335]
	ldrb	w0, [sp, 335]
	mov	w2, 7
	sub	w0, w2, w0
	strb	w0, [sp, 334]
	ldrb	w0, [sp, 334]
	ubfiz	w0, w0, 4, 4
	strb	w0, [sp, 333]
	ldrh	w0, [sp, 344]
	lsr	w0, w0, 8
	and	w0, w0, 65535
	and	w2, w0, 255
	ldrb	w0, [sp, 333]
	orr	w0, w2, w0
	and	w0, w0, 255
	sxtb	w2, w0
	ldrh	w3, [sp, 346]
	ldrb	w0, [sp, 335]
	mov	w4, 10
	sub	w0, w4, w0
	asr	w0, w3, w0
	sxtb	w0, w0
	and	w0, w0, 15
	sxtb	w0, w0
	orr	w0, w2, w0
	sxtb	w0, w0
	strb	w0, [sp, 332]
	ldrb	w0, [sp, 332]
	mvn	w0, w0
	and	w0, w0, 255
	strb	w0, [x1]
	ldr	w0, [sp, 420]
	add	w0, w0, 1
	str	w0, [sp, 420]
.L88:
	ldr	w1, [sp, 420]
	ldr	w0, [sp, 380]
	cmp	w1, w0
	bcc	.L94
	ldr	x0, [sp, 400]
	ldp	x29, x30, [sp], 432
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
	stp	x29, x30, [sp, -416]!
	.cfi_def_cfa_offset 416
	.cfi_offset 29, -416
	.cfi_offset 30, -408
	mov	x29, sp
	str	x0, [sp, 24]
	ldr	x0, [sp, 24]
	ldrh	w0, [x0, 32]
	strh	w0, [sp, 402]
	ldr	x0, [sp, 24]
	ldr	w1, [x0, 40]
	ldrh	w0, [sp, 402]
	udiv	w0, w1, w0
	str	w0, [sp, 396]
	ldr	x0, [sp, 24]
	ldrh	w5, [x0, 22]
	ldr	x0, [sp, 24]
	ldr	w0, [x0, 24]
	mov	w4, 1
	ldr	w3, [sp, 396]
	mov	w2, 16
	mov	w1, w0
	mov	w0, w5
	bl	new_wav
	str	x0, [sp, 384]
	ldr	x0, [sp, 384]
	cmp	x0, 0
	bne	.L98
	mov	w0, 1
	bl	exit
.L98:
	ldr	x0, [sp, 24]
	add	x0, x0, 44
	str	x0, [sp, 376]
	ldr	x0, [sp, 384]
	add	x0, x0, 44
	str	x0, [sp, 368]
	ldr	x0, [sp, 24]
	ldr	w0, [x0, 40]
	str	w0, [sp, 364]
	ldr	w0, [sp, 364]
	lsr	w0, w0, 3
	str	w0, [sp, 360]
	ldr	w1, [sp, 360]
	mov	w0, 43691
	movk	w0, 0xaaaa, lsl 16
	umull	x0, w1, w0
	lsr	x0, x0, 32
	lsr	w0, w0, 1
	str	w0, [sp, 356]
	ldr	w1, [sp, 360]
	mov	w0, 43691
	movk	w0, 0xaaaa, lsl 16
	umull	x0, w1, w0
	lsr	x0, x0, 32
	lsr	w2, w0, 1
	mov	w0, w2
	lsl	w0, w0, 1
	add	w0, w0, w2
	sub	w0, w1, w0
	str	w0, [sp, 352]
	str	wzr, [sp, 412]
	strb	wzr, [sp, 411]
	b	.L99
.L104:
	ldrb	w0, [sp, 411]
	ldr	w1, [sp, 352]
	cmp	w1, w0
	bls	.L100
	mov	w0, 1
	b	.L101
.L100:
	mov	w0, 0
.L101:
	ldr	w1, [sp, 356]
	add	w0, w0, w1
	lsl	w0, w0, 3
	str	w0, [sp, 348]
	ldr	w0, [sp, 412]
	ldrb	w3, [sp, 411]
	ldr	x1, [sp, 376]
	add	x2, x1, x0
	sxtw	x1, w3
	mov	x0, x1
	lsl	x0, x0, 1
	add	x0, x0, x1
	lsl	x0, x0, 3
	add	x1, sp, 232
	str	x2, [x1, x0]
	ldr	w0, [sp, 412]
	lsl	x0, x0, 1
	ldrb	w3, [sp, 411]
	ldr	x1, [sp, 368]
	add	x2, x1, x0
	sxtw	x1, w3
	mov	x0, x1
	lsl	x0, x0, 1
	add	x0, x0, x1
	lsl	x0, x0, 3
	add	x1, sp, 240
	str	x2, [x1, x0]
	ldrb	w0, [sp, 411]
	sxtw	x1, w0
	mov	x0, x1
	lsl	x0, x0, 1
	add	x0, x0, x1
	lsl	x0, x0, 3
	add	x1, sp, 248
	ldr	w2, [sp, 348]
	str	w2, [x1, x0]
	ldr	w1, [sp, 412]
	ldr	w0, [sp, 348]
	add	w0, w1, w0
	str	w0, [sp, 412]
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
	ldrb	w0, [sp, 411]
	str	x0, [sp, 336]
	ldr	x0, [sp, 336]
	cmp	x0, 1023
	bhi	.L103
	ldr	x0, [sp, 336]
	lsr	x0, x0, 6
	lsl	x1, x0, 3
	add	x2, sp, 104
	add	x1, x2, x1
	ldr	x2, [x1]
	ldr	x1, [sp, 336]
	and	w1, w1, 63
	mov	x3, 1
	lsl	x1, x3, x1
	lsl	x0, x0, 3
	add	x3, sp, 104
	add	x0, x3, x0
	orr	x1, x2, x1
	str	x1, [x0]
.L103:
	add	x1, sp, 104
	add	x0, sp, 40
	mov	x2, x1
	mov	x1, 128
	bl	pthread_attr_setaffinity_np
	ldrb	w0, [sp, 411]
	add	x1, sp, 304
	sxtw	x0, w0
	lsl	x0, x0, 3
	add	x4, x1, x0
	ldrb	w0, [sp, 411]
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
	ldrb	w0, [sp, 411]
	add	w0, w0, 1
	strb	w0, [sp, 411]
.L99:
	ldrb	w0, [sp, 411]
	cmp	w0, 2
	bls	.L104
	strb	wzr, [sp, 410]
	b	.L105
.L106:
	ldrb	w0, [sp, 410]
	sxtw	x0, w0
	lsl	x0, x0, 3
	add	x1, sp, 304
	ldr	x0, [x1, x0]
	mov	x1, 0
	bl	pthread_join
	ldrb	w0, [sp, 410]
	add	w0, w0, 1
	strb	w0, [sp, 410]
.L105:
	ldrb	w0, [sp, 410]
	cmp	w0, 2
	bls	.L106
	ldr	w0, [sp, 412]
	str	w0, [sp, 404]
	b	.L107
.L109:
	ldr	w0, [sp, 404]
	ldr	x1, [sp, 376]
	add	x0, x1, x0
	ldrb	w2, [x0]
	ldr	w0, [sp, 404]
	lsl	x0, x0, 1
	ldr	x1, [sp, 368]
	add	x0, x1, x0
	mov	w1, w2
	strb	w1, [sp, 335]
	ldrb	w1, [sp, 335]
	mvn	w1, w1
	strb	w1, [sp, 335]
	ldrb	w1, [sp, 335]
	lsr	w1, w1, 4
	and	w1, w1, 255
	and	w1, w1, 7
	strb	w1, [sp, 334]
	ldrb	w1, [sp, 335]
	and	w1, w1, 15
	orr	w2, w1, 16
	ldrb	w1, [sp, 334]
	add	w1, w1, 3
	lsl	w1, w2, w1
	strh	w1, [sp, 332]
	ldrh	w1, [sp, 332]
	sub	w1, w1, #132
	strh	w1, [sp, 332]
	ldrb	w1, [sp, 335]
	sxth	w1, w1
	ubfiz	w1, w1, 8, 8
	sxth	w1, w1
	asr	w1, w1, 15
	strh	w1, [sp, 330]
	ldrsh	w2, [sp, 332]
	ldrh	w1, [sp, 330]
	eor	w1, w2, w1
	sxth	w1, w1
	and	w2, w1, 65535
	ldrh	w1, [sp, 330]
	sub	w1, w2, w1
	and	w1, w1, 65535
	strh	w1, [sp, 328]
	ldrsh	w1, [sp, 328]
	strh	w1, [x0]
	ldr	w0, [sp, 404]
	add	w0, w0, 1
	str	w0, [sp, 404]
.L107:
	ldr	w1, [sp, 404]
	ldr	w0, [sp, 364]
	cmp	w1, w0
	bcc	.L109
	ldr	x0, [sp, 384]
	ldp	x29, x30, [sp], 416
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE3987:
	.size	decompress_wav, .-decompress_wav
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
