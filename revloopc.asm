;Anderson Quizhpe
;
;Revision Programa de impresion de cuadrado de asteriscos
;2020-08-03

%macro imprimir 1
        mov eax, 4
        mov ebx, 1
        mov ecx, %1
        mov edx, 1
        int 80h
%endmacro

section .data
    asterisco db '*'
    nlinea db 10,10,0
	lnlinea equ $-nlinea
    
section .text
    global _start
_start:
    mov ecx, 20;filas
    mov ebx, 1
l1:
    push ecx
    push ebx
    
    ;pop ecx
    mov ecx, ebx
    ;o solo comentar 
    ;mov ebx, ecx; triangulo invertido
    ;push ecx
l2:
    push ecx
    imprimir asterisco
    
    pop ecx
    loop l2
    imprimir nlinea
    pop ebx
    pop ecx
    inc ebx
    loop l1

    mov eax,1
    int 80h