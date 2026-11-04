.686
.MODEL FLAT, C
.CODE
FUN_1001fdd0 PROC
    push ecx
    push ebx
    mov ebx, dword ptr [ecx]
    push esi
    mov esi, eax
    xor eax, eax
    test ebx, ebx
    setge al
    mov ebx, edx
    dec eax
    and eax, 12
    fld dword ptr [eax + edx]
    sub ebx, eax
    fmul dword ptr [ecx]
    xor eax, eax
    fadd dword ptr [esi]
    fld dword ptr [ebx + 12]
    mov ebx, dword ptr [ecx + 12]
    fmul dword ptr [ecx]
    test ebx, ebx
    setge al
    mov ebx, edx
    fadd dword ptr [esi]
    dec eax
    and eax, 12
    fld dword ptr [eax + edx + 4]
    sub ebx, eax
    fmul dword ptr [ecx + 12]
    xor eax, eax
    fadd st(2)
    fstp dword ptr [esp + 8]
    fld dword ptr [ebx + 16]
    mov ebx, dword ptr [ecx + 24]
    fmul dword ptr [ecx + 12]
    test ebx, ebx
    setge al
    mov ebx, edx
    fadd st(1)
    fstp st(2)
    fstp st(0)
    dec eax
    and eax, 12
    fld dword ptr [eax + edx + 8]
    sub ebx, eax
    fmul dword ptr [ecx + 24]
    fadd dword ptr [esp + 8]
    fstp dword ptr [esp + 8]
    fld dword ptr [ebx + 20]
    fmul dword ptr [ecx + 24]
    faddp st(1)
    fld dword ptr [edi]
    fcomp dword ptr [esp + 8]
    fnstsw ax
    test ah, 65
    jne L0
    mov eax, dword ptr [esp + 8]
    mov dword ptr [edi], eax
L0:
    fcom dword ptr [edi + 12]
    fnstsw ax
    test ah, 65
    jne L1
    fstp dword ptr [edi + 12]
    jmp L2
L1:
    fstp st(0)
L2:
    mov ebx, dword ptr [ecx + 4]
    xor eax, eax
    test ebx, ebx
    setge al
    mov ebx, edx
    dec eax
    and eax, 12
    fld dword ptr [eax + edx]
    sub ebx, eax
    fmul dword ptr [ecx + 4]
    xor eax, eax
    fadd dword ptr [esi + 4]
    fld dword ptr [ebx + 12]
    mov ebx, dword ptr [ecx + 16]
    fmul dword ptr [ecx + 4]
    test ebx, ebx
    setge al
    mov ebx, edx
    fadd dword ptr [esi + 4]
    dec eax
    and eax, 12
    fld dword ptr [eax + edx + 4]
    sub ebx, eax
    fmul dword ptr [ecx + 16]
    xor eax, eax
    fadd st(2)
    fstp dword ptr [esp + 8]
    fld dword ptr [ebx + 16]
    mov ebx, dword ptr [ecx + 28]
    fmul dword ptr [ecx + 16]
    test ebx, ebx
    setge al
    mov ebx, edx
    fadd st(1)
    fstp st(2)
    fstp st(0)
    dec eax
    and eax, 12
    fld dword ptr [eax + edx + 8]
    sub ebx, eax
    fmul dword ptr [ecx + 28]
    fadd dword ptr [esp + 8]
    fstp dword ptr [esp + 8]
    fld dword ptr [ebx + 20]
    fmul dword ptr [ecx + 28]
    faddp st(1)
    fld dword ptr [edi + 4]
    fcomp dword ptr [esp + 8]
    fnstsw ax
    test ah, 65
    jne L3
    mov eax, dword ptr [esp + 8]
    mov dword ptr [edi + 4], eax
L3:
    fcom dword ptr [edi + 16]
    fnstsw ax
    test ah, 65
    jne L4
    fstp dword ptr [edi + 16]
    jmp L5
L4:
    fstp st(0)
L5:
    mov ebx, dword ptr [ecx + 8]
    xor eax, eax
    test ebx, ebx
    setge al
    mov ebx, edx
    dec eax
    and eax, 12
    fld dword ptr [eax + edx]
    sub ebx, eax
    fmul dword ptr [ecx + 8]
    xor eax, eax
    fadd dword ptr [esi + 8]
    fld dword ptr [ebx + 12]
    mov ebx, dword ptr [ecx + 32]
    fmul dword ptr [ecx + 8]
    fadd dword ptr [esi + 8]
    mov esi, dword ptr [ecx + 20]
    test esi, esi
    setge al
    mov esi, edx
    dec eax
    and eax, 12
    fld dword ptr [eax + edx + 4]
    sub esi, eax
    fmul dword ptr [ecx + 20]
    xor eax, eax
    test ebx, ebx
    setge al
    fadd st(2)
    fstp dword ptr [esp + 8]
    fld dword ptr [esi + 16]
    pop esi
    fmul dword ptr [ecx + 20]
    pop ebx
    dec eax
    and eax, 12
    fadd st(1)
    fstp st(2)
    fstp st(0)
    fld dword ptr [eax + edx + 8]
    sub edx, eax
    fmul dword ptr [ecx + 32]
    fadd dword ptr [esp]
    fstp dword ptr [esp]
    fld dword ptr [edx + 20]
    fmul dword ptr [ecx + 32]
    faddp st(1)
    fld dword ptr [edi + 8]
    fcomp dword ptr [esp]
    fnstsw ax
    test ah, 65
    jne L6
    mov ecx, dword ptr [esp]
    mov dword ptr [edi + 8], ecx
L6:
    fcom dword ptr [edi + 20]
    fnstsw ax
    test ah, 65
    jne L7
    fstp dword ptr [edi + 20]
    pop ecx
    ret
L7:
    fstp st(0)
    pop ecx
    ret
FUN_1001fdd0 ENDP
END
