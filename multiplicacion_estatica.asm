;Anderson Quizhpe
;
;Multiplicacion de dos numeros estaticos

section .data
    mensaje db "El resultado es: ",10
    len_mensaje equ $-mensaje

section .bss
        result resb 1

section .text
        global _start
_start: 
    ;*******Primer caso********************
        ;siempre sera afectado al
        ;mov al, 3
        ;mov bl,3
        ;mul bl
        ;add al, '0'
        ;mov [result], ax
    ;**************************************
        mov eax, 3
        mov ebx,3
        mul ebx
        add eax,'0'
        
        mov [result], eax
        
        ;Presentacion del resultado
        mov eax, 4
        mov ebx, 1
        mov ecx, mensaje
        mov edx, len_mensaje
        int 80h

        mov eax, 4
        mov ebx, 1
        mov ecx, result
        mov edx, 1
        int 80h

        mov eax, 1
        int 80h