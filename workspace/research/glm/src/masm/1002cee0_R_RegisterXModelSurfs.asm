.686
.MODEL FLAT, C
EXTRN g_1019BDB0:DWORD
EXTRN g_1019BDB4:DWORD
.CODE
R_RegisterXModelSurfs PROC
    push ecx
    mov ecx, dword ptr [esp + 8]
    movsx edx, word ptr [ecx + 6]
    cmp edx, -1
    mov eax, dword ptr [ecx + 12]
    push ebx
    push ebp
    push esi
    push edi
    je L3
    movsx edi, word ptr [ecx + 2]
    test edi, edi
    mov esi, dword ptr [esp + 28]
    je L9
    mov ebx, dword ptr [esp + 40]
    mov dword ptr [esp + 24], edi
    mov edi, dword ptr [esp + 32]
    lea ecx, [eax + 52]
L0:
    test ebx, ebx
    mov ebp, dword ptr [esp + 36]
    je L1
    fld dword ptr [edx + esi + 32]
    add ebx, 12
    fmul dword ptr [ecx - 44]
    mov dword ptr [esp + 40], ebx
    fld dword ptr [eax]
    fmul dword ptr [edx + esi]
    faddp st(1)
    fld dword ptr [edx + esi + 16]
    fmul dword ptr [ecx - 48]
    faddp st(1)
    fstp dword ptr [ebx - 12]
    fld dword ptr [eax]
    fmul dword ptr [edx + esi + 4]
    fld dword ptr [ecx - 44]
    fmul dword ptr [edx + esi + 36]
    faddp st(1)
    fld dword ptr [ecx - 48]
    fmul dword ptr [edx + esi + 20]
    faddp st(1)
    fstp dword ptr [ebx - 8]
    fld dword ptr [eax]
    fmul dword ptr [edx + esi + 8]
    fld dword ptr [ecx - 44]
    fmul dword ptr [edx + esi + 40]
    faddp st(1)
    fld dword ptr [ecx - 48]
    fmul dword ptr [edx + esi + 24]
    faddp st(1)
    fstp dword ptr [ebx - 4]
L1:
    test ebp, ebp
    je L2
    mov ebx, dword ptr [ecx - 24]
    mov dword ptr [ebp], ebx
    mov ebx, dword ptr [ecx - 8]
    mov dword ptr [ebp + 4], ebx
    mov ebx, dword ptr [esp + 40]
    add ebp, 8
    mov dword ptr [esp + 36], ebp
L2:
    fld dword ptr [ecx]
    mov ebp, dword ptr [esp + 24]
    fmul dword ptr [edx + esi + 16]
    add eax, 64
    fld dword ptr [edx + esi + 32]
    add ecx, 64
    fmul dword ptr [ecx - 60]
    add edi, 12
    dec ebp
    mov dword ptr [esp + 24], ebp
    faddp st(1)
    fld dword ptr [ecx - 68]
    fmul dword ptr [edx + esi]
    faddp st(1)
    fadd dword ptr [edx + esi + 48]
    fstp dword ptr [edi - 12]
    fld dword ptr [edx + esi + 4]
    fmul dword ptr [ecx - 68]
    fld dword ptr [ecx - 64]
    fmul dword ptr [edx + esi + 20]
    faddp st(1)
    fld dword ptr [ecx - 60]
    fmul dword ptr [edx + esi + 36]
    faddp st(1)
    fadd dword ptr [edx + esi + 52]
    fstp dword ptr [edi - 8]
    fld dword ptr [edx + esi + 8]
    fmul dword ptr [ecx - 68]
    fld dword ptr [ecx - 64]
    fmul dword ptr [edx + esi + 24]
    faddp st(1)
    fld dword ptr [ecx - 60]
    fmul dword ptr [edx + esi + 40]
    faddp st(1)
    fadd dword ptr [edx + esi + 56]
    fstp dword ptr [edi - 4]
    jne L0
    pop edi
    pop esi
    pop ebp
    pop ebx
    pop ecx
    ret
L3:
    movsx ecx, word ptr [ecx + 2]
    test ecx, ecx
    je L9
    mov edi, dword ptr [esp + 28]
    mov ebx, dword ptr [esp + 40]
    mov edx, dword ptr [esp + 32]
    mov dword ptr [esp + 24], ecx
    lea ebx, [ebx]
