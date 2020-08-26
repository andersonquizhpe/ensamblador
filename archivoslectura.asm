;Anderson Quizhpe
;
;trabajo con archivos
;2020-08-19

%macro escribir 2
        mov eax, 4
        mov ebx, 1
        mov ecx, %1
        mov edx, %2
        int 80h
%endmacro

section .data
    msj1 db "----Lectura de archivo----", 10,10
    len1 equ $-msj1
    
    archivo db "/home/jhander/sexto/ensamblador/archivo.txt"

section .bss
    texto resb 30
    idarchivo resd 1
    
section .text
    global _start


_start:
    ;****************************************************************************
    mov eax, 5 		;servicio para crear archivos, trabajar con archivos
                    ;operacion apertura
	mov ebx, archivo	; dirección del archivo
	mov ecx, 0		
	mov edx, 777h
	int 80h
	
	test eax, eax		; instrucción de comparación realiza la operación lógica “Y” de dos operandos
    
	jz salir		; se ejecuta cuando existen errores en el archivo
	
	mov dword [idarchivo], eax
	escribir msj1, len1
    ;*******************************************************************************
    mov eax, 3 		;servicio lectura
	mov ebx, [idarchivo]	; dirección del archivo
	mov ecx, texto	
	mov edx, 20
	int 80h

    escribir texto, 20
	
    ;******************************************************************************
    mov eax, 6 		;servicio para cerrar archivos, trabajar con archivos
                    ;operacion close
	mov ebx, [idarchivo]	; dirección del archivo
	mov ecx, 0	
	mov edx, 0
	int 80h

salir:
	mov eax, 1
	int 80h