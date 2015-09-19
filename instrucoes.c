#include <string.h>
#include <stdbool.h>

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