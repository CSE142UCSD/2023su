	.file	"arithmetics.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"sum: %d %lf seconds\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB39:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	leaq	-524288(%rsp), %r11
	.cfi_def_cfa 11, 524312
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	.cfi_def_cfa_register 7
	subq	$56, %rsp
	.cfi_def_cfa_offset 524368
	movq	%fs:40, %rax
	movq	%rax, 524328(%rsp)
	xorl	%eax, %eax
	leaq	32(%rsp), %rbx
	leaq	524320(%rsp), %rbp
.L2:
	call	rand@PLT
	movslq	%eax, %rdx
	imulq	$2013296641, %rdx, %rdx
	sarq	$44, %rdx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	imull	$8738, %edx, %edx
	subl	%edx, %eax
	movl	%eax, (%rbx)
	addq	$4, %rbx
	cmpq	%rbp, %rbx
	jne	.L2
	movq	%rsp, %rdi
	movl	$0, %esi
	call	gettimeofday@PLT
	movl	$0, %eax
	movl	$0, %ebx
.L3:
	movl	%eax, %edx
	andl	$131071, %edx
	addl	32(%rsp,%rdx,4), %ebx
	addl	$15, %eax
	cmpl	$2115098112, %eax
	jne	.L3
	leaq	16(%rsp), %rdi
	movl	$0, %esi
	call	gettimeofday@PLT
	imulq	$1000000, 16(%rsp), %rax
	addq	24(%rsp), %rax
	imulq	$1000000, (%rsp), %rdx
	addq	8(%rsp), %rdx
	subq	%rdx, %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	divsd	.LC0(%rip), %xmm0
	movl	%ebx, %edx
	leaq	.LC1(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk@PLT
	movq	524328(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L8
	movl	$0, %eax
	addq	$524344, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L8:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE39:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
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
