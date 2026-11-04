; FUN_10005710 @ 0x10005710 — auto-synthesized
    EXTRN g_1019bc78:DWORD
    EXTRN g_1019bed8:DWORD
    sub_10005707 PROTO C
    sub_100590df PROTO C
.CODE
FUN_10005710 PROC
    sub esp, 0x10
    push ebx
    mov ebx, eax
    fld dword ptr [ebx]
    push esi
    push edi
    mov edi, ecx
    fsub dword ptr [edi]
    lea esi, [esp + 0x10]
    fstp dword ptr [esp + 0x10]
    fld dword ptr [ebx + 4]
    fsub dword ptr [edi + 4]
    fstp dword ptr [esp + 0x14]
    fld dword ptr [ebx + 8]
    fsub dword ptr [edi + 8]
    fstp dword ptr [esp + 0x18]
    call sub_100590df
    fld dword ptr [esp + 0x18]
    fmul dword ptr [edi + 0x14]
    fld dword ptr [esp + 0x14]
    fmul dword ptr [edi + 0x10]
    faddp st(1)
    fld dword ptr [esp + 0x10]
    fmul dword ptr [edi + 0xc]
    faddp st(1)
    fsub dword ptr [g_1019bed8]
    fmul st(1)
    fstp dword ptr [esp + 0xc]
    fstp st(0)
    fld dword ptr [esp + 0xc]
    fcomp dword ptr [g_1019bc78]
    fnstsw ax
    test ah, 5
    jp L0
    mov dword ptr [esp + 0xc], 0x3f800000
    mov eax, dword ptr [esp + 0x28]
    mov ecx, dword ptr [esp + 0xc]
    mov edi, dword ptr [esp + 0x20]
    push eax
    push ecx
    push ebx
    mov ebx, dword ptr [esp + 0x30]
    call sub_10005707
    add esp, 0xc
    pop edi
    pop esi
    pop ebx
    add esp, 0x10
    ret
FUN_10005710 ENDP
END