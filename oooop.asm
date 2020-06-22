;AUTHOR: Luis Miguel Negron Mendoza
;FECHA: 15/06/2020

section .data

   mensaje_res db 10,'Suma: ',0
   len_mensaje_res equ $ - mensaje_res
   
   mensaje_res1 db 10,'Resta: ',0
   len_mensaje_res1 equ $ - mensaje_res1
   
   mensaje_res2 db 10,'Multiplicacion: ',0
   len_mensaje_res2 equ $ - mensaje_res2
   
   mensaje_res3 db 10,'Division: ',0
   len_mensaje_res3 equ $ - mensaje_res3
   
   msg db  10,'-----operaciones-----',10,0
   lmsg equ $ - msg

section .bss
        result resb 1
        result1 resb 1
        result2 resb 1
        result3 resb 1
 
section .text
 
global _start
 
_start:

   mov eax, 4
   mov ebx, 1
   mov ecx, msg
   mov edx, lmsg
   int 80h
   
 ;sumar
   mov eax, 4
   mov ebx, 2
 
   add eax, ebx

   add eax, '0'

   mov [result], eax
 
   mov eax, 4
   mov ebx, 1
   mov ecx, mensaje_res
   mov edx, len_mensaje_res
   int 80h
 
   mov eax, 4
   mov ebx, 1
   mov ecx, result
   mov edx, 1
   int 80h

; restar
   mov eax, 4
   mov ebx, 2

   sub eax, ebx
 
   add eax, '0'
 
   mov [result1], eax
 
   mov eax, 4
   mov ebx, 1
   mov ecx, mensaje_res1
   mov edx, len_mensaje_res1
   int 80h
 
   mov eax, 4
   mov ebx, 1
   mov ecx, result
   mov edx, 1
   int 80h
 
;multiplicar
   mov ax, 4
   mov bx, 2
   
   mul bx
 
   add al, '0'

   mov [result2], al
 
   mov eax, 4
   mov ebx, 1
   mov ecx, mensaje_res2
   mov edx, len_mensaje_res2
   int 80h
 
   mov eax, 4
   mov ebx, 1
   mov ecx, result
   mov edx, 1
   int 80h
 
;dividir
   mov ax, 4
   mov bl, 2
   
   div bl
 
   add al, '0'
 
   mov [result3], al
 
   mov eax, 4
   mov ebx, 1
   mov ecx, mensaje_res3
   mov edx, len_mensaje_res3
   int 80h

   mov eax, 4
   mov ebx, 1
   mov ecx, result
   mov edx, 1
   int 80h
 
   mov eax, 1
   mov ebx, 0
   int 80h 
