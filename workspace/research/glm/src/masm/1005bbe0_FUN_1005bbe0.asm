.686
.MODEL FLAT, C
EXTRN sub_1010AA07:PROC
EXTRN sub_1010AA32:PROC
EXTRN g_1019BCB0:DWORD
EXTRN g_1019BD8C:DWORD
EXTRN g_1019BDCC:DWORD
EXTRN g_1019BDD0:DWORD
EXTRN g_1019BDD4:DWORD
.CODE
FUN_1005bbe0 PROC
    fld dword ptr [esp + 4]
    push edi
    fmul dword ptr [g_1019BCB0]
    xor eax, eax
    mov ecx, 16
    mov edi, esi
    fsubr dword ptr [g_1019BDD4]
    rep stosd dword ptr es:[edi], eax
    fmul dword ptr [g_1019BD8C]
    call sub_1010AA07
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 8]
    fmul dword ptr [g_1019BDD0]
    fstp dword ptr [esi]
    fld dword ptr [esp + 12]
    fmul dword ptr [g_1019BCB0]
    fsubr dword ptr [g_1019BDD4]
    fmul dword ptr [g_1019BD8C]
    call sub_1010AA32
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 8]
    mov dword ptr [esi + 40], 03F7FDF40h
    fmul dword ptr [g_1019BDD0]
    mov dword ptr [esi + 44], 03F800000h
    pop edi
    fstp dword ptr [esi + 20]
    fld dword ptr [esp + 12]
    fmul dword ptr [g_1019BDCC]
    fstp dword ptr [esi + 56]
    ret
FUN_1005bbe0 ENDP
END
