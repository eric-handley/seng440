	.arch armv8-a
	.file	"main.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
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
	.p2align 5,,15
	.global	print_usage
	.type	print_usage, %function
print_usage:
.LFB3996:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x2, x0
	adrp	x1, .LC0
	mov	x29, sp
	add	x1, x1, :lo12:.LC0
	str	x19, [sp, 16]
	.cfi_offset 19, -16
	adrp	x19, :got:stderr;ldr	x19, [x19, :got_lo12:stderr]
	ldr	x0, [x19]
	bl	fprintf
	ldr	x3, [x19]
	mov	x2, 28
	mov	x1, 1
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	fwrite
	ldr	x3, [x19]
	mov	x2, 29
	mov	x1, 1
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	fwrite
	ldr	x3, [x19]
	mov	x2, 28
	mov	x1, 1
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	bl	fwrite
	ldr	x3, [x19]
	adrp	x0, .LC4
	ldr	x19, [sp, 16]
	add	x0, x0, :lo12:.LC4
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa_offset 0
	mov	x2, 30
	mov	x1, 1
	b	fwrite
	.cfi_endproc
.LFE3996:
	.size	print_usage, .-print_usage
	.section	.rodata.str1.8
	.align	3
.LC5:
	.string	"i:o:cd"
	.align	3
.LC6:
	.string	"Processed in %.8f seconds\n"
	.section	.text.startup,"ax",@progbits
	.align	2
	.p2align 5,,15
	.global	main
	.type	main, %function
main:
.LFB3997:
	.cfi_startproc
	stp	x29, x30, [sp, -112]!
	.cfi_def_cfa_offset 112
	.cfi_offset 29, -112
	.cfi_offset 30, -104
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -96
	.cfi_offset 20, -88
	adrp	x20, .LC5
	mov	x19, x1
	add	x20, x20, :lo12:.LC5
	stp	x23, x24, [sp, 48]
	.cfi_offset 23, -64
	.cfi_offset 24, -56
	mov	w24, w0
	mov	w23, 0
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -80
	.cfi_offset 22, -72
	mov	x22, 0
	mov	x21, 0
	str	x25, [sp, 64]
	.cfi_offset 25, -48
	mov	w25, 0
.L5:
	mov	x2, x20
	mov	x1, x19
	mov	w0, w24
	bl	getopt
	cmn	w0, #1
	beq	.L24
.L12:
	cmp	w0, 105
	beq	.L6
	bgt	.L7
	cmp	w0, 99
	beq	.L17
	mov	w25, 1
	cmp	w0, 100
	beq	.L5
.L23:
	ldr	x0, [x19]
	bl	print_usage
.L11:
	mov	w0, 1
.L4:
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 112
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 25
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L7:
	.cfi_restore_state
	adrp	x1, :got:optarg;ldr	x1, [x1, :got_lo12:optarg]
	cmp	w0, 111
	bne	.L23
	ldr	x22, [x1]
	mov	x2, x20
	mov	x1, x19
	mov	w0, w24
	bl	getopt
	cmn	w0, #1
	bne	.L12
.L24:
	cmp	x21, 0
	ccmp	x22, 0, 4, ne
	ccmp	w23, w25, 4, ne
	beq	.L23
	mov	x0, x21
	bl	read_wav
	mov	x19, x0
	cbz	x0, .L11
	add	x1, sp, 80
	mov	w0, 1
	bl	clock_gettime
	mov	x0, x19
	cbnz	w23, .L25
	bl	decompress_wav
	mov	x19, x0
.L16:
	add	x1, sp, 96
	mov	w0, 1
	bl	clock_gettime
	ldp	x3, x2, [sp, 80]
	mov	x0, 225833675390976
	ldr	x1, [sp, 104]
	movk	x0, 0x41cd, lsl 48
	fmov	d30, x0
	adrp	x0, .LC6
	add	x0, x0, :lo12:.LC6
	sub	x1, x1, x2
	ldr	x2, [sp, 96]
	scvtf	d31, x1
	sub	x2, x2, x3
	fdiv	d31, d31, d30
	scvtf	d0, x2
	fadd	d0, d31, d0
	bl	printf
	mov	x1, x19
	mov	x0, x22
	bl	write_wav
	mov	x0, x19
	bl	free
	mov	w0, 0
	b	.L4
	.p2align 2,,3
.L17:
	mov	w23, 1
	b	.L5
	.p2align 2,,3
.L6:
	adrp	x0, :got:optarg;ldr	x0, [x0, :got_lo12:optarg]
	ldr	x21, [x0]
	b	.L5
.L25:
	bl	compress_wav
	mov	x19, x0
	b	.L16
	.cfi_endproc
.LFE3997:
	.size	main, .-main
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
