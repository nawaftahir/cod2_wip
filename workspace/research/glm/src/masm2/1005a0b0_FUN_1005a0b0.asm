.686
.MODEL FLAT, C
EXTRN sub_1005A1DC:PROC
EXTRN EXTRN g_1019BC84:DWORD:DWORD
.CODE
FUN_1005a0b0 PROC
    sub sub esp, 32
    fld fld dword ptr [eax]
    fsub fsub dword ptr [ecx]
    fstp fstp dword ptr [esp + 8]
    fld fld dword ptr [eax + 4]
    fsub fsub dword ptr [ecx + 4]
    fstp fstp dword ptr [esp + 12]
    fld fld dword ptr [eax + 8]
    fsub fsub dword ptr [ecx + 8]
    fstp fstp dword ptr [esp + 16]
    fld fld dword ptr [esi]
    fsub fsub dword ptr [ecx]
    fstp fstp dword ptr [esp + 20]
    fld fld dword ptr [esi + 4]
    fsub fsub dword ptr [ecx + 4]
    fstp fstp dword ptr [esp + 24]
    fld fld dword ptr [esi + 8]
    fsub fsub dword ptr [ecx + 8]
    fstp fstp dword ptr [esp + 28]
    fld fld dword ptr [esp + 28]
    fmul fmul dword ptr [esp + 16]
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [esp + 8]
    faddp faddp st(1)
    fld fld dword ptr [esp + 24]
    fmul fmul dword ptr [esp + 12]
    faddp faddp st(1)
    fstp fstp dword ptr [esp + 4]
    fld fld dword ptr [esp + 16]
    fmul fmul dword ptr [esp + 16]
    fld fld dword ptr [esp + 8]
    fmul fmul dword ptr [esp + 8]
    faddp faddp st(1)
    fld fld dword ptr [esp + 12]
    fmul fmul dword ptr [esp + 12]
    faddp faddp st(1)
    fstp fstp dword ptr [esp]
    fld fld dword ptr [g_1019BC84]
    fld fld dword ptr [esp]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp sub_1005A1DC
    mov mov eax, dword ptr [ecx]
    mov mov dword ptr [edx], eax
    mov mov eax, dword ptr [ecx + 4]
    mov mov dword ptr [edx + 4], eax
    mov mov ecx, dword ptr [ecx + 8]
    mov mov dword ptr [edx + 8], ecx
    add add esp, 32
    ret ret
    fld fld dword ptr [esp + 4]
    fdiv fdiv dword ptr [esp]
    fstp fstp dword ptr [esp]
    fld fld dword ptr [esp + 8]
    fmul fmul dword ptr [esp]
    fadd fadd dword ptr [ecx]
    fstp fstp dword ptr [edx]
    fld fld dword ptr [esp]
    fmul fmul dword ptr [esp + 12]
    fadd fadd dword ptr [ecx + 4]
    fstp fstp dword ptr [edx + 4]
    fld fld dword ptr [esp + 16]
    fmul fmul dword ptr [esp]
    fadd fadd dword ptr [ecx + 8]
    fstp fstp dword ptr [edx + 8]
    add add esp, 32
    ret ret
FUN_1005a0b0 ENDP
END
