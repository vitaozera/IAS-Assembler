ias-as: main.o diretivas.o instrucoes.o maestro.o numbers.o rotulos.o
	ld -dynamic-linker /lib64/ld-linux-x86-64.so.2 /usr/lib64/crt1.o /usr/lib64/crti.o -L/usr/lib64 main.o diretivas.o instrucoes.o maestro.o numbers.o rotulos.o -lc /usr/lib64/crtn.o -o ias-as
	
main.o: main.s
	as main.s -o main.o
diretivas.o: diretivas.s
	as diretivas.s -o diretivas.o
instrucoes.o: instrucoes.s
	as instrucoes.s -o instrucoes.o
maestro.o: maestro.s
	as maestro.s -o maestro.o
numbers.o: numbers.s
	as numbers.s -o numbers.o
rotulos.o: rotulos.s
	as rotulos.s -o rotulos.o

	
main.s: main.c
	gcc -S main.c -o main.s
diretivas.s: diretivas.c
	gcc -S diretivas.c -o diretivas.s
instrucoes.s: instrucoes.c
	gcc -S instrucoes.c -o instrucoes.s
maestro.s: maestro.c
	gcc -S maestro.c -o maestro.s
numbers.s: numbers.c
	gcc -S numbers.c -o numbers.s
rotulos.s: rotulos.c
	gcc -S rotulos.c -o rotulos.s


clean:
	rm -f main.s diretivas.s instrucoes.s maestro.s numbers.s rotulos.s main.o diretivas.o instrucoes.o maestro.o numbers.o rotulos.s prog.x
