;Control de registro para activacion
;bit0 LED    bit1 MOTOR
;bit2 ALARMA bit3 MODO_SEGURO 

.model small

.stack 100h

.data

regCtrl db 03h;00000011b

MASK_LED    equ 01h;00000001b
MASK_MOTOR  equ 02h;00000010b
MASK_ALARM  equ 04h;00000100b
MASK_SAFE   equ 08h;00001000b 

outAfterOr  db 0
outAfterAnd db 0
outSafeIsOn db 0

.code
main:
    mov ax, @data
    mov ds, ax
    
    ;encender led y alarma
    ;OR enciende bits
    mov al, regCtrl
    or  al, (MASK_LED + MASK_ALARM);00000111b resultado final
    mov outAfterOr, al
    
    ;supongomos pasan varias instrucciones
    ;apagar el motor
    ;usamos el and + el not
    mov al, outAfterOr
    mov bl, MASK_MOTOR
    not bl
    and al, bl 
    mov outAfterAnd, al 
    
    ;modo seguro
    ;TEST hace lo and sin afectar registros
    ; y cambia banderas  
    mov  al, outAfterAnd  ;00000101b 00001101b
    test al, MASK_SAFE    ;00001000b 00001000b
    jz SafeOff            ;00000000b 00001000b
SafeOn:
    mov outSafeIsOn, 1
    jmp Done
SafeOff:
    mov outSafeIsOn, 0
Done:
    mov dx, offset outSafeIsOn
    int 3

end main