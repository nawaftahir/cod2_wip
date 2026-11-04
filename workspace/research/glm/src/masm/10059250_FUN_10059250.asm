.686
.MODEL FLAT, C
EXTRN sub_1010A95B:PROC
EXTRN g_1019BC78:DWORD
EXTRN g_1019BC84:DWORD
.CODE
FUN_10059250 PROC
    sub esp, 12
    mov edx, dword ptr [edi]
    mov ecx, dword ptr [edi + 4]
    mov eax, dword ptr [edi + 8]
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
    call sub_1010A95B
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 8]
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
    fstp dword ptr [esp]
    fld dword ptr [esp]
    fmul dword ptr [edi]
    fstp dword ptr [esi]
    fld dword ptr [esp]
    fmul dword ptr [edi + 4]
    fstp dword ptr [esi + 4]
    fld dword ptr [esp]
    fmul dword ptr [edi + 8]
    fstp dword ptr [esi + 8]
    add esp, 12
    ret
L0:
    xor eax, eax
    mov dword ptr [esi], eax
    mov dword ptr [esi + 4], eax
    mov dword ptr [esi + 8], eax
    add esp, 12
    ret
FUN_10059250 ENDP
END
