#include <stdbool.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include "diretivas.h"

#define TAM_PALAVRA 64

struct item {
	char campo[64];
	int tipo;
	int linha;
	struct item *prox;
};

struct diretivaSet {
	char campo[64];
	char valor[64];
	struct diretivaSet *prox;
};

struct rotulo {
	char nome[64];
	int pos; // posicao assiciada
	int lado;
	struct rotulo *prox;
};

struct palavra {
	char campo1[TAM_PALAVRA], campo2[TAM_PALAVRA];
	int pos;  // posicao associada
	int tipo;
	struct palavra *prox;
};

void addListaSet(struct diretivaSet *diretivaSet, char campo[], char valor[]) {
	struct diretivaSet *p;

	p = diretivaSet;
	/* Vai até o fim da lista */
	while(p->prox != NULL) {
		p = p->prox;
	}

	/* Adiciona no final da lista */
	p->prox = malloc(sizeof(struct diretivaSet));
	strcpy(p->prox->campo, campo);
	strcpy(p->prox->valor, valor);
	p->prox->prox = NULL;
}

void freeListaSet(struct diretivaSet *p) {
	if(p != NULL && p->prox != NULL) {
		freeListaSet(p->prox);
	}
	free(p);
}

void executarSet(struct item *listaItens, struct diretivaSet *listaSet) {
	struct item *pItem;
	struct diretivaSet *pSet;
	char *campo, *valor, numero_hex[64];
	
	/* Compara todos os elementos da lista set e lista itens e troca os campos por valor */
	pSet = listaSet;
	while(pSet != NULL) {
		pItem = listaItens;
		while(pItem != NULL) {
			if(strcmp(pSet->campo, pItem->campo) == 0) {
				/* Troca o valor */
				if(ehHexadecimal(pSet->valor, strlen(pSet->valor))){
					printf("OI: %s\n", pSet->campo);
					strcpy(pItem->campo, pSet->valor);           //o número +2 ignora o "0x" do começo
					pItem->tipo = HEXADECIMAL;
					printf("OI2: %s\n", pItem->campo);
				}
				else if(ehDecimal(pSet->valor, strlen(pSet->valor))){
					decimal2Hex(numero_hex, pSet->valor);
					strcpy(pItem->campo, numero_hex);
					printf("CAMPO: %s\n", pItem->campo);
					pItem->tipo = HEXADECIMAL;
				}
			}
			pItem = pItem->prox;
		}
		pSet = pSet->prox;
	}
}

/* Executa todas diretivas .set */ 
void diretivaSet(struct item *listaItens) {
	struct item *p;
	struct diretivaSet listaSet;
	struct item *temp, *pAnterior;
	char campo[64], valor[64];

	/* Inicializa a lista de .set */
	strcpy(listaSet.campo, "cabeca");
	strcpy(listaSet.valor, "sem valor");
	listaSet.prox = NULL;
	
	p = listaItens;
	pAnterior = NULL;
	/* Percorre a lista de itens em busca dos .set, tira eles da listaItens e os coloca na listaSet */
	while(p!= NULL) {
		if(strcmp(p->campo, ".set") == 0) {
			strcpy(campo, p->prox->campo); // recebe o campo do .set
			strcpy(valor, p->prox->prox->campo); // recebe o valor do campo
			addListaSet(&listaSet, campo, valor);

			/* Tira a diretiva set, seu campo e valor da lista ligada de itens. */
			temp = p->prox->prox->prox; // guarda o endereco do item à direita do valor
			free(p->prox->prox);
			free(p->prox);
			free(p);
			pAnterior->prox = temp;
			p = temp;
		}
		else {
			pAnterior = p;
			p = p->prox;
		}
	}

	/* Executa a diretiva set na lista de itens */
	executarSet(listaItens, &listaSet);

	// libera a memoria da listaSet a partir da cabeca */
	freeListaSet(listaSet.prox);
}

/* Identifica qual o tipo de diretiva */
int identificarDiretiva(struct item *p) {
	char *campo;

	campo = p->campo;
	if(strcmp(campo, ".org") == 0) {
		return ORG;
	}
	else if(strcmp(campo, ".align") == 0)  {
		return ALIGN;
	}
	else if(strcmp(campo, ".word") == 0)  {
		return WORD;
	}
	else if(strcmp(campo, ".wfill") == 0)  {
		return WFILL;
	}
	return -1;
}

void executarAlign(int *pontoDeMontagem, int i) {
	int k;

	/* Se o ponto de montagem ja for um múltiplo.
	 (ignora pro caso onde o ponto de montagem é 0)*/
	if(*pontoDeMontagem % i == 0 && *pontoDeMontagem != 0)
		return;

	/* Último múltiplo antes do numero do ponto de montagem */
	k = *pontoDeMontagem / i;
	k = k * i;

	/* Salva o próximo múltiplo no ponto de montagem */
	*pontoDeMontagem = k + i;
}

