.model small

.stack 100h

.data 

M    dw 65521
A    dw 75
seed dw 1234 ;semilla menor que M mayor que A

rand1 db 0
rand2 db 0

MINVAL db 10 
MAXVAL db 20

.code 

NextLehmer16:
    ;ale = A*seed%M
    mov ax, seed
    mul A 
    div M ;dx residuo
    mov seed, dx
    ret

main:
    mov ax, @data
    mov ds, ax
    
    ;primer aleatorio
    call NextLehmer16
    mov al, dl
    mov rand1, al ;133  
    
    ;segundo aleatorio acotado
    ; inf + rand()%(sup - inf +1)
    mov al, MAXVAL
    sub al, MINVAL
    inc al
    mov bl, al
    
    call NextLehmer16
    mov al, dl  ;rand()
              ; bl es (sup - inf +1)
    xor ah, ah
    div bl  ;ah residuo osea aletorio
    
    mov al, ah
    add al, MINVAL
    mov rand2, al

end main