/**********************************************/
/*    IAS Assembler - MC 404 - Trabalho 1     */
/* Vitor Alves Mesquita da Silva - RA: 158498 */
/**********************************************/

#define MAX_PALAVRAS 1024

/* ENUMS */
#ifndef TIPO_PALAVRA
#define TIPO_PALAVRA
enum tipoPalavra{ NUMERO_HEXA=1, INSTRUCOES=2};
#endif

/* FUNÇÕES */
int main(int argc, char *argv[] );
void freeListaPalavras(struct palavra *p);
void imprimirMapa(struct palavra *listaPalavras, char *argv[], int argc);