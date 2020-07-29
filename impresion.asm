;Anderson Quizhpe
;
;Programa de impresion de *
;2020-07-22

;Macro para imprimir
section .data
        asterisco db '*'
    
section .text
        global _start
_start:
        mov ecx, 9


imprimir:
        dec ecx
        push ecx
        mov eax, 4
        mov ebx, 1
        mov ecx, asterisco
        mov edx, 1
        int 80h
        pop ecx
	;jmp imprimir
        cmp ecx, 0
        jnz imprimir

        mov eax, 1
        int 80h

