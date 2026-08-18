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
	.p2align 5,,15
	.global	read_wav
	.type	read_wav, %function
read_wav:
.LFB80:
	.cfi_startproc
	stp	x29, x30, [sp, -160]!
	.cfi_def_cfa_offset 160
	.cfi_offset 29, -160
	.cfi_offset 30, -152
	mov	w1, 0
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -144
	.cfi_offset 20, -136
	bl	open
	tbnz	w0, #31, .L8
	mov	w19, w0
	add	x1, sp, 32
	bl	fstat
	tbnz	w0, #31, .L9
	ldr	x1, [sp, 80]
	mov	w4, w19
	mov	x5, 0
	mov	w3, 2
	mov	w2, 3
	mov	x0, 0
	bl	mmap
	mov	x20, x0
	mov	w0, w19
	bl	close
	cmn	x20, #1
	beq	.L10
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
.L8:
	.cfi_restore_state
	adrp	x0, .LC0
	mov	x20, 0
	add	x0, x0, :lo12:.LC0
	bl	perror
	b	.L1
.L10:
	adrp	x0, .LC2
	mov	x20, 0
	add	x0, x0, :lo12:.LC2
	bl	perror
	b	.L1
.L9:
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	perror
	mov	x20, 0
	mov	w0, w19
	bl	close
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
	.p2align 5,,15
	.global	new_wav
	.type	new_wav, %function
new_wav:
.LFB81:
	.cfi_startproc
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -48
	.cfi_offset 20, -40
	ubfx	w20, w2, 3, 13
	stp	x23, x24, [sp, 48]
	.cfi_offset 23, -16
	.cfi_offset 24, -8
	and	w23, w0, 65535
	and	w24, w2, 65535
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -32
	.cfi_offset 22, -24
	mov	w22, w1
	mul	w20, w23, w20
	and	w20, w20, 65535
	mul	w0, w20, w3
	mov	x21, x0
	add	x0, x0, 44
	bl	malloc
	mov	x19, x0
	cbz	x0, .L15
	mul	w1, w20, w22
	mov	w6, 18770
	mov	w4, 16727
	mov	w5, 28006
	mov	w0, 24932
	add	w7, w21, 36
	movk	w6, 0x4646, lsl 16
	movk	w4, 0x4556, lsl 16
	movk	w5, 0x2074, lsl 16
	mov	w3, 16
	mov	w2, 1
	movk	w0, 0x6174, lsl 16
	stp	w6, w7, [x19]
	stp	w4, w5, [x19, 8]
	str	w3, [x19, 16]
	strh	w2, [x19, 20]
	strh	w23, [x19, 22]
	stp	w22, w1, [x19, 24]
	strh	w20, [x19, 32]
	strh	w24, [x19, 34]
	stp	w0, w21, [x19, 36]
.L11:
	mov	x0, x19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
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
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	bl	perror
	b	.L11
	.cfi_endproc
.LFE81:
	.size	new_wav, .-new_wav
	.section	.rodata.str1.8
	.align	3
.LC4:
	.string	"ckID:        %.4s\n"
	.align	3
.LC5:
	.string	"cksize:      %u bytes\n"
	.align	3
.LC6:
	.string	"wavID:       %.4s\n"
	.align	3
.LC7:
	.string	"fmt ckID:    %.4s\n"
	.align	3
.LC8:
	.string	"fmt cksize:  %u\n"
	.align	3
.LC9:
	.string	"formatTag:   %u\n"
	.align	3
.LC10:
	.string	"channels:    %u\n"
	.align	3
.LC11:
	.string	"sample rate: %u Hz\n"
	.align	3
.LC12:
	.string	"byte rate:   %u B/s\n"
	.align	3
.LC13:
	.string	"block align: %u bytes\n"
	.align	3
.LC14:
	.string	"bits/sample: %u\n"
	.align	3
.LC15:
	.string	"data ckID:   %.4s\n"
	.align	3
.LC16:
	.string	"data cksize: %u bytes\n"
	.align	3
.LC17:
	.string	"frames:      %zu\n"
	.align	3
.LC18:
	.string	"duration:    %.2f s\n"
	.text
	.align	2
	.p2align 5,,15
	.global	print_wav_info
	.type	print_wav_info, %function
