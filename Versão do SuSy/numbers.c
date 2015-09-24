/**********************************************/
/*    IAS Assembler - MC 404 - Trabalho 1     */
/* Vitor Alves Mesquita da Silva - RA: 158498 */
/**********************************************/

#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include "numbers.h"

/* Verifica se uma entrada é um numero decimal */
bool ehDecimal(char campo[], int tam) {
	int i;

	for(i = 0; i < tam; i++) {
		if(campo[i] < 48 || campo[i] > 57) { /* ('0' = 48) e ('9' = 57) */
			return false;
		}
	}

	return true;
}

/* Verifica se uma entrada é um numero hexadecimal */
bool ehHexadecimal(char campo[], int tam) {
	int i;

	if ( tam < 3 ) {
		return false;
	}

	/* Verifica se a formatacão está certa */
	if( campo[0] != '0' || campo[1] != 'x' )
		return false;

	for(i = 2; i < tam; i++) {
		if( (campo[i] > 47 && campo[i] < 58) || (campo[i] > 64 && campo[i] < 71) || (campo[i] > 96 && campo[i] < 103)) {
			
		}
		else {
			return false;
		}
	}

	return true;
}

/* Converte um número decimal para hexadecimal */
void decimal2Hex(char *hex, char *dec) {
	snprintf(hex, 64, "%012X", atoi(dec));
}