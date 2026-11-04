; FUN_100588d0 @ 0x100588d0 — auto-synthesized
    EXTRN g_1019bc84:DWORD
    EXTRN g_1019bde4:DWORD
.CODE
FUN_100588d0 PROC
    sub esp, 0xc
    fld dword ptr [esp + 0x10]
    fsub dword ptr [esp + 0x14]
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 4]
    fcomp dword ptr [g_1019bc84]
    fld dword ptr [esp + 0x18]
    fmul dword ptr [esp + 0x1c]
    fnstsw ax
    test ah, 0x41
    je L0
    fchs
    fstp dword ptr [esp]
    fld dword ptr [esp + 4]
    fabs
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 4]
    fcomp dword ptr [g_1019bde4]
    fnstsw ax
    test ah, 0x41
    jne L1
    fld dword ptr [esp]
    fabs
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 8]
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 4]
    fcomp dword ptr [esp + 8]
    fnstsw ax
    test ah, 5
    jnp L1
    fld dword ptr [esp]
    fadd dword ptr [esp + 0x14]
    add esp, 0xc
    ret
    fld dword ptr [esp + 0x10]
    add esp, 0xc
    ret
FUN_100588d0 ENDP
END