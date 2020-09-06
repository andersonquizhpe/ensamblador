;Anderson Quizhpe
;
;Examen de archivos

%macro escribir 2
        mov eax, 4
        mov ebx, 1
        mov ecx, %1
        mov edx, %2
        int 80h
%endmacro

section .data
    msj1 db "Leyendo archivo....", 10,10
    len1 equ $-msj1
    archivo db "/home/jhander/sexto/ensamblador/datos.txt"
    
    arreglo db 0,0,0,0,0,0,0,0,0
	la equ $-arreglo
    msj2 db "Guardando datos...", 10,10
    len2 equ $-msj2
    archivor db "/home/jhander/sexto/ensamblador/resultados.txt"

section .bss
    texto resb 30
    idarchivo resd 1
    idarchivo2 resd 1
    resultado resb 2

    
section .text
    global _start

_start:
    ;****************************************************************************
    mov eax, 5 		;servicio para crear archivos, trabajar con archivos operacion apertura
	mov ebx, archivo	
	mov ecx, 0		
	mov edx, 0
	int 80h
	
	test eax, eax
	jz salir
	
	mov dword [idarchivo], eax
	escribir msj1, len1
    ;*******************************************************************************
    mov eax, 3 		;servicio lectura
	mov ebx, [idarchivo]
	mov ecx, texto	
	mov edx, 20
	int 80h

    escribir texto, 20
	
    ;******************************************************************************
    mov eax, 6 		;close
	mov ebx, [idarchivo]
	mov ecx, 0	
	mov edx, 0
	int 80h
;****************************************
    mov esi, arreglo	;esi-> posc 1er elemento array
	mov edi, 0

leer:
    

	mov [esi], al
	
	dec edi
	dec esi

	cmp edi,la
	jb leer		
	mov ecx, 0
	mov bl, 0
	
imprimir:
    add bl, '0'
    mov [resultado], bl

	escribir resultado,1
	;*****************Guardar ARCHIVO**************
	mov eax, 8
	mov ebx, archivor
	mov ecx, 1
	mov edx, 777h
	int 80h

	test eax, eax
	jz salir
	
	mov dword [idarchivo2], eax

	escribir msj2, len2
	
	;**********se envia al archivo el texto*********
	mov eax, 4
	mov ebx, [idarchivo2]
	mov ecx, resultado
	mov edx, 1
	int 80h

salir:
	mov eax, 1
	int 80h