	.file	"instrucoes.c"
	.section	.rodata
.LC0:
	.string	"LD"
.LC1:
	.string	"LD-"
.LC2:
	.string	"LD|"
.LC3:
	.string	"LDmq"
.LC4:
	.string	"LDmq_mx"
.LC5:
	.string	"ST"
.LC6:
	.string	"JMP"
.LC7:
	.string	"JUMP+"
.LC8:
	.string	"ADD"
.LC9:
	.string	"ADD|"
.LC10:
	.string	"SUB"
.LC11:
	.string	"SUB|"
.LC12:
	.string	"MUL"
.LC13:
	.string	"DIV"
.LC14:
	.string	"LSH"
.LC15:
	.string	"RSH"
.LC16:
	.string	"STaddr"
	.text
	.globl	indentificarInstrucao
	.type	indentificarInstrucao, @function
indentificarInstrucao:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	$.LC0, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L2
	movl	$1, %eax
	jmp	.L3
.L2:
	movq	-8(%rbp), %rax
	movl	$.LC1, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L4
	movl	$2, %eax
	jmp	.L3
.L4:
	movq	-8(%rbp), %rax
	movl	$.LC2, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L5
	movl	$3, %eax
	jmp	.L3
.L5:
	movq	-8(%rbp), %rax
	movl	$.LC3, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L6
	movl	$4, %eax
	jmp	.L3
.L6:
	movq	-8(%rbp), %rax
	movl	$.LC4, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L7
	movl	$5, %eax
	jmp	.L3
.L7:
	movq	-8(%rbp), %rax
	movl	$.LC5, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L8
	movl	$6, %eax
	jmp	.L3
.L8:
	movq	-8(%rbp), %rax
	movl	$.LC6, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L9
	movl	$7, %eax
	jmp	.L3
.L9:
	movq	-8(%rbp), %rax
	movl	$.LC7, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L10
	movl	$8, %eax
	jmp	.L3
.L10:
	movq	-8(%rbp), %rax
	movl	$.LC8, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L11
	movl	$9, %eax
	jmp	.L3
.L11:
	movq	-8(%rbp), %rax
	movl	$.LC9, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L12
	movl	$10, %eax
	jmp	.L3
.L12:
	movq	-8(%rbp), %rax
	movl	$.LC10, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L13
	movl	$11, %eax
	jmp	.L3
.L13:
	movq	-8(%rbp), %rax
	movl	$.LC11, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L14
	movl	$12, %eax
	jmp	.L3
.L14:
	movq	-8(%rbp), %rax
	movl	$.LC12, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L15
	movl	$13, %eax
	jmp	.L3
.L15:
	movq	-8(%rbp), %rax
	movl	$.LC13, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L16
	movl	$14, %eax
	jmp	.L3
.L16:
	movq	-8(%rbp), %rax
	movl	$.LC14, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L17
	movl	$15, %eax
	jmp	.L3
.L17:
	movq	-8(%rbp), %rax
	movl	$.LC15, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L18
	movl	$16, %eax
	jmp	.L3
.L18:
	movq	-8(%rbp), %rax
	movl	$.LC16, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L19
	movl	$17, %eax
	jmp	.L3
.L19:
	movl	$-1, %eax
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	indentificarInstrucao, .-indentificarInstrucao
	.globl	ehInstrucao
	.type	ehInstrucao, @function
ehInstrucao:
.LFB3:
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
	call	indentificarInstrucao
	movl	%eax, -4(%rbp)
	cmpl	$-1, -4(%rbp)
	jne	.L21
	movl	$0, %eax
	jmp	.L22
.L21:
	movl	$1, %eax
.L22:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	ehInstrucao, .-ehInstrucao
	.section	.rodata
.LC17:
	.string	"%03X"
	.text
	.globl	preencherInstrucao
	.type	preencherInstrucao, @function
