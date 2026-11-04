; FUN_1005d8f0 @ 0x1005d8f0 — auto-synthesized
    EXTRN g_1019bc84:DWORD
    sub_10059131 PROTO C
.CODE
FUN_1005d8f0 PROC
    sub esp, 0x18
    fld dword ptr [ecx]
    push esi
    fsub dword ptr [edi]
    mov esi, edx
    fstp dword ptr [esp + 0x10]
    fld dword ptr [ecx + 4]
    fsub dword ptr [edi + 4]
    fstp dword ptr [esp + 0x14]
    fld dword ptr [ecx + 8]
    fsub dword ptr [edi + 8]
    fstp dword ptr [esp + 0x18]
    fld dword ptr [eax]
    fsub dword ptr [edi]
    fstp dword ptr [esp + 4]
    fld dword ptr [eax + 4]
    fsub dword ptr [edi + 4]
    fstp dword ptr [esp + 8]
    fld dword ptr [eax + 8]
    fsub dword ptr [edi + 8]
    fstp dword ptr [esp + 0xc]
    fld dword ptr [esp + 8]
    fmul dword ptr [esp + 0x18]
    fld dword ptr [esp + 0xc]
    fmul dword ptr [esp + 0x14]
    fsubp st(1)
    fstp dword ptr [esi]
    fld dword ptr [esp + 0xc]
    fmul dword ptr [esp + 0x10]
    fld dword ptr [esp + 0x18]
    fmul dword ptr [esp + 4]
    fsubp st(1)
    fstp dword ptr [esi + 4]
    fld dword ptr [esp + 4]
    fmul dword ptr [esp + 0x14]
    fld dword ptr [esp + 8]
    fmul dword ptr [esp + 0x10]
    fsubp st(1)
    fstp dword ptr [esi + 8]
    call sub_10059131
    fld dword ptr [g_1019bc84]
    fucompp
    fnstsw ax
    test ah, 0x44
    jp L0
    xor eax, eax
    pop esi
    add esp, 0x18
    ret
    fld dword ptr [esi]
    mov eax, 1
    fmul dword ptr [edi]
    fld dword ptr [edi + 4]
    fmul dword ptr [esi + 4]
    faddp st(1)
    fld dword ptr [esi + 8]
    fmul dword ptr [edi + 8]
    faddp st(1)
    fstp dword ptr [esi + 0xc]
    pop esi
    add esp, 0x18
    ret
FUN_1005d8f0 ENDP
END