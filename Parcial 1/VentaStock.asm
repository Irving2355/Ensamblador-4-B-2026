.model small

.stack 100h

.data 

stock db 10
venta db 12
ok    db 0

.code

main:

    mov ax, @data
    mov ds, ax
    
    mov al, stock
    
    sub al, venta ;al=-2 sf=1 cf=1
    
    jc sin_stock

    mov stock, al
    mov ok, 1
    jmp fin
    
    sin_stock:
    mov ok, 0
    
    fin:
    mov ah, 4Ch
    int 21h

end main