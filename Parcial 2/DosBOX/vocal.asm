;contador de vocales
.model small
.stack 100h
.data
msg1 db 13,10,'Escribe una palabra: $'
msg2 db 13,10,'Numero de vocales: $'
buffer db 20 
        db 0
        db 20 dup('$')
contador db 0
.code
main:
    mov ax, @data 
    mov ds, ax 

    mov ah, 09h
    lea dx, msg1
    int 21h

    mov ah, 0Ah
    lea dx, buffer
    int 21h

    mov si, offset buffer
    mov cl, [si+1]
    xor ch, ch 
    add si, 2

    ciclo:

    cmp cl, 0
    je fin 

    mov al, [si]
    cmp al, 'a'
    je sumar
    cmp al, 'e'
    je sumar
    cmp al, 'i'
    je sumar
    cmp al, 'o'
    je sumar
    cmp al, 'u'
    je sumar

    jmp continuar

    sumar:
    inc contador

    continuar:
    inc si 
    dec cl 
    jmp ciclo

    fin:
    mov ah, 09h
    lea dx, msg2
    int 21h
    
    mov dl, contador
    add dl, '0'

    mov ah, 02h
    int 21h

    mov ah, 4Ch
    int 21h
end main