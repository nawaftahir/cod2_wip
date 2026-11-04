.686
.MODEL FLAT, C
EXTRN sub_10027F5C:PROC
EXTRN sub_10027F67:PROC
EXTRN sub_10027F6D:PROC
EXTRN sub_10027F79:PROC
EXTRN sub_10027F7A:PROC
EXTRN sub_10028027:PROC
EXTRN sub_1002803E:PROC
EXTRN sub_10028064:PROC
EXTRN sub_10028072:PROC
EXTRN sub_10028082:PROC
EXTRN sub_1002808E:PROC
EXTRN sub_1002809A:PROC
EXTRN sub_100280E4:PROC
EXTRN sub_100280FB:PROC
EXTRN sub_10028102:PROC
EXTRN sub_1010AA89:PROC
EXTRN EXTRN fp_101D4B90:DWORD:DWORD
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_1019BDC8:DWORD:DWORD
EXTRN EXTRN g_1019BDF4:DWORD:DWORD
EXTRN EXTRN g_1019BEF4:DWORD:DWORD
EXTRN EXTRN g_1067850C:DWORD:DWORD
EXTRN EXTRN g_10678510:DWORD:DWORD
.CODE
FUN_10027d00 PROC
    sub sub esp, 76
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 92]
    push push esi
    xor xor esi, esi
    xor xor eax, eax
    mov mov ecx, 04CBEBC20h
    mov mov dword ptr [ebp + eax*8], -1
    mov mov dword ptr [ebp + eax*8 + 4], ecx
    inc inc eax
    cmp cmp eax, 24
    jne L0
    cmp cmp dword ptr [g_1067850C], esi
    mov mov ebx, ebp
    mov mov dword ptr [esp + 12], esi
    jle sub_10027F6D
    mov mov dword ptr [esp + 24], esi
    mov mov dword ptr [esp + 16], 010678AC8h
    push push edi
    mov mov eax, dword ptr [g_10678510]
    add add esi, eax
    cmp cmp dword ptr [esi], 0
    jne sub_10027F5C
    mov mov eax, dword ptr [esi + 4]
    test test al, 8
    jne sub_10027F67
    and and eax, 0E00h
    mov mov edi, eax
    cmp cmp edi, 0200h
    je sub_10027F7A
    mov mov eax, dword ptr [esp + 20]
    lea lea ecx, [esp + 68]
    push push ecx
    mov mov ecx, dword ptr [eax]
    lea lea edx, [esp + 84]
    push push edx
    push push ecx
    call dword ptr [fp_101D4B90]
    fld fld dword ptr [esp + 80]
    fsub fsub dword ptr [esp + 92]
    add add esp, 12
    fstp fstp dword ptr [esp + 32]
    fld fld dword ptr [esp + 72]
    fsub fsub dword ptr [esp + 84]
    fstp fstp dword ptr [esp + 36]
    fld fld dword ptr [esp + 76]
    fsub fsub dword ptr [esp + 88]
    fstp fstp dword ptr [esp + 40]
    fld fld dword ptr [esp + 32]
    fmul fmul dword ptr [esp + 32]
    fstp fstp dword ptr [esp + 56]
    fld fld dword ptr [esp + 36]
    fmul fmul dword ptr [esp + 36]
    fstp fstp dword ptr [esp + 60]
    fld fld dword ptr [esp + 40]
    fmul fmul dword ptr [esp + 40]
    fstp fstp dword ptr [esp + 64]
    fld fld dword ptr [esp + 60]
    fcomp fcomp dword ptr [esp + 56]
    fnstsw fnstsw ax
    test test ah, 65
    jne L1
    mov mov ecx, 1
    jmp L2
    xor xor ecx, ecx
    fld fld dword ptr [esp + 64]
    fcomp fcomp dword ptr [esp + ecx*4 + 56]
    fnstsw fnstsw ax
    test test ah, 65
    jne L3
    mov mov ecx, 2
    mov mov edx, dword ptr [esp + ecx*4 + 32]
    fld fld dword ptr [g_1019BC84]
    mov mov dword ptr [esp + 24], edx
    fld fld dword ptr [esp + 24]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp sub_10028027
    mov mov eax, dword ptr [esp + 96]
    fld fld dword ptr [esi + 60]
    fsub fsub dword ptr [eax]
    fstp fstp dword ptr [esp + 44]
    fld fld dword ptr [esi + 64]
    fsub fsub dword ptr [eax + 4]
    fstp fstp dword ptr [esp + 48]
    fld fld dword ptr [esi + 68]
    fsub fsub dword ptr [eax + 8]
    fstp fstp dword ptr [esp + 52]
    fld fld dword ptr [esp + 52]
    fmul fmul dword ptr [esp + 52]
    fld fld dword ptr [esp + 48]
    fmul fmul dword ptr [esp + 48]
    faddp faddp st(1)
    fld fld dword ptr [esp + 44]
    fmul fmul dword ptr [esp + 44]
    faddp faddp st(1)
    fstp fstp dword ptr [esp + 100]
    fld fld dword ptr [esp + 100]
    call sub_1010AA89
    fstp fstp dword ptr [esp + 100]
    fld fld dword ptr [esp + 100]
    fstp fstp dword ptr [esp + 100]
    fld fld dword ptr [esp + 100]
    fdiv fdiv dword ptr [esp + 24]
    fstp fstp dword ptr [esp + 100]
    fld fld dword ptr [esp + 100]
    fcomp fcomp dword ptr [g_1019BEF4]
    fnstsw fnstsw ax
    test test ah, 1
    je sub_1002809A
    cmp cmp edi, 0800h
    jne sub_1002803E
    mov mov dword ptr [esp + 100], 0
    jmp sub_10028072
    cmp cmp edi, 0600h
    jne sub_10028064
    fld fld dword ptr [esp + 100]
    fmul fmul dword ptr [g_1019BDC8]
    jmp sub_10028082
    cmp cmp edi, 0400h
    jne sub_1002808E
    fld fld dword ptr [esp + 100]
    fmul fmul dword ptr [g_1019BDF4]
    fstp fstp dword ptr [esp + 100]
    fld fld dword ptr [esp + 100]
    fcomp fcomp dword ptr [ebx + 4]
    fnstsw fnstsw ax
    test test ah, 65
    je sub_100280E4
    mov mov ecx, dword ptr [esp + 100]
    mov mov eax, dword ptr [esp + 16]
    mov mov dword ptr [ebx + 4], ecx
    mov mov dword ptr [ebx], eax
    mov mov ebx, ebp
    lea lea ecx, [ebp + 8]
    mov mov edx, 23
    fld fld dword ptr [ecx + 4]
    fcomp fcomp dword ptr [ebx + 4]
    fnstsw fnstsw ax
L3:
    test test ah, 65
    jne sub_10028102
    mov mov ebx, ecx
    add add ecx, 8
    dec dec edx
    jne sub_100280FB
    mov mov eax, dword ptr [esp + 16]
    mov mov esi, dword ptr [esp + 28]
    mov mov edx, dword ptr [esp + 20]
    mov mov ecx, dword ptr [g_1067850C]
    inc inc eax
    add add esi, 116
    add add edx, 52
    cmp cmp eax, ecx
    mov mov dword ptr [esp + 16], eax
    mov mov dword ptr [esp + 28], esi
    mov mov dword ptr [esp + 20], edx
    jl sub_10027F79
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 76
    ret ret
FUN_10027d00 ENDP
END
