.686
.MODEL FLAT, C
EXTRN sub_10040E6A:PROC
EXTRN EXTRN g_1019BC78:DWORD:DWORD
EXTRN EXTRN g_1019BDA0:DWORD:DWORD
EXTRN EXTRN g_1019BDE4:DWORD:DWORD
.CODE
FUN_10040d40 PROC
    push push ecx
    fld fld dword ptr [edx]
    fcomp fcomp dword ptr [g_1019BDE4]
    fnstsw fnstsw ax
    test test ah, 5
    jp L0
    fld fld dword ptr [edx + 4]
    fcomp fcomp dword ptr [g_1019BDE4]
    fnstsw fnstsw ax
    test test ah, 5
    jp L1
    mov mov eax, dword ptr [esi + 100]
    mov mov dword ptr [ecx], eax
    xor xor eax, eax
    mov mov dword ptr [ecx + 4], eax
    fld fld dword ptr [esi + 104]
    mov mov dword ptr [ecx + 8], eax
    fstp fstp dword ptr [ecx + 12]
    pop pop ecx
    ret ret
    fld fld dword ptr [edx + 4]
    fld fld dword ptr [edx]
    fmul fmul dword ptr [g_1019BDA0]
    fxch fxch st(1)
    fstp fstp dword ptr [ecx]
    fstp fstp dword ptr [ecx + 4]
    fld fld dword ptr [edx + 4]
    mov mov edx, dword ptr [edx]
    fstp fstp dword ptr [ecx + 12]
    mov mov dword ptr [ecx + 8], edx
    fld fld dword ptr [ecx + 4]
L1:
    fld fld dword ptr [ecx]
    fld fld st(0)
    fmul fmul st(1)
    fld fld st(2)
    fmul fmul st(3)
    faddp faddp st(1)
    fsqrt fsqrt
    fstp fstp st(2)
    fstp fstp st(0)
    fld fld dword ptr [g_1019BC78]
    fdiv fdiv st(1)
    fst fst dword ptr [esp]
    fmul fmul dword ptr [esi + 100]
    fld fld st(0)
    fmul fmul dword ptr [ecx]
    fstp fstp dword ptr [ecx]
    fmul fmul dword ptr [ecx + 4]
    fstp fstp dword ptr [ecx + 4]
    fcomp fcomp dword ptr [esi + 100]
    fnstsw fnstsw ax
    test test ah, 5
    jp sub_10040E6A
    fld fld dword ptr [esp]
    fmul fmul dword ptr [esi + 100]
    fld fld st(0)
    fmul fmul dword ptr [ecx + 8]
    fstp fstp dword ptr [ecx + 8]
    fmul fmul dword ptr [ecx + 12]
    fstp fstp dword ptr [ecx + 12]
    pop pop ecx
    ret ret
FUN_10040d40 ENDP
END
