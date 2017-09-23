global start

section .text

start:
    cmp dword [esp], 2
    jl .if
    jge .else
.if:
    call func_1
    jmp .end_if
.else:
    call func_2
.end_if:
    push dword 0
    mov eax, 0x1
    sub esp, 4
    int 0x80

func_1:
    push dword hello_world_len
    push dword hello_world
    push dword 1
    mov eax, 4
    sub esp, 4
    int 0x80
    add esp, 16
    ret

func_2:
    push dword good_night_world_len
    push dword good_night_world
    push dword 1
    mov eax, 4
    sub esp, 4
    int 0x80
    add esp, 16
    ret

section .data
    hello_world db "Hello World!", 10
    hello_world_len equ $ - hello_world
    good_night_world db "Goodnight baby.", 10
    good_night_world_len equ $ - good_night_world

section .bss
