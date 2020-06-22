;Anderson Quizhpe
;
;Operaciones aritmeticas

%macro imprimir 2
        mov eax, 4
        mov ebx, 1
        mov ecx, %1
        mov edx, %2
        int 80h
%endmacro

section .data
    mensaje db 10,"El resultado de la suma : "
    len_mensaje equ $-mensaje
    
    mensaje_resta db 10,"El resultado de la resta : "
    len_mensaje_resta equ $-mensaje_resta
    
    mensaje_mult db 10,"El resultado de la multiplicacion : "
    len_mensaje_multiplicacion equ $-mensaje_mult
    
    mensaje_division db 10,"El resultado de la division : "
    len_mensaje_division equ $-mensaje_division

    mensaje_residuo db 10,"El residuo es igual : "
    len_mensaje_residuo equ $-mensaje_residuo

section .bss
        suma resb 1
        resta resb 1
        multiplicacion resb 1
        cociente resb 1
        residuo resb 2

section .text
        global _start
_start: 
;************Suma*****************************************
        imprimir mensaje, len_mensaje
        
        mov al, 4
        mov bl, 2
        add al, bl
        add al,'0'
        mov [suma], al
        
        imprimir suma,1
;***********Resta*********************************************
        imprimir mensaje_resta, len_mensaje_resta
        
        mov al, 4
        mov bl, 2
        sub al, bl
        add al,'0'
        mov [resta], al
        
        imprimir resta,1
;************Multiplicacion****************************************
        imprimir mensaje_mult, len_mensaje_multiplicacion

        mov al, 4
        mov bl, 2
        mul bl
        add al,'0'
        mov [multiplicacion], al

        imprimir multiplicacion, 1
;************Division****************************************
        imprimir mensaje_division, len_mensaje_division

        mov al, 5
        mov bl, 2
        div bl
        add al,'0'
        add ah, '0'
        mov [cociente], al
        mov [residuo], ah

        imprimir cociente, 1
        imprimir mensaje_residuo, len_mensaje_residuo
        imprimir residuo,1
      
        
;************Fin de programa******************************
        mov eax, 1
        int 80h