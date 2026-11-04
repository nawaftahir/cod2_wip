; FUN_1003f930 @ 0x1003f930 — auto-synthesized
    EXTRN g_1019bc84:DWORD
    EXTRN g_1072ddc8:DWORD
.CODE
FUN_1003f930 PROC
    mov ecx, dword ptr [g_1072ddc8]
    fld dword ptr [ecx + 0xf4]
    fmul dword ptr [eax + 8]
    fld dword ptr [ecx + 0xe4]
    fmul dword ptr [eax + 4]
    faddp st(1)
    fld dword ptr [ecx + 0xd4]
    fmul dword ptr [eax]
    faddp st(1)
    fadd dword ptr [ecx + 0x104]
    fcom dword ptr [g_1019bc84]
    fnstsw ax
    test ah, 0x41
    jp L0
    xor al, al
    fstp st(0)
    ret
    fld dword ptr [esp + 4]
    mov eax, dword ptr [esp + 8]
    fadd st(0), st(0)
    fld st(0)
    fmul dword ptr [ecx + 0x118]
    fld st(1)
    fmul dword ptr [ecx + 0x11c]
    fxch st(2)
    fmul dword ptr [ecx + 0x120]
    fxch st(2)
    fmul dword ptr [ecx + 0x28]
    fxch st(2)
    fmul dword ptr [ecx + 0x2c]
    faddp st(2)
    fmul dword ptr [ecx + 0x24]
    faddp st(1)
    fmul st(1)
    fstp dword ptr [eax]
    mov al, 1
    fstp st(0)
    ret
FUN_1003f930 ENDP
END