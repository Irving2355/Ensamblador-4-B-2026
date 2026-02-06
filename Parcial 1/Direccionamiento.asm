.model small

.stack 100h

.data
num1 db 5
num2 db 3
arr  db 10,20,30,40
resultado db 0

.code
main:
    
    MOV AX, @data
    MOV DS, AX
    
    ;DIRECCIONAMIENTO INMEDIATO
    MOV AL, 2
    
    ;REGISTRO
    MOV BL, AL
    
    ;DIRECTO A MEMORIA POR ETIQUETA
    MOV AL, num1  
    
    ;INDIRECTO POR REGISTRO (PUNTERO)
    MOV SI, offset num2   ;DIRECCION DE MEMORIA DE num2
    ADD AL, [si]     ;AL=5, [si](PUNTERO)=3 5+3=8
    
    ;INDEXADO CON si SOBRE ARRAY
    MOV SI, 1
    ADD AL, arr[si] ;arr[si]=20 8+20=28
    
    ;BASE + INDEX
    MOV BX, offset arr
    MOV SI, 2
    ADD AL, [BX+si] ;AL=28  [BX+si]=30 28+30=58 
    
    
    ;SAVE INFO
    MOV resultado, AL
    
    MOV AH, 4Ch
    INT 21H
END main
    
    
    
    
    
    