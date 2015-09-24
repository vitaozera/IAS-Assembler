	.file	"diretivas.c"
	.text
	.globl	addListaSet
	.type	addListaSet, @function
addListaSet:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	.L2
.L3:
	movq	-8(%rbp), %rax
	movq	128(%rax), %rax
	movq	%rax, -8(%rbp)
.L2:
	movq	-8(%rbp), %rax
	movq	128(%rax), %rax
	testq	%rax, %rax
	jne	.L3
	movl	$136, %edi
	call	malloc
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 128(%rax)
	movq	-8(%rbp), %rax
	movq	128(%rax), %rax
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	strcpy
	movq	-8(%rbp), %rax
	movq	128(%rax), %rax
	leaq	64(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	strcpy
	movq	-8(%rbp), %rax
	movq	128(%rax), %rax
	movq	$0, 128(%rax)
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	addListaSet, .-addListaSet
	.globl	freeListaSet
	.type	freeListaSet, @function
freeListaSet:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L5
	movq	-8(%rbp), %rax
	movq	128(%rax), %rax
	testq	%rax, %rax
	je	.L5
	movq	-8(%rbp), %rax
	movq	128(%rax), %rax
	movq	%rax, %rdi
	call	freeListaSet
.L5:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	freeListaSet, .-freeListaSet
	.section	.rodata
.LC0:
	.string	"OI: %s\n"
.LC1:
	.string	"OI2: %s\n"
.LC2:
	.string	"CAMPO: %s\n"
	.text
	.globl	executarSet
	.type	executarSet, @function
executarSet:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$112, %rsp
	movq	%rdi, -104(%rbp)
	movq	%rsi, -112(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-112(%rbp), %rax
	movq	%rax, -88(%rbp)
	jmp	.L7
.L12:
	movq	-104(%rbp), %rax
	movq	%rax, -96(%rbp)
	jmp	.L8
.L11:
	movq	-96(%rbp), %rdx
	movq	-88(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L9
	movq	-88(%rbp), %rax
	addq	$64, %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movq	-88(%rbp), %rax
	addq	$64, %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	ehHexadecimal
	testl	%eax, %eax
	je	.L10
	movq	-88(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	movq	-88(%rbp), %rax
	leaq	64(%rax), %rdx
	movq	-96(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy
	movq	-96(%rbp), %rax
	movl	$5, 64(%rax)
	movq	-96(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	jmp	.L9
.L10:
	movq	-88(%rbp), %rax
	addq	$64, %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movq	-88(%rbp), %rax
	addq	$64, %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	ehDecimal
	testl	%eax, %eax
	je	.L9
	movq	-88(%rbp), %rax
	leaq	64(%rax), %rdx
	leaq	-80(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	decimal2Hex
	movq	-96(%rbp), %rax
	leaq	-80(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy
	movq	-96(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	movq	-96(%rbp), %rax
	movl	$5, 64(%rax)
.L9:
	movq	-96(%rbp), %rax
	movq	72(%rax), %rax
	movq	%rax, -96(%rbp)
.L8:
	cmpq	$0, -96(%rbp)
	jne	.L11
	movq	-88(%rbp), %rax
	movq	128(%rax), %rax
	movq	%rax, -88(%rbp)
.L7:
	cmpq	$0, -88(%rbp)
	jne	.L12
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L13
	call	__stack_chk_fail
.L13:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	executarSet, .-executarSet
	.section	.rodata
.LC3:
	.string	".set"
	.text
	.globl	diretivaSet
	.type	diretivaSet, @function
diretivaSet:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$336, %rsp
	movq	%rdi, -328(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-288(%rbp), %rax
	movl	$1700946275, (%rax)
	movw	$24931, 4(%rax)
	movb	$0, 6(%rax)
	leaq	-288(%rbp), %rax
	addq	$64, %rax
	movabsq	$8028899395672827251, %rcx
	movq	%rcx, (%rax)
	movw	$114, 8(%rax)
	movq	$0, -160(%rbp)
	movq	-328(%rbp), %rax
	movq	%rax, -312(%rbp)
	movq	$0, -304(%rbp)
	jmp	.L15
.L17:
	movq	-312(%rbp), %rax
	movl	$.LC3, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L16
	movq	-312(%rbp), %rax
	movq	72(%rax), %rax
	movq	%rax, %rdx
	leaq	-144(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy
	movq	-312(%rbp), %rax
	movq	72(%rax), %rax
	movq	72(%rax), %rax
	movq	%rax, %rdx
	leaq	-80(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy
	leaq	-80(%rbp), %rdx
	leaq	-144(%rbp), %rcx
	leaq	-288(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	addListaSet
	movq	-312(%rbp), %rax
	movq	72(%rax), %rax
	movq	72(%rax), %rax
	movq	72(%rax), %rax
	movq	%rax, -296(%rbp)
	movq	-312(%rbp), %rax
	movq	72(%rax), %rax
	movq	72(%rax), %rax
	movq	%rax, %rdi
	call	free
	movq	-312(%rbp), %rax
	movq	72(%rax), %rax
	movq	%rax, %rdi
	call	free
	movq	-312(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-304(%rbp), %rax
	movq	-296(%rbp), %rdx
	movq	%rdx, 72(%rax)
	movq	-296(%rbp), %rax
	movq	%rax, -312(%rbp)
	jmp	.L15
.L16:
	movq	-312(%rbp), %rax
	movq	%rax, -304(%rbp)
	movq	-312(%rbp), %rax
	movq	72(%rax), %rax
	movq	%rax, -312(%rbp)
.L15:
	cmpq	$0, -312(%rbp)
	jne	.L17
	leaq	-288(%rbp), %rdx
	movq	-328(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	executarSet
	movq	-160(%rbp), %rax
	movq	%rax, %rdi
	call	freeListaSet
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L18
	call	__stack_chk_fail
.L18:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	diretivaSet, .-diretivaSet
	.section	.rodata
.LC4:
	.string	".org"
.LC5:
	.string	".align"
.LC6:
	.string	".word"
.LC7:
	.string	".wfill"
	.text
	.globl	identificarDiretiva
	.type	identificarDiretiva, @function
identificarDiretiva:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	$.LC4, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L20
	movl	$1, %eax
	jmp	.L21
.L20:
	movq	-8(%rbp), %rax
	movl	$.LC5, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L22
	movl	$2, %eax
	jmp	.L21
.L22:
	movq	-8(%rbp), %rax
	movl	$.LC6, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L23
	movl	$3, %eax
	jmp	.L21
.L23:
	movq	-8(%rbp), %rax
	movl	$.LC7, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L24
	movl	$4, %eax
	jmp	.L21
.L24:
	movl	$-1, %eax
.L21:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	identificarDiretiva, .-identificarDiretiva
	.globl	executarAlign
	.type	executarAlign, @function
executarAlign:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cltd
	idivl	-28(%rbp)
	movl	%edx, %eax
	testl	%eax, %eax
	jne	.L26
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	je	.L26
	jmp	.L25
.L26:
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cltd
	idivl	-28(%rbp)
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	imull	-28(%rbp), %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %edx
	movl	-28(%rbp), %eax
	addl	%eax, %edx
	movq	-24(%rbp), %rax
	movl	%edx, (%rax)
.L25:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	executarAlign, .-executarAlign
	.section	.rodata
.LC8:
	.string	"%010X"
.LC9:
	.string	"%s"
	.text
	.globl	executarWord
	.type	executarWord, @function
executarWord:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movq	%r8, -56(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	.L29
.L30:
	movq	-8(%rbp), %rax
	movq	136(%rax), %rax
	movq	%rax, -8(%rbp)
.L29:
	movq	-8(%rbp), %rax
	movq	136(%rax), %rax
	testq	%rax, %rax
	jne	.L30
	movl	$144, %edi
	call	malloc
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 136(%rax)
	movq	-24(%rbp), %rax
	movl	64(%rax), %eax
	cmpl	$4, %eax
	jne	.L31
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movq	136(%rax), %rax
	movl	%edx, %ecx
	movl	$.LC8, %edx
	movl	$64, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf
	jmp	.L32
.L31:
	movq	-24(%rbp), %rax
	movl	64(%rax), %eax
	cmpl	$5, %eax
	jne	.L33
	movq	-24(%rbp), %rax
	leaq	2(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	136(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy
	jmp	.L32
.L33:
	movq	-24(%rbp), %rax
	movl	64(%rax), %eax
	cmpl	$1, %eax
	jne	.L32
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	formatarRotulo
	movq	-24(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	buscarValorRotulo
	movl	%eax, -12(%rbp)
	cmpl	$-1, -12(%rbp)
	jne	.L34
	movq	-24(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	136(%rdx), %rdx
	movq	%rdx, %rdi
	movq	%rax, %rcx
	movl	$.LC9, %edx
	movl	$64, %esi
	movl	$0, %eax
	call	snprintf
	jmp	.L32
.L34:
	movq	-8(%rbp), %rax
	movq	136(%rax), %rax
	movq	%rax, %rdi
	movl	-12(%rbp), %eax
	movl	%eax, %ecx
	movl	$.LC8, %edx
	movl	$64, %esi
	movl	$0, %eax
	call	snprintf
.L32:
	movq	-8(%rbp), %rax
	movq	136(%rax), %rax
	movb	$0, 64(%rax)
	movq	-8(%rbp), %rax
	movq	136(%rax), %rax
	movq	-40(%rbp), %rdx
	movl	(%rdx), %edx
	movl	%edx, 128(%rax)
	movq	-8(%rbp), %rax
	movq	136(%rax), %rax
	movl	$1, 132(%rax)
	movq	-8(%rbp), %rax
	movq	136(%rax), %rax
	movq	$0, 136(%rax)
	movq	-56(%rbp), %rax
	movl	$1, (%rax)
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-40(%rbp), %rax
	movl	%edx, (%rax)
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	executarWord, .-executarWord
	.globl	executarWFill
	.type	executarWFill, @function
executarWFill:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movq	%r8, -56(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, -4(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L36
.L37:
	movq	-24(%rbp), %rax
	movq	72(%rax), %rax
	movq	-56(%rbp), %rdi
	movq	-48(%rbp), %rcx
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rsi
	movq	%rdi, %r8
	movq	%rax, %rdi
	call	executarWord
	addl	$1, -8(%rbp)
.L36:
	movl	-8(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jl	.L37
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	executarWFill, .-executarWFill
	.globl	executarOrg
	.type	executarOrg, @function
executarOrg:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	ehHexadecimal
	testl	%eax, %eax
	je	.L39
	movq	-16(%rbp), %rax
	movl	$16, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	strtol
	movl	%eax, %edx
	movq	-24(%rbp), %rax
	movl	%edx, (%rax)
	jmp	.L38
.L39:
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	ehDecimal
	testl	%eax, %eax
	je	.L38
	movq	-16(%rbp), %rax
	movl	$10, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	strtol
	movl	%eax, %edx
	movq	-24(%rbp), %rax
	movl	%edx, (%rax)
.L38:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	executarOrg, .-executarOrg
	.globl	executarDiretiva
	.type	executarDiretiva, @function
executarDiretiva:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$144, %rsp
	movq	%rdi, -104(%rbp)
	movq	%rsi, -112(%rbp)
	movq	%rdx, -120(%rbp)
	movq	%rcx, -128(%rbp)
	movq	%r8, -136(%rbp)
	movq	%r9, -144(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-104(%rbp), %rax
	movq	%rax, %rdi
	call	identificarDiretiva
	movl	%eax, -88(%rbp)
	movl	-88(%rbp), %eax
	cmpl	$2, %eax
	je	.L43
	cmpl	$2, %eax
	jg	.L44
	cmpl	$1, %eax
	je	.L45
	jmp	.L41
.L44:
	cmpl	$3, %eax
	je	.L46
	cmpl	$4, %eax
	je	.L47
	jmp	.L41
.L45:
	movq	-104(%rbp), %rax
	movq	72(%rax), %rax
	movq	%rax, %rcx
	movq	-128(%rbp), %rdx
	leaq	-80(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	executarOrg
	movq	-104(%rbp), %rax
	movq	72(%rax), %rdx
	movq	-112(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	delItemLista
	jmp	.L41
.L43:
	movq	-104(%rbp), %rax
	movq	72(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, -84(%rbp)
	movl	-84(%rbp), %edx
	movq	-128(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	executarAlign
	movq	-104(%rbp), %rax
	movq	72(%rax), %rdx
	movq	-112(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	delItemLista
	jmp	.L41
.L46:
	movq	-104(%rbp), %rax
	movq	72(%rax), %rax
	movq	-144(%rbp), %rdi
	movq	-136(%rbp), %rcx
	movq	-128(%rbp), %rdx
	movq	-120(%rbp), %rsi
	movq	%rdi, %r8
	movq	%rax, %rdi
	call	executarWord
	movq	-104(%rbp), %rax
	movq	72(%rax), %rdx
	movq	-112(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	delItemLista
	jmp	.L41
.L47:
	movq	-104(%rbp), %rax
	movq	72(%rax), %rax
	movq	-144(%rbp), %rdi
	movq	-136(%rbp), %rcx
	movq	-128(%rbp), %rdx
	movq	-120(%rbp), %rsi
	movq	%rdi, %r8
	movq	%rax, %rdi
	call	executarWFill
	movq	-104(%rbp), %rax
	movq	72(%rax), %rax
	movq	72(%rax), %rdx
	movq	-112(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	delItemLista
	movq	-104(%rbp), %rax
	movq	72(%rax), %rdx
	movq	-112(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	delItemLista
	nop
.L41:
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L48
	call	__stack_chk_fail
.L48:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	executarDiretiva, .-executarDiretiva
	.ident	"GCC: (Ubuntu 4.9.2-10ubuntu13) 4.9.2"
	.section	.note.GNU-stack,"",@progbits
