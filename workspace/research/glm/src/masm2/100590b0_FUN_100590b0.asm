.686
.MODEL FLAT, C
EXTRN sub_10059188:PROC
EXTRN sub_1010A95B:PROC
EXTRN EXTRN g_1019BC78:DWORD:DWORD
EXTRN EXTRN g_1019BC84:DWORD:DWORD
.CODE
FUN_100590b0 PROC
    sub sub esp, 12
    mov mov edx, dword ptr [esi]
    mov mov ecx, dword ptr [esi + 4]
    mov mov eax, dword ptr [esi + 8]
    mov mov dword ptr [esp], edx
    fld fld dword ptr [esp]
    mov mov dword ptr [esp + 4], ecx
    fmul fmul dword ptr [esp]
    mov mov dword ptr [esp + 8], eax
    fld fld dword ptr [esp + 4]
    fmul fmul dword ptr [esp + 4]
    faddp faddp st(1)
    fld fld dword ptr [esp + 8]
    fmul fmul dword ptr [esp + 8]
    faddp faddp st(1)
    fstp fstp dword ptr [esp]
    fld fld dword ptr [esp]
    call sub_1010A95B
    fstp fstp dword ptr [esp + 8]
    fld fld dword ptr [esp + 8]
    fstp fstp dword ptr [esp]
    fld fld dword ptr [esp]
    fld fld dword ptr [g_1019BC84]
    fld fld st(1)
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp sub_10059188
    fld fld dword ptr [g_1019BC78]
    fdiv fdiv st(1)
    fstp fstp dword ptr [esp]
    fld fld dword ptr [esp]
    fmul fmul dword ptr [esi]
    fstp fstp dword ptr [esi]
    fld fld dword ptr [esp]
    fmul fmul dword ptr [esi + 4]
    fstp fstp dword ptr [esi + 4]
    fld fld dword ptr [esp]
    fmul fmul dword ptr [esi + 8]
    fstp fstp dword ptr [esi + 8]
    add add esp, 12
    ret ret
FUN_100590b0 ENDP
END
