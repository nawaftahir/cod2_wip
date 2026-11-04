.686
.MODEL FLAT, C
EXTRN sub_1002CD55:PROC
EXTRN sub_1002CD65:PROC
EXTRN sub_1002CD67:PROC
EXTRN sub_1002CD78:PROC
EXTRN sub_1002CD84:PROC
EXTRN sub_1002CDE3:PROC
EXTRN sub_10058491:PROC
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_1019BCB0:DWORD:DWORD
EXTRN EXTRN g_1019BDA0:DWORD:DWORD
EXTRN EXTRN g_1019BDA8:DWORD:DWORD
.CODE
FUN_1002cb40 PROC
    push push ebp
    mov mov ebp, esp
    and and esp, -8
    sub sub esp, 40
    fld fld dword ptr [esi + 32]
    mov mov eax, dword ptr [esi + 16]
    fld fld st(0)
    mov mov dword ptr [esp + 8], eax
    fmulp fmulp st(1)
    mov mov ecx, dword ptr [esi + 12]
    cdq cdq
    sub sub eax, edx
    fld fld st(0)
    sar sar eax, 1
    fdiv fdiv dword ptr [esi + 28]
    push push ebx
    mov mov ebx, eax
    mov mov eax, dword ptr [esi + 16]
    cdq cdq
    sub sub eax, edx
    neg neg ebx
    push push edi
    sar sar eax, 1
    xor xor edi, edi
    cmp cmp ebx, eax
    fmul fmul st(1)
    fstp fstp dword ptr [esp + 32]
    fstp fstp st(0)
    fild fild dword ptr [esp + 16]
    mov mov dword ptr [esp + 16], ecx
    fmul fmul dword ptr [esi + 20]
    fdivr fdivr dword ptr [g_1019BDA8]
    fstp fstp dword ptr [esp + 20]
    fild fild dword ptr [esp + 16]
    mov mov dword ptr [esp + 16], ebx
    fmul fmul dword ptr [esi + 24]
    fdivr fdivr dword ptr [g_1019BDA8]
    fstp fstp dword ptr [esp + 24]
    jge sub_1002CD65
    mov mov edi, edi
    fild fild dword ptr [esp + 16]
    mov mov eax, ecx
    cdq cdq
    sub sub eax, edx
    fmul fmul dword ptr [esp + 20]
    sar sar eax, 1
    mov mov ebx, eax
    mov mov eax, ecx
    cdq cdq
    fstp fstp dword ptr [esp + 12]
    sub sub eax, edx
    neg neg ebx
    sar sar eax, 1
    cmp cmp ebx, eax
    mov mov dword ptr [esp + 8], ebx
    jge sub_1002CD78
    fld fld dword ptr [esp + 12]
    fmul fmul dword ptr [esp + 12]
    fstp fstp dword ptr [esp + 28]
    fild fild dword ptr [esp + 8]
    lea lea eax, [esp + 44]
    push push eax
    lea lea ecx, [esp + 44]
    fmul fmul dword ptr [esp + 28]
    push push ecx
    fstp fstp dword ptr [esp + 16]
    call sub_10058491
    fld fld dword ptr [esp + 16]
    add add esp, 8
    fmul fmul dword ptr [esp + 8]
    fadd fadd dword ptr [esp + 28]
    fld fld st(0)
    fsqrt fsqrt
    fmul fmul dword ptr [esi + 28]
    fstp fstp dword ptr [esp + 36]
    fld fld dword ptr [esp + 8]
    fmul fmul dword ptr [esi + 40]
    fld fld dword ptr [esp + 12]
    fmul fmul dword ptr [esi + 36]
    faddp faddp st(1)
    fcom fcom dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 65
    jp sub_1002CD55
    mov mov edx, dword ptr [esi + 4]
    fstp fstp st(0)
    mov mov dword ptr [edx + edi*8], 0
    fstp fstp st(0)
    mov mov eax, dword ptr [esi + 4]
    mov mov dword ptr [eax + edi*8 + 4], 0
    mov mov ecx, dword ptr [esi + 8]
    mov mov dword ptr [ecx + edi*4], 0
    jmp sub_1002CDE3
    fld fld st(1)
    mov mov edx, dword ptr [esi + 4]
    fmul fmul dword ptr [esp + 32]
    fdivr fdivr dword ptr [g_1019BDA0]
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
    fmul fmul dword ptr [esi + 44]
    fld fld st(2)
    fmul fmul st(3)
    fmul fmul st(3)
    fdivp fdivp st(1)
    fld fld st(1)
    fmul fmul st(2)
    fmulp fmulp st(1)
    fmul fmul dword ptr [g_1019BCB0]
    fsqrt fsqrt
    fstp fstp st(2)
    fstp fstp st(0)
    fmul fmul dword ptr [esi + 44]
    fld fld dword ptr [esp + 40]
    fmul fmul st(1)
    fstp fstp dword ptr [edx + edi*8]
    mov mov eax, dword ptr [esi + 4]
    fld fld dword ptr [esp + 44]
    fmul fmul st(1)
    fstp fstp dword ptr [eax + edi*8 + 4]
    mov mov ecx, dword ptr [esi + 8]
    fstp fstp st(0)
    fld fld dword ptr [esp + 36]
    fsqrt fsqrt
    fstp fstp dword ptr [ecx + edi*4]
    mov mov ecx, dword ptr [esi + 12]
    mov mov eax, ecx
    cdq cdq
    sub sub eax, edx
    inc inc edi
    inc inc ebx
    sar sar eax, 1
    cmp cmp ebx, eax
    mov mov dword ptr [esp + 8], ebx
    jl sub_1002CD84
    mov mov eax, dword ptr [esi + 16]
    mov mov ebx, dword ptr [esp + 16]
    cdq cdq
    sub sub eax, edx
    inc inc ebx
    sar sar eax, 1
    cmp cmp ebx, eax
    mov mov dword ptr [esp + 16], ebx
    jl sub_1002CD67
    pop pop edi
    pop pop ebx
    mov mov esp, ebp
    pop pop ebp
    ret ret
FUN_1002cb40 ENDP
END
