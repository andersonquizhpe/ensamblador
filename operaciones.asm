;Anderson Quizhpe
;
;Division de dos numeros estaticos

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

        mov eax, 4
        mov ebx, 2

        ;************Suma*****************************************
        add eax, ebx

        add eax,'0'
        mov [suma], eax

        ;********************************************************
        ;Presentacion del resultado
        mov eax, 4
        mov ebx, 1
        mov ecx, mensaje
        mov edx, len_mensaje
        int 80h

        mov eax, 4
        mov ebx, 1
        mov ecx, suma
        mov edx, 1
        int 80h
        ;************Resta****************************************
        mov eax, 4
        mov ebx, 2
        sub eax, ebx

        add eax,'0'
        mov [resta], eax

        mov eax, 4
        mov ebx, 1
        mov ecx, mensaje_resta
        mov edx, len_mensaje_resta
        int 80h

        mov eax, 4
        mov ebx, 1
        mov ecx, resta
        mov edx, 1
        int 80h
        ;************Multiplicacion****************************************
        mov eax, 4
        mov ebx, 2
        mul ebx

        add eax,'0'
        mov [multiplicacion], eax

        mov eax, 4
        mov ebx, 1
        mov ecx, mensaje_mult
        mov edx, len_mensaje_multiplicacion
        int 80h

        mov eax, 4
        mov ebx, 1
        mov ecx, multiplicacion
        mov edx, 1
        int 80h
        ;************Division****************************************

        mov eax, 4
        mov ebx, 1
        mov ecx, mensaje_division
        mov edx, len_mensaje_division
        int 80h

        mov al, 5
        mov bl, 2
        div bl
        add al,'0'
        add ah, '0'
        mov [cociente], al
        mov [residuo], ah

        mov eax, 4
        mov ebx, 1
        mov ecx, cociente
        mov edx, 1
        int 80h

        mov eax, 4
        mov ebx, 1
        mov ecx, mensaje_residuo
        mov edx, len_mensaje_residuo
        int 80h

        mov eax, 4
        mov ebx, 1
        mov ecx, residuo
        mov edx, 1
        int 80h
        
        ;************Fin de programa******************************
        mov eax, 1
        int 80h