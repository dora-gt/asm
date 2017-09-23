#! /bin/sh

nasm -f macho32 -o sample.o  sample.asm 
ld -o sample.out sample.o

nasm -f macho32 -o exit.o  exit.asm
ld -o exit.out exit.o