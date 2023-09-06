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
.LC0:
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
	movl	$1000000000, %edi
	movl	$3735928559, %esi
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L7:
	movq	%rsi, %rdx
	movq	%rsi, %rax
	shrq	%rdx
	shrq	$3, %rax
	xorq	%rdx, %rax
	xorq	%rsi, %rax
	shrq	$4, %rsi
	xorq	%rsi, %rax
	salq	$63, %rax
	orq	%rdx, %rax
	movq	%rax, %rsi
	je	.L5
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L6:
	movl	%eax, %ecx
	andl	$1, %ecx
	addl	%ecx, %edx
	shrq	%rax
	jne	.L6
	movslq	%edx, %rdx
	addq	%rdx, %rbx
.L5:
	subl	$1, %edi
	jne	.L7
	movq	%rbx, %rdx
	leaq	.LC0(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	%ebx, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
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
