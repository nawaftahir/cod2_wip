.686
.MODEL FLAT, C
EXTRN sub_1002C864:PROC
EXTRN sub_1002C877:PROC
EXTRN sub_1002C87E:PROC
EXTRN EXTRN g_1019BC78:DWORD:DWORD
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_1019BCAC:DWORD:DWORD
EXTRN EXTRN g_1019BD80:DWORD:DWORD
.CODE
FUN_1002c7b0 PROC
    sub sub esp, 24
    push push esi
    mov mov esi, eax
    mov mov eax, dword ptr [edx + 12]
    imul imul eax, dword ptr [edx + 16]
    mov mov dword ptr [esp + 4], eax
    xor xor ecx, ecx
    test test eax, eax
    fild fild dword ptr [esp + 4]
    jle sub_1002C864
    fld fld dword ptr [g_1019BC78]
    fdiv fdiv st(1)
    fstp fstp dword ptr [esp + 4]
    fstp fstp st(0)
    fld fld qword ptr [g_1019BD80]
    fstp fstp qword ptr [esp + 16]
    fld fld dword ptr [edi + ecx*8 + 4]
    fld fld dword ptr [edi + ecx*8]
    fld fld st(1)
    fmulp fmulp st(2)
    fld fld st(0)
    fmul fmul st(1)
    faddp faddp st(2)
    fxch fxch st(1)
    fsqrt fsqrt
    fstp fstp st(1)
    fmul fmul dword ptr [esp + 4]
    fld fld dword ptr [g_1019BC78]
    fsubr fsubr st(1)
    fcomp fcomp dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 1
    jne sub_1002C87E
    fstp fstp st(0)
    fld fld dword ptr [g_1019BC78]
    fmul fmul dword ptr [g_1019BCAC]
    fstp fstp dword ptr [esp + 8]
    fld fld dword ptr [esp + 8]
    fadd fadd qword ptr [esp + 16]
    fistp fistp dword ptr [esp + 12]
    mov mov al, byte ptr [esp + 12]
    mov mov byte ptr [esi], al
    mov mov eax, dword ptr [edx + 12]
    imul imul eax, dword ptr [edx + 16]
    inc inc esi
    inc inc ecx
    cmp cmp ecx, eax
    jl sub_1002C877
    pop pop esi
    add add esp, 24
    ret ret
    fstp fstp st(0)
    pop pop esi
    add add esp, 24
    ret ret
FUN_1002c7b0 ENDP
END
