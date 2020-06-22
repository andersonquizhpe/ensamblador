section .data
	mensaje DB "Mi primer trabajo con NASM"	; constantes
	longitud EQU $-mensaje			; calcula longitud de caracteres
;section .bss   ---> definicion de entradas 
;EJEMPLO:-->     nombre resb 1;1 define numero de caracteres que se debe reservar
;
section .text

	global _start

_start:
	
	mov eax, 4		;tipo de operacion subrutina=> escritura, salida
	mov ebx, 1		;tipo de estandar, teclado
	mov ecx, mensaje	;registro ecx se almacena la referencia a imprimir
	mov edx, longitud ;registro ecx se almacena la referencia a imprimir por numero de caracteres
	int 80H			;interrupcion de software para SO linux
	
	mov eax, 1		;salida del progrma operacion=>system_exit, sys_exit
	mov ebx, 0		;si el retorno =0 estado ok
	int 80H
