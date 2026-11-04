.686
.MODEL FLAT, C
EXTRN sub_100060D5:PROC
EXTRN fp_101D49DC:DWORD
EXTRN g_1019BC78:DWORD
EXTRN g_1019BDE4:DWORD
EXTRN g_101CE5BC:DWORD
EXTRN g_101CE6A0:DWORD
EXTRN g_101CE6E0:DWORD
EXTRN g_101DA9C8:DWORD
.CODE
FUN_10007000 PROC
    sub esp, 000000080h
    mov eax, dword ptr [g_101CE5BC]
    fld dword ptr [edx]
    fld dword ptr [ecx + 4]
    push ebx
    fld st(0)
    push ebp
    fmul dword ptr [eax + 16]
    push esi
    fld st(2)
    push edi
    fmul dword ptr [eax]
    faddp st(1)
    fadd dword ptr [eax + 48]
    fstp dword ptr [esp + 20]
    fld st(0)
    fmul dword ptr [eax + 20]
    fld st(2)
    fmul dword ptr [eax + 4]
    faddp st(1)
    fadd dword ptr [eax + 52]
    fstp dword ptr [esp + 24]
    fld st(0)
    fmul dword ptr [eax + 24]
    fld st(2)
    fmul dword ptr [eax + 8]
    faddp st(1)
    fadd dword ptr [eax + 56]
    fstp dword ptr [esp + 28]
    fmul dword ptr [eax + 28]
    fxch st(1)
    fmul dword ptr [eax + 12]
    faddp st(1)
    fadd dword ptr [eax + 60]
    fdivr dword ptr [g_1019BC78]
    fld dword ptr [esp + 20]
    fmul st(1)
    fstp dword ptr [esp + 84]
    fld dword ptr [esp + 24]
    fmul st(1)
    fstp dword ptr [esp + 88]
    fmul dword ptr [esp + 28]
    fst dword ptr [esp + 92]
    fld dword ptr [edx]
    fld dword ptr [edx + 4]
    fld st(0)
    fmul dword ptr [eax + 16]
    fld st(2)
    fmul dword ptr [eax]
    faddp st(1)
    fadd dword ptr [eax + 48]
    fstp dword ptr [esp + 20]
    fld st(0)
    fmul dword ptr [eax + 20]
    fld st(2)
    fmul dword ptr [eax + 4]
    faddp st(1)
    fadd dword ptr [eax + 52]
    fstp dword ptr [esp + 24]
    fld st(0)
    fmul dword ptr [eax + 24]
    fld st(2)
    fmul dword ptr [eax + 8]
    faddp st(1)
    fadd dword ptr [eax + 56]
    fstp dword ptr [esp + 28]
    fmul dword ptr [eax + 28]
    fxch st(1)
    fmul dword ptr [eax + 12]
    faddp st(1)
    fadd dword ptr [eax + 60]
    fdivr dword ptr [g_1019BC78]
    fld dword ptr [esp + 20]
    fmul st(1)
    fstp dword ptr [esp + 96]
    fld dword ptr [esp + 24]
    fmul st(1)
    fstp dword ptr [esp + 100]
    fmul dword ptr [esp + 28]
    fstp dword ptr [esp + 104]
    fld dword ptr [ecx]
    fld dword ptr [edx + 4]
    fld st(0)
    lea edx, [esp + 36]
    fmul dword ptr [eax + 16]
    push edx
    fld st(2)
    push 4
    fmul dword ptr [eax]
    faddp st(1)
    fadd dword ptr [eax + 48]
    fstp dword ptr [esp + 28]
    fld st(0)
    fmul dword ptr [eax + 20]
    fld st(2)
    fmul dword ptr [eax + 4]
    faddp st(1)
    fadd dword ptr [eax + 52]
    fstp dword ptr [esp + 32]
    fld st(0)
    fmul dword ptr [eax + 24]
    fld st(2)
    fmul dword ptr [eax + 8]
    faddp st(1)
    fadd dword ptr [eax + 56]
    fstp dword ptr [esp + 36]
    fmul dword ptr [eax + 28]
    fxch st(1)
    fmul dword ptr [eax + 12]
    faddp st(1)
    fadd dword ptr [eax + 60]
    fdivr dword ptr [g_1019BC78]
    fld dword ptr [esp + 28]
    fmul st(1)
    fstp dword ptr [esp + 116]
    fld dword ptr [esp + 32]
    fmul st(1)
    fstp dword ptr [esp + 120]
    fmul dword ptr [esp + 36]
    fstp dword ptr [esp + 124]
    fld dword ptr [ecx]
    fld dword ptr [ecx + 4]
    mov ecx, dword ptr [esp + 96]
    fld st(0)
    mov dword ptr [esp + 000000090h], ecx
    fmul dword ptr [eax + 16]
    fld st(2)
    fmul dword ptr [eax]
    faddp st(1)
    fadd dword ptr [eax + 48]
    fstp dword ptr [esp + 28]
    fld st(0)
    fmul dword ptr [eax + 20]
    fld st(2)
    fmul dword ptr [eax + 4]
    faddp st(1)
    fadd dword ptr [eax + 52]
    fstp dword ptr [esp + 32]
    fld st(0)
    fmul dword ptr [eax + 24]
    fld st(2)
    fmul dword ptr [eax + 8]
    faddp st(1)
    fadd dword ptr [eax + 56]
    fstp dword ptr [esp + 36]
    fmul dword ptr [eax + 28]
    fxch st(1)
    fmul dword ptr [eax + 12]
    faddp st(1)
    fadd dword ptr [eax + 60]
    mov eax, dword ptr [esp + 92]
    mov dword ptr [esp + 00000008Ch], eax
    lea eax, [esp + 92]
    fdivr dword ptr [g_1019BC78]
    fld dword ptr [esp + 28]
    fmul st(1)
    fstp dword ptr [esp + 000000080h]
    fld dword ptr [esp + 32]
    fmul st(1)
    fstp dword ptr [esp + 000000084h]
    fmul dword ptr [esp + 36]
    fstp dword ptr [esp + 000000088h]
    fstp dword ptr [esp + 000000094h]
    call sub_100060D5
    mov esi, dword ptr [esp + 00000009Ch]
    xor edx, edx
    add esp, 8
    add esi, 4
    mov dword ptr [esp + 16], edx
    xor edi, edi
    lea ebx, [ebx]
