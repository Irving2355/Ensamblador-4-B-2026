;detectar palindromos
.model small
.stack 100h
.data
msg1 db 13,10,'Escriba una palabra: $'
msgPal db 13,10,'Es palindromo$',13,10,'$'
msg2 db 13,10,'No es un palindromo$',13,10,'$'
msgRep db 13,10,'Repetir (S/N): $'

buffer  db 20
        db 0
        db 20 dup('$')
.code
main:
    mov ax, @data
    mov ds, ax

    inicio:

    ;pedir palabra
    mov ah, 09h
    lea dx, msg1
    int 21h

    mov ah, 0Ah
    lea dx, buffer 
    int 21h

    ;obtener longitud
    ;anita lava la tina
    mov si, offset buffer 
    mov cl, [si+1]
    xor ch, ch 

    mov di, si 
    add si, 2
    add di, 2
    ;buffer+2 
    add di, cx 
    dec di 
    ;si al inicio de la cadena di al final de la cadena 

    comparar: 
    cmp si, di 
    jge esPal
    
    mov al, [si] 
    mov bl, [di] 
    cmp al, bl
    jne noPal 

    inc si 
    dec di 
    jmp comparar

    esPal:
    mov ah, 09h
    lea dx, msgPal
    int 21h
    jmp preguntar

    noPal:
    mov ah, 09h
    lea dx, msg2
    int 21h

    preguntar:

    mov ah, 09h
    lea dx, msgRep
    int 21h

    mov ah, 01h
    int 21h

    cmp al, 'S'
    je inicio

    cmp al, 's'
    je inicio

    mov ah, 4Ch ;mov ax, 4C00h
    int 21h
end main