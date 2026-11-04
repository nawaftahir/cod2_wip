.686
.MODEL FLAT, C
.CODE
FUN_10006660 PROC
    push ecx
    fld dword ptr [ebx + 8]
    lea eax, [edx + edx*2]
    fmul dword ptr [ecx + 8]
    lea eax, [ebx + eax*4 - 12]
    fld dword ptr [ebx + 4]
    push esi
    fmul dword ptr [ecx + 4]
    push edi
    faddp st(1)
    fld dword ptr [ebx]
    fmul dword ptr [ecx]
    faddp st(1)
    fadd dword ptr [ecx + 12]
    fld dword ptr [eax + 8]
    fmul dword ptr [ecx + 8]
    fld dword ptr [eax + 4]
    fmul dword ptr [ecx + 4]
    faddp st(1)
    fld dword ptr [eax]
    fmul dword ptr [ecx]
    faddp st(1)
    fadd dword ptr [ecx + 12]
    fstp dword ptr [esp + 8]
    fcom dword ptr [esp + 8]
    fnstsw ax
    test ah, 65
    jne L3
    lea edi, [edx - 1]
    lea edx, [edi - 1]
    cmp edx, 4
    mov esi, 1
    jl L1
    lea edx, [ebx + 28]
L0:
    fld dword ptr [edx - 12]
    fmul dword ptr [ecx + 4]
    fld dword ptr [edx - 8]
    fmul dword ptr [ecx + 8]
    faddp st(1)
    fld dword ptr [edx - 16]
    fmul dword ptr [ecx]
    faddp st(1)
    fadd dword ptr [ecx + 12]
    fstp dword ptr [esp + 8]
    fcom dword ptr [esp + 8]
    fnstsw ax
    test ah, 65
    je L7
    fstp st(0)
    fld dword ptr [esp + 8]
    fld dword ptr [edx + 4]
    fmul dword ptr [ecx + 8]
    fld dword ptr [edx - 4]
    fmul dword ptr [ecx]
    faddp st(1)
    fld dword ptr [ecx + 4]
    fmul dword ptr [edx]
    faddp st(1)
    fadd dword ptr [ecx + 12]
    fst dword ptr [esp + 8]
    fcomp st(1)
    fnstsw ax
    test ah, 5
    jnp L7
    fstp st(0)
    fld dword ptr [esp + 8]
    fld dword ptr [edx + 12]
    fmul dword ptr [ecx + 4]
    fld dword ptr [edx + 16]
    fmul dword ptr [ecx + 8]
    faddp st(1)
    fld dword ptr [edx + 8]
    fmul dword ptr [ecx]
    faddp st(1)
    fadd dword ptr [ecx + 12]
    fst dword ptr [esp + 8]
    fcomp st(1)
    fnstsw ax
    test ah, 5
    jnp L7
    fstp st(0)
    fld dword ptr [esp + 8]
    fld dword ptr [edx + 24]
    fmul dword ptr [ecx + 4]
    fld dword ptr [edx + 28]
    fmul dword ptr [ecx + 8]
    faddp st(1)
    fld dword ptr [edx + 20]
    fmul dword ptr [ecx]
    faddp st(1)
    fadd dword ptr [ecx + 12]
    fst dword ptr [esp + 8]
    fcomp st(1)
    fnstsw ax
    test ah, 5
    jnp L7
    add esi, 4
    fstp st(0)
    fld dword ptr [esp + 8]
    lea eax, [edi - 3]
    add edx, 48
    cmp esi, eax
    jl L0
L1:
    cmp esi, edi
    jge L7
    lea edx, [esi + esi*2]
    lea edx, [ebx + edx*4 + 4]
    nop
L2:
    fld dword ptr [edx + 4]
    fmul dword ptr [ecx + 8]
    fld dword ptr [edx - 4]
    fmul dword ptr [ecx]
    faddp st(1)
    fld dword ptr [ecx + 4]
    fmul dword ptr [edx]
    faddp st(1)
    fadd dword ptr [ecx + 12]
    fstp dword ptr [esp + 8]
    fcom dword ptr [esp + 8]
    fnstsw ax
    test ah, 65
    je L7
    inc esi
    fstp st(0)
    fld dword ptr [esp + 8]
    add edx, 12
    cmp esi, edi
    jl L2
    pop edi
    pop esi
    pop ecx
    ret
L3:
    lea esi, [edx - 2]
    fstp st(0)
    cmp esi, 4
    fld dword ptr [esp + 8]
    jl L5
    lea eax, [esi + esi*2]
    lea edx, [ebx + eax*4 - 8]
L4:
    fld dword ptr [edx + 16]
    fmul dword ptr [ecx + 8]
    fld dword ptr [edx + 8]
    fmul dword ptr [ecx]
    faddp st(1)
    fld dword ptr [edx + 12]
    fmul dword ptr [ecx + 4]
    faddp st(1)
    fadd dword ptr [ecx + 12]
    fstp dword ptr [esp + 8]
    fcom dword ptr [esp + 8]
    fnstsw ax
    test ah, 65
    je L7
    fstp st(0)
    fld dword ptr [esp + 8]
    fld dword ptr [edx + 4]
    fmul dword ptr [ecx + 8]
    fld dword ptr [edx - 4]
    fmul dword ptr [ecx]
    faddp st(1)
    fld dword ptr [ecx + 4]
    fmul dword ptr [edx]
    faddp st(1)
    fadd dword ptr [ecx + 12]
    fst dword ptr [esp + 8]
    fcomp st(1)
    fnstsw ax
    test ah, 5
    jnp L7
    fstp st(0)
    fld dword ptr [esp + 8]
    fld dword ptr [edx - 8]
    fmul dword ptr [ecx + 8]
    fld dword ptr [edx - 16]
    fmul dword ptr [ecx]
    faddp st(1)
    fld dword ptr [edx - 12]
    fmul dword ptr [ecx + 4]
    faddp st(1)
    fadd dword ptr [ecx + 12]
    fst dword ptr [esp + 8]
    fcomp st(1)
    fnstsw ax
    test ah, 5
    jnp L7
    fstp st(0)
    fld dword ptr [esp + 8]
    fld dword ptr [edx - 20]
    fmul dword ptr [ecx + 8]
    fld dword ptr [edx - 28]
    fmul dword ptr [ecx]
    faddp st(1)
    fld dword ptr [edx - 24]
    fmul dword ptr [ecx + 4]
    faddp st(1)
    fadd dword ptr [ecx + 12]
    fst dword ptr [esp + 8]
    fcomp st(1)
    fnstsw ax
    test ah, 5
    jnp L7
    sub esi, 4
    fstp st(0)
    fld dword ptr [esp + 8]
    sub edx, 48
    cmp esi, 3
    jg L4
L5:
    test esi, esi
    jle L7
    lea edx, [esi + esi*2]
    lea edx, [ebx + edx*4 + 4]
L6:
    fld dword ptr [edx - 4]
    fmul dword ptr [ecx]
    fld dword ptr [edx + 4]
    fmul dword ptr [ecx + 8]
    faddp st(1)
    fld dword ptr [edx]
    fmul dword ptr [ecx + 4]
    faddp st(1)
    fadd dword ptr [ecx + 12]
    fstp dword ptr [esp + 8]
    fcom dword ptr [esp + 8]
    fnstsw ax
    test ah, 65
    je L7
    dec esi
    fstp st(0)
    fld dword ptr [esp + 8]
    sub edx, 12
    test esi, esi
    jg L6
L7:
    pop edi
    pop esi
    pop ecx
    ret
FUN_10006660 ENDP
END
