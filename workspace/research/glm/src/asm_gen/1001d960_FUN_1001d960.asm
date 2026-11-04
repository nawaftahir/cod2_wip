; FUN_1001d960 @ 0x1001d960 — auto-synthesized
    EXTRN g_1019bc84:DWORD
    EXTRN g_101d7e7c:DWORD
    EXTRN g_101d7e80:DWORD
    EXTRN g_101d7e84:DWORD
    EXTRN g_101d7e88:DWORD
    EXTRN g_101d7e8c:DWORD
    sub_1010a970 PROTO C
.CODE
FUN_1001d960 PROC
    sub esp, 0x10
    fld dword ptr [g_101d7e7c]
    fsub dword ptr [eax]
    fstp dword ptr [esp + 4]
    fld dword ptr [g_101d7e80]
    fsub dword ptr [eax + 4]
    fstp dword ptr [esp + 8]
    fld dword ptr [g_101d7e84]
    fsub dword ptr [eax + 8]
    fstp dword ptr [esp + 0xc]
    fld dword ptr [esp + 4]
    fmul dword ptr [esp + 4]
    fld dword ptr [esp + 0xc]
    fmul dword ptr [esp + 0xc]
    faddp st(1)
    fld dword ptr [esp + 8]
    fmul dword ptr [esp + 8]
    faddp st(1)
    fstp dword ptr [esp]
    fld dword ptr [esp]
    call sub_1010a970
    fstp dword ptr [esp]
    fld dword ptr [esp]
    fstp dword ptr [esp]
    fld dword ptr [g_101d7e88]
    fmul dword ptr [esp]
    fadd dword ptr [g_101d7e8c]
    fstp dword ptr [esp]
    fld dword ptr [g_1019bc84]
    fld dword ptr [esp + 0x14]
    fucompp
    fnstsw ax
    test ah, 0x44
    jnp L0
    fld dword ptr [esp]
    fdiv dword ptr [esp + 0x14]
    fstp dword ptr [esp]
    fld dword ptr [esp]
    add esp, 0x10
    ret
FUN_1001d960 ENDP
END