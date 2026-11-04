.686
.MODEL FLAT, C
EXTRN g_1019BC78:DWORD
EXTRN g_1019BC84:DWORD
EXTRN g_1019BDAC:DWORD
EXTRN g_1019BDC8:DWORD
EXTRN g_101CE5B8:DWORD
EXTRN g_101CE788:DWORD
.CODE
FUN_10006da0 PROC
    sub esp, 000000420h
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 00000042Ch]
    mov dword ptr [esi], 03F800000h
    mov dword ptr [esi + 4], 03F800000h
    xor ebx, ebx
    test ebp, ebp
    mov dword ptr [edi], 0BF800000h
    mov dword ptr [edi + 4], 0BF800000h
    jle L5
    mov ecx, dword ptr [g_101CE5B8]
    add edx, 4
    lea esp, [esp]
L0:
    fld dword ptr [ecx + 12]
    fmul dword ptr [edx - 4]
    fld dword ptr [ecx + 44]
    fmul dword ptr [edx + 4]
    faddp st(1)
    fld dword ptr [ecx + 28]
    fmul dword ptr [edx]
    faddp st(1)
    fadd dword ptr [ecx + 60]
    fcom dword ptr [g_1019BDAC]
    fnstsw ax
    test ah, 5
    jnp L6
    fdivr dword ptr [g_1019BC78]
    fld dword ptr [ecx + 32]
    fmul dword ptr [edx + 4]
    fld dword ptr [ecx + 16]
    fmul dword ptr [edx]
    faddp st(1)
    fld dword ptr [edx - 4]
    fmul dword ptr [ecx]
    faddp st(1)
    fadd dword ptr [ecx + 48]
    fmul st(1)
    fstp dword ptr [esp + ebx*8 + 8]
    fld dword ptr [ecx + 4]
    fmul dword ptr [edx - 4]
    fld dword ptr [ecx + 36]
    fmul dword ptr [edx + 4]
    faddp st(1)
    fld dword ptr [ecx + 20]
    fmul dword ptr [edx]
    faddp st(1)
    fadd dword ptr [ecx + 52]
    fmul st(1)
    fstp dword ptr [esp + ebx*8 + 12]
    fstp st(0)
    fld dword ptr [esi]
    fcomp dword ptr [esp + ebx*8 + 8]
    fnstsw ax
    test ah, 65
    jne L1
    mov eax, dword ptr [esp + ebx*8 + 8]
    mov dword ptr [esi], eax
    mov ecx, dword ptr [g_101CE5B8]
L1:
    fld dword ptr [edi]
    fcomp dword ptr [esp + ebx*8 + 8]
    fnstsw ax
    test ah, 5
    jp L2
    mov ecx, dword ptr [esp + ebx*8 + 8]
    mov dword ptr [edi], ecx
    mov ecx, dword ptr [g_101CE5B8]
L2:
    fld dword ptr [esi + 4]
    fcomp dword ptr [esp + ebx*8 + 12]
    fnstsw ax
    test ah, 65
    jne L3
    mov eax, dword ptr [esp + ebx*8 + 12]
    mov dword ptr [esi + 4], eax
    mov ecx, dword ptr [g_101CE5B8]
L3:
    fld dword ptr [edi + 4]
    fcomp dword ptr [esp + ebx*8 + 12]
    fnstsw ax
    test ah, 5
    jp L4
    mov ecx, dword ptr [esp + ebx*8 + 12]
    mov dword ptr [edi + 4], ecx
    mov ecx, dword ptr [g_101CE5B8]
L4:
    inc ebx
    add edx, 12
    cmp ebx, ebp
    jl L0
L5:
    fld dword ptr [edi + 4]
    mov edx, dword ptr [g_101CE788]
    fsub dword ptr [esi + 4]
    fld dword ptr [edi]
    fsub dword ptr [esi]
    fmulp st(1)
    fmul dword ptr [g_1019BDC8]
    fcomp dword ptr [edx + 8]
    fnstsw ax
    test ah, 5
    jp L7
    mov eax, dword ptr [esp + 000000430h]
    pop ebp
    mov dword ptr [eax], 0
    pop ebx
    add esp, 000000420h
    ret
L6:
    mov edx, dword ptr [esp + 000000430h]
    fstp st(0)
    mov dword ptr [esi], 0BF800000h
    mov dword ptr [esi + 4], 0BF800000h
    pop ebp
    mov dword ptr [edi], 03F800000h
    mov dword ptr [edi + 4], 03F800000h
    mov dword ptr [edx], 1
    pop ebx
    add esp, 000000420h
    ret
L7:
    cmp ebp, 4
    fld dword ptr [g_1019BC84]
    mov ecx, dword ptr [esp + 8]
    mov dword ptr [esp + ebp*8 + 8], ecx
    mov eax, dword ptr [esp + 12]
    mov dword ptr [esp + ebp*8 + 12], eax
    mov ecx, dword ptr [esp + 16]
    mov dword ptr [esp + ebp*8 + 16], ecx
    mov eax, dword ptr [esp + 20]
    mov dword ptr [esp + ebp*8 + 20], eax
    mov eax, 1
    jl L9
    lea ecx, [ebp - 3]
    lea ecx, [ecx]
L8:
    fld dword ptr [esp + eax*8 + 20]
    add eax, 4
    cmp eax, ecx
    fsub dword ptr [esp + eax*8 - 28]
    fmul dword ptr [esp + eax*8 - 24]
    faddp st(1)
    fld dword ptr [esp + eax*8 - 4]
    fsub dword ptr [esp + eax*8 - 20]
    fmul dword ptr [esp + eax*8 - 16]
    faddp st(1)
    fld dword ptr [esp + eax*8 + 4]
    fsub dword ptr [esp + eax*8 - 12]
    fmul dword ptr [esp + eax*8 - 8]
    faddp st(1)
    fld dword ptr [esp + eax*8 + 12]
    fsub dword ptr [esp + eax*8 - 4]
    fmul dword ptr [esp + eax*8]
    faddp st(1)
    jle L8
L9:
    cmp eax, ebp
    jg L11
L10:
    fld dword ptr [esp + eax*8 + 20]
    inc eax
    cmp eax, ebp
    fsub dword ptr [esp + eax*8 - 4]
    fmul dword ptr [esp + eax*8]
    faddp st(1)
    jle L10
L11:
    fld dword ptr [g_1019BDAC]
    fmul st(1)
    fcomp dword ptr [edx + 8]
    fnstsw ax
    fstp st(0)
    test ah, 5
    jp L12
    mov ecx, dword ptr [esp + 000000430h]
    xor eax, eax
    pop ebp
    mov dword ptr [ecx], eax
    pop ebx
    add esp, 000000420h
    ret
L12:
    mov ecx, dword ptr [esp + 000000430h]
    mov eax, 1
    pop ebp
    mov dword ptr [ecx], eax
    pop ebx
    add esp, 000000420h
    ret
FUN_10006da0 ENDP
END
