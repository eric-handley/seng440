	.arch armv8-a
	.file	"wav.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"open"
	.align	3
.LC1:
	.string	"fstat"
	.align	3
.LC2:
	.string	"mmap"
	.text
	.align	2
	.global	read_wav
	.type	read_wav, %function
read_wav:
.LFB80:
	.cfi_startproc
	stp	x29, x30, [sp, -160]!
	.cfi_def_cfa_offset 160
	.cfi_offset 29, -160
	.cfi_offset 30, -152
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -144
	.cfi_offset 20, -136
	mov	w1, 0
	bl	open
	tbnz	w0, #31, .L6
	mov	w19, w0
	add	x1, sp, 32
	bl	fstat
	tbnz	w0, #31, .L7
	mov	x5, 0
	mov	w4, w19
	mov	w3, 2
	mov	w2, 3
	ldr	x1, [sp, 80]
	mov	x0, 0
	bl	mmap
	mov	x20, x0
	mov	w0, w19
	bl	close
	cmn	x20, #1
	beq	.L8
.L1:
	mov	x0, x20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 160
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
.L6:
	.cfi_restore_state
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	perror
	mov	x20, 0
	b	.L1
.L7:
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	perror
	mov	w0, w19
	bl	close
	mov	x20, 0
	b	.L1
.L8:
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	perror
	mov	x20, 0
	b	.L1
	.cfi_endproc
.LFE80:
	.size	read_wav, .-read_wav
	.section	.rodata.str1.8
	.align	3
.LC3:
	.string	"malloc"
	.text
	.align	2
	.global	new_wav
	.type	new_wav, %function
new_wav:
.LFB81:
	.cfi_startproc
	stp	x29, x30, [sp, -80]!
	.cfi_def_cfa_offset 80
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	.cfi_offset 19, -64
	.cfi_offset 20, -56
	.cfi_offset 21, -48
	.cfi_offset 22, -40
	.cfi_offset 23, -32
	.cfi_offset 24, -24
	.cfi_offset 25, -16
	and	w23, w0, 65535
	mov	w22, w1
	and	w24, w2, 65535
	and	w25, w4, 65535
	ubfx	w20, w2, 3, 13
	mul	w20, w23, w20
	and	w20, w20, 65535
	mul	w21, w20, w3
	uxtw	x0, w21
	add	x0, x0, 44
	bl	malloc
	mov	x19, x0
	cbz	x0, .L13
	add	w1, w21, 36
	mov	w0, 18770
	movk	w0, 0x4646, lsl 16
	stp	w0, w1, [x19]
	mov	w0, 16727
	movk	w0, 0x4556, lsl 16
	mov	w1, 28006
	movk	w1, 0x2074, lsl 16
	stp	w0, w1, [x19, 8]
	mov	w0, 16
	str	w0, [x19, 16]
	strh	w25, [x19, 20]
	strh	w23, [x19, 22]
	mul	w0, w20, w22
	stp	w22, w0, [x19, 24]
	strh	w20, [x19, 32]
	strh	w24, [x19, 34]
	mov	w0, 24932
	movk	w0, 0x6174, lsl 16
	stp	w0, w21, [x19, 36]
.L9:
	mov	x0, x19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
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
.L13:
	.cfi_restore_state
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	bl	perror
	b	.L9
	.cfi_endproc
.LFE81:
	.size	new_wav, .-new_wav
	.section	.rodata.str1.8
	.align	3
.LC4:
	.string	"\n-----"
	.align	3
.LC5:
	.string	"ckID:        %.4s\n"
	.align	3
.LC6:
	.string	"cksize:      %u bytes\n"
	.align	3
.LC7:
	.string	"wavID:       %.4s\n"
	.align	3
.LC8:
	.string	"fmt ckID:    %.4s\n"
	.align	3
.LC9:
	.string	"fmt cksize:  %u\n"
	.align	3
.LC10:
	.string	"formatTag:   %u\n"
	.align	3
.LC11:
	.string	"channels:    %u\n"
	.align	3
.LC12:
	.string	"sample rate: %u Hz\n"
	.align	3
.LC13:
	.string	"byte rate:   %u B/s\n"
	.align	3
.LC14:
	.string	"block align: %u bytes\n"
	.align	3
.LC15:
	.string	"bits/sample: %u\n"
	.align	3
.LC16:
	.string	"data ckID:   %.4s\n"
	.align	3
.LC17:
	.string	"data cksize: %u bytes\n"
	.align	3
