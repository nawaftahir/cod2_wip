.686
.MODEL FLAT, C
EXTRN sub_10029AC3:PROC
EXTRN sub_10029B13:PROC
EXTRN sub_10029B64:PROC
EXTRN sub_10029BB8:PROC
EXTRN sub_1002A14F:PROC
EXTRN sub_1002A1DB:PROC
EXTRN sub_1002A1E5:PROC
EXTRN sub_1002A25B:PROC
EXTRN sub_1002A2EF:PROC
EXTRN sub_1002A2F1:PROC
EXTRN sub_1002A2F6:PROC
EXTRN sub_1002A3AD:PROC
EXTRN sub_1002A3EE:PROC
EXTRN sub_1002A3F0:PROC
EXTRN sub_100F632F:PROC
EXTRN sub_100F66E1:PROC
EXTRN EXTRN fp_101D49E4:DWORD:DWORD
EXTRN EXTRN g_1019BCB0:DWORD:DWORD
EXTRN EXTRN g_1019BDC0:DWORD:DWORD
.CODE
FUN_10029bf0 PROC
    sub sub esp, 76
    push push ebx
    push push ebp
    push push esi
    mov mov esi, dword ptr [esp + 96]
    mov mov eax, dword ptr [esi + 32]
    mov mov ecx, dword ptr [esi + 36]
    push push edi
    push push 010029BE0h
    push push 4
    push push eax
    push push ecx
    call sub_100F632F
    mov mov eax, dword ptr [esi + 40]
    add add esp, 16
    test test eax, eax
    jne L10
    lea lea ecx, [ecx]
    mov mov eax, dword ptr [esi + 32]
    fld fld dword ptr [g_1019BDC0]
    test test eax, eax
    fst fst dword ptr [esp + 36]
    mov mov dword ptr [esp + 16], 07F7FFFFFh
    mov mov dword ptr [esp + 20], 07F7FFFFFh
    mov mov dword ptr [esp + 24], 07F7FFFFFh
    mov mov dword ptr [esp + 28], 0FF7FFFFFh
    mov mov dword ptr [esp + 32], 0FF7FFFFFh
    jle L2
    mov mov edx, dword ptr [esp + 96]
    mov mov edi, dword ptr [edx + 0F8h]
    mov mov edx, dword ptr [esi + 36]
    mov mov ebx, eax
    lea lea esp, [esp]
    mov mov ecx, dword ptr [edx]
    fld fld dword ptr [esp + 16]
    lea lea ecx, [ecx + ecx*2]
    shl shl ecx, 5
    fcomp fcomp dword ptr [ecx + edi + 20]
    add add ecx, edi
    fnstsw fnstsw ax
    test test ah, 65
    jne L0
    mov mov eax, dword ptr [ecx + 20]
    mov mov dword ptr [esp + 16], eax
    fld fld dword ptr [esp + 28]
    fcomp fcomp dword ptr [ecx + 32]
    fnstsw fnstsw ax
    test test ah, 5
    jp L1
    mov mov eax, dword ptr [ecx + 32]
    mov mov dword ptr [esp + 28], eax
    fld fld dword ptr [esp + 20]
    fcomp fcomp dword ptr [ecx + 24]
    fnstsw fnstsw ax
    test test ah, 65
    jne L3
    mov mov eax, dword ptr [ecx + 24]
    mov mov dword ptr [esp + 20], eax
    fld fld dword ptr [esp + 32]
    fcomp fcomp dword ptr [ecx + 36]
    fnstsw fnstsw ax
    test test ah, 5
    jp L4
    mov mov eax, dword ptr [ecx + 36]
    mov mov dword ptr [esp + 32], eax
    fld fld dword ptr [esp + 24]
    fcomp fcomp dword ptr [ecx + 28]
    fnstsw fnstsw ax
    test test ah, 65
    jne L5
    mov mov eax, dword ptr [ecx + 28]
    mov mov dword ptr [esp + 24], eax
    fcom fcom dword ptr [ecx + 40]
    fnstsw fnstsw ax
    test test ah, 5
    jp L6
    fstp fstp st(0)
    fld fld dword ptr [ecx + 40]
    add add edx, 4
    dec dec ebx
    jne L3
    fst fst dword ptr [esp + 36]
    mov mov eax, dword ptr [esi + 24]
    test test eax, eax
    jne L7
    mov mov ecx, dword ptr [esp + 16]
    mov mov edx, dword ptr [esp + 20]
    mov mov eax, dword ptr [esp + 24]
    mov mov dword ptr [esi], ecx
    mov mov ecx, dword ptr [esp + 28]
    mov mov dword ptr [esi + 4], edx
    mov mov edx, dword ptr [esp + 32]
    mov mov dword ptr [esi + 8], eax
    fst fst dword ptr [esi + 20]
    mov mov dword ptr [esi + 12], ecx
    mov mov dword ptr [esi + 16], edx
    mov mov ebx, dword ptr [esi + 32]
    cmp cmp ebx, 8
    jl sub_1002A14F
    fld fld dword ptr [esp + 28]
    mov mov eax, dword ptr [esp + 16]
    fadd fadd dword ptr [esp + 16]
    mov mov edx, dword ptr [esp + 24]
    fld fld dword ptr [esp + 32]
    mov mov ecx, dword ptr [esp + 20]
    fadd fadd dword ptr [esp + 20]
    mov mov edi, dword ptr [esi + 36]
    fxch fxch st(1)
    mov mov dword ptr [esp + 52], eax
    fmul fmul dword ptr [g_1019BCB0]
    mov mov eax, dword ptr [esp + 32]
    mov mov dword ptr [esp + 56], ecx
    mov mov dword ptr [esp + 60], edx
    fstp fstp dword ptr [esp + 64]
    mov mov ecx, dword ptr [esp + 64]
    push push ebx
    fmul fmul dword ptr [g_1019BCB0]
    lea lea edx, [esp + 44]
    mov mov dword ptr [esp + 48], eax
    push push edx
    lea lea eax, [esp + 60]
    fstp fstp dword ptr [esp + 76]
    mov mov dword ptr [esp + 48], ecx
    mov mov ecx, dword ptr [esp + 104]
    fstp fstp dword ptr [esp + 56]
    push push eax
    push push ecx
    call sub_10029AC3
    mov mov edx, dword ptr [esp + 36]
