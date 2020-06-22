section .data
        mensaje db 'Ingrese un numero', 10
        len_mensaje equ $-mensaje

        mensaje_presentacion db "El numero ingresado fue: ",10
        len_mensaje_pres equ $-mensaje_presentacion

section .bss
        numero resb 5

section .text
        global _start
_start:
    ;***********************************
    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje
    mov edx, len_mensaje
    int 80h
    ;*******impresion de numeross************************
    mov ebx, 7
    add ebx,'0'
    mov [numero], ebx
    
    ;***************************
    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje_presentacion
    mov edx, len_mensaje_pres
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, numero
    mov edx, 5
    int 80h

    mov eax,1
    int 80h