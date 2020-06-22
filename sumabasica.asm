;Anderson Quizhpe
;
;Suma de dos numeros estaticos

section .data
    

    mensaje_res db "El resultado fue: ",10
    len_mensaje_res equ $-mensaje_res

section .bss
        suma resb 1

section .text
        global _start
_start: 
        mov eax, 6
        mov ebx, 2
        ;suma
        add eax, ebx
        add eax,'0'
        
        mov [suma], eax

        mov eax, 4
        mov ebx, 1
        mov ecx, mensaje_res
        mov edx, len_mensaje_res
        int 80h

        mov eax, 4
        mov ebx, 1
        mov ecx, suma
        mov edx, 1
        int 80h

        mov eax, 1
        int 80h
