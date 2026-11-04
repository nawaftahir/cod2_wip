.686
.MODEL FLAT, C
EXTRN sub_1010A94A:PROC
EXTRN g_1019BC78:DWORD
EXTRN g_1019BC84:DWORD
.CODE
FUN_10059140 PROC
    sub esp, 8
    mov ecx, dword ptr [esi]
    mov eax, dword ptr [esi + 4]
    mov dword ptr [esp], ecx
    fld dword ptr [esp]
    mov dword ptr [esp + 4], eax
    fmul dword ptr [esp]
    fld dword ptr [esp + 4]
    fmul dword ptr [esp + 4]
    faddp st(1)
    fstp dword ptr [esp]
    fld dword ptr [esp]
    call sub_1010A94A
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 4]
    fstp dword ptr [esp]
    fld dword ptr [esp]
    fld dword ptr [g_1019BC84]
    fld st(1)
    fucompp
    fnstsw ax
    test ah, 68
    jnp L0
    fld dword ptr [g_1019BC78]
    fdiv st(1)
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 4]
    fmul dword ptr [esi]
    fstp dword ptr [esi]
    fld dword ptr [esp + 4]
    fmul dword ptr [esi + 4]
    fstp dword ptr [esi + 4]
L0:
    add esp, 8
    ret
FUN_10059140 ENDP
END
