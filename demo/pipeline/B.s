	.file	"arithmetics.c"
	.text
	.section	.rodata
.LC1:
	.string	"sum: %d %lf seconds\n"
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
	leaq	-524288(%rsp), %r11
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	subq	$64, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -524344(%rbp)
	movl	$0, -524340(%rbp)
	movl	$0, -524348(%rbp)
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
	movl	-524348(%rbp), %eax
	cltq
	movl	%edx, -524304(%rbp,%rax,4)
	addl	$1, -524348(%rbp)
.L2:
	cmpl	$131071, -524348(%rbp)
	jle	.L3
	leaq	-524336(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	gettimeofday@PLT
	movl	$0, -524348(%rbp)
	jmp	.L4
.L5:
	movl	-524348(%rbp), %eax
	leal	0(,%rax,8), %edx
	movl	-524348(%rbp), %eax
	sall	$2, %eax
	addl	%eax, %edx
	movl	-524348(%rbp), %eax
	addl	%edx, %eax
	andl	$131071, %eax
	cltq
	movl	-524304(%rbp,%rax,4), %eax
	addl	%eax, -524344(%rbp)
	addl	$1, -524348(%rbp)
.L4:
	cmpl	$999999999, -524348(%rbp)
	jle	.L5
	leaq	-524320(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	gettimeofday@PLT
	movq	-524320(%rbp), %rax
	imulq	$1000000, %rax, %rdx
	movq	-524312(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	movq	-524336(%rbp), %rax
	imulq	$1000000, %rax, %rdx
	movq	-524328(%rbp), %rax
	addq	%rdx, %rax
	subq	%rax, %rcx
	movq	%rcx, %rax
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC0(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movl	-524344(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rdi
	movl	$1, %eax
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
.LC0:
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