L0:
    mov eax, dword ptr [esp + edi + 36]
    mov ecx, dword ptr [esp + edi + 40]
    mov dword ptr [esi - 4], eax
    mov eax, dword ptr [esp + edi + 44]
    mov dword ptr [esi + 4], eax
    cmp dword ptr [esp + 0000000A0h], edx
    mov dword ptr [esi], ecx
    jne L2
    mov ebp, dword ptr [esp + 000000098h]
    xor ebx, ebx
    cmp ebp, edx
    jle L2
    mov ecx, dword ptr [esp + 00000009Ch]
    add ecx, 4
L1:
    fld dword ptr [ecx - 4]
    mov eax, dword ptr [g_101CE6A0]
    fmul dword ptr [esi - 4]
    fld dword ptr [ecx + 4]
    fmul dword ptr [esi + 4]
    faddp st(1)
    fld dword ptr [ecx]
    fmul dword ptr [esi]
    faddp st(1)
    fcomp dword ptr [eax + 8]
    fnstsw ax
    test ah, 65
    je L6
    inc ebx
    add ecx, 12
    cmp ebx, ebp
    jl L1
L2:
    mov eax, dword ptr [g_101CE6E0]
    cmp dword ptr [eax + 8], edx
    je L4
    mov ebx, dword ptr [g_101DA9C8]
    mov ecx, dword ptr [ebx + 000249D4Ch]
    mov eax, dword ptr [ebx + 000249D50h]
    lea ebp, [ebx + 000249D4Ch]
    inc ecx
    cmp ecx, eax
    jg L4
    mov ecx, dword ptr [ebx + 000249D48h]
    add ebx, 000249D48h
    cmp ecx, edx
    jne L3
    imul eax, eax, 44
    push eax
    call dword ptr [fp_101D49DC]
    add esp, 4
    mov dword ptr [ebx], eax
    xor edx, edx
