#define BUFFERSIZE 1500

#ifndef TAM_PALAVRA
#define TAM_PALAVRA 64
#endif

#ifndef TIPO_ITEM
#define TIPO_ITEM
enum tipoItem{ ROTULO=1, DIRETIVA=2, INSTRUCAO=3, DECIMAL=4, HEXADECIMAL=5, ENTRE_ASPAS=6, DESCONHECIDO=7};
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
	int pos;  // posicao associada
	int tipo;
	struct palavra *prox;
};
#endif

void Orquestrador(FILE* file, struct palavra *listaPalavras);
bool ehInstrucao(char campo[]);
int identificarTipo(char campo[], int tam);