print_wav_info:
.LFB82:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	adrp	x1, .LC4
	mov	x29, sp
	str	x19, [sp, 16]
	.cfi_offset 19, -16
	mov	x19, x0
	add	x0, x1, :lo12:.LC4
	mov	x1, x19
	str	d15, [sp, 24]
	.cfi_offset 79, -8
	bl	printf
	ldr	w1, [x19, 4]
	adrp	x0, .LC5
	add	x0, x0, :lo12:.LC5
	bl	printf
	add	x1, x19, 8
	adrp	x0, .LC6
	add	x0, x0, :lo12:.LC6
	bl	printf
	add	x1, x19, 12
	adrp	x0, .LC7
	add	x0, x0, :lo12:.LC7
	bl	printf
	ldr	w1, [x19, 16]
	adrp	x0, .LC8
	add	x0, x0, :lo12:.LC8
	bl	printf
	ldrh	w1, [x19, 20]
	adrp	x0, .LC9
	add	x0, x0, :lo12:.LC9
	bl	printf
	ldrh	w1, [x19, 22]
	adrp	x0, .LC10
	add	x0, x0, :lo12:.LC10
	bl	printf
	ldr	w1, [x19, 24]
	adrp	x0, .LC11
	add	x0, x0, :lo12:.LC11
	bl	printf
	ldr	w1, [x19, 28]
	adrp	x0, .LC12
	add	x0, x0, :lo12:.LC12
	bl	printf
	ldrh	w1, [x19, 32]
	adrp	x0, .LC13
	add	x0, x0, :lo12:.LC13
	bl	printf
	ldrh	w1, [x19, 34]
	adrp	x0, .LC14
	add	x0, x0, :lo12:.LC14
	bl	printf
	add	x1, x19, 36
	adrp	x0, .LC15
	add	x0, x0, :lo12:.LC15
	bl	printf
	ldr	w1, [x19, 40]
	adrp	x0, .LC16
	add	x0, x0, :lo12:.LC16
	bl	printf
	ldrh	w3, [x19, 32]
	adrp	x0, .LC17
	ldr	w1, [x19, 40]
	add	x0, x0, :lo12:.LC17
	ldr	w2, [x19, 24]
	udiv	w1, w1, w3
	ucvtf	d15, w2
	ucvtf	d31, w1
	fdiv	d15, d31, d15
	bl	printf
	fmov	d0, d15
	ldr	x19, [sp, 16]
	adrp	x0, .LC18
	ldr	d15, [sp, 24]
	add	x0, x0, :lo12:.LC18
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 79
	.cfi_def_cfa_offset 0
	b	printf
	.cfi_endproc
.LFE82:
	.size	print_wav_info, .-print_wav_info
	.section	.rodata.str1.8
	.align	3
.LC19:
	.string	" "
	.align	3
.LC20:
	.string	"\342\226\200"
	.align	3
.LC21:
	.string	"\342\224\200"
	.align	3
.LC22:
	.string	"\342\226\210"
	.align	3
.LC23:
	.string	"\342\226\204"
	.text
	.align	2
	.p2align 5,,15
	.global	print_waveform
	.type	print_waveform, %function
print_waveform:
.LFB83:
	.cfi_startproc
	stp	x29, x30, [sp, -112]!
	.cfi_def_cfa_offset 112
	.cfi_offset 29, -112
	.cfi_offset 30, -104
	add	x3, x0, 44
	mov	w1, 34953
	mov	x29, sp
	.cfi_def_cfa_register 29
	movk	w1, 0x8888, lsl 16
	stp	x19, x20, [sp, 16]
	mov	w10, 1
	mov	w12, w10
	stp	x21, x22, [sp, 32]
	mov	x11, 0
	.cfi_offset 19, -96
	.cfi_offset 20, -88
	.cfi_offset 21, -80
	.cfi_offset 22, -72
	mov	w21, -32768
	stp	x23, x24, [sp, 48]
	mov	w22, 32767
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	.cfi_offset 23, -64
	.cfi_offset 24, -56
	.cfi_offset 25, -48
	.cfi_offset 26, -40
	.cfi_offset 27, -32
	.cfi_offset 28, -24
	sub	sp, sp, #480
	mov	x26, sp
	ldr	w13, [x0, 40]
	sub	sp, sp, #480
	ldrh	w0, [x0, 32]
	mov	x27, sp
	lsr	w9, w0, 1
	udiv	w13, w13, w0
	sub	w17, w9, #1
	umull	x14, w13, w1
	cmp	w13, 119
	lsr	x14, x14, 38
	csel	w14, w14, w10, hi
	sub	w16, w14, #1
	mul	w15, w14, w9
	.p2align 5,,15
