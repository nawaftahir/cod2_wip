.686
.MODEL FLAT, C
EXTRN fp_1010C038:DWORD
EXTRN fp_1010C03C:DWORD
EXTRN fp_1010C080:DWORD
EXTRN fp_1010C0E0:DWORD
EXTRN g_1010C0E4:DWORD
EXTRN g_101ABD70:DWORD
.CODE
FUN_100639c9 PROC
    mov edi, edi
    push ebx
    push esi
    push edi
    push 0101ABD58h
    call dword ptr [fp_1010C03C]
    mov edi, dword ptr [g_1010C0E4]
    xor ebx, ebx
    inc ebx
    mov esi, 0101ABD74h
    jmp L1
L0:
    push ebx
    call dword ptr [fp_1010C0E0]
L1:
    push 0
    push ebx
    push esi
    call edi
    cmp eax, ebx
    je L0
    sub dword ptr [g_101ABD70], ebx
    jne L2
    push 0101ABD58h
    call dword ptr [fp_1010C038]
L2:
    push 0
    push esi
    call dword ptr [fp_1010C080]
    pop edi
    pop esi
    pop ebx
    ret
FUN_100639c9 ENDP
END
