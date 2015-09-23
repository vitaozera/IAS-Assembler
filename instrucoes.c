#include <string.h>
#include <stdbool.h>
#include <stdlib.h>
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
	if( strcmp(campo, "DIV") == 0)
		return DIV;
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

void preencherInstrucao(char *campo, int tipoInstrucao, struct item *pItem, int ladoInstrucao, struct rotulo *listaRotulos) {
	int tam, pos;
	char aux[4];

	if(tipoInstrucao == LD) {
		campo[0] = '0';
		campo[1] = '1';
	}
	else if(tipoInstrucao == LDmenos) {
		campo[0] = '0';
		campo[1] = '2';
	}
	else if(tipoInstrucao == LDmod) {
		campo[0] = '0';
		campo[1] = '3';
	}
	else if(tipoInstrucao == LDmq) {
		campo[0] = '0';
		campo[1] = 'A';
	}
	else if(tipoInstrucao == LDmq_mx) {
		campo[0] = '0';
		campo[1] = '9';
	}
	else if(tipoInstrucao == ST) {
		campo[0] = '2';
		campo[1] = '1';
	}
	else if(tipoInstrucao == JMP) {
		campo[0] = '0';
		if(ladoInstrucao == ESQUERDA)
			campo[1] = 'D';
		if(ladoInstrucao == DIREITA)
			campo[1] = 'E';
	}
	else if(tipoInstrucao == JUMPmais) {
		if(ladoInstrucao == ESQUERDA) {
			campo[0] = '0';
			campo[1] = 'F';
		}
		if(ladoInstrucao == DIREITA) {
			campo[0] = '1';
			campo[1] = '0';
		}
	}
	else if(tipoInstrucao == ADD) {
		campo[0] = '0';
		campo[1] = '5';
	}
	else if(tipoInstrucao == ADDmod) {
		campo[0] = '0';
		campo[1] = '7';
	}
	else if(tipoInstrucao == SUB) {
		campo[0] = '0';
		campo[1] = '6';
	}
	else if(tipoInstrucao == SUBmod) {
		campo[0] = '0';
		campo[1] = '8';
	}
	else if(tipoInstrucao == MUL) {
		campo[0] = '0';
		campo[1] = 'B';
	}
	else if(tipoInstrucao == DIV) {
		campo[0] = '0';
		campo[1] = 'C';
	}
	else if(tipoInstrucao == LSH) {
		campo[0] = '1';
		campo[1] = '4';
		return;
	}
	else if(tipoInstrucao == RSH) {
		campo[0] = '1';
		campo[1] = '5';
		return;
	}
	else if(tipoInstrucao == STaddr) {
		if(ladoInstrucao == ESQUERDA) {
			campo[0] = '1';
			campo[1] = '2';
		}
		if(ladoInstrucao == DIREITA) {
			campo[0] = '1';
			campo[1] = '3';
		}
	}

	/* É possivel, nos casos onde a entrada da instrucao é um rotulo, 
	que o campo ainda nao esteja com o tipo identificado. Nesse caso, é preciso
	identificá-lo */
	if(pItem->tipo == DESCONHECIDO) {
		if(buscarValorRotulo(listaRotulos, pItem->campo) != -1) {
			pItem->tipo = ROTULO;
		}
	}

	/* Coloca a parte do endereço. pode ser rotulo, hexa ou decimal */
	switch(pItem->tipo) {
		case HEXADECIMAL:
			tam = strlen(pItem->campo);
			campo[4] = pItem->campo[tam-1];
			campo[3] = pItem->campo[tam-2];
			campo[2] = pItem->campo[tam-3];
		break;
		case DECIMAL:
			snprintf(aux, 4, "%03X", atoi(pItem->campo));
			campo[4] = aux[2];
			campo[3] = aux[1];
			campo[2] = aux[0];
		break;
		case ROTULO:
			pos = buscarValorRotulo(listaRotulos, pItem->campo);
			snprintf(aux, 4, "%03X", pos);
			campo[4] = aux[2];
			campo[3] = aux[1];
			campo[2] = aux[0];
		break;
		case DESCONHECIDO:
			//DEBUG
			//
		//
		//
		// o tipo instrucao da viajaaaado
		//
		//
		//
		        //
		  //

		break;
	}
}

void executarInstrucao(struct item *pItem, struct item *listaItens, struct rotulo *listaRotulos,
	int *pontoDeMontagem, struct palavra *listaPalavras, int *ladoAtual) {
	int tipoInstrucao, ladoInstrucao, i;
	struct palavra *p;
	char *campo;

	/* Vai até o fim da lista ligada de palavras */
	p = listaPalavras;
	while(p->prox != NULL) {
		p = p->prox;
	}

	/* Verifica se a instrução deve ir à esquerda ou à direita */
	ladoInstrucao = escolherLado(p);

	switch(ladoInstrucao) {
		case ESQUERDA:
			/* Aloca espaço para uma nova palavra */
			p->prox = malloc(sizeof(struct palavra));
			p->prox->pos = *pontoDeMontagem;
			p->prox->tipo = INSTRUCOES;
			p->prox->prox = NULL;
			/* Limpa os campos */
			strcpy(p->prox->campo1, "00000");
			strcpy(p->prox->campo2, "00000");
			/* Ponteiro para o campo da palavra onde será escrita a instrucao */
			campo = p->prox->campo1;
			*ladoAtual = DIREITA;
			
		break;
		case DIREITA:
			/* Ponteiro para o campo da palavra onde será escrita a instrucao */
			campo = p->campo2;
			*ladoAtual = ESQUERDA;
			*pontoDeMontagem = *pontoDeMontagem + 1;
		break;
	}

	tipoInstrucao = indentificarInstrucao(pItem->campo);

	preencherInstrucao(campo, tipoInstrucao, pItem->prox, ladoInstrucao, listaRotulos);


	//DEBUG deletar o proximo cara da lista de itens. pode ser isso que ta dando bug

}

/* Verifica se uma string contém apenas zeros */
bool ehStringZero(char *string) {
	int i;

	for(i = 0; i < strlen(string); i++) {
		if(string[i] == '\0')
			return true;
		if(string[i] != '0')
			return false;
	}
	return true;
}

int escolherLado(struct palavra *p) {
	/* A última palavra é um número em hexa */
	if(!ehStringZero(p->campo1) && ehStringZero(p->campo2) && p->tipo == NUMERO_HEXA)
		return ESQUERDA;
	/* A última palavra contém 2 instruções */
	else if(!ehStringZero(p->campo1) && !ehStringZero(p->campo2) && p->tipo == INSTRUCOES)
		return ESQUERDA;
	/* A última palavra contém apenas uma instrução à esquerda */
	else if(!ehStringZero(p->campo1) && ehStringZero(p->campo2) && p->tipo == INSTRUCOES)
		return DIREITA;
	else
		return ESQUERDA;
}