; FUN_100591b0 @ 0x100591b0 — auto-synthesized
    EXTRN g_1019bc78:DWORD
    EXTRN g_1019bc84:DWORD
    sub_1010a96c PROTO C
.CODE
FUN_100591b0 PROC
    sub esp, 0x10
    mov eax, dword ptr [esi + 0xc]
    mov edx, dword ptr [esi + 4]
    mov ecx, dword ptr [esi + 8]
    mov dword ptr [esp + 0xc], eax
    mov eax, dword ptr [esi]
    mov dword ptr [esp], eax
    fld dword ptr [esp]
    mov dword ptr [esp + 4], edx
    fmul dword ptr [esp]
    mov dword ptr [esp + 8], ecx
    fld dword ptr [esp + 4]
    fmul dword ptr [esp + 4]
    faddp st(1)
    fld dword ptr [esp + 8]
    fmul dword ptr [esp + 8]
    faddp st(1)
    fld dword ptr [esp + 0xc]
    fmul dword ptr [esp + 0xc]
    faddp st(1)
    fstp dword ptr [esp]
    fld dword ptr [esp]
    call sub_1010a96c
    fstp dword ptr [esp + 0xc]
    fld dword ptr [esp + 0xc]
    fstp dword ptr [esp]
    fld dword ptr [esp]
    fld dword ptr [g_1019bc84]
    fld st(1)
    fucompp
    fnstsw ax
    test ah, 0x44
    jnp L0
    fld dword ptr [g_1019bc78]
    fdiv st(1)
    fstp dword ptr [esp]
    fld dword ptr [esp]
    fmul dword ptr [esi]
    fstp dword ptr [esi]
    fld dword ptr [esp]
    fmul dword ptr [esi + 4]
    fstp dword ptr [esi + 4]
    fld dword ptr [esp]
    fmul dword ptr [esi + 8]
    fstp dword ptr [esi + 8]
    fld dword ptr [esp]
    fmul dword ptr [esi + 0xc]
    fstp dword ptr [esi + 0xc]
    add esp, 0x10
    ret
FUN_100591b0 ENDP
END