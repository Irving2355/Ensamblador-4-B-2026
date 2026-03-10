.model small
.stack 100h

.data
A_int dw 5
A_frac dw 50
B_int dw 2
B_frac dw 25

;float 32 bits (real4)
C3 dd 3.0
D4 dd 4.0 
T1 dd 0.10
T2 dd 0.20
A_val dd ?
B_val dd ?
sumaAB dd ?
prodAB dd ?
divAB  dd ?
sqrtD  dd ?
expZ   dd ?
testT  dd ?
tmpInt dw 0
tmpFrac dw 0
HUNDRED dw 100

dataSeg dw 0

.code 
make_real_from_parts proc
    fild tmpInt   ;sto= int
    fild tmpFrac  ;sto= fracc, int
    fidiv HUNDRED ; fracc/100 // sto= (fracc/100), int
    fadd ;sto = resultado numero trans .50 + 5 = 5.50
    ret 
make_real_from_parts endp
main:
    mov ax, @data
    mov ds, ax

    ;construir A_val
    mov ax, A_int
    mov tmpInt, ax
    mov ax, A_frac
    mov tmpFrac, ax
    call make_real_from_parts 
    fstp A_val

    ;construir B_val
    mov ax, B_int
    mov tmpInt, ax
    mov ax, B_frac
    mov tmpFrac, ax
    call make_real_from_parts 
    fstp B_val 

    ;****** suma *******
    fld A_val
    fld B_val ;sto = B_val, A_val
    fadd 
    fstp sumaAB

    ;***** producto ******
    fld A_val
    fld B_val
    fmul 
    fstp prodAB

    ;***** division ******
    fld A_val
    fld B_val  
    fxch  ; sto = A_val, B_val
    fdiv  ; A/B
    fstp divAB

    ;***** sqrt(4.0)
    fld D4 
    fsqrt 
    fstp sqrtD

    ;******* expresion ********
    ;z = ((A+B)*3)/sqrt(4)
    fld sumaAB
    fld C3
    fmul 

    fld D4
    fsqrt

    fxch 
    fdiv 
    fstp expZ

    mov dataSeg, ds 
    mov ax, dataSeg
end main