/**********************************************/
/*    IAS Assembler - MC 404 - Trabalho 1     */
/* Vitor Alves Mesquita da Silva - RA: 158498 */
/**********************************************/

#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "rotulos.h"

/* Formata uma string tirando o : final, se existir */
void formatarRotulo(char token[]) {
	int tam = strlen(token);

	if( token[tam-1] == ':' ) {
		token[tam-1] = '\0';
	}
}

void addListaRotulo(struct rotulo *listaRotulos, struct item *pItem, int pontoDeMontagem, int ladoAtual) {
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
	p->prox->lado = ladoAtual;
	p->prox->prox = NULL;
}

void freeListaRotulos(struct rotulo *listaRotulos) {
	
	if(listaRotulos != NULL)
		freeListaRotulos(listaRotulos->prox);
	free(listaRotulos);
}

int buscarValorRotulo(struct rotulo *listaRotulos, char *nome) {
	struct rotulo *p;

	p = listaRotulos;

	while(p != NULL) {
		if( strcmp(p->nome, nome) == 0 ){
			return p->pos;
		}
		p = p->prox;
	}
	return -1;
}

int buscarLadoRotulo(struct rotulo *listaRotulos, char *nome) {
	struct rotulo *p;

	p = listaRotulos;

	while(p != NULL) {
		printf("pNome: %s | nome: %s\n", p->nome, nome);
		if( strcmp(p->nome, nome) == 0 ){
			return p->lado;
		}
		p = p->prox;
	}
	return -1;
}

/* Preenche os rótulos faltantes na lista de palavras */
void rotulosFaltantes(struct rotulo *listaRotulos, struct palavra *listaPalavras) {
	struct palavra *p;
	int pos, i=0;
	char *campo;

	/* Percorre a lista de palavras e substitui as palavras q */
	p = listaPalavras;
	while(p != NULL) {
		if(p->tipo == NUMERO_HEXA) {
			pos = buscarValorRotulo(listaRotulos, p->campo1);
			printf("%d campo: %s  |  pos: %d\n", i++, p->campo1, pos);
			if(pos != -1) {
				snprintf(p->campo1, TAM_PALAVRA, "%010X", pos);
			}
		}
		if(p->tipo == INSTRUCOES) {
			/* Se a instrução for uma das que podem variar a depender do valor de X */
			/* JUMP esq = 0D | JUMP dir = 0E | JUMP+ esq = 0F | JUMP+ dir = 10 |
			 STaddr esq = 12 | STaddr dir = 13 */
			/* Verifica a PRIMEIRA instrução */
			campo = p->campo1;
			printf("LADO_BANANA: %d\n", buscarLadoRotulo(listaRotulos, campo+2) == DIREITA);
			/* Pro caso do JUMP */
			if(campo[0] == '0' && campo[1] == 'D' && buscarLadoRotulo(listaRotulos, campo+2) == DIREITA) {
				campo[1] = 'E';
			}
			/* Pro caso do JUMP+ */
			else if(campo[0] == '0' && campo[1] == 'F' && buscarLadoRotulo(listaRotulos, campo+2) == DIREITA) {
				campo[0] = '1';
				campo[1] = '0';
			}
			/* Pro caso do STaddr */
			else if(campo[0] == '1' && campo[1] == '2' && buscarLadoRotulo(listaRotulos, campo+2) == DIREITA) {
				campo[1] = '3';
			}

			/* Verifica a SEGUNDA instrução */
			campo = p->campo2;
			/* Pro caso do JUMP */
			if(campo[0] == '0' && campo[1] == 'D' && buscarLadoRotulo(listaRotulos, campo+2) == DIREITA) {
				campo[1] = 'E';
								printf("ENTREIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII\n");
			}
			/* Pro caso do JUMP+ */
			else if(campo[0] == '0' && campo[1] == 'F' && buscarLadoRotulo(listaRotulos, campo+2) == DIREITA) {
				campo[0] = '1';
				campo[1] = '0';
			}
			/* Pro caso do STaddr */
			else if(campo[0] == '1' && campo[1] == '2' && buscarLadoRotulo(listaRotulos, campo+2) == DIREITA) {
				campo[1] = '3';
			}
			
			printf("CAMPO: %s\n", p->campo1);
			/* Busca rotulo da esquerda */
			pos = buscarValorRotulo(listaRotulos, p->campo1+2);
			printf("%d campo: %s  |  pos: %d\n", i++, p->campo1, pos);
			if(pos != -1) {
				snprintf(p->campo1+2, TAM_PALAVRA, "%03X", pos);
			}
			/* Busca rotulo da direita */
			pos = buscarValorRotulo(listaRotulos, p->campo2+2);
			if(pos != -1) {
				snprintf(p->campo2+2, TAM_PALAVRA, "%03X", pos);
			}
			
		}
		p = p->prox;
	}
}