L4:
    mov mov ecx, dword ptr [esp + 44]
    mov mov ebp, eax
    mov mov eax, dword ptr [esp + 40]
    mov mov dword ptr [esp + 72], edx
    mov mov edx, dword ptr [esp + 48]
    mov mov dword ptr [esp + 76], eax
    mov mov eax, dword ptr [esp + 52]
    sub sub ebx, ebp
    mov mov dword ptr [esp + 56], ecx
    mov mov ecx, dword ptr [esp + 80]
    mov mov dword ptr [esp + 60], edx
    push push ebx
    lea lea edx, [esp + 60]
    mov mov dword ptr [esp + 68], eax
    push push edx
    lea lea eax, [esp + 76]
    mov mov dword ptr [esp + 76], ecx
    mov mov ecx, dword ptr [esp + 120]
    push push eax
    lea lea edi, [edi + ebp*4]
    push push ecx
    mov mov dword ptr [esp + 108], ebp
    call sub_10029B13
    mov mov edx, dword ptr [esp + 48]
    mov mov ecx, dword ptr [esp + 56]
    sub sub ebx, eax
    mov mov dword ptr [esp + 112], eax
    lea lea edi, [edi + eax*4]
    mov mov eax, dword ptr [esp + 52]
    mov mov dword ptr [esp + 84], edx
    mov mov edx, dword ptr [esp + 60]
    mov mov dword ptr [esp + 88], eax
    mov mov eax, dword ptr [esp + 68]
    mov mov dword ptr [esp + 92], ecx
    mov mov ecx, dword ptr [esp + 100]
    mov mov dword ptr [esp + 72], edx
    push push ebx
    lea lea edx, [esp + 76]
    mov mov dword ptr [esp + 84], eax
    push push edx
    lea lea eax, [esp + 92]
    mov mov dword ptr [esp + 84], ecx
    mov mov ecx, dword ptr [esp + 088h]
    push push eax
    push push ecx
    call sub_10029B64
    mov mov edx, dword ptr [esp + 64]
    mov mov ecx, dword ptr [esp + 72]
    mov mov dword ptr [esp + 084h], eax
    sub sub ebx, eax
    mov mov dword ptr [esp + 100], edx
    mov mov edx, dword ptr [esp + 76]
    mov mov dword ptr [esp + 108], ecx
    mov mov ecx, dword ptr [esp + 80]
    mov mov dword ptr [esp + 88], edx
    mov mov edx, dword ptr [esp + 84]
    mov mov dword ptr [esp + 92], ecx
    mov mov ecx, dword ptr [esp + 116]
    mov mov dword ptr [esp + 96], edx
    push push ebx
    lea lea edx, [esp + 92]
    lea lea edi, [edi + eax*4]
    push push edx
    lea lea eax, [esp + 108]
    mov mov dword ptr [esp + 112], ecx
    mov mov ecx, dword ptr [esp + 098h]
    push push eax
    push push ecx
    call sub_10029BB8
    mov mov edi, dword ptr [esp + 094h]
    sub sub ebx, eax
    mov mov dword ptr [esp + 098h], eax
    mov mov ecx, dword ptr [esp + 098h]
    xor xor eax, eax
    add add esp, 64
    test test ecx, ecx
    setne setne al
    xor xor edx, edx
    test test edi, edi
    mov mov edi, dword ptr [esp + 80]
    setne setne dl
    xor xor ecx, ecx
    add add eax, edx
    test test edi, edi
    setne setne cl
    xor xor edx, edx
    add add eax, ecx
    test test ebp, ebp
    setne setne dl
    add add eax, edx
    je sub_1002A2F6
    mov mov ecx, dword ptr [esi + 24]
    test test ecx, ecx
    je sub_1002A1DB
    inc inc eax
    test test ebx, ebx
    je sub_1002A1E5
    inc inc eax
    lea lea eax, [eax + eax*2]
    shl shl eax, 4
    push push 4
    push push eax
    call dword ptr [fp_101D49E4]
    mov mov ecx, dword ptr [esi + 24]
    add add esp, 8
    test test ecx, ecx
    mov mov dword ptr [esi + 44], eax
    je sub_1002A25B
    mov mov edx, dword ptr [esi + 40]
    lea lea ecx, [edx + edx*2]
    shl shl ecx, 4
    add add ecx, eax
    inc inc edx
    mov mov dword ptr [esi + 40], edx
    mov mov edx, dword ptr [esi]
    mov mov dword ptr [ecx], edx
    mov mov eax, dword ptr [esi + 4]
    mov mov dword ptr [ecx + 4], eax
    mov mov edx, dword ptr [esi + 8]
    mov mov dword ptr [ecx + 8], edx
    mov mov eax, dword ptr [esi + 12]
    mov mov dword ptr [ecx + 12], eax
    mov mov edx, dword ptr [esi + 16]
    mov mov dword ptr [ecx + 16], edx
    mov mov eax, dword ptr [esi + 20]
    mov mov dword ptr [ecx + 20], eax
    mov mov edx, dword ptr [esi + 28]
    mov mov dword ptr [ecx + 28], edx
    mov mov eax, dword ptr [esi + 24]
    mov mov dword ptr [ecx + 24], eax
    mov mov ebx, dword ptr [esi + 36]
    mov mov ebp, dword ptr [esi + 32]
    xor xor eax, eax
    mov mov dword ptr [esp + 100], eax
    mov mov edi, dword ptr [esp + eax*4 + 76]
    test test edi, edi
    je sub_1002A2EF
    mov mov ecx, dword ptr [esi + 40]
    mov mov edx, dword ptr [esi + 44]
    lea lea eax, [ecx + ecx*2]
    shl shl eax, 4
    add add eax, edx
    inc inc ecx
    mov mov dword ptr [esi + 40], ecx
    mov mov ecx, dword ptr [esp + 96]
    push push eax
    push push ecx
    mov mov dword ptr [eax + 32], edi
    mov mov dword ptr [eax + 36], ebx
    call L8