L4:
    test ebx, ebx
    je L5
    movsx ecx, word ptr [eax + 62]
    fld dword ptr [ecx + edi + 16]
    add ecx, edi
    fmul dword ptr [eax + 4]
    add ebx, 12
    fld dword ptr [ecx + 32]
    fmul dword ptr [eax + 8]
    faddp st(1)
    fld dword ptr [eax]
    fmul dword ptr [ecx]
    faddp st(1)
    fstp dword ptr [ebx - 12]
    fld dword ptr [ecx + 20]
    fmul dword ptr [eax + 4]
    fld dword ptr [ecx + 4]
    fmul dword ptr [eax]
    faddp st(1)
    fld dword ptr [ecx + 36]
    fmul dword ptr [eax + 8]
    faddp st(1)
    fstp dword ptr [ebx - 8]
    fld dword ptr [ecx + 24]
    fmul dword ptr [eax + 4]
    fld dword ptr [ecx + 8]
    fmul dword ptr [eax]
    faddp st(1)
    fld dword ptr [ecx + 40]
    fmul dword ptr [eax + 8]
    faddp st(1)
    fstp dword ptr [ebx - 4]
L5:
    movsx ecx, word ptr [eax + 62]
    fld dword ptr [ecx + edi + 32]
    add ecx, edi
    fmul dword ptr [eax + 56]
    fld dword ptr [ecx + 16]
    fmul dword ptr [eax + 52]
    faddp st(1)
    fld dword ptr [eax + 48]
    fmul dword ptr [ecx]
    faddp st(1)
    fadd dword ptr [ecx + 48]
    fstp dword ptr [edx]
    fld dword ptr [ecx + 4]
    fmul dword ptr [eax + 48]
    fld dword ptr [ecx + 36]
    fmul dword ptr [eax + 56]
    faddp st(1)
    fld dword ptr [ecx + 20]
    fmul dword ptr [eax + 52]
    faddp st(1)
    fadd dword ptr [ecx + 52]
    fstp dword ptr [edx + 4]
    fld dword ptr [ecx + 8]
    fmul dword ptr [eax + 48]
    fld dword ptr [ecx + 40]
    fmul dword ptr [eax + 56]
    faddp st(1)
    fld dword ptr [ecx + 24]
    fmul dword ptr [eax + 52]
    faddp st(1)
    fadd dword ptr [ecx + 56]
    fstp dword ptr [edx + 8]
    movzx esi, byte ptr [eax + 60]
    test esi, esi
    je L7
    movzx ecx, byte ptr [eax + 61]
    mov dword ptr [esp + 16], ecx
    add eax, 64
    fild dword ptr [esp + 16]
    fmul dword ptr [g_1019BDB4]
    fld st(0)
    fmul dword ptr [edx]
    fstp dword ptr [edx]
    fld st(0)
    fmul dword ptr [edx + 4]
    fstp dword ptr [edx + 4]
    fmul dword ptr [edx + 8]
    fstp dword ptr [edx + 8]
L6:
    movzx ebp, word ptr [eax + 14]
    movsx ecx, word ptr [eax + 12]
    add ecx, edi
    mov dword ptr [esp + 16], ebp
    dec esi
    add eax, 16
    test esi, esi
    fild dword ptr [esp + 16]
    fmul dword ptr [g_1019BDB0]
    fld dword ptr [ecx + 16]
    fmul dword ptr [eax - 12]
    fld dword ptr [ecx + 32]
    fmul dword ptr [eax - 8]
    faddp st(1)
    fld dword ptr [eax - 16]
    fmul dword ptr [ecx]
    faddp st(1)
    fadd dword ptr [ecx + 48]
    fmul st(1)
    fadd dword ptr [edx]
    fstp dword ptr [edx]
    fld dword ptr [ecx + 20]
    fmul dword ptr [eax - 12]
    fld dword ptr [ecx + 4]
    fmul dword ptr [eax - 16]
    faddp st(1)
    fld dword ptr [ecx + 36]
    fmul dword ptr [eax - 8]
    faddp st(1)
    fadd dword ptr [ecx + 52]
    fmul st(1)
    fadd dword ptr [edx + 4]
    fstp dword ptr [edx + 4]
    fld dword ptr [ecx + 24]
    fmul dword ptr [eax - 12]
    fld dword ptr [ecx + 8]
    fmul dword ptr [eax - 16]
    faddp st(1)
    fld dword ptr [ecx + 40]
    fmul dword ptr [eax - 8]
    faddp st(1)
    fadd dword ptr [ecx + 56]
    fmul st(1)
    fadd dword ptr [edx + 8]
    fstp dword ptr [edx + 8]
    fstp st(0)
    jne L6
    jmp L8
L7:
    add eax, 64
L8:
    mov ecx, dword ptr [esp + 24]
    add edx, 12
    dec ecx
    mov dword ptr [esp + 24], ecx
    jne L4
L9:
    pop edi
    pop esi
    pop ebp
    pop ebx
    pop ecx
    ret
R_RegisterXModelSurfs ENDP
END
