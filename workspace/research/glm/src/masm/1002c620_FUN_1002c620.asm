.686
.MODEL FLAT, C
EXTRN g_1019BD80:DWORD
EXTRN g_1019BDFC:DWORD
.CODE
FUN_1002c620 PROC
    sub esp, 68
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 80]
    mov edx, dword ptr [ebp + 12]
    imul edx, dword ptr [ebp + 16]
    mov dword ptr [esp + 20], edx
    xor ecx, ecx
    test edx, edx
    fild dword ptr [esp + 20]
    push esi
    fst dword ptr [esp + 48]
    fld st(0)
    fmul st(1)
    fstp dword ptr [esp + 32]
    fstp st(0)
    jle L1
    lea ecx, [ecx]
L0:
    fld dword ptr [edi + ecx*8 + 4]
    inc ecx
    cmp ecx, edx
    fld dword ptr [edi + ecx*8 - 8]
    fld st(0)
    fmul st(1)
    fld st(2)
    fmul st(3)
    faddp st(1)
    fsqrt
    fstp st(2)
    fstp st(0)
    fstp dword ptr [edi + ecx*8 - 8]
    jl L0
L1:
    mov ebx, dword ptr [ebp + 12]
    lea esi, [ebx - 1]
    mov dword ptr [esp + 20], esi
    mov esi, edx
    sub esi, ebx
    mov ebx, dword ptr [ebp + 16]
    xor ecx, ecx
    test ebx, ebx
    mov dword ptr [esp + 28], ecx
    jle L5
L2:
    xor ebx, ebx
    cmp dword ptr [ebp + 12], ebx
    jle L4
    fld qword ptr [g_1019BD80]
    mov edx, dword ptr [esp + 20]
    fstp qword ptr [esp + 56]
    shl edx, 3
    fld qword ptr [g_1019BD80]
    lea ebp, [edi + esi*8]
    fstp qword ptr [esp + 64]
    fld qword ptr [g_1019BD80]
    fstp qword ptr [esp + 72]
L3:
    lea esi, [ecx*8]
    fld dword ptr [esi + edi]
    fld st(0)
    fsub dword ptr [edx + edi]
    fxch st(1)
    fsub dword ptr [ebp]
    fst dword ptr [esp + 16]
    fmul dword ptr [esp + 16]
    fld st(1)
    fmul st(2)
    faddp st(1)
    fadd dword ptr [esp + 32]
    fsqrt
    fdivr dword ptr [g_1019BDFC]
    fst dword ptr [esp + 20]
    fmul st(1)
    fadd dword ptr [g_1019BDFC]
    fstp dword ptr [esp + 36]
    fstp st(0)
    fld dword ptr [esp + 36]
    fadd qword ptr [esp + 56]
    fistp dword ptr [esp + 40]
    fld dword ptr [esp + 20]
    mov dl, byte ptr [esp + 40]
    fmul dword ptr [esp + 16]
    mov byte ptr [eax + 2], dl
    fadd dword ptr [g_1019BDFC]
    fstp dword ptr [esp + 36]
    fld dword ptr [esp + 36]
    fadd qword ptr [esp + 64]
    fistp dword ptr [esp + 44]
    fld dword ptr [esp + 48]
    mov dl, byte ptr [esp + 44]
    fmul dword ptr [esp + 20]
    mov byte ptr [eax + 1], dl
    fadd dword ptr [g_1019BDFC]
    fstp dword ptr [esp + 36]
    fld dword ptr [esp + 36]
    fadd qword ptr [esp + 72]
    fistp dword ptr [esp + 52]
    mov dl, byte ptr [esp + 52]
    mov byte ptr [eax], dl
    mov byte ptr [eax + 3], 0000000FFh
    add eax, 4
    add ebp, 8
    mov dword ptr [esp + 20], ecx
    inc ecx
    mov edx, esi
    mov esi, dword ptr [esp + 84]
    inc ebx
    cmp ebx, dword ptr [esi + 12]
    jl L3
    mov edx, dword ptr [esp + 24]
L4:
    mov ebp, dword ptr [esp + 84]
    mov ebx, dword ptr [ebp + 12]
    mov esi, ecx
    sub esi, ebx
    add esi, edx
    lea ebx, [edx - 1]
    and esi, ebx
    mov ebx, dword ptr [esp + 28]
    inc ebx
    cmp ebx, dword ptr [ebp + 16]
    mov dword ptr [esp + 28], ebx
    jl L2
L5:
    pop esi
    pop ebp
    pop ebx
    add esp, 68
    ret
FUN_1002c620 ENDP
END
