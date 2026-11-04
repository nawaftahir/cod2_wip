.686
.MODEL FLAT, C
EXTRN sub_1001D759:PROC
EXTRN sub_1001D871:PROC
EXTRN sub_1001DA19:PROC
EXTRN sub_1001DECB:PROC
EXTRN sub_1001DED9:PROC
EXTRN sub_1001DEE0:PROC
EXTRN sub_1001DEE6:PROC
EXTRN sub_1001DEF5:PROC
EXTRN sub_1001E11F:PROC
EXTRN sub_1001E152:PROC
EXTRN EXTRN fp_101D49DC:DWORD:DWORD
EXTRN EXTRN fp_101D4BA8:DWORD:DWORD
EXTRN EXTRN fp_101D4BD0:DWORD:DWORD
EXTRN EXTRN fp_101D4BD4:DWORD:DWORD
EXTRN EXTRN fp_101D4BF4:DWORD:DWORD
EXTRN EXTRN g_101DA9C8:DWORD:DWORD
.CODE
FUN_1001da80 PROC
    sub sub esp, 03A8h
    push push ebx
    mov mov ebx, eax
    push push edi
    lea lea eax, [esp + 0A8h]
    push push eax
    lea lea ecx, [esp + 09Ch]
    push push ecx
    lea lea edx, [esp + 0B8h]
    push push edx
    mov mov eax, esi
    call sub_1001DA19
    mov mov eax, dword ptr [esp + 03C0h]
    mov mov eax, dword ptr [eax + 8]
    add add esp, 12
    test test eax, eax
    je L0
    lea lea ecx, [esp + 098h]
    push push ecx
    push push ebx
    push push eax
    call dword ptr [fp_101D4BF4]
    add add esp, 12
    push push ebx
    call dword ptr [fp_101D4BD0]
    lea lea edx, [esp + 01B4h]
    push push edx
    mov mov edi, eax
    push push ebx
    mov mov dword ptr [esp + 84], edi
    call dword ptr [fp_101D4BD4]
    push push ebx
    call dword ptr [fp_101D4BA8]
    add add esp, 16
    test test eax, eax
    je sub_1001DECB
    xor xor edx, edx
    test test edi, edi
    mov mov dword ptr [esp + 68], edx
    jle sub_1001DED9
    push push ebp
    lea lea ebp, [eax + 20]
    mov mov dword ptr [esp + 36], ebp
    mov mov ecx, edx
    and and ecx, 31
    mov mov eax, 1
    shl shl eax, cl
    mov mov ecx, edx
    sar sar ecx, 5
    test test dword ptr [esp + ecx*4 + 09Ch], eax
    je sub_1001DEE6
    mov mov ebx, dword ptr [esp + edx*4 + 01B4h]
    mov mov edi, 010190278h
    add add ebp, -20
    mov mov dword ptr [esp + 68], 12
    mov mov eax, dword ptr [edi]
    lea lea edx, [eax + eax*2]
    mov mov eax, dword ptr [ebx + edx*4]
    mov mov dword ptr [esp + 12], eax
    mov mov eax, dword ptr [edi + 4]
    lea lea ecx, [eax + eax*2]
    mov mov edx, dword ptr [ebx + ecx*4 + 4]
    mov mov eax, dword ptr [edi + 8]
    lea lea eax, [eax + eax*2]
    mov mov ecx, dword ptr [ebx + eax*4 + 8]
    mov mov dword ptr [esp + 20], ecx
    lea lea ecx, [esp + 84]
    mov mov eax, ebp
    mov mov dword ptr [esp + 16], edx
    call sub_1001D759
    fld fld dword ptr [esp + 108]
    fmul fmul dword ptr [esp + 20]
    fld fld dword ptr [esp + 96]
    fmul fmul dword ptr [esp + 16]
    faddp faddp st(1)
    fld fld dword ptr [esp + 84]
    fmul fmul dword ptr [esp + 12]
    faddp faddp st(1)
    fadd fadd dword ptr [ebp + 16]
    fstp fstp dword ptr [esp + 24]
    fld fld dword ptr [esp + 112]
    fmul fmul dword ptr [esp + 20]
    fld fld dword ptr [esp + 100]
    fmul fmul dword ptr [esp + 16]
    faddp faddp st(1)
    fld fld dword ptr [esp + 88]
    fmul fmul dword ptr [esp + 12]
    faddp faddp st(1)
    fadd fadd dword ptr [ebp + 20]
    fstp fstp dword ptr [esp + 28]
    fld fld dword ptr [esp + 116]
    fmul fmul dword ptr [esp + 20]
    fld fld dword ptr [esp + 104]
    fmul fmul dword ptr [esp + 16]
    faddp faddp st(1)
    fld fld dword ptr [esp + 92]
    fmul fmul dword ptr [esp + 12]
    faddp faddp st(1)
    fadd fadd dword ptr [ebp + 24]
    fstp fstp dword ptr [esp + 32]
    fld fld dword ptr [esp + 32]
    fmul fmul dword ptr [esi + 44]
    fld fld dword ptr [esp + 28]
    fmul fmul dword ptr [esi + 32]
    faddp faddp st(1)
    fld fld dword ptr [esp + 24]
    fmul fmul dword ptr [esi + 20]
    faddp faddp st(1)
    fstp fstp dword ptr [esp + 52]
    fld fld dword ptr [esp + 32]
    fmul fmul dword ptr [esi + 48]
    fld fld dword ptr [esp + 28]
    fmul fmul dword ptr [esi + 36]
    faddp faddp st(1)
    fld fld dword ptr [esp + 24]
    fmul fmul dword ptr [esi + 24]
    faddp faddp st(1)
    fstp fstp dword ptr [esp + 56]
    fld fld dword ptr [esp + 32]
    fmul fmul dword ptr [esi + 52]
    fld fld dword ptr [esp + 28]
    fmul fmul dword ptr [esi + 40]
    faddp faddp st(1)
    fld fld dword ptr [esp + 24]
    fmul fmul dword ptr [esi + 28]
    faddp faddp st(1)
    fstp fstp dword ptr [esp + 60]
    fld fld dword ptr [esp + 52]
    fadd fadd dword ptr [esi + 60]
    fstp fstp dword ptr [esp + 52]
    fld fld dword ptr [esp + 56]
    fadd fadd dword ptr [esi + 64]
    fstp fstp dword ptr [esp + 56]
    fld fld dword ptr [esp + 60]
    fadd fadd dword ptr [esi + 68]
    fstp fstp dword ptr [esp + 60]
    mov mov eax, dword ptr [edi + 12]
    add add edi, 12
    lea lea edx, [eax + eax*2]
    mov mov eax, dword ptr [ebx + edx*4]
    mov mov dword ptr [esp + 12], eax
    mov mov eax, dword ptr [edi + 4]
    lea lea ecx, [eax + eax*2]
    mov mov edx, dword ptr [ebx + ecx*4 + 4]
    mov mov eax, dword ptr [edi + 8]
    lea lea eax, [eax + eax*2]
    mov mov ecx, dword ptr [ebx + eax*4 + 8]
    mov mov dword ptr [esp + 20], ecx
    lea lea ecx, [esp + 120]
    mov mov eax, ebp
    mov mov dword ptr [esp + 16], edx
    call sub_1001D871
    fld fld dword ptr [esp + 090h]
    fmul fmul dword ptr [esp + 20]
    mov mov eax, dword ptr [esp + 36]
    fld fld dword ptr [esp + 084h]
    fmul fmul dword ptr [esp + 16]
    faddp faddp st(1)
    fld fld dword ptr [esp + 120]
    fmul fmul dword ptr [esp + 12]
    faddp faddp st(1)
    fadd fadd dword ptr [eax - 4]
    fstp fstp dword ptr [esp + 24]
    fld fld dword ptr [esp + 094h]
    fmul fmul dword ptr [esp + 20]
    fld fld dword ptr [esp + 088h]
    fmul fmul dword ptr [esp + 16]
    faddp faddp st(1)
    fld fld dword ptr [esp + 124]
    fmul fmul dword ptr [esp + 12]
    faddp faddp st(1)
    fadd fadd dword ptr [eax]
    fstp fstp dword ptr [esp + 28]
    fld fld dword ptr [esp + 098h]
    fmul fmul dword ptr [esp + 20]
    fld fld dword ptr [esp + 08Ch]
    fmul fmul dword ptr [esp + 16]
    faddp faddp st(1)
    fld fld dword ptr [esp + 080h]
    fmul fmul dword ptr [esp + 12]
    faddp faddp st(1)
    fadd fadd dword ptr [eax + 4]
    fstp fstp dword ptr [esp + 32]
    fld fld dword ptr [esp + 24]
    fmul fmul dword ptr [esi + 20]
    fld fld dword ptr [esp + 32]
    fmul fmul dword ptr [esi + 44]
    faddp faddp st(1)
    fld fld dword ptr [esp + 28]
    fmul fmul dword ptr [esi + 32]
    faddp faddp st(1)
    fstp fstp dword ptr [esp + 40]
    fld fld dword ptr [esp + 24]
    fmul fmul dword ptr [esi + 24]
    fld fld dword ptr [esp + 32]
    fmul fmul dword ptr [esi + 48]
    faddp faddp st(1)
    fld fld dword ptr [esp + 28]
    fmul fmul dword ptr [esi + 36]
    faddp faddp st(1)
    fstp fstp dword ptr [esp + 44]
    fld fld dword ptr [esp + 24]
    fmul fmul dword ptr [esi + 28]
    fld fld dword ptr [esp + 32]
    fmul fmul dword ptr [esi + 52]
    faddp faddp st(1)
    fld fld dword ptr [esp + 28]
    fmul fmul dword ptr [esi + 40]
    faddp faddp st(1)
    fstp fstp dword ptr [esp + 48]
    fld fld dword ptr [esp + 40]
    fadd fadd dword ptr [esi + 60]
    fstp fstp dword ptr [esp + 40]
    fld fld dword ptr [esp + 44]
    fadd fadd dword ptr [esi + 64]
    fstp fstp dword ptr [esp + 44]
    fld fld dword ptr [esp + 48]
    mov mov eax, dword ptr [g_101DA9C8]
    fadd fadd dword ptr [esi + 68]
    mov mov edx, dword ptr [eax + 0249D4Ch]
    lea lea ecx, [eax + 0249D4Ch]
    mov mov eax, dword ptr [eax + 0249D50h]
    fstp fstp dword ptr [esp + 48]
    add add edi, 12
    inc inc edx
    cmp cmp edx, eax
    mov mov dword ptr [esp + 80], ecx
    jg sub_1001E152
    mov mov edx, dword ptr [g_101DA9C8]
    add add edx, 0249D48h
    cmp cmp dword ptr [edx], 0
    mov mov dword ptr [esp + 64], edx
    jne sub_1001E11F
    imul imul eax, eax, 44
    push push eax
    call dword ptr [fp_101D49DC]
    mov mov ecx, dword ptr [esp + 68]
    mov mov edx, dword ptr [esp + 68]
    mov mov dword ptr [ecx], eax
    mov mov ecx, dword ptr [esp + 84]
    add add esp, 4
    mov mov eax, dword ptr [ecx]
    imul imul eax, eax, 44
    add add eax, dword ptr [edx]
    mov mov edx, dword ptr [esp + 52]
    mov mov dword ptr [eax], edx
    mov mov edx, dword ptr [esp + 56]
    mov mov dword ptr [eax + 4], edx
    mov mov edx, dword ptr [esp + 60]
    mov mov dword ptr [eax + 8], edx
    mov mov edx, dword ptr [esp + 40]
    mov mov dword ptr [eax + 12], edx
    mov mov edx, dword ptr [esp + 44]
    mov mov dword ptr [eax + 16], edx
    mov mov edx, dword ptr [esp + 48]
    mov mov dword ptr [eax + 20], edx
    mov mov edx, 03F800000h
    mov mov dword ptr [eax + 24], edx
    mov mov dword ptr [eax + 28], edx
    mov mov dword ptr [eax + 32], edx
    xor xor edx, edx
    mov mov dword ptr [eax + 36], edx
    mov mov dword ptr [eax + 40], edx
    inc inc dword ptr [ecx]
    dec dec dword ptr [esp + 68]
    jne sub_1001DEF5
    mov mov edx, dword ptr [esp + 72]
    mov mov edi, dword ptr [esp + 76]
    mov mov ebp, dword ptr [esp + 36]
    inc inc edx
    add add ebp, 32
    cmp cmp edx, edi
    mov mov dword ptr [esp + 72], edx
    mov mov dword ptr [esp + 36], ebp
    jl sub_1001DEE0
    pop pop ebp
    pop pop edi
    pop pop ebx
    add add esp, 03A8h
    ret ret
FUN_1001da80 ENDP
END
