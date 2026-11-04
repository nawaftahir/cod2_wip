.686
.MODEL FLAT, C
.CODE
FUN_1000edc0 PROC
    cmp ecx, 031545844h
    push esi
    mov esi, edx
    je L0
    cmp ecx, 033545844h
    je L0
    cmp ecx, 035545844h
    mov edx, 1
    jne L1
L0:
    mov edx, 4
L1:
    mov ecx, eax
    sub ecx, esi
    js L2
    mov eax, esi
L2:
    mov cl, 3
    nop
L3:
    mov esi, eax
    sar esi, cl
    cmp esi, edx
    jge L4
    dec cl
    jne L3
L4:
    xor eax, eax
    pop esi
    nop
L5:
    cmp byte ptr [eax + edi], cl
    jbe L6
    mov byte ptr [eax + edi], cl
L6:
    inc eax
    cmp eax, 2
    jl L5
    ret
FUN_1000edc0 ENDP
END
