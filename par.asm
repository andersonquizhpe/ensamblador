;Anderson Quizhpe
;
;Verificar umero par o impar
%macro imprimir 2
        mov eax, 4
        mov ebx, 1
        mov ecx, %1
        mov edx, %2
        int 80h
%endmacro

section .data
    mensaje db 10,"El numero es par"
    len_mensaje equ $-mensaje
    
    mensaje_impar db 10,"El numero es impar"
    len_mensaje_impar equ $-mensaje_impar

section .bss

section .text
        global _start
_start: 
    mov ax, 9
    and ax, 1
    jz par
    jmp impar
par:
    imprimir mensaje, len_mensaje
    jmp salir

impar:
    imprimir mensaje_impar, len_mensaje_impar
    jmp salir

salir:
    mov eax, 1
    int 80h