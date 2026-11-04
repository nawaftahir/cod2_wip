; FUN_1007e3d1 @ 0x1007e3d1 — auto-synthesized
    EXTRN g_1019bc84:DWORD
.CODE
FUN_1007e3d1 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    cmp dword ptr [ebp + 0x18], 0
    jbe L0
    mov ecx, dword ptr [ebp + 0x14]
    mov edx, dword ptr [ebp + 0x10]
    push esi
    mov esi, dword ptr [ebp + 0x18]
    sub edx, ecx
    fld dword ptr [g_1019bc84]
    fld dword ptr [edx + ecx]
    fucompp
    fnstsw ax
    test ah, 0x44
    jnp L1
    xor eax, eax
    inc eax
    jmp L2
    xor eax, eax
    mov dword ptr [ecx], eax
    add ecx, 4
    dec esi
    jne L3
    pop esi
    push dword ptr [ebp + 0x18]
    mov eax, dword ptr [ebp + 8]
    push dword ptr [ebp + 0x10]
    mov ecx, dword ptr [eax]
    push dword ptr [ebp + 0xc]
    push eax
    call dword ptr [ecx + 0x188]
    pop ebp
    ret 0x14
FUN_1007e3d1 ENDP
END