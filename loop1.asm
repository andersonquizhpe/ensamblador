;Anderson Quizhpe
;
;Ejercicio 1 con loop 
;2020-07-29

%macro imprimir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

%macro leer 1
    mov eax, 3
    mov ebx, 2
    mov ecx, %1
    mov edx, 1
    int 80h
%endmacro

section .data
    mensaje db 10,"Hola  "
    lenmensaje equ $-mensaje

section .bss
    numero resb 1;variable para mostrar valor de ecx
    
section .text
    global _start

_start:
    mov ecx, 20; deben ser numeros enteros para poder iterar

for:
    push ecx
    add ecx, '0';conversion
    mov [numero], ecx
    imprimir mensaje, lenmensaje
    imprimir numero, 1
    pop ecx
    loop for


salir:
    mov eax,1
    int 80h