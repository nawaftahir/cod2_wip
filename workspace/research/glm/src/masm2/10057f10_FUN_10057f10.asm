.686
.MODEL FLAT, C
EXTRN sub_100581DB:PROC
EXTRN sub_100581DC:PROC
EXTRN sub_10058204:PROC
EXTRN sub_10058232:PROC
EXTRN sub_10058264:PROC
EXTRN sub_1005826C:PROC
EXTRN sub_100582B4:PROC
EXTRN sub_100582FD:PROC
EXTRN sub_1005834A:PROC
EXTRN sub_100583AA:PROC
EXTRN sub_10058409:PROC
EXTRN sub_10058469:PROC
EXTRN sub_1005916A:PROC
EXTRN sub_100F6990:PROC
EXTRN sub_100F6A15:PROC
EXTRN EXTRN g_1019BC84:DWORD:DWORD
.CODE
FUN_10057f10 PROC
    sub sub esp, 20
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 36]
    fld fld dword ptr [ebp + 12]
    push push esi
    fsub fsub dword ptr [ebp + 4]
    push push edi
    lea lea esi, [esp + 24]
    mov mov edi, eax
L1:
    fstp fstp dword ptr [esp + 24]
    fld fld dword ptr [ebp]
    fsub fsub dword ptr [ebp + 8]
    fstp fstp dword ptr [esp + 28]
    call sub_1005916A
    mov mov esi, dword ptr [esp + 40]
    fstp fstp st(0)
    fld fld dword ptr [esp + 28]
    xor xor ebx, ebx
    fmul fmul dword ptr [ebp + 4]
    dec dec esi
    fld fld dword ptr [esp + 24]
    or or ecx, -1
    test test esi, esi
    fmul fmul dword ptr [ebp]
    mov mov dword ptr [esp + 20], 03A83126Fh
    mov mov dword ptr [esp + 44], 0BA83126Fh
    faddp faddp st(1)
    mov mov dword ptr [esp + 16], ecx
    fstp fstp dword ptr [esp + 32]
    jl L11
    jmp L4
    lea lea esp, [esp]
    nop nop
    fld fld dword ptr [esp + 28]
    fmul fmul dword ptr [edi + ebx*8 + 4]
    fld fld dword ptr [esp + 24]
    fmul fmul dword ptr [edi + ebx*8]
    faddp faddp st(1)
    fsub fsub dword ptr [esp + 32]
    fcom fcom dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 5
    jnp L7
    fld fld dword ptr [esp + 20]
    fcomp fcomp st(1)
    fnstsw fnstsw ax
    test test ah, 5
    jp L5
    fstp fstp dword ptr [esp + 20]
    mov mov ecx, ebx
    jmp L6
    fstp fstp st(0)
    inc inc ebx
    cmp cmp ebx, esi
    jg L13
    fld fld dword ptr [esp + 28]
    fmul fmul dword ptr [edi + ebx*8 + 4]
    fld fld dword ptr [esp + 24]
    fmul fmul dword ptr [edi + ebx*8]
    faddp faddp st(1)
    fsub fsub dword ptr [esp + 32]
    fcom fcom dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 5
    jp L7
    fld fld dword ptr [esp + 44]
L4:
    fcomp fcomp st(1)
    fnstsw fnstsw ax
    test test ah, 65
    jne L8
    fstp fstp dword ptr [esp + 44]
    mov mov dword ptr [esp + 16], ebx
    jmp L9
    fstp fstp st(0)
    fld fld dword ptr [esp + 28]
    fmul fmul dword ptr [edi + esi*8 + 4]
    fld fld dword ptr [esp + 24]
    fmul fmul dword ptr [edi + esi*8]
    faddp faddp st(1)
    fsub fsub dword ptr [esp + 32]
    fcom fcom dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 65
    je L15
    nop nop
    fld fld dword ptr [esp + 44]
    fcomp fcomp st(1)
    fnstsw fnstsw ax
    test test ah, 65
    jne L12
    fstp fstp dword ptr [esp + 44]
    mov mov dword ptr [esp + 16], esi
    jmp L14
    fstp fstp st(0)
    dec dec esi
    cmp cmp ebx, esi
    jg sub_100581DB
    fld fld dword ptr [esp + 28]
    fmul fmul dword ptr [edi + esi*8 + 4]
    fld fld dword ptr [esp + 24]
    fmul fmul dword ptr [edi + esi*8]
    faddp faddp st(1)
    fsub fsub dword ptr [esp + 32]
    fcom fcom dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 65
    jne L16
