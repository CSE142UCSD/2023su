	.arch armv8-a
	.file	"madd.c"
	.text
	.section	.text.startup,"ax",@progbits
	.align	2
	.p2align 3,,7
	.global	main
	.type	main, %function
main:
	stp	x29, x30, [sp, -112]!
	cmp	w0, 1
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	bgt	.L2
	stp	x27, x28, [x29, 80]
	mov	x0, 131072
	bl	malloc
	mov	x21, x0
	mov	w19, 16384
	mov	x22, 131072
	str	wzr, [x29, 100]
.L3:
	mov	w23, 34079
	mov	x24, 0
	movk	w23, 0x51eb, lsl 16
	mov	w20, 100
	.p2align 3
.L6:
	bl	rand
	smull	x1, w0, w23
	asr	x1, x1, 37
	sub	w1, w1, w0, asr 31
	msub	w0, w1, w20, w0
	add	w0, w0, 1
	scvtf	d0, w0
	str	d0, [x21, x24, lsl 3]
	add	x24, x24, 1
	cmp	w19, w24
	bgt	.L6
	mov	x0, x22
	sub	w20, w19, #1
	bl	malloc
	mov	x1, x0
	mov	x0, 8
	mov	w25, 34079
	add	x20, x0, x20, uxtw 3
	mov	x26, x1
	add	x23, x20, x1
	movk	w25, 0x51eb, lsl 16
	mov	w24, 100
	str	x1, [x29, 104]
	.p2align 3
.L7:
	bl	rand
	smull	x1, w0, w25
	asr	x1, x1, 37
	sub	w1, w1, w0, asr 31
	msub	w0, w1, w24, w0
	add	w0, w0, 1
	scvtf	d0, w0
	str	d0, [x26], 8
	cmp	x26, x23
	bne	.L7
	mov	x0, x22
	mov	w25, 34079
	bl	malloc
	mov	x24, x0
	mov	x28, x0
	add	x26, x20, x0
	movk	w25, 0x51eb, lsl 16
	mov	w23, 100
	.p2align 3
.L9:
	bl	rand
	smull	x1, w0, w25
	asr	x1, x1, 37
	sub	w1, w1, w0, asr 31
	msub	w0, w1, w23, w0
	add	w0, w0, 1
	scvtf	d0, w0
	str	d0, [x28], 8
	cmp	x28, x26
	bne	.L9
	mov	x0, x22
	mov	w26, 34079
	bl	malloc
	mov	x25, x0
	mov	x27, x0
	add	x28, x20, x0
	movk	w26, 0x51eb, lsl 16
	mov	w23, 100
	.p2align 3
.L11:
	bl	rand
	smull	x1, w0, w26
	asr	x1, x1, 37
	sub	w1, w1, w0, asr 31
	msub	w0, w1, w23, w0
	add	w0, w0, 1
	scvtf	d0, w0
	str	d0, [x27], 8
	cmp	x28, x27
	bne	.L11
	mov	x0, x22
	mov	w28, 34079
	bl	malloc
	mov	x26, x0
	mov	x27, x0
	add	x20, x20, x0
	movk	w28, 0x51eb, lsl 16
	mov	w23, 100
	.p2align 3
.L13:
	bl	rand
	smull	x1, w0, w28
	asr	x1, x1, 37
	sub	w1, w1, w0, asr 31
	msub	w0, w1, w23, w0
	add	w0, w0, 1
	scvtf	d0, w0
	str	d0, [x27], 8
	cmp	x20, x27
	bne	.L13
	mov	x0, x22
	mov	w23, 34079
	bl	malloc
	mov	x20, x0
	mov	x28, 0
	movk	w23, 0x51eb, lsl 16
	mov	w22, 100
	.p2align 3
.L15:
	bl	rand
	smull	x1, w0, w23
	asr	x1, x1, 37
	sub	w1, w1, w0, asr 31
	msub	w0, w1, w22, w0
	add	w0, w0, 1
	scvtf	d0, w0
	str	d0, [x20, x28, lsl 3]
	add	x28, x28, 1
	cmp	w19, w28
	bgt	.L15
	ldp	x27, x28, [x29, 80]
