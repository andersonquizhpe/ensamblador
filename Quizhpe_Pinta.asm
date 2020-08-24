;Examen Tema 2
;
;Anderson Quizhpe
;
;Division de dos numeros del 1 al 9
;2020-08-24

%macro imprimir 2
        mov eax, 4
        mov ebx, 1
        mov ecx, %1
        mov edx, %2
        int 80h
%endmacro

%macro leer 2
        mov eax, 3
        mov ebx, 2
        mov ecx, %1
        mov edx, %2
        int 80h
%endmacro

section .data
    msg1 db 10,'Examen Tema 2: Division de dos numeros del 1 al 9', 10
    len equ $-msg1
    nlinea db 10,10,0
	lnlinea equ $-nlinea

    msg2 db 'Ingrese un numero dividendo: '
    len2 equ $-msg2
    msg3 db 'Ingrese numero divisor: '
    len3 equ $-msg3
    msc db 'Cociente igual: '
    lenc equ $-msc
    msr db 10,'Residuo igual:'
    lenr equ $-msr
section .bss
    numero resb 2
    numero2 resb 2
    cociente resb 1
    residuo resb 1
section .text
    global _start
_start:
    imprimir msg1, len
    imprimir nlinea, 1
;**********Ingreso de numeros*************
    imprimir msg2, len2
    leer numero, 2
    imprimir msg3, len3
    leer numero2,2

    mov cx, 0
    mov al, [numero]
    mov bl, [numero2]
    sub al, '0'
    sub bl, '0'
    
;***************Restas suscesivas********************
restar:
    sub al, bl
    inc cx
    cmp al, bl
    jae restar
    jmp resultado

resultado:
    add al, '0'
    add cx, '0'
    mov [cociente], cx
    mov [residuo], al
;***********Impresion de resultados******************
    imprimir msc, lenc
    imprimir cociente,1
    imprimir msr, lenr
    imprimir residuo, 2
    jmp salir
    
salir:
    mov eax, 1
    int 80h
