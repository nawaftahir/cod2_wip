; FUN_1001e3a0 @ 0x1001e3a0 — auto-synthesized
.CODE
FUN_1001e3a0 PROC
    fld dword ptr [ecx]
    fmul dword ptr [eax]
    fld dword ptr [ecx + 4]
    fmul dword ptr [eax + 0x10]
    faddp st(1)
    fld dword ptr [ecx + 8]
    fmul dword ptr [eax + 0x20]
    faddp st(1)
    fstp dword ptr [esi + 0xc]
    fld dword ptr [ecx]
    fmul dword ptr [eax + 4]
    fld dword ptr [eax + 0x24]
    fmul dword ptr [ecx + 8]
    faddp st(1)
    fld dword ptr [ecx + 4]
    fmul dword ptr [eax + 0x14]
    faddp st(1)
    fstp dword ptr [esi + 0x10]
    fld dword ptr [ecx]
    fmul dword ptr [eax + 8]
    fld dword ptr [eax + 0x28]
    fmul dword ptr [ecx + 8]
    faddp st(1)
    fld dword ptr [eax + 0x18]
    fmul dword ptr [ecx + 4]
    faddp st(1)
    fstp dword ptr [esi + 0x14]
    fld dword ptr [edx + 8]
    fmul dword ptr [eax + 0x20]
    fld dword ptr [edx + 4]
    fmul dword ptr [eax + 0x10]
    faddp st(1)
    fld dword ptr [edx]
    fmul dword ptr [eax]
    faddp st(1)
    fadd dword ptr [eax + 0x30]
    fstp dword ptr [esi]
    fld dword ptr [edx]
    fmul dword ptr [eax + 4]
    fld dword ptr [edx + 8]
    fmul dword ptr [eax + 0x24]
    faddp st(1)
    fld dword ptr [edx + 4]
    fmul dword ptr [eax + 0x14]
    faddp st(1)
    fadd dword ptr [eax + 0x34]
    fstp dword ptr [esi + 4]
    fld dword ptr [edx]
    fmul dword ptr [eax + 8]
    fld dword ptr [edx + 8]
    fmul dword ptr [eax + 0x28]
    faddp st(1)
    fld dword ptr [edx + 4]
    fmul dword ptr [eax + 0x18]
    faddp st(1)
    fadd dword ptr [eax + 0x38]
    fstp dword ptr [esi + 8]
    ret
FUN_1001e3a0 ENDP
END