.686
.MODEL FLAT, C
EXTRN sub_1010A970:PROC
EXTRN g_1019BC84:DWORD
EXTRN g_101D7E7C:DWORD
EXTRN g_101D7E80:DWORD
EXTRN g_101D7E84:DWORD
EXTRN g_101D7E88:DWORD
EXTRN g_101D7E8C:DWORD
.CODE
FUN_1001d960 PROC
    sub esp, 16
    fld dword ptr [g_101D7E7C]
    fsub dword ptr [eax]
    fstp dword ptr [esp + 4]
    fld dword ptr [g_101D7E80]
    fsub dword ptr [eax + 4]
    fstp dword ptr [esp + 8]
    fld dword ptr [g_101D7E84]
    fsub dword ptr [eax + 8]
    fstp dword ptr [esp + 12]
    fld dword ptr [esp + 4]
    fmul dword ptr [esp + 4]
    fld dword ptr [esp + 12]
    fmul dword ptr [esp + 12]
    faddp st(1)
    fld dword ptr [esp + 8]
    fmul dword ptr [esp + 8]
    faddp st(1)
    fstp dword ptr [esp]
    fld dword ptr [esp]
    call sub_1010A970
    fstp dword ptr [esp]
    fld dword ptr [esp]
    fstp dword ptr [esp]
    fld dword ptr [g_101D7E88]
    fmul dword ptr [esp]
    fadd dword ptr [g_101D7E8C]
    fstp dword ptr [esp]
    fld dword ptr [g_1019BC84]
    fld dword ptr [esp + 20]
    fucompp
    fnstsw ax
    test ah, 68
    jnp L0
    fld dword ptr [esp]
    fdiv dword ptr [esp + 20]
    fstp dword ptr [esp]
L0:
    fld dword ptr [esp]
    add esp, 16
    ret
FUN_1001d960 ENDP
END
