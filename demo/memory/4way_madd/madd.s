	.file	"madd.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%lf\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB39:
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
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	cmpl	$1, %edi
	jg	.L2
	movl	$655360, %edi
	movl	$16384, %r12d
	call	malloc@PLT
	movl	$0, 20(%rsp)
	movq	%rax, %rbp
.L3:
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L6:
	call	rand@PLT
	pxor	%xmm0, %xmm0
	movslq	%eax, %rdx
	movl	%eax, %ecx
	imulq	$1374389535, %rdx, %rdx
	sarl	$31, %ecx
	sarq	$37, %rdx
	subl	%ecx, %edx
	imull	$100, %edx, %edx
	subl	%edx, %eax
	addl	$1, %eax
	cvtsi2sdl	%eax, %xmm0
	movsd	%xmm0, 0(%rbp,%rbx,8)
	addq	$1, %rbx
	cmpl	%ebx, %r12d
	jg	.L6
	movslq	%r12d, %rbx
	leaq	0(,%rbx,8), %rax
	leal	-1(%r12), %ebx
	movq	%rax, 8(%rsp)
	leaq	0(%rbp,%rax), %r14
	salq	$3, %rbx
	movq	%r14, %r13
	leaq	(%r14,%rbx), %r12
	.p2align 4,,10
	.p2align 3
.L7:
	call	rand@PLT
	pxor	%xmm0, %xmm0
	movslq	%eax, %rdx
	movl	%eax, %ecx
	imulq	$1374389535, %rdx, %rdx
	sarl	$31, %ecx
	sarq	$37, %rdx
	subl	%ecx, %edx
	imull	$100, %edx, %edx
	subl	%edx, %eax
	addl	$1, %eax
	cvtsi2sdl	%eax, %xmm0
	movq	%r13, %rax
	addq	$8, %r13
	movsd	%xmm0, -8(%r13)
	cmpq	%r12, %rax
	jne	.L7
	movq	8(%rsp), %rax
	leaq	(%r14,%rax), %r12
	leaq	8(%rbx), %rax
	movq	%rax, 24(%rsp)
	movq	%r12, %r13
	leaq	(%rax,%r12), %rbx
	.p2align 4,,10
	.p2align 3
.L9:
	call	rand@PLT
	pxor	%xmm0, %xmm0
	addq	$8, %r13
	movslq	%eax, %rdx
	movl	%eax, %ecx
	imulq	$1374389535, %rdx, %rdx
	sarl	$31, %ecx
	sarq	$37, %rdx
	subl	%ecx, %edx
	imull	$100, %edx, %edx
	subl	%edx, %eax
	addl	$1, %eax
	cvtsi2sdl	%eax, %xmm0
	movsd	%xmm0, -8(%r13)
	cmpq	%rbx, %r13
	jne	.L9
	movq	8(%rsp), %rax
	leaq	(%r12,%rax), %r13
	movq	24(%rsp), %rax
	movq	%r13, %r15
	leaq	(%rax,%r13), %rbx
	.p2align 4,,10
	.p2align 3
.L11:
	call	rand@PLT
	pxor	%xmm0, %xmm0
	addq	$8, %r15
	movslq	%eax, %rdx
	movl	%eax, %esi
	imulq	$1374389535, %rdx, %rdx
	sarl	$31, %esi
	sarq	$37, %rdx
	subl	%esi, %edx
	imull	$100, %edx, %edx
	subl	%edx, %eax
	addl	$1, %eax
	cvtsi2sdl	%eax, %xmm0
	movsd	%xmm0, -8(%r15)
	cmpq	%rbx, %r15
	jne	.L11
	movq	8(%rsp), %rbx
	movq	24(%rsp), %rax
	addq	%r13, %rbx
	addq	%rbx, %rax
	movq	%rbx, %r15
	movq	%rax, 8(%rsp)
	.p2align 4,,10
	.p2align 3
