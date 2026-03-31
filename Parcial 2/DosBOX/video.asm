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
    call LimpiarDestino
    jpm inicio_programa
end main