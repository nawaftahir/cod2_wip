; FUN_1001d9f0 @ 0x1001d9f0 — auto-synthesized
    EXTRN fp_101d4b98:DWORD
    EXTRN fp_101d4ba0:DWORD
    EXTRN fp_101d4bd8:DWORD
    sub_1001d97f PROTO C
.CODE
FUN_1001d9f0 PROC
    push ecx
    push ebp
    mov ebp, dword ptr [esp + 0x14]
    push esi
    push edi
    push ebx
    mov esi, eax
    call dword ptr [fp_101d4b98]
    mov edi, eax
    mov eax, dword ptr [esi + 0x38]
    push eax
    lea eax, [esi + 0x3c]
    call sub_1001d97f
    fstp dword ptr [esp + 0x14]
    add esp, 8
    xor esi, esi
    test edi, edi
    jle L0
    lea esp, [esp]
    mov ecx, dword ptr [esp + 0xc]
    push ecx
    push esi
    push ebx
    call dword ptr [fp_101d4bd8]
    add esp, 0xc
    mov byte ptr [esi + ebp], al
    inc esi
    cmp esi, edi
    jl L1
    mov edx, dword ptr [esp + 0x18]
    mov eax, dword ptr [esp + 0x14]
    push ebp
    push edx
    push eax
    push ebx
    call dword ptr [fp_101d4ba0]
    add esp, 0x10
    pop edi
    pop esi
    pop ebp
    pop ecx
    ret
FUN_1001d9f0 ENDP
END