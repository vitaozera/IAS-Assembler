#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include "maestro.h"
#include "numbers.h"
#include "diretivas.h"
#include "rotulos.h"

// DEBUG - depois passar para o .h (junto com todas outras funcoes do arquivo .c)
void addListaItens(struct item *listaItens, char campo[], int tipo, int linha);
void freeListaItens(struct item *p);
void freeListaPalavras(struct palavra *p);

/* Analisa as linhas de comando do arquivo e executa operações em cima disso */
void Orquestrador(FILE* file) {

	int linhaAtual, i, j;
	int tam, tamAux;
	int tipoCampo;
	int pontoDeMontagem = 0x000;
	char buffer[BUFFERSIZE];
	char temp[BUFFERSIZE], aux;
	char *token, *tokenAux;
	struct rotulo listaRotulos;
	struct item listaItens, *pItem;
	struct rotulo *pRotulo;
	struct palavra listaPalavras;

	/* Lê linha por linha e realiza as operacões necessarias contidas nela */
	linhaAtual = 1;

	/* Inicializa a cabeca da lista ligada de rótulos */
	strcpy(listaRotulos.nome, "cabeca");
	listaRotulos.pos = -001;
	listaRotulos.prox = NULL;
	
	/* Inicializa a cabeca da lista ligada de itens */
	strcpy(listaItens.campo, "cabeca");
	listaItens.linha = -1;
	listaItens.tipo = -1;
	listaItens.prox = NULL;

	/* Inicializa a cabeca da lista ligada de palavras */
	strcpy(listaPalavras.campo1, "cabeca");
	strcpy(listaPalavras.campo2, "cabeca");
	listaPalavras.pos = -1;
	listaPalavras.tipo = -1;
	listaPalavras.prox = NULL;

	// enquanto houver linhas
	while( fgets(buffer, sizeof(buffer), file) ) {
		
		/* Separa as palavras com base nos espacos e as analisa*/
		token = strtok(buffer, " \t");
		while(token != NULL) {
			/* Se encontrar um marcador # de comentario ou o fim de uma linha, seguir para a próxima linha */
			if( strcmp(token, "#") == 0 || strcmp(token, "\n") == 0  || strcmp(token, "\t") == 0)
				break;

			/* Tira um '\n' do final, se existir */
			tam = strlen(token);
			tam = tirarNewLine(token, tam);

			/* Identifica o tipo do campo */
			tipoCampo = identificarTipo(token, tam);
			
			/* Coloca todos items, que contém os campos, em uma lista ligada */
			addListaItens(&listaItens, token, tipoCampo, linhaAtual);

			/* Pega a próxima palavra */
			token = strtok(NULL, " ");
		}

		linhaAtual++;
	}
	// Nesse ponto todas linhas do arquivo foram lidas e suas informações estão na listaItens

	/* Executa as diretivas .set */
	diretivaSet(&listaItens);

	/* Analisa cada item da lista ligada de itens e executa ações de acordo com seu tipo */
	pItem = &listaItens;
	while(pItem != NULL) {
		switch(pItem->tipo) {
			case ROTULO:
				addListaRotulo(&listaRotulos, pItem, pontoDeMontagem);
			break;
			case DIRETIVA:
				executarDiretiva(pItem, &listaItens, &listaRotulos, &pontoDeMontagem, &listaPalavras);
			break;
			case INSTRUCAO:

			break;
			case DECIMAL:
				//DEBUG provavelmente nao é necessario tratar
			break;
			case HEXADECIMAL:
				//DEBUG provavelmente nao é necessario tratar
			break;
			default:

			break;
		}
		pItem = pItem->prox;
	}

	/* Imprime a lista de itens */
	printf("LISTA DE ITENS:\n");
	struct item *p;
	p = &listaItens;
	while(p != NULL) {
		printf("%s\n", p->campo);
		p = p->prox;
	}
	printf("\n");

	/* Imprime a lista de rotulos */
	printf("LISTA DE RÓTULOS:\n");
	struct rotulo *r;
	r = listaRotulos.prox;
	while(r != NULL) {
		printf("rotulo: %s | mem: %d\n", r->nome, r->pos);
		r = r->prox;
	}
	printf("\n");

	/* Imprime a lista de palavras */
	printf("LISTA DE PALAVRAS:\n");
	struct palavra *s;
	s = &listaPalavras;
	while(s != NULL) {
		printf("campo1: %s | campo2: %s | tipo: %d   |  mem: %d\n", s->campo1, s->campo2, s->tipo, s->pos);
		s = s->prox;
	}

	/* Libera a memória da lista de itens. A partir da cabeça */
	freeListaItens(listaItens.prox);

	/* Libera a memória da lista de rótulos. A partir da cabeça */
	freeListaRotulos(listaRotulos.prox);

	/* Libera a memória da lista de palavras. A partir da cabeça */
	freeListaPalavras(listaPalavras.prox);
}

/* Adiciona um item à lista ligada de itens */
void addListaItens(struct item *listaItens, char campo[], int tipo, int linha) {
	struct item *p;

	p = listaItens;
  
	/* Vai até a última posicao da lista */
	while(p->prox != NULL) {
		p = p->prox;
	}
	
	p->prox = malloc(sizeof(struct item));
	
	strcpy(p->prox->campo, campo);
	p->prox->tipo = tipo;
	p->prox->linha = linha;  
	p->prox->prox = NULL;
}

void freeListaItens(struct item *p) {
	if(p->prox != NULL) {
		freeListaItens(p->prox);
	}
	free(p);
}

void freeListaPalavras(struct palavra *p) {
	if(p->prox != NULL) {
		freeListaPalavras(p->prox);
	}
	free(p);
}

void delItemLista(struct item *listaItens, struct item *morto) {
	struct item *p, *temp;

	p = listaItens;
	while(p != NULL) {
		/* Se o morto foi achado na lista */
		if(p->prox == morto) {
			temp = morto->prox;
			free(morto);
			p->prox = temp;
			return;
		}
		p = p->prox;
	}
}

/* Identifica qual o tipo (instrucao, rotulo, diretiva... */
int identificarTipo(char campo[], int tam) {
	int i;
	
	/* Verifica se o campo é rotulo (Se o último caractere for : )*/
	if( campo[tam-1] == ':' ) {
		return ROTULO;
	}
	/* Verifica se o campo é diretiva (Se o primeiro caractere for . ) */
	else if( campo[0] == '.') {
		return DIRETIVA;
	}
	/* Verifica se o campo é um número decimal */
	else if(ehDecimal(campo, tam)) {
		return DECIMAL;
	}
	/* Verifica se o campo é um numero hexadecimal */
	else if(ehHexadecimal(campo, tam)) {
		return HEXADECIMAL;
	}
	/* Verifica se o campo é instrucao */
	else if(ehInstrucao(campo)) {
		return INSTRUCAO;
	}

	return 0;
}

/* Tira '\n' da última posicão, se existir */
int tirarNewLine(char *campo, int tam) {
	// Se o campo tiver um '\n' no fim, ignore-o.
	if(campo[tam-1] == '\n') {
		campo[tam-1] = '\0';
		tam--;
	}
	return tam;
}