.686
.MODEL FLAT, C
EXTRN sub_10029AC3:PROC
EXTRN sub_10029B13:PROC
EXTRN sub_10029B64:PROC
EXTRN sub_10029BB8:PROC
EXTRN sub_100F632F:PROC
EXTRN sub_100F66E1:PROC
EXTRN fp_101D49E4:DWORD
EXTRN g_1019BCB0:DWORD
EXTRN g_1019BDC0:DWORD
.CODE
FUN_10029bf0 PROC
L0:
    sub esp, 76
    push ebx
    push ebp
    push esi
    mov esi, dword ptr [esp + 96]
    mov eax, dword ptr [esi + 32]
    mov ecx, dword ptr [esi + 36]
    push edi
    push 010029BE0h
    push 4
    push eax
    push ecx
    call sub_100F632F
    mov eax, dword ptr [esi + 40]
    add esp, 16
    test eax, eax
    jne L16
    lea ecx, [ecx]
L1:
    mov eax, dword ptr [esi + 32]
    fld dword ptr [g_1019BDC0]
    test eax, eax
    fst dword ptr [esp + 36]
    mov dword ptr [esp + 16], 07F7FFFFFh
    mov dword ptr [esp + 20], 07F7FFFFFh
    mov dword ptr [esp + 24], 07F7FFFFFh
    mov dword ptr [esp + 28], 0FF7FFFFFh
    mov dword ptr [esp + 32], 0FF7FFFFFh
    jle L9
    mov edx, dword ptr [esp + 96]
    mov edi, dword ptr [edx + 0000000F8h]
    mov edx, dword ptr [esi + 36]
    mov ebx, eax
    lea esp, [esp]
L2:
    mov ecx, dword ptr [edx]
    fld dword ptr [esp + 16]
    lea ecx, [ecx + ecx*2]
    shl ecx, 5
    fcomp dword ptr [ecx + edi + 20]
    add ecx, edi
    fnstsw ax
    test ah, 65
    jne L3
    mov eax, dword ptr [ecx + 20]
    mov dword ptr [esp + 16], eax
L3:
    fld dword ptr [esp + 28]
    fcomp dword ptr [ecx + 32]
    fnstsw ax
    test ah, 5
    jp L4
    mov eax, dword ptr [ecx + 32]
    mov dword ptr [esp + 28], eax
L4:
    fld dword ptr [esp + 20]
    fcomp dword ptr [ecx + 24]
    fnstsw ax
    test ah, 65
    jne L5
    mov eax, dword ptr [ecx + 24]
    mov dword ptr [esp + 20], eax
L5:
    fld dword ptr [esp + 32]
    fcomp dword ptr [ecx + 36]
    fnstsw ax
    test ah, 5
    jp L6
    mov eax, dword ptr [ecx + 36]
    mov dword ptr [esp + 32], eax
L6:
    fld dword ptr [esp + 24]
    fcomp dword ptr [ecx + 28]
    fnstsw ax
    test ah, 65
    jne L7
    mov eax, dword ptr [ecx + 28]
    mov dword ptr [esp + 24], eax
L7:
    fcom dword ptr [ecx + 40]
    fnstsw ax
    test ah, 5
    jp L8
    fstp st(0)
    fld dword ptr [ecx + 40]
L8:
    add edx, 4
    dec ebx
    jne L2
    fst dword ptr [esp + 36]
L9:
    mov eax, dword ptr [esi + 24]
    test eax, eax
    jne L10
    mov ecx, dword ptr [esp + 16]
    mov edx, dword ptr [esp + 20]
    mov eax, dword ptr [esp + 24]
    mov dword ptr [esi], ecx
    mov ecx, dword ptr [esp + 28]
    mov dword ptr [esi + 4], edx
    mov edx, dword ptr [esp + 32]
    mov dword ptr [esi + 8], eax
    fst dword ptr [esi + 20]
    mov dword ptr [esi + 12], ecx
    mov dword ptr [esi + 16], edx
