;Anderson Quizhpe
;
;Resta de dos numeros estaticos

section .data
    mensaje db "El resultado es: ",10
    len_mensaje equ $-mensaje

section .bss
        result resb 1

section .text
        global _start
_start: 
        mov eax, 3
        mov ebx, 2
        
        ;Operacion
        sub eax, ebx
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