.L23:
	add	w6, w16, w10
	sub	w0, w12, #1
	cmp	w6, w13
	sub	w2, w10, #1
	csel	w6, w6, w13, ls
	ldrsh	w1, [x3, w12, uxtw 1]
	ldrsh	w0, [x3, x0, lsl 1]
	cmp	w6, w2
	bls	.L20
	cmp	w6, w10
	bls	.L20
	add	w2, w17, w12
	mov	w4, w10
	.p2align 5,,15
.L22:
	add	w5, w2, 1
	ldrsh	w7, [x3, w2, uxtw 1]
	ldrh	w8, [x3, w2, uxtw 1]
	add	w4, w4, 1
	cmp	w7, w0
	add	w2, w2, w9
	ldrsh	w7, [x3, x5, lsl 1]
	csel	w0, w8, w0, ge
	ldrh	w5, [x3, x5, lsl 1]
	cmp	w7, w1
	sxth	w0, w0
	csel	w1, w5, w1, ge
	sxth	w1, w1
	cmp	w6, w4
	bne	.L22
.L20:
	cmp	w0, w1
	str	w0, [x26, x11]
	csel	w2, w0, w1, le
	str	w1, [x27, x11]
	cmp	w22, w2
	add	x11, x11, 4
	csel	w22, w22, w2, le
	cmp	w0, w1
	csel	w0, w0, w1, ge
	add	w12, w12, w15
	cmp	w21, w0
	add	w10, w10, w14
	csel	w21, w21, w0, ge
	cmp	x11, 480
	bne	.L23
	subs	w21, w21, w22
	adrp	x25, .LC21
	adrp	x20, :got:stdout;ldr	x20, [x20, :got_lo12:stdout]
	adrp	x24, .LC22
	csinc	w21, w21, wzr, ne
	add	x25, x25, :lo12:.LC21
	add	x24, x24, :lo12:.LC22
	mov	w23, 24
	mov	w19, 12
.L25:
	sub	w0, w23, #2
	mov	x28, 0
	str	w0, [x29, 104]
	neg	w0, w23
	str	w0, [x29, 108]
	b	.L28
	.p2align 2,,3
.L42:
	ldr	w1, [x26, x28]
	adrp	x0, .LC19
	adrp	x4, .LC23
	add	x3, x0, :lo12:.LC19
	sub	w1, w1, w22
	add	x4, x4, :lo12:.LC23
	mov	x0, x24
	add	w1, w1, w1, lsl 1
	lsl	w1, w1, 3
	sdiv	w1, w1, w21
	cmp	w1, w23
	bge	.L27
	ldr	w0, [x29, 104]
	cmp	w1, w0
	csel	x0, x4, x3, gt
.L27:
	ldr	x1, [x20]
	add	x28, x28, 4
	bl	fputs
	cmp	x28, 480
	beq	.L41
.L28:
	cmp	w19, 0
	bgt	.L42
	mov	x0, x25
	beq	.L27
	ldr	w0, [x27, x28]
	mov	w1, -2
	sub	w5, w1, w23
	adrp	x1, .LC19
	sub	w0, w0, w22
	add	x3, x1, :lo12:.LC19
	adrp	x1, .LC20
	add	x4, x1, :lo12:.LC20
	add	w1, w0, w0, lsl 1
	ldr	w2, [x29, 108]
	mov	x0, x24
	lsl	w1, w1, 3
	sdiv	w1, w1, w21
	cmp	w1, w2
	bge	.L27
	cmp	w1, w5
	add	x28, x28, 4
	ldr	x1, [x20]
	csel	x0, x4, x3, gt
	bl	fputs
	cmp	x28, 480
	bne	.L28
.L41:
	ldr	x1, [x20]
	mov	w0, 10
	sub	w19, w19, #1
	bl	putc
	ldr	w23, [x29, 104]
	cmn	w19, #13
	bne	.L25
	mov	sp, x29
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
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
	.p2align 5,,15
	.global	write_wav
	.type	write_wav, %function
write_wav:
.LFB84:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	w2, 420
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -16
	.cfi_offset 20, -8
	mov	x20, x1
	mov	w1, 577
	bl	open
	tbnz	w0, #31, .L46
	ldr	w2, [x20, 40]
	mov	w19, w0
	mov	x1, x20
	add	x2, x2, 44
	bl	write
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	b	close
.L46:
	.cfi_restore_state
	ldp	x19, x20, [sp, 16]
	adrp	x0, .LC0
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	add	x0, x0, :lo12:.LC0
	b	perror
	.cfi_endproc
.LFE84:
	.size	write_wav, .-write_wav
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
