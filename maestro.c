#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include "maestro.h"
#include "numbers.h"

struct rotulo {
	char nome[64];
	int pos; // posicao assiciada. Em hexadecimal
	struct rotulo *prox;
};


/* Analisa as linhas de comando do arquivo */
void Orquestrador(FILE* file) {

	int linhaAtual, i, j;
	int tam;
	int tipoCampo;
	char buffer[BUFFERSIZE];
	char temp[BUFFERSIZE], aux;
	char *token;
	struct rotulo listaRotulos;

	/* Lê linha por linha e realiza as operacões necessarias contidas nela */
	linhaAtual = 0;

	/* Inicializa a cabeca da lista ligada de rótulos */
	strcpy(listaRotulos.nome, "cabeca");
	listaRotulos.prox = NULL;
	
	// enquanto houver linhas
	while( fgets(buffer, sizeof(buffer), file) ) {
		
		/* Separa as palavras com base nos espacos e as analisa*/
		token = strtok(buffer, " ");
		while(token != NULL) {
			/* Se encontrar um marcador # de comentario ou o fim de uma linha, seguir para a próxima linha */
			if( strcmp(token, "#") == 0 || strcmp(token, "\n") == 0)
				break;

			/* Tira um '\n' do final, se existir */
			tam = strlen(token);
			tam = tirarNewLine(token, tam);

			/* Identifica o tipo do campo */
			tipoCampo = identificarTipo(token, tam);

			/* Trata o campo em funcão de seu tipo */
			switch(tipoCampo) {
				case ROTULO:
					// adicionar rotulo na lista ligada
				break;
				case DIRETIVA:

				break;
				case INSTRUCAO:

				break;
				case DECIMAL:

				break;
				case HEXADECIMAL:

				break;
				default:

				break;
			}

			/* Pega a próxima palavra */
			token = strtok(NULL, " ");
		}

		linhaAtual++;
	}
}

bool ehInstrucao(char campo[]) {

	if( strcmp(campo, "LD") == 0)
		return true;
	if( strcmp(campo, "LD-") == 0)
		return true;
	if( strcmp(campo, "LD|") == 0)
		return true;
	if( strcmp(campo, "LDmq") == 0)
		return true;
	if( strcmp(campo, "LDmq_mx") == 0)
		return true;
	if( strcmp(campo, "ST") == 0)
		return true;
	if( strcmp(campo, "JMP") == 0)
		return true;
	if( strcmp(campo, "JUMP+") == 0)
		return true;
	if( strcmp(campo, "ADD") == 0)
		return true;
	if( strcmp(campo, "ADD|") == 0)
		return true;
	if( strcmp(campo, "SUB") == 0)
		return true;
	if( strcmp(campo, "SUB|") == 0)
		return true;
	if( strcmp(campo, "MUL") == 0)
		return true;
	if( strcmp(campo, "DIF") == 0)
		return true;
	if( strcmp(campo, "LSH") == 0)
		return true;
	if( strcmp(campo, "RSH") == 0)
		return true;
	if( strcmp(campo, "STaddr") == 0)
		return true;

	return false;
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