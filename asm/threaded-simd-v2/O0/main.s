	.arch armv8-a
	.file	"main.c"
	.text
	.section	.rodata
	.align	3
.LC0:
	.string	"Usage: %s -i <input.wav> -o <output.wav> (-c | -d)\n"
	.align	3
.LC1:
	.string	"  -i <file>  Input WAV file\n"
	.align	3
.LC2:
	.string	"  -o <file>  Output WAV file\n"
	.align	3
.LC3:
	.string	"  -c         Compress input\n"
	.align	3
.LC4:
	.string	"  -d         Decompress input\n"
	.text
	.align	2
	.global	print_usage
	.type	print_usage, %function
print_usage:
.LFB3980:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	x0, [sp, 24]
	adrp	x0, :got:stderr;ldr	x0, [x0, :got_lo12:stderr]
	ldr	x3, [x0]
	ldr	x2, [sp, 24]
	adrp	x0, .LC0
	add	x1, x0, :lo12:.LC0
	mov	x0, x3
	bl	fprintf
	adrp	x0, :got:stderr;ldr	x0, [x0, :got_lo12:stderr]
	ldr	x0, [x0]
	mov	x3, x0
	mov	x2, 28
	mov	x1, 1
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	fwrite
	adrp	x0, :got:stderr;ldr	x0, [x0, :got_lo12:stderr]
	ldr	x0, [x0]
	mov	x3, x0
	mov	x2, 29
	mov	x1, 1
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	fwrite
	adrp	x0, :got:stderr;ldr	x0, [x0, :got_lo12:stderr]
	ldr	x0, [x0]
	mov	x3, x0
	mov	x2, 28
	mov	x1, 1
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	bl	fwrite
	adrp	x0, :got:stderr;ldr	x0, [x0, :got_lo12:stderr]
	ldr	x0, [x0]
	mov	x3, x0
	mov	x2, 30
	mov	x1, 1
	adrp	x0, .LC4
	add	x0, x0, :lo12:.LC4
	bl	fwrite
	nop
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE3980:
	.size	print_usage, .-print_usage
	.section	.rodata
	.align	3
.LC5:
	.string	"i:o:cd"
	.align	3
.LC6:
	.string	"Processed in %.8f seconds\n"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB3981:
	.cfi_startproc
	stp	x29, x30, [sp, -112]!
	.cfi_def_cfa_offset 112
	.cfi_offset 29, -112
	.cfi_offset 30, -104
	mov	x29, sp
	str	w0, [sp, 28]
	str	x1, [sp, 16]
	str	xzr, [sp, 104]
	str	xzr, [sp, 96]
	strb	wzr, [sp, 95]
	strb	wzr, [sp, 94]
	b	.L3
.L10:
	ldr	w0, [sp, 88]
	cmp	w0, 111
	beq	.L4
	ldr	w0, [sp, 88]
	cmp	w0, 111
	bgt	.L5
	ldr	w0, [sp, 88]
	cmp	w0, 105
	beq	.L6
	ldr	w0, [sp, 88]
	cmp	w0, 105
	bgt	.L5
	ldr	w0, [sp, 88]
	cmp	w0, 99
	beq	.L7
	ldr	w0, [sp, 88]
	cmp	w0, 100
	beq	.L8
	b	.L5
.L6:
	adrp	x0, :got:optarg;ldr	x0, [x0, :got_lo12:optarg]
	ldr	x0, [x0]
	str	x0, [sp, 104]
	b	.L3
.L4:
	adrp	x0, :got:optarg;ldr	x0, [x0, :got_lo12:optarg]
	ldr	x0, [x0]
	str	x0, [sp, 96]
	b	.L3
.L7:
	mov	w0, 1
	strb	w0, [sp, 95]
	b	.L3
.L8:
	mov	w0, 1
	strb	w0, [sp, 94]
	b	.L3
.L5:
	ldr	x0, [sp, 16]
	ldr	x0, [x0]
	bl	print_usage
	mov	w0, 1
	b	.L16
.L3:
	adrp	x0, .LC5
	add	x2, x0, :lo12:.LC5
	ldr	x1, [sp, 16]
	ldr	w0, [sp, 28]
	bl	getopt
	str	w0, [sp, 88]
	ldr	w0, [sp, 88]
	cmn	w0, #1
	bne	.L10
	ldr	x0, [sp, 104]
	cmp	x0, 0
	beq	.L11
	ldr	x0, [sp, 96]
	cmp	x0, 0
	beq	.L11
	ldrb	w1, [sp, 95]
	ldrb	w0, [sp, 94]
	cmp	w1, w0
	bne	.L12
.L11:
	ldr	x0, [sp, 16]
	ldr	x0, [x0]
	bl	print_usage
	mov	w0, 1
	b	.L16
.L12:
	ldr	x0, [sp, 104]
	bl	read_wav
	str	x0, [sp, 80]
	ldr	x0, [sp, 80]
	cmp	x0, 0
	bne	.L13
	mov	w0, 1
	b	.L16
.L13:
	add	x0, sp, 48
	mov	x1, x0
	mov	w0, 1
	bl	clock_gettime
	ldrb	w0, [sp, 95]
	and	w0, w0, 1
	cmp	w0, 0
	beq	.L14
	ldr	x0, [sp, 80]
	bl	compress_wav
	b	.L15
.L14:
	ldr	x0, [sp, 80]
	bl	decompress_wav
.L15:
	str	x0, [sp, 72]
	add	x0, sp, 32
	mov	x1, x0
	mov	w0, 1
	bl	clock_gettime
	ldr	x1, [sp, 32]
	ldr	x0, [sp, 48]
	sub	x0, x1, x0
	fmov	d31, x0
	scvtf	d30, d31
	ldr	x1, [sp, 40]
	ldr	x0, [sp, 56]
	sub	x0, x1, x0
	fmov	d31, x0
	scvtf	d31, d31
	mov	x0, 225833675390976
	movk	x0, 0x41cd, lsl 48
	fmov	d29, x0
	fdiv	d31, d31, d29
	fadd	d31, d30, d31
	str	d31, [sp, 64]
	ldr	d0, [sp, 64]
	adrp	x0, .LC6
	add	x0, x0, :lo12:.LC6
	bl	printf
	ldr	x1, [sp, 72]
	ldr	x0, [sp, 96]
	bl	write_wav
	ldr	x0, [sp, 72]
	bl	free
	mov	w0, 0
.L16:
	ldp	x29, x30, [sp], 112
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE3981:
	.size	main, .-main
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
