;Comentar el significado de cada línea

;MACRO: para realizar procesos repetitivos
;Definicion de macro de escritura y carga de el segmento de datos
%macro imprimir 2 
	mov eax,4 ; indicamos el tipo de operacion o subrutina a realizar en este caso escritura=>salida
	mov ebx,1 ; indicamos la unidad de salida(1=>salida estandar)
	mov ecx,%1 ; registro ecx se almacena la referencia a imprimir
	mov edx,%2 ; numero maximo de caracteres a mostrar
	int 80H	; interrupcion de software en Linux 
%endmacro

;Definicion de macro de lectura
%macro leer 2 
    mov eax,3 ; tipo de operacion que se realizara ==> lectura
    mov ebx,0 ; indicamos la salida(0) en este caso indicamos que la salida no se ha producido algun error
    mov ecx,%1 ;  registro ecx se almacena la referencia a ser leida
    mov edx,%2 ; numero maximo de caracteres a leer
    int 80H  ;interupcion de software en linux
%endmacro


; ecx,modo de acceso 
; edx, permisos
section .bss ; variables del programa
	auxiliar resb 30 ; se reserva 30 bytes
	auxiliarb resb 30 ; se reserva 30 bytes
	auxiliarc resb 30 ; se reserva 30 bytes



section .data	;segmento de datos
	msg db 0x1b ,"       " ; 6 espacios para contener al dato
	lenmsg equ $-msg		; obtencion del numero de caracteres de msg

	salto db " ",10 	;Definimos un salto de linea
	lensalto equ $-salto ; longitude caracteres en el salto


section .text ;Definicion del segmento de codigo
    global _start    
_start:
	mov ecx,9 ; copiamos el valor de 9 en ecx
	
	mov al,0; copiamos el valor de 0 a al
	mov [auxiliar],al  ;copia al a auxiliarb

cicloI:
	push ecx ;guardamos el registro ecx en la pila
	mov ecx,9 ; copiamos el valor de 9 en ecx

	mov al,0; copiamos el valor de 0 a al
	mov [auxiliarb],al ;copia al a auxiliarb

	cicloJ:
		push ecx ;
		call imprimir0al9 ;Llamamos a la funcion imprimir0al9
	;	imprimir msg2,lenmsg2

	fincicloJ:
		mov al,[auxiliarb]; copia el byte que esta en auxiliarb a al
		inc al ; inccrementamos al
		mov [auxiliarb],al ;copia al a auxiliarb

		pop ecx ; obtenemos ecx
		loop cicloJ ;definimos un bucle de la funcion cicloJ
		
	;imprimir salto,lensalto

fincicloI:
	mov al,[auxiliar] ; copia el byte que esta en auxiliarb a al
	inc al ; incrementamos al
	mov [auxiliar],al ;copia al a auxiliar

	pop ecx ;obtenemos ecx
	loop cicloI ; realizamos un bucle de la funcion cicloI
	

salir:
	mov eax, 1 ; llamada a sys_exit
	int 80H ; interrupcion de software en Linux


;Declaracion de una funcion
imprimir0al9:
	
	mov ebx,"[" ;ubicamos el valor("[") en ebx
	mov [msg+1], ebx ;mover ebx hacia la posicion 1

	mov bl,[auxiliar] ;copia el byte que esta en auxiliar a bl
	add bl,'0' ;
	mov [msg+2], bl ;nos desplazamos hacia la posicion 2

	mov ebx,";" ; ;ubicamos el valor(";") en ebx
	mov [msg+3], ebx ;nos desplazamos hacia la posicion 3
	
	mov bl,[auxiliarb] ; copia el byte que esta en auxiliarb a bl
	add bl,'0' ;
	mov [msg+4],bl ;nos desplazamos hacia la posicion 4

	mov ebx,"fJ" ;ubicamos el valor de "fJ" en ebx
	mov [msg+5], ebx ;desplazamos el contenido de ebx hacia la posicion 5

	imprimir msg,lenmsg ;hacemos uso del macro imprimir

	ret; retorno 
