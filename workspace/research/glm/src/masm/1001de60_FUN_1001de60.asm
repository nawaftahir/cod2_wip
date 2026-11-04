.686
.MODEL FLAT, C
EXTRN sub_1001D76C:PROC
EXTRN sub_1001D855:PROC
EXTRN sub_1001DA1A:PROC
EXTRN fp_101D49DC:DWORD
EXTRN fp_101D4BA8:DWORD
EXTRN fp_101D4BD0:DWORD
EXTRN fp_101D4BF4:DWORD
EXTRN g_1019BC84:DWORD
EXTRN g_101DA9C8:DWORD
.CODE
FUN_1001de60 PROC
    sub esp, 0000001CCh
    push ebx
    push ebp
    mov ebx, eax
    push edi
    lea eax, [esp + 0000000D0h]
    push eax
    lea ecx, [esp + 0000000C4h]
    push ecx
    lea edx, [esp + 0000000E0h]
    push edx
    mov eax, esi
    call sub_1001DA1A
    mov eax, dword ptr [esp + 0000001E8h]
    mov eax, dword ptr [eax + 8]
    xor ebp, ebp
    add esp, 12
    cmp eax, ebp
    je L0
    lea ecx, [esp + 0000000C0h]
    push ecx
    push ebx
    push eax
    call dword ptr [fp_101D4BF4]
    add esp, 12
L0:
    mov eax, 040C00000h
    push ebx
    mov dword ptr [esp + 88], eax
    mov dword ptr [esp + 92], ebp
    mov dword ptr [esp + 96], ebp
    mov dword ptr [esp + 100], ebp
    mov dword ptr [esp + 104], eax
    mov dword ptr [esp + 108], ebp
    mov dword ptr [esp + 112], ebp
    mov dword ptr [esp + 116], ebp
    mov dword ptr [esp + 120], eax
    call dword ptr [fp_101D4BD0]
    mov edi, eax
    push ebx
    mov dword ptr [esp + 88], edi
    call dword ptr [fp_101D4BA8]
    add esp, 8
    cmp eax, ebp
    je L6
    xor edx, edx
    cmp edi, ebp
    mov dword ptr [esp + 60], edx
    jle L6
    lea ebp, [eax + 20]
    mov dword ptr [esp + 52], ebp
    lea ecx, [ecx]
L1:
    mov ecx, edx
    and ecx, 31
    mov eax, 1
    shl eax, cl
    mov ecx, edx
    sar ecx, 5
    test dword ptr [esp + ecx*4 + 0000000C0h], eax
    je L5
    mov dword ptr [esp + 48], 0
    lea ebx, [ebp - 20]
    lea edi, [esp + 88]
    lea ecx, [ecx]
