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
    push dword eax
    mov eax, 0x1
    sub esp, 4
    int 0x80

console:
    push dword ebp
    mov ebp, esp
    push dword [ebp + 12] ; length
    push dword [ebp + 8] ; message
    push dword 1
    mov eax, 4
    sub esp, 4
    int 0x80
    add esp, 20
    ret

func_1:
    push dword hello_world_len
    push dword hello_world
    call console
    add esp, 8
    mov eax, 1
    ret

func_2:
    push dword good_night_world_len
    push dword good_night_world
    call console
    add esp, 8
    mov eax, 2
    ret

section .data
    hello_world: db "Hello World!", 10
    hello_world_len: equ $ - hello_world
    good_night_world: db "Goodnight baby.", 10
    good_night_world_len: equ $ - good_night_world

section .bss
    message_address: resb 4
    message_length: resb 4
    exit_code: resb 4
