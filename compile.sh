#! /bin/sh

nasm -f macho32 -o basic_structure.o  basic_structure.asm 
ld -o basic_structure.out basic_structure.o

