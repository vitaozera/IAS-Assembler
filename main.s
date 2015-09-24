	.file	"main.c"
	.section	.rodata
.LC0:
	.string	"N\303\272mero de argumentos errado"
.LC1:
	.string	"r"
	.align 8
.LC2:
	.string	"Problema na abertura do arquivo"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$208, %rsp
	movl	%edi, -196(%rbp)
	movq	%rsi, -208(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -184(%rbp)
	leaq	-160(%rbp), %rax
	movl	$1700946275, (%rax)
	movw	$24931, 4(%rax)
	movb	$0, 6(%rax)
	leaq	-160(%rbp), %rax
	addq	$64, %rax
	movl	$1700946275, (%rax)
	movw	$24931, 4(%rax)
	movb	$0, 6(%rax)
	movl	$-1, -32(%rbp)
	movl	$-1, -28(%rbp)
	movq	$0, -24(%rbp)
	cmpl	$1, -196(%rbp)
	jle	.L2
	cmpl	$3, -196(%rbp)
	jle	.L3
.L2:
	movl	$.LC0, %edi
	call	puts
	movl	$-1, %edi
	call	exit
.L3:
	movq	-208(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -176(%rbp)
	movq	-208(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L4
	movq	-208(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -184(%rbp)
.L4:
	movq	-176(%rbp), %rax
	movl	$.LC1, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -168(%rbp)
	cmpq	$0, -168(%rbp)
	je	.L5
	leaq	-160(%rbp), %rdx
	movq	-168(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Orquestrador
	movq	-168(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	movl	-196(%rbp), %edx
	movq	-208(%rbp), %rcx
	leaq	-160(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	imprimirMapa
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	freeListaPalavras
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L8
	jmp	.L9
.L5:
	movl	$.LC2, %edi
	call	puts
	movl	$-1, %edi
	call	exit
.L9:
	call	__stack_chk_fail
.L8:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.globl	freeListaPalavras
	.type	freeListaPalavras, @function
freeListaPalavras:
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
	je	.L11
	movq	-8(%rbp), %rax
	movq	136(%rax), %rax
	movq	%rax, %rdi
	call	freeListaPalavras
.L11:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	freeListaPalavras, .-freeListaPalavras
	.section	.rodata
.LC3:
	.string	"w"
.LC4:
	.string	"%03X %c%c %c%c%c %c%c %c%c%c\n"
	.text
	.globl	imprimirMapa
	.type	imprimirMapa, @function
imprimirMapa:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$72, %rsp
	.cfi_offset 13, -24
	.cfi_offset 12, -32
	.cfi_offset 3, -40
	movq	%rdi, -72(%rbp)
	movq	%rsi, -80(%rbp)
	movl	%edx, -84(%rbp)
	cmpl	$2, -84(%rbp)
	jle	.L13
	movq	-80(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movl	$.LC3, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -40(%rbp)
.L13:
	movl	$0, -52(%rbp)
	jmp	.L14
.L22:
	movq	-72(%rbp), %rax
	movq	136(%rax), %rax
	movq	%rax, -48(%rbp)
	jmp	.L15
.L21:
	cmpl	$2, -84(%rbp)
	jle	.L16
	movq	-48(%rbp), %rax
	movl	132(%rax), %eax
	cmpl	$2, %eax
	jne	.L17
	movq	-48(%rbp), %rax
	movl	128(%rax), %eax
	cmpl	-52(%rbp), %eax
	jne	.L17
	movq	-48(%rbp), %rax
	movzbl	68(%rax), %eax
	movsbl	%al, %ebx
	movq	-48(%rbp), %rax
	movzbl	67(%rax), %eax
	movsbl	%al, %r11d
	movq	-48(%rbp), %rax
	movzbl	66(%rax), %eax
	movsbl	%al, %r10d
	movq	-48(%rbp), %rax
	movzbl	65(%rax), %eax
	movsbl	%al, %r9d
	movq	-48(%rbp), %rax
	movzbl	64(%rax), %eax
	movsbl	%al, %r8d
	movq	-48(%rbp), %rax
	movzbl	4(%rax), %eax
	movsbl	%al, %edi
	movq	-48(%rbp), %rax
	movzbl	3(%rax), %eax
	movsbl	%al, %esi
	movq	-48(%rbp), %rax
	movzbl	2(%rax), %eax
	movsbl	%al, %r13d
	movq	-48(%rbp), %rax
	movzbl	1(%rax), %eax
	movsbl	%al, %r12d
	movq	-48(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %ecx
	movq	-48(%rbp), %rax
	movl	128(%rax), %edx
	subq	$8, %rsp
	movq	-40(%rbp), %rax
	pushq	%rbx
	pushq	%r11
	pushq	%r10
	pushq	%r9
	pushq	%r8
	pushq	%rdi
	pushq	%rsi
	movl	%r13d, %r9d
	movl	%r12d, %r8d
	movl	$.LC4, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	addq	$64, %rsp
	jmp	.L19
.L17:
	movq	-48(%rbp), %rax
	movl	132(%rax), %eax
	cmpl	$1, %eax
	jne	.L19
	movq	-48(%rbp), %rax
	movl	128(%rax), %eax
	cmpl	-52(%rbp), %eax
	jne	.L19
	movq	-48(%rbp), %rax
	movzbl	9(%rax), %eax
	movsbl	%al, %ebx
	movq	-48(%rbp), %rax
	movzbl	8(%rax), %eax
	movsbl	%al, %r11d
	movq	-48(%rbp), %rax
	movzbl	7(%rax), %eax
	movsbl	%al, %r10d
	movq	-48(%rbp), %rax
	movzbl	6(%rax), %eax
	movsbl	%al, %r9d
	movq	-48(%rbp), %rax
	movzbl	5(%rax), %eax
	movsbl	%al, %r8d
	movq	-48(%rbp), %rax
	movzbl	4(%rax), %eax
	movsbl	%al, %edi
	movq	-48(%rbp), %rax
	movzbl	3(%rax), %eax
	movsbl	%al, %esi
	movq	-48(%rbp), %rax
	movzbl	2(%rax), %eax
	movsbl	%al, %r13d
	movq	-48(%rbp), %rax
	movzbl	1(%rax), %eax
	movsbl	%al, %r12d
	movq	-48(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %ecx
	movq	-48(%rbp), %rax
	movl	128(%rax), %edx
	subq	$8, %rsp
	movq	-40(%rbp), %rax
	pushq	%rbx
	pushq	%r11
	pushq	%r10
	pushq	%r9
	pushq	%r8
	pushq	%rdi
	pushq	%rsi
	movl	%r13d, %r9d
	movl	%r12d, %r8d
	movl	$.LC4, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	addq	$64, %rsp
	jmp	.L19
.L16:
	movq	-48(%rbp), %rax
	movl	132(%rax), %eax
	cmpl	$2, %eax
	jne	.L20
	movq	-48(%rbp), %rax
	movl	128(%rax), %eax
	cmpl	-52(%rbp), %eax
	jne	.L20
	movq	-48(%rbp), %rax
	movzbl	68(%rax), %eax
	movsbl	%al, %r11d
	movq	-48(%rbp), %rax
	movzbl	67(%rax), %eax
	movsbl	%al, %r10d
	movq	-48(%rbp), %rax
	movzbl	66(%rax), %eax
	movsbl	%al, %r9d
	movq	-48(%rbp), %rax
	movzbl	65(%rax), %eax
	movsbl	%al, %r8d
	movq	-48(%rbp), %rax
	movzbl	64(%rax), %eax
	movsbl	%al, %edi
	movq	-48(%rbp), %rax
	movzbl	4(%rax), %eax
	movsbl	%al, %esi
	movq	-48(%rbp), %rax
	movzbl	3(%rax), %eax
	movsbl	%al, %r12d
	movq	-48(%rbp), %rax
	movzbl	2(%rax), %eax
	movsbl	%al, %ebx
	movq	-48(%rbp), %rax
	movzbl	1(%rax), %eax
	movsbl	%al, %ecx
	movq	-48(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %edx
	movq	-48(%rbp), %rax
	movl	128(%rax), %eax
	pushq	%r11
	pushq	%r10
	pushq	%r9
	pushq	%r8
	pushq	%rdi
	pushq	%rsi
	movl	%r12d, %r9d
	movl	%ebx, %r8d
	movl	%eax, %esi
	movl	$.LC4, %edi
	movl	$0, %eax
	call	printf
	addq	$48, %rsp
	jmp	.L19
.L20:
	movq	-48(%rbp), %rax
	movl	132(%rax), %eax
	cmpl	$1, %eax
	jne	.L19
	movq	-48(%rbp), %rax
	movl	128(%rax), %eax
	cmpl	-52(%rbp), %eax
	jne	.L19
	movq	-48(%rbp), %rax
	movzbl	9(%rax), %eax
	movsbl	%al, %r11d
	movq	-48(%rbp), %rax
	movzbl	8(%rax), %eax
	movsbl	%al, %r10d
	movq	-48(%rbp), %rax
	movzbl	7(%rax), %eax
	movsbl	%al, %r9d
	movq	-48(%rbp), %rax
	movzbl	6(%rax), %eax
	movsbl	%al, %r8d
	movq	-48(%rbp), %rax
	movzbl	5(%rax), %eax
	movsbl	%al, %edi
	movq	-48(%rbp), %rax
	movzbl	4(%rax), %eax
	movsbl	%al, %esi
	movq	-48(%rbp), %rax
	movzbl	3(%rax), %eax
	movsbl	%al, %r12d
	movq	-48(%rbp), %rax
	movzbl	2(%rax), %eax
	movsbl	%al, %ebx
	movq	-48(%rbp), %rax
	movzbl	1(%rax), %eax
	movsbl	%al, %ecx
	movq	-48(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %edx
	movq	-48(%rbp), %rax
	movl	128(%rax), %eax
	pushq	%r11
	pushq	%r10
	pushq	%r9
	pushq	%r8
	pushq	%rdi
	pushq	%rsi
	movl	%r12d, %r9d
	movl	%ebx, %r8d
	movl	%eax, %esi
	movl	$.LC4, %edi
	movl	$0, %eax
	call	printf
	addq	$48, %rsp
.L19:
	movq	-48(%rbp), %rax
	movq	136(%rax), %rax
	movq	%rax, -48(%rbp)
.L15:
	cmpq	$0, -48(%rbp)
	jne	.L21
	addl	$1, -52(%rbp)
.L14:
	cmpl	$1023, -52(%rbp)
	jle	.L22
	cmpl	$2, -84(%rbp)
	jle	.L12
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
.L12:
	leaq	-24(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	imprimirMapa, .-imprimirMapa
	.ident	"GCC: (Ubuntu 4.9.2-10ubuntu13) 4.9.2"
	.section	.note.GNU-stack,"",@progbits
