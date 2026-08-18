	.arch armv8-a
	.file	"wav.c"
	.text
	.section	.rodata
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
.LFB64:
	.cfi_startproc
	stp	x29, x30, [sp, -176]!
	.cfi_def_cfa_offset 176
	.cfi_offset 29, -176
	.cfi_offset 30, -168
	mov	x29, sp
	str	x0, [sp, 24]
	mov	w1, 0
	ldr	x0, [sp, 24]
	bl	open
	str	w0, [sp, 172]
	ldr	w0, [sp, 172]
	cmp	w0, 0
	bge	.L2
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	perror
	mov	x0, 0
	b	.L6
.L2:
	add	x0, sp, 32
	mov	x1, x0
	ldr	w0, [sp, 172]
	bl	fstat
	cmp	w0, 0
	bge	.L4
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	perror
	ldr	w0, [sp, 172]
	bl	close
	mov	x0, 0
	b	.L6
.L4:
	ldr	x0, [sp, 80]
	mov	x5, 0
	ldr	w4, [sp, 172]
	mov	w3, 2
	mov	w2, 3
	mov	x1, x0
	mov	x0, 0
	bl	mmap
	str	x0, [sp, 160]
	ldr	w0, [sp, 172]
	bl	close
	ldr	x0, [sp, 160]
	cmn	x0, #1
	bne	.L5
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	perror
	mov	x0, 0
	b	.L6
.L5:
	ldr	x0, [sp, 160]
.L6:
	ldp	x29, x30, [sp], 176
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE64:
	.size	read_wav, .-read_wav
	.section	.rodata
	.align	3
.LC3:
	.string	"malloc"
	.align	3
.LC4:
	.string	"RIFF"
	.align	3
.LC5:
	.string	"fmt "
	.align	3
.LC6:
	.string	"data"
	.text
	.align	2
	.global	new_wav
	.type	new_wav, %function
new_wav:
.LFB65:
	.cfi_startproc
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	mov	x29, sp
	strh	w0, [sp, 30]
	str	w1, [sp, 24]
	strh	w2, [sp, 28]
	str	w3, [sp, 20]
	ldrh	w0, [sp, 28]
	lsr	w0, w0, 3
	and	w1, w0, 65535
	ldrh	w0, [sp, 30]
	mul	w0, w1, w0
	strh	w0, [sp, 62]
	ldrh	w0, [sp, 62]
	ldr	w1, [sp, 20]
	mul	w0, w1, w0
	str	w0, [sp, 56]
	ldr	w0, [sp, 56]
	add	x0, x0, 44
	str	x0, [sp, 48]
	ldr	x0, [sp, 48]
	bl	malloc
	str	x0, [sp, 40]
	ldr	x0, [sp, 40]
	cmp	x0, 0
	bne	.L8
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	bl	perror
	mov	x0, 0
	b	.L9
.L8:
	ldr	x3, [sp, 40]
	mov	x2, 4
	adrp	x0, .LC4
	add	x1, x0, :lo12:.LC4
	mov	x0, x3
	bl	memcpy
	ldr	x0, [sp, 48]
	sub	w1, w0, #8
	ldr	x0, [sp, 40]
	str	w1, [x0, 4]
	ldr	x0, [sp, 40]
	mov	w1, 16727
	movk	w1, 0x4556, lsl 16
	str	w1, [x0, 8]
	ldr	x0, [sp, 40]
	add	x3, x0, 12
	mov	x2, 4
	adrp	x0, .LC5
	add	x1, x0, :lo12:.LC5
	mov	x0, x3
	bl	memcpy
	ldr	x0, [sp, 40]
	mov	w1, 16
	str	w1, [x0, 16]
	ldr	x0, [sp, 40]
	mov	w1, 1
	strh	w1, [x0, 20]
	ldr	x0, [sp, 40]
	ldrh	w1, [sp, 30]
	strh	w1, [x0, 22]
	ldr	x0, [sp, 40]
	ldr	w1, [sp, 24]
	str	w1, [x0, 24]
	ldrh	w1, [sp, 62]
	ldr	w0, [sp, 24]
	mul	w1, w1, w0
	ldr	x0, [sp, 40]
	str	w1, [x0, 28]
	ldr	x0, [sp, 40]
	ldrh	w1, [sp, 62]
	strh	w1, [x0, 32]
	ldr	x0, [sp, 40]
	ldrh	w1, [sp, 28]
	strh	w1, [x0, 34]
	ldr	x0, [sp, 40]
	add	x3, x0, 36
	mov	x2, 4
	adrp	x0, .LC6
	add	x1, x0, :lo12:.LC6
	mov	x0, x3
	bl	memcpy
	ldr	x0, [sp, 40]
	ldr	w1, [sp, 56]
	str	w1, [x0, 40]
	ldr	x0, [sp, 40]
