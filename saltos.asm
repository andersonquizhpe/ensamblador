;Anderson Quizhpe
;2020-06-22

;Operaciones dinamicas con macros

;Macro para imprimir
%macro imprimir 2
        mov eax, 4
        mov ebx, 1
        mov ecx, %1
        mov edx, %2
        int 80h
%endmacro
;Macro para leer
%macro leer 2
        mov eax, 3
        mov ebx, 2
        mov ecx, %1
        mov edx, %2
        int 80h
%endmacro

section .data
    ;Mensaje para ingreso de numeros
    mensaje db 10,"Ingrese primer numero : "
    len_mensaje equ $-mensaje

    mensaje1 db 10,"Ingrese segundo numero : "
    len_mensaje1 equ $-mensaje1

    ;Mensajes para ver resultados
    mensaje_suma db 10,"El resultado de la suma  "
    len_mensaje_suma equ $-mensaje_suma
    
    mensaje_resta db 10,"El resultado de la resta  "
    len_mensaje_resta equ $-mensaje_resta
    
    mensaje_mult db 10,"El resultado de la multiplicacion  "
    len_mensaje_multiplicacion equ $-mensaje_mult
    
    mensaje_division db 10,"El resultado de la division  "
    len_mensaje_division equ $-mensaje_division

    mensaje_residuo db 10,"Con residuo de "
    len_mensaje_residuo equ $-mensaje_residuo

section .bss
        a resb 1
        b resb 1
        suma resb 1
        resta resb 1
        multiplicacion resb 1
        cociente resb 1
        residuo resb 2

section .text
        global _start
_start: 
;*********Ingreso de numeros por teclado********************
        imprimir mensaje, len_mensaje
        leer a, 2
        imprimir mensaje1, len_mensaje1
        leer b, 2
        jmp dividir
sumar:
        imprimir mensaje_suma, len_mensaje_suma
        mov al, [a]
        mov bl, [b]
        sub al, '0' ;coversion cadena --> entero
        sub bl, '0'
        add al, bl
        add al,'0'
        mov [suma], al        
        imprimir suma,2
        jmp restar
restar:
        imprimir mensaje_resta, len_mensaje_resta
        mov al, [a]
        mov bl, [b]
        sub al, '0'
        sub bl, '0'
        sub al, bl
        add al,'0'
        mov [resta], al
        imprimir resta,1
        jmp multiplicar
multiplicar:
        imprimir mensaje_mult, len_mensaje_multiplicacion
        mov al, [a]
        mov bl, [b]
        sub al, '0'
        sub bl, '0'
        mul bl
        add al,'0'
        mov [multiplicacion], al
        imprimir multiplicacion, 1
        jmp salir
dividir:
        imprimir mensaje_division, len_mensaje_division
        mov al, [a]
        mov bl, [b]
        sub al, '0'
        sub bl, '0'
        div bl
        add al,'0'
        add ah, '0'
        mov [cociente], al
        mov [residuo], ah
        imprimir cociente, 1
        imprimir mensaje_residuo, len_mensaje_residuo
        imprimir residuo,1
        jmp sumar
        
salir:
        mov eax, 1
        int 80h