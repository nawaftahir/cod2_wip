.686
.MODEL FLAT, C
EXTRN sub_10057F1A:PROC
EXTRN sub_10057F27:PROC
EXTRN sub_10057FAB:PROC
EXTRN sub_10057FB8:PROC
EXTRN sub_1005916A:PROC
EXTRN sub_100F6990:PROC
EXTRN sub_100F6A15:PROC
EXTRN g_1019BC84:DWORD
.CODE
FUN_10057f10 PROC
    sub esp, 20
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 36]
    fld dword ptr [ebp + 12]
    push esi
    fsub dword ptr [ebp + 4]
    push edi
    lea esi, [esp + 24]
    mov edi, eax
    fstp dword ptr [esp + 24]
    fld dword ptr [ebp]
    fsub dword ptr [ebp + 8]
    fstp dword ptr [esp + 28]
    call sub_1005916A
    mov esi, dword ptr [esp + 40]
    fstp st(0)
    fld dword ptr [esp + 28]
    xor ebx, ebx
    fmul dword ptr [ebp + 4]
    dec esi
    fld dword ptr [esp + 24]
    or ecx, 0FFFFFFFFh
    test esi, esi
    fmul dword ptr [ebp]
    mov dword ptr [esp + 20], 03A83126Fh
    mov dword ptr [esp + 44], 0BA83126Fh
    faddp st(1)
    mov dword ptr [esp + 16], ecx
    fstp dword ptr [esp + 32]
    jl L16
    jmp L0
    lea esp, [esp]
    nop
L0:
    fld dword ptr [esp + 28]
    fmul dword ptr [edi + ebx*8 + 4]
    fld dword ptr [esp + 24]
    fmul dword ptr [edi + ebx*8]
    faddp st(1)
    fsub dword ptr [esp + 32]
    fcom dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 5
    jnp L4
L1:
    fld dword ptr [esp + 20]
    fcomp st(1)
    fnstsw ax
    test ah, 5
    jp L2
    fstp dword ptr [esp + 20]
    mov ecx, ebx
    jmp L3
L2:
    fstp st(0)
L3:
    inc ebx
    cmp ebx, esi
    jg L15
    fld dword ptr [esp + 28]
    fmul dword ptr [edi + ebx*8 + 4]
    fld dword ptr [esp + 24]
    fmul dword ptr [edi + ebx*8]
    faddp st(1)
    fsub dword ptr [esp + 32]
    fcom dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 5
    jp L1
L4:
    fld dword ptr [esp + 44]
    fcomp st(1)
    fnstsw ax
    test ah, 65
    jne L5
    fstp dword ptr [esp + 44]
    mov dword ptr [esp + 16], ebx
    jmp L6
L5:
    fstp st(0)
L6:
    fld dword ptr [esp + 28]
    fmul dword ptr [edi + esi*8 + 4]
    fld dword ptr [esp + 24]
    fmul dword ptr [edi + esi*8]
    faddp st(1)
    fsub dword ptr [esp + 32]
    fcom dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 65
    je L10
    nop
L7:
    fld dword ptr [esp + 44]
    fcomp st(1)
    fnstsw ax
    test ah, 65
    jne L8
    fstp dword ptr [esp + 44]
    mov dword ptr [esp + 16], esi
    jmp L9
L8:
    fstp st(0)
L9:
    dec esi
    cmp ebx, esi
    jg L15
    fld dword ptr [esp + 28]
    fmul dword ptr [edi + esi*8 + 4]
    fld dword ptr [esp + 24]
    fmul dword ptr [edi + esi*8]
    faddp st(1)
    fsub dword ptr [esp + 32]
    fcom dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 65
    jne L7
L10:
    fld dword ptr [esp + 20]
    fcomp st(1)
    fnstsw ax
    test ah, 5
    jp L11
    fstp dword ptr [esp + 20]
    mov ecx, ebx
    jmp L12
L11:
    fstp st(0)
