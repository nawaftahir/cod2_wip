; FUN_10016390 @ 0x10016390 — auto-synthesized
    EXTRN g_101da2d4:DWORD
    sub_10013926 PROTO C
.CODE
FUN_10016390 PROC
    mov edx, dword ptr [g_101da2d4]
    push esi
    xor esi, esi
    test edx, edx
    jle L0
    mov ecx, 0x101da2e0
    fld dword ptr [ecx - 8]
    fld dword ptr [edi]
    fucompp
    fnstsw ax
    test ah, 0x44
    jp L1
    fld dword ptr [ecx - 4]
    fld dword ptr [edi + 4]
    fucompp
    fnstsw ax
    test ah, 0x44
    jp L1
    fld dword ptr [ecx]
    fld dword ptr [edi + 8]
    fucompp
    fnstsw ax
    test ah, 0x44
    jp L1
    fld dword ptr [ecx + 4]
    fld dword ptr [edi + 0xc]
    fucompp
    fnstsw ax
    test ah, 0x44
    jnp L2
    inc esi
    add ecx, 0x10
    cmp esi, edx
    jl L3
    cmp esi, 0x10
    jne L0
    push esi
    push 0x10194538
    push 1
    call sub_10013926
    add esp, 0xc
    mov ecx, dword ptr [edi]
    shl esi, 4
    lea eax, [esi + 0x101da2d8]
    mov dword ptr [eax], ecx
    mov edx, dword ptr [edi + 4]
    mov dword ptr [eax + 4], edx
    mov ecx, dword ptr [edi + 8]
    mov dword ptr [eax + 8], ecx
    mov edx, dword ptr [edi + 0xc]
    mov dword ptr [eax + 0xc], edx
    pop esi
    ret
    mov eax, esi
    shl eax, 4
    add eax, 0x101da2d8
    pop esi
    ret
FUN_10016390 ENDP
END