L6:
    fld fld dword ptr [esp + 20]
    fcomp fcomp st(1)
    fnstsw fnstsw ax
    test test ah, 5
    jp L17
    fstp fstp dword ptr [esp + 20]
    mov mov ecx, ebx
    jmp sub_100581DC
    fstp fstp st(0)
    cmp cmp ebx, esi
    je sub_10058204
    fld fld dword ptr [edi + ebx*8]
    mov mov eax, dword ptr [edi + esi*8]
    fld fld dword ptr [edi + ebx*8 + 4]
    mov mov dword ptr [edi + ebx*8], eax
    mov mov edx, dword ptr [edi + esi*8 + 4]
    fxch fxch st(1)
    mov mov dword ptr [edi + ebx*8 + 4], edx
    fstp fstp dword ptr [edi + esi*8]
    fstp fstp dword ptr [edi + esi*8 + 4]
    cmp cmp dword ptr [esp + 16], ebx
    jne sub_10058232
    mov mov dword ptr [esp + 16], esi
    inc inc ebx
    dec dec esi
    cmp cmp ebx, esi
    jle L10
    test test ecx, ecx
    jge sub_10058264
    mov mov eax, dword ptr [esp + 16]
    test test eax, eax
    jge sub_1005826C
    pop pop edi
    pop pop esi
    pop pop ebp
    xor xor eax, eax
    pop pop ebx
    add add esp, 20
    ret ret
    test test ecx, ecx
    mov mov dword ptr [esp + 44], 2
    jl sub_100582FD
    cmp cmp ecx, esi
    je sub_100582B4
    fld fld dword ptr [edi + ecx*8]
    mov mov eax, dword ptr [edi + esi*8]
    fld fld dword ptr [edi + ecx*8 + 4]
    mov mov dword ptr [edi + ecx*8], eax
    mov mov edx, dword ptr [edi + esi*8 + 4]
    fxch fxch st(1)
    mov mov dword ptr [edi + ecx*8 + 4], edx
    fstp fstp dword ptr [edi + esi*8]
    fstp fstp dword ptr [edi + esi*8 + 4]
    lea lea eax, [ebp + 16]
    push push 0
    push push eax
    lea lea eax, [ebp + 24]
    push push eax
    call sub_100F6990
    mov mov ecx, dword ptr [edi + esi*8]
    mov mov dword ptr [ebp + 16], ecx
    mov mov edx, dword ptr [edi + esi*8 + 4]
    add add esp, 12
    test test esi, esi
    mov mov dword ptr [ebp + 20], edx
    mov mov dword ptr [esp + 44], 3
    jle sub_1005834A
    push push 3
    push push ebp
L11:
    push push 0
    push push 2
    push push esi
    push push edi
    call L0
    push push eax
    push push ebp
    push push 2
    push push 1
    push push esi
    push push edi
    call L1
    add add esp, 48
    mov mov dword ptr [esp + 44], eax
    mov mov eax, dword ptr [esp + 16]
    test test eax, eax
    jl sub_10058409
    cmp cmp eax, ebx
    je sub_100583AA
    fld fld dword ptr [edi + eax*8]
    mov mov ecx, dword ptr [edi + ebx*8]
L12:
    fld fld dword ptr [edi + eax*8 + 4]
    mov mov dword ptr [edi + eax*8], ecx
    mov mov edx, dword ptr [edi + ebx*8 + 4]
L13:
    fxch fxch st(1)
    mov mov dword ptr [edi + eax*8 + 4], edx
    fstp fstp dword ptr [edi + ebx*8]
    fstp fstp dword ptr [edi + ebx*8 + 4]
    mov mov eax, dword ptr [esp + 44]
L16:
    lea lea ecx, [eax*8 - 8]
    push push ecx
    lea lea esi, [ebp + 8]
    lea lea edx, [ebp + 16]
    push push esi
    push push edx
    call sub_100F6A15
    mov mov eax, dword ptr [edi + ebx*8]
    mov mov edx, dword ptr [esp + 56]
    mov mov dword ptr [esi], eax
    mov mov eax, dword ptr [esp + 52]
    mov mov ecx, dword ptr [edi + ebx*8 + 4]
    sub sub eax, ebx
    add add esp, 12
    mov mov dword ptr [esi + 4], ecx
    inc inc edx
    lea lea esi, [eax - 1]
    test test esi, esi
    mov mov dword ptr [esp + 44], edx
    jle sub_10058469
    push push edx
    push push ebp
    push push 2
    push push 1
    lea lea edi, [edi + ebx*8 + 8]
    push push esi
    push push edi
    call L2
    push push eax
    push push ebp
    push push 1
    push push 0
    push push esi
    push push edi
    call L3
    add add esp, 48
    mov mov dword ptr [esp + 44], eax
    mov mov eax, dword ptr [esp + 44]
FUN_10057f10 ENDP
END
