.model small

.stack 100h

.data 

ARR DB 10,20,30,40
MSG DB "HOLA MUNDO","$"

.code

main:

    MOV AX, @data
    MOV DS, AX

    ;XCHG EXCHANGE INTERCAMBIO
    MOV AX, 5
    MOV BX, 9
    XCHG AX, BX
    
    ;LEA LOAD EFFECTIVE ADDRESS CARGA DIRECCION 
    ;MOV SI, OFFSET ARR
    LEA SI, ARR ;CARGA LA DIRECCION DEL ARRAY
    MOV AL, ARR ;CARGAR EL CONTENIDO 10
    LEA DX, MSG 
    
    ;********    ALU ***********
    ;ADD SUMAR
    ;SUB RESTAR
    
    ;LIMPIAR EL REGISTRO
    MOV AX, 0
    
    MOV AL, 10
    ADD AL, 5
    
    MOV AL, 10
    SUB AL, 10 ;AL=0 ZF=1
    
    MOV AL, 0FFh ;255
    ADD AL, 01h    ; CF=1 AL=0
    
    ;INC INCREMENTA
    ;DEC DECREMENTA 
    MOV CX, 0
    INC CX ;++
    DEC CX ;--
    
    ;INC Y DEC NO ACTIVAN LA CF
    
    ;********   LOGICA **********
    
    MOV AL, OFh ;00001111
    AND AL, O3h ;00000011
                ;00000011
                ;SOLO DEJA LOS 2 BITS BAJOS 
    
    MOV AL, 03h ;00000011
    OR  AL, 10h ;00010011
                ;00010011   
    
    MOV AL, 55h
    XOR AL, OFFh;INVERTIR LOS BITS
    
    MOV AL, 55h
    XOR AL, AL ;AL=0
    
    MOV AL, 55h
    NOT AL 
    
    ;********* COMPARACIONES ***********
    
    ;CMP COMPARACION
    ;CMP RESTA PERO NO GUARDA EL RESULTADO
    ;SOLO AJUSTA BANDERAS
    
    MOV AX, 5
    MOV BX, 5
    CMP AX, BX ;ZF=1 
    
    ;TEST AND LOGICO SIN GUARDAR RESULTADO
    
    MOV AL, 08h  ;00001000
    TEST AL, 08h ; ESTA ENCENDIDO EL BIT 3? ZF=0 si SI
    
    
    ;********** SALTOS  ************
    ;UN SALTO JMP SALTA LINEAS DE CODIGO
    ;HACIA UNA ETIQUETA ES COMO DECIR 
    ;SALTA A UNA CIERTA LINEA DE CODIGO
    ;E IGNORA LO DEMAS 
    
    MOV AX, 1
    JMP ETIQUETA
    
    MOV AX, 9999h  ;LO IGNORA
    
    ETIQUETA:
    MOV BX, 2 
    
    ;JE JUMP EQUALS
    ;JNE JUMP NOT EQUALS 
    ;SE USAN CON LA BANDERA ZF
    
    MOV AX, 7
    CMP AX, 8
    JE IGUALES
    JNE DIFERENTES
    
    MOV BX, 1
    JMP FIN
    
    IGUALES:
    MOV BX, 2 
    JMP FIN
    
    DIFERENTES:
    MOV BX, 3
    
    FIN:
    MOV AH,4Ch
    INT 21H
    
END main