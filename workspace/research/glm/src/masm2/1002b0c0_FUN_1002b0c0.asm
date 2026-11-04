.686
.MODEL FLAT, C
EXTRN sub_1000F474:PROC
EXTRN sub_1002B3D2:PROC
EXTRN sub_1002B49C:PROC
EXTRN sub_1002B4C8:PROC
EXTRN sub_1002B552:PROC
EXTRN sub_1002B553:PROC
EXTRN sub_1002B57F:PROC
EXTRN sub_1002B596:PROC
EXTRN sub_1002B5BC:PROC
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_1019BD54:DWORD:DWORD
.CODE
FUN_1002b0c0 PROC
    sub sub esp, 32
    fld fld dword ptr [g_1019BC84]
    push push ebx
    fld fld dword ptr [g_1019BC84]
    push push ebp
    mov mov ebp, dword ptr [esp + 48]
    fst fst dword ptr [esp + 16]
    fld fld dword ptr [g_1019BC84]
    push push esi
    push push edi
    fst fst dword ptr [esp + 28]
    mov mov edi, eax
    xor xor ebx, ebx
    cmp cmp edi, 4
    jl L4
    lea lea esi, [edi - 4]
    shr shr esi, 2
    inc inc esi
    lea lea ecx, [ebp + 40]
    lea lea ebx, [esi*4]
    fstp fstp st(0)
    fstp fstp st(0)
    fadd fadd dword ptr [ecx - 4]
    fld fld dword ptr [esp + 24]
    fadd fadd dword ptr [ecx]
    fstp fstp dword ptr [esp + 24]
    fld fld dword ptr [esp + 28]
    fadd fadd dword ptr [ecx + 4]
    fstp fstp dword ptr [esp + 28]
    fld fld dword ptr [ecx + 24]
    fmul fmul dword ptr [edx]
    fld fld dword ptr [ecx + 32]
    fmul fmul dword ptr [edx + 8]
    faddp faddp st(1)
    fld fld dword ptr [ecx + 28]
    fmul fmul dword ptr [edx + 4]
    faddp faddp st(1)
    fchs fchs
    fcom fcom dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 65
    jne L0
    fld fld st(0)
    fmul fmul dword ptr [ecx - 36]
    faddp faddp st(2)
    fld fld st(0)
    fmul fmul dword ptr [ecx - 32]
    fadd fadd dword ptr [esp + 24]
    fstp fstp dword ptr [esp + 24]
    fmul fmul dword ptr [ecx - 28]
    fadd fadd dword ptr [esp + 28]
    fstp fstp dword ptr [esp + 28]
    jmp L1
    fstp fstp st(0)
    fadd fadd dword ptr [ecx + 100]
    fld fld dword ptr [esp + 24]
    fadd fadd dword ptr [ecx + 104]
    fstp fstp dword ptr [esp + 24]
    fld fld dword ptr [esp + 28]
    fadd fadd dword ptr [ecx + 108]
    fstp fstp dword ptr [esp + 28]
    fld fld dword ptr [ecx + 080h]
    fmul fmul dword ptr [edx]
    fld fld dword ptr [ecx + 088h]
    fmul fmul dword ptr [edx + 8]
    faddp faddp st(1)
    fld fld dword ptr [ecx + 084h]
    fmul fmul dword ptr [edx + 4]
    faddp faddp st(1)
    fchs fchs
    fcom fcom dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 65
    jne L2
    fld fld st(0)
    fmul fmul dword ptr [ecx + 68]
    faddp faddp st(2)
    fld fld st(0)
    fmul fmul dword ptr [ecx + 72]
    fadd fadd dword ptr [esp + 24]
    fstp fstp dword ptr [esp + 24]
    fmul fmul dword ptr [ecx + 76]
    fadd fadd dword ptr [esp + 28]
    fstp fstp dword ptr [esp + 28]
    jmp L3
    fstp fstp st(0)
    fadd fadd dword ptr [ecx + 0CCh]
    fld fld dword ptr [esp + 24]
    fadd fadd dword ptr [ecx + 0D0h]
    fstp fstp dword ptr [esp + 24]
    fld fld dword ptr [esp + 28]
L0:
    fadd fadd dword ptr [ecx + 0D4h]
    fstp fstp dword ptr [esp + 28]
    fld fld dword ptr [ecx + 0E8h]
    fmul fmul dword ptr [edx]
    fld fld dword ptr [ecx + 0F0h]
    fmul fmul dword ptr [edx + 8]
    faddp faddp st(1)
    fld fld dword ptr [ecx + 0ECh]
