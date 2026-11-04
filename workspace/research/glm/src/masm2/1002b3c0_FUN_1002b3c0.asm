.686
.MODEL FLAT, C
EXTRN sub_1002B241:PROC
EXTRN sub_1002B78D:PROC
EXTRN sub_1002B830:PROC
EXTRN sub_1002B837:PROC
EXTRN sub_1002B83E:PROC
EXTRN sub_10037478:PROC
EXTRN sub_1003756E:PROC
EXTRN sub_1005ED00:PROC
EXTRN sub_100F0022:PROC
EXTRN sub_100F6E8A:PROC
EXTRN sub_100F6F43:PROC
EXTRN EXTRN fp_101D49C8:DWORD:DWORD
EXTRN EXTRN fp_101D4A1C:DWORD:DWORD
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_101D1B9C:DWORD:DWORD
EXTRN EXTRN g_101D49B4:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_1002b3c0 PROC
    sub sub esp, 036Ch
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 0378h]
    push push esi
    push push edi
    mov mov edi, ecx
    mov mov ecx, dword ptr [g_101D1B9C]
    mov mov edx, dword ptr [ecx + 0130h]
    mov mov ebx, dword ptr [ecx + 012Ch]
    mov mov edx, dword ptr [edx + eax*4]
    mov mov ecx, dword ptr [esp + 0390h]
    mov mov ecx, dword ptr [ecx + 56]
    mov mov ecx, dword ptr [ecx + 64]
    lea lea eax, [eax + eax*2]
    shl shl eax, 5
    add add eax, ebx
    test test ecx, ecx
    je L0
    mov mov bl, byte ptr [ecx + 14]
    test test bl, bl
    je L1
    push push edx
    push push eax
    mov mov ecx, 8
    lea lea esi, [esp + 64]
    call sub_10037478
    add add esp, 8
    jmp L2
    lea lea ecx, [esp + 56]
    push push ecx
    push push edx
    push push eax
    mov mov ebx, 8
    call sub_1003756E
    add add esp, 12
    mov mov dword ptr [esp + 32], eax
    mov mov eax, dword ptr [esp + 0388h]
    test test eax, eax
    jle L3
    mov mov ebx, dword ptr [esp + 0394h]
    mov mov esi, dword ptr [esp + 038Ch]
    add add ebx, 8
    add add esi, 52
    mov mov dword ptr [esp + 36], eax
    lea lea esp, [esp]
    fld fld dword ptr [esi + 4]
    fmul fmul dword ptr [edi + 24]
    fld fld dword ptr [esi - 4]
    fmul fmul dword ptr [edi]
    faddp faddp st(1)
    fld fld dword ptr [edi + 12]
    fmul fmul dword ptr [esi]
    faddp faddp st(1)
    fadd fadd dword ptr [edi + 36]
    fstp fstp dword ptr [ebx - 8]
    fld fld dword ptr [edi + 16]
    fmul fmul dword ptr [esi]
    fld fld dword ptr [esi - 4]
    fmul fmul dword ptr [edi + 4]
    faddp faddp st(1)
    fld fld dword ptr [esi + 4]
    fmul fmul dword ptr [edi + 28]
    faddp faddp st(1)
    fadd fadd dword ptr [edi + 40]
    fstp fstp dword ptr [ebx - 4]
    fld fld dword ptr [edi + 20]
    fmul fmul dword ptr [esi]
    fld fld dword ptr [esi - 4]
    fmul fmul dword ptr [edi + 8]
    faddp faddp st(1)
    fld fld dword ptr [esi + 4]
    fmul fmul dword ptr [edi + 32]
    faddp faddp st(1)
    fadd fadd dword ptr [edi + 44]
    fstp fstp dword ptr [ebx]
    mov mov edx, dword ptr [esi - 24]
    mov mov dword ptr [ebx + 8], edx
    mov mov eax, dword ptr [esi - 8]
    mov mov dword ptr [ebx + 12], eax
    mov mov eax, dword ptr [esi - 52]
    mov mov ecx, dword ptr [esi - 44]
    mov mov edx, dword ptr [esi - 48]
    mov mov dword ptr [esp + 20], eax
    fld fld dword ptr [esp + 20]
    mov mov dword ptr [esp + 28], ecx
    fmul fmul dword ptr [ebp]
    mov mov dword ptr [esp + 24], edx
    fld fld dword ptr [esp + 28]
    lea lea ecx, [ebx + 4]
    fmul fmul dword ptr [ebp + 24]
    push push ecx
    lea lea edx, [esp + 60]
    push push edx
    faddp faddp st(1)
    lea lea eax, [esi - 40]
    fld fld dword ptr [esp + 32]
    push push eax
    fmul fmul dword ptr [ebp + 12]
    mov mov eax, dword ptr [esp + 44]
    lea lea edx, [esp + 56]
    faddp faddp st(1)
    fstp fstp dword ptr [esp + 56]
    fld fld dword ptr [esp + 36]
    fmul fmul dword ptr [ebp + 16]
    fld fld dword ptr [esp + 32]
    fmul fmul dword ptr [ebp + 4]
    faddp faddp st(1)
    fld fld dword ptr [esp + 40]
    fmul fmul dword ptr [ebp + 28]
    faddp faddp st(1)
    fstp fstp dword ptr [esp + 60]
    fld fld dword ptr [esp + 36]
    fmul fmul dword ptr [ebp + 20]
    fld fld dword ptr [esp + 32]
    fmul fmul dword ptr [ebp + 8]
    faddp faddp st(1)
    fld fld dword ptr [esp + 40]
    fmul fmul dword ptr [ebp + 32]
    faddp faddp st(1)
    fstp fstp dword ptr [esp + 64]
    call sub_1002B241
    mov mov eax, dword ptr [esp + 48]
    add add esp, 12
    add add esi, 64
    add add ebx, 24
    dec dec eax
    mov mov dword ptr [esp + 36], eax
    jne L4
    mov mov eax, dword ptr [esp + 0388h]
    push push 01000h
    lea lea ecx, [esp + 44]
    push push ecx
    mov mov ecx, dword ptr [esp + 038Ch]
    lea lea esi, [eax + eax*2]
    mov mov eax, dword ptr [g_101D49B4]
    mov mov edx, dword ptr [eax]
    lea lea ecx, [ecx + ecx*2]
    shl shl esi, 3
    push push esi
    shl shl ecx, 3
    push push ecx
    push push eax
    call call dword ptr [edx + 44]
    mov mov edi, eax
    test test edi, edi
    jge sub_1002B78D
    push push 010194030h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 8
    push push edi
    call sub_100F0022
    push push eax
    push push 010194008h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 12
    call dword ptr [fp_101D4A1C]
    mov mov edx, dword ptr [esp + 0394h]
    mov mov eax, dword ptr [esp + 40]
    push push esi
    push push edx
    push push eax
    call sub_1005ED00
    add add esp, 12
    mov mov ecx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [ecx + 8]
    test test eax, eax
    je sub_1002B830
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je sub_1002B83E
    push push 0101974F0h
    push push 010193358h
    push push eax
L4:
    call sub_100F6F43
    mov mov edx, dword ptr [g_10764584]
    add add esp, 12
    push push edx
    call sub_100F6E8A
    add add esp, 4
    mov mov eax, dword ptr [g_101D49B4]
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 48]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_1002B837
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 036Ch
    ret ret
FUN_1002b3c0 ENDP
END
