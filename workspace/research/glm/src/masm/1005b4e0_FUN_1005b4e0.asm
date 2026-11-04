.686
.MODEL FLAT, C
.CODE
FUN_1005b4e0 PROC
    sub esp, 8
    fld dword ptr [eax + 12]
    fmul dword ptr [ecx + 4]
    fld dword ptr [eax + 24]
    fmul dword ptr [ecx + 8]
    faddp st(1)
    fld dword ptr [ecx]
    fmul dword ptr [eax]
    faddp st(1)
    fadd dword ptr [eax + 36]
    fstp dword ptr [esp]
    fld dword ptr [eax + 16]
    fmul dword ptr [ecx + 4]
    fld dword ptr [eax + 4]
    fmul dword ptr [ecx]
    faddp st(1)
    fld dword ptr [eax + 28]
    fmul dword ptr [ecx + 8]
    faddp st(1)
    fadd dword ptr [eax + 40]
    fstp dword ptr [esp + 4]
    fld dword ptr [eax + 20]
    mov edx, dword ptr [esp + 4]
    fmul dword ptr [ecx + 4]
    fld dword ptr [eax + 8]
    fmul dword ptr [ecx]
    faddp st(1)
    fld dword ptr [eax + 32]
    fmul dword ptr [ecx + 8]
    faddp st(1)
    fadd dword ptr [eax + 44]
    mov eax, dword ptr [esp]
    mov dword ptr [ecx], eax
    mov dword ptr [ecx + 4], edx
    fstp dword ptr [ecx + 8]
    add esp, 8
    ret
FUN_1005b4e0 ENDP
END
