/**********************************************/
/*    IAS Assembler - MC 404 - Trabalho 1     */
/* Vitor Alves Mesquita da Silva - RA: 158498 */
/**********************************************/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include "maestro.h"
#include "main.h"

void imprimirMapa(struct palavra *listaPalavras, char *argv[], int argc);
void freeListaPalavras(struct palavra *p);

int main(int argc, char *argv[] ) {
	char* nomeEntrada;
	char* nomeSaida = NULL;
	int linhaAtual;
	struct palavra listaPalavras;

	/* Inicializa a cabeca da lista ligada de palavras */
	strcpy(listaPalavras.campo1, "cabeca");
	strcpy(listaPalavras.campo2, "cabeca");
	listaPalavras.pos = -1;
	listaPalavras.tipo = -1;
	listaPalavras.prox = NULL;

	/* Armazena o nome de entrada (primeiro argumento) */
	if(argc < 2 || argc > 3) {
		printf("Número de argumentos errado\n");
		exit(-1);
	}
	nomeEntrada = argv[1];

	/* Armazena o nome de saida (segundo argumento) */
	// se existir um segundo argumento
	if(argv[2] != NULL){
		nomeSaida = argv[2];
	}
	
	/* Abre o arquivo de entrada e chama o Orquestrador */
	FILE* file = fopen(nomeEntrada, "r");
	if( file != NULL) {
		Orquestrador(file, &listaPalavras);
		fclose(file);
	}
	else {
		printf("Problema na abertura do arquivo\n");
		exit(-1);
	}

	imprimirMapa(&listaPalavras, argv, argc);

	/* Libera a memória da lista de palavras. A partir da cabeça */
	freeListaPalavras(listaPalavras.prox);

	return 0;
}

void freeListaPalavras(struct palavra *p) {
	if(p != NULL) {
		freeListaPalavras(p->prox);
	}
	free(p);
}

void imprimirMapa(struct palavra *listaPalavras, char *argv[], int argc) {
	struct palavra *p;
	FILE *file;
	int i;

	/* Se houver um arquivo de saida */
	if(argc > 2) {
		file = fopen(argv[2], "w");
	}

	for(i = 0; i < MAX_PALAVRAS; i++) {
		p = listaPalavras->prox;
		while(p != NULL) {
			/* Se houver um arquivo de saida */
			if(argc > 2) {
				/* Se forem instrucoes */
				if( p->tipo == INSTRUCOES && p->pos == i) {
				fprintf(file, "%03X %c%c %c%c%c %c%c %c%c%c\n",
					p->pos, p->campo1[0], p->campo1[1], p->campo1[2], p->campo1[3], p->campo1[4],
					 p->campo2[0], p->campo2[1], p->campo2[2], p->campo2[3], p->campo2[4]);
				}
				/* Se for um numero em hexa */
				else if(p->tipo == NUMERO_HEXA && p->pos == i) {
					fprintf(file, "%03X %c%c %c%c%c %c%c %c%c%c\n",
					p->pos, p->campo1[0], p->campo1[1], p->campo1[2], p->campo1[3], p->campo1[4],
					 p->campo1[5], p->campo1[6], p->campo1[7], p->campo1[8], p->campo1[9]);
				}
			}
			/* Se NÃO houver um arquivo de saida */
			else {
				/* Se forem instrucoes */
				if( p->tipo == INSTRUCOES && p->pos == i) {
					printf("%03X %c%c %c%c%c %c%c %c%c%c\n",
					  p->pos, p->campo1[0], p->campo1[1], p->campo1[2], p->campo1[3], p->campo1[4],
					  p->campo2[0], p->campo2[1], p->campo2[2], p->campo2[3], p->campo2[4]);
				}
				/* Se for um numero em hexa */
				else if(p->tipo == NUMERO_HEXA && p->pos == i) {
					printf("%03X %c%c %c%c%c %c%c %c%c%c\n",
					  p->pos, p->campo1[0], p->campo1[1], p->campo1[2], p->campo1[3], p->campo1[4],
					  p->campo1[5], p->campo1[6], p->campo1[7], p->campo1[8], p->campo1[9]);
				}
			}
			p = p->prox;
		}
	}

	

	/* Fecha o arquivo */
	if(argc > 2) {
		fclose(file);
	}	
}