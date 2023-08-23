	.file	"swap.c"
	.text
	.p2align 4
	.globl	regswap
	.type	regswap, @function
regswap:
.LFB39:
	.cfi_startproc
	endbr64
	movl	(%rdi), %eax
	movl	(%rsi), %edx
	movl	%edx, (%rdi)
	movl	%eax, (%rsi)
	ret
	.cfi_endproc
.LFE39:
	.size	regswap, .-regswap
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
	.p2align 4
	.globl	partition
	.type	partition, @function
partition:
.LFB41:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movslq	%edx, %rax
	leal	-1(%rsi), %ecx
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r14
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
	movq	%rax, %rbx
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movl	%eax, 4(%rsp)
	leaq	(%rdi,%rax,4), %rax
	movq	%rax, 8(%rsp)
	movl	(%rax), %ebp
	cmpl	%esi, %ebx
	jle	.L9
	movslq	%esi, %rdx
	notl	%esi
	leal	(%rsi,%rbx), %r13d
	leaq	1(%rdx), %r15
	addq	%r15, %r13
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L13:
	movslq	%r12d, %rdx
	leaq	(%r14,%rdx,4), %rdi
	call	*swap(%rip)
	movl	%r12d, %ecx
	movl	%ebx, %r12d
.L6:
	movq	%r15, %rdx
	cmpq	%r15, %r13
	je	.L5
.L14:
	addq	$1, %r15
.L7:
	leaq	(%r14,%rdx,4), %rsi
	leal	1(%rcx), %r12d
	cmpl	%ebp, (%r14,%rdx,4)
	jg	.L6
	leal	2(%rcx), %ebx
	cmpl	%edx, %r12d
	jne	.L13
	movl	%r12d, %ecx
	movq	%r15, %rdx
	movl	%ebx, %r12d
	cmpq	%r15, %r13
	jne	.L14
	.p2align 4,,10
	.p2align 3
.L5:
	cmpl	%r12d, 4(%rsp)
	je	.L4
	movslq	%ecx, %rcx
	movq	8(%rsp), %rsi
	leaq	4(%r14,%rcx,4), %rdi
	call	*swap(%rip)
.L4:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%r12d, %eax
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
	.p2align 4,,10
	.p2align 3
.L9:
	.cfi_restore_state
	movl	%esi, %r12d
	jmp	.L5
	.cfi_endproc
.LFE41:
	.size	partition, .-partition
	.p2align 4
	.globl	quickSort
	.type	quickSort, @function
quickSort:
.LFB42:
	.cfi_startproc
	endbr64
	cmpl	%edx, %esi
	jge	.L20
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movq	%rdi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movl	%edx, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movl	%esi, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
.L17:
	movl	%ebp, %esi
	movl	%r12d, %edx
	movq	%r13, %rdi
	call	partition
	movl	%ebp, %esi
	movq	%r13, %rdi
	movl	%eax, %ebx
	leal	-1(%rax), %edx
	call	quickSort
	leal	1(%rbx), %ebp
	cmpl	%r12d, %ebp
	jl	.L17
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L20:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	ret
	.cfi_endproc
.LFE42:
	.size	quickSort, .-quickSort
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"data[rand()] = %d\n"
.LC2:
	.string	"sorted %lf seconds\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB43:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$48, %rsp
	.cfi_def_cfa_offset 96
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jg	.L38
	movl	$524288, %edi
	movl	$131072, %r12d
	call	malloc@PLT
	movq	%rax, %rbp
	leaq	regswap(%rip), %rax
	movq	%rax, swap(%rip)
.L29:
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L28:
	call	rand@PLT
	movl	%eax, 0(%rbp,%rbx,4)
	addq	$1, %rbx
	cmpl	%ebx, %r12d
	ja	.L28
.L27:
	xorl	%esi, %esi
	movq	%rsp, %rdi
	call	gettimeofday@PLT
	leal	-1(%r12), %edx
	xorl	%esi, %esi
	movq	%rbp, %rdi
	call	quickSort
	xorl	%esi, %esi
	leaq	16(%rsp), %rdi
	call	gettimeofday@PLT
	call	rand@PLT
	xorl	%edx, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rdi
	divl	%r12d
	xorl	%eax, %eax
	movl	0(%rbp,%rdx,4), %ecx
	leaq	.LC0(%rip), %rdx
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
	jne	.L39
	addq	$48, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L38:
	.cfi_restore_state
	movl	%edi, %ebx
	movq	8(%rsi), %rdi
	movl	$10, %edx
	movq	%rsi, %r13
	xorl	%esi, %esi
	call	strtol@PLT
	movl	%eax, %edi
	movq	%rax, %r14
	movl	%eax, %r12d
	salq	$2, %rdi
	call	malloc@PLT
	movq	%rax, %rbp
	cmpl	$2, %ebx
	je	.L25
	movq	16(%r13), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	call	strtol@PLT
	movq	%rax, %r8
	leaq	xorswap(%rip), %rax
	subl	$1, %r8d
	je	.L26
.L25:
	leaq	regswap(%rip), %rax
.L26:
	movq	%rax, swap(%rip)
	testl	%r14d, %r14d
	jne	.L29
	jmp	.L27
.L39:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE43:
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