void executarWord(struct item *pItem, struct rotulo *listaRotulos,
 int *pontoDeMontagem, struct palavra *listaPalavras, int *ladoAtual) {
	int pos; //posicão do rótulo, caso haja
	struct palavra *p;

	/* Vai até o fim da lista ligada de palavras */
	p = listaPalavras;
	while(p->prox != NULL) {
		p = p->prox;
	}

	/* Coloca o numero na lista ligada de palavras */
	p->prox = malloc(sizeof(struct palavra));
	/* Numero de entrada em decimal */
	if(pItem->tipo == DECIMAL) {
		snprintf(p->prox->campo1, TAM_PALAVRA, "%010X", atoi(pItem->campo));
	}
	/* Numero de entrada em hexadecimal */
	else if(pItem->tipo == HEXADECIMAL) {
		strcpy(p->prox->campo1, pItem->campo+2);
	}
	/* Numero de entrada em rótulo */
	else if(pItem->tipo == ROTULO) {
		formatarRotulo(pItem->campo);		
		pos = buscarValorRotulo(listaRotulos, pItem->campo);
		/* Se o rótulo ainda não é conhecido nesse ponto do programa, deixa ele escrito */
		if(pos == -1){
			snprintf(p->prox->campo1, TAM_PALAVRA, "%s", pItem->campo);
		}
		/* Se o rótulo ja for conhecido, anota sua posição */
		else {
			snprintf(p->prox->campo1, TAM_PALAVRA, "%010X", pos);
		}
	}
	
	p->prox->campo2[0] = '\0';
	p->prox->pos = *pontoDeMontagem;
	p->prox->tipo = NUMERO_HEXA;    //DEBUG - pode dar bugs no caso de rotulo ?
	p->prox->prox = NULL;

	*ladoAtual = ESQUERDA;
	*pontoDeMontagem = *pontoDeMontagem + 1;
}

void executarWFill(struct item *pItem, struct rotulo *listaRotulos,
 int *pontoDeMontagem, struct palavra *listaPalavras, int *ladoAtual) {
	int i, j;

	i = atoi(pItem->campo);

	/* manda rodar i vezes a diretiva .word */
	for(j = 0; j < i; j++) {
		executarWord(pItem->prox, listaRotulos, pontoDeMontagem, listaPalavras, ladoAtual);
	}
}

void executarOrg(char *valor_hex,char *valor, int *pontoDeMontagem) {

	if(ehHexadecimal(valor, strlen(valor))) {
		*pontoDeMontagem = strtol(valor, NULL, 16); // representa o valor em hexa(char[]) como int
	}
	else if(ehDecimal(valor, strlen(valor))) {
		*pontoDeMontagem = strtol(valor, NULL, 10); // representa o valor em decimal(char[]) como int
	}

}

/* Executa todos tipo de diretiva, exceto a .set que é executada por diretivaSet() */
void executarDiretiva(struct item *pItem, struct item *listaItens, struct rotulo *listaRotulos,
 int *pontoDeMontagem, struct palavra *listaPalavras, int *ladoAtual) {
	int tipoDiretiva, multiplo;
	char valor_hex[64];

	/* Identifica o tipo de diretiva */
	tipoDiretiva = identificarDiretiva(pItem);

	/* Toma a decisão correspondente ao tipo de diretiva */
	switch(tipoDiretiva) {
		case ORG:
			executarOrg(valor_hex, pItem->prox->campo, pontoDeMontagem);
			delItemLista(listaItens, pItem->prox); //deleta o proximo item da lista. (ele contem o valor do .org)
		break;
		case ALIGN:
			multiplo = atoi(pItem->prox->campo);
			executarAlign(pontoDeMontagem, multiplo);
			delItemLista(listaItens, pItem->prox); //deleta o proximo item da lista. (ele contem o valor do .align)
		break;
		case WORD:
			executarWord(pItem->prox, listaRotulos, pontoDeMontagem, listaPalavras, ladoAtual);
			delItemLista(listaItens, pItem->prox); //deleta o proximo item da lista. (ele contem o valor do .word)
		break;
		case WFILL:
			executarWFill(pItem->prox, listaRotulos, pontoDeMontagem, listaPalavras, ladoAtual);
			delItemLista(listaItens, pItem->prox->prox); //deleta o proximo item da lista. (contem arg 2 do wfill)
			delItemLista(listaItens, pItem->prox); //deleta o proximo item da lista. (contem o arg 1 do wfill
		break;
	}
}

