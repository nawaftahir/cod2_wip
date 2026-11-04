.686
.MODEL FLAT, C
EXTRN sub_100592B3:PROC
EXTRN sub_1010A96C:PROC
EXTRN EXTRN g_1019BC78:DWORD:DWORD
EXTRN EXTRN g_1019BC84:DWORD:DWORD
.CODE
FUN_100591b0 PROC
    sub sub esp, 16
    mov mov eax, dword ptr [esi + 12]
    mov mov edx, dword ptr [esi + 4]
    mov mov ecx, dword ptr [esi + 8]
    mov mov dword ptr [esp + 12], eax
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [esp], eax
    fld fld dword ptr [esp]
    mov mov dword ptr [esp + 4], edx
    fmul fmul dword ptr [esp]
    mov mov dword ptr [esp + 8], ecx
    fld fld dword ptr [esp + 4]
    fmul fmul dword ptr [esp + 4]
    faddp faddp st(1)
    fld fld dword ptr [esp + 8]
    fmul fmul dword ptr [esp + 8]
    faddp faddp st(1)
    fld fld dword ptr [esp + 12]
    fmul fmul dword ptr [esp + 12]
    faddp faddp st(1)
    fstp fstp dword ptr [esp]
    fld fld dword ptr [esp]
    call sub_1010A96C
    fstp fstp dword ptr [esp + 12]
    fld fld dword ptr [esp + 12]
    fstp fstp dword ptr [esp]
    fld fld dword ptr [esp]
    fld fld dword ptr [g_1019BC84]
    fld fld st(1)
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp sub_100592B3
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
    fld fld dword ptr [esp]
    fmul fmul dword ptr [esi + 12]
    fstp fstp dword ptr [esi + 12]
    add add esp, 16
    ret ret
FUN_100591b0 ENDP
END
