;Anderson Quizhpe
;
;trabajo con cadenas
;2020-08-19

section .data
    msj1 db "Ingrese 5 numeros", 10
    len1 equ $-msj1
    
    msj2 db "El numero mayor es:", 10
    len2 equ $-msj2

    arreglo db 0,0,0,0,0
    len_arreglo equ $-arreglo
section .bss
    numero resb 2
    
section .text
    global _start
_start:
    mov esi, arreglo
    mov edi, 0
    ;****************************
    ;imprimir msj1, len1
    mov eax, 4
    mov ebx, 1
    mov ecx, msj1
    mov edx, len1
    int 80h
    ;*****************************
leer:
    mov eax, 3
    mov ebx, 0
    mov ecx, numero
    mov edx, 2
    int 80h

    mov al,[numero]
    sub al, '0'
    mov [esi], al   ; indice 2 (1) es numero 0
    
    inc edi
    inc esi          ;indice del arreglo

    cmp edi, len_arreglo
    jb leer

    mov ecx, 0
    mov bl, 0
comparacion:
    mov al, [arreglo+ecx]
    cmp al, bl
    jb contador
    mov bl,al

contador:
    inc ecx
    cmp ecx, len_arreglo
    jb comparacion

imprimir:
    add bl,'0'
    mov [numero], bl

    mov eax, 4
    mov ebx, 1
    mov ecx, msj2
    mov edx, len2
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, numero
    mov edx, 1
    int 80h

    
salir:
    mov eax,1
    int 80h