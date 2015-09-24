	.file	"numbers.c"
	.text
	.globl	ehDecimal
	.type	ehDecimal, @function
ehDecimal:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L2
.L6:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jle	.L3
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$57, %al
	jle	.L4
.L3:
	movl	$0, %eax
	jmp	.L5
.L4:
	addl	$1, -4(%rbp)
.L2:
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L6
	movl	$1, %eax
.L5:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	ehDecimal, .-ehDecimal
	.globl	ehHexadecimal
	.type	ehHexadecimal, @function
ehHexadecimal:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	cmpl	$2, -28(%rbp)
	jg	.L8
	movl	$0, %eax
	jmp	.L9
.L8:
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$48, %al
	jne	.L10
	movq	-24(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	cmpb	$120, %al
	je	.L11
.L10:
	movl	$0, %eax
	jmp	.L9
.L11:
	movl	$2, -4(%rbp)
	jmp	.L12
.L17:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jle	.L13
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$57, %al
	jg	.L13
	jmp	.L14
.L13:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$64, %al
	jle	.L15
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$70, %al
	jg	.L15
	jmp	.L14
.L15:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$96, %al
	jle	.L16
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$102, %al
	jg	.L16
	jmp	.L14
.L16:
	movl	$0, %eax
	jmp	.L9
.L14:
	addl	$1, -4(%rbp)
.L12:
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L17
	movl	$1, %eax
.L9:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	ehHexadecimal, .-ehHexadecimal
	.section	.rodata
.LC0:
	.string	"%012X"
	.text
	.globl	decimal2Hex
	.type	decimal2Hex, @function
decimal2Hex:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movl	%edx, %ecx
	movl	$.LC0, %edx
	movl	$64, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	decimal2Hex, .-decimal2Hex
	.ident	"GCC: (Ubuntu 4.9.2-10ubuntu13) 4.9.2"
	.section	.note.GNU-stack,"",@progbits