.L21:
	ldr	w1, [x29, 100]
	cmp	w1, 0
	ble	.L16
	ubfx	w0, w21, 3, 1
	mov	w4, 1
	cmp	w0, 0
	mov	w2, 2
	sub	w1, w1, #1
	csel	w2, w4, w2, eq
	cmp	w2, w1
	bhi	.L23
	mov	w3, 0
	cbz	w0, .L18
	ldr	x1, [x29, 104]
	mov	w3, w4
	ldr	d0, [x21]
	ldr	d3, [x24]
	ldr	d2, [x26]
	ldr	d4, [x1]
	ldr	d1, [x25]
	fmadd	d0, d0, d4, d3
	fadd	d0, d0, d2
	fdiv	d0, d0, d1
	str	d0, [x20]
.L18:
	ldr	w1, [x29, 100]
	uxtw	x2, w0
	ldr	x5, [x29, 104]
	sub	w4, w1, w0
	lsl	x2, x2, 3
	add	x8, x5, x2
	add	x9, x21, x2
	add	x7, x24, x2
	add	x6, x26, x2
	add	x5, x25, x2
	lsr	w10, w4, 1
	add	x2, x20, x2
	mov	x0, 0
	mov	w1, 0
	.p2align 3
.L19:
	ldr	q4, [x8, x0]
	add	w1, w1, 1
	ldr	q0, [x7, x0]
	cmp	w10, w1
	ldr	q3, [x9, x0]
	ldr	q2, [x6, x0]
	fmla	v0.2d, v4.2d, v3.2d
	ldr	q1, [x5, x0]
	fadd	v0.2d, v0.2d, v2.2d
	fdiv	v0.2d, v0.2d, v1.2d
	str	q0, [x2, x0]
	add	x0, x0, 16
	bhi	.L19
	and	w1, w4, -2
	add	w0, w1, w3
	cmp	w1, w4
	beq	.L16
.L17:
	ldr	x1, [x29, 104]
	sbfiz	x0, x0, 3, 32
	ldr	d0, [x21, x0]
	ldr	d4, [x1, x0]
	ldr	d3, [x24, x0]
	ldr	d2, [x26, x0]
	fmadd	d0, d0, d4, d3
	ldr	d1, [x25, x0]
	fadd	d0, d0, d2
	fdiv	d0, d0, d1
	str	d0, [x20, x0]
.L16:
	bl	rand
	negs	w2, w0
	and	w2, w2, 255
	and	w0, w0, 255
	csneg	w2, w0, w2, mi
	adrp	x1, .LC0
	mov	w0, 1
	add	x1, x1, :lo12:.LC0
	ldr	d0, [x24, w2, sxtw 3]
	bl	__printf_chk
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 112
	ret
.L2:
	mov	x21, x1
	mov	w20, w0
	mov	w2, 10
	mov	x1, 0
	ldr	x0, [x21, 8]
	bl	strtol
	mov	x23, x0
	mov	w19, w0
	cmp	w20, 2
	beq	.L22
	ldr	x0, [x21, 16]
	mov	w2, 10
	mov	x1, 0
	bl	strtol
	str	w0, [x29, 100]
.L4:
	sbfiz	x22, x23, 3, 32
	mov	x0, x22
	bl	malloc
	cmp	w23, 0
	mov	x21, x0
	ble	.L5
	stp	x27, x28, [x29, 80]
	b	.L3
.L5:
	mov	x0, x22
	bl	malloc
	str	x0, [x29, 104]
	mov	x0, x22
	bl	malloc
	mov	x24, x0
	mov	x0, x22
	bl	malloc
	mov	x25, x0
	mov	x0, x22
	bl	malloc
	mov	x26, x0
	mov	x0, x22
	bl	malloc
	mov	x20, x0
	b	.L21
.L22:
	str	wzr, [x29, 100]
	b	.L4
.L23:
	mov	w0, 0
	b	.L17
	.size	main, .-main
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"%lf\n"
	.ident	"GCC: (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
