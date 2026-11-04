; FUN_1002c7b0 @ 0x1002c7b0 — auto-synthesized
    EXTRN g_1019bc78:DWORD
    EXTRN g_1019bc84:DWORD
    EXTRN g_1019bcac:DWORD
    EXTRN g_1019bd80:DWORD
.CODE
FUN_1002c7b0 PROC
    sub esp, 0x18
    push esi
    mov esi, eax
    mov eax, dword ptr [edx + 0xc]
    imul eax, dword ptr [edx + 0x10]
    mov dword ptr [esp + 4], eax
    xor ecx, ecx
    test eax, eax
    fild dword ptr [esp + 4]
    jle L0
    fld dword ptr [g_1019bc78]
    fdiv st(1)
    fstp dword ptr [esp + 4]
    fstp st(0)
    fld qword ptr [g_1019bd80]
    fstp qword ptr [esp + 0x10]
    fld dword ptr [edi + ecx*8 + 4]
    fld dword ptr [edi + ecx*8]
    fld st(1)
    fmulp st(2)
    fld st(0)
    fmul st(1)
    faddp st(2)
    fxch st(1)
    fsqrt
    fstp st(1)
    fmul dword ptr [esp + 4]
    fld dword ptr [g_1019bc78]
    fsubr st(1)
    fcomp dword ptr [g_1019bc84]
    fnstsw ax
    test ah, 1
    jne L1
    fstp st(0)
    fld dword ptr [g_1019bc78]
    fmul dword ptr [g_1019bcac]
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 8]
    fadd qword ptr [esp + 0x10]
    fistp dword ptr [esp + 0xc]
    mov al, byte ptr [esp + 0xc]
    mov byte ptr [esi], al
    mov eax, dword ptr [edx + 0xc]
    imul eax, dword ptr [edx + 0x10]
    inc esi
    inc ecx
    cmp ecx, eax
    jl L2
    pop esi
    add esp, 0x18
    ret
    fstp st(0)
    pop esi
    add esp, 0x18
    ret
FUN_1002c7b0 ENDP
END