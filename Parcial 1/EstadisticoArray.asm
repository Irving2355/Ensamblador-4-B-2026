.model small

.stack 100h

.data 

N       db 10
datos   db 90,75,100,64,88,92,71,85,79,95

outSum dw 0
outAvg db 0
outMax db 0

.code
main:

    mov ax, @data
    mov ds, ax
    
    xor ax, ax
    mov outSum, ax
    
    mov al, datos[0]
    mov outMax, al
    
    ;inicializamos variables ciclo
    xor si, si
    mov cl, N
    xor ch, ch ;cx H:00 L:0A  
    
L1:
    mov al, datos[si] 
    mov ah, 0 ;ax H:00 L:90dec
    
    add outSum, ax ;outSum += ax
    
    mov bl, outMax
    cmp al, bl
    jbe NoMax
    mov outMax, al
    
NoMax:

    inc si
    loop L1 ;do while(cx>0) 
    
    mov ax, outSum 
    mov bl, N
    div bl ;ax/bl ah=residuo al=cociente  
    
    mov outAvg, al  
    
    mov dx, 0
    mov dx, offset outMax
    

end main