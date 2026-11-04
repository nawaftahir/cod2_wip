.686
.MODEL FLAT, C
EXTRN sub_1001D759:PROC
EXTRN sub_1001D871:PROC
EXTRN sub_1001DA19:PROC
EXTRN fp_101D49DC:DWORD
EXTRN fp_101D4BA8:DWORD
EXTRN fp_101D4BD0:DWORD
EXTRN fp_101D4BD4:DWORD
EXTRN fp_101D4BF4:DWORD
EXTRN g_101DA9C8:DWORD
.CODE
FUN_1001da80 PROC
    sub esp, 0000003A8h
    push ebx
    mov ebx, eax
    push edi
    lea eax, [esp + 0000000A8h]
    push eax
    lea ecx, [esp + 00000009Ch]
    push ecx
    lea edx, [esp + 0000000B8h]
    push edx
    mov eax, esi
    call sub_1001DA19
    mov eax, dword ptr [esp + 0000003C0h]
    mov eax, dword ptr [eax + 8]
    add esp, 12
    test eax, eax
    je L0
    lea ecx, [esp + 000000098h]
    push ecx
    push ebx
    push eax
    call dword ptr [fp_101D4BF4]
    add esp, 12
L0:
    push ebx
    call dword ptr [fp_101D4BD0]
    lea edx, [esp + 0000001B4h]
    push edx
    mov edi, eax
    push ebx
    mov dword ptr [esp + 84], edi
    call dword ptr [fp_101D4BD4]
    push ebx
    call dword ptr [fp_101D4BA8]
    add esp, 16
    test eax, eax
    je L6
    xor edx, edx
    test edi, edi
    mov dword ptr [esp + 68], edx
    jle L6
    push ebp
    lea ebp, [eax + 20]
    mov dword ptr [esp + 36], ebp
L1:
    mov ecx, edx
    and ecx, 31
    mov eax, 1
    shl eax, cl
    mov ecx, edx
    sar ecx, 5
    test dword ptr [esp + ecx*4 + 00000009Ch], eax
    je L5
    mov ebx, dword ptr [esp + edx*4 + 0000001B4h]
    mov edi, 010190278h
    add ebp, -20
    mov dword ptr [esp + 68], 12