preencherInstrucao:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movl	%esi, -44(%rbp)
	movq	%rdx, -56(%rbp)
	movl	%ecx, -48(%rbp)
	movq	%r8, -64(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	cmpl	$1, -44(%rbp)
	jne	.L24
	movq	-40(%rbp), %rax
	movb	$48, (%rax)
	movq	-40(%rbp), %rax
	addq	$1, %rax
	movb	$49, (%rax)
	jmp	.L25
.L24:
	cmpl	$2, -44(%rbp)
	jne	.L26
	movq	-40(%rbp), %rax
	movb	$48, (%rax)
	movq	-40(%rbp), %rax
	addq	$1, %rax
	movb	$50, (%rax)
	jmp	.L25
.L26:
	cmpl	$3, -44(%rbp)
	jne	.L27
	movq	-40(%rbp), %rax
	movb	$48, (%rax)
	movq	-40(%rbp), %rax
	addq	$1, %rax
	movb	$51, (%rax)
	jmp	.L25
.L27:
	cmpl	$4, -44(%rbp)
	jne	.L28
	movq	-40(%rbp), %rax
	movb	$48, (%rax)
	movq	-40(%rbp), %rax
	addq	$1, %rax
	movb	$65, (%rax)
	jmp	.L25
.L28:
	cmpl	$5, -44(%rbp)
	jne	.L29
	movq	-40(%rbp), %rax
	movb	$48, (%rax)
	movq	-40(%rbp), %rax
	addq	$1, %rax
	movb	$57, (%rax)
	jmp	.L25
.L29:
	cmpl	$6, -44(%rbp)
	jne	.L30
	movq	-40(%rbp), %rax
	movb	$50, (%rax)
	movq	-40(%rbp), %rax
	addq	$1, %rax
	movb	$49, (%rax)
	jmp	.L25
.L30:
	cmpl	$7, -44(%rbp)
	jne	.L31
	movq	-40(%rbp), %rax
	movb	$48, (%rax)
	movq	-40(%rbp), %rax
	addq	$1, %rax
	movb	$68, (%rax)
	jmp	.L25
.L31:
	cmpl	$8, -44(%rbp)
	jne	.L32
	movq	-40(%rbp), %rax
	movb	$48, (%rax)
	movq	-40(%rbp), %rax
	addq	$1, %rax
	movb	$70, (%rax)
	jmp	.L25
.L32:
	cmpl	$9, -44(%rbp)
	jne	.L33
	movq	-40(%rbp), %rax
	movb	$48, (%rax)
	movq	-40(%rbp), %rax
	addq	$1, %rax
	movb	$53, (%rax)
	jmp	.L25
.L33:
	cmpl	$10, -44(%rbp)
	jne	.L34
	movq	-40(%rbp), %rax
	movb	$48, (%rax)
	movq	-40(%rbp), %rax
	addq	$1, %rax
	movb	$55, (%rax)
	jmp	.L25
.L34:
	cmpl	$11, -44(%rbp)
	jne	.L35
	movq	-40(%rbp), %rax
	movb	$48, (%rax)
	movq	-40(%rbp), %rax
	addq	$1, %rax
	movb	$54, (%rax)
	jmp	.L25
.L35:
	cmpl	$12, -44(%rbp)
	jne	.L36
	movq	-40(%rbp), %rax
	movb	$48, (%rax)
	movq	-40(%rbp), %rax
	addq	$1, %rax
	movb	$56, (%rax)
	jmp	.L25
.L36:
	cmpl	$13, -44(%rbp)
	jne	.L37
	movq	-40(%rbp), %rax
	movb	$48, (%rax)
	movq	-40(%rbp), %rax
	addq	$1, %rax
	movb	$66, (%rax)
	jmp	.L25
.L37:
	cmpl	$14, -44(%rbp)
	jne	.L38
	movq	-40(%rbp), %rax
	movb	$48, (%rax)
	movq	-40(%rbp), %rax
	addq	$1, %rax
	movb	$67, (%rax)
	jmp	.L25
.L38:
	cmpl	$15, -44(%rbp)
	jne	.L39
	movq	-40(%rbp), %rax
	movb	$49, (%rax)
	movq	-40(%rbp), %rax
	addq	$1, %rax
	movb	$52, (%rax)
	jmp	.L23
.L39:
	cmpl	$16, -44(%rbp)
	jne	.L41
	movq	-40(%rbp), %rax
	movb	$49, (%rax)
	movq	-40(%rbp), %rax
	addq	$1, %rax
	movb	$53, (%rax)
	jmp	.L23
.L41:
	cmpl	$17, -44(%rbp)
	jne	.L25
	movq	-40(%rbp), %rax
	movb	$49, (%rax)
	movq	-40(%rbp), %rax
	addq	$1, %rax
	movb	$50, (%rax)
.L25:
	movq	-56(%rbp), %rax
	movl	64(%rax), %eax
	cmpl	$4, %eax
	je	.L43
	cmpl	$4, %eax
	jg	.L44
	cmpl	$1, %eax
	je	.L45
	jmp	.L23
.L44:
	cmpl	$5, %eax
	je	.L46
	cmpl	$7, %eax
	je	.L47
	jmp	.L23
.L46:
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movl	%eax, -24(%rbp)
	movq	-40(%rbp), %rax
	leaq	4(%rax), %rcx
	movl	-24(%rbp), %eax
	subl	$1, %eax
	movq	-56(%rbp), %rdx
	cltq
	movzbl	(%rdx,%rax), %eax
	movb	%al, (%rcx)
	movq	-40(%rbp), %rax
	leaq	3(%rax), %rcx
	movl	-24(%rbp), %eax
	subl	$2, %eax
	movq	-56(%rbp), %rdx
	cltq
	movzbl	(%rdx,%rax), %eax
	movb	%al, (%rcx)
	movq	-40(%rbp), %rax
	leaq	2(%rax), %rcx
	movl	-24(%rbp), %eax
	subl	$3, %eax
	movq	-56(%rbp), %rdx
	cltq
	movzbl	(%rdx,%rax), %eax
	movb	%al, (%rcx)
	jmp	.L42
.L43:
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, %edx
	leaq	-16(%rbp), %rax
	movl	%edx, %ecx
	movl	$.LC17, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf
	movq	-40(%rbp), %rax
	leaq	4(%rax), %rdx
	movzbl	-14(%rbp), %eax
	movb	%al, (%rdx)
	movq	-40(%rbp), %rax
	leaq	3(%rax), %rdx
	movzbl	-15(%rbp), %eax
	movb	%al, (%rdx)
	movq	-40(%rbp), %rax
	leaq	2(%rax), %rdx
	movzbl	-16(%rbp), %eax
	movb	%al, (%rdx)
	jmp	.L42
.L45:
	movq	-56(%rbp), %rdx
	movq	-64(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	buscarValorRotulo
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %edx
	leaq	-16(%rbp), %rax
	movl	%edx, %ecx
	movl	$.LC17, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf
	movq	-40(%rbp), %rax
	leaq	4(%rax), %rdx
	movzbl	-14(%rbp), %eax
	movb	%al, (%rdx)
	movq	-40(%rbp), %rax
	leaq	3(%rax), %rdx
	movzbl	-15(%rbp), %eax
	movb	%al, (%rdx)
	movq	-40(%rbp), %rax
	leaq	2(%rax), %rdx
	movzbl	-16(%rbp), %eax
	movb	%al, (%rdx)
.L47:
	movq	-56(%rbp), %rax
	movq	-40(%rbp), %rdx
	addq	$2, %rdx
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	strcpy
	jmp	.L23
.L42:
.L23:
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L49
	call	__stack_chk_fail
.L49:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	preencherInstrucao, .-preencherInstrucao
	.globl	executarInstrucao
	.type	executarInstrucao, @function
executarInstrucao:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movq	%rcx, -64(%rbp)
	movq	%r8, -72(%rbp)
	movq	%r9, -80(%rbp)
	movq	-72(%rbp), %rax
	movq	%rax, -16(%rbp)
	jmp	.L51
.L52:
	movq	-16(%rbp), %rax
	movq	136(%rax), %rax
	movq	%rax, -16(%rbp)
.L51:
	movq	-16(%rbp), %rax
	movq	136(%rax), %rax
	testq	%rax, %rax
	jne	.L52
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	escolherLado
	movl	%eax, -24(%rbp)
	movl	-24(%rbp), %eax
	cmpl	$1, %eax
	je	.L54
	cmpl	$2, %eax
	je	.L55
	jmp	.L53
.L54:
	movl	$144, %edi
	call	malloc
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, 136(%rax)
	movq	-16(%rbp), %rax
	movq	136(%rax), %rax
	movq	-64(%rbp), %rdx
	movl	(%rdx), %edx
	movl	%edx, 128(%rax)
	movq	-16(%rbp), %rax
	movq	136(%rax), %rax
	movl	$2, 132(%rax)
	movq	-16(%rbp), %rax
	movq	136(%rax), %rax
	movq	$0, 136(%rax)
	movq	-16(%rbp), %rax
	movq	136(%rax), %rax
	movl	$808464432, (%rax)
	movw	$48, 4(%rax)
	movq	-16(%rbp), %rax
	movq	136(%rax), %rax
	addq	$64, %rax
	movl	$808464432, (%rax)
	movw	$48, 4(%rax)
	movq	-16(%rbp), %rax
	movq	136(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-80(%rbp), %rax
	movl	$2, (%rax)
	jmp	.L53
.L55:
	movq	-16(%rbp), %rax
	addq	$64, %rax
	movq	%rax, -8(%rbp)
	movq	-80(%rbp), %rax
	movl	$1, (%rax)
	movq	-64(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-64(%rbp), %rax
	movl	%edx, (%rax)
	nop
.L53:
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	indentificarInstrucao
	movl	%eax, -20(%rbp)
	movq	-40(%rbp), %rax
	movq	72(%rax), %rdx
	movq	-56(%rbp), %rdi
	movl	-24(%rbp), %ecx
	movl	-20(%rbp), %esi
	movq	-8(%rbp), %rax
	movq	%rdi, %r8
	movq	%rax, %rdi
	call	preencherInstrucao
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	executarInstrucao, .-executarInstrucao
	.globl	ehStringZero
	.type	ehStringZero, @function
ehStringZero:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)
	movl	$0, -20(%rbp)
	jmp	.L57
.L61:
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L58
	movl	$1, %eax
	jmp	.L59
.L58:
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$48, %al
	je	.L60
	movl	$0, %eax
	jmp	.L59
.L60:
	addl	$1, -20(%rbp)
.L57:
	movl	-20(%rbp), %eax
	movslq	%eax, %rbx
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	cmpq	%rax, %rbx
	jb	.L61
	movl	$1, %eax
.L59:
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	ehStringZero, .-ehStringZero
	.globl	escolherLado
	.type	escolherLado, @function
escolherLado:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	ehStringZero
	xorl	$1, %eax
	testb	%al, %al
	je	.L63
	movq	-8(%rbp), %rax
	addq	$64, %rax
	movq	%rax, %rdi
	call	ehStringZero
	testb	%al, %al
	je	.L63
	movq	-8(%rbp), %rax
	movl	132(%rax), %eax
	cmpl	$1, %eax
	jne	.L63
	movl	$1, %eax
	jmp	.L64
.L63:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	ehStringZero
	xorl	$1, %eax
	testb	%al, %al
	je	.L65
	movq	-8(%rbp), %rax
	addq	$64, %rax
	movq	%rax, %rdi
	call	ehStringZero
	xorl	$1, %eax
	testb	%al, %al
	je	.L65
	movq	-8(%rbp), %rax
	movl	132(%rax), %eax
	cmpl	$2, %eax
	jne	.L65
	movl	$1, %eax
	jmp	.L64
.L65:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	ehStringZero
	xorl	$1, %eax
	testb	%al, %al
	je	.L66
	movq	-8(%rbp), %rax
	addq	$64, %rax
	movq	%rax, %rdi
	call	ehStringZero
	testb	%al, %al
	je	.L66
	movq	-8(%rbp), %rax
	movl	132(%rax), %eax
	cmpl	$2, %eax
	jne	.L66
	movl	$2, %eax
	jmp	.L64
.L66:
	movl	$1, %eax
.L64:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	escolherLado, .-escolherLado
	.ident	"GCC: (Ubuntu 4.9.2-10ubuntu13) 4.9.2"
	.section	.note.GNU-stack,"",@progbits