.LC18:
	.string	"frames:      %zu\n"
	.align	3
.LC19:
	.string	"duration:    %.2f s"
	.text
	.align	2
	.global	print_wav_info
	.type	print_wav_info, %function
print_wav_info:
.LFB82:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	str	d15, [sp, 32]
	.cfi_offset 19, -32
	.cfi_offset 20, -24
	.cfi_offset 79, -16
	mov	x19, x0
	adrp	x20, .LC4
	add	x20, x20, :lo12:.LC4
	mov	x0, x20
	bl	puts
	mov	x1, x19
	adrp	x0, .LC5
	add	x0, x0, :lo12:.LC5
	bl	printf
	ldr	w1, [x19, 4]
	adrp	x0, .LC6
	add	x0, x0, :lo12:.LC6
	bl	printf
	add	x1, x19, 8
	adrp	x0, .LC7
	add	x0, x0, :lo12:.LC7
	bl	printf
	add	x1, x19, 12
	adrp	x0, .LC8
	add	x0, x0, :lo12:.LC8
	bl	printf
	ldr	w1, [x19, 16]
	adrp	x0, .LC9
	add	x0, x0, :lo12:.LC9
	bl	printf
	ldrh	w1, [x19, 20]
	adrp	x0, .LC10
	add	x0, x0, :lo12:.LC10
	bl	printf
	ldrh	w1, [x19, 22]
	adrp	x0, .LC11
	add	x0, x0, :lo12:.LC11
	bl	printf
	ldr	w1, [x19, 24]
	adrp	x0, .LC12
	add	x0, x0, :lo12:.LC12
	bl	printf
	ldr	w1, [x19, 28]
	adrp	x0, .LC13
	add	x0, x0, :lo12:.LC13
	bl	printf
	ldrh	w1, [x19, 32]
	adrp	x0, .LC14
	add	x0, x0, :lo12:.LC14
	bl	printf
	ldrh	w1, [x19, 34]
	adrp	x0, .LC15
	add	x0, x0, :lo12:.LC15
	bl	printf
	add	x1, x19, 36
	adrp	x0, .LC16
	add	x0, x0, :lo12:.LC16
	bl	printf
	ldr	w1, [x19, 40]
	adrp	x0, .LC17
	add	x0, x0, :lo12:.LC17
	bl	printf
	ldrh	w0, [x19, 32]
	ldr	w1, [x19, 40]
	udiv	w1, w1, w0
	ucvtf	d15, w1
	ldr	w0, [x19, 24]
	ucvtf	d31, w0
	fdiv	d15, d15, d31
	uxtw	x1, w1
	adrp	x0, .LC18
	add	x0, x0, :lo12:.LC18
	bl	printf
	fmov	d0, d15
	adrp	x0, .LC19
	add	x0, x0, :lo12:.LC19
	bl	printf
	mov	x0, x20
	bl	puts
	ldr	d15, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 79
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE82:
	.size	print_wav_info, .-print_wav_info
	.section	.rodata.str1.8
	.align	3
.LC20:
	.string	" "
	.align	3
.LC21:
	.string	"\342\224\200"
	.align	3
.LC22:
	.string	"\342\226\210"
	.align	3
.LC23:
	.string	"\342\226\204"
	.align	3
.LC24:
	.string	"\342\226\200"
	.text
	.align	2
	.global	print_waveform
	.type	print_waveform, %function
print_waveform:
.LFB83:
	.cfi_startproc
	stp	x29, x30, [sp, -96]!
	.cfi_def_cfa_offset 96
	.cfi_offset 29, -96
	.cfi_offset 30, -88
	mov	x29, sp
	.cfi_def_cfa_register 29
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	.cfi_offset 19, -80
	.cfi_offset 20, -72
	.cfi_offset 21, -64
	.cfi_offset 22, -56
	.cfi_offset 23, -48
	.cfi_offset 24, -40
	.cfi_offset 25, -32
	.cfi_offset 26, -24
	.cfi_offset 27, -16
	.cfi_offset 28, -8
	add	x3, x0, 44
	ldrh	w1, [x0, 32]
	lsr	w8, w1, 1
	ldr	w12, [x0, 40]
	udiv	w12, w12, w1
	mov	w13, 34953
	movk	w13, 0x8888, lsl 16
	umull	x13, w12, w13
	lsr	x13, x13, 38
	cmp	w12, 119
	csinc	w13, w13, wzr, hi
	sub	sp, sp, #480
	mov	x27, sp
	sub	sp, sp, #480
	mov	x28, sp
	mul	w14, w13, w8
	mov	x10, 0
	mov	w9, 0
	mov	w11, 0
	mov	w23, -32768
	mov	w24, 32767
	b	.L20
