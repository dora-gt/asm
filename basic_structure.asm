global start

section .text

start:
    int 3
    cmp dword [esp], 5
    jl .if
    jge .else
.if:
    call func_1
    jmp .end_if
.else:
    call func_2
.end_if:
    push dword [esp]
    mov eax, 0x1
    sub esp, 4
    int 0x80

func_1:
    ret

func_2:
    ret

section .data
    hello_world db "Hello World!", 0
    good_night_world db "Goodnight baby.", 0

section .bss
