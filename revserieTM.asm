;Anderson Quizhpe
;
;tablas de Multiplicacion correc
;2020-08-05

%macro imprimir 2
        mov eax, 4
        mov ebx, 1
        mov ecx, %1
        mov edx, %2
        int 80h
%endmacro
section .data
    msj1 db " * "
    lenmsj1 equ $-msj1
    msj2 db " = "
    lenmsj2 equ $-msj2
    nlinea db 10,10,0
	lnlinea equ $-nlinea
section .bss
    numero rest 2
    presentarN1 rest 2
    presentarN2 rest 2
    respuesta rest 2
    aux rest 2
    x rest 2
section .text
    global _start
_start:
    mov al, 1
    mov [aux], al
    mov ecx,0
principal: 
    cmp ecx,9
    jz bucle
    inc ecx
    push ecx
    mov [numero], ecx
    jmp imp
imp:
    mov al,[numero]
    mov [presentarN1], al
    mov cl,[aux]
    mul cl
    mov [numero], al
    mov ah, [presentarN1]
    add ax,'00'
    add cx,'0'
    mov [presentarN1], ah
    mov [presentarN2], cl
    
    imprimir presentarN1, 1
    imprimir msj1, lenmsj1
    imprimir presentarN2,1
    imprimir msj2, lenmsj2
    mov eax,48
    add [numero], eax
    imprimir numero,1
    imprimir nlinea,1
    pop ecx
    jmp principal

bucle: ;1---9
    imprimir nlinea,1
    mov ebx, [aux]
    inc ebx
    mov [aux],ebx
    mov ecx,0
    cmp ebx,10
    jb principal;jnAE


salir:
    mov eax,1
    int 80h