L8:
    mov mov eax, dword ptr [esp + 108]
    add add esp, 8
    lea lea ebx, [ebx + edi*4]
    sub sub ebp, edi
    inc inc eax
    cmp cmp eax, 4
    mov mov dword ptr [esp + 100], eax
    jl sub_1002A2F1
    test test ebp, ebp
    je sub_1002A3AD
    mov mov eax, dword ptr [esi + 40]
    mov mov ecx, dword ptr [esi + 44]
    lea lea edi, [eax + eax*2]
    shl shl edi, 4
    add add edi, ecx
    push push 010029BE0h
    inc inc eax
    mov mov dword ptr [esi + 40], eax
    push push 4
    mov mov edx, ebp
    push push edx
    mov mov eax, ebx
    push push eax
    mov mov dword ptr [edi + 32], ebp
    mov mov dword ptr [edi + 36], ebx
    mov mov esi, edi
    call sub_100F66E1
    mov mov eax, dword ptr [edi + 40]
    add add esp, 16
    test test eax, eax
    je L11
    mov mov eax, dword ptr [esi + 40]
    xor xor edi, edi
    test test eax, eax
    jle sub_1002A3F0
    xor xor ebx, ebx
    lea lea ebx, [ebx]
    mov mov ecx, dword ptr [esi + 44]
    mov mov edx, dword ptr [esp + 96]
    add add ecx, ebx
    push push ecx
    push push edx
    call L9
L9:
    mov mov eax, dword ptr [esi + 40]
    add add esp, 8
    inc inc edi
    add add ebx, 48
    cmp cmp edi, eax
L10:
    jl sub_1002A3EE
    pop pop edi
L11:
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 76
    ret ret
    fstp fstp st(0)
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 76
    ret ret
FUN_10029bf0 ENDP
END