.L9:
	ldp	x29, x30, [sp], 64
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE65:
	.size	new_wav, .-new_wav
	.section	.rodata
	.align	3
.LC7:
	.string	"ckID:        %.4s\n"
	.align	3
.LC8:
	.string	"cksize:      %u bytes\n"
	.align	3
.LC9:
	.string	"wavID:       %.4s\n"
	.align	3
.LC10:
	.string	"fmt ckID:    %.4s\n"
	.align	3
.LC11:
	.string	"fmt cksize:  %u\n"
	.align	3
.LC12:
	.string	"formatTag:   %u\n"
	.align	3
.LC13:
	.string	"channels:    %u\n"
	.align	3
.LC14:
	.string	"sample rate: %u Hz\n"
	.align	3
.LC15:
	.string	"byte rate:   %u B/s\n"
	.align	3
.LC16:
	.string	"block align: %u bytes\n"
	.align	3
.LC17:
	.string	"bits/sample: %u\n"
	.align	3
.LC18:
	.string	"data ckID:   %.4s\n"
	.align	3
.LC19:
	.string	"data cksize: %u bytes\n"
	.align	3
.LC20:
	.string	"frames:      %zu\n"
	.align	3
.LC21:
	.string	"duration:    %.2f s\n"
	.text
	.align	2
	.global	print_wav_info
	.type	print_wav_info, %function
print_wav_info:
.LFB66:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	x0, [sp, 24]
	ldr	x0, [sp, 24]
	mov	x1, x0
	adrp	x0, .LC7
	add	x0, x0, :lo12:.LC7
	bl	printf
	ldr	x0, [sp, 24]
	ldr	w0, [x0, 4]
	mov	w1, w0
	adrp	x0, .LC8
	add	x0, x0, :lo12:.LC8
	bl	printf
	ldr	x0, [sp, 24]
	add	x0, x0, 8
	mov	x1, x0
	adrp	x0, .LC9
	add	x0, x0, :lo12:.LC9
	bl	printf
	ldr	x0, [sp, 24]
	add	x0, x0, 12
	mov	x1, x0
	adrp	x0, .LC10
	add	x0, x0, :lo12:.LC10
	bl	printf
	ldr	x0, [sp, 24]
	ldr	w0, [x0, 16]
	mov	w1, w0
	adrp	x0, .LC11
	add	x0, x0, :lo12:.LC11
	bl	printf
	ldr	x0, [sp, 24]
	ldrh	w0, [x0, 20]
	mov	w1, w0
	adrp	x0, .LC12
	add	x0, x0, :lo12:.LC12
	bl	printf
	ldr	x0, [sp, 24]
	ldrh	w0, [x0, 22]
	mov	w1, w0
	adrp	x0, .LC13
	add	x0, x0, :lo12:.LC13
	bl	printf
	ldr	x0, [sp, 24]
	ldr	w0, [x0, 24]
	mov	w1, w0
	adrp	x0, .LC14
	add	x0, x0, :lo12:.LC14
	bl	printf
	ldr	x0, [sp, 24]
	ldr	w0, [x0, 28]
	mov	w1, w0
	adrp	x0, .LC15
	add	x0, x0, :lo12:.LC15
	bl	printf
	ldr	x0, [sp, 24]
	ldrh	w0, [x0, 32]
	mov	w1, w0
	adrp	x0, .LC16
	add	x0, x0, :lo12:.LC16
	bl	printf
	ldr	x0, [sp, 24]
	ldrh	w0, [x0, 34]
	mov	w1, w0
	adrp	x0, .LC17
	add	x0, x0, :lo12:.LC17
	bl	printf
	ldr	x0, [sp, 24]
	add	x0, x0, 36
	mov	x1, x0
	adrp	x0, .LC18
	add	x0, x0, :lo12:.LC18
	bl	printf
	ldr	x0, [sp, 24]
	ldr	w0, [x0, 40]
	mov	w1, w0
	adrp	x0, .LC19
	add	x0, x0, :lo12:.LC19
	bl	printf
	ldr	x0, [sp, 24]
	ldr	w0, [x0, 40]
	ldr	x1, [sp, 24]
	ldrh	w1, [x1, 32]
	udiv	w0, w0, w1
	uxtw	x0, w0
	str	x0, [sp, 40]
	ldr	d31, [sp, 40]
	ucvtf	d30, d31
	ldr	x0, [sp, 24]
	ldr	w0, [x0, 24]
	ucvtf	d31, w0
	fdiv	d31, d30, d31
	str	d31, [sp, 32]
	ldr	x1, [sp, 40]
	adrp	x0, .LC20
	add	x0, x0, :lo12:.LC20
	bl	printf
	ldr	d0, [sp, 32]
	adrp	x0, .LC21
	add	x0, x0, :lo12:.LC21
	bl	printf
	nop
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE66:
	.size	print_wav_info, .-print_wav_info
	.section	.rodata
	.align	3
