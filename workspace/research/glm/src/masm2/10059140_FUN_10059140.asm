.686
.MODEL FLAT, C
EXTRN sub_100591F0:PROC
EXTRN sub_1010A94A:PROC
EXTRN EXTRN g_1019BC78:DWORD:DWORD
EXTRN EXTRN g_1019BC84:DWORD:DWORD
.CODE
FUN_10059140 PROC
    sub sub esp, 8
    mov mov ecx, dword ptr [esi]
    mov mov eax, dword ptr [esi + 4]
    mov mov dword ptr [esp], ecx
    fld fld dword ptr [esp]
    mov mov dword ptr [esp + 4], eax
    fmul fmul dword ptr [esp]
    fld fld dword ptr [esp + 4]
    fmul fmul dword ptr [esp + 4]
    faddp faddp st(1)
    fstp fstp dword ptr [esp]
    fld fld dword ptr [esp]
    call sub_1010A94A
    fstp fstp dword ptr [esp + 4]
    fld fld dword ptr [esp + 4]
    fstp fstp dword ptr [esp]
    fld fld dword ptr [esp]
    fld fld dword ptr [g_1019BC84]
    fld fld st(1)
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp sub_100591F0
    fld fld dword ptr [g_1019BC78]
    fdiv fdiv st(1)
    fstp fstp dword ptr [esp + 4]
    fld fld dword ptr [esp + 4]
    fmul fmul dword ptr [esi]
    fstp fstp dword ptr [esi]
    fld fld dword ptr [esp + 4]
    fmul fmul dword ptr [esi + 4]
    fstp fstp dword ptr [esi + 4]
    add add esp, 8
    ret ret
FUN_10059140 ENDP
END
