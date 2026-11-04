; FUN_1005b340 @ 0x1005b340 — auto-synthesized
.CODE
FUN_1005b340 PROC
    fld dword ptr [eax + 0x30]
    fmul dword ptr [ecx + 0xc]
    fld dword ptr [eax + 0x10]
    fmul dword ptr [ecx + 4]
    faddp st(1)
    fld dword ptr [eax + 0x20]
    fmul dword ptr [ecx + 8]
    faddp st(1)
    fld dword ptr [ecx]
    fmul dword ptr [eax]
    faddp st(1)
    fstp dword ptr [edx]
    fld dword ptr [eax + 4]
    fmul dword ptr [ecx]
    fld dword ptr [eax + 0x34]
    fmul dword ptr [ecx + 0xc]
    faddp st(1)
    fld dword ptr [eax + 0x14]
    fmul dword ptr [ecx + 4]
    faddp st(1)
    fld dword ptr [eax + 0x24]
    fmul dword ptr [ecx + 8]
    faddp st(1)
    fstp dword ptr [edx + 4]
    fld dword ptr [eax + 8]
    fmul dword ptr [ecx]
    fld dword ptr [eax + 0x38]
    fmul dword ptr [ecx + 0xc]
    faddp st(1)
    fld dword ptr [eax + 0x18]
    fmul dword ptr [ecx + 4]
    faddp st(1)
    fld dword ptr [eax + 0x28]
    fmul dword ptr [ecx + 8]
    faddp st(1)
    fstp dword ptr [edx + 8]
    fld dword ptr [eax + 0xc]
    fmul dword ptr [ecx]
    fld dword ptr [eax + 0x3c]
    fmul dword ptr [ecx + 0xc]
    faddp st(1)
    fld dword ptr [eax + 0x1c]
    fmul dword ptr [ecx + 4]
    faddp st(1)
    fld dword ptr [eax + 0x2c]
    fmul dword ptr [ecx + 8]
    faddp st(1)
    fstp dword ptr [edx + 0xc]
    ret
FUN_1005b340 ENDP
END