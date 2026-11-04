.686
.MODEL FLAT, C
EXTRN sub_100599FC:PROC
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_1019BD8C:DWORD:DWORD
.CODE
FUN_1005e180 PROC
    sub sub esp, 28
    fld fld dword ptr [esp + 32]
    lea lea eax, [esp + 32]
    fmul fmul dword ptr [g_1019BD8C]
    lea lea ecx, [esp]
    push push esi
    mov mov dword ptr [esp + 12], eax
    fstp fstp dword ptr [esp + 16]
    mov mov dword ptr [esp + 8], ecx
    push push eax
    push push ecx
    fld fld dword ptr [esp + 24]
    fsincos fsincos
    mov mov ecx, dword ptr [esp + 20]
    mov mov eax, dword ptr [esp + 16]
    fstp fstp dword ptr [ecx]
    fstp fstp dword ptr [eax]
    pop pop ecx
    pop pop eax
    fld fld dword ptr [edx + 8]
    fmul fmul dword ptr [g_1019BC84]
    lea lea esi, [esp + 20]
    fld fld dword ptr [esp + 36]
    fmul fmul dword ptr [edx]
    fsubp fsubp st(1)
    fld fld dword ptr [esp + 4]
    fmul fmul dword ptr [edx + 4]
    fsubp fsubp st(1)
    fstp fstp dword ptr [esp + 8]
    fld fld dword ptr [esp + 8]
    fmul fmul dword ptr [edx]
    fadd fadd dword ptr [esp + 36]
    fstp fstp dword ptr [esp + 20]
    fld fld dword ptr [esp + 8]
    fmul fmul dword ptr [edx + 4]
    fadd fadd dword ptr [esp + 4]
    fstp fstp dword ptr [esp + 24]
    fld fld dword ptr [esp + 8]
    fmul fmul dword ptr [edx + 8]
    fadd fadd dword ptr [g_1019BC84]
    fstp fstp dword ptr [esp + 28]
    call sub_100599FC
    pop pop esi
    add add esp, 28
    ret ret
FUN_1005e180 ENDP
END
