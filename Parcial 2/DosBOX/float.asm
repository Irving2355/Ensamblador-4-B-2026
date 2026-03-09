.model small
.stack 100h

.data
A_int dw 5
A_frac dw 50

B_int dw 2
B_frac dw 25

;float 32 bits (real4)
C3 dd 3.0
C4 dd 4.0

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

.code 
main:

end main