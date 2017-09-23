#! /bin/sh

nasm -f macho32 -o sample.o  sample.asm 
ld -o sample.out sample.o