.LC22:
	.string	" "
	.align	3
.LC23:
	.string	"\342\226\210"
	.align	3
.LC24:
	.string	"\342\226\204"
	.align	3
.LC25:
	.string	"\342\226\200"
	.align	3
.LC26:
	.string	"\342\224\200"
	.text
	.align	2
	.global	print_waveform
	.type	print_waveform, %function
print_waveform:
.LFB67:
	.cfi_startproc
	stp	x29, x30, [sp, -192]!
	.cfi_def_cfa_offset 192
	.cfi_offset 29, -192
	.cfi_offset 30, -184
	mov	x29, sp
	.cfi_def_cfa_register 29
	str	x19, [sp, 16]
	.cfi_offset 19, -176
	str	x0, [x29, 40]
	mov	x0, sp
	mov	x19, x0
	ldr	x0, [x29, 40]
	add	x0, x0, 44
	str	x0, [x29, 136]
	ldr	x0, [x29, 40]
	ldrh	w0, [x0, 32]
	lsr	w0, w0, 1
	and	w0, w0, 65535
	str	w0, [x29, 132]
	ldr	x0, [x29, 40]
	ldr	w0, [x0, 40]
	ldr	x1, [x29, 40]
	ldrh	w1, [x1, 32]
	udiv	w0, w0, w1
	str	w0, [x29, 128]
	mov	w0, 120
	str	w0, [x29, 124]
	mov	w0, 12
	str	w0, [x29, 120]
	ldr	w0, [x29, 120]
	lsl	w0, w0, 1
	str	w0, [x29, 116]
	ldr	w0, [x29, 124]
	ldr	w1, [x29, 128]
	udiv	w0, w1, w0
	str	w0, [x29, 188]
	ldr	w0, [x29, 188]
	cmp	w0, 0
	bne	.L12
	mov	w0, 1
	str	w0, [x29, 188]
.L12:
	ldrsw	x0, [x29, 124]
	sub	x0, x0, #1
	str	x0, [x29, 104]
	ldrsw	x0, [x29, 124]
	mov	x8, x0
	mov	x9, 0
	lsr	x0, x8, 59
	lsl	x17, x9, 5
	orr	x17, x0, x17
	lsl	x16, x8, 5
	ldrsw	x0, [x29, 124]
	mov	x6, x0
	mov	x7, 0
	lsr	x0, x6, 59
	lsl	x15, x7, 5
	orr	x15, x0, x15
	lsl	x14, x6, 5
	ldrsw	x0, [x29, 124]
	lsl	x0, x0, 2
	add	x0, x0, 15
	lsr	x0, x0, 4
	lsl	x0, x0, 4
	sub	sp, sp, x0
	mov	x0, sp
	add	x0, x0, 3
	lsr	x0, x0, 2
	lsl	x0, x0, 2
	str	x0, [x29, 96]
	ldrsw	x0, [x29, 124]
	sub	x0, x0, #1
	str	x0, [x29, 88]
	ldrsw	x0, [x29, 124]
	mov	x4, x0
	mov	x5, 0
	lsr	x0, x4, 59
	lsl	x13, x5, 5
	orr	x13, x0, x13
	lsl	x12, x4, 5
	ldrsw	x0, [x29, 124]
	mov	x2, x0
	mov	x3, 0
	lsr	x0, x2, 59
	lsl	x11, x3, 5
	orr	x11, x0, x11
	lsl	x10, x2, 5
	ldrsw	x0, [x29, 124]
	lsl	x0, x0, 2
	add	x0, x0, 15
	lsr	x0, x0, 4
	lsl	x0, x0, 4
	sub	sp, sp, x0
	mov	x0, sp
	add	x0, x0, 3
	lsr	x0, x0, 2
	lsl	x0, x0, 2
	str	x0, [x29, 80]
	mov	w0, 32767
	str	w0, [x29, 184]
	mov	w0, -32768
	str	w0, [x29, 180]
	str	wzr, [x29, 176]
	b	.L13
