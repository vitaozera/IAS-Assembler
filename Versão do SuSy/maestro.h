/**********************************************/
/*    IAS Assembler - MC 404 - Trabalho 1     */
/* Vitor Alves Mesquita da Silva - RA: 158498 */
/**********************************************/

#ifndef BUFFERSIZE
#define BUFFERSIZE 1500
#endif

#ifndef TAM_PALAVRA
#define TAM_PALAVRA 64
#endif

/* ENUMS */
#ifndef TIPO_ITEM
#define TIPO_ITEM
enum tipoItem{ ROTULO=1, DIRETIVA=2, INSTRUCAO=3, DECIMAL=4, HEXADECIMAL=5, ENTRE_ASPAS=6, DESCONHECIDO=7};
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
char *formatarAspas(char *token, int tam);
void Orquestrador(FILE* file, struct palavra *listaPalavras);
void addListaItens(struct item *listaItens, char campo[], int tipo, int linha);
void freeListaItens(struct item *p);
void delItemLista(struct item *listaItens, struct item *morto);
int identificarTipo(char campo[], int tam);
int tirarNewLine(char *campo, int tam);
