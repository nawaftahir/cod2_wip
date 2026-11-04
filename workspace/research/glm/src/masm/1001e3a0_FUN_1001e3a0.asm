.686
.MODEL FLAT, C
.CODE
FUN_1001e3a0 PROC
    fld dword ptr [ecx]
    fmul dword ptr [eax]
    fld dword ptr [ecx + 4]
    fmul dword ptr [eax + 16]
    faddp st(1)
    fld dword ptr [ecx + 8]
    fmul dword ptr [eax + 32]
    faddp st(1)
    fstp dword ptr [esi + 12]
    fld dword ptr [ecx]
    fmul dword ptr [eax + 4]
    fld dword ptr [eax + 36]
    fmul dword ptr [ecx + 8]
    faddp st(1)
    fld dword ptr [ecx + 4]
    fmul dword ptr [eax + 20]
    faddp st(1)
    fstp dword ptr [esi + 16]
    fld dword ptr [ecx]
    fmul dword ptr [eax + 8]
    fld dword ptr [eax + 40]
    fmul dword ptr [ecx + 8]
    faddp st(1)
    fld dword ptr [eax + 24]
    fmul dword ptr [ecx + 4]
    faddp st(1)
    fstp dword ptr [esi + 20]
    fld dword ptr [edx + 8]
    fmul dword ptr [eax + 32]
    fld dword ptr [edx + 4]
    fmul dword ptr [eax + 16]
    faddp st(1)
    fld dword ptr [edx]
    fmul dword ptr [eax]
    faddp st(1)
    fadd dword ptr [eax + 48]
    fstp dword ptr [esi]
    fld dword ptr [edx]
    fmul dword ptr [eax + 4]
    fld dword ptr [edx + 8]
    fmul dword ptr [eax + 36]
    faddp st(1)
    fld dword ptr [edx + 4]
    fmul dword ptr [eax + 20]
    faddp st(1)
    fadd dword ptr [eax + 52]
    fstp dword ptr [esi + 4]
    fld dword ptr [edx]
    fmul dword ptr [eax + 8]
    fld dword ptr [edx + 8]
    fmul dword ptr [eax + 40]
    faddp st(1)
    fld dword ptr [edx + 4]
    fmul dword ptr [eax + 24]
    faddp st(1)
    fadd dword ptr [eax + 56]
    fstp dword ptr [esi + 8]
    ret
FUN_1001e3a0 ENDP
END
