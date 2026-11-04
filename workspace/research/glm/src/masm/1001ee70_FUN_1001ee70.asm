.686
.MODEL FLAT, C
.CODE
FUN_1001ee70 PROC
    sub esp, 36
    fld dword ptr [esp + 44]
    mov eax, dword ptr [esp + 40]
    fmul dword ptr [edx]
    fld dword ptr [esp + 44]
    fmul dword ptr [edx + 4]
    fld dword ptr [esp + 44]
    fmul dword ptr [edx + 8]
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 44]
    fmul dword ptr [edx + 12]
    fld dword ptr [esp + 44]
    fmul dword ptr [edx + 16]
    fstp dword ptr [esp + 16]
    fld dword ptr [esp + 44]
    fmul dword ptr [edx + 20]
    fstp dword ptr [esp + 20]
    fld dword ptr [esp + 44]
    fmul dword ptr [edx + 24]
    fld dword ptr [esp + 44]
    fmul dword ptr [edx + 28]
    fstp dword ptr [esp + 28]
    fld dword ptr [esp + 44]
    fmul dword ptr [edx + 32]
    fstp dword ptr [esp + 32]
    fld st(3)
    fmul dword ptr [eax]
    fld st(1)
    fmul dword ptr [eax + 8]
    faddp st(1)
    fld st(2)
    fmul dword ptr [eax + 4]
    faddp st(1)
    fstp dword ptr [ecx]
    fld st(2)
    fmul dword ptr [eax]
    fld dword ptr [esp + 28]
    fmul dword ptr [eax + 8]
    faddp st(1)
    fld dword ptr [esp + 16]
    fmul dword ptr [eax + 4]
    faddp st(1)
    fstp dword ptr [ecx + 4]
    fld dword ptr [esp + 8]
    fmul dword ptr [eax]
    fld dword ptr [esp + 32]
    fmul dword ptr [eax + 8]
    faddp st(1)
    fld dword ptr [esp + 20]
    fmul dword ptr [eax + 4]
    faddp st(1)
    fstp dword ptr [ecx + 8]
    fld st(3)
    fmul dword ptr [eax + 16]
    fld st(1)
    fmul dword ptr [eax + 24]
    faddp st(1)
    fld st(2)
    fmul dword ptr [eax + 20]
    faddp st(1)
    fstp dword ptr [ecx + 12]
    fld st(2)
    fmul dword ptr [eax + 16]
    fld dword ptr [esp + 28]
    fmul dword ptr [eax + 24]
    faddp st(1)
    fld dword ptr [esp + 16]
    fmul dword ptr [eax + 20]
    faddp st(1)
    fstp dword ptr [ecx + 16]
    fld dword ptr [esp + 8]
    fmul dword ptr [eax + 16]
    fld dword ptr [esp + 32]
    fmul dword ptr [eax + 24]
    faddp st(1)
    fld dword ptr [esp + 20]
    fmul dword ptr [eax + 20]
    faddp st(1)
    fstp dword ptr [ecx + 20]
    fld st(0)
    fmul dword ptr [eax + 40]
    fld st(2)
    fmul dword ptr [eax + 36]
    faddp st(1)
    fld st(4)
    fmul dword ptr [eax + 32]
    faddp st(1)
    fstp dword ptr [ecx + 24]
    fld dword ptr [esp + 28]
    fmul dword ptr [eax + 40]
    fld dword ptr [esp + 16]
    fmul dword ptr [eax + 36]
    faddp st(1)
    fld st(3)
    fmul dword ptr [eax + 32]
    faddp st(1)
    fstp dword ptr [ecx + 28]
    fld dword ptr [esp + 32]
    fmul dword ptr [eax + 40]
    fld dword ptr [esp + 20]
    fmul dword ptr [eax + 36]
    faddp st(1)
    fld dword ptr [esp + 8]
    fmul dword ptr [eax + 32]
    faddp st(1)
    fstp dword ptr [ecx + 32]
    fxch st(3)
    fmul dword ptr [eax + 48]
    fxch st(3)
    fmul dword ptr [eax + 56]
    faddp st(3)
    fmul dword ptr [eax + 52]
    faddp st(2)
    fxch st(1)
    fadd dword ptr [esi]
    fstp dword ptr [ecx + 36]
    fmul dword ptr [eax + 48]
    fld dword ptr [esp + 28]
    fmul dword ptr [eax + 56]
    faddp st(1)
    fld dword ptr [esp + 16]
    fmul dword ptr [eax + 52]
    faddp st(1)
    fadd dword ptr [esi + 4]
    fstp dword ptr [ecx + 40]
    fld dword ptr [esp + 8]
    fmul dword ptr [eax + 48]
    fld dword ptr [esp + 32]
    fmul dword ptr [eax + 56]
    faddp st(1)
    fld dword ptr [esp + 20]
    fmul dword ptr [eax + 52]
    faddp st(1)
    fadd dword ptr [esi + 8]
    fstp dword ptr [ecx + 44]
    add esp, 36
    ret
FUN_1001ee70 ENDP
END
