enum {LD=1, LDmenos=2, LDmod=3, LDmq=4, LDmq_mx=5, ST=6, JMP=7, JUMPmais=8,
 ADD=9, ADDmod=10, SUB=11, SUBmod=12, MUL=13, DIF=14, LSH=15, RSH=16, STaddr=17};


#ifndef LADO
#define LADO
enum lado{ESQUERDA=1, DIREITA=2};
#endif

#ifndef TAM_PALAVRA
#define TAM_PALAVRA 64
#endif

#ifndef TIPO_PALAVRA
#define TIPO_PALAVRA
enum tipoPalavra{ NUMERO_HEXA=1, INSTRUCOES=2};
#endif

