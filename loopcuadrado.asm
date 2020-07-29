;Anderson Quizhpe
;
;Revision Programa de impresion de cuadrado de asteriscos
;2020-07-29

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
        mov ebx, 9;columnas
        mov ecx, 9;filas
vertical:
        push ebx
        cmp ebx, 0
        jz salir
        loop horizontal

horizontal:
        push ecx
        imprimir asterisco
        pop ecx
        loop horizontal
        imprimir nlinea
        
        pop ebx
        dec ebx
        mov ecx, 9
        jmp vertical

salir:
        mov eax,1
        int 80h