L10:
    mov ebx, dword ptr [esi + 32]
    cmp ebx, 8
    jl L18
    fld dword ptr [esp + 28]
    mov eax, dword ptr [esp + 16]
    fadd dword ptr [esp + 16]
    mov edx, dword ptr [esp + 24]
    fld dword ptr [esp + 32]
    mov ecx, dword ptr [esp + 20]
    fadd dword ptr [esp + 20]
    mov edi, dword ptr [esi + 36]
    fxch st(1)
    mov dword ptr [esp + 52], eax
    fmul dword ptr [g_1019BCB0]
    mov eax, dword ptr [esp + 32]
    mov dword ptr [esp + 56], ecx
    mov dword ptr [esp + 60], edx
    fstp dword ptr [esp + 64]
    mov ecx, dword ptr [esp + 64]
    push ebx
    fmul dword ptr [g_1019BCB0]
    lea edx, [esp + 44]
    mov dword ptr [esp + 48], eax
    push edx
    lea eax, [esp + 60]
    fstp dword ptr [esp + 76]
    mov dword ptr [esp + 48], ecx
    mov ecx, dword ptr [esp + 104]
    fstp dword ptr [esp + 56]
    push eax
    push ecx
    call sub_10029AC3
    mov edx, dword ptr [esp + 36]
    mov ecx, dword ptr [esp + 44]
    mov ebp, eax
    mov eax, dword ptr [esp + 40]
    mov dword ptr [esp + 72], edx
    mov edx, dword ptr [esp + 48]
    mov dword ptr [esp + 76], eax
    mov eax, dword ptr [esp + 52]
    sub ebx, ebp
    mov dword ptr [esp + 56], ecx
    mov ecx, dword ptr [esp + 80]
    mov dword ptr [esp + 60], edx
    push ebx
    lea edx, [esp + 60]
    mov dword ptr [esp + 68], eax
    push edx
    lea eax, [esp + 76]
    mov dword ptr [esp + 76], ecx
    mov ecx, dword ptr [esp + 120]
    push eax
    lea edi, [edi + ebp*4]
    push ecx
    mov dword ptr [esp + 108], ebp
    call sub_10029B13
    mov edx, dword ptr [esp + 48]
    mov ecx, dword ptr [esp + 56]
    sub ebx, eax
    mov dword ptr [esp + 112], eax
    lea edi, [edi + eax*4]
    mov eax, dword ptr [esp + 52]
    mov dword ptr [esp + 84], edx
    mov edx, dword ptr [esp + 60]
    mov dword ptr [esp + 88], eax
    mov eax, dword ptr [esp + 68]
    mov dword ptr [esp + 92], ecx
    mov ecx, dword ptr [esp + 100]
    mov dword ptr [esp + 72], edx
    push ebx
    lea edx, [esp + 76]
    mov dword ptr [esp + 84], eax
    push edx
    lea eax, [esp + 92]
    mov dword ptr [esp + 84], ecx
    mov ecx, dword ptr [esp + 000000088h]
    push eax
    push ecx
    call sub_10029B64
    mov edx, dword ptr [esp + 64]
    mov ecx, dword ptr [esp + 72]
    mov dword ptr [esp + 000000084h], eax
    sub ebx, eax
    mov dword ptr [esp + 100], edx
    mov edx, dword ptr [esp + 76]
    mov dword ptr [esp + 108], ecx
    mov ecx, dword ptr [esp + 80]
    mov dword ptr [esp + 88], edx
    mov edx, dword ptr [esp + 84]
    mov dword ptr [esp + 92], ecx
    mov ecx, dword ptr [esp + 116]
    mov dword ptr [esp + 96], edx
    push ebx
    lea edx, [esp + 92]
    lea edi, [edi + eax*4]
    push edx
    lea eax, [esp + 108]
    mov dword ptr [esp + 112], ecx
    mov ecx, dword ptr [esp + 000000098h]
    push eax
    push ecx
    call sub_10029BB8
    mov edi, dword ptr [esp + 000000094h]
    sub ebx, eax
    mov dword ptr [esp + 000000098h], eax
    mov ecx, dword ptr [esp + 000000098h]
    xor eax, eax
    add esp, 64
    test ecx, ecx
    setne al
    xor edx, edx
    test edi, edi
    mov edi, dword ptr [esp + 80]
    setne dl
    xor ecx, ecx
    add eax, edx
    test edi, edi
    setne cl
    xor edx, edx
    add eax, ecx
    test ebp, ebp
    setne dl
    add eax, edx
    je L19
    mov ecx, dword ptr [esi + 24]
    test ecx, ecx
    je L11
    inc eax
