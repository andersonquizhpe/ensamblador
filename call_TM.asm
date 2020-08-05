;Anderson Quizhpe
;
;Muktiplicacion
;2020-08-03

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
section .text
    global _start
_start:
    mov al, 3
    add al, '0'
    mov [a], al
    ;inicio de tabla
    mov cx, 1

ciclo:
    push cx

    mov ax, [a]
    sub ax, '0'
    mul cx
    add ax, '0'
    mov [c], ax

    add cx, '0'
    mov [b], cx
    ;imprimir a,1; imprime numero
    call imprimir_numero
    imprimir msj1, lenmsj1; imprime *
    ;imprimir b,1;imprime el numero a incrementar
    call imprimir_mult
    imprimir msj2, lenmsj2
    ;imprimir c, 1
    call imprimir_result

    ;imprimir nlinea,1
    call imprimir_linea
    pop cx
    inc cx
    cmp cx, 10
    jnz ciclo

imprimir_numero:
    mov eax, 4
    mov ebx, 1
    mov ecx, a
    mov edx, 1
    int 80h
    ret
imprimir_mult:
    mov eax, 4
    mov ebx, 1
    mov ecx, b
    mov edx, 1
    int 80h
    ret
imprimir_result:
    mov eax, 4
    mov ebx, 1
    mov ecx, c
    mov edx, 1
    int 80h
    ret
imprimir_linea:
    mov eax, 4
    mov ebx, 1
    mov ecx, nlinea
    mov edx, 1
    int 80h
    ret

salir:
    mov eax,1
    int 80h