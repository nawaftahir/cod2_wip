.686
.MODEL FLAT, C
EXTRN g_1019BC78:DWORD
EXTRN g_1019BC84:DWORD
EXTRN g_1019BCB0:DWORD
EXTRN g_1072DDC8:DWORD
.CODE
FUN_1003f9b0 PROC
    sub esp, 24
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
    fst dword ptr [esp + 8]
    fcomp dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 65
    jp L0
    xor al, al
    add esp, 24
    ret
L0:
    fld dword ptr [esi]
    mov eax, dword ptr [esi + 4]
    fchs
    mov dword ptr [esp], eax
    fld st(0)
    mov al, 1
    fmul dword ptr [ecx + 24]
    fadd dword ptr [ecx]
    fld st(1)
    fmul dword ptr [ecx + 28]
    fadd dword ptr [ecx + 4]
    fstp dword ptr [esp + 16]
    fxch st(1)
    fmul dword ptr [ecx + 32]
    fadd dword ptr [ecx + 8]
    fstp dword ptr [esp + 20]
    fld dword ptr [esp]
    fmul dword ptr [ecx + 36]
    faddp st(1)
    fld dword ptr [esp]
    fmul dword ptr [ecx + 40]
    fadd dword ptr [esp + 16]
    fld dword ptr [esp]
    fmul dword ptr [ecx + 44]
    fadd dword ptr [esp + 20]
    fld st(0)
    fmul dword ptr [ecx + 0000000E8h]
    fld st(2)
    fmul dword ptr [ecx + 0000000D8h]
    faddp st(1)
    fld st(3)
    fmul dword ptr [ecx + 0000000C8h]
    faddp st(1)
    fadd dword ptr [ecx + 0000000F8h]
    fstp dword ptr [esp]
    fmul dword ptr [ecx + 0000000ECh]
    fxch st(2)
    fmul dword ptr [ecx + 0000000CCh]
    faddp st(2)
    fmul dword ptr [ecx + 0000000DCh]
    faddp st(1)
    fadd dword ptr [ecx + 0000000FCh]
    fld dword ptr [g_1019BC78]
    fdiv dword ptr [esp + 8]
    fld dword ptr [esp]
    fmul st(1)
    fstp dword ptr [esp]
    fmulp st(1)
    fld dword ptr [esp]
    fmul dword ptr [g_1019BCB0]
    fstp dword ptr [edx]
    fmul dword ptr [g_1019BCB0]
    fstp dword ptr [edx + 4]
    add esp, 24
    ret
FUN_1003f9b0 ENDP
END
