.686
.MODEL FLAT, C
EXTRN sub_1000F474:PROC
EXTRN g_1019BC84:DWORD
EXTRN g_1019BD54:DWORD
.CODE
FUN_1002b0c0 PROC
    sub esp, 32
    fld dword ptr [g_1019BC84]
    push ebx
    fld dword ptr [g_1019BC84]
    push ebp
    mov ebp, dword ptr [esp + 48]
    fst dword ptr [esp + 16]
    fld dword ptr [g_1019BC84]
    push esi
    push edi
    fst dword ptr [esp + 28]
    mov edi, eax
    xor ebx, ebx
    cmp edi, 4
    jl L9
    lea esi, [edi - 4]
    shr esi, 2
    inc esi
    lea ecx, [ebp + 40]
    lea ebx, [esi*4]
L0:
    fstp st(0)
    fstp st(0)
    fadd dword ptr [ecx - 4]
    fld dword ptr [esp + 24]
    fadd dword ptr [ecx]
    fstp dword ptr [esp + 24]
    fld dword ptr [esp + 28]
    fadd dword ptr [ecx + 4]
    fstp dword ptr [esp + 28]
    fld dword ptr [ecx + 24]
    fmul dword ptr [edx]
    fld dword ptr [ecx + 32]
    fmul dword ptr [edx + 8]
    faddp st(1)
    fld dword ptr [ecx + 28]
    fmul dword ptr [edx + 4]
    faddp st(1)
    fchs
    fcom dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 65
    jne L1
    fld st(0)
    fmul dword ptr [ecx - 36]
    faddp st(2)
    fld st(0)
    fmul dword ptr [ecx - 32]
    fadd dword ptr [esp + 24]
    fstp dword ptr [esp + 24]
    fmul dword ptr [ecx - 28]
    fadd dword ptr [esp + 28]
    fstp dword ptr [esp + 28]
    jmp L2
L1:
    fstp st(0)
L2:
    fadd dword ptr [ecx + 100]
    fld dword ptr [esp + 24]
    fadd dword ptr [ecx + 104]
    fstp dword ptr [esp + 24]
    fld dword ptr [esp + 28]
    fadd dword ptr [ecx + 108]
    fstp dword ptr [esp + 28]
    fld dword ptr [ecx + 000000080h]
    fmul dword ptr [edx]
    fld dword ptr [ecx + 000000088h]
    fmul dword ptr [edx + 8]
    faddp st(1)
    fld dword ptr [ecx + 000000084h]
    fmul dword ptr [edx + 4]
    faddp st(1)
    fchs
    fcom dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 65
    jne L3
    fld st(0)
    fmul dword ptr [ecx + 68]
    faddp st(2)
    fld st(0)
    fmul dword ptr [ecx + 72]
    fadd dword ptr [esp + 24]
    fstp dword ptr [esp + 24]
    fmul dword ptr [ecx + 76]
    fadd dword ptr [esp + 28]
    fstp dword ptr [esp + 28]
    jmp L4
L3:
    fstp st(0)
L4:
    fadd dword ptr [ecx + 0000000CCh]
    fld dword ptr [esp + 24]
    fadd dword ptr [ecx + 0000000D0h]
    fstp dword ptr [esp + 24]
    fld dword ptr [esp + 28]
    fadd dword ptr [ecx + 0000000D4h]
    fstp dword ptr [esp + 28]
    fld dword ptr [ecx + 0000000E8h]
    fmul dword ptr [edx]
    fld dword ptr [ecx + 0000000F0h]
    fmul dword ptr [edx + 8]
    faddp st(1)
    fld dword ptr [ecx + 0000000ECh]
    fmul dword ptr [edx + 4]
    faddp st(1)
    fchs
    fcom dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 65
    jne L5
    fld st(0)
    fmul dword ptr [ecx + 0000000ACh]
    faddp st(2)
    fld st(0)
    fmul dword ptr [ecx + 0000000B0h]
    fadd dword ptr [esp + 24]
    fstp dword ptr [esp + 24]
    fmul dword ptr [ecx + 0000000B4h]
    fadd dword ptr [esp + 28]
    fstp dword ptr [esp + 28]
    jmp L6
