.686
.MODEL FLAT, C
EXTRN g_1019BC78:DWORD
EXTRN g_1019BDA0:DWORD
EXTRN g_1019BDE4:DWORD
.CODE
FUN_10040d40 PROC
    push ecx
    fld dword ptr [edx]
    fcomp dword ptr [g_1019BDE4]
    fnstsw ax
    test ah, 5
    jp L0
    fld dword ptr [edx + 4]
    fcomp dword ptr [g_1019BDE4]
    fnstsw ax
    test ah, 5
    jp L0
    mov eax, dword ptr [esi + 100]
    mov dword ptr [ecx], eax
    xor eax, eax
    mov dword ptr [ecx + 4], eax
    fld dword ptr [esi + 104]
    mov dword ptr [ecx + 8], eax
    fstp dword ptr [ecx + 12]
    pop ecx
    ret
L0:
    fld dword ptr [edx + 4]
    fld dword ptr [edx]
    fmul dword ptr [g_1019BDA0]
    fxch st(1)
    fstp dword ptr [ecx]
    fstp dword ptr [ecx + 4]
    fld dword ptr [edx + 4]
    mov edx, dword ptr [edx]
    fstp dword ptr [ecx + 12]
    mov dword ptr [ecx + 8], edx
    fld dword ptr [ecx + 4]
    fld dword ptr [ecx]
    fld st(0)
    fmul st(1)
    fld st(2)
    fmul st(3)
    faddp st(1)
    fsqrt
    fstp st(2)
    fstp st(0)
    fld dword ptr [g_1019BC78]
    fdiv st(1)
    fst dword ptr [esp]
    fmul dword ptr [esi + 100]
    fld st(0)
    fmul dword ptr [ecx]
    fstp dword ptr [ecx]
    fmul dword ptr [ecx + 4]
    fstp dword ptr [ecx + 4]
    fcomp dword ptr [esi + 100]
    fnstsw ax
    test ah, 5
    jp L1
    fld dword ptr [esp]
    fmul dword ptr [esi + 100]
    fld st(0)
    fmul dword ptr [ecx + 8]
    fstp dword ptr [ecx + 8]
    fmul dword ptr [ecx + 12]
    fstp dword ptr [ecx + 12]
L1:
    pop ecx
    ret
FUN_10040d40 ENDP
END
