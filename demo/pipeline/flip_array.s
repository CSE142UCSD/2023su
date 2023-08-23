	.file	"flip_array.c"
	.text
	.p2align 4
	.globl	xorswap
	.type	xorswap, @function
xorswap:
.LFB40:
	.cfi_startproc
	endbr64
	movl	(%rdi), %eax
	xorl	(%rsi), %eax
	movl	%eax, (%rdi)
	xorl	(%rsi), %eax
	movl	%eax, (%rsi)
	xorl	%eax, (%rdi)
	ret
	.cfi_endproc
.LFE40:
	.size	xorswap, .-xorswap
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"data[array_size/2] = %d\n"
.LC2:
	.string	"sorted %lf seconds\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB41:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	$524288, %edi
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$48, %rsp
	.cfi_def_cfa_offset 80
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	call	malloc@PLT
	movq	%rax, %rbp
	leaq	524288(%rax), %r12
	movq	%rax, %rbx
	.p2align 4,,10
	.p2align 3
.L4:
	call	rand@PLT
	addq	$4, %rbx
	movl	%eax, -4(%rbx)
	cmpq	%r12, %rbx
	jne	.L4
	movq	%rsp, %rdi
	xorl	%esi, %esi
	call	gettimeofday@PLT
	leaq	524284(%rbp), %rax
	movq	%rbp, %rdx
	.p2align 4,,10
	.p2align 3
.L5:
	movl	(%rdx), %esi
	movl	(%rax), %edi
	movq	%rax, %rcx
	addq	$4, %rdx
	subq	$4, %rax
	movl	%edi, -4(%rdx)
	movl	%esi, 4(%rax)
	cmpq	%rbp, %rcx
	jne	.L5
	xorl	%esi, %esi
	leaq	16(%rsp), %rdi
	call	gettimeofday@PLT
	call	rand@PLT
	movq	stderr(%rip), %rdi
	movl	$1, %esi
	cltd
	shrl	$15, %edx
	addl	%edx, %eax
	andl	$131071, %eax
	subl	%edx, %eax
	leaq	.LC0(%rip), %rdx
	cltq
	movl	0(%rbp,%rax,4), %ecx
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	movq	stderr(%rip), %rdi
	pxor	%xmm0, %xmm0
	imulq	$1000000, 16(%rsp), %rax
	imulq	$1000000, (%rsp), %rdx
	addq	24(%rsp), %rax
	movl	$1, %esi
	addq	8(%rsp), %rdx
	subq	%rdx, %rax
	leaq	.LC2(%rip), %rdx
	cvtsi2sdq	%rax, %xmm0
	movl	$1, %eax
	divsd	.LC1(%rip), %xmm0
	call	__fprintf_chk@PLT
	movq	40(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L10
	addq	$48, %rsp
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
.L10:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE41:
	.size	main, .-main
	.comm	swap,8,8
	.section	.rodata.cst8,"aM",@progbits,8
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
