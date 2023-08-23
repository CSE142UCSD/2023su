	.file	"arithmetics_2.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"sum: %d %lf seconds\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB39:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	leaq	-524288(%rsp), %r11
	.cfi_def_cfa 11, 524320
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	.cfi_def_cfa_register 7
	subq	$48, %rsp
	.cfi_def_cfa_offset 524368
	movq	%fs:40, %rax
	movq	%rax, 524328(%rsp)
	xorl	%eax, %eax
	leaq	32(%rsp), %rbp
	leaq	524320(%rsp), %rbx
	.p2align 4,,10
	.p2align 3
.L2:
	call	rand@PLT
	addq	$4, %rbp
	movslq	%eax, %rdx
	movl	%eax, %ecx
	imulq	$2013296641, %rdx, %rdx
	sarl	$31, %ecx
	sarq	$44, %rdx
	subl	%ecx, %edx
	imull	$8738, %edx, %edx
	subl	%edx, %eax
	movl	%eax, -4(%rbp)
	cmpq	%rbp, %rbx
	jne	.L2
	movq	%rsp, %rdi
	xorl	%esi, %esi
	xorl	%r12d, %r12d
	call	gettimeofday@PLT
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L3:
	movl	%eax, %edx
	addl	$15, %eax
	andl	$131071, %edx
	addl	32(%rsp,%rdx,4), %r12d
	cmpl	$2115098112, %eax
	jne	.L3
	xorl	%esi, %esi
	leaq	16(%rsp), %rdi
	call	gettimeofday@PLT
	pxor	%xmm0, %xmm0
	movl	$1, %edi
	leaq	.LC1(%rip), %rsi
	imulq	$1000000, 16(%rsp), %rax
	addq	24(%rsp), %rax
	imulq	$1000000, (%rsp), %rdx
	addq	8(%rsp), %rdx
	subq	%rdx, %rax
	movl	%r12d, %edx
	cvtsi2sdq	%rax, %xmm0
	movl	$1, %eax
	divsd	.LC0(%rip), %xmm0
	call	__printf_chk@PLT
	movq	524328(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L9
	addq	$524336, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L9:
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
