; FUN_10040d40 @ 0x10040d40 — auto-synthesized
    EXTRN g_1019bc78:DWORD
    EXTRN g_1019bda0:DWORD
    EXTRN g_1019bde4:DWORD
.CODE
FUN_10040d40 PROC
    push ecx
    fld dword ptr [edx]
    fcomp dword ptr [g_1019bde4]
    fnstsw ax
    test ah, 5
    jp L0
    fld dword ptr [edx + 4]
    fcomp dword ptr [g_1019bde4]
    fnstsw ax
    test ah, 5
    jp L0
    mov eax, dword ptr [esi + 0x64]
    mov dword ptr [ecx], eax
    xor eax, eax
    mov dword ptr [ecx + 4], eax
    fld dword ptr [esi + 0x68]
    mov dword ptr [ecx + 8], eax
    fstp dword ptr [ecx + 0xc]
    pop ecx
    ret
    fld dword ptr [edx + 4]
    fld dword ptr [edx]
    fmul dword ptr [g_1019bda0]
    fxch st(1)
    fstp dword ptr [ecx]
    fstp dword ptr [ecx + 4]
    fld dword ptr [edx + 4]
    mov edx, dword ptr [edx]
    fstp dword ptr [ecx + 0xc]
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
    fld dword ptr [g_1019bc78]
    fdiv st(1)
    fst dword ptr [esp]
    fmul dword ptr [esi + 0x64]
    fld st(0)
    fmul dword ptr [ecx]
    fstp dword ptr [ecx]
    fmul dword ptr [ecx + 4]
    fstp dword ptr [ecx + 4]
    fcomp dword ptr [esi + 0x64]
    fnstsw ax
    test ah, 5
    jp L1
    fld dword ptr [esp]
    fmul dword ptr [esi + 0x64]
    fld st(0)
    fmul dword ptr [ecx + 8]
    fstp dword ptr [ecx + 8]
    fmul dword ptr [ecx + 0xc]
    fstp dword ptr [ecx + 0xc]
    pop ecx
    ret
FUN_10040d40 ENDP
END