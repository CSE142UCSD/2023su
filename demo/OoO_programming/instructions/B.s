	.file	"arithmetics_3.c"
	.text
	.section	.rodata
.LC2:
	.string	"sum: %.lf %lf seconds\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	-798720(%rsp), %r11
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	subq	$1360, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -800068(%rbp)
	movl	$0, -800064(%rbp)
	movl	$0, -800060(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -800056(%rbp)
	movl	$0, -800072(%rbp)
	jmp	.L2
.L3:
	call	rand@PLT
	movslq	%eax, %rdx
	imulq	$2013296641, %rdx, %rdx
	shrq	$32, %rdx
	movl	%edx, %ecx
	sarl	$12, %ecx
	cltd
	subl	%edx, %ecx
	movl	%ecx, %edx
	imull	$8738, %edx, %edx
	subl	%edx, %eax
	movl	%eax, %edx
	movl	-800072(%rbp), %eax
	cltq
	movl	%edx, -800016(%rbp,%rax,4)
	addl	$1, -800072(%rbp)
.L2:
	cmpl	$199999, -800072(%rbp)
	jle	.L3
	leaq	-800048(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	gettimeofday@PLT
	movl	$0, -800072(%rbp)
	jmp	.L4
.L5:
	movl	-800072(%rbp), %eax
	sall	$4, %eax
	movl	%eax, %edx
	movl	-800072(%rbp), %eax
	sall	$2, %eax
	subl	%eax, %edx
	movl	-800072(%rbp), %eax
	addl	%eax, %edx
	movslq	%edx, %rax
	imulq	$351843721, %rax, %rax
	shrq	$32, %rax
	movl	%eax, %ecx
	sarl	$14, %ecx
	movl	%edx, %eax
	sarl	$31, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	imull	$200000, %eax, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	cltq
	movl	-800016(%rbp,%rax,4), %eax
	cvtsi2sdl	%eax, %xmm0
	movsd	-800056(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -800056(%rbp)
	addl	$1, -800072(%rbp)
.L4:
	cmpl	$999999999, -800072(%rbp)
	jle	.L5
	leaq	-800032(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	gettimeofday@PLT
	movq	-800032(%rbp), %rax
	imulq	$1000000, %rax, %rdx
	movq	-800024(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	movq	-800048(%rbp), %rax
	imulq	$1000000, %rax, %rdx
	movq	-800040(%rbp), %rax
	addq	%rdx, %rax
	subq	%rax, %rcx
	movq	%rcx, %rax
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC1(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movq	-800056(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	leaq	.LC2(%rip), %rdi
	movl	$2, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rsi
	xorq	%fs:40, %rsi
	je	.L7
	call	__stack_chk_fail@PLT
.L7:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC1:
	.long	0
	.long	1093567616
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
