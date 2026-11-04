.686
.MODEL FLAT, C
EXTRN sub_10063A1A:PROC
EXTRN sub_10063A46:PROC
EXTRN EXTRN fp_1010C038:DWORD:DWORD
EXTRN EXTRN fp_1010C03C:DWORD:DWORD
EXTRN EXTRN fp_1010C080:DWORD:DWORD
EXTRN EXTRN fp_1010C0E0:DWORD:DWORD
EXTRN EXTRN g_1010C0E4:DWORD:DWORD
EXTRN EXTRN g_101ABD70:DWORD:DWORD
.CODE
FUN_100639c9 PROC
    mov mov edi, edi
    push push ebx
    push push esi
    push push edi
    push push 0101ABD58h
    call dword ptr [fp_1010C03C]
    mov mov edi, dword ptr [g_1010C0E4]
    xor xor ebx, ebx
    inc inc ebx
    mov mov esi, 0101ABD74h
    jmp L0
    push push ebx
    call dword ptr [fp_1010C0E0]
    push push 0
    push push ebx
    push push esi
    call call edi
    cmp cmp eax, ebx
    je sub_10063A1A
    sub sub dword ptr [g_101ABD70], ebx
    jne sub_10063A46
    push push 0101ABD58h
    call dword ptr [fp_1010C038]
    push push 0
    push push esi
L0:
    call dword ptr [fp_1010C080]
    pop pop edi
    pop pop esi
    pop pop ebx
    ret ret
FUN_100639c9 ENDP
END
