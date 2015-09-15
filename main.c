/**********************************************/
/*    IAS Assembler - MC 404 - Trabalho 1     */
/* Vitor Alves Mesquita da Silva - RA: 158498 */
/**********************************************/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include "maestro.h"

int main(int argc, char *argv[] ) {
	char* nomeEntrada;
	char* nomeSaida = NULL;
	int linhaAtual;

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
		Orquestrador(file);
		fclose(file);
	}
	else {
		printf("Problema na abertura do arquivo\n");
		exit(-1);
	}

	return 0;
}