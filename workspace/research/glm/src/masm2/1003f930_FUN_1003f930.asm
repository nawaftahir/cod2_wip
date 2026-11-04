.686
.MODEL FLAT, C
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_1072DDC8:DWORD:DWORD
.CODE
FUN_1003f930 PROC
    mov mov ecx, dword ptr [g_1072DDC8]
    fld fld dword ptr [ecx + 0F4h]
    fmul fmul dword ptr [eax + 8]
    fld fld dword ptr [ecx + 0E4h]
    fmul fmul dword ptr [eax + 4]
    faddp faddp st(1)
    fld fld dword ptr [ecx + 0D4h]
    fmul fmul dword ptr [eax]
    faddp faddp st(1)
    fadd fadd dword ptr [ecx + 0104h]
    fcom fcom dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 65
    jp L0
    xor xor al, al
    fstp fstp st(0)
    ret ret
    fld fld dword ptr [esp + 4]
    mov mov eax, dword ptr [esp + 8]
    fadd fadd st(0), st(0)
    fld fld st(0)
    fmul fmul dword ptr [ecx + 0118h]
    fld fld st(1)
    fmul fmul dword ptr [ecx + 011Ch]
    fxch fxch st(2)
    fmul fmul dword ptr [ecx + 0120h]
    fxch fxch st(2)
    fmul fmul dword ptr [ecx + 40]
    fxch fxch st(2)
    fmul fmul dword ptr [ecx + 44]
    faddp faddp st(2)
    fmul fmul dword ptr [ecx + 36]
    faddp faddp st(1)
    fmul fmul st(1)
    fstp fstp dword ptr [eax]
L0:
    mov mov al, 1
    fstp fstp st(0)
    ret ret
FUN_1003f930 ENDP
END
