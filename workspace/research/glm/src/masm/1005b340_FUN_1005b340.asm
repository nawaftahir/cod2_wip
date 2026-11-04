.686
.MODEL FLAT, C
.CODE
FUN_1005b340 PROC
    fld dword ptr [eax + 48]
    fmul dword ptr [ecx + 12]
    fld dword ptr [eax + 16]
    fmul dword ptr [ecx + 4]
    faddp st(1)
    fld dword ptr [eax + 32]
    fmul dword ptr [ecx + 8]
    faddp st(1)
    fld dword ptr [ecx]
    fmul dword ptr [eax]
    faddp st(1)
    fstp dword ptr [edx]
    fld dword ptr [eax + 4]
    fmul dword ptr [ecx]
    fld dword ptr [eax + 52]
    fmul dword ptr [ecx + 12]
    faddp st(1)
    fld dword ptr [eax + 20]
    fmul dword ptr [ecx + 4]
    faddp st(1)
    fld dword ptr [eax + 36]
    fmul dword ptr [ecx + 8]
    faddp st(1)
    fstp dword ptr [edx + 4]
    fld dword ptr [eax + 8]
    fmul dword ptr [ecx]
    fld dword ptr [eax + 56]
    fmul dword ptr [ecx + 12]
    faddp st(1)
    fld dword ptr [eax + 24]
    fmul dword ptr [ecx + 4]
    faddp st(1)
    fld dword ptr [eax + 40]
    fmul dword ptr [ecx + 8]
    faddp st(1)
    fstp dword ptr [edx + 8]
    fld dword ptr [eax + 12]
    fmul dword ptr [ecx]
    fld dword ptr [eax + 60]
    fmul dword ptr [ecx + 12]
    faddp st(1)
    fld dword ptr [eax + 28]
    fmul dword ptr [ecx + 4]
    faddp st(1)
    fld dword ptr [eax + 44]
    fmul dword ptr [ecx + 8]
    faddp st(1)
    fstp dword ptr [edx + 12]
    ret
FUN_1005b340 ENDP
END
