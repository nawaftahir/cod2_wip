; FUN_10059740 @ 0x10059740 — auto-synthesized
    EXTRN g_1019bc84:DWORD
    sub_10059579 PROTO C
    sub_10059f60 PROTO C
.CODE
FUN_10059740 PROC
    sub esp, 0xc
    push edi
    lea edi, [esi + 0xc]
    mov eax, edi
    mov ecx, esi
    call sub_10059f60
    fld dword ptr [g_1019bc84]
    fld dword ptr [esp + 0x14]
    fucompp
    fnstsw ax
    test ah, 0x44
    jnp L0
    mov eax, dword ptr [edi]
    mov ecx, dword ptr [edi + 4]
    mov edx, dword ptr [edi + 8]
    push ebx
    mov dword ptr [esp + 8], eax
    mov eax, dword ptr [esp + 0x18]
    push eax
    mov dword ptr [esp + 0x10], ecx
    push edi
    lea ebx, [esp + 0x10]
    mov ecx, esi
    mov dword ptr [esp + 0x18], edx
    call sub_10059579
    add esp, 8
    pop ebx
    fld dword ptr [edi + 8]
    fmul dword ptr [esi + 4]
    fld dword ptr [esi + 8]
    fmul dword ptr [edi + 4]
    fsubp st(1)
    fstp dword ptr [esi + 0x18]
    fld dword ptr [edi]
    fmul dword ptr [esi + 8]
    fld dword ptr [edi + 8]
    fmul dword ptr [esi]
    fsubp st(1)
    fstp dword ptr [esi + 0x1c]
    fld dword ptr [edi + 4]
    fmul dword ptr [esi]
    fld dword ptr [edi]
    pop edi
    fmul dword ptr [esi + 4]
    fsubp st(1)
    fstp dword ptr [esi + 0x20]
    add esp, 0xc
    ret
FUN_10059740 ENDP
END