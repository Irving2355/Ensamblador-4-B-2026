.model small

.stack 100h

.data 

celsius db 25 ;8 bits

outFahr dw 0 ;16 bits

.code
main: 

    ;mov ax, SEG celsius  
    mov ax, @data
    mov ds, ax
    
    ; F = (c*9)/5 + 32
    mov al, celsius
    mov bl, 9
    mul bl  ;ax = al*bl 
    ;mul cl  ;ax = al*cl 
    
    mov bl, 5
    div bl  ;al = al/5, ah=residuo  
    
    ;ax H:02 L:FF  H:00 L:FF
    mov ah, 0
    add ax, 32
    
    mov outFahr, ax 
    
    int 3  ;system(pause)
    
    mov ax, 0

end main