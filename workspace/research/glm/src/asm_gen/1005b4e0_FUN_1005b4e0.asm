; FUN_1005b4e0 @ 0x1005b4e0 — auto-synthesized
.CODE
FUN_1005b4e0 PROC
    sub esp, 8
    fld dword ptr [eax + 0xc]
    fmul dword ptr [ecx + 4]
    fld dword ptr [eax + 0x18]
    fmul dword ptr [ecx + 8]
    faddp st(1)
    fld dword ptr [ecx]
    fmul dword ptr [eax]
    faddp st(1)
    fadd dword ptr [eax + 0x24]
    fstp dword ptr [esp]
    fld dword ptr [eax + 0x10]
    fmul dword ptr [ecx + 4]
    fld dword ptr [eax + 4]
    fmul dword ptr [ecx]
    faddp st(1)
    fld dword ptr [eax + 0x1c]
    fmul dword ptr [ecx + 8]
    faddp st(1)
    fadd dword ptr [eax + 0x28]
    fstp dword ptr [esp + 4]
    fld dword ptr [eax + 0x14]
    mov edx, dword ptr [esp + 4]
    fmul dword ptr [ecx + 4]
    fld dword ptr [eax + 8]
    fmul dword ptr [ecx]
    faddp st(1)
    fld dword ptr [eax + 0x20]
    fmul dword ptr [ecx + 8]
    faddp st(1)
    fadd dword ptr [eax + 0x2c]
    mov eax, dword ptr [esp]
    mov dword ptr [ecx], eax
    mov dword ptr [ecx + 4], edx
    fstp dword ptr [ecx + 8]
    add esp, 8
    ret
FUN_1005b4e0 ENDP
END