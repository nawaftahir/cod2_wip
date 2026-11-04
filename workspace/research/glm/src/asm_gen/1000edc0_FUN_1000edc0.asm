; FUN_1000edc0 @ 0x1000edc0 — auto-synthesized
.CODE
FUN_1000edc0 PROC
    cmp ecx, 0x31545844
    push esi
    mov esi, edx
    je L0
    cmp ecx, 0x33545844
    je L0
    cmp ecx, 0x35545844
    mov edx, 1
    jne L1
    mov edx, 4
    mov ecx, eax
    sub ecx, esi
    js L2
    mov eax, esi
    mov cl, 3
    nop
    mov esi, eax
    sar esi, cl
    cmp esi, edx
    jge L3
    dec cl
    jne L4
    xor eax, eax
    pop esi
    nop
    cmp byte ptr [eax + edi], cl
    jbe L5
    mov byte ptr [eax + edi], cl
    inc eax
    cmp eax, 2
    jl L6
    ret
FUN_1000edc0 ENDP
END