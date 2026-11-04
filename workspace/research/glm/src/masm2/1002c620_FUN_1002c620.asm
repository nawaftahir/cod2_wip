.686
.MODEL FLAT, C
EXTRN sub_1002C7FD:PROC
EXTRN sub_1002C816:PROC
EXTRN sub_1002C821:PROC
EXTRN EXTRN g_1019BD80:DWORD:DWORD
EXTRN EXTRN g_1019BDFC:DWORD:DWORD
.CODE
FUN_1002c620 PROC
    sub sub esp, 68
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 80]
    mov mov edx, dword ptr [ebp + 12]
    imul imul edx, dword ptr [ebp + 16]
    mov mov dword ptr [esp + 20], edx
    xor xor ecx, ecx
    test test edx, edx
    fild fild dword ptr [esp + 20]
    push push esi
    fst fst dword ptr [esp + 48]
    fld fld st(0)
    fmul fmul st(1)
    fstp fstp dword ptr [esp + 32]
    fstp fstp st(0)
    jle L0
    lea lea ecx, [ecx]
    fld fld dword ptr [edi + ecx*8 + 4]
    inc inc ecx
    cmp cmp ecx, edx
    fld fld dword ptr [edi + ecx*8 - 8]
    fld fld st(0)
    fmul fmul st(1)
    fld fld st(2)
    fmul fmul st(3)
    faddp faddp st(1)
    fsqrt fsqrt
    fstp fstp st(2)
    fstp fstp st(0)
    fstp fstp dword ptr [edi + ecx*8 - 8]
    jl L1
    mov mov ebx, dword ptr [ebp + 12]
    lea lea esi, [ebx - 1]
    mov mov dword ptr [esp + 20], esi
    mov mov esi, edx
    sub sub esi, ebx
    mov mov ebx, dword ptr [ebp + 16]
    xor xor ecx, ecx
    test test ebx, ebx
    mov mov dword ptr [esp + 28], ecx
    jle sub_1002C816
    xor xor ebx, ebx
    cmp cmp dword ptr [ebp + 12], ebx
    jle sub_1002C7FD
    fld fld qword ptr [g_1019BD80]
L1:
    mov mov edx, dword ptr [esp + 20]
    fstp fstp qword ptr [esp + 56]
    shl shl edx, 3
    fld fld qword ptr [g_1019BD80]
    lea lea ebp, [edi + esi*8]
    fstp fstp qword ptr [esp + 64]
    fld fld qword ptr [g_1019BD80]
    fstp fstp qword ptr [esp + 72]
    lea lea esi, [ecx*8]
    fld fld dword ptr [esi + edi]
    fld fld st(0)
    fsub fsub dword ptr [edx + edi]
    fxch fxch st(1)
    fsub fsub dword ptr [ebp]
    fst fst dword ptr [esp + 16]
    fmul fmul dword ptr [esp + 16]
    fld fld st(1)
    fmul fmul st(2)
    faddp faddp st(1)
    fadd fadd dword ptr [esp + 32]
    fsqrt fsqrt
    fdivr fdivr dword ptr [g_1019BDFC]
    fst fst dword ptr [esp + 20]
    fmul fmul st(1)
    fadd fadd dword ptr [g_1019BDFC]
    fstp fstp dword ptr [esp + 36]
    fstp fstp st(0)
    fld fld dword ptr [esp + 36]
    fadd fadd qword ptr [esp + 56]
    fistp fistp dword ptr [esp + 40]
    fld fld dword ptr [esp + 20]
    mov mov dl, byte ptr [esp + 40]
    fmul fmul dword ptr [esp + 16]
    mov mov byte ptr [eax + 2], dl
    fadd fadd dword ptr [g_1019BDFC]
    fstp fstp dword ptr [esp + 36]
    fld fld dword ptr [esp + 36]
    fadd fadd qword ptr [esp + 64]
    fistp fistp dword ptr [esp + 44]
    fld fld dword ptr [esp + 48]
    mov mov dl, byte ptr [esp + 44]
    fmul fmul dword ptr [esp + 20]
    mov mov byte ptr [eax + 1], dl
    fadd fadd dword ptr [g_1019BDFC]
    fstp fstp dword ptr [esp + 36]
    fld fld dword ptr [esp + 36]
    fadd fadd qword ptr [esp + 72]
    fistp fistp dword ptr [esp + 52]
    mov mov dl, byte ptr [esp + 52]
    mov mov byte ptr [eax], dl
    mov mov byte ptr [eax + 3], 0FFh
    add add eax, 4
    add add ebp, 8
    mov mov dword ptr [esp + 20], ecx
    inc inc ecx
    mov mov edx, esi
    mov mov esi, dword ptr [esp + 84]
    inc inc ebx
    cmp cmp ebx, dword ptr [esi + 12]
    jl sub_1002C821
    mov mov edx, dword ptr [esp + 24]
    mov mov ebp, dword ptr [esp + 84]
    mov mov ebx, dword ptr [ebp + 12]
    mov mov esi, ecx
    sub sub esi, ebx
    add add esi, edx
    lea lea ebx, [edx - 1]
    and and esi, ebx
    mov mov ebx, dword ptr [esp + 28]
    inc inc ebx
    cmp cmp ebx, dword ptr [ebp + 16]
    mov mov dword ptr [esp + 28], ebx
    jl sub_1002C816
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 68
    ret ret
FUN_1002c620 ENDP
END
