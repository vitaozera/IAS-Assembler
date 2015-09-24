/**********************************************/
/*    IAS Assembler - MC 404 - Trabalho 1     */
/* Vitor Alves Mesquita da Silva - RA: 158498 */
/**********************************************/
#ifndef TAM_PALAVRA
#define TAM_PALAVRA 64
#endif

/* ENUMS */
#ifndef NOME_INSTRUCOES
#define NOME_INSTRUCOES
enum {LD=1, LDmenos=2, LDmod=3, LDmq=4, LDmq_mx=5, ST=6, JMP=7, JUMPmais=8,
 ADD=9, ADDmod=10, SUB=11, SUBmod=12, MUL=13, DIF=14, LSH=15, RSH=16, STaddr=17};
#endif

#ifndef LADO
#define LADO
enum lado{ESQUERDA=1, DIREITA=2};
#endif

#ifndef TIPO_PALAVRA
#define TIPO_PALAVRA
enum tipoPalavra{ NUMERO_HEXA=1, INSTRUCOES=2};
#endif

/* STRUCTS */
#ifndef ROT
#define ROT
struct rotulo {
	char nome[64];
	int pos; /* posicao assiciada */
	int lado;
	struct rotulo *prox;
};
#endif

#ifndef ITEM
#define ITEM
struct item {
	char campo[64];
	int tipo;
	int linha;
	struct item *prox;
};
#endif

#ifndef PALAVRA
#define PALAVRA
struct palavra {
	char campo1[TAM_PALAVRA], campo2[TAM_PALAVRA];
	int pos;  /* posicao associada */
	int tipo;
	struct palavra *prox;
};
#endif

/* FUNÇÕES */
void formatarRotulo(char token[]);
void addListaRotulo(struct rotulo *listaRotulos, struct item *pItem, int pontoDeMontagem, int ladoAtual);
void freeListaRotulos(struct rotulo *listaRotulos);
int buscarValorRotulo(struct rotulo *listaRotulos, char *nome);
int buscarLadoRotulo(struct rotulo *listaRotulos, char *nome);
void rotulosFaltantes(struct rotulo *listaRotulos, struct palavra *listaPalavras);
