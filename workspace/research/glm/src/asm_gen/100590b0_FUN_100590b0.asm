; FUN_100590b0 @ 0x100590b0 — auto-synthesized
    EXTRN g_1019bc78:DWORD
    EXTRN g_1019bc84:DWORD
    sub_1010a95b PROTO C
.CODE
FUN_100590b0 PROC
    sub esp, 0xc
    mov edx, dword ptr [esi]
    mov ecx, dword ptr [esi + 4]
    mov eax, dword ptr [esi + 8]
    mov dword ptr [esp], edx
    fld dword ptr [esp]
    mov dword ptr [esp + 4], ecx
    fmul dword ptr [esp]
    mov dword ptr [esp + 8], eax
    fld dword ptr [esp + 4]
    fmul dword ptr [esp + 4]
    faddp st(1)
    fld dword ptr [esp + 8]
    fmul dword ptr [esp + 8]
    faddp st(1)
    fstp dword ptr [esp]
    fld dword ptr [esp]
    call sub_1010a95b
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 8]
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
    add esp, 0xc
    ret
FUN_100590b0 ENDP
END