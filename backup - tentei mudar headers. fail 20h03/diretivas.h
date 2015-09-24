
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

#define TAM_PALAVRA 64

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

#ifndef ROTULO
#define ROTULO
struct rotulo {
	char nome[64];
	int pos; // posicao assiciada
	int lado;
	struct rotulo *prox;
};
#endif

#ifndef PALAVRA
#define PALAVRA
struct palavra {
	char campo1[TAM_PALAVRA], campo2[TAM_PALAVRA];
	int pos;  // posicao associada
	int tipo;
	struct palavra *prox;
};
#endif