L3:
    mov eax, dword ptr [ebp]
    mov ecx, dword ptr [ebx]
    imul eax, eax, 44
    add eax, ecx
    mov ecx, dword ptr [esp + edi + 84]
    mov dword ptr [eax], ecx
    mov ecx, dword ptr [esp + edi + 88]
    mov dword ptr [eax + 4], ecx
    mov ecx, dword ptr [esp + edi + 92]
    mov dword ptr [eax + 8], ecx
    mov ecx, dword ptr [esp + edi + 96]
    mov dword ptr [eax + 12], ecx
    mov ecx, dword ptr [esp + edi + 100]
    mov dword ptr [eax + 16], ecx
    mov ecx, dword ptr [esp + edi + 104]
    mov dword ptr [eax + 20], ecx
    mov dword ptr [eax + 24], edx
    mov ecx, 03F400000h
    mov dword ptr [eax + 28], ecx
    mov dword ptr [eax + 32], ecx
    mov dword ptr [eax + 36], 03F800000h
    mov dword ptr [eax + 40], edx
    inc dword ptr [ebp]
L4:
    mov ebp, dword ptr [esi - 4]
    fld dword ptr [esp + edi + 92]
    fmul dword ptr [esi + 4]
    mov ebx, dword ptr [esi + 4]
    fld dword ptr [esp + edi + 84]
    cmp ebp, edx
    fmul dword ptr [esi - 4]
    mov ebp, dword ptr [esi]
    setle al
    dec al
    faddp st(1)
    fld dword ptr [esp + edi + 88]
    fmul dword ptr [esi]
    faddp st(1)
    and eax, 12
    cmp ebp, edx
    fsubr dword ptr [g_1019BDE4]
    setle cl
    dec cl
    and cl, 12
    add cl, 4
    fstp dword ptr [esi + 8]
    mov byte ptr [esi + 12], al
    cmp ebx, edx
    setle al
    dec al
    mov byte ptr [esi + 13], cl
    mov ecx, dword ptr [esp + 16]
    and al, 12
    add al, 8
    mov byte ptr [esi + 14], al
    inc ecx
    mov byte ptr [esi + 15], 0000000FFh
    mov dword ptr [esp + 16], ecx
    add esi, 20
L5:
    add edi, 12
    cmp edi, 48
    jl L0
    mov eax, dword ptr [esp + 16]
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 000000080h
    ret
L6:
    mov ecx, dword ptr [g_101CE6E0]
    test byte ptr [ecx + 8], 2
    je L5
    mov ebx, dword ptr [g_101DA9C8]
    mov ecx, dword ptr [ebx + 000249D4Ch]
    mov eax, dword ptr [ebx + 000249D50h]
    lea ebp, [ebx + 000249D4Ch]
    inc ecx
    cmp ecx, eax
    jg L5
    mov ecx, dword ptr [ebx + 000249D48h]
    add ebx, 000249D48h
    cmp ecx, edx
    jne L7
    imul eax, eax, 44
    push eax
    call dword ptr [fp_101D49DC]
    add esp, 4
    mov dword ptr [ebx], eax
    xor edx, edx
L7:
    mov eax, dword ptr [ebp]
    mov ecx, dword ptr [ebx]
    imul eax, eax, 44
    add eax, ecx
    mov ecx, dword ptr [esp + edi + 84]
    mov dword ptr [eax], ecx
    mov ecx, dword ptr [esp + edi + 88]
    mov dword ptr [eax + 4], ecx
    mov ecx, dword ptr [esp + edi + 92]
    mov dword ptr [eax + 8], ecx
    mov ecx, dword ptr [esp + edi + 96]
    mov dword ptr [eax + 12], ecx
    mov ecx, dword ptr [esp + edi + 100]
    mov dword ptr [eax + 16], ecx
    mov ecx, dword ptr [esp + edi + 104]
    mov dword ptr [eax + 20], ecx
    mov dword ptr [eax + 24], edx
    mov ecx, 03F000000h
    mov dword ptr [eax + 28], ecx
    mov dword ptr [eax + 32], ecx
    mov dword ptr [eax + 36], 03F800000h
    mov dword ptr [eax + 40], edx
    inc dword ptr [ebp]
    jmp L5
FUN_10007000 ENDP
END
