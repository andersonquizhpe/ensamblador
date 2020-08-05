;Anderson Quizhpe
;
;tablas de Multiplicacion
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
    a resb 2
    b resb 2
    c resb 2
    aux resb 2
section .text
    global _start
_start:
    mov al, 1
    mov [aux], al
    mov ecx,0
ciclo:
    cmp cx,9
    jz bucle
    inc cx
    push cx
    mov [a], cx
    mov ax, [a]
	mov [b], ax
	mov cx, [aux]
	mul cx;ax=ax*cx
	mov [a], ax
	mov ax, [b]
	add ax, '00'
	add cx, '00'
	mov [b], ax
	mov [c], cx  
    imprimir c,1
    imprimir msj1, lenmsj1
    imprimir b,1
    imprimir msj2, lenmsj2
    mov ax,'0'
    add [a], ax
    imprimir a,1
    imprimir nlinea,1
    pop cx
    jmp ciclo
bucle:
    imprimir nlinea,1
    mov bx,[aux]
    inc bx
    mov [aux], bx
    mov cx,0
    cmp bx,10
    jnz ciclo

salir:
    mov eax,1
    int 80h