L2:
    mov edx, dword ptr [esp + 48]
    xor eax, eax
    mov dword ptr [esp + 64], eax
    mov dword ptr [esp + 68], eax
    mov dword ptr [esp + 72], eax
    mov dword ptr [esp + 76], eax
    lea ecx, [esp + 00000009Ch]
    mov eax, ebx
    mov dword ptr [esp + edx*4 + 64], 03F800000h
    call sub_1001D76C
    fld dword ptr [esp + 0000000B4h]
    fadd dword ptr [esp + 0000000A8h]
    lea ecx, [esp + 120]
    mov eax, ebx
    fadd dword ptr [esp + 00000009Ch]
    fmul dword ptr [g_1019BC84]
    fadd dword ptr [ebx + 16]
    fstp dword ptr [esp + 12]
    fld dword ptr [esp + 0000000B8h]
    fadd dword ptr [esp + 0000000ACh]
    fadd dword ptr [esp + 0000000A0h]
    fmul dword ptr [g_1019BC84]
    fadd dword ptr [ebx + 20]
    fstp dword ptr [esp + 16]
    fld dword ptr [esp + 0000000BCh]
    fadd dword ptr [esp + 0000000B0h]
    fadd dword ptr [esp + 0000000A4h]
    fmul dword ptr [g_1019BC84]
    fadd dword ptr [ebx + 24]
    fstp dword ptr [esp + 20]
    fld dword ptr [esp + 20]
    fmul dword ptr [esi + 44]
    fld dword ptr [esp + 16]
    fmul dword ptr [esi + 32]
    faddp st(1)
    fld dword ptr [esp + 12]
    fmul dword ptr [esi + 20]
    faddp st(1)
    fstp dword ptr [esp + 24]
    fld dword ptr [esp + 20]
    fmul dword ptr [esi + 48]
    fld dword ptr [esp + 16]
    fmul dword ptr [esi + 36]
    faddp st(1)
    fld dword ptr [esp + 12]
    fmul dword ptr [esi + 24]
    faddp st(1)
    fstp dword ptr [esp + 28]
    fld dword ptr [esp + 20]
    fmul dword ptr [esi + 52]
    fld dword ptr [esp + 16]
    fmul dword ptr [esi + 40]
    faddp st(1)
    fld dword ptr [esp + 12]
    fmul dword ptr [esi + 28]
    faddp st(1)
    fstp dword ptr [esp + 32]
    fld dword ptr [esp + 24]
    fadd dword ptr [esi + 60]
    fstp dword ptr [esp + 24]
    fld dword ptr [esp + 28]
    fadd dword ptr [esi + 64]
    fstp dword ptr [esp + 28]
    fld dword ptr [esp + 32]
    fadd dword ptr [esi + 68]
    fstp dword ptr [esp + 32]
    call sub_1001D855
    fld dword ptr [esp + 000000084h]
    fmul dword ptr [edi]
    fld dword ptr [esp + 000000090h]
    fmul dword ptr [edi + 4]
    faddp st(1)
    fld dword ptr [esp + 120]
    fmul dword ptr [edi - 4]
    faddp st(1)
    fadd dword ptr [ebp - 4]
    fstp dword ptr [esp + 12]
    fld dword ptr [esp + 000000088h]
    fmul dword ptr [edi]
    fld dword ptr [esp + 000000094h]
    fmul dword ptr [edi + 4]
    faddp st(1)
    mov ecx, dword ptr [g_101DA9C8]
    fld dword ptr [esp + 124]
    mov edx, dword ptr [ecx + 000249D4Ch]
    fmul dword ptr [edi - 4]
    mov eax, dword ptr [ecx + 000249D50h]
    inc edx
    cmp edx, eax
    faddp st(1)
    fadd dword ptr [ebp]
    fstp dword ptr [esp + 16]
    fld dword ptr [esp + 00000008Ch]
    fmul dword ptr [edi]
    fld dword ptr [esp + 000000098h]
    fmul dword ptr [edi + 4]
    faddp st(1)
    fld dword ptr [esp + 000000080h]
    fmul dword ptr [edi - 4]
    faddp st(1)
    fadd dword ptr [ebp + 4]
    lea ebp, [ecx + 000249D4Ch]
    fstp dword ptr [esp + 20]
    fld dword ptr [esp + 20]
    fmul dword ptr [esi + 44]
    fld dword ptr [esp + 16]
    fmul dword ptr [esi + 32]
    faddp st(1)
    fld dword ptr [esp + 12]
    fmul dword ptr [esi + 20]
    faddp st(1)
    fstp dword ptr [esp + 36]
    fld dword ptr [esp + 12]
    fmul dword ptr [esi + 24]
    fld dword ptr [esp + 20]
    fmul dword ptr [esi + 48]
    faddp st(1)
    fld dword ptr [esp + 16]
    fmul dword ptr [esi + 36]
    faddp st(1)
    fstp dword ptr [esp + 40]
    fld dword ptr [esp + 12]
    fmul dword ptr [esi + 28]
    fld dword ptr [esp + 20]
    fmul dword ptr [esi + 52]
    faddp st(1)
    fld dword ptr [esp + 16]
    fmul dword ptr [esi + 40]
    faddp st(1)
    fstp dword ptr [esp + 44]
    fld dword ptr [esp + 36]
    fadd dword ptr [esi + 60]
    fstp dword ptr [esp + 36]
    fld dword ptr [esp + 40]
    fadd dword ptr [esi + 64]
    fstp dword ptr [esp + 40]
    fld dword ptr [esp + 44]
    fadd dword ptr [esi + 68]
    fstp dword ptr [esp + 44]
    jg L4
    mov edx, dword ptr [ecx + 000249D48h]
    add ecx, 000249D48h
    test edx, edx
    mov dword ptr [esp + 56], ecx
    jne L3
    imul eax, eax, 44
    push eax
    call dword ptr [fp_101D49DC]
    mov ecx, dword ptr [esp + 60]
    add esp, 4
    mov dword ptr [ecx], eax
L3:
    mov eax, dword ptr [ebp]
    mov edx, dword ptr [ecx]
    imul eax, eax, 44
    mov ecx, dword ptr [esp + 28]
    add eax, edx
    mov edx, dword ptr [esp + 24]
    mov dword ptr [eax], edx
    mov edx, dword ptr [esp + 32]
    mov dword ptr [eax + 4], ecx
    mov ecx, dword ptr [esp + 36]
    mov dword ptr [eax + 8], edx
    mov edx, dword ptr [esp + 40]
    mov dword ptr [eax + 12], ecx
    mov ecx, dword ptr [esp + 44]
    mov dword ptr [eax + 16], edx
    mov edx, dword ptr [esp + 64]
    mov dword ptr [eax + 20], ecx
    mov ecx, dword ptr [esp + 68]
    mov dword ptr [eax + 24], edx
    mov edx, dword ptr [esp + 72]
    mov dword ptr [eax + 28], ecx
    mov ecx, dword ptr [esp + 76]
    mov dword ptr [eax + 32], edx
    mov dword ptr [eax + 36], ecx
    mov dword ptr [eax + 40], 0
    inc dword ptr [ebp]
L4:
    mov eax, dword ptr [esp + 48]
    mov ebp, dword ptr [esp + 52]
    inc eax
    add edi, 12
    cmp eax, 3
    mov dword ptr [esp + 48], eax
    jl L2
    mov edx, dword ptr [esp + 60]
    mov edi, dword ptr [esp + 80]
L5:
    inc edx
    add ebp, 32
    cmp edx, edi
    mov dword ptr [esp + 60], edx
    mov dword ptr [esp + 52], ebp
    jl L1
L6:
    pop edi
    pop ebp
    pop ebx
    add esp, 0000001CCh
    ret
FUN_1001de60 ENDP
END
