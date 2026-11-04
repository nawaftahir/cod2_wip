.686
.MODEL FLAT, C
EXTRN sub_1010AB03:PROC
EXTRN g_1019BC78:DWORD
EXTRN g_1019BC84:DWORD
.CODE
FUN_1005e2c0 PROC
    sub esp, 92
    fld dword ptr [eax + 20]
    push esi
    fsub dword ptr [eax + 28]
    or esi, 0FFFFFFFFh
    mov dword ptr [esp + 8], 0
    fstp dword ptr [esp + 32]
    mov ecx, dword ptr [esp + 32]
    fld dword ptr [eax + 24]
    mov dword ptr [esp + 60], ecx
    fsub dword ptr [eax + 8]
    fstp dword ptr [esp + 36]
    mov ecx, dword ptr [esp + 36]
    fld dword ptr [eax + 4]
    mov dword ptr [esp + 76], ecx
    fsub dword ptr [eax + 12]
    fstp dword ptr [esp + 40]
    fld dword ptr [eax + 32]
    fadd dword ptr [eax]
    fadd dword ptr [eax + 16]
    fadd dword ptr [g_1019BC78]
    fstp dword ptr [esp + 44]
    fld dword ptr [eax]
    fsub dword ptr [eax + 16]
    fsub dword ptr [eax + 32]
    fadd dword ptr [g_1019BC78]
    fstp dword ptr [esp + 48]
    fld dword ptr [eax + 4]
    fadd dword ptr [eax + 12]
    fstp dword ptr [esp + 52]
    mov edx, dword ptr [esp + 52]
    fld dword ptr [eax + 24]
    mov dword ptr [esp + 64], edx
    fadd dword ptr [eax + 8]
    fstp dword ptr [esp + 56]
    mov edx, dword ptr [esp + 56]
    fld dword ptr [eax + 16]
    mov dword ptr [esp + 80], edx
    fsub dword ptr [eax]
    mov edx, dword ptr [esp + 40]
    mov dword ptr [esp + 92], edx
    fsub dword ptr [eax + 32]
    fadd dword ptr [g_1019BC78]
    fstp dword ptr [esp + 68]
    fld dword ptr [eax + 28]
    fadd dword ptr [eax + 20]
    fstp dword ptr [esp + 72]
    mov ecx, dword ptr [esp + 72]
    fld dword ptr [eax + 32]
    mov dword ptr [esp + 84], ecx
    fsub dword ptr [eax + 16]
    fsub dword ptr [eax]
    fadd dword ptr [g_1019BC78]
    fstp dword ptr [esp + 88]
    fld dword ptr [esp + 40]
    fmul dword ptr [esp + 40]
    fstp dword ptr [esp + 28]
    fld dword ptr [esp + 36]
    fmul dword ptr [esp + 36]
    fstp dword ptr [esp + 20]
    fld dword ptr [esp + 32]
    fmul dword ptr [esp + 32]
    fstp dword ptr [esp + 12]
    fld dword ptr [esp + 44]
    fmul dword ptr [esp + 44]
    fadd dword ptr [esp + 12]
    fadd dword ptr [esp + 20]
    fadd dword ptr [esp + 28]
    fstp dword ptr [esp + 4]
    fld dword ptr [g_1019BC84]
    fcomp dword ptr [esp + 4]
    fnstsw ax
    test ah, 1
    je L0
    mov eax, dword ptr [esp + 4]
    mov dword ptr [esp + 8], eax
    xor esi, esi
L0:
    fld dword ptr [esp + 56]
    fmul dword ptr [esp + 56]
    fstp dword ptr [esp + 24]
    fld dword ptr [esp + 52]
    fmul dword ptr [esp + 52]
    fstp dword ptr [esp + 16]
    fld dword ptr [esp + 48]
    fmul dword ptr [esp + 48]
    fadd dword ptr [esp + 16]
    fadd dword ptr [esp + 24]
    fadd dword ptr [esp + 12]
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 8]
    fcomp dword ptr [esp + 4]
    fnstsw ax
    test ah, 1
    je L1
    mov ecx, dword ptr [esp + 4]
    mov dword ptr [esp + 8], ecx
    mov esi, 1
L1:
    fld dword ptr [esp + 72]
    fmul dword ptr [esp + 72]
    fstp dword ptr [esp + 12]
    fld dword ptr [esp + 68]
    fmul dword ptr [esp + 68]
    fadd dword ptr [esp + 12]
    fadd dword ptr [esp + 16]
    fadd dword ptr [esp + 20]
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 8]
    fcomp dword ptr [esp + 4]
    fnstsw ax
    test ah, 1
    je L2
    mov edx, dword ptr [esp + 4]
    mov dword ptr [esp + 8], edx
    mov esi, 2
L2:
    fld dword ptr [esp + 88]
    fmul dword ptr [esp + 88]
    fadd dword ptr [esp + 12]
    fadd dword ptr [esp + 24]
    fadd dword ptr [esp + 28]
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 8]
    fcomp dword ptr [esp + 4]
    fnstsw ax
    test ah, 1
    je L3
    mov eax, dword ptr [esp + 4]
    mov dword ptr [esp + 8], eax
    mov esi, 3
L3:
    fld dword ptr [esp + 8]
    call sub_1010AB03
    fstp dword ptr [esp + 28]
    fld dword ptr [esp + 28]
    shl esi, 4
    fdivr dword ptr [g_1019BC78]
    lea eax, [esp + esi + 32]
    pop esi
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 4]
    fmul dword ptr [eax]
    fstp dword ptr [edi]
    fld dword ptr [esp + 4]
    fmul dword ptr [eax + 4]
    fstp dword ptr [edi + 4]
    fld dword ptr [esp + 4]
    fmul dword ptr [eax + 8]
    fstp dword ptr [edi + 8]
    fld dword ptr [esp + 4]
    fmul dword ptr [eax + 12]
    fstp dword ptr [edi + 12]
    add esp, 92
    ret
FUN_1005e2c0 ENDP
END
