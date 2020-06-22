%macro show_message 2 
      mov   eax, 4
      mov   ebx, 1
      mov   ecx, %1
      mov   edx, %2
      int   80h
%endmacro

%macro reading 2 
      mov   eax, 3
      mov   ebx, 2
      mov   ecx, %1
      mov   edx, %2
      int   80h
%endmacro

section .data
    msj db 'Operaciones básicas', 10
    len equ $ - msj
    msj1 db 'Ingrese el primer número:'
    len1 equ $ - msj1
    msj2 db 'Ingrese el segundo número:'
    len2 equ $ - msj2
    mSuma db 10, 'La suma es: '
    lSuma equ $ - mSuma
    mResta db 10,'La resta es: '
    lResta equ $ - mResta
    mProducto db 10,'El producto es: '
    lProducto equ $ - mProducto
    mDivision db 10, 'El cociente de la división es: '
    lDivision equ $ - mDivision
    mResiduo db 10,'El residuo de la división es: '
    lResiduo equ $ - mResiduo
    final db 10,'Saliendo del programa     '
    lfinal equ $ - final
section .bss
    n1 resb 1
    n2 resb 1
    cociente resb 1
    residuo resb 1
    suma resb 1
    resta resb 1
    producto resb 1

section .text
    global _start
    _start:
        show_message msj, len
        show_message msj1, len1
        reading n1, 2

        show_message msj2, len2
        reading n2, 2
        jmp division
        
sumar:  
        ;SUMA      
        mov al, [n1]
        mov bl, [n2]
        sub ax, '0'
        sub bl, '0'
        add al, bl
        add al, '0'
        mov [suma], al
        show_message mSuma, lSuma
        show_message suma, 1
        jmp salir
        

restar:
        ;RESTA
        mov al, [n1]
        mov bl, [n2]
        sub ax, '0'
        sub bl, '0'
        sub al, bl
        add al, '0'
        mov [resta], al
        show_message mResta, lResta
        show_message resta , 1
        jmp multiplicacion

multiplicacion:
        ;MULTIPLICACIÓN
        mov al, [n1]
        mov bl, [n2]
        sub ax, '0'
        sub bl, '0'
        mul bl
        add al, '0'
        mov [producto], al
        show_message mProducto, lProducto
        show_message producto, 1
        jmp sumar

division:
        ; Division
        mov al, [n1]
        mov bl, [n2]
        sub ax, '0'
        sub bl, '0'
        div bl
        add al, '0'
        add ah, '0'  
        mov [cociente], al
        mov [residuo], ah
        show_message mDivision, lDivision
        show_message cociente, 1
        show_message mResiduo, lResiduo
        show_message residuo, 1
        jmp restar
        
salir:
        show_message final, lfinal
        mov eax, 1
        int 80h 