.686
.MODEL FLAT, C
.CODE
FUN_1005a430 PROC
    fld dword ptr [ecx]
    fmul dword ptr [eax]
    fld dword ptr [ecx + 4]
    fmul dword ptr [eax + 12]
    faddp st(1)
    fld dword ptr [eax + 24]
    fmul dword ptr [ecx + 8]
    faddp st(1)
    fstp dword ptr [edx]
    fld dword ptr [ecx + 4]
    fmul dword ptr [eax + 16]
    fld dword ptr [eax + 28]
    fmul dword ptr [ecx + 8]
    faddp st(1)
    fld dword ptr [eax + 4]
    fmul dword ptr [ecx]
    faddp st(1)
    fstp dword ptr [edx + 4]
    fld dword ptr [ecx + 4]
    fmul dword ptr [eax + 20]
    fld dword ptr [eax + 32]
    fmul dword ptr [ecx + 8]
    faddp st(1)
    fld dword ptr [eax + 8]
    fmul dword ptr [ecx]
    faddp st(1)
    fstp dword ptr [edx + 8]
    fld dword ptr [ecx + 16]
    fmul dword ptr [eax + 12]
    fld dword ptr [ecx + 12]
    fmul dword ptr [eax]
    faddp st(1)
    fld dword ptr [ecx + 20]
    fmul dword ptr [eax + 24]
    faddp st(1)
    fstp dword ptr [edx + 12]
    fld dword ptr [ecx + 20]
    fmul dword ptr [eax + 28]
    fld dword ptr [ecx + 16]
    fmul dword ptr [eax + 16]
    faddp st(1)
    fld dword ptr [ecx + 12]
    fmul dword ptr [eax + 4]
    faddp st(1)
    fstp dword ptr [edx + 16]
    fld dword ptr [ecx + 20]
    fmul dword ptr [eax + 32]
    fld dword ptr [ecx + 16]
    fmul dword ptr [eax + 20]
    faddp st(1)
    fld dword ptr [ecx + 12]
    fmul dword ptr [eax + 8]
    faddp st(1)
    fstp dword ptr [edx + 20]
    fld dword ptr [ecx + 24]
    fmul dword ptr [eax]
    fld dword ptr [eax + 24]
    fmul dword ptr [ecx + 32]
    faddp st(1)
    fld dword ptr [ecx + 28]
    fmul dword ptr [eax + 12]
    faddp st(1)
    fstp dword ptr [edx + 24]
    fld dword ptr [eax + 28]
    fmul dword ptr [ecx + 32]
    fld dword ptr [eax + 16]
    fmul dword ptr [ecx + 28]
    faddp st(1)
    fld dword ptr [eax + 4]
    fmul dword ptr [ecx + 24]
    faddp st(1)
    fstp dword ptr [edx + 28]
    fld dword ptr [eax + 32]
    fmul dword ptr [ecx + 32]
    fld dword ptr [eax + 20]
    fmul dword ptr [ecx + 28]
    faddp st(1)
    fld dword ptr [eax + 8]
    fmul dword ptr [ecx + 24]
    faddp st(1)
    fstp dword ptr [edx + 32]
    ret
FUN_1005a430 ENDP
END