.L13:
	call	rand@PLT
	pxor	%xmm0, %xmm0
	addq	$8, %r15
	movslq	%eax, %rdx
	movl	%eax, %esi
	imulq	$1374389535, %rdx, %rdx
	sarl	$31, %esi
	sarq	$37, %rdx
	subl	%esi, %edx
	imull	$100, %edx, %edx
	subl	%edx, %eax
	addl	$1, %eax
	cvtsi2sdl	%eax, %xmm0
	movsd	%xmm0, -8(%r15)
	cmpq	8(%rsp), %r15
	jne	.L13
.L22:
	movl	20(%rsp), %eax
	testl	%eax, %eax
	jle	.L18
	leaq	15(%r12), %rax
	leaq	15(%r14), %rdx
	movl	20(%rsp), %edi
	subq	%rbx, %rax
	cmpq	$30, %rax
	seta	%al
	subq	%rbx, %rdx
	cmpq	$30, %rdx
	seta	%dl
	andl	%edx, %eax
	cmpl	$1, %edi
	setne	%dl
	andl	%edx, %eax
	leaq	15(%r13), %rdx
	subq	%rbx, %rdx
	cmpq	$30, %rdx
	seta	%dl
	testb	%dl, %al
	je	.L15
	leaq	15(%rbx), %rax
	subq	%rbp, %rax
	cmpq	$30, %rax
	jbe	.L15
	shrl	%edi
	xorl	%eax, %eax
	movl	%edi, %edx
	salq	$4, %rdx
	.p2align 4,,10
	.p2align 3
.L16:
	movupd	(%r14,%rax), %xmm0
	movupd	0(%rbp,%rax), %xmm1
	movupd	(%r12,%rax), %xmm2
	movupd	0(%r13,%rax), %xmm3
	mulpd	%xmm1, %xmm0
	addpd	%xmm2, %xmm0
	divpd	%xmm3, %xmm0
	movups	%xmm0, (%rbx,%rax)
	addq	$16, %rax
	cmpq	%rdx, %rax
	jne	.L16
	movl	20(%rsp), %edi
	movl	%edi, %eax
	andl	$-2, %eax
	andl	$1, %edi
	je	.L18
	movsd	(%r14,%rax,8), %xmm0
	mulsd	0(%rbp,%rax,8), %xmm0
	addsd	(%r12,%rax,8), %xmm0
	divsd	0(%r13,%rax,8), %xmm0
	movsd	%xmm0, (%rbx,%rax,8)
.L18:
	call	rand@PLT
	leaq	.LC0(%rip), %rsi
	movl	$1, %edi
	cltd
	shrl	$24, %edx
	addl	%edx, %eax
	movzbl	%al, %eax
	subl	%edx, %eax
	cltq
	movsd	(%r12,%rax,8), %xmm0
	movl	$1, %eax
	call	__printf_chk@PLT
	addq	$40, %rsp
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
.L2:
	.cfi_restore_state
	movl	%edi, %ebx
	movq	8(%rsi), %rdi
	movq	%rsi, %rbp
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	%rax, %r13
	movl	%eax, %r12d
	cmpl	$2, %ebx
	je	.L23
	movq	16(%rbp), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movl	%eax, 20(%rsp)
.L4:
	leal	0(%r13,%r13,4), %edi
	movslq	%edi, %rdi
	salq	$3, %rdi
	call	malloc@PLT
	movq	%rax, %rbp
	testl	%r13d, %r13d
	jg	.L3
	movslq	%r13d, %rbx
	salq	$3, %rbx
	leaq	(%rax,%rbx), %r14
	leaq	(%r14,%rbx), %r12
	leaq	(%r12,%rbx), %r13
	addq	%r13, %rbx
	jmp	.L22
.L15:
	movl	20(%rsp), %eax
	leal	-1(%rax), %ecx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L20:
	movsd	(%r14,%rax,8), %xmm0
	mulsd	0(%rbp,%rax,8), %xmm0
	movq	%rax, %rdx
	addsd	(%r12,%rax,8), %xmm0
	divsd	0(%r13,%rax,8), %xmm0
	movsd	%xmm0, (%rbx,%rax,8)
	addq	$1, %rax
	cmpq	%rdx, %rcx
	jne	.L20
	jmp	.L18
.L23:
	movl	$0, 20(%rsp)
	jmp	.L4
	.cfi_endproc
.LFE39:
	.size	main, .-main
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
