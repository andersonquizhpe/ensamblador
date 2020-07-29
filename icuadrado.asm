;Anderson Quizhpe
;
;Programa de impresion de cuadrado de asteriscos
;2020-07-22


section .data
        asterisco db '*'
        nlinea	db  10,10,0
	    lnlinea	equ $-nlinea
    
section .text
        global _start
_start:
        mov ebx, 9

salto:
        mov ecx, 9

        dec ebx
        push ebx
        jmp impresion
impresion:
        dec ecx
        push ecx
        mov eax, 4
        mov ebx, 1
        mov ecx, asterisco
        mov edx, 1
        int 80h
        pop ecx
        cmp ecx, 0
        jnz impresion

        mov eax, 4
        mov ebx, 1
        mov ecx, nlinea
        mov edx, 1
        int 80h

        pop ebx
        cmp ebx,0
        jnz salto
salir:
    mov eax,1
    int 80h