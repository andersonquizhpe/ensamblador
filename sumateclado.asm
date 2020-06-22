;Anderson Quizhpe
;Suma de dos numeros estaticos

section .data
    ;Definicion de mensajes
    numero1 db 'Ingrese un numero', 10
    len_numero equ $-numero1

    numero2 db 'Ingrese el segundo numero', 10
    len_sumando equ $-numero2
    
    mensaje_res db "El resultado fue: ",10
    len_mensaje_res equ $-mensaje_res

section .bss
        ;Definicion de variables a utilizar
        a resb 1
        b resb 1
        suma resb 1

section .text
        global _start
_start: 
        mov eax, 4
        mov ebx, 1
        mov ecx, numero1
        mov edx, len_numero
        int 80h
        ;***************capturar numero1*******************
        mov eax, 3
        mov ebx, 2
        mov ecx, a
        mov edx, 2
        int 80h

        
        ;**************ingresar numero 2********************
        mov eax, 4
        mov ebx, 1
        mov ecx, numero1
        mov edx, len_numero
        int 80h


        ;***************capturar numero2*******************
        mov eax, 3
        mov ebx, 2
        mov ecx, b
        mov edx, 2
        int 80h

        ;Transformacion para realizar la presentacion
        mov ax, [a]
        mov bx, [b]
        ;---------conversion a dig ----------------------------
        sub ax,'0'
        sub bx,'0'
        
        ;****************Suma****************************
        add ax,bx
        add ax,'0'

        mov [suma], eax

        ;***************Muestra Resultado***************************
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