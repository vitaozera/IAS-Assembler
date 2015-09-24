	.file	"rotulos.c"
	.text
	.globl	formatarRotulo
	.type	formatarRotulo, @function
formatarRotulo:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$58, %al
	jne	.L1
	movl	-4(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
.L1:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	formatarRotulo, .-formatarRotulo
	.globl	addListaRotulo
	.type	addListaRotulo, @function
addListaRotulo:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
	movl	%ecx, -40(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	formatarRotulo
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	.L4
.L5:
	movq	-8(%rbp), %rax
	movq	72(%rax), %rax
	movq	%rax, -8(%rbp)
.L4:
	movq	-8(%rbp), %rax
	movq	72(%rax), %rax
	testq	%rax, %rax
	jne	.L5
	movl	$80, %edi
	call	malloc
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 72(%rax)
	movq	-32(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	72(%rdx), %rdx
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	strcpy
	movq	-8(%rbp), %rax
	movq	72(%rax), %rax
	movl	-36(%rbp), %edx
	movl	%edx, 64(%rax)
	movq	-8(%rbp), %rax
	movq	72(%rax), %rax
	movl	-40(%rbp), %edx
	movl	%edx, 68(%rax)
	movq	-8(%rbp), %rax
	movq	72(%rax), %rax
	movq	$0, 72(%rax)
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	addListaRotulo, .-addListaRotulo
	.globl	freeListaRotulos
	.type	freeListaRotulos, @function
freeListaRotulos:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L7
	movq	-8(%rbp), %rax
	movq	72(%rax), %rax
	movq	%rax, %rdi
	call	freeListaRotulos
.L7:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	freeListaRotulos, .-freeListaRotulos
	.globl	buscarValorRotulo
	.type	buscarValorRotulo, @function
buscarValorRotulo:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	.L9
.L12:
	movq	-8(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L10
	movq	-8(%rbp), %rax
	movl	64(%rax), %eax
	jmp	.L11
.L10:
	movq	-8(%rbp), %rax
	movq	72(%rax), %rax
	movq	%rax, -8(%rbp)
.L9:
	cmpq	$0, -8(%rbp)
	jne	.L12
	movl	$-1, %eax
.L11:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	buscarValorRotulo, .-buscarValorRotulo
	.section	.rodata
.LC0:
	.string	"pNome: %s | nome: %s\n"
	.text
	.globl	buscarLadoRotulo
	.type	buscarLadoRotulo, @function
buscarLadoRotulo:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	.L14
.L17:
	movq	-8(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rax, %rsi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	movq	-8(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L15
	movq	-8(%rbp), %rax
	movl	68(%rax), %eax
	jmp	.L16
.L15:
	movq	-8(%rbp), %rax
	movq	72(%rax), %rax
	movq	%rax, -8(%rbp)
.L14:
	cmpq	$0, -8(%rbp)
	jne	.L17
	movl	$-1, %eax
.L16:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	buscarLadoRotulo, .-buscarLadoRotulo
	.section	.rodata
.LC1:
	.string	"%d campo: %s  |  pos: %d\n"
.LC2:
	.string	"%010X"
.LC3:
	.string	"LADO_BANANA: %d\n"
	.align 8
.LC4:
	.string	"ENTREIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII"
.LC5:
	.string	"CAMPO: %s\n"
.LC6:
	.string	"%03X"
	.text
	.globl	rotulosFaltantes
	.type	rotulosFaltantes, @function
rotulosFaltantes:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movl	$0, -24(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, -16(%rbp)
	jmp	.L19
.L29:
	movq	-16(%rbp), %rax
	movl	132(%rax), %eax
	cmpl	$1, %eax
	jne	.L20
	movq	-16(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	buscarValorRotulo
	movl	%eax, -20(%rbp)
	movq	-16(%rbp), %rdx
	movl	-24(%rbp), %eax
	leal	1(%rax), %ecx
	movl	%ecx, -24(%rbp)
	movl	-20(%rbp), %ecx
	movl	%eax, %esi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	cmpl	$-1, -20(%rbp)
	je	.L20
	movq	-16(%rbp), %rax
	movl	-20(%rbp), %edx
	movl	%edx, %ecx
	movl	$.LC2, %edx
	movl	$64, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf
.L20:
	movq	-16(%rbp), %rax
	movl	132(%rax), %eax
	cmpl	$2, %eax
	jne	.L21
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	leaq	2(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	buscarLadoRotulo
	cmpl	$2, %eax
	sete	%al
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC3, %edi
	movl	$0, %eax
	call	printf
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$48, %al
	jne	.L22
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	cmpb	$68, %al
	jne	.L22
	movq	-8(%rbp), %rax
	leaq	2(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	buscarLadoRotulo
	cmpl	$2, %eax
	jne	.L22
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movb	$69, (%rax)
	jmp	.L23
.L22:
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$48, %al
	jne	.L24
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	cmpb	$70, %al
	jne	.L24
	movq	-8(%rbp), %rax
	leaq	2(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	buscarLadoRotulo
	cmpl	$2, %eax
	jne	.L24
	movq	-8(%rbp), %rax
	movb	$49, (%rax)
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movb	$48, (%rax)
	jmp	.L23
.L24:
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$49, %al
	jne	.L23
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	cmpb	$50, %al
	jne	.L23
	movq	-8(%rbp), %rax
	leaq	2(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	buscarLadoRotulo
	cmpl	$2, %eax
	jne	.L23
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movb	$51, (%rax)
.L23:
	movq	-16(%rbp), %rax
	addq	$64, %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$48, %al
	jne	.L25
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	cmpb	$68, %al
	jne	.L25
	movq	-8(%rbp), %rax
	leaq	2(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	buscarLadoRotulo
	cmpl	$2, %eax
	jne	.L25
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movb	$69, (%rax)
	movl	$.LC4, %edi
	call	puts
	jmp	.L26
.L25:
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$48, %al
	jne	.L27
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	cmpb	$70, %al
	jne	.L27
	movq	-8(%rbp), %rax
	leaq	2(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	buscarLadoRotulo
	cmpl	$2, %eax
	jne	.L27
	movq	-8(%rbp), %rax
	movb	$49, (%rax)
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movb	$48, (%rax)
	jmp	.L26
.L27:
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$49, %al
	jne	.L26
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	cmpb	$50, %al
	jne	.L26
	movq	-8(%rbp), %rax
	leaq	2(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	buscarLadoRotulo
	cmpl	$2, %eax
	jne	.L26
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movb	$51, (%rax)
.L26:
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC5, %edi
	movl	$0, %eax
	call	printf
	movq	-16(%rbp), %rax
	leaq	2(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	buscarValorRotulo
	movl	%eax, -20(%rbp)
	movq	-16(%rbp), %rdx
	movl	-24(%rbp), %eax
	leal	1(%rax), %ecx
	movl	%ecx, -24(%rbp)
	movl	-20(%rbp), %ecx
	movl	%eax, %esi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	cmpl	$-1, -20(%rbp)
	je	.L28
	movq	-16(%rbp), %rax
	leaq	2(%rax), %rdi
	movl	-20(%rbp), %eax
	movl	%eax, %ecx
	movl	$.LC6, %edx
	movl	$64, %esi
	movl	$0, %eax
	call	snprintf
.L28:
	movq	-16(%rbp), %rax
	leaq	66(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	buscarValorRotulo
	movl	%eax, -20(%rbp)
	cmpl	$-1, -20(%rbp)
	je	.L21
	movq	-16(%rbp), %rax
	leaq	66(%rax), %rdi
	movl	-20(%rbp), %eax
	movl	%eax, %ecx
	movl	$.LC6, %edx
	movl	$64, %esi
	movl	$0, %eax
	call	snprintf
.L21:
	movq	-16(%rbp), %rax
	movq	136(%rax), %rax
	movq	%rax, -16(%rbp)
.L19:
	cmpq	$0, -16(%rbp)
	jne	.L29
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	rotulosFaltantes, .-rotulosFaltantes
	.ident	"GCC: (Ubuntu 4.9.2-10ubuntu13) 4.9.2"
	.section	.note.GNU-stack,"",@progbits
