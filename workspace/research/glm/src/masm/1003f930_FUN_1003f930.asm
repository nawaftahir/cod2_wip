.686
.MODEL FLAT, C
EXTRN g_1019BC84:DWORD
EXTRN g_1072DDC8:DWORD
.CODE
FUN_1003f930 PROC
    mov ecx, dword ptr [g_1072DDC8]
    fld dword ptr [ecx + 0000000F4h]
    fmul dword ptr [eax + 8]
    fld dword ptr [ecx + 0000000E4h]
    fmul dword ptr [eax + 4]
    faddp st(1)
    fld dword ptr [ecx + 0000000D4h]
    fmul dword ptr [eax]
    faddp st(1)
    fadd dword ptr [ecx + 000000104h]
    fcom dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 65
    jp L0
    xor al, al
    fstp st(0)
    ret
L0:
    fld dword ptr [esp + 4]
    mov eax, dword ptr [esp + 8]
    fadd st(0), st(0)
    fld st(0)
    fmul dword ptr [ecx + 000000118h]
    fld st(1)
    fmul dword ptr [ecx + 00000011Ch]
    fxch st(2)
    fmul dword ptr [ecx + 000000120h]
    fxch st(2)
    fmul dword ptr [ecx + 40]
    fxch st(2)
    fmul dword ptr [ecx + 44]
    faddp st(2)
    fmul dword ptr [ecx + 36]
    faddp st(1)
    fmul st(1)
    fstp dword ptr [eax]
    mov al, 1
    fstp st(0)
    ret
FUN_1003f930 ENDP
END
