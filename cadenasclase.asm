;Anderson Quizhpe
;
;trabajo con cadenas
;2020-08-12
%macro imprimir 2
        mov eax, 4
        mov ebx, 1
        mov ecx, %1
        mov edx, %2
        int 80h
%endmacro

section .data
    arreglo db 3,2,0,7,5
    lenarreglo equ $-arreglo
    
    nlinea db 10,10,0
	lnlinea equ $-nlinea
section .bss
    numero resb 1
section .text
    global _start
_start:
    mov esi, arreglo;esi = fijar el tamaño del arreglo, posiciona el arreglo en memoria
    mov edi, 0      ;edi= contener el indice del arreglo
imprimir:
    mov al, [esi]
    add al, '0'
    mov [numero], al
    add esi, 1
    add edi, 1          ;[edi],

    imprimir numero,1
    imprimir nlinea,1

    cmp edi, lenarreglo ; cmp 3,4 ----> el primer operndo es menor se activa carry
                        ; cmp 4,3----->deactiva carry y zero
                        ; cmp 0,0----->desactiva carry y se activa zero 
    jb imprimir        ; se ejecuta cuando la bandera xde carry esta activada
salir:
    mov eax,1
    int 80h