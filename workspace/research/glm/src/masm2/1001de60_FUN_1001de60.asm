.686
.MODEL FLAT, C
EXTRN sub_1001D76C:PROC
EXTRN sub_1001D855:PROC
EXTRN sub_1001DA1A:PROC
EXTRN sub_1001E2AD:PROC
EXTRN sub_1001E2BB:PROC
EXTRN sub_1001E2C5:PROC
EXTRN sub_1001E2CF:PROC
EXTRN sub_1001E2D9:PROC
EXTRN sub_1001E49B:PROC
EXTRN sub_1001E4E0:PROC
EXTRN EXTRN fp_101D49DC:DWORD:DWORD
EXTRN EXTRN fp_101D4BA8:DWORD:DWORD
EXTRN EXTRN fp_101D4BD0:DWORD:DWORD
EXTRN EXTRN fp_101D4BF4:DWORD:DWORD
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_101DA9C8:DWORD:DWORD
.CODE
FUN_1001de60 PROC
    sub sub esp, 01CCh
    push push ebx
    push push ebp
    mov mov ebx, eax
    push push edi
    lea lea eax, [esp + 0D0h]
    push push eax
    lea lea ecx, [esp + 0C4h]
    push push ecx
    lea lea edx, [esp + 0E0h]
    push push edx
    mov mov eax, esi
    call sub_1001DA1A
    mov mov eax, dword ptr [esp + 01E8h]
    mov mov eax, dword ptr [eax + 8]
    xor xor ebp, ebp
    add add esp, 12
    cmp cmp eax, ebp
    je L0
    lea lea ecx, [esp + 0C0h]
    push push ecx
    push push ebx
    push push eax
    call dword ptr [fp_101D4BF4]
    add add esp, 12
    mov mov eax, 040C00000h
    push push ebx
    mov mov dword ptr [esp + 88], eax
    mov mov dword ptr [esp + 92], ebp
    mov mov dword ptr [esp + 96], ebp
    mov mov dword ptr [esp + 100], ebp
    mov mov dword ptr [esp + 104], eax
    mov mov dword ptr [esp + 108], ebp
    mov mov dword ptr [esp + 112], ebp
    mov mov dword ptr [esp + 116], ebp
    mov mov dword ptr [esp + 120], eax
    call dword ptr [fp_101D4BD0]
    mov mov edi, eax
    push push ebx
    mov mov dword ptr [esp + 88], edi
    call dword ptr [fp_101D4BA8]
