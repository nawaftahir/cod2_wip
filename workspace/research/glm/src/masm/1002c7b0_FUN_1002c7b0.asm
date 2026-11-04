.686
.MODEL FLAT, C
EXTRN g_1019BC78:DWORD
EXTRN g_1019BC84:DWORD
EXTRN g_1019BCAC:DWORD
EXTRN g_1019BD80:DWORD
.CODE
FUN_1002c7b0 PROC
    sub esp, 24
    push esi
    mov esi, eax
    mov eax, dword ptr [edx + 12]
    imul eax, dword ptr [edx + 16]
    mov dword ptr [esp + 4], eax
    xor ecx, ecx
    test eax, eax
    fild dword ptr [esp + 4]
    jle L2
    fld dword ptr [g_1019BC78]
    fdiv st(1)
    fstp dword ptr [esp + 4]
    fstp st(0)
    fld qword ptr [g_1019BD80]
    fstp qword ptr [esp + 16]
L0:
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
    fld dword ptr [g_1019BC78]
    fsubr st(1)
    fcomp dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 1
    jne L1
    fstp st(0)
    fld dword ptr [g_1019BC78]
L1:
    fmul dword ptr [g_1019BCAC]
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 8]
    fadd qword ptr [esp + 16]
    fistp dword ptr [esp + 12]
    mov al, byte ptr [esp + 12]
    mov byte ptr [esi], al
    mov eax, dword ptr [edx + 12]
    imul eax, dword ptr [edx + 16]
    inc esi
    inc ecx
    cmp ecx, eax
    jl L0
    pop esi
    add esp, 24
    ret
L2:
    fstp st(0)
    pop esi
    add esp, 24
    ret
FUN_1002c7b0 ENDP
END
