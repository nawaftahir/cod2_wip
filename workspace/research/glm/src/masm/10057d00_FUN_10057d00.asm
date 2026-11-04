.686
.MODEL FLAT, C
EXTRN sub_10059172:PROC
EXTRN sub_100F694E:PROC
EXTRN g_1019BC84:DWORD
.CODE
FUN_10057d00 PROC
L0:
    sub esp, 12
    mov eax, dword ptr [esp + 28]
    push ebx
    mov ebx, dword ptr [esp + 36]
    push ebp
    mov ebp, dword ptr [esp + 32]
    fld dword ptr [ebx + ebp*8 + 4]
    push esi
    fsub dword ptr [ebx + eax*8 + 4]
    push edi
    lea esi, [esp + 16]
    fstp dword ptr [esp + 16]
    fld dword ptr [ebx + eax*8]
    fsub dword ptr [ebx + ebp*8]
    fstp dword ptr [esp + 20]
    call sub_10059172
    mov esi, dword ptr [esp + 36]
    fstp st(0)
    fld dword ptr [esp + 20]
    xor ecx, ecx
    fmul dword ptr [ebx + ebp*8 + 4]
    dec esi
    fld dword ptr [esp + 16]
    or edx, 0FFFFFFFFh
    test esi, esi
    fmul dword ptr [ebx + ebp*8]
    mov dword ptr [esp + 36], 03A83126Fh
    faddp st(1)
    fstp dword ptr [esp + 24]
    jl L12
    mov edi, dword ptr [esp + 32]
    jmp L1
    lea esp, [esp]
L1:
    fld dword ptr [esp + 20]
    fmul dword ptr [edi + ecx*8 + 4]
    fld dword ptr [esp + 16]
    fmul dword ptr [edi + ecx*8]
    faddp st(1)
    fsub dword ptr [esp + 24]
    fcom dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 65
    jnp L5
L2:
    fld dword ptr [esp + 36]
    fcomp st(1)
    fnstsw ax
    test ah, 5
    jp L3
    fstp dword ptr [esp + 36]
    mov edx, ecx
    jmp L4
L3:
    fstp st(0)
L4:
    inc ecx
    cmp ecx, esi
    jg L11
    fld dword ptr [esp + 20]
    fmul dword ptr [edi + ecx*8 + 4]
    fld dword ptr [esp + 16]
    fmul dword ptr [edi + ecx*8]
    faddp st(1)
    fsub dword ptr [esp + 24]
    fcom dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 65
    jp L2
L5:
    fstp st(0)
    fld dword ptr [esp + 20]
    fmul dword ptr [edi + esi*8 + 4]
    fld dword ptr [esp + 16]
    fmul dword ptr [edi + esi*8]
    faddp st(1)
    fsub dword ptr [esp + 24]
    fcom dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 65
    je L7
L6:
    dec esi
    fstp st(0)
    cmp ecx, esi
    jg L11
    fld dword ptr [esp + 20]
    fmul dword ptr [edi + esi*8 + 4]
    fld dword ptr [esp + 16]
    fmul dword ptr [edi + esi*8]
    faddp st(1)
    fsub dword ptr [esp + 24]
    fcom dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 65
    jne L6
L7:
    fld dword ptr [esp + 36]
    fcomp st(1)
    fnstsw ax
    test ah, 5
    jp L8
    fstp dword ptr [esp + 36]
    mov edx, ecx
    jmp L9
L8:
    fstp st(0)
L9:
    cmp ecx, esi
    je L10
    fld dword ptr [edi + ecx*8]
    mov eax, dword ptr [edi + esi*8]
    fld dword ptr [edi + ecx*8 + 4]
    mov dword ptr [edi + ecx*8], eax
    mov eax, dword ptr [edi + esi*8 + 4]
    fxch st(1)
    mov dword ptr [edi + ecx*8 + 4], eax
    fstp dword ptr [edi + esi*8]
    fstp dword ptr [edi + esi*8 + 4]
L10:
    inc ecx
    dec esi
    cmp ecx, esi
    jle L1
L11:
    test edx, edx
    jge L13
L12:
    mov eax, dword ptr [esp + 52]
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 12
    ret
L13:
    cmp edx, esi
    je L14
    fld dword ptr [edi + edx*8]
    mov ecx, dword ptr [edi + esi*8]
    fld dword ptr [edi + edx*8 + 4]
    mov dword ptr [edi + edx*8], ecx
    mov eax, dword ptr [edi + esi*8 + 4]
    fxch st(1)
    mov dword ptr [edi + edx*8 + 4], eax
    fstp dword ptr [edi + esi*8]
    fstp dword ptr [edi + esi*8 + 4]
L14:
    mov ecx, dword ptr [esp + 52]
    inc ebp
    sub ecx, ebp
    shl ecx, 3
    push ecx
    lea ebx, [ebx + ebp*8]
    lea edx, [ebx + 8]
    push ebx
    push edx
    call sub_100F694E
    mov eax, dword ptr [edi + esi*8]
    mov dword ptr [ebx], eax
    mov eax, dword ptr [esp + 64]
    mov ecx, dword ptr [edi + esi*8 + 4]
    add esp, 12
    inc eax
    test esi, esi
    mov dword ptr [ebx + 4], ecx
    je L16
    mov ecx, dword ptr [esp + 44]
    test ecx, ecx
    je L15
    mov edx, dword ptr [esp + 40]
    add edx, 2
    mov dword ptr [esp + 44], edx
L15:
    mov ebx, dword ptr [esp + 48]
    push eax
    mov eax, dword ptr [esp + 48]
    push ebx
    push eax
    push ebp
    push esi
    push edi
    call L0
    mov ecx, dword ptr [esp + 64]
    push eax
    push ebx
    push ebp
    push ecx
    push esi
    push edi
    call L0
    add esp, 48
L16:
    pop edi
FUN_10057d00 ENDP
END
