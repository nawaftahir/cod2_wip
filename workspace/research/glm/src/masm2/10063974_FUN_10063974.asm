.686
.MODEL FLAT, C
EXTRN sub_100639E3:PROC
EXTRN EXTRN fp_1010C030:DWORD:DWORD
EXTRN EXTRN fp_1010C034:DWORD:DWORD
EXTRN EXTRN fp_1010C080:DWORD:DWORD
EXTRN EXTRN fp_1010C0E0:DWORD:DWORD
EXTRN EXTRN g_1010C0E4:DWORD:DWORD
EXTRN EXTRN g_101ABD70:DWORD:DWORD
.CODE
FUN_10063974 PROC
    mov mov edi, edi
    push push ebx
    push push esi
    xor xor ebx, ebx
    push push edi
    mov mov edi, dword ptr [g_1010C0E4]
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
    je L1
    cmp cmp dword ptr [g_101ABD70], 0
    mov mov edi, 0101ABD58h
    jne sub_100639E3
    push push edi
    call dword ptr [fp_1010C034]
L1:
    add add dword ptr [g_101ABD70], ebx
    push push 0
    push push esi
    call dword ptr [fp_1010C080]
    push push edi
    call dword ptr [fp_1010C030]
    pop pop edi
    pop pop esi
    pop pop ebx
    ret ret
FUN_10063974 ENDP
END
