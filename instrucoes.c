#include <string.h>
#include <stdbool.h>
#include <stdio.h>
#include "instrucoes.h"

int indentificarInstrucao(char campo[]) {

	if( strcmp(campo, "LD") == 0)
		return LD;
	if( strcmp(campo, "LD-") == 0)
		return LDmenos;
	if( strcmp(campo, "LD|") == 0)
		return LDmod;
	if( strcmp(campo, "LDmq") == 0)
		return LDmq;
	if( strcmp(campo, "LDmq_mx") == 0)
		return LDmq_mx;
	if( strcmp(campo, "ST") == 0)
		return ST;
	if( strcmp(campo, "JMP") == 0)
		return JMP;
	if( strcmp(campo, "JUMP+") == 0)
		return JUMPmais;
	if( strcmp(campo, "ADD") == 0)
		return ADD;
	if( strcmp(campo, "ADD|") == 0)
		return ADDmod;
	if( strcmp(campo, "SUB") == 0)
		return SUB;
	if( strcmp(campo, "SUB|") == 0)
		return SUBmod;
	if( strcmp(campo, "MUL") == 0)
		return MUL;
	if( strcmp(campo, "DIF") == 0)
		return DIF;
	if( strcmp(campo, "LSH") == 0)
		return LSH;
	if( strcmp(campo, "RSH") == 0)
		return RSH;
	if( strcmp(campo, "STaddr") == 0)
		return STaddr;
	return -1; //instrucao nao existe
}

bool ehInstrucao(char campo[]) {
	int instrucao = indentificarInstrucao(campo);

	if(instrucao == -1)
		return false;
	else
		return true;
}

void executarInstrucao(struct item *pItem, struct item *listaItens, struct rotulo *listaRotulos,
	int *pontoDeMontagem, struct palavra *listaPalavras) {
	int tipoInstrucao;

	tipoInstrucao = indentificarInstrucao(pItem->campo);

	if(tipoInstrucao == RSH) {
		// Falta implementar
	}

}