;Formato Q8.8
.model small

.stack 100h

.data 
;datos de entrada
A_int  db 3
A_frac db 50

B_int  db 2
B_frac db 25 

;internos
A_q88 dw 0
B_q88 dw 0

S_q88 dw 0
P_q88 dw 0

;resutados
S_int  db 0
S_frac db 0

P_int  db 0
P_frac db 0

.code
main:  

    mov ax, @data
    mov ds, ax  
    
    ;empaquetar q8.8
    xor ax, ax
    mov al, A_frac 
    
    mov bx, 256 
    mul bx
    
    mov bx, 100
    xor dx, dx
    div bx
    
    mov cl, al
    
    ;armar q8.8
    mov ah, A_int
    mov al, cl   
    
    mov A_q88, ax 
    
    ;empaquetar B
    xor ax, ax
    mov al, B_frac 
    
    mov bx, 256 
    mul bx
    
    mov bx, 100
    xor dx, dx
    div bx
    
    mov cl, al
    
    ;armar q8.8
    mov ah, B_int
    mov al, cl   
    
    mov B_q88, ax 
    
    ;suma
    
    mov ax, A_q88
    add ax, B_q88
    mov S_q88, ax
    
    mov S_int, ah
    
    xor ax, ax
    mov al, byte ptr S_q88 
    mov bx, 100
    mul bx
    mov bx, 256
    xor dx, dx
    div bx
    mov S_frac, al
    
    ;producto
    mov ax, A_q88
    mov bx, B_q88
    mul bx  ;DX:AX Q16.16
    
    mov cx, ax
    shr cx, 8  ;DX:AX Q16.8
    mov ax, dx  
    shl ax, 8 
    add ax, cx ;AX Q8.8
    mov P_q88, ax
    

end main