L5:
    fstp st(0)
L6:
    fadd dword ptr [ecx + 000000134h]
    fld dword ptr [esp + 24]
    fadd dword ptr [ecx + 000000138h]
    fst dword ptr [esp + 24]
    fld dword ptr [esp + 28]
    fadd dword ptr [ecx + 00000013Ch]
    fst dword ptr [esp + 28]
    fld dword ptr [ecx + 000000150h]
    fmul dword ptr [edx]
    fld dword ptr [ecx + 000000158h]
    fmul dword ptr [edx + 8]
    faddp st(1)
    fld dword ptr [ecx + 000000154h]
    fmul dword ptr [edx + 4]
    faddp st(1)
    fchs
    fcom dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 65
    jne L7
    fld st(0)
    fmul dword ptr [ecx + 000000114h]
    faddp st(4)
    fld st(0)
    fmul dword ptr [ecx + 000000118h]
    faddp st(3)
    fxch st(2)
    fst dword ptr [esp + 24]
    fxch st(2)
    fmul dword ptr [ecx + 00000011Ch]
    faddp st(1)
    fst dword ptr [esp + 28]
    jmp L8
L7:
    fstp st(0)
L8:
    add ecx, 0000001A0h
    dec esi
    jne L0
L9:
    cmp ebx, edi
    jge L13
    mov eax, ebx
    imul eax, eax, 104
    lea ecx, [eax + ebp + 40]
    sub edi, ebx
L10:
    fxch st(2)
    fadd dword ptr [ecx - 4]
    fxch st(2)
    fxch st(1)
    fadd dword ptr [ecx]
    fxch st(1)
    fadd dword ptr [ecx + 4]
    fld dword ptr [ecx + 24]
    fmul dword ptr [edx]
    fld dword ptr [ecx + 32]
    fmul dword ptr [edx + 8]
    faddp st(1)
    fld dword ptr [ecx + 28]
    fmul dword ptr [edx + 4]
    faddp st(1)
    fchs
    fcom dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 65
    jne L11
    fld st(0)
    fmul dword ptr [ecx - 36]
    faddp st(4)
    fld st(0)
    fmul dword ptr [ecx - 32]
    faddp st(3)
    fmul dword ptr [ecx - 28]
    faddp st(1)
    jmp L12
L11:
    fstp st(0)
L12:
    add ecx, 104
    dec edi
    jne L10
    fstp dword ptr [esp + 28]
    fstp dword ptr [esp + 24]
    jmp L14
L13:
    fstp st(0)
    fstp st(0)
L14:
    mov eax, dword ptr [esp + 52]
    movzx ecx, byte ptr [eax + 2]
    movzx edx, byte ptr [eax + 1]
    mov dword ptr [esp + 52], ecx
    movzx ecx, byte ptr [eax]
    fild dword ptr [esp + 52]
    mov dword ptr [esp + 52], edx
    movzx edx, byte ptr [eax + 3]
    fmul st(1)
    mov esi, dword ptr [esp + 60]
    fmul dword ptr [g_1019BD54]
    fstp dword ptr [esp + 32]
    fstp st(0)
    fild dword ptr [esp + 52]
    mov dword ptr [esp + 52], ecx
    fmul dword ptr [esp + 24]
    fmul dword ptr [g_1019BD54]
    fstp dword ptr [esp + 36]
    fild dword ptr [esp + 52]
    mov dword ptr [esp + 52], edx
    lea edx, [esp + 32]
    fmul dword ptr [esp + 28]
    fmul dword ptr [g_1019BD54]
    fstp dword ptr [esp + 40]
    fild dword ptr [esp + 52]
    fmul dword ptr [g_1019BD54]
    fstp dword ptr [esp + 44]
    call sub_1000F474
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 32
    ret
FUN_1002b0c0 ENDP
END
