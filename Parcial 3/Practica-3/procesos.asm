bits 64
default rel 

global longitud_cadena, contar_vocales, contar_espacios
global a_mayusculas, invertir

section .text 

longitud_cadena:
    xor rax, rax

    .loop_len:
    mov dl, [rcx + rax]
    cmp dl, 0
    je .fin_len
    inc eax
    jmp .loop_len
    .fin_len:
    ret 

contar_vocales:
    xor eax, eax 

    .loop_vocal:
    mov r10b, [rcx]
    cmp r10b, 0
    je .fin_voc

    ;convertir a lestras minusculas
    or r10b, 32

    cmp r10b, 'a'
    je .es_vocal
    cmp r10b, 'e'
    je .es_vocal
    cmp r10b, 'i'
    je .es_vocal
    cmp r10b, 'o'
    je .es_vocal
    cmp r10b, 'u'
    je .es_vocal

    .no_es:
    inc rcx
    jmp .loop_vocal

    .es_vocal:
    inc eax
    inc rcx
    jmp .loop_vocal

    .fin_voc:
    ret

contar_espacios:
    xor eax, eax

    .loop_espacios:
    mov r10b, [rcx]
    cmp r10b, 0
    je .fin_esp

    cmp r10b, ' '
    je .tiene_espacio
    inc rcx
    jmp .loop_espacios

    .tiene_espacio:
    inc eax
    inc rcx
    jmp .loop_espacios

    .fin_esp:
    ret 


a_mayusculas:
    .loop_mayo:
    mov r8b, [rcx]
    cmp r8b, 0
    je .fin_mayo

    cmp r8b, 'a'
    jb .copia_char
    cmp r8b, 'z'
    ja .copia_char

    sub r8b, 32

    .copia_char:
    mov [rdx], r8b
    inc rcx
    inc rdx
    jmp .loop_mayo

    .fin_mayo:
    mov byte [rdx], 0
    ret 

invertir:
    mov r8, rcx
    mov r9, rdx

    xor eax, eax

    .loop_inv:
    cmp byte [r8 + rax], 0
    je .loop_inv2
    inc eax
    jmp .loop_inv

    .loop_inv2:
    test eax, eax
    jz .cadena_vacia 

    ;apuntamos al final de la cadena
    lea r10, [r8 + rax -1]

    mov r11d, eax

    .loop_inversion:
    mov cl, [r10]
    mov [r9], cl 
    inc r9
    dec r10
    dec r11d
    jnz .loop_inversion

    mov byte [r9], 0
    ret 

    .cadena_vacia:
    mov byte [r9], 0
    ret 