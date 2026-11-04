.686
.MODEL FLAT, C
EXTRN g_1019BC84:DWORD
.CODE
FUN_1005ac40 PROC
    sub esp, 12
    mov edx, dword ptr [ecx]
    fld dword ptr [g_1019BC84]
    mov dword ptr [eax], edx
    mov edx, dword ptr [ecx + 12]
    mov dword ptr [eax + 4], edx
    mov edx, dword ptr [ecx + 24]
    mov dword ptr [eax + 8], edx
    mov edx, dword ptr [ecx + 4]
    mov dword ptr [eax + 12], edx
    mov edx, dword ptr [ecx + 16]
    mov dword ptr [eax + 16], edx
    mov edx, dword ptr [ecx + 28]
    mov dword ptr [eax + 20], edx
    mov edx, dword ptr [ecx + 8]
    mov dword ptr [eax + 24], edx
    mov edx, dword ptr [ecx + 20]
    mov dword ptr [eax + 28], edx
    mov edx, dword ptr [ecx + 32]
    mov dword ptr [eax + 32], edx
    fsub dword ptr [ecx + 36]
    fstp dword ptr [esp]
    fld dword ptr [g_1019BC84]
    fsub dword ptr [ecx + 40]
    fstp dword ptr [esp + 4]
    fld dword ptr [g_1019BC84]
    fsub dword ptr [ecx + 44]
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 4]
    fmul dword ptr [eax + 12]
    fld dword ptr [esp + 8]
    fmul dword ptr [eax + 24]
    faddp st(1)
    fld dword ptr [esp]
    fmul dword ptr [eax]
    faddp st(1)
    fstp dword ptr [eax + 36]
    fld dword ptr [esp + 4]
    fmul dword ptr [eax + 16]
    fld dword ptr [esp + 8]
    fmul dword ptr [eax + 28]
    faddp st(1)
    fld dword ptr [esp]
    fmul dword ptr [eax + 4]
    faddp st(1)
    fstp dword ptr [eax + 40]
    fld dword ptr [esp + 8]
    fmul dword ptr [eax + 32]
    fld dword ptr [esp]
    fmul dword ptr [eax + 8]
    faddp st(1)
    fld dword ptr [esp + 4]
    fmul dword ptr [eax + 20]
    faddp st(1)
    fstp dword ptr [eax + 44]
    add esp, 12
    ret
FUN_1005ac40 ENDP
END