L1:
    fmul fmul dword ptr [edx + 4]
    faddp faddp st(1)
    fchs fchs
    fcom fcom dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 65
    jne L6
    fld fld st(0)
    fmul fmul dword ptr [ecx + 0ACh]
    faddp faddp st(2)
    fld fld st(0)
    fmul fmul dword ptr [ecx + 0B0h]
    fadd fadd dword ptr [esp + 24]
    fstp fstp dword ptr [esp + 24]
    fmul fmul dword ptr [ecx + 0B4h]
    fadd fadd dword ptr [esp + 28]
    fstp fstp dword ptr [esp + 28]
    jmp sub_1002B3D2
    fstp fstp st(0)
    fadd fadd dword ptr [ecx + 0134h]
    fld fld dword ptr [esp + 24]
    fadd fadd dword ptr [ecx + 0138h]
    fst fst dword ptr [esp + 24]
    fld fld dword ptr [esp + 28]
    fadd fadd dword ptr [ecx + 013Ch]
    fst fst dword ptr [esp + 28]
    fld fld dword ptr [ecx + 0150h]
    fmul fmul dword ptr [edx]
    fld fld dword ptr [ecx + 0158h]
    fmul fmul dword ptr [edx + 8]
    faddp faddp st(1)
    fld fld dword ptr [ecx + 0154h]
    fmul fmul dword ptr [edx + 4]
    faddp faddp st(1)
    fchs fchs
    fcom fcom dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 65
    jne sub_1002B49C
    fld fld st(0)
    fmul fmul dword ptr [ecx + 0114h]
    faddp faddp st(4)
    fld fld st(0)
    fmul fmul dword ptr [ecx + 0118h]
    faddp faddp st(3)
    fxch fxch st(2)
    fst fst dword ptr [esp + 24]
    fxch fxch st(2)
    fmul fmul dword ptr [ecx + 011Ch]
    faddp faddp st(1)
    fst fst dword ptr [esp + 28]
    jmp sub_1002B4C8
    fstp fstp st(0)
    add add ecx, 01A0h
    dec dec esi
    jne L5
    cmp cmp ebx, edi
    jge sub_1002B552
    mov mov eax, ebx
    imul imul eax, eax, 104
    lea lea ecx, [eax + ebp + 40]
    sub sub edi, ebx
    fxch fxch st(2)
    fadd fadd dword ptr [ecx - 4]
    fxch fxch st(2)
    fxch fxch st(1)
    fadd fadd dword ptr [ecx]
    fxch fxch st(1)
    fadd fadd dword ptr [ecx + 4]
    fld fld dword ptr [ecx + 24]
    fmul fmul dword ptr [edx]
    fld fld dword ptr [ecx + 32]
    fmul fmul dword ptr [edx + 8]
    faddp faddp st(1)
    fld fld dword ptr [ecx + 28]
    fmul fmul dword ptr [edx + 4]
L4:
    faddp faddp st(1)
    fchs fchs
    fcom fcom dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 65
    jne sub_1002B57F
L5:
    fld fld st(0)
    fmul fmul dword ptr [ecx - 36]
    faddp faddp st(4)
    fld fld st(0)
    fmul fmul dword ptr [ecx - 32]
    faddp faddp st(3)
    fmul fmul dword ptr [ecx - 28]
    faddp faddp st(1)
    jmp sub_1002B596
    fstp fstp st(0)
    add add ecx, 104
    dec dec edi
    jne sub_1002B553
    fstp fstp dword ptr [esp + 28]
    fstp fstp dword ptr [esp + 24]
    jmp sub_1002B5BC
    fstp fstp st(0)
    fstp fstp st(0)
    mov mov eax, dword ptr [esp + 52]
    movzx movzx ecx, byte ptr [eax + 2]
    movzx movzx edx, byte ptr [eax + 1]
    mov mov dword ptr [esp + 52], ecx
    movzx movzx ecx, byte ptr [eax]
    fild fild dword ptr [esp + 52]
    mov mov dword ptr [esp + 52], edx
    movzx movzx edx, byte ptr [eax + 3]
    fmul fmul st(1)
    mov mov esi, dword ptr [esp + 60]
    fmul fmul dword ptr [g_1019BD54]
    fstp fstp dword ptr [esp + 32]
    fstp fstp st(0)
    fild fild dword ptr [esp + 52]
    mov mov dword ptr [esp + 52], ecx
    fmul fmul dword ptr [esp + 24]
    fmul fmul dword ptr [g_1019BD54]
    fstp fstp dword ptr [esp + 36]
    fild fild dword ptr [esp + 52]
    mov mov dword ptr [esp + 52], edx
    lea lea edx, [esp + 32]
    fmul fmul dword ptr [esp + 28]
    fmul fmul dword ptr [g_1019BD54]
    fstp fstp dword ptr [esp + 40]
    fild fild dword ptr [esp + 52]
    fmul fmul dword ptr [g_1019BD54]
    fstp fstp dword ptr [esp + 44]
    call sub_1000F474
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 32
    ret ret
FUN_1002b0c0 ENDP
END
