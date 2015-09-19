#include <string.h>
#include <stdlib.h>

struct rotulo {
	char nome[64];
	int pos; // posicao assiciada. Em hexadecimal
	struct rotulo *prox;
};

struct item {
	char campo[64];
	int tipo;
	int linha;
	struct item *prox;
};

/* Formata uma string tirando o : final, se existir */
void formatarRotulo(char token[]) {
	int tam = strlen(token);
	int i;

	if( token[tam-1] == ':' ) {
		token[tam-1] = '\0';
	}
}

void addListaRotulo(struct rotulo *listaRotulos, struct item *pItem, int pontoDeMontagem) {
	struct rotulo *p;

	formatarRotulo(pItem->campo);

	/* Vai até o fim da lista ligada de rotulos */
	p = listaRotulos;
	while(p->prox != NULL) {
		p = p->prox;
	}

	/* Adiciona o rótulo no final da lista */
	p->prox = malloc(sizeof(struct rotulo));
	strcpy(p->prox->nome, pItem->campo);
	p->prox->pos = pontoDeMontagem;
	p->prox->prox = NULL;
}

void freeListaRotulos(struct rotulo *listaRotulos) {
	
	if(listaRotulos != NULL)
		freeListaRotulos(listaRotulos->prox);
	free(listaRotulos);
}