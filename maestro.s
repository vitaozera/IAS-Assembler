	.file	"maestro.c"
	.text
	.globl	formatarAspas
	.type	formatarAspas, @function
formatarAspas:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	-12(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	movq	-8(%rbp), %rax
	addq	$1, %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	formatarAspas, .-formatarAspas
	.section	.rodata
.LC0:
	.string	" \t"
.LC1:
	.string	"#"
.LC2:
	.string	"\n"
.LC3:
	.string	"\t"
.LC4:
	.string	" "
	.align 8
.LC5:
	.string	"__________________________________________________________________"
.LC6:
	.string	"LISTA DE ITENS:"
.LC7:
	.string	"LISTA DE R\303\223TULOS:"
	.align 8
.LC8:
	.string	"rotulo: %s | mem: %X | lado: %d\n"
.LC9:
	.string	"LISTA DE PALAVRAS:"
	.align 8
.LC10:
	.string	"campo1: %s | campo2: %s | tipo: %d   |  mem: %03X\n"
	.text
	.globl	Orquestrador
	.type	Orquestrador, @function
Orquestrador:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1760, %rsp
	movq	%rdi, -1752(%rbp)
	movq	%rsi, -1760(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -1740(%rbp)
	movl	$1, -1736(%rbp)
	movl	$1, -1732(%rbp)
	leaq	-1680(%rbp), %rax
	movl	$1700946275, (%rax)
	movw	$24931, 4(%rax)
	movb	$0, 6(%rax)
	movl	$-1, -1616(%rbp)
	movq	$0, -1608(%rbp)
	leaq	-1600(%rbp), %rax
	movl	$1700946275, (%rax)
	movw	$24931, 4(%rax)
	movb	$0, 6(%rax)
	movl	$-1, -1532(%rbp)
	movl	$-1, -1536(%rbp)
	movq	$0, -1528(%rbp)
	jmp	.L4
.L9:
	leaq	-1520(%rbp), %rax
	movl	$.LC0, %esi
	movq	%rax, %rdi
	call	strtok
	movq	%rax, -1720(%rbp)
	jmp	.L5
.L8:
	movq	-1720(%rbp), %rax
	movl	$.LC1, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	je	.L6
	movq	-1720(%rbp), %rax
	movl	$.LC2, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	je	.L6
	movq	-1720(%rbp), %rax
	movl	$.LC3, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	je	.L6
	movq	-1720(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movl	%eax, -1724(%rbp)
	movl	-1724(%rbp), %edx
	movq	-1720(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	tirarNewLine
	movl	%eax, -1724(%rbp)
	movl	-1724(%rbp), %edx
	movq	-1720(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	identificarTipo
	movl	%eax, -1728(%rbp)
	cmpl	$6, -1728(%rbp)
	jne	.L7
	movl	-1724(%rbp), %edx
	movq	-1720(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	formatarAspas
	movq	%rax, -1720(%rbp)
	subl	$2, -1724(%rbp)
	movl	-1724(%rbp), %edx
	movq	-1720(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	identificarTipo
	movl	%eax, -1728(%rbp)
	cmpl	$-1, -1728(%rbp)
	jne	.L7
	movl	$7, -1728(%rbp)
.L7:
	movl	-1732(%rbp), %ecx
	movl	-1728(%rbp), %edx
	movq	-1720(%rbp), %rsi
	leaq	-1600(%rbp), %rax
	movq	%rax, %rdi
	call	addListaItens
	movl	$.LC4, %esi
	movl	$0, %edi
	call	strtok
	movq	%rax, -1720(%rbp)
.L5:
	cmpq	$0, -1720(%rbp)
	jne	.L8
.L6:
	addl	$1, -1732(%rbp)
.L4:
	movq	-1752(%rbp), %rdx
	leaq	-1520(%rbp), %rax
	movl	$1500, %esi
	movq	%rax, %rdi
	call	fgets
	testq	%rax, %rax
	jne	.L9
	leaq	-1600(%rbp), %rax
	movq	%rax, %rdi
	call	diretivaSet
	leaq	-1600(%rbp), %rax
	movq	%rax, -1712(%rbp)
	jmp	.L10
.L15:
	movq	-1712(%rbp), %rax
	movl	64(%rax), %eax
	cmpl	$2, %eax
	je	.L12
	cmpl	$3, %eax
	je	.L13
	cmpl	$1, %eax
	jne	.L11
	movl	-1736(%rbp), %ecx
	movl	-1740(%rbp), %edx
	movq	-1712(%rbp), %rsi
	leaq	-1680(%rbp), %rax
	movq	%rax, %rdi
	call	addListaRotulo
	jmp	.L11
.L12:
	leaq	-1736(%rbp), %r8
	movq	-1760(%rbp), %rdi
	leaq	-1740(%rbp), %rcx
	leaq	-1680(%rbp), %rdx
	leaq	-1600(%rbp), %rsi
	movq	-1712(%rbp), %rax
	movq	%r8, %r9
	movq	%rdi, %r8
	movq	%rax, %rdi
	call	executarDiretiva
	jmp	.L11
.L13:
	leaq	-1736(%rbp), %r8
	movq	-1760(%rbp), %rdi
	leaq	-1740(%rbp), %rcx
	leaq	-1680(%rbp), %rdx
	leaq	-1600(%rbp), %rsi
	movq	-1712(%rbp), %rax
	movq	%r8, %r9
	movq	%rdi, %r8
	movq	%rax, %rdi
	movl	$0, %eax
	call	executarInstrucao
	nop
.L11:
	movq	-1712(%rbp), %rax
	movq	72(%rax), %rax
	movq	%rax, -1712(%rbp)
.L10:
	cmpq	$0, -1712(%rbp)
	jne	.L15
	movq	-1760(%rbp), %rdx
	leaq	-1680(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	rotulosFaltantes
	movl	$.LC5, %edi
	call	puts
	movl	$.LC6, %edi
	call	puts
	leaq	-1600(%rbp), %rax
	movq	%rax, -1704(%rbp)
	jmp	.L16
.L17:
	movq	-1704(%rbp), %rax
	movq	%rax, %rdi
	call	puts
	movq	-1704(%rbp), %rax
	movq	72(%rax), %rax
	movq	%rax, -1704(%rbp)
.L16:
	cmpq	$0, -1704(%rbp)
	jne	.L17
	movl	$10, %edi
	call	putchar
	movl	$.LC5, %edi
	call	puts
	movl	$.LC7, %edi
	call	puts
	movq	-1608(%rbp), %rax
	movq	%rax, -1696(%rbp)
	jmp	.L18
.L19:
	movq	-1696(%rbp), %rax
	movl	68(%rax), %ecx
	movq	-1696(%rbp), %rax
	movl	64(%rax), %edx
	movq	-1696(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC8, %edi
	movl	$0, %eax
	call	printf
	movq	-1696(%rbp), %rax
	movq	72(%rax), %rax
	movq	%rax, -1696(%rbp)
.L18:
	cmpq	$0, -1696(%rbp)
	jne	.L19
	movl	$10, %edi
	call	putchar
	movl	$.LC5, %edi
	call	puts
	movl	$.LC9, %edi
	call	puts
	movq	-1760(%rbp), %rax
	movq	%rax, -1688(%rbp)
	jmp	.L20
.L21:
	movq	-1688(%rbp), %rax
	movl	128(%rax), %ecx
	movq	-1688(%rbp), %rax
	movl	132(%rax), %edx
	movq	-1688(%rbp), %rax
	leaq	64(%rax), %rsi
	movq	-1688(%rbp), %rax
	movl	%ecx, %r8d
	movl	%edx, %ecx
	movq	%rsi, %rdx
	movq	%rax, %rsi
	movl	$.LC10, %edi
	movl	$0, %eax
	call	printf
	movq	-1688(%rbp), %rax
	movq	136(%rax), %rax
	movq	%rax, -1688(%rbp)
.L20:
	cmpq	$0, -1688(%rbp)
	jne	.L21
	movl	$.LC5, %edi
	call	puts
	movq	-1528(%rbp), %rax
	movq	%rax, %rdi
	call	freeListaItens
	movq	-1608(%rbp), %rax
	movq	%rax, %rdi
	call	freeListaRotulos
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L22
	call	__stack_chk_fail
.L22:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	Orquestrador, .-Orquestrador
	.globl	addListaItens
	.type	addListaItens, @function
addListaItens:
.LFB4:
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
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	.L24
.L25:
	movq	-8(%rbp), %rax
	movq	72(%rax), %rax
	movq	%rax, -8(%rbp)
.L24:
	movq	-8(%rbp), %rax
	movq	72(%rax), %rax
	testq	%rax, %rax
	jne	.L25
	movl	$80, %edi
	call	malloc
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 72(%rax)
	movq	-8(%rbp), %rax
	movq	72(%rax), %rax
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
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
.LFE4:
	.size	addListaItens, .-addListaItens
	.globl	freeListaItens
	.type	freeListaItens, @function
freeListaItens:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L27
	movq	-8(%rbp), %rax
	movq	72(%rax), %rax
	movq	%rax, %rdi
	call	freeListaItens
.L27:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	freeListaItens, .-freeListaItens
	.globl	delItemLista
	.type	delItemLista, @function
delItemLista:
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
	movq	%rax, -16(%rbp)
	jmp	.L29
.L32:
	movq	-16(%rbp), %rax
	movq	72(%rax), %rax
	cmpq	-32(%rbp), %rax
	jne	.L30
	movq	-32(%rbp), %rax
	movq	72(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-16(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 72(%rax)
	jmp	.L28
.L30:
	movq	-16(%rbp), %rax
	movq	72(%rax), %rax
	movq	%rax, -16(%rbp)
.L29:
	cmpq	$0, -16(%rbp)
	jne	.L32
.L28:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	delItemLista, .-delItemLista
	.globl	identificarTipo
	.type	identificarTipo, @function
identificarTipo:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	-12(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$58, %al
	jne	.L34
	movl	$1, %eax
	jmp	.L35
.L34:
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$46, %al
	jne	.L36
	movl	$2, %eax
	jmp	.L35
.L36:
	movl	-12(%rbp), %edx
	movq	-8(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	ehDecimal
	testb	%al, %al
	je	.L37
	movl	$4, %eax
	jmp	.L35
.L37:
	movl	-12(%rbp), %edx
	movq	-8(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	ehHexadecimal
	testb	%al, %al
	je	.L38
	movl	$5, %eax
	jmp	.L35
.L38:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	ehInstrucao
	testl	%eax, %eax
	je	.L39
	movl	$3, %eax
	jmp	.L35
.L39:
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$34, %al
	jne	.L40
	movl	-12(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$34, %al
	jne	.L40
	movl	$6, %eax
	jmp	.L35
.L40:
	movl	$-1, %eax
.L35:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	identificarTipo, .-identificarTipo
	.globl	tirarNewLine
	.type	tirarNewLine, @function
tirarNewLine:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	-12(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$10, %al
	jne	.L42
	movl	-12(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	subl	$1, -12(%rbp)
.L42:
	movl	-12(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	tirarNewLine, .-tirarNewLine
	.ident	"GCC: (Ubuntu 4.9.2-10ubuntu13) 4.9.2"
	.section	.note.GNU-stack,"",@progbits
