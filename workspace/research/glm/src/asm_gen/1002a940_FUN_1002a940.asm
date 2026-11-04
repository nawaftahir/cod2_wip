; FUN_1002a940 @ 0x1002a940 — auto-synthesized
    EXTRN fp_101d4b3c:DWORD
    EXTRN fp_101d4b48:DWORD
    EXTRN fp_101d4b5c:DWORD
    sub_10061cf4 PROTO C
.CODE
FUN_1002a940 PROC
    sub esp, 8
    push ebx
    push ebp
    push esi
    push edi
    call dword ptr [fp_101d4b48]
    mov ebx, eax
    add esp, 4
    xor esi, esi
    test ebx, ebx
    jle L0
    lea eax, [esp + 0x10]
    push eax
    push esi
    lea ecx, [esp + 0x14]
    push ecx
    push edi
    call dword ptr [fp_101d4b3c]
    add esp, 0x10
    xor ecx, ecx
    test eax, eax
    jle L1
    mov edx, dword ptr [esp + 0xc]
    jmp L2
    lea esp, [esp]
    mov ebp, dword ptr [edx + ecx*4]
    cmp word ptr [ebp + 6], -1
    je L3
    inc ecx
    cmp ecx, eax
    jl L2
    inc esi
    cmp esi, ebx
    jl L4
    pop esi
    pop ebp
    mov al, 1
    pop ebx
    add esp, 8
    ret
    push ecx
    push esi
    push edi
    call dword ptr [fp_101d4b5c]
    add esp, 4
    push eax
    push 0x10197378
    call sub_10061cf4
    add esp, 0x10
    pop esi
    pop ebp
FUN_1002a940 ENDP
END