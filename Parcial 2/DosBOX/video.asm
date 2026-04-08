;programa final 8086
;buffer y servicio de video
.model small
.stack 100h
.data 

; buffer db 30
;         db 0
;         db 30 dup(0)
; buffer db 30,0,30 dup(0)

bufferNombre db 30
contNombre db 0
cadNombre db 30 dup(0)

nombreLimpio db 31 dup('$') 

titulo db '**** Practica Final video y buffer **** $'
msgPedir db 'Escribe tu nombre: $'
msgMostrar db 'Tu nombre fue: $'
msgLimpio db 'El buffer se limpio$'
msgRepetir db 'Otra vez (s/n): $'  
.code 

LimpiarPantalla proc
    ;ah = 06h y al = 00h
    mov ah, 06h
    mov al, 00h
    mov bh, 07h
    mov ch, 00h
    mov cl, 00h
    mov dh, 24h
    mov dl, 79h
    int 10h

    mov dh, 0
    mov dl, 0
    call PosicionarCursor
    ret 
LimpiarPantalla endp

PosicionarCursor proc
    ;dh filas y dl las columnas
    mov ah, 02h
    mov bh, 00h
    int 10h
    ret
PosicionarCursor endp

ImprimirColor proc
    siguiente_caracter:
    ;al = [si++]
    lodsb ;al = [si] automaticamente aumenta si
    cmp al, '$'
    je fin_imprimir_color

    ;ah=09h caracter atributo
    mov ah, 09h
    mov bh, 00h
    mov cx, 1
    int 10h

    ;movimiento del cursor hacia la derecha
    mov ah, 0Eh
    mov bh, 00h
    int 10h

    jmp siguiente_caracter 
    fin_imprimir_color:
    ret
ImprimirColor endp

CopiarCadena proc 
    lea si, cadNombre
    lea di, nombreLimpio

    xor cx, cx
    mov cl, contNombre
    jcxz fin_copiado
    copiar_loop:
    mov al, [si]
    mov [di], al 
    inc si 
    inc di 
    loop copiar_loop
    fin_copiado:
    mov byte ptr [di], '$'
    ret
CopiarCadena endp 

LimpiarBuffer proc 
    mov contNombre, 0
    lea di, cadNombre
    mov cx, 30
    mov al, 0

    limpiar_loop:
    mov [di], al 
    inc di 
    loop limpiar_loop
    ret
LimpiarBuffer endp

main:
    ;iniciar el ds
    mov ax,@data 
    mov ds, ax 
    inicio_programa:
    ;limpiar la pantalla
    call LimpiarPantalla

    ;mostrar titulo en una posicion con color
    mov dh, 1
    mov dl, 15
    call PosicionarCursor 

    lea si, titulo
    mov bl, 1Eh  ;atributo de color
    call ImprimirColor 

    ;pedir la cadena mostrar mensaje pedir

    mov dh, 5
    mov dl, 15
    call PosicionarCursor

    mov ah, 09h
    lea dx, msgPedir
    int 21h

    ;leer la cadena

    mov ah, 0Ah
    lea dx, bufferNombre
    int 21h

    ;copiar la cadena a una variable
    call CopiarCadena

    ;limpiar el buffer 
    call LimpiarBuffer 

    ;mostrar el resultado
    mov dh, 8
    mov dl, 10
    call PosicionarCursor

    mov ah, 09h
    lea dx, msgMostrar
    int 21h

    mov ah, 09h
    lea dx, nombreLimpio
    int 21h

    ;mostral al usuario que se limpio el buffer
    mov dh, 10
    mov dl, 10
    call PosicionarCursor

    mov ah, 09h
    lea dx, msgLimpio
    int 21h

    ;preguntar si otra vez

    mov ah, 09h
    lea dx, msgRepetir
    int 21h

    mov ah, 01h
    int 21h

    cmp al, 's'
    je repetir
    cmp al, 'S'
    je repetir

    ;fin del programa

    mov ah, 4Ch
    int 21h

    repetir:
    ;call LimpiarDestino
    jmp inicio_programa
end main