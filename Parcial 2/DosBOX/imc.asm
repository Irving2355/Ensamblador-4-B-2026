;calculo de imc
.model small
.stack 100h
.data
msgPeso db 13,10,'Ingresa tu peso (78.4 o 65): $'
msgAlt db 13,10,'Ingresa tu altura (1.65 o 1.70): $'
msgRes db 13,10,'IMC = $'
msgFin db 13,10,'$'

bufferPeso db 20
            db 0
            db 20 dup(0)
bufferAlt db 20
            db 0
            db 20 dup(0)

intPart dw 0
fracPart dw 0
fracDiv dw 1  ;2345/10000 =0.2345
digit dw 0
seenDot db 0 

numParsed dd 0.0
peso dd 0.0
altura dd 0.0
altura2 dd 0.0
imc dd 0.0 

cien dw 100
imc100 dw 0
.code

ParseBufferToReal proc
    ;reiniciar variables
    mov word ptr intPart, 0
    mov word ptr fracPart, 0
    mov word ptr fracDiv, 0
    mov byte ptr seenDot, 0 

    mov cl, [si+1]
    xor ch, ch 
    add si, 2

    ParseLoop:
    cmp cx, 0
    je ConvertToReal

    mov al, [si]

    cmp al, '.'
    je SetDot
    cmp al, '0'
    jb IgnoreChar 
    cmp al, '9'
    ja IgnoreChar

    sub al, '0' ;ascii a numero
    xor ah, ah  ;00 : digito
    mov digit, ax 

    cmp seenDot, 0
    jne FracDigit

    mov ax, intPart
    mov bx, 10
    mul bx
    add ax, digit
    mov intPart, ax
    jmp NextChar

    FracDigit:
    mov ax, fracPart
    mov bx, 10
    mul bx
    add ax, digit
    mov fracPart, ax

    mov ax, fracDiv
    mov bx, 10
    mul bx
    mov fracDiv, ax
    jmp NextChar

    SetDot:
    mov seenDot, 1
    jmp NextChar

    IgnoreChar:
    ;ignorar espacios, letras o otros simbolos
    nop 

    NextChar:
    inc si 
    dec cx 
    jmp ParseLoop

    ConvertToReal:
    fild intPart

    cmp fracDiv, 1
    je SaveNumber

    fild fracPart
    fidiv fracDiv
    fadd

    SaveNumber:
    fstp numParsed
    ret
ParseBufferToReal endp

main:
    mov ax, @data 
    mov ds, ax

    ;pedir peso
    mov ah, 09h
    lea dx, msgPeso
    int 21h

    mov ah, 0Ah
    lea dx, bufferPeso
    int 21h

    lea si, bufferPeso
    call ParseBufferToReal 

    fld numParsed
    fstp peso 

    ;pedir altura
    mov ah, 09h
    lea dx, msgAlt
    int 21h

    mov ah, 0Ah
    lea dx, bufferAlt
    int 21h

    lea si, bufferAlt
    call ParseBufferToReal

    fld numParsed
    fstp altura
end main