L2:
    mov eax, dword ptr [edi]
    lea edx, [eax + eax*2]
    mov eax, dword ptr [ebx + edx*4]
    mov dword ptr [esp + 12], eax
    mov eax, dword ptr [edi + 4]
    lea ecx, [eax + eax*2]
    mov edx, dword ptr [ebx + ecx*4 + 4]
    mov eax, dword ptr [edi + 8]
    lea eax, [eax + eax*2]
    mov ecx, dword ptr [ebx + eax*4 + 8]
    mov dword ptr [esp + 20], ecx
    lea ecx, [esp + 84]
    mov eax, ebp
    mov dword ptr [esp + 16], edx
    call sub_1001D759
    fld dword ptr [esp + 108]
    fmul dword ptr [esp + 20]
    fld dword ptr [esp + 96]
    fmul dword ptr [esp + 16]
    faddp st(1)
    fld dword ptr [esp + 84]
    fmul dword ptr [esp + 12]
    faddp st(1)
    fadd dword ptr [ebp + 16]
    fstp dword ptr [esp + 24]
    fld dword ptr [esp + 112]
    fmul dword ptr [esp + 20]
    fld dword ptr [esp + 100]
    fmul dword ptr [esp + 16]
    faddp st(1)
    fld dword ptr [esp + 88]
    fmul dword ptr [esp + 12]
    faddp st(1)
    fadd dword ptr [ebp + 20]
    fstp dword ptr [esp + 28]
    fld dword ptr [esp + 116]
    fmul dword ptr [esp + 20]
    fld dword ptr [esp + 104]
    fmul dword ptr [esp + 16]
    faddp st(1)
    fld dword ptr [esp + 92]
    fmul dword ptr [esp + 12]
    faddp st(1)
    fadd dword ptr [ebp + 24]
    fstp dword ptr [esp + 32]
    fld dword ptr [esp + 32]
    fmul dword ptr [esi + 44]
    fld dword ptr [esp + 28]
    fmul dword ptr [esi + 32]
    faddp st(1)
    fld dword ptr [esp + 24]
    fmul dword ptr [esi + 20]
    faddp st(1)
    fstp dword ptr [esp + 52]
    fld dword ptr [esp + 32]
    fmul dword ptr [esi + 48]
    fld dword ptr [esp + 28]
    fmul dword ptr [esi + 36]
    faddp st(1)
    fld dword ptr [esp + 24]
    fmul dword ptr [esi + 24]
    faddp st(1)
    fstp dword ptr [esp + 56]
    fld dword ptr [esp + 32]
    fmul dword ptr [esi + 52]
    fld dword ptr [esp + 28]
    fmul dword ptr [esi + 40]
    faddp st(1)
    fld dword ptr [esp + 24]
    fmul dword ptr [esi + 28]
    faddp st(1)
    fstp dword ptr [esp + 60]
    fld dword ptr [esp + 52]
    fadd dword ptr [esi + 60]
    fstp dword ptr [esp + 52]
    fld dword ptr [esp + 56]
    fadd dword ptr [esi + 64]
    fstp dword ptr [esp + 56]
    fld dword ptr [esp + 60]
    fadd dword ptr [esi + 68]
    fstp dword ptr [esp + 60]
    mov eax, dword ptr [edi + 12]
    add edi, 12
    lea edx, [eax + eax*2]
    mov eax, dword ptr [ebx + edx*4]
    mov dword ptr [esp + 12], eax
    mov eax, dword ptr [edi + 4]
    lea ecx, [eax + eax*2]
    mov edx, dword ptr [ebx + ecx*4 + 4]
    mov eax, dword ptr [edi + 8]
    lea eax, [eax + eax*2]
    mov ecx, dword ptr [ebx + eax*4 + 8]
    mov dword ptr [esp + 20], ecx
    lea ecx, [esp + 120]
    mov eax, ebp
    mov dword ptr [esp + 16], edx
    call sub_1001D871
    fld dword ptr [esp + 000000090h]
    fmul dword ptr [esp + 20]
    mov eax, dword ptr [esp + 36]
    fld dword ptr [esp + 000000084h]
    fmul dword ptr [esp + 16]
    faddp st(1)
    fld dword ptr [esp + 120]
    fmul dword ptr [esp + 12]
    faddp st(1)
    fadd dword ptr [eax - 4]
    fstp dword ptr [esp + 24]
    fld dword ptr [esp + 000000094h]
    fmul dword ptr [esp + 20]
    fld dword ptr [esp + 000000088h]
    fmul dword ptr [esp + 16]
    faddp st(1)
    fld dword ptr [esp + 124]
    fmul dword ptr [esp + 12]
    faddp st(1)
    fadd dword ptr [eax]
    fstp dword ptr [esp + 28]
    fld dword ptr [esp + 000000098h]
    fmul dword ptr [esp + 20]
    fld dword ptr [esp + 00000008Ch]
    fmul dword ptr [esp + 16]
    faddp st(1)
    fld dword ptr [esp + 000000080h]
    fmul dword ptr [esp + 12]
    faddp st(1)
    fadd dword ptr [eax + 4]
    fstp dword ptr [esp + 32]
    fld dword ptr [esp + 24]
    fmul dword ptr [esi + 20]
    fld dword ptr [esp + 32]
    fmul dword ptr [esi + 44]
    faddp st(1)
    fld dword ptr [esp + 28]
    fmul dword ptr [esi + 32]
    faddp st(1)
    fstp dword ptr [esp + 40]
    fld dword ptr [esp + 24]
    fmul dword ptr [esi + 24]
    fld dword ptr [esp + 32]
    fmul dword ptr [esi + 48]
    faddp st(1)
    fld dword ptr [esp + 28]
    fmul dword ptr [esi + 36]
    faddp st(1)
    fstp dword ptr [esp + 44]
    fld dword ptr [esp + 24]
    fmul dword ptr [esi + 28]
    fld dword ptr [esp + 32]
    fmul dword ptr [esi + 52]
    faddp st(1)
    fld dword ptr [esp + 28]
    fmul dword ptr [esi + 40]
    faddp st(1)
    fstp dword ptr [esp + 48]
    fld dword ptr [esp + 40]
    fadd dword ptr [esi + 60]
    fstp dword ptr [esp + 40]
    fld dword ptr [esp + 44]
    fadd dword ptr [esi + 64]
    fstp dword ptr [esp + 44]
    fld dword ptr [esp + 48]
    mov eax, dword ptr [g_101DA9C8]
    fadd dword ptr [esi + 68]
    mov edx, dword ptr [eax + 000249D4Ch]
    lea ecx, [eax + 000249D4Ch]
    mov eax, dword ptr [eax + 000249D50h]
    fstp dword ptr [esp + 48]
    add edi, 12
    inc edx
    cmp edx, eax
    mov dword ptr [esp + 80], ecx
    jg L4
    mov edx, dword ptr [g_101DA9C8]
    add edx, 000249D48h
    cmp dword ptr [edx], 0
    mov dword ptr [esp + 64], edx
    jne L3
    imul eax, eax, 44
    push eax
    call dword ptr [fp_101D49DC]
    mov ecx, dword ptr [esp + 68]
    mov edx, dword ptr [esp + 68]
    mov dword ptr [ecx], eax
    mov ecx, dword ptr [esp + 84]
    add esp, 4
L3:
    mov eax, dword ptr [ecx]
    imul eax, eax, 44
    add eax, dword ptr [edx]
    mov edx, dword ptr [esp + 52]
    mov dword ptr [eax], edx
    mov edx, dword ptr [esp + 56]
    mov dword ptr [eax + 4], edx
    mov edx, dword ptr [esp + 60]
    mov dword ptr [eax + 8], edx
    mov edx, dword ptr [esp + 40]
    mov dword ptr [eax + 12], edx
    mov edx, dword ptr [esp + 44]
    mov dword ptr [eax + 16], edx
    mov edx, dword ptr [esp + 48]
    mov dword ptr [eax + 20], edx
    mov edx, 03F800000h
    mov dword ptr [eax + 24], edx
    mov dword ptr [eax + 28], edx
    mov dword ptr [eax + 32], edx
    xor edx, edx
    mov dword ptr [eax + 36], edx
    mov dword ptr [eax + 40], edx
    inc dword ptr [ecx]
L4:
    dec dword ptr [esp + 68]
    jne L2
    mov edx, dword ptr [esp + 72]
    mov edi, dword ptr [esp + 76]
L5:
    mov ebp, dword ptr [esp + 36]
    inc edx
    add ebp, 32
    cmp edx, edi
    mov dword ptr [esp + 72], edx
    mov dword ptr [esp + 36], ebp
    jl L1
    pop ebp
L6:
    pop edi
    pop ebx
    add esp, 0000003A8h
    ret
FUN_1001da80 ENDP
END
