.686
.MODEL FLAT, C
.CODE
FUN_1005a190 PROC
    sub esp, 44
    fld dword ptr [ecx]
    fsub dword ptr [eax]
    fstp dword ptr [esp + 8]
    fld dword ptr [ecx + 4]
    fsub dword ptr [eax + 4]
    fstp dword ptr [esp + 12]
    fld dword ptr [ecx + 8]
    fsub dword ptr [eax + 8]
    fstp dword ptr [esp + 16]
    fld dword ptr [edx]
    fsub dword ptr [eax]
    fstp dword ptr [esp + 20]
    fld dword ptr [edx + 4]
    fsub dword ptr [eax + 4]
    fstp dword ptr [esp + 24]
    fld dword ptr [edx + 8]
    fsub dword ptr [eax + 8]
    fstp dword ptr [esp + 28]
    fld dword ptr [esp + 28]
    fmul dword ptr [esp + 16]
    fld dword ptr [esp + 24]
    fmul dword ptr [esp + 12]
    faddp st(1)
    fld dword ptr [esp + 20]
    fmul dword ptr [esp + 8]
    faddp st(1)
    fstp dword ptr [esp]
    fld dword ptr [esp + 16]
    fmul dword ptr [esp + 16]
    fld dword ptr [esp + 12]
    fmul dword ptr [esp + 12]
    faddp st(1)
    fld dword ptr [esp + 8]
    fmul dword ptr [esp + 8]
    faddp st(1)
    fstp dword ptr [esp + 4]
    fld dword ptr [esp]
    fdiv dword ptr [esp + 4]
    fchs
    fstp dword ptr [esp]
    fld dword ptr [esp + 8]
    fmul dword ptr [esp]
    fadd dword ptr [esp + 20]
    fstp dword ptr [esp + 32]
    fld dword ptr [esp + 12]
    fmul dword ptr [esp]
    fadd dword ptr [esp + 24]
    fstp dword ptr [esp + 36]
    fld dword ptr [esp + 16]
    fmul dword ptr [esp]
    fadd dword ptr [esp + 28]
    fstp dword ptr [esp + 40]
    fld dword ptr [esp + 40]
    fmul dword ptr [esp + 40]
    fld dword ptr [esp + 36]
    fmul dword ptr [esp + 36]
    faddp st(1)
    fld dword ptr [esp + 32]
    fmul dword ptr [esp + 32]
    faddp st(1)
    add esp, 44
    ret
FUN_1005a190 ENDP
END