L12:
    cmp ebx, esi
    je L13
    fld dword ptr [edi + ebx*8]
    mov eax, dword ptr [edi + esi*8]
    fld dword ptr [edi + ebx*8 + 4]
    mov dword ptr [edi + ebx*8], eax
    mov edx, dword ptr [edi + esi*8 + 4]
    fxch st(1)
    mov dword ptr [edi + ebx*8 + 4], edx
    fstp dword ptr [edi + esi*8]
    fstp dword ptr [edi + esi*8 + 4]
L13:
    cmp dword ptr [esp + 16], ebx
    jne L14
    mov dword ptr [esp + 16], esi
L14:
    inc ebx
    dec esi
    cmp ebx, esi
    jle L0
L15:
    test ecx, ecx
    jge L17
    mov eax, dword ptr [esp + 16]
    test eax, eax
    jge L17
L16:
    pop edi
    pop esi
    pop ebp
    xor eax, eax
    pop ebx
    add esp, 20
    ret
L17:
    test ecx, ecx
    mov dword ptr [esp + 44], 2
    jl L19
    cmp ecx, esi
    je L18
    fld dword ptr [edi + ecx*8]
    mov eax, dword ptr [edi + esi*8]
    fld dword ptr [edi + ecx*8 + 4]
    mov dword ptr [edi + ecx*8], eax
    mov edx, dword ptr [edi + esi*8 + 4]
    fxch st(1)
    mov dword ptr [edi + ecx*8 + 4], edx
    fstp dword ptr [edi + esi*8]
    fstp dword ptr [edi + esi*8 + 4]
L18:
    lea eax, [ebp + 16]
    push 0
    push eax
    lea eax, [ebp + 24]
    push eax
    call sub_100F6990
    mov ecx, dword ptr [edi + esi*8]
    mov dword ptr [ebp + 16], ecx
    mov edx, dword ptr [edi + esi*8 + 4]
    add esp, 12
    test esi, esi
    mov dword ptr [ebp + 20], edx
    mov dword ptr [esp + 44], 3
    jle L19
    push 3
    push ebp
    push 0
    push 2
    push esi
    push edi
    call sub_10057F1A
    push eax
    push ebp
    push 2
    push 1
    push esi
    push edi
    call sub_10057F27
    add esp, 48
    mov dword ptr [esp + 44], eax
L19:
    mov eax, dword ptr [esp + 16]
    test eax, eax
    jl L21
    cmp eax, ebx
    je L20
    fld dword ptr [edi + eax*8]
    mov ecx, dword ptr [edi + ebx*8]
    fld dword ptr [edi + eax*8 + 4]
    mov dword ptr [edi + eax*8], ecx
    mov edx, dword ptr [edi + ebx*8 + 4]
    fxch st(1)
    mov dword ptr [edi + eax*8 + 4], edx
    fstp dword ptr [edi + ebx*8]
    fstp dword ptr [edi + ebx*8 + 4]
L20:
    mov eax, dword ptr [esp + 44]
    lea ecx, [eax*8 - 8]
    push ecx
    lea esi, [ebp + 8]
    lea edx, [ebp + 16]
    push esi
    push edx
    call sub_100F6A15
    mov eax, dword ptr [edi + ebx*8]
    mov edx, dword ptr [esp + 56]
    mov dword ptr [esi], eax
    mov eax, dword ptr [esp + 52]
    mov ecx, dword ptr [edi + ebx*8 + 4]
    sub eax, ebx
    add esp, 12
    mov dword ptr [esi + 4], ecx
    inc edx
    lea esi, [eax - 1]
    test esi, esi
    mov dword ptr [esp + 44], edx
    jle L21
    push edx
    push ebp
    push 2
    push 1
    lea edi, [edi + ebx*8 + 8]
    push esi
    push edi
    call sub_10057FAB
    push eax
    push ebp
    push 1
    push 0
    push esi
    push edi
    call sub_10057FB8
    add esp, 48
    mov dword ptr [esp + 44], eax
L21:
    mov eax, dword ptr [esp + 44]
FUN_10057f10 ENDP
END
