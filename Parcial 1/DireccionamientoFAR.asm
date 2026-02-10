.model small

.stack 100h

.data 

x db 55h
a db 11h
b db 22h

.code

main:

    mov ax, @data ;Pasa la direccion 0720
    mov ds, ax  
    
    mov es, ax
    
    ; ax = ds = es = direccion 0720 
    
    mov di, offset b ; &variable
    
    mov al, es:[di]  ; puntero = []
    
    mov bl, b
    
    mov ah, 4Ch
    int 21h

END main