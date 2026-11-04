.686
.MODEL FLAT, C
EXTRN sub_1002D1D9:PROC
EXTRN sub_1002D2EA:PROC
EXTRN sub_1002D300:PROC
EXTRN sub_1002D3A5:PROC
EXTRN sub_1002D3CC:PROC
EXTRN sub_1002D459:PROC
EXTRN EXTRN g_1019BDB0:DWORD:DWORD
EXTRN EXTRN g_1019BDB4:DWORD:DWORD
.CODE
R_RegisterXModelSurfs PROC
    push push ecx
    mov mov ecx, dword ptr [esp + 8]
    movsx movsx edx, word ptr [ecx + 6]
    cmp cmp edx, -1
    mov mov eax, dword ptr [ecx + 12]
    push push ebx
    push push ebp
    push push esi
    push push edi
    je L1
    movsx movsx edi, word ptr [ecx + 2]
    test test edi, edi
    mov mov esi, dword ptr [esp + 28]
    je sub_1002D1D9
    mov mov ebx, dword ptr [esp + 40]
    mov mov dword ptr [esp + 24], edi
    mov mov edi, dword ptr [esp + 32]
    lea lea ecx, [eax + 52]
    test test ebx, ebx
    mov mov ebp, dword ptr [esp + 36]
    je L0
    fld fld dword ptr [edx + esi + 32]
    add add ebx, 12
    fmul fmul dword ptr [ecx - 44]
    mov mov dword ptr [esp + 40], ebx
    fld fld dword ptr [eax]
    fmul fmul dword ptr [edx + esi]
    faddp faddp st(1)
    fld fld dword ptr [edx + esi + 16]
    fmul fmul dword ptr [ecx - 48]
    faddp faddp st(1)
    fstp fstp dword ptr [ebx - 12]
    fld fld dword ptr [eax]
    fmul fmul dword ptr [edx + esi + 4]
    fld fld dword ptr [ecx - 44]
    fmul fmul dword ptr [edx + esi + 36]
    faddp faddp st(1)
    fld fld dword ptr [ecx - 48]
    fmul fmul dword ptr [edx + esi + 20]
    faddp faddp st(1)
    fstp fstp dword ptr [ebx - 8]
    fld fld dword ptr [eax]
    fmul fmul dword ptr [edx + esi + 8]
    fld fld dword ptr [ecx - 44]
    fmul fmul dword ptr [edx + esi + 40]
    faddp faddp st(1)
    fld fld dword ptr [ecx - 48]
    fmul fmul dword ptr [edx + esi + 24]
    faddp faddp st(1)
    fstp fstp dword ptr [ebx - 4]
    test test ebp, ebp
    je L2
    mov mov ebx, dword ptr [ecx - 24]
    mov mov dword ptr [ebp], ebx
    mov mov ebx, dword ptr [ecx - 8]
    mov mov dword ptr [ebp + 4], ebx
    mov mov ebx, dword ptr [esp + 40]
    add add ebp, 8
    mov mov dword ptr [esp + 36], ebp
    fld fld dword ptr [ecx]
    mov mov ebp, dword ptr [esp + 24]
    fmul fmul dword ptr [edx + esi + 16]
    add add eax, 64
    fld fld dword ptr [edx + esi + 32]
    add add ecx, 64
    fmul fmul dword ptr [ecx - 60]
    add add edi, 12
    dec dec ebp
    mov mov dword ptr [esp + 24], ebp
    faddp faddp st(1)
    fld fld dword ptr [ecx - 68]
    fmul fmul dword ptr [edx + esi]
    faddp faddp st(1)
    fadd fadd dword ptr [edx + esi + 48]
    fstp fstp dword ptr [edi - 12]
    fld fld dword ptr [edx + esi + 4]
    fmul fmul dword ptr [ecx - 68]
    fld fld dword ptr [ecx - 64]
    fmul fmul dword ptr [edx + esi + 20]
    faddp faddp st(1)
    fld fld dword ptr [ecx - 60]
    fmul fmul dword ptr [edx + esi + 36]
    faddp faddp st(1)
    fadd fadd dword ptr [edx + esi + 52]
    fstp fstp dword ptr [edi - 8]
    fld fld dword ptr [edx + esi + 8]
    fmul fmul dword ptr [ecx - 68]
    fld fld dword ptr [ecx - 64]
    fmul fmul dword ptr [edx + esi + 24]
    faddp faddp st(1)
    fld fld dword ptr [ecx - 60]
    fmul fmul dword ptr [edx + esi + 40]
    faddp faddp st(1)
    fadd fadd dword ptr [edx + esi + 56]
    fstp fstp dword ptr [edi - 4]
    jne L3
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    pop pop ecx
    ret ret
    movsx movsx ecx, word ptr [ecx + 2]
    test test ecx, ecx
    je sub_1002D2EA
    mov mov edi, dword ptr [esp + 28]
    mov mov ebx, dword ptr [esp + 40]
    mov mov edx, dword ptr [esp + 32]
    mov mov dword ptr [esp + 24], ecx
    lea lea ebx, [ebx]
    test test ebx, ebx
    je sub_1002D1D9
    movsx movsx ecx, word ptr [eax + 62]
    fld fld dword ptr [ecx + edi + 16]
    add add ecx, edi
    fmul fmul dword ptr [eax + 4]
    add add ebx, 12
    fld fld dword ptr [ecx + 32]
    fmul fmul dword ptr [eax + 8]
    faddp faddp st(1)
    fld fld dword ptr [eax]
    fmul fmul dword ptr [ecx]
    faddp faddp st(1)
    fstp fstp dword ptr [ebx - 12]
    fld fld dword ptr [ecx + 20]
    fmul fmul dword ptr [eax + 4]
    fld fld dword ptr [ecx + 4]
    fmul fmul dword ptr [eax]
    faddp faddp st(1)
    fld fld dword ptr [ecx + 36]
    fmul fmul dword ptr [eax + 8]
    faddp faddp st(1)
    fstp fstp dword ptr [ebx - 8]
    fld fld dword ptr [ecx + 24]
    fmul fmul dword ptr [eax + 4]
    fld fld dword ptr [ecx + 8]
    fmul fmul dword ptr [eax]
    faddp faddp st(1)
    fld fld dword ptr [ecx + 40]
    fmul fmul dword ptr [eax + 8]
    faddp faddp st(1)
    fstp fstp dword ptr [ebx - 4]
    movsx movsx ecx, word ptr [eax + 62]
    fld fld dword ptr [ecx + edi + 32]
    add add ecx, edi
    fmul fmul dword ptr [eax + 56]
    fld fld dword ptr [ecx + 16]
    fmul fmul dword ptr [eax + 52]
    faddp faddp st(1)
    fld fld dword ptr [eax + 48]
    fmul fmul dword ptr [ecx]
    faddp faddp st(1)
    fadd fadd dword ptr [ecx + 48]
    fstp fstp dword ptr [edx]
    fld fld dword ptr [ecx + 4]
    fmul fmul dword ptr [eax + 48]
    fld fld dword ptr [ecx + 36]
    fmul fmul dword ptr [eax + 56]
    faddp faddp st(1)
    fld fld dword ptr [ecx + 20]
    fmul fmul dword ptr [eax + 52]
    faddp faddp st(1)
    fadd fadd dword ptr [ecx + 52]
    fstp fstp dword ptr [edx + 4]
    fld fld dword ptr [ecx + 8]
    fmul fmul dword ptr [eax + 48]
    fld fld dword ptr [ecx + 40]
    fmul fmul dword ptr [eax + 56]
    faddp faddp st(1)
    fld fld dword ptr [ecx + 24]
    fmul fmul dword ptr [eax + 52]
    faddp faddp st(1)
    fadd fadd dword ptr [ecx + 56]
    fstp fstp dword ptr [edx + 8]
    movzx movzx esi, byte ptr [eax + 60]
    test test esi, esi
    je sub_1002D3A5
    movzx movzx ecx, byte ptr [eax + 61]
    mov mov dword ptr [esp + 16], ecx
    add add eax, 64
    fild fild dword ptr [esp + 16]
    fmul fmul dword ptr [g_1019BDB4]
    fld fld st(0)
    fmul fmul dword ptr [edx]
    fstp fstp dword ptr [edx]
    fld fld st(0)
    fmul fmul dword ptr [edx + 4]
    fstp fstp dword ptr [edx + 4]
    fmul fmul dword ptr [edx + 8]
    fstp fstp dword ptr [edx + 8]
    movzx movzx ebp, word ptr [eax + 14]
    movsx movsx ecx, word ptr [eax + 12]
    add add ecx, edi
    mov mov dword ptr [esp + 16], ebp
    dec dec esi
    add add eax, 16
    test test esi, esi
    fild fild dword ptr [esp + 16]
    fmul fmul dword ptr [g_1019BDB0]
    fld fld dword ptr [ecx + 16]
    fmul fmul dword ptr [eax - 12]
    fld fld dword ptr [ecx + 32]
    fmul fmul dword ptr [eax - 8]
    faddp faddp st(1)
    fld fld dword ptr [eax - 16]
    fmul fmul dword ptr [ecx]
    faddp faddp st(1)
    fadd fadd dword ptr [ecx + 48]
    fmul fmul st(1)
    fadd fadd dword ptr [edx]
    fstp fstp dword ptr [edx]
    fld fld dword ptr [ecx + 20]
    fmul fmul dword ptr [eax - 12]
    fld fld dword ptr [ecx + 4]
    fmul fmul dword ptr [eax - 16]
    faddp faddp st(1)
    fld fld dword ptr [ecx + 36]
    fmul fmul dword ptr [eax - 8]
    faddp faddp st(1)
    fadd fadd dword ptr [ecx + 52]
    fmul fmul st(1)
    fadd fadd dword ptr [edx + 4]
    fstp fstp dword ptr [edx + 4]
    fld fld dword ptr [ecx + 24]
    fmul fmul dword ptr [eax - 12]
    fld fld dword ptr [ecx + 8]
    fmul fmul dword ptr [eax - 16]
    faddp faddp st(1)
    fld fld dword ptr [ecx + 40]
    fmul fmul dword ptr [eax - 8]
    faddp faddp st(1)
    fadd fadd dword ptr [ecx + 56]
    fmul fmul st(1)
    fadd fadd dword ptr [edx + 8]
    fstp fstp dword ptr [edx + 8]
    fstp fstp st(0)
    jne sub_1002D3CC
    jmp sub_1002D459
    add add eax, 64
    mov mov ecx, dword ptr [esp + 24]
    add add edx, 12
    dec dec ecx
    mov mov dword ptr [esp + 24], ecx
    jne sub_1002D300
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    pop pop ecx
    ret ret
R_RegisterXModelSurfs ENDP
END
