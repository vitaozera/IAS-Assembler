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
	.section	.rodata
	.align 8
.LC0:
	.string	"ERROR on line %d\n%s: is not a valid label\n"
	.text
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
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movl	%eax, -12(%rbp)
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
	movl	-12(%rbp), %eax
	subl	$1, %eax
	movq	-32(%rbp), %rdx
	cltq
	movzbl	(%rdx,%rax), %eax
	cmpb	$58, %al
	jne	.L6
	movq	-32(%rbp), %rdx
	movq	-32(%rbp), %rax
	movl	68(%rax), %eax
	movl	%eax, %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	movl	$-1, %edi
	call	exit
.L6:
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
	je	.L8
	movq	-8(%rbp), %rax
	movq	72(%rax), %rax
	movq	%rax, %rdi
	call	freeListaRotulos
.L8:
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
	jmp	.L10
.L13:
	movq	-8(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L11
	movq	-8(%rbp), %rax
	movl	64(%rax), %eax
	jmp	.L12
.L11:
	movq	-8(%rbp), %rax
	movq	72(%rax), %rax
	movq	%rax, -8(%rbp)
.L10:
	cmpq	$0, -8(%rbp)
	jne	.L13
	movl	$-1, %eax
.L12:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	buscarValorRotulo, .-buscarValorRotulo
	.section	.rodata
.LC1:
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
	jmp	.L15
.L18:
	movq	-8(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rax, %rsi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	movq	-8(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L16
	movq	-8(%rbp), %rax
	movl	68(%rax), %eax
	jmp	.L17
.L16:
	movq	-8(%rbp), %rax
	movq	72(%rax), %rax
	movq	%rax, -8(%rbp)
.L15:
	cmpq	$0, -8(%rbp)
	jne	.L18
	movl	$-1, %eax
.L17:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	buscarLadoRotulo, .-buscarLadoRotulo
	.section	.rodata
.LC2:
	.string	"%d campo: %s  |  pos: %d\n"
.LC3:
	.string	"%010X"
.LC4:
	.string	"LADO_BANANA: %d\n"
	.align 8
.LC5:
	.string	"ENTREIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII"
.LC6:
	.string	"CAMPO: %s\n"
.LC7:
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
	jmp	.L20
.L30:
	movq	-16(%rbp), %rax
	movl	132(%rax), %eax
	cmpl	$1, %eax
	jne	.L21
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
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	cmpl	$-1, -20(%rbp)
	je	.L21
	movq	-16(%rbp), %rax
	movl	-20(%rbp), %edx
	movl	%edx, %ecx
	movl	$.LC3, %edx
	movl	$64, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf
.L21:
	movq	-16(%rbp), %rax
	movl	132(%rax), %eax
	cmpl	$2, %eax
	jne	.L22
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
	movl	$.LC4, %edi
	movl	$0, %eax
	call	printf
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$48, %al
	jne	.L23
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	cmpb	$68, %al
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
	movb	$69, (%rax)
	jmp	.L24
.L23:
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$48, %al
	jne	.L25
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	cmpb	$70, %al
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
	movb	$49, (%rax)
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movb	$48, (%rax)
	jmp	.L24
.L25:
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$49, %al
	jne	.L24
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	cmpb	$50, %al
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
	addq	$1, %rax
	movb	$51, (%rax)
.L24:
	movq	-16(%rbp), %rax
	addq	$64, %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$48, %al
	jne	.L26
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	cmpb	$68, %al
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
	movb	$69, (%rax)
	movl	$.LC5, %edi
	call	puts
	jmp	.L27
.L26:
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$48, %al
	jne	.L28
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	cmpb	$70, %al
	jne	.L28
	movq	-8(%rbp), %rax
	leaq	2(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	buscarLadoRotulo
	cmpl	$2, %eax
	jne	.L28
	movq	-8(%rbp), %rax
	movb	$49, (%rax)
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movb	$48, (%rax)
	jmp	.L27
.L28:
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$49, %al
	jne	.L27
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	cmpb	$50, %al
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
	addq	$1, %rax
	movb	$51, (%rax)
.L27:
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC6, %edi
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
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	cmpl	$-1, -20(%rbp)
	je	.L29
	movq	-16(%rbp), %rax
	leaq	2(%rax), %rdi
	movl	-20(%rbp), %eax
	movl	%eax, %ecx
	movl	$.LC7, %edx
	movl	$64, %esi
	movl	$0, %eax
	call	snprintf
.L29:
	movq	-16(%rbp), %rax
	leaq	66(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	buscarValorRotulo
	movl	%eax, -20(%rbp)
	cmpl	$-1, -20(%rbp)
	je	.L22
	movq	-16(%rbp), %rax
	leaq	66(%rax), %rdi
	movl	-20(%rbp), %eax
	movl	%eax, %ecx
	movl	$.LC7, %edx
	movl	$64, %esi
	movl	$0, %eax
	call	snprintf
.L22:
	movq	-16(%rbp), %rax
	movq	136(%rax), %rax
	movq	%rax, -16(%rbp)
.L20:
	cmpq	$0, -16(%rbp)
	jne	.L30
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	rotulosFaltantes, .-rotulosFaltantes
	.ident	"GCC: (Ubuntu 4.9.2-10ubuntu13) 4.9.2"
	.section	.note.GNU-stack,"",@progbits
