	.file	"testloop.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Please input a number:"
.LC1:
	.string	"%d"
	.text
	.p2align 4
	.globl	modifyloop
	.type	modifyloop, @function
modifyloop:
.LFB51:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$1, %edi
	call	sleep@PLT
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	leaq	loop(%rip), %rsi
	leaq	.LC1(%rip), %rdi
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE51:
	.size	modifyloop, .-modifyloop
	.section	.rodata.str1.1
.LC2:
	.string	"User input: %d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB52:
	.cfi_startproc
	endbr64
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	xorl	%ecx, %ecx
	leaq	modifyloop(%rip), %rdx
	xorl	%esi, %esi
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %rdi
	movl	$1, loop(%rip)
	call	pthread_create@PLT
	cmpl	$1, loop(%rip)
	je	.L6
	movq	(%rsp), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
	movl	loop(%rip), %ecx
	xorl	%eax, %eax
	movq	stderr(%rip), %rdi
	leaq	.LC2(%rip), %rdx
	movl	$1, %esi
	call	__fprintf_chk@PLT
	movq	8(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L9
	xorl	%eax, %eax
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L6:
	.cfi_restore_state
	jmp	.L6
.L9:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE52:
	.size	main, .-main
	.comm	loop,4,4
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
