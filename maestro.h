#define BUFFERSIZE 1500
#ifndef TAM_PALAVRA
#define TAM_PALAVRA 64
#endif


struct rotulo {
	char nome[64];
	int pos; // posicao assiciada
	int lado;
	struct rotulo *prox;
};

struct item {
	char campo[64];
	int tipo;
	int linha;
	struct item *prox;
};

struct palavra {
	char campo1[TAM_PALAVRA], campo2[TAM_PALAVRA];
	int pos;  // posicao associada
	int tipo;
	struct palavra *prox;
};

void Orquestrador(FILE* file, struct palavra *listaPalavras);
bool ehInstrucao(char campo[]);
int identificarTipo(char campo[], int tam);
