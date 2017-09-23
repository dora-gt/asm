global start

section .text

start:
    push dword 0
    mov eax, 0x1
    sub esp, 4
    int 0x80
