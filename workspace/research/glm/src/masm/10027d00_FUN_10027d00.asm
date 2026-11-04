.686
.MODEL FLAT, C
EXTRN sub_1010AA89:PROC
EXTRN fp_101D4B90:DWORD
EXTRN g_1019BC84:DWORD
EXTRN g_1019BDC8:DWORD
EXTRN g_1019BDF4:DWORD
EXTRN g_1019BEF4:DWORD
EXTRN g_1067850C:DWORD
EXTRN g_10678510:DWORD
.CODE
FUN_10027d00 PROC
    sub esp, 76
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 92]
    push esi
    xor esi, esi
    xor eax, eax
    mov ecx, 04CBEBC20h
L0:
    mov dword ptr [ebp + eax*8], 0FFFFFFFFh
    mov dword ptr [ebp + eax*8 + 4], ecx
    inc eax
    cmp eax, 24
    jne L0
    cmp dword ptr [g_1067850C], esi
    mov ebx, ebp
    mov dword ptr [esp + 12], esi
    jle L12
    mov dword ptr [esp + 24], esi
    mov dword ptr [esp + 16], 010678AC8h
    push edi
L1:
    mov eax, dword ptr [g_10678510]
    add esi, eax
    cmp dword ptr [esi], 0
    jne L11
    mov eax, dword ptr [esi + 4]
    test al, 8
    jne L11
    and eax, 000000E00h
    mov edi, eax
    cmp edi, 000000200h
    je L11
    mov eax, dword ptr [esp + 20]
    lea ecx, [esp + 68]
    push ecx
    mov ecx, dword ptr [eax]
    lea edx, [esp + 84]
    push edx
    push ecx
    call dword ptr [fp_101D4B90]
    fld dword ptr [esp + 80]
    fsub dword ptr [esp + 92]
    add esp, 12
    fstp dword ptr [esp + 32]
    fld dword ptr [esp + 72]
    fsub dword ptr [esp + 84]
    fstp dword ptr [esp + 36]
    fld dword ptr [esp + 76]
    fsub dword ptr [esp + 88]
    fstp dword ptr [esp + 40]
    fld dword ptr [esp + 32]
    fmul dword ptr [esp + 32]
    fstp dword ptr [esp + 56]
    fld dword ptr [esp + 36]
    fmul dword ptr [esp + 36]
    fstp dword ptr [esp + 60]
    fld dword ptr [esp + 40]
    fmul dword ptr [esp + 40]
    fstp dword ptr [esp + 64]
    fld dword ptr [esp + 60]
    fcomp dword ptr [esp + 56]
    fnstsw ax
    test ah, 65
    jne L2
    mov ecx, 1
    jmp L3
L2:
    xor ecx, ecx
L3:
    fld dword ptr [esp + 64]
    fcomp dword ptr [esp + ecx*4 + 56]
    fnstsw ax
    test ah, 65
    jne L4
    mov ecx, 2
L4:
    mov edx, dword ptr [esp + ecx*4 + 32]
    fld dword ptr [g_1019BC84]
    mov dword ptr [esp + 24], edx
    fld dword ptr [esp + 24]
    fucompp
    fnstsw ax
    test ah, 68
    jnp L11
    mov eax, dword ptr [esp + 96]
    fld dword ptr [esi + 60]
    fsub dword ptr [eax]
    fstp dword ptr [esp + 44]
    fld dword ptr [esi + 64]
    fsub dword ptr [eax + 4]
    fstp dword ptr [esp + 48]
    fld dword ptr [esi + 68]
    fsub dword ptr [eax + 8]
    fstp dword ptr [esp + 52]
    fld dword ptr [esp + 52]
    fmul dword ptr [esp + 52]
    fld dword ptr [esp + 48]
    fmul dword ptr [esp + 48]
    faddp st(1)
    fld dword ptr [esp + 44]
    fmul dword ptr [esp + 44]
    faddp st(1)
    fstp dword ptr [esp + 100]
    fld dword ptr [esp + 100]
    call sub_1010AA89
    fstp dword ptr [esp + 100]
    fld dword ptr [esp + 100]
    fstp dword ptr [esp + 100]
    fld dword ptr [esp + 100]
    fdiv dword ptr [esp + 24]
    fstp dword ptr [esp + 100]
    fld dword ptr [esp + 100]
    fcomp dword ptr [g_1019BEF4]
    fnstsw ax
    test ah, 1
    je L11
    cmp edi, 000000800h
    jne L5
    mov dword ptr [esp + 100], 0
    jmp L8
L5:
    cmp edi, 000000600h
    jne L6
    fld dword ptr [esp + 100]
    fmul dword ptr [g_1019BDC8]
    jmp L7
L6:
    cmp edi, 000000400h
    jne L8
    fld dword ptr [esp + 100]
    fmul dword ptr [g_1019BDF4]
L7:
    fstp dword ptr [esp + 100]
L8:
    fld dword ptr [esp + 100]
    fcomp dword ptr [ebx + 4]
    fnstsw ax
    test ah, 65
    je L11
    mov ecx, dword ptr [esp + 100]
    mov eax, dword ptr [esp + 16]
    mov dword ptr [ebx + 4], ecx
    mov dword ptr [ebx], eax
    mov ebx, ebp
    lea ecx, [ebp + 8]
    mov edx, 23
L9:
    fld dword ptr [ecx + 4]
    fcomp dword ptr [ebx + 4]
    fnstsw ax
    test ah, 65
    jne L10
    mov ebx, ecx
L10:
    add ecx, 8
    dec edx
    jne L9
L11:
    mov eax, dword ptr [esp + 16]
    mov esi, dword ptr [esp + 28]
    mov edx, dword ptr [esp + 20]
    mov ecx, dword ptr [g_1067850C]
    inc eax
    add esi, 116
    add edx, 52
    cmp eax, ecx
    mov dword ptr [esp + 16], eax
    mov dword ptr [esp + 28], esi
    mov dword ptr [esp + 20], edx
    jl L1
    pop edi
L12:
    pop esi
    pop ebp
    pop ebx
    add esp, 76
    ret
FUN_10027d00 ENDP
END
