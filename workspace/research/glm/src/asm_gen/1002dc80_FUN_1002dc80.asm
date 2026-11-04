; FUN_1002dc80 @ 0x1002dc80 — auto-synthesized
    EXTRN fp_101d4b3c:DWORD
    EXTRN fp_101d4b48:DWORD
    sub_1002dbce PROTO C
.CODE
FUN_1002dc80 PROC
    sub esp, 0xc
    push ebp
    push ebx
    call dword ptr [fp_101d4b48]
    add esp, 4
    xor ebp, ebp
    test eax, eax
    mov dword ptr [esp + 8], eax
    jle L0
    push esi
    push edi
    lea ebx, [ebx]
    lea eax, [esp + 0x14]
    push eax
    push ebp
    lea ecx, [esp + 0x14]
    push ecx
    push ebx
    call dword ptr [fp_101d4b3c]
    mov edi, eax
    add esp, 0x10
    xor esi, esi
    test edi, edi
    jle L1
    lea ecx, [ecx]
    mov edx, dword ptr [esp + 0xc]
    mov eax, dword ptr [edx + esi*4]
    push eax
    push ebx
    call sub_1002dbce
    add esp, 8
    inc esi
    cmp esi, edi
    jl L2
    mov eax, dword ptr [esp + 0x10]
    inc ebp
    cmp ebp, eax
    jl L3
    pop edi
    pop esi
    pop ebp
    add esp, 0xc
    ret
FUN_1002dc80 ENDP
END