	.file	"popcount.cpp"
	.text
	.p2align 4
	.globl	_Z8RandLFSRRm
	.type	_Z8RandLFSRRm, @function
_Z8RandLFSRRm:
.LFB1591:
	.cfi_startproc
	endbr64
	movq	(%rdi), %rdx
	movq	%rdx, %rcx
	movq	%rdx, %rax
	shrq	%rcx
	shrq	$3, %rax
	xorq	%rcx, %rax
	xorq	%rdx, %rax
	shrq	$4, %rdx
	xorq	%rdx, %rax
	salq	$63, %rax
	orq	%rcx, %rax
	movq	%rax, (%rdi)
	ret
	.cfi_endproc
.LFE1591:
	.size	_Z8RandLFSRRm, .-_Z8RandLFSRRm
	.p2align 4
	.globl	_Z8identitym
	.type	_Z8identitym, @function
_Z8identitym:
.LFB1592:
	.cfi_startproc
	endbr64
	movq	%rdi, %rax
	ret
	.cfi_endproc
.LFE1592:
	.size	_Z8identitym, .-_Z8identitym
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC3:
	.string	"Result: %lu\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB1593:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	$1000000000, %ecx
	movl	$3735928559, %edx
	xorl	%ebx, %ebx
	subq	$80, %rsp
	.cfi_def_cfa_offset 96
	movdqa	.LC0(%rip), %xmm2
	movdqa	.LC1(%rip), %xmm0
	movq	%fs:40, %rax
	movq	%rax, 72(%rsp)
	xorl	%eax, %eax
	movdqa	.LC2(%rip), %xmm1
	.p2align 4,,10
	.p2align 3
.L5:
	movq	%rdx, %rsi
	movq	%rdx, %rax
	movaps	%xmm2, (%rsp)
	shrq	%rsi
	shrq	$3, %rax
	movaps	%xmm0, 16(%rsp)
	xorq	%rsi, %rax
	movaps	%xmm0, 32(%rsp)
	xorq	%rdx, %rax
	shrq	$4, %rdx
	movaps	%xmm1, 48(%rsp)
	xorq	%rax, %rdx
	salq	$63, %rdx
	orq	%rsi, %rdx
	movq	%rdx, %rsi
	movq	%rdx, %rax
	shrq	$4, %rsi
	andl	$15, %eax
	andl	$15, %esi
	movl	(%rsp,%rax,4), %eax
	addl	(%rsp,%rsi,4), %eax
	movq	%rdx, %rsi
	shrq	$8, %rsi
	andl	$15, %esi
	addl	(%rsp,%rsi,4), %eax
	movq	%rdx, %rsi
	shrq	$12, %rsi
	andl	$15, %esi
	addl	(%rsp,%rsi,4), %eax
	movq	%rdx, %rsi
	shrq	$16, %rsi
	andl	$15, %esi
	addl	(%rsp,%rsi,4), %eax
	movq	%rdx, %rsi
	shrq	$20, %rsi
	andl	$15, %esi
	addl	(%rsp,%rsi,4), %eax
	movq	%rdx, %rsi
	shrq	$24, %rsi
	andl	$15, %esi
	addl	(%rsp,%rsi,4), %eax
	movq	%rdx, %rsi
	shrq	$28, %rsi
	andl	$15, %esi
	addl	(%rsp,%rsi,4), %eax
	movq	%rdx, %rsi
	shrq	$32, %rsi
	andl	$15, %esi
	addl	(%rsp,%rsi,4), %eax
	movq	%rdx, %rsi
	shrq	$36, %rsi
	andl	$15, %esi
	addl	(%rsp,%rsi,4), %eax
	movq	%rdx, %rsi
	shrq	$40, %rsi
	andl	$15, %esi
	addl	(%rsp,%rsi,4), %eax
	movq	%rdx, %rsi
	shrq	$44, %rsi
	andl	$15, %esi
	addl	(%rsp,%rsi,4), %eax
	movq	%rdx, %rsi
	shrq	$48, %rsi
	andl	$15, %esi
	addl	(%rsp,%rsi,4), %eax
	movq	%rdx, %rsi
	shrq	$52, %rsi
	andl	$15, %esi
	addl	(%rsp,%rsi,4), %eax
	movq	%rdx, %rsi
	shrq	$56, %rsi
	andl	$15, %esi
	addl	(%rsp,%rsi,4), %eax
	movq	%rdx, %rsi
	shrq	$60, %rsi
	addl	(%rsp,%rsi,4), %eax
	cltq
	addq	%rax, %rbx
	subl	$1, %ecx
	jne	.L5
	xorl	%eax, %eax
	movq	%rbx, %rdx
	movl	$1, %edi
	leaq	.LC3(%rip), %rsi
	call	__printf_chk@PLT
	movq	72(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L9
	addq	$80, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	movl	%ebx, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L9:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE1593:
	.size	main, .-main
	.p2align 4
	.type	_GLOBAL__sub_I__Z8RandLFSRRm, @function
_GLOBAL__sub_I__Z8RandLFSRRm:
.LFB2074:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	leaq	_ZStL8__ioinit(%rip), %rdi
	call	_ZNSt8ios_base4InitC1Ev@PLT
	movq	_ZNSt8ios_base4InitD1Ev@GOTPCREL(%rip), %rdi
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	leaq	__dso_handle(%rip), %rdx
	leaq	_ZStL8__ioinit(%rip), %rsi
	jmp	__cxa_atexit@PLT
	.cfi_endproc
.LFE2074:
	.size	_GLOBAL__sub_I__Z8RandLFSRRm, .-_GLOBAL__sub_I__Z8RandLFSRRm
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I__Z8RandLFSRRm
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	0
	.long	1
	.long	1
	.long	2
	.align 16
.LC1:
	.long	1
	.long	2
	.long	2
	.long	3
	.align 16
.LC2:
	.long	2
	.long	3
	.long	3
	.long	4
	.hidden	__dso_handle
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.2) 9.4.0"
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