.L18:
	str	w0, [x27, x10]
	str	w1, [x28, x10]
	cmp	w0, w1
	csel	w2, w0, w1, le
	cmp	w24, w2
	csel	w24, w24, w2, le
	cmp	w0, w1
	csel	w0, w0, w1, ge
	cmp	w23, w0
	csel	w23, w23, w0, ge
	add	w11, w11, w14
	add	x10, x10, 4
	cmp	x10, 480
	beq	.L38
.L20:
	mov	w4, w9
	add	w9, w9, w13
	cmp	w12, w9
	csel	w7, w12, w9, ls
	ldrsh	w0, [x3, w11, uxtw 1]
	add	w1, w11, 1
	ldrsh	w1, [x3, x1, lsl 1]
	cmp	w7, w4
	bls	.L18
	mov	w2, w11
.L19:
	ldrsh	w6, [x3, w2, uxtw 1]
	ldrh	w5, [x3, w2, uxtw 1]
	cmp	w6, w0
	csel	w0, w5, w0, ge
	sxth	w0, w0
	add	w5, w2, 1
	ldrsh	w6, [x3, x5, lsl 1]
	ldrh	w5, [x3, x5, lsl 1]
	cmp	w6, w1
	csel	w1, w5, w1, ge
	sxth	w1, w1
	add	w4, w4, 1
	add	w2, w2, w8
	cmp	w7, w4
	bne	.L19
	b	.L18
.L38:
	subs	w23, w23, w24
	csinc	w23, w23, wzr, ne
	mov	w21, 24
	mov	w20, 12
	adrp	x26, .LC21
	add	x26, x26, :lo12:.LC21
	adrp	x25, .LC22
	add	x25, x25, :lo12:.LC22
	adrp	x22, :got:stdout;ldr	x22, [x22, :got_lo12:stdout]
	b	.L22
.L40:
	ldr	w0, [x27, x19]
	sub	w0, w0, w24
	add	w0, w0, w0, lsl 1
	lsl	w1, w0, 3
	sdiv	w1, w1, w23
	mov	x0, x25
	cmp	w1, w21
	bge	.L24
	sub	w3, w21, #2
	adrp	x2, .LC20
	add	x2, x2, :lo12:.LC20
	adrp	x0, .LC23
	add	x0, x0, :lo12:.LC23
	cmp	w1, w3
	csel	x0, x0, x2, gt
.L24:
	ldr	x1, [x22]
	bl	fputs
	add	x19, x19, 4
	cmp	x19, 480
	beq	.L39
.L25:
	cmp	w20, 0
	bgt	.L40
	mov	x0, x26
	tbz	w20, #31, .L24
	ldr	w0, [x28, x19]
	sub	w0, w0, w24
	add	w0, w0, w0, lsl 1
	lsl	w1, w0, 3
	sdiv	w1, w1, w23
	neg	w2, w21
	mov	x0, x25
	cmp	w1, w2
	bge	.L24
	mov	w3, -2
	sub	w3, w3, w21
	adrp	x2, .LC20
	add	x2, x2, :lo12:.LC20
	adrp	x0, .LC24
	add	x0, x0, :lo12:.LC24
	cmp	w1, w3
	csel	x0, x0, x2, gt
	b	.L24
.L39:
	ldr	x1, [x22]
	mov	w0, 10
	bl	putc
	sub	w20, w20, #1
	sub	w21, w21, #2
	cmn	w20, #13
	beq	.L16
.L22:
	mov	x19, 0
	b	.L25
.L16:
	mov	sp, x29
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE83:
	.size	print_waveform, .-print_waveform
	.align	2
	.global	write_wav
	.type	write_wav, %function
write_wav:
.LFB84:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -16
	.cfi_offset 20, -8
	mov	x20, x1
	mov	w2, 420
	mov	w1, 577
	bl	open
	tbnz	w0, #31, .L45
	mov	w19, w0
	ldr	w2, [x20, 40]
	add	x2, x2, 44
	mov	x1, x20
	bl	write
	mov	w0, w19
	bl	close
.L41:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
.L45:
	.cfi_restore_state
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	perror
	b	.L41
	.cfi_endproc
.LFE84:
	.size	write_wav, .-write_wav
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