L0:
    add add esp, 8
    cmp cmp eax, ebp
    je sub_1001E2AD
    xor xor edx, edx
    cmp cmp edi, ebp
    mov mov dword ptr [esp + 60], edx
    jle sub_1001E2BB
    lea lea ebp, [eax + 20]
    mov mov dword ptr [esp + 52], ebp
    lea lea ecx, [ecx]
    mov mov ecx, edx
    and and ecx, 31
    mov mov eax, 1
    shl shl eax, cl
    mov mov ecx, edx
    sar sar ecx, 5
    test test dword ptr [esp + ecx*4 + 0C0h], eax
    je sub_1001E2CF
    mov mov dword ptr [esp + 48], 0
    lea lea ebx, [ebp - 20]
    lea lea edi, [esp + 88]
    lea lea ecx, [ecx]
    mov mov edx, dword ptr [esp + 48]
    xor xor eax, eax
    mov mov dword ptr [esp + 64], eax
    mov mov dword ptr [esp + 68], eax
    mov mov dword ptr [esp + 72], eax
    mov mov dword ptr [esp + 76], eax
    lea lea ecx, [esp + 09Ch]
    mov mov eax, ebx
    mov mov dword ptr [esp + edx*4 + 64], 03F800000h
    call sub_1001D76C
    fld fld dword ptr [esp + 0B4h]
    fadd fadd dword ptr [esp + 0A8h]
    lea lea ecx, [esp + 120]
    mov mov eax, ebx
    fadd fadd dword ptr [esp + 09Ch]
    fmul fmul dword ptr [g_1019BC84]
    fadd fadd dword ptr [ebx + 16]
    fstp fstp dword ptr [esp + 12]
    fld fld dword ptr [esp + 0B8h]
    fadd fadd dword ptr [esp + 0ACh]
    fadd fadd dword ptr [esp + 0A0h]
    fmul fmul dword ptr [g_1019BC84]
    fadd fadd dword ptr [ebx + 20]
    fstp fstp dword ptr [esp + 16]
    fld fld dword ptr [esp + 0BCh]
    fadd fadd dword ptr [esp + 0B0h]
    fadd fadd dword ptr [esp + 0A4h]
    fmul fmul dword ptr [g_1019BC84]
    fadd fadd dword ptr [ebx + 24]
    fstp fstp dword ptr [esp + 20]
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [esi + 44]
    fld fld dword ptr [esp + 16]
    fmul fmul dword ptr [esi + 32]
    faddp faddp st(1)
    fld fld dword ptr [esp + 12]
    fmul fmul dword ptr [esi + 20]
    faddp faddp st(1)
    fstp fstp dword ptr [esp + 24]
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [esi + 48]
    fld fld dword ptr [esp + 16]
    fmul fmul dword ptr [esi + 36]
    faddp faddp st(1)
    fld fld dword ptr [esp + 12]
    fmul fmul dword ptr [esi + 24]
    faddp faddp st(1)
    fstp fstp dword ptr [esp + 28]
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [esi + 52]
    fld fld dword ptr [esp + 16]
    fmul fmul dword ptr [esi + 40]
    faddp faddp st(1)
    fld fld dword ptr [esp + 12]
    fmul fmul dword ptr [esi + 28]
    faddp faddp st(1)
    fstp fstp dword ptr [esp + 32]
    fld fld dword ptr [esp + 24]
    fadd fadd dword ptr [esi + 60]
    fstp fstp dword ptr [esp + 24]
    fld fld dword ptr [esp + 28]
    fadd fadd dword ptr [esi + 64]
    fstp fstp dword ptr [esp + 28]
    fld fld dword ptr [esp + 32]
    fadd fadd dword ptr [esi + 68]
    fstp fstp dword ptr [esp + 32]
    call sub_1001D855
    fld fld dword ptr [esp + 084h]
    fmul fmul dword ptr [edi]
    fld fld dword ptr [esp + 090h]
    fmul fmul dword ptr [edi + 4]
    faddp faddp st(1)
    fld fld dword ptr [esp + 120]
    fmul fmul dword ptr [edi - 4]
    faddp faddp st(1)
    fadd fadd dword ptr [ebp - 4]
    fstp fstp dword ptr [esp + 12]
    fld fld dword ptr [esp + 088h]
    fmul fmul dword ptr [edi]
    fld fld dword ptr [esp + 094h]
    fmul fmul dword ptr [edi + 4]
    faddp faddp st(1)
    mov mov ecx, dword ptr [g_101DA9C8]
    fld fld dword ptr [esp + 124]
    mov mov edx, dword ptr [ecx + 0249D4Ch]
    fmul fmul dword ptr [edi - 4]
    mov mov eax, dword ptr [ecx + 0249D50h]
    inc inc edx
    cmp cmp edx, eax
    faddp faddp st(1)
    fadd fadd dword ptr [ebp]
    fstp fstp dword ptr [esp + 16]
    fld fld dword ptr [esp + 08Ch]
    fmul fmul dword ptr [edi]
    fld fld dword ptr [esp + 098h]
    fmul fmul dword ptr [edi + 4]
    faddp faddp st(1)
    fld fld dword ptr [esp + 080h]
    fmul fmul dword ptr [edi - 4]
    faddp faddp st(1)
    fadd fadd dword ptr [ebp + 4]
    lea lea ebp, [ecx + 0249D4Ch]
    fstp fstp dword ptr [esp + 20]
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [esi + 44]
    fld fld dword ptr [esp + 16]
    fmul fmul dword ptr [esi + 32]
    faddp faddp st(1)
    fld fld dword ptr [esp + 12]
    fmul fmul dword ptr [esi + 20]
    faddp faddp st(1)
    fstp fstp dword ptr [esp + 36]
    fld fld dword ptr [esp + 12]
    fmul fmul dword ptr [esi + 24]
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [esi + 48]
    faddp faddp st(1)
    fld fld dword ptr [esp + 16]
    fmul fmul dword ptr [esi + 36]
    faddp faddp st(1)
    fstp fstp dword ptr [esp + 40]
    fld fld dword ptr [esp + 12]
    fmul fmul dword ptr [esi + 28]
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [esi + 52]
    faddp faddp st(1)
    fld fld dword ptr [esp + 16]
    fmul fmul dword ptr [esi + 40]
    faddp faddp st(1)
    fstp fstp dword ptr [esp + 44]
    fld fld dword ptr [esp + 36]
    fadd fadd dword ptr [esi + 60]
    fstp fstp dword ptr [esp + 36]
    fld fld dword ptr [esp + 40]
    fadd fadd dword ptr [esi + 64]
    fstp fstp dword ptr [esp + 40]
    fld fld dword ptr [esp + 44]
    fadd fadd dword ptr [esi + 68]
    fstp fstp dword ptr [esp + 44]
    jg sub_1001E4E0
    mov mov edx, dword ptr [ecx + 0249D48h]
    add add ecx, 0249D48h
    test test edx, edx
    mov mov dword ptr [esp + 56], ecx
    jne sub_1001E49B
    imul imul eax, eax, 44
    push push eax
    call dword ptr [fp_101D49DC]
    mov mov ecx, dword ptr [esp + 60]
    add add esp, 4
    mov mov dword ptr [ecx], eax
    mov mov eax, dword ptr [ebp]
    mov mov edx, dword ptr [ecx]
    imul imul eax, eax, 44
    mov mov ecx, dword ptr [esp + 28]
    add add eax, edx
    mov mov edx, dword ptr [esp + 24]
    mov mov dword ptr [eax], edx
    mov mov edx, dword ptr [esp + 32]
    mov mov dword ptr [eax + 4], ecx
    mov mov ecx, dword ptr [esp + 36]
    mov mov dword ptr [eax + 8], edx
    mov mov edx, dword ptr [esp + 40]
    mov mov dword ptr [eax + 12], ecx
    mov mov ecx, dword ptr [esp + 44]
    mov mov dword ptr [eax + 16], edx
    mov mov edx, dword ptr [esp + 64]
    mov mov dword ptr [eax + 20], ecx
    mov mov ecx, dword ptr [esp + 68]
    mov mov dword ptr [eax + 24], edx
    mov mov edx, dword ptr [esp + 72]
    mov mov dword ptr [eax + 28], ecx
    mov mov ecx, dword ptr [esp + 76]
    mov mov dword ptr [eax + 32], edx
    mov mov dword ptr [eax + 36], ecx
    mov mov dword ptr [eax + 40], 0
    inc inc dword ptr [ebp]
    mov mov eax, dword ptr [esp + 48]
    mov mov ebp, dword ptr [esp + 52]
    inc inc eax
    add add edi, 12
    cmp cmp eax, 3
    mov mov dword ptr [esp + 48], eax
    jl sub_1001E2D9
    mov mov edx, dword ptr [esp + 60]
    mov mov edi, dword ptr [esp + 80]
    inc inc edx
    add add ebp, 32
    cmp cmp edx, edi
    mov mov dword ptr [esp + 60], edx
    mov mov dword ptr [esp + 52], ebp
    jl sub_1001E2C5
    pop pop edi
    pop pop ebp
    pop pop ebx
    add add esp, 01CCh
    ret ret
FUN_1001de60 ENDP
END
