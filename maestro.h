#define BUFFERSIZE 1500

enum { ROTULO=1, DIRETIVA=2, INSTRUCAO=3, DECIMAL=4, HEXADECIMAL=5};
enum {LD=1, LDmenos=2, LDmod=3, LDmq=4, LDmq_mx=5, ST=6, JMP=7, JUMPmais=8,
 ADD=9, ADDmod=10, SUB=11, SUBmod=12, MUL=13, DIF=14, LSH=15, RSH=16, STaddr=17};

void Orquestrador(FILE* file);
bool ehInstrucao(char campo[]);
int identificarTipo(char campo[], int tam);
