.686
.MODEL FLAT, C
EXTRN EXTRN g_1019BC84:DWORD:DWORD
.CODE
FUN_1005ac40 PROC
    sub sub esp, 12
    mov mov edx, dword ptr [ecx]
    fld fld dword ptr [g_1019BC84]
    mov mov dword ptr [eax], edx
    mov mov edx, dword ptr [ecx + 12]
    mov mov dword ptr [eax + 4], edx
    mov mov edx, dword ptr [ecx + 24]
    mov mov dword ptr [eax + 8], edx
    mov mov edx, dword ptr [ecx + 4]
    mov mov dword ptr [eax + 12], edx
    mov mov edx, dword ptr [ecx + 16]
    mov mov dword ptr [eax + 16], edx
    mov mov edx, dword ptr [ecx + 28]
    mov mov dword ptr [eax + 20], edx
    mov mov edx, dword ptr [ecx + 8]
    mov mov dword ptr [eax + 24], edx
    mov mov edx, dword ptr [ecx + 20]
    mov mov dword ptr [eax + 28], edx
    mov mov edx, dword ptr [ecx + 32]
    mov mov dword ptr [eax + 32], edx
    fsub fsub dword ptr [ecx + 36]
    fstp fstp dword ptr [esp]
    fld fld dword ptr [g_1019BC84]
    fsub fsub dword ptr [ecx + 40]
    fstp fstp dword ptr [esp + 4]
    fld fld dword ptr [g_1019BC84]
    fsub fsub dword ptr [ecx + 44]
    fstp fstp dword ptr [esp + 8]
    fld fld dword ptr [esp + 4]
    fmul fmul dword ptr [eax + 12]
    fld fld dword ptr [esp + 8]
    fmul fmul dword ptr [eax + 24]
    faddp faddp st(1)
    fld fld dword ptr [esp]
    fmul fmul dword ptr [eax]
    faddp faddp st(1)
    fstp fstp dword ptr [eax + 36]
    fld fld dword ptr [esp + 4]
    fmul fmul dword ptr [eax + 16]
    fld fld dword ptr [esp + 8]
    fmul fmul dword ptr [eax + 28]
    faddp faddp st(1)
    fld fld dword ptr [esp]
    fmul fmul dword ptr [eax + 4]
    faddp faddp st(1)
    fstp fstp dword ptr [eax + 40]
    fld fld dword ptr [esp + 8]
    fmul fmul dword ptr [eax + 32]
    fld fld dword ptr [esp]
    fmul fmul dword ptr [eax + 8]
    faddp faddp st(1)
    fld fld dword ptr [esp + 4]
    fmul fmul dword ptr [eax + 20]
    faddp faddp st(1)
    fstp fstp dword ptr [eax + 44]
    add add esp, 12
    ret ret
FUN_1005ac40 ENDP
END
