section .data
    c1 db 'abc'
    len_c1 equ $-c1

    c2 db 'grd'
    len_c2 equ $-c2

    msg1 db 'Cadena igual', 10
    len_msg1 equ $-msg1

    msg2 db 'Cadena no igual', 10
    len_msg2 equ $-msg2

section .text
    global _start

    _start:
    mov esi, c1
    mov edi, c2
    mov ecx, len_c2
    cld
    repe  cmpsb
    jecxz  equal   
    
    ;NO IGUAL
    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, len_msg2
    int 80h
    jmp exit
    
    ;IGUAL
    equal:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg1
    mov edx, len_msg1
    int 80h

    exit:
    mov eax, 1
    mov ebx, 0
    int 80h

