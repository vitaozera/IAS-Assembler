/**********************************************/
/*    IAS Assembler - MC 404 - Trabalho 1     */
/* Vitor Alves Mesquita da Silva - RA: 158498 */
/**********************************************/

#ifndef TAM_PALAVRA
#define TAM_PALAVRA 64
#endif

/* ENUMS */
#ifndef TIPO_ITEM
#define TIPO_ITEM
enum tipoItem{ ROTULO=1, DIRETIVA=2, INSTRUCAO=3, DECIMAL=4, HEXADECIMAL=5, ENTRE_ASPAS=6, DESCONHECIDO=7};
#endif

#ifndef TIPO_DIRETIVA
#define TIPO_DIRETIVA
enum tipoDiretiva{ ORG=1, ALIGN=2, WORD=3, WFILL=4, SET=5};
#endif

#ifndef TIPO_PALAVRA
#define TIPO_PALAVRA
enum tipoPalavra{ NUMERO_HEXA=1, INSTRUCOES=2};
#endif

#ifndef LADO
#define LADO
enum lado{ESQUERDA=1, DIREITA=2};
#endif

/* STRUCTS */
#ifndef ITEM
#define ITEM
struct item {
	char campo[64];
	int tipo;
	int linha;
	struct item *prox;
};
#endif

#ifndef DIRETIVASET
#define DIRETIVASET
struct diretivaSet {
	char campo[64];
	char valor[64];
	struct diretivaSet *prox;
};
#endif

#ifndef ROT
#define ROT
struct rotulo {
	char nome[64];
	int pos; /* posicao assiciada */
	int lado;
	struct rotulo *prox;
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
void addListaSet(struct diretivaSet *diretivaSet, char campo[], char valor[]);
void freeListaSet(struct diretivaSet *p);
void executarSet(struct item *listaItens, struct diretivaSet *listaSet);
void diretivaSet(struct item *listaItens);
int identificarDiretiva(struct item *p);
void executarAlign(int *pontoDeMontagem, int i);
void executarWord(struct item *pItem, struct rotulo *listaRotulos,
 int *pontoDeMontagem, struct palavra *listaPalavras, int *ladoAtual);
void executarWFill(struct item *pItem, struct rotulo *listaRotulos,
 int *pontoDeMontagem, struct palavra *listaPalavras, int *ladoAtual);
void executarOrg(char *valor_hex,char *valor, int *pontoDeMontagem);
void executarDiretiva(struct item *pItem, struct item *listaItens, struct rotulo *listaRotulos,
 int *pontoDeMontagem, struct palavra *listaPalavras, int *ladoAtual);