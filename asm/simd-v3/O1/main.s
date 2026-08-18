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
	.global	print_usage
	.type	print_usage, %function
print_usage:
.LFB3996:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	x19, [sp, 16]
	.cfi_offset 19, -16
	adrp	x19, :got:stderr;ldr	x19, [x19, :got_lo12:stderr]
	mov	x2, x0
	adrp	x1, .LC0
	add	x1, x1, :lo12:.LC0
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
	mov	x2, 30
	mov	x1, 1
	adrp	x0, .LC4
	add	x0, x0, :lo12:.LC4
	bl	fwrite
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa_offset 0
	ret
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
	.text
	.align	2
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
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	.cfi_offset 19, -96
	.cfi_offset 20, -88
	.cfi_offset 21, -80
	.cfi_offset 22, -72
	.cfi_offset 23, -64
	.cfi_offset 24, -56
	.cfi_offset 25, -48
	mov	w24, w0
	mov	x19, x1
	mov	w25, 0
	mov	w23, 0
	mov	x21, 0
	mov	x22, 0
	adrp	x20, .LC5
	add	x20, x20, :lo12:.LC5
.L4:
	mov	x2, x20
	mov	x1, x19
	mov	w0, w24
	bl	getopt
	cmn	w0, #1
	beq	.L19
	cmp	w0, 105
	beq	.L5
	cmp	w0, 105
	bgt	.L6
	cmp	w0, 99
	beq	.L15
	cmp	w0, 100
	bne	.L8
	mov	w25, 1
	b	.L4
.L6:
	cmp	w0, 111
	bne	.L8
	adrp	x0, :got:optarg;ldr	x0, [x0, :got_lo12:optarg]
	ldr	x21, [x0]
	b	.L4
.L5:
	adrp	x0, :got:optarg;ldr	x0, [x0, :got_lo12:optarg]
	ldr	x22, [x0]
	b	.L4
.L8:
	ldr	x0, [x19]
	bl	print_usage
	mov	w0, 1
.L3:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
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
.L15:
	.cfi_restore_state
	mov	w23, 1
	b	.L4
.L19:
	cmp	x22, 0
	ccmp	x21, 0, 4, ne
	ccmp	w23, w25, 4, ne
	beq	.L20
	mov	x0, x22
	bl	read_wav
	mov	x19, x0
	cbz	x0, .L17
	add	x1, sp, 96
	mov	w0, 1
	bl	clock_gettime
	tbz	x23, 0, .L13
	mov	x0, x19
	bl	compress_wav
	mov	x19, x0
.L14:
	add	x1, sp, 80
	mov	w0, 1
	bl	clock_gettime
	ldr	x1, [sp, 88]
	ldr	x0, [sp, 104]
	sub	x0, x1, x0
	fmov	d31, x0
	scvtf	d31, d31
	mov	x0, 225833675390976
	movk	x0, 0x41cd, lsl 48
	fmov	d30, x0
	fdiv	d31, d31, d30
	ldr	x1, [sp, 80]
	ldr	x0, [sp, 96]
	sub	x0, x1, x0
	fmov	d0, x0
	scvtf	d0, d0
	fadd	d0, d31, d0
	adrp	x0, .LC6
	add	x0, x0, :lo12:.LC6
	bl	printf
	mov	x1, x19
	mov	x0, x21
	bl	write_wav
	mov	x0, x19
	bl	free
	mov	w0, 0
	b	.L3
.L20:
	ldr	x0, [x19]
	bl	print_usage
	mov	w0, 1
	b	.L3
.L13:
	mov	x0, x19
	bl	decompress_wav
	mov	x19, x0
	b	.L14
.L17:
	mov	w0, 1
	b	.L3
	.cfi_endproc
.LFE3997:
	.size	main, .-main
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