.L23:
	ldr	w0, [x29, 176]
	ldr	w1, [x29, 188]
	mul	w0, w1, w0
	str	w0, [x29, 52]
	ldr	w1, [x29, 52]
	ldr	w0, [x29, 188]
	add	w0, w1, w0
	str	w0, [x29, 172]
	ldr	w1, [x29, 172]
	ldr	w0, [x29, 128]
	cmp	w1, w0
	bls	.L14
	ldr	w0, [x29, 128]
	str	w0, [x29, 172]
.L14:
	ldr	w1, [x29, 52]
	ldr	w0, [x29, 132]
	mul	w0, w1, w0
	uxtw	x0, w0
	lsl	x0, x0, 1
	ldr	x1, [x29, 136]
	add	x0, x1, x0
	ldrh	w0, [x0]
	strh	w0, [x29, 170]
	ldr	w1, [x29, 52]
	ldr	w0, [x29, 132]
	mul	w0, w1, w0
	add	w0, w0, 1
	uxtw	x0, w0
	lsl	x0, x0, 1
	ldr	x1, [x29, 136]
	add	x0, x1, x0
	ldrh	w0, [x0]
	strh	w0, [x29, 168]
	ldr	w0, [x29, 52]
	str	w0, [x29, 164]
	b	.L15
.L18:
	ldr	w1, [x29, 164]
	ldr	w0, [x29, 132]
	mul	w0, w1, w0
	uxtw	x0, w0
	lsl	x0, x0, 1
	ldr	x1, [x29, 136]
	add	x0, x1, x0
	ldrh	w0, [x0]
	strh	w0, [x29, 50]
	ldr	w1, [x29, 164]
	ldr	w0, [x29, 132]
	mul	w0, w1, w0
	add	w0, w0, 1
	uxtw	x0, w0
	lsl	x0, x0, 1
	ldr	x1, [x29, 136]
	add	x0, x1, x0
	ldrh	w0, [x0]
	strh	w0, [x29, 48]
	ldrsh	w1, [x29, 50]
	ldrsh	w0, [x29, 170]
	cmp	w1, w0
	ble	.L16
	ldrh	w0, [x29, 50]
	strh	w0, [x29, 170]
.L16:
	ldrsh	w1, [x29, 48]
	ldrsh	w0, [x29, 168]
	cmp	w1, w0
	ble	.L17
	ldrh	w0, [x29, 48]
	strh	w0, [x29, 168]
.L17:
	ldr	w0, [x29, 164]
	add	w0, w0, 1
	str	w0, [x29, 164]
.L15:
	ldr	w1, [x29, 164]
	ldr	w0, [x29, 172]
	cmp	w1, w0
	bcc	.L18
	ldrsh	w2, [x29, 170]
	ldr	x0, [x29, 96]
	ldrsw	x1, [x29, 176]
	str	w2, [x0, x1, lsl 2]
	ldrsh	w2, [x29, 168]
	ldr	x0, [x29, 80]
	ldrsw	x1, [x29, 176]
	str	w2, [x0, x1, lsl 2]
	ldrsh	w0, [x29, 170]
	ldr	w1, [x29, 184]
	cmp	w1, w0
	ble	.L19
	ldrsh	w0, [x29, 170]
	str	w0, [x29, 184]
.L19:
	ldrsh	w0, [x29, 168]
	ldr	w1, [x29, 184]
	cmp	w1, w0
	ble	.L20
	ldrsh	w0, [x29, 168]
	str	w0, [x29, 184]
.L20:
	ldrsh	w0, [x29, 170]
	ldr	w1, [x29, 180]
	cmp	w1, w0
	bge	.L21
	ldrsh	w0, [x29, 170]
	str	w0, [x29, 180]
.L21:
	ldrsh	w0, [x29, 168]
	ldr	w1, [x29, 180]
	cmp	w1, w0
	bge	.L22
	ldrsh	w0, [x29, 168]
	str	w0, [x29, 180]
.L22:
	ldr	w0, [x29, 176]
	add	w0, w0, 1
	str	w0, [x29, 176]
.L13:
	ldr	w1, [x29, 176]
	ldr	w0, [x29, 124]
	cmp	w1, w0
	blt	.L23
	ldr	w1, [x29, 180]
	ldr	w0, [x29, 184]
	sub	w0, w1, w0
	str	w0, [x29, 160]
	ldr	w0, [x29, 160]
	cmp	w0, 0
	bne	.L24
	mov	w0, 1
	str	w0, [x29, 160]
.L24:
	ldr	w0, [x29, 120]
	str	w0, [x29, 156]
	b	.L25
.L33:
	str	wzr, [x29, 152]
	b	.L26
