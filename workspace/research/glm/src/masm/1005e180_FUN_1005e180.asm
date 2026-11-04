.686
.MODEL FLAT, C
EXTRN sub_100599FC:PROC
EXTRN g_1019BC84:DWORD
EXTRN g_1019BD8C:DWORD
.CODE
FUN_1005e180 PROC
    sub esp, 28
    fld dword ptr [esp + 32]
    lea eax, [esp + 32]
    fmul dword ptr [g_1019BD8C]
    lea ecx, [esp]
    push esi
    mov dword ptr [esp + 12], eax
    fstp dword ptr [esp + 16]
    mov dword ptr [esp + 8], ecx
    push eax
    push ecx
    fld dword ptr [esp + 24]
    fsincos
    mov ecx, dword ptr [esp + 20]
    mov eax, dword ptr [esp + 16]
    fstp dword ptr [ecx]
    fstp dword ptr [eax]
    pop ecx
    pop eax
    fld dword ptr [edx + 8]
    fmul dword ptr [g_1019BC84]
    lea esi, [esp + 20]
    fld dword ptr [esp + 36]
    fmul dword ptr [edx]
    fsubp st(1)
    fld dword ptr [esp + 4]
    fmul dword ptr [edx + 4]
    fsubp st(1)
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 8]
    fmul dword ptr [edx]
    fadd dword ptr [esp + 36]
    fstp dword ptr [esp + 20]
    fld dword ptr [esp + 8]
    fmul dword ptr [edx + 4]
    fadd dword ptr [esp + 4]
    fstp dword ptr [esp + 24]
    fld dword ptr [esp + 8]
    fmul dword ptr [edx + 8]
    fadd dword ptr [g_1019BC84]
    fstp dword ptr [esp + 28]
    call sub_100599FC
    pop esi
    add esp, 28
    ret
FUN_1005e180 ENDP
END
