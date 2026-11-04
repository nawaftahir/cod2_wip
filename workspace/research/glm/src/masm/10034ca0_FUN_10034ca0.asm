.686
.MODEL FLAT, C
EXTRN g_1019BC84:DWORD
EXTRN g_1019BCB0:DWORD
EXTRN g_1019BD80:DWORD
EXTRN g_1019BDE4:DWORD
EXTRN g_1019BDE8:DWORD
EXTRN g_1019BDEC:DWORD
.CODE
FUN_10034ca0 PROC
    sub esp, 12
    fild dword ptr [esp + 20]
    push esi
    mov esi, eax
    fstp dword ptr [esp + 4]
    fild dword ptr [esp + 28]
    fdivr dword ptr [esp + 4]
    fstp dword ptr [esp + 24]
    fld qword ptr [g_1019BD80]
    fstp qword ptr [esp + 8]
    fld dword ptr [esp + 24]
    fadd qword ptr [esp + 8]
    fistp dword ptr [esp + 28]
    test byte ptr [esp + 28], 1
    mov dword ptr [esp + 24], 0
    jne L0
    mov dword ptr [esp + 24], 03F000000h
L0:
    fld dword ptr [esp + 20]
    xor ecx, ecx
    test esi, esi
    fmul dword ptr [esp + 20]
    fdivr dword ptr [g_1019BDEC]
    fstp dword ptr [esp + 20]
    fld dword ptr [g_1019BC84]
    jle L5
    lea esp, [esp]
L1:
    lea eax, [ecx + ecx]
    mov dword ptr [esp + 28], eax
    fild dword ptr [esp + 28]
    inc eax
    test ecx, ecx
    fadd dword ptr [esp + 24]
    mov dword ptr [esp + 28], eax
    fild dword ptr [esp + 28]
    fadd dword ptr [esp + 24]
    fld st(1)
    fmul st(2)
    fmul dword ptr [esp + 20]
    fldl2e
    fmulp st(1)
    fld st(0)
    frndint
    fxch st(1)
    fsub st(1)
    f2xm1
    fld1
    faddp st(1)
    fscale
    fstp st(1)
    fld st(1)
    fmul st(2)
    fmul dword ptr [esp + 20]
    fldl2e
    fmulp st(1)
    fld st(0)
    frndint
    fxch st(1)
    fsub st(1)
    f2xm1
    fld1
    faddp st(1)
    fscale
    fstp st(1)
    jne L2
    fld dword ptr [g_1019BC84]
    fld dword ptr [esp + 24]
    fucompp
    fnstsw ax
    test ah, 68
    jp L2
    fxch st(1)
    fmul dword ptr [g_1019BCB0]
    fxch st(1)
L2:
    fld st(0)
    fadd st(2)
    fst dword ptr [edi + ecx*4]
    fld dword ptr [g_1019BC84]
    fld st(1)
    fucompp
    fnstsw ax
    test ah, 68
    jp L3
    fstp st(0)
    fstp st(0)
    fstp st(0)
    fadd st(1)
    fmul dword ptr [g_1019BCB0]
    fdiv dword ptr [esp + 4]
    fstp dword ptr [edx + ecx*4]
    jmp L4
L3:
    fxch st(1)
    fmul st(3)
    fxch st(2)
    fmul st(4)
    faddp st(2)
    fmul dword ptr [esp + 4]
    fdivp st(1)
    fstp dword ptr [edx + ecx*4]
    fstp st(0)
L4:
    fstp st(0)
    inc ecx
    cmp ecx, esi
    fadd dword ptr [edi + ecx*4 - 4]
    jl L1
    fcom dword ptr [g_1019BDE4]
    fnstsw ax
    test ah, 65
    jp L6
L5:
    fstp st(0)
    mov dword ptr [edi], 03F000000h
    mov eax, 1
    pop esi
    add esp, 12
    ret
L6:
    fld dword ptr [g_1019BCB0]
    lea ecx, [esi - 1]
    fdiv st(1)
    lea eax, [ecx + 1]
    cmp eax, 4
    fstp dword ptr [esp + 20]
    fstp st(0)
    jl L12
    lea edx, [edi + ecx*4 - 8]
    jmp L7
    lea ebx, [ebx]
L7:
    fld dword ptr [esp + 20]
    fmul dword ptr [edx + 8]
    fst dword ptr [edx + 8]
    fcomp dword ptr [g_1019BDE8]
    fnstsw ax
    test ah, 5
    jp L8
    lea esi, [ecx + 1]
L8:
    fld dword ptr [esp + 20]
    fmul dword ptr [edx + 4]
    fst dword ptr [edx + 4]
    fcomp dword ptr [g_1019BDE8]
    fnstsw ax
    test ah, 5
    jp L9
    mov esi, ecx
L9:
    fld dword ptr [esp + 20]
    fmul dword ptr [edx]
    fst dword ptr [edx]
    fcomp dword ptr [g_1019BDE8]
    fnstsw ax
    test ah, 5
    jp L10
    lea esi, [ecx - 1]
L10:
    fld dword ptr [esp + 20]
    fmul dword ptr [edx - 4]
    fst dword ptr [edx - 4]
    fcomp dword ptr [g_1019BDE8]
    fnstsw ax
    test ah, 5
    jp L11
    lea esi, [ecx - 2]
L11:
    sub ecx, 4
    sub edx, 16
    cmp ecx, 3
    jge L7
L12:
    test ecx, ecx
    jl L15
L13:
    fld dword ptr [esp + 20]
    fmul dword ptr [edi + ecx*4]
    fst dword ptr [edi + ecx*4]
    fcomp dword ptr [g_1019BDE8]
    fnstsw ax
    test ah, 5
    jp L14
    lea esi, [ecx + 1]
L14:
    dec ecx
    jns L13
FUN_10034ca0 ENDP
END
