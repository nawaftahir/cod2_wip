.686
.MODEL FLAT, C
EXTRN sub_10058491:PROC
EXTRN g_1019BC84:DWORD
EXTRN g_1019BCB0:DWORD
EXTRN g_1019BDA0:DWORD
EXTRN g_1019BDA8:DWORD
.CODE
FUN_1002cb40 PROC
    push ebp
    mov ebp, esp
    and esp, 0FFFFFFF8h
    sub esp, 40
    fld dword ptr [esi + 32]
    mov eax, dword ptr [esi + 16]
    fld st(0)
    mov dword ptr [esp + 8], eax
    fmulp st(1)
    mov ecx, dword ptr [esi + 12]
    cdq
    sub eax, edx
    fld st(0)
    sar eax, 1
    fdiv dword ptr [esi + 28]
    push ebx
    mov ebx, eax
    mov eax, dword ptr [esi + 16]
    cdq
    sub eax, edx
    neg ebx
    push edi
    sar eax, 1
    xor edi, edi
    cmp ebx, eax
    fmul st(1)
    fstp dword ptr [esp + 32]
    fstp st(0)
    fild dword ptr [esp + 16]
    mov dword ptr [esp + 16], ecx
    fmul dword ptr [esi + 20]
    fdivr dword ptr [g_1019BDA8]
    fstp dword ptr [esp + 20]
    fild dword ptr [esp + 16]
    mov dword ptr [esp + 16], ebx
    fmul dword ptr [esi + 24]
    fdivr dword ptr [g_1019BDA8]
    fstp dword ptr [esp + 24]
    jge L5
    mov edi, edi
L0:
    fild dword ptr [esp + 16]
    mov eax, ecx
    cdq
    sub eax, edx
    fmul dword ptr [esp + 20]
    sar eax, 1
    mov ebx, eax
    mov eax, ecx
    cdq
    fstp dword ptr [esp + 12]
    sub eax, edx
    neg ebx
    sar eax, 1
    cmp ebx, eax
    mov dword ptr [esp + 8], ebx
    jge L4
    fld dword ptr [esp + 12]
    fmul dword ptr [esp + 12]
    fstp dword ptr [esp + 28]
L1:
    fild dword ptr [esp + 8]
    lea eax, [esp + 44]
    push eax
    lea ecx, [esp + 44]
    fmul dword ptr [esp + 28]
    push ecx
    fstp dword ptr [esp + 16]
    call sub_10058491
    fld dword ptr [esp + 16]
    add esp, 8
    fmul dword ptr [esp + 8]
    fadd dword ptr [esp + 28]
    fld st(0)
    fsqrt
    fmul dword ptr [esi + 28]
    fstp dword ptr [esp + 36]
    fld dword ptr [esp + 8]
    fmul dword ptr [esi + 40]
    fld dword ptr [esp + 12]
    fmul dword ptr [esi + 36]
    faddp st(1)
    fcom dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 65
    jp L2
    mov edx, dword ptr [esi + 4]
    fstp st(0)
    mov dword ptr [edx + edi*8], 0
    fstp st(0)
    mov eax, dword ptr [esi + 4]
    mov dword ptr [eax + edi*8 + 4], 0
    mov ecx, dword ptr [esi + 8]
    mov dword ptr [ecx + edi*4], 0
    jmp L3
L2:
    fld st(1)
    mov edx, dword ptr [esi + 4]
    fmul dword ptr [esp + 32]
    fdivr dword ptr [g_1019BDA0]
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
    fmul dword ptr [esi + 44]
    fld st(2)
    fmul st(3)
    fmul st(3)
    fdivp st(1)
    fld st(1)
    fmul st(2)
    fmulp st(1)
    fmul dword ptr [g_1019BCB0]
    fsqrt
    fstp st(2)
    fstp st(0)
    fmul dword ptr [esi + 44]
    fld dword ptr [esp + 40]
    fmul st(1)
    fstp dword ptr [edx + edi*8]
    mov eax, dword ptr [esi + 4]
    fld dword ptr [esp + 44]
    fmul st(1)
    fstp dword ptr [eax + edi*8 + 4]
    mov ecx, dword ptr [esi + 8]
    fstp st(0)
    fld dword ptr [esp + 36]
    fsqrt
    fstp dword ptr [ecx + edi*4]
L3:
    mov ecx, dword ptr [esi + 12]
    mov eax, ecx
    cdq
    sub eax, edx
    inc edi
    inc ebx
    sar eax, 1
    cmp ebx, eax
    mov dword ptr [esp + 8], ebx
    jl L1
L4:
    mov eax, dword ptr [esi + 16]
    mov ebx, dword ptr [esp + 16]
    cdq
    sub eax, edx
    inc ebx
    sar eax, 1
    cmp ebx, eax
    mov dword ptr [esp + 16], ebx
    jl L0
L5:
    pop edi
    pop ebx
    mov esp, ebp
    pop ebp
    ret
FUN_1002cb40 ENDP
END
