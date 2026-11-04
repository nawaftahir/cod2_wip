.686
.MODEL FLAT, C
EXTRN sub_1010AA07:PROC
EXTRN sub_1010AA32:PROC
EXTRN EXTRN g_1019BCB0:DWORD:DWORD
EXTRN EXTRN g_1019BD8C:DWORD:DWORD
EXTRN EXTRN g_1019BDCC:DWORD:DWORD
EXTRN EXTRN g_1019BDD0:DWORD:DWORD
EXTRN EXTRN g_1019BDD4:DWORD:DWORD
.CODE
FUN_1005bbe0 PROC
    fld fld dword ptr [esp + 4]
    push push edi
    fmul fmul dword ptr [g_1019BCB0]
    xor xor eax, eax
    mov mov ecx, 16
    mov mov edi, esi
    fsubr fsubr dword ptr [g_1019BDD4]
    rep stosd rep stosd dword ptr es:[edi], eax
    fmul fmul dword ptr [g_1019BD8C]
    call sub_1010AA07
    fstp fstp dword ptr [esp + 8]
    fld fld dword ptr [esp + 8]
    fmul fmul dword ptr [g_1019BDD0]
    fstp fstp dword ptr [esi]
    fld fld dword ptr [esp + 12]
    fmul fmul dword ptr [g_1019BCB0]
    fsubr fsubr dword ptr [g_1019BDD4]
    fmul fmul dword ptr [g_1019BD8C]
    call sub_1010AA32
    fstp fstp dword ptr [esp + 8]
    fld fld dword ptr [esp + 8]
    mov mov dword ptr [esi + 40], 03F7FDF40h
    fmul fmul dword ptr [g_1019BDD0]
    mov mov dword ptr [esi + 44], 03F800000h
    pop pop edi
    fstp fstp dword ptr [esi + 20]
    fld fld dword ptr [esp + 12]
    fmul fmul dword ptr [g_1019BDCC]
    fstp fstp dword ptr [esi + 56]
    ret ret
FUN_1005bbe0 ENDP
END
