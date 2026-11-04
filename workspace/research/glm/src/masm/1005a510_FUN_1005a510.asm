.686
.MODEL FLAT, C
.CODE
FUN_1005a510 PROC
    sub esp, 24
    fld dword ptr [ecx + 4]
    fmul dword ptr [eax + 12]
    fld dword ptr [ecx]
    fmul dword ptr [eax]
    faddp st(1)
    fld dword ptr [eax + 24]
    fmul dword ptr [ecx + 8]
    faddp st(1)
    fstp dword ptr [esp]
    fld dword ptr [eax + 28]
    fmul dword ptr [ecx + 8]
    fld dword ptr [ecx + 4]
    fmul dword ptr [eax + 16]
    faddp st(1)
    fld dword ptr [eax + 4]
    fmul dword ptr [ecx]
    faddp st(1)
    fstp dword ptr [esp + 4]
    fld dword ptr [eax + 32]
    fmul dword ptr [ecx + 8]
    fld dword ptr [ecx]
    fmul dword ptr [eax + 8]
    faddp st(1)
    fld dword ptr [ecx + 4]
    fmul dword ptr [eax + 20]
    faddp st(1)
    fstp dword ptr [esp + 8]
    fld dword ptr [ecx + 20]
    fmul dword ptr [eax + 24]
    fld dword ptr [ecx + 12]
    fmul dword ptr [eax]
    faddp st(1)
    fld dword ptr [ecx + 16]
    fmul dword ptr [eax + 12]
    faddp st(1)
    fstp dword ptr [esp + 12]
    fld dword ptr [ecx + 20]
    fmul dword ptr [eax + 28]
    fld dword ptr [ecx + 16]
    fmul dword ptr [eax + 16]
    faddp st(1)
    fld dword ptr [ecx + 12]
    fmul dword ptr [eax + 4]
    faddp st(1)
    fstp dword ptr [esp + 16]
    fld dword ptr [ecx + 12]
    fmul dword ptr [eax + 8]
    fld dword ptr [eax + 32]
    fmul dword ptr [ecx + 20]
    faddp st(1)
    fld dword ptr [eax + 20]
    fmul dword ptr [ecx + 16]
    faddp st(1)
    fstp dword ptr [esp + 20]
    fld dword ptr [ecx + 32]
    fmul dword ptr [eax + 24]
    fld dword ptr [ecx + 24]
    fmul dword ptr [eax]
    faddp st(1)
    fld dword ptr [ecx + 28]
    fmul dword ptr [eax + 12]
    faddp st(1)
    fstp dword ptr [eax + 24]
    fld dword ptr [ecx + 32]
    fmul dword ptr [eax + 28]
    fld dword ptr [ecx + 28]
    fmul dword ptr [eax + 16]
    faddp st(1)
    fld dword ptr [ecx + 24]
    fmul dword ptr [eax + 4]
    faddp st(1)
    fstp dword ptr [eax + 28]
    fld dword ptr [ecx + 24]
    fmul dword ptr [eax + 8]
    fld dword ptr [eax + 32]
    fmul dword ptr [ecx + 32]
    faddp st(1)
    fld dword ptr [eax + 20]
    fmul dword ptr [ecx + 28]
    faddp st(1)
    fstp dword ptr [eax + 32]
    mov ecx, dword ptr [esp]
    mov edx, dword ptr [esp + 4]
    mov dword ptr [eax], ecx
    mov ecx, dword ptr [esp + 8]
    mov dword ptr [eax + 4], edx
    mov edx, dword ptr [esp + 12]
    mov dword ptr [eax + 8], ecx
    mov ecx, dword ptr [esp + 16]
    mov dword ptr [eax + 12], edx
    mov edx, dword ptr [esp + 20]
    mov dword ptr [eax + 16], ecx
    mov dword ptr [eax + 20], edx
    add esp, 24
    ret
FUN_1005a510 ENDP
END