.L32:
	ldr	x0, [x29, 96]
	ldrsw	x1, [x29, 152]
	ldr	w1, [x0, x1, lsl 2]
	ldr	w0, [x29, 184]
	sub	w1, w1, w0
	ldr	w0, [x29, 116]
	mul	w1, w1, w0
	ldr	w0, [x29, 160]
	sdiv	w0, w1, w0
	str	w0, [x29, 76]
	ldr	x0, [x29, 80]
	ldrsw	x1, [x29, 152]
	ldr	w1, [x0, x1, lsl 2]
	ldr	w0, [x29, 184]
	sub	w1, w1, w0
	ldr	w0, [x29, 116]
	mul	w1, w1, w0
	ldr	w0, [x29, 160]
	sdiv	w0, w1, w0
	str	w0, [x29, 72]
	adrp	x0, .LC22
	add	x0, x0, :lo12:.LC22
	str	x0, [x29, 144]
	ldr	w0, [x29, 156]
	cmp	w0, 0
	ble	.L27
	ldr	w0, [x29, 156]
	sub	w0, w0, #1
	lsl	w0, w0, 1
	add	w0, w0, 1
	str	w0, [x29, 60]
	ldr	w0, [x29, 156]
	lsl	w0, w0, 1
	str	w0, [x29, 56]
	ldr	w1, [x29, 76]
	ldr	w0, [x29, 56]
	cmp	w1, w0
	blt	.L28
	adrp	x0, .LC23
	add	x0, x0, :lo12:.LC23
	str	x0, [x29, 144]
	b	.L29
.L28:
	ldr	w1, [x29, 76]
	ldr	w0, [x29, 60]
	cmp	w1, w0
	blt	.L29
	adrp	x0, .LC24
	add	x0, x0, :lo12:.LC24
	str	x0, [x29, 144]
	b	.L29
.L27:
	ldr	w0, [x29, 156]
	cmp	w0, 0
	bge	.L30
	ldr	w0, [x29, 156]
	mvn	w0, w0
	lsl	w0, w0, 1
	add	w0, w0, 1
	str	w0, [x29, 68]
	ldr	w1, [x29, 156]
	mov	w0, 0
	sub	w0, w0, w1
	lsl	w0, w0, 1
	str	w0, [x29, 64]
	ldr	w1, [x29, 72]
	ldr	w0, [x29, 64]
	cmp	w1, w0
	blt	.L31
	adrp	x0, .LC23
	add	x0, x0, :lo12:.LC23
	str	x0, [x29, 144]
	b	.L29
.L31:
	ldr	w1, [x29, 72]
	ldr	w0, [x29, 68]
	cmp	w1, w0
	blt	.L29
	adrp	x0, .LC25
	add	x0, x0, :lo12:.LC25
	str	x0, [x29, 144]
	b	.L29
.L30:
	adrp	x0, .LC26
	add	x0, x0, :lo12:.LC26
	str	x0, [x29, 144]
.L29:
	adrp	x0, :got:stdout;ldr	x0, [x0, :got_lo12:stdout]
	ldr	x0, [x0]
	mov	x1, x0
	ldr	x0, [x29, 144]
	bl	fputs
	ldr	w0, [x29, 152]
	add	w0, w0, 1
	str	w0, [x29, 152]
.L26:
	ldr	w1, [x29, 152]
	ldr	w0, [x29, 124]
	cmp	w1, w0
	blt	.L32
	mov	w0, 10
	bl	putchar
	ldr	w0, [x29, 156]
	sub	w0, w0, #1
	str	w0, [x29, 156]
.L25:
	ldr	w0, [x29, 120]
	neg	w0, w0
	ldr	w1, [x29, 156]
	cmp	w1, w0
	bge	.L33
	mov	sp, x19
	nop
	mov	sp, x29
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 192
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE67:
	.size	print_waveform, .-print_waveform
	.align	2
	.global	write_wav
	.type	write_wav, %function
write_wav:
.LFB68:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	x0, [sp, 24]
	str	x1, [sp, 16]
	mov	w2, 420
	mov	w1, 577
	ldr	x0, [sp, 24]
	bl	open
	str	w0, [sp, 44]
	ldr	w0, [sp, 44]
	cmp	w0, 0
	bge	.L35
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	perror
	b	.L34
.L35:
	ldr	x0, [sp, 16]
	ldr	w0, [x0, 40]
	uxtw	x0, w0
	add	x0, x0, 44
	str	x0, [sp, 32]
	ldr	x2, [sp, 32]
	ldr	x1, [sp, 16]
	ldr	w0, [sp, 44]
	bl	write
	ldr	w0, [sp, 44]
	bl	close
.L34:
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE68:
	.size	write_wav, .-write_wav
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
