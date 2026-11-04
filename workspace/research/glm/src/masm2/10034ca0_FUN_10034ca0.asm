.686
.MODEL FLAT, C
EXTRN sub_10034EB9:PROC
EXTRN sub_10034EE5:PROC
EXTRN sub_10034F44:PROC
EXTRN sub_10034F9A:PROC
EXTRN sub_10034FD1:PROC
EXTRN sub_10035004:PROC
EXTRN sub_10035010:PROC
EXTRN sub_10035033:PROC
EXTRN sub_10035067:PROC
EXTRN sub_100350A5:PROC
EXTRN sub_100350B9:PROC
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_1019BCB0:DWORD:DWORD
EXTRN EXTRN g_1019BD80:DWORD:DWORD
EXTRN EXTRN g_1019BDE4:DWORD:DWORD
EXTRN EXTRN g_1019BDE8:DWORD:DWORD
EXTRN EXTRN g_1019BDEC:DWORD:DWORD
.CODE
FUN_10034ca0 PROC
    sub sub esp, 12
    fild fild dword ptr [esp + 20]
    push push esi
    mov mov esi, eax
    fstp fstp dword ptr [esp + 4]
    fild fild dword ptr [esp + 28]
    fdivr fdivr dword ptr [esp + 4]
    fstp fstp dword ptr [esp + 24]
    fld fld qword ptr [g_1019BD80]
    fstp fstp qword ptr [esp + 8]
    fld fld dword ptr [esp + 24]
    fadd fadd qword ptr [esp + 8]
    fistp fistp dword ptr [esp + 28]
    test test byte ptr [esp + 28], 1
    mov mov dword ptr [esp + 24], 0
    jne L0
    mov mov dword ptr [esp + 24], 03F000000h
    fld fld dword ptr [esp + 20]
    xor xor ecx, ecx
    test test esi, esi
    fmul fmul dword ptr [esp + 20]
    fdivr fdivr dword ptr [g_1019BDEC]
    fstp fstp dword ptr [esp + 20]
    fld fld dword ptr [g_1019BC84]
    jle L2
    lea lea esp, [esp]
    lea lea eax, [ecx + ecx]
    mov mov dword ptr [esp + 28], eax
    fild fild dword ptr [esp + 28]
    inc inc eax
    test test ecx, ecx
    fadd fadd dword ptr [esp + 24]
    mov mov dword ptr [esp + 28], eax
L0:
    fild fild dword ptr [esp + 28]
    fadd fadd dword ptr [esp + 24]
    fld fld st(1)
    fmul fmul st(2)
    fmul fmul dword ptr [esp + 20]
    fldl2e fldl2e
    fmulp fmulp st(1)
    fld fld st(0)
    frndint frndint
    fxch fxch st(1)
    fsub fsub st(1)
    f2xm1 f2xm1
    fld1 fld1
    faddp faddp st(1)
    fscale fscale
    fstp fstp st(1)
    fld fld st(1)
    fmul fmul st(2)
    fmul fmul dword ptr [esp + 20]
    fldl2e fldl2e
    fmulp fmulp st(1)
    fld fld st(0)
    frndint frndint
    fxch fxch st(1)
    fsub fsub st(1)
    f2xm1 f2xm1
    fld1 fld1
    faddp faddp st(1)
    fscale fscale
    fstp fstp st(1)
    jne L3
    fld fld dword ptr [g_1019BC84]
    fld fld dword ptr [esp + 24]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp L4
    fxch fxch st(1)
    fmul fmul dword ptr [g_1019BCB0]
    fxch fxch st(1)
    fld fld st(0)
    fadd fadd st(2)
    fst fst dword ptr [edi + ecx*4]
    fld fld dword ptr [g_1019BC84]
    fld fld st(1)
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp sub_10034EB9
    fstp fstp st(0)
    fstp fstp st(0)
    fstp fstp st(0)
    fadd fadd st(1)
    fmul fmul dword ptr [g_1019BCB0]
    fdiv fdiv dword ptr [esp + 4]
    fstp fstp dword ptr [edx + ecx*4]
    jmp sub_10034EE5
    fxch fxch st(1)
    fmul fmul st(3)
    fxch fxch st(2)
    fmul fmul st(4)
    faddp faddp st(2)
    fmul fmul dword ptr [esp + 4]
    fdivp fdivp st(1)
    fstp fstp dword ptr [edx + ecx*4]
    fstp fstp st(0)
    fstp fstp st(0)
    inc inc ecx
    cmp cmp ecx, esi
    fadd fadd dword ptr [edi + ecx*4 - 4]
    jl L1
    fcom fcom dword ptr [g_1019BDE4]
    fnstsw fnstsw ax
    test test ah, 65
    jp sub_10034F44
    fstp fstp st(0)
    mov mov dword ptr [edi], 03F000000h
    mov mov eax, 1
    pop pop esi
    add add esp, 12
    ret ret
    fld fld dword ptr [g_1019BCB0]
    lea lea ecx, [esi - 1]
    fdiv fdiv st(1)
    lea lea eax, [ecx + 1]
    cmp cmp eax, 4
    fstp fstp dword ptr [esp + 20]
    fstp fstp st(0)
    jl sub_10035004
    lea lea edx, [edi + ecx*4 - 8]
    jmp sub_10034F9A
    lea lea ebx, [ebx]
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [edx + 8]
    fst fst dword ptr [edx + 8]
    fcomp fcomp dword ptr [g_1019BDE8]
    fnstsw fnstsw ax
    test test ah, 5
    jp sub_10034FD1
    lea lea esi, [ecx + 1]
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [edx + 4]
    fst fst dword ptr [edx + 4]
    fcomp fcomp dword ptr [g_1019BDE8]
    fnstsw fnstsw ax
L1:
    test test ah, 5
    jp sub_10035004
    mov mov esi, ecx
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [edx]
    fst fst dword ptr [edx]
    fcomp fcomp dword ptr [g_1019BDE8]
    fnstsw fnstsw ax
    test test ah, 5
    jp sub_10035033
L4:
    lea lea esi, [ecx - 1]
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [edx - 4]
    fst fst dword ptr [edx - 4]
    fcomp fcomp dword ptr [g_1019BDE8]
    fnstsw fnstsw ax
    test test ah, 5
    jp sub_10035067
    lea lea esi, [ecx - 2]
    sub sub ecx, 4
    sub sub edx, 16
    cmp cmp ecx, 3
    jge sub_10035010
    test test ecx, ecx
    jl sub_100350A5
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [edi + ecx*4]
    fst fst dword ptr [edi + ecx*4]
    fcomp fcomp dword ptr [g_1019BDE8]
    fnstsw fnstsw ax
    test test ah, 5
    jp sub_100350B9
    lea lea esi, [ecx + 1]
    dec dec ecx
    jns sub_100350A5
FUN_10034ca0 ENDP
END
