.686
.MODEL FLAT, C
EXTRN fp_1010C030:DWORD
EXTRN fp_1010C034:DWORD
EXTRN fp_1010C080:DWORD
EXTRN fp_1010C0E0:DWORD
EXTRN g_1010C0E4:DWORD
EXTRN g_101ABD70:DWORD
.CODE
FUN_10063974 PROC
    mov edi, edi
    push ebx
    push esi
    xor ebx, ebx
    push edi
    mov edi, dword ptr [g_1010C0E4]
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
    cmp dword ptr [g_101ABD70], 0
    mov edi, 0101ABD58h
    jne L2
    push edi
    call dword ptr [fp_1010C034]
L2:
    add dword ptr [g_101ABD70], ebx
    push 0
    push esi
    call dword ptr [fp_1010C080]
    push edi
    call dword ptr [fp_1010C030]
    pop edi
    pop esi
    pop ebx
    ret
FUN_10063974 ENDP
END
