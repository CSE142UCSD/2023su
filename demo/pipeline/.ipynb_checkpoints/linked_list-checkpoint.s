	.file	"linked_list.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d "
	.text
	.p2align 4
	.globl	depth_of_list
	.type	depth_of_list, @function
depth_of_list:
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
	testq	%rdi, %rdi
	je	.L4
	movq	%rdi, %rbx
	xorl	%r12d, %r12d
	leaq	.LC0(%rip), %rbp
	.p2align 4,,10
	.p2align 3
.L3:
	addl	$1, %r12d
	movq	8(%rbx), %rbx
	xorl	%eax, %eax
	movq	%rbp, %rdx
	movq	stderr(%rip), %rdi
	movl	%r12d, %ecx
	movl	$1, %esi
	call	__fprintf_chk@PLT
	testq	%rbx, %rbx
	jne	.L3
	movl	%r12d, %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L4:
	.cfi_restore_state
	xorl	%r12d, %r12d
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	movl	%r12d, %eax
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE39:
	.size	depth_of_list, .-depth_of_list
	.p2align 4
	.globl	depth_of_array
	.type	depth_of_array, @function
depth_of_array:
.LFB40:
	.cfi_startproc
	endbr64
	testl	%esi, %esi
	jle	.L12
	leal	-1(%rsi), %edx
	leaq	8(%rdi), %rax
	xorl	%r8d, %r8d
	salq	$4, %rdx
	leaq	24(%rdi,%rdx), %rdx
	.p2align 4,,10
	.p2align 3
.L11:
	cmpq	$1, (%rax)
	sbbl	$-1, %r8d
	addq	$16, %rax
	cmpq	%rdx, %rax
	jne	.L11
	movl	%r8d, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L12:
	xorl	%r8d, %r8d
	movl	%r8d, %eax
	ret
	.cfi_endproc
.LFE40:
	.size	depth_of_array, .-depth_of_array
	.section	.rodata.str1.1
.LC1:
	.string	"depth: %lu\n"
.LC3:
	.string	"sorted %lf seconds\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB41:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jg	.L15
	movl	$16, %esi
	movl	$131072, %edi
	movl	$131072, %r15d
	xorl	%r12d, %r12d
	call	calloc@PLT
	movq	%rax, %rbp
.L16:
	movq	%rbp, %r13
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L19:
	call	rand@PLT
	addl	$1, %ebx
	addq	$16, %r13
	movl	%eax, -16(%r13)
	cmpl	%r15d, %ebx
	jb	.L19
	movl	%r15d, %r14d
	subl	$1, %r14d
	je	.L43
.L18:
	leaq	4(%rbp), %rbx
	xorl	%r13d, %r13d
	.p2align 4,,10
	.p2align 3
.L21:
	call	rand@PLT
	movl	(%rbx), %edx
	testl	%edx, %edx
	je	.L21
	andl	%r14d, %eax
	addl	$1, %r13d
	addq	$16, %rbx
	cltq
	salq	$4, %rax
	addq	%rbp, %rax
	movq	%rax, -12(%rbx)
	movl	$1, 4(%rax)
	cmpl	%r14d, %r13d
	jb	.L21
	xorl	%esi, %esi
	xorl	%eax, %eax
	movq	%rsp, %rdi
	call	gettimeofday@PLT
	testl	%r12d, %r12d
	jne	.L30
	testl	%r15d, %r15d
	jle	.L26
.L31:
	addq	$8, %rbp
	xorl	%r12d, %r12d
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L29:
	cmpq	$1, 0(%rbp)
	sbbl	$-1, %r12d
	addl	$1, %eax
	addq	$16, %rbp
	cmpl	%r15d, %eax
	jl	.L29
.L26:
	xorl	%esi, %esi
	leaq	16(%rsp), %rdi
	xorl	%eax, %eax
	call	gettimeofday@PLT
	movl	%r12d, %ecx
	movl	$1, %esi
	xorl	%eax, %eax
	movq	stderr(%rip), %rdi
	leaq	.LC1(%rip), %rdx
	call	__fprintf_chk@PLT
	movq	stderr(%rip), %rdi
	pxor	%xmm0, %xmm0
	imulq	$1000000, 16(%rsp), %rax
	imulq	$1000000, (%rsp), %rdx
	addq	24(%rsp), %rax
	movl	$1, %esi
	addq	8(%rsp), %rdx
	subq	%rdx, %rax
	leaq	.LC3(%rip), %rdx
	cvtsi2sdq	%rax, %xmm0
	movl	$1, %eax
	divsd	.LC2(%rip), %xmm0
	call	__fprintf_chk@PLT
	movq	40(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L44
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L43:
	.cfi_restore_state
	movq	%rsp, %rdi
	xorl	%esi, %esi
	xorl	%eax, %eax
	movl	$1, %r15d
	call	gettimeofday@PLT
	testl	%r12d, %r12d
	je	.L31
.L30:
	xorl	%r12d, %r12d
	testq	%rbp, %rbp
	je	.L26
	leaq	.LC0(%rip), %rbx
	.p2align 4,,10
	.p2align 3
.L25:
	addl	$1, %r12d
	movq	8(%rbp), %rbp
	xorl	%eax, %eax
	movq	%rbx, %rdx
	movq	stderr(%rip), %rdi
	movl	%r12d, %ecx
	movl	$1, %esi
	call	__fprintf_chk@PLT
	testq	%rbp, %rbp
	jne	.L25
	jmp	.L26
.L15:
	movl	%edi, %ebx
	movq	8(%rsi), %rdi
	movq	%rsi, %rbp
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	%rax, %r13
	movl	%eax, %r15d
	cmpl	$2, %ebx
	je	.L33
	movq	16(%rbp), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movl	%eax, %r12d
.L17:
	movl	%r13d, %edi
	movl	$16, %esi
	call	calloc@PLT
	movq	%rax, %rbp
	testl	%r13d, %r13d
	jne	.L16
	orl	$-1, %r14d
	jmp	.L18
.L33:
	xorl	%r12d, %r12d
	jmp	.L17
.L44:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE41:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC2:
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
