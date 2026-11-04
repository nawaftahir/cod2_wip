.686
.MODEL FLAT, C
EXTRN sub_1001DA66:PROC
EXTRN sub_1010A970:PROC
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_101D7E7C:DWORD:DWORD
EXTRN EXTRN g_101D7E80:DWORD:DWORD
EXTRN EXTRN g_101D7E84:DWORD:DWORD
EXTRN EXTRN g_101D7E88:DWORD:DWORD
EXTRN EXTRN g_101D7E8C:DWORD:DWORD
.CODE
FUN_1001d960 PROC
    sub sub esp, 16
    fld fld dword ptr [g_101D7E7C]
    fsub fsub dword ptr [eax]
    fstp fstp dword ptr [esp + 4]
    fld fld dword ptr [g_101D7E80]
    fsub fsub dword ptr [eax + 4]
    fstp fstp dword ptr [esp + 8]
    fld fld dword ptr [g_101D7E84]
    fsub fsub dword ptr [eax + 8]
    fstp fstp dword ptr [esp + 12]
    fld fld dword ptr [esp + 4]
    fmul fmul dword ptr [esp + 4]
    fld fld dword ptr [esp + 12]
    fmul fmul dword ptr [esp + 12]
    faddp faddp st(1)
    fld fld dword ptr [esp + 8]
    fmul fmul dword ptr [esp + 8]
    faddp faddp st(1)
    fstp fstp dword ptr [esp]
    fld fld dword ptr [esp]
    call sub_1010A970
    fstp fstp dword ptr [esp]
    fld fld dword ptr [esp]
    fstp fstp dword ptr [esp]
    fld fld dword ptr [g_101D7E88]
    fmul fmul dword ptr [esp]
    fadd fadd dword ptr [g_101D7E8C]
    fstp fstp dword ptr [esp]
    fld fld dword ptr [g_1019BC84]
    fld fld dword ptr [esp + 20]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp sub_1001DA66
    fld fld dword ptr [esp]
    fdiv fdiv dword ptr [esp + 20]
    fstp fstp dword ptr [esp]
    fld fld dword ptr [esp]
    add add esp, 16
    ret ret
FUN_1001d960 ENDP
END