L11:
    test ebx, ebx
    je L12
    inc eax
L12:
    lea eax, [eax + eax*2]
    shl eax, 4
    push 4
    push eax
    call dword ptr [fp_101D49E4]
    mov ecx, dword ptr [esi + 24]
    add esp, 8
    test ecx, ecx
    mov dword ptr [esi + 44], eax
    je L13
    mov edx, dword ptr [esi + 40]
    lea ecx, [edx + edx*2]
    shl ecx, 4
    add ecx, eax
    inc edx
    mov dword ptr [esi + 40], edx
    mov edx, dword ptr [esi]
    mov dword ptr [ecx], edx
    mov eax, dword ptr [esi + 4]
    mov dword ptr [ecx + 4], eax
    mov edx, dword ptr [esi + 8]
    mov dword ptr [ecx + 8], edx
    mov eax, dword ptr [esi + 12]
    mov dword ptr [ecx + 12], eax
    mov edx, dword ptr [esi + 16]
    mov dword ptr [ecx + 16], edx
    mov eax, dword ptr [esi + 20]
    mov dword ptr [ecx + 20], eax
    mov edx, dword ptr [esi + 28]
    mov dword ptr [ecx + 28], edx
    mov eax, dword ptr [esi + 24]
    mov dword ptr [ecx + 24], eax
L13:
    mov ebx, dword ptr [esi + 36]
    mov ebp, dword ptr [esi + 32]
    xor eax, eax
    mov dword ptr [esp + 100], eax
L14:
    mov edi, dword ptr [esp + eax*4 + 76]
    test edi, edi
    je L15
    mov ecx, dword ptr [esi + 40]
    mov edx, dword ptr [esi + 44]
    lea eax, [ecx + ecx*2]
    shl eax, 4
    add eax, edx
    inc ecx
    mov dword ptr [esi + 40], ecx
    mov ecx, dword ptr [esp + 96]
    push eax
    push ecx
    mov dword ptr [eax + 32], edi
    mov dword ptr [eax + 36], ebx
    call L0
    mov eax, dword ptr [esp + 108]
    add esp, 8
    lea ebx, [ebx + edi*4]
    sub ebp, edi
L15:
    inc eax
    cmp eax, 4
    mov dword ptr [esp + 100], eax
    jl L14
    test ebp, ebp
    je L19
    mov eax, dword ptr [esi + 40]
    mov ecx, dword ptr [esi + 44]
    lea edi, [eax + eax*2]
    shl edi, 4
    add edi, ecx
    push 010029BE0h
    inc eax
    mov dword ptr [esi + 40], eax
    push 4
    mov edx, ebp
    push edx
    mov eax, ebx
    push eax
    mov dword ptr [edi + 32], ebp
    mov dword ptr [edi + 36], ebx
    mov esi, edi
    call sub_100F66E1
    mov eax, dword ptr [edi + 40]
    add esp, 16
    test eax, eax
    je L1
L16:
    mov eax, dword ptr [esi + 40]
    xor edi, edi
    test eax, eax
    jle L19
    xor ebx, ebx
    lea ebx, [ebx]
L17:
    mov ecx, dword ptr [esi + 44]
    mov edx, dword ptr [esp + 96]
    add ecx, ebx
    push ecx
    push edx
    call L0
    mov eax, dword ptr [esi + 40]
    add esp, 8
    inc edi
    add ebx, 48
    cmp edi, eax
    jl L17
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 76
    ret
L18:
    fstp st(0)
L19:
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 76
    ret
FUN_10029bf0 ENDP
END
