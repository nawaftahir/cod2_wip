.686
.MODEL FLAT, C
EXTRN EXTRN g_1019BC78:DWORD:DWORD
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_1019BCB0:DWORD:DWORD
EXTRN EXTRN g_1072DDC8:DWORD:DWORD
.CODE
FUN_1003f9b0 PROC
    sub sub esp, 24
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
    fst fst dword ptr [esp + 8]
    fcomp fcomp dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 65
    jp L0
    xor xor al, al
    add add esp, 24
    ret ret
    fld fld dword ptr [esi]
    mov mov eax, dword ptr [esi + 4]
    fchs fchs
    mov mov dword ptr [esp], eax
    fld fld st(0)
    mov mov al, 1
    fmul fmul dword ptr [ecx + 24]
    fadd fadd dword ptr [ecx]
    fld fld st(1)
    fmul fmul dword ptr [ecx + 28]
    fadd fadd dword ptr [ecx + 4]
    fstp fstp dword ptr [esp + 16]
    fxch fxch st(1)
    fmul fmul dword ptr [ecx + 32]
    fadd fadd dword ptr [ecx + 8]
    fstp fstp dword ptr [esp + 20]
    fld fld dword ptr [esp]
    fmul fmul dword ptr [ecx + 36]
    faddp faddp st(1)
    fld fld dword ptr [esp]
    fmul fmul dword ptr [ecx + 40]
    fadd fadd dword ptr [esp + 16]
    fld fld dword ptr [esp]
    fmul fmul dword ptr [ecx + 44]
    fadd fadd dword ptr [esp + 20]
    fld fld st(0)
    fmul fmul dword ptr [ecx + 0E8h]
    fld fld st(2)
    fmul fmul dword ptr [ecx + 0D8h]
    faddp faddp st(1)
    fld fld st(3)
    fmul fmul dword ptr [ecx + 0C8h]
    faddp faddp st(1)
    fadd fadd dword ptr [ecx + 0F8h]
    fstp fstp dword ptr [esp]
    fmul fmul dword ptr [ecx + 0ECh]
    fxch fxch st(2)
    fmul fmul dword ptr [ecx + 0CCh]
    faddp faddp st(2)
    fmul fmul dword ptr [ecx + 0DCh]
    faddp faddp st(1)
    fadd fadd dword ptr [ecx + 0FCh]
    fld fld dword ptr [g_1019BC78]
    fdiv fdiv dword ptr [esp + 8]
    fld fld dword ptr [esp]
    fmul fmul st(1)
    fstp fstp dword ptr [esp]
    fmulp fmulp st(1)
    fld fld dword ptr [esp]
    fmul fmul dword ptr [g_1019BCB0]
    fstp fstp dword ptr [edx]
    fmul fmul dword ptr [g_1019BCB0]
    fstp fstp dword ptr [edx + 4]
    add add esp, 24
    ret ret
FUN_1003f9b0 ENDP
END
