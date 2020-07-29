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
        mov ecx, 9
        
inicio:
        
        cmp ebx,0
        jz vertical
        jmp imprimir


vertical:
        
        
        ;imprimir enter
        mov eax, 4
        mov ebx, 1
        mov ecx, nlinea
        mov edx, 1
        int 80h
        
        pop ebx
        jmp inicio

imprimir:
        dec ecx
        mov eax, 4
        mov ebx, 1
        mov ecx, asterisco
        mov edx, 1
        int 80h
        pop ecx
	;jmp imprimir
        cmp ecx, 0
        jnz vertical
        
salir:
        mov eax, 1
        int 80h
;revisar el funcionamiento del programa