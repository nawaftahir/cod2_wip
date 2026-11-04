.686
.MODEL FLAT, C
EXTRN sub_10057F16:PROC
EXTRN sub_10057F19:PROC
EXTRN sub_10057F63:PROC
EXTRN sub_10057F64:PROC
EXTRN sub_10057F6E:PROC
EXTRN sub_10057F96:PROC
EXTRN sub_10057FDC:PROC
EXTRN sub_1005800E:PROC
EXTRN sub_100580A7:PROC
EXTRN sub_100580C4:PROC
EXTRN sub_10059172:PROC
EXTRN sub_100F694E:PROC
EXTRN EXTRN g_1019BC84:DWORD:DWORD
.CODE
FUN_10057d00 PROC
    sub sub esp, 12
    mov mov eax, dword ptr [esp + 28]
    push push ebx
    mov mov ebx, dword ptr [esp + 36]
    push push ebp
    mov mov ebp, dword ptr [esp + 32]
    fld fld dword ptr [ebx + ebp*8 + 4]
    push push esi
    fsub fsub dword ptr [ebx + eax*8 + 4]
    push push edi
    lea lea esi, [esp + 16]
    fstp fstp dword ptr [esp + 16]
    fld fld dword ptr [ebx + eax*8]
    fsub fsub dword ptr [ebx + ebp*8]
    fstp fstp dword ptr [esp + 20]
    call sub_10059172
    mov mov esi, dword ptr [esp + 36]
    fstp fstp st(0)
    fld fld dword ptr [esp + 20]
    xor xor ecx, ecx
    fmul fmul dword ptr [ebx + ebp*8 + 4]
    dec dec esi
    fld fld dword ptr [esp + 16]
    or or edx, -1
    test test esi, esi
    fmul fmul dword ptr [ebx + ebp*8]
    mov mov dword ptr [esp + 36], 03A83126Fh
    faddp faddp st(1)
    fstp fstp dword ptr [esp + 24]
    jl L4
    mov mov edi, dword ptr [esp + 32]
    jmp L0
    lea lea esp, [esp]
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [edi + ecx*8 + 4]
    fld fld dword ptr [esp + 16]
    fmul fmul dword ptr [edi + ecx*8]
    faddp faddp st(1)
    fsub fsub dword ptr [esp + 24]
    fcom fcom dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 65
    jnp L3
    fld fld dword ptr [esp + 36]
    fcomp fcomp st(1)
    fnstsw fnstsw ax
    test test ah, 5
    jp L1
    fstp fstp dword ptr [esp + 36]
    mov mov edx, ecx
    jmp L2
    fstp fstp st(0)
    inc inc ecx
    cmp cmp ecx, esi
    jg sub_10057F16
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [edi + ecx*8 + 4]
    fld fld dword ptr [esp + 16]
    fmul fmul dword ptr [edi + ecx*8]
    faddp faddp st(1)
    fsub fsub dword ptr [esp + 24]
    fcom fcom dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 65
    jp L3
    fstp fstp st(0)
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [edi + esi*8 + 4]
    fld fld dword ptr [esp + 16]
    fmul fmul dword ptr [edi + esi*8]
    faddp faddp st(1)
    fsub fsub dword ptr [esp + 24]
    fcom fcom dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 65
    je sub_10057F19
    dec dec esi
    fstp fstp st(0)
    cmp cmp ecx, esi
    jg sub_10057F63
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [edi + esi*8 + 4]
    fld fld dword ptr [esp + 16]
    fmul fmul dword ptr [edi + esi*8]
    faddp faddp st(1)
    fsub fsub dword ptr [esp + 24]
    fcom fcom dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 65
    jne sub_10057F19
    fld fld dword ptr [esp + 36]
    fcomp fcomp st(1)
    fnstsw fnstsw ax
    test test ah, 5
    jp sub_10057F64
    fstp fstp dword ptr [esp + 36]
    mov mov edx, ecx
    jmp sub_10057F6E
    fstp fstp st(0)
    cmp cmp ecx, esi
    je sub_10057F96
    fld fld dword ptr [edi + ecx*8]
    mov mov eax, dword ptr [edi + esi*8]
    fld fld dword ptr [edi + ecx*8 + 4]
L1:
    mov mov dword ptr [edi + ecx*8], eax
    mov mov eax, dword ptr [edi + esi*8 + 4]
    fxch fxch st(1)
    mov mov dword ptr [edi + ecx*8 + 4], eax
    fstp fstp dword ptr [edi + esi*8]
    fstp fstp dword ptr [edi + esi*8 + 4]
    inc inc ecx
    dec dec esi
    cmp cmp ecx, esi
    jle L5
    test test edx, edx
L3:
    jge sub_10057FDC
    mov mov eax, dword ptr [esp + 52]
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 12
    ret ret
    cmp cmp edx, esi
    je sub_1005800E
    fld fld dword ptr [edi + edx*8]
    mov mov ecx, dword ptr [edi + esi*8]
    fld fld dword ptr [edi + edx*8 + 4]
    mov mov dword ptr [edi + edx*8], ecx
    mov mov eax, dword ptr [edi + esi*8 + 4]
    fxch fxch st(1)
    mov mov dword ptr [edi + edx*8 + 4], eax
    fstp fstp dword ptr [edi + esi*8]
    fstp fstp dword ptr [edi + esi*8 + 4]
    mov mov ecx, dword ptr [esp + 52]
    inc inc ebp
    sub sub ecx, ebp
    shl shl ecx, 3
    push push ecx
    lea lea ebx, [ebx + ebp*8]
    lea lea edx, [ebx + 8]
    push push ebx
    push push edx
    call sub_100F694E
    mov mov eax, dword ptr [edi + esi*8]
    mov mov dword ptr [ebx], eax
    mov mov eax, dword ptr [esp + 64]
    mov mov ecx, dword ptr [edi + esi*8 + 4]
    add add esp, 12
    inc inc eax
    test test esi, esi
    mov mov dword ptr [ebx + 4], ecx
    je sub_100580C4
    mov mov ecx, dword ptr [esp + 44]
    test test ecx, ecx
    je sub_100580A7
    mov mov edx, dword ptr [esp + 40]
    add add edx, 2
    mov mov dword ptr [esp + 44], edx
    mov mov ebx, dword ptr [esp + 48]
    push push eax
    mov mov eax, dword ptr [esp + 48]
    push push ebx
    push push eax
    push push ebp
    push push esi
    push push edi
    call L6
L6:
    mov mov ecx, dword ptr [esp + 64]
    push push eax
    push push ebx
    push push ebp
    push push ecx
    push push esi
    push push edi
    call L7
L7:
    add add esp, 48
    pop pop edi
FUN_10057d00 ENDP
END
