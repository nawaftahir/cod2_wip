.686
.MODEL FLAT, C
EXTRN sub_1002B241:PROC
EXTRN sub_10037478:PROC
EXTRN sub_1003756E:PROC
EXTRN sub_1005ED00:PROC
EXTRN sub_100F0022:PROC
EXTRN sub_100F6E8A:PROC
EXTRN sub_100F6F43:PROC
EXTRN fp_101D49C8:DWORD
EXTRN fp_101D4A1C:DWORD
EXTRN g_101CE7EC:DWORD
EXTRN g_101D1B9C:DWORD
EXTRN g_101D49B4:DWORD
EXTRN g_10764584:DWORD
EXTRN g_1076A830:DWORD
.CODE
FUN_1002b3c0 PROC
    sub esp, 00000036Ch
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 000000378h]
    push esi
    push edi
    mov edi, ecx
    mov ecx, dword ptr [g_101D1B9C]
    mov edx, dword ptr [ecx + 000000130h]
    mov ebx, dword ptr [ecx + 00000012Ch]
    mov edx, dword ptr [edx + eax*4]
    mov ecx, dword ptr [esp + 000000390h]
    mov ecx, dword ptr [ecx + 56]
    mov ecx, dword ptr [ecx + 64]
    lea eax, [eax + eax*2]
    shl eax, 5
    add eax, ebx
    test ecx, ecx
    je L0
    mov bl, byte ptr [ecx + 14]
    test bl, bl
    je L0
    push edx
    push eax
    mov ecx, 8
    lea esi, [esp + 64]
    call sub_10037478
    add esp, 8
    jmp L1
L0:
    lea ecx, [esp + 56]
    push ecx
    push edx
    push eax
    mov ebx, 8
    call sub_1003756E
    add esp, 12
L1:
    mov dword ptr [esp + 32], eax
    mov eax, dword ptr [esp + 000000388h]
    test eax, eax
    jle L3
    mov ebx, dword ptr [esp + 000000394h]
    mov esi, dword ptr [esp + 00000038Ch]
    add ebx, 8
    add esi, 52
    mov dword ptr [esp + 36], eax
    lea esp, [esp]
L2:
    fld dword ptr [esi + 4]
    fmul dword ptr [edi + 24]
    fld dword ptr [esi - 4]
    fmul dword ptr [edi]
    faddp st(1)
    fld dword ptr [edi + 12]
    fmul dword ptr [esi]
    faddp st(1)
    fadd dword ptr [edi + 36]
    fstp dword ptr [ebx - 8]
    fld dword ptr [edi + 16]
    fmul dword ptr [esi]
    fld dword ptr [esi - 4]
    fmul dword ptr [edi + 4]
    faddp st(1)
    fld dword ptr [esi + 4]
    fmul dword ptr [edi + 28]
    faddp st(1)
    fadd dword ptr [edi + 40]
    fstp dword ptr [ebx - 4]
    fld dword ptr [edi + 20]
    fmul dword ptr [esi]
    fld dword ptr [esi - 4]
    fmul dword ptr [edi + 8]
    faddp st(1)
    fld dword ptr [esi + 4]
    fmul dword ptr [edi + 32]
    faddp st(1)
    fadd dword ptr [edi + 44]
    fstp dword ptr [ebx]
    mov edx, dword ptr [esi - 24]
    mov dword ptr [ebx + 8], edx
    mov eax, dword ptr [esi - 8]
    mov dword ptr [ebx + 12], eax
    mov eax, dword ptr [esi - 52]
    mov ecx, dword ptr [esi - 44]
    mov edx, dword ptr [esi - 48]
    mov dword ptr [esp + 20], eax
    fld dword ptr [esp + 20]
    mov dword ptr [esp + 28], ecx
    fmul dword ptr [ebp]
    mov dword ptr [esp + 24], edx
    fld dword ptr [esp + 28]
    lea ecx, [ebx + 4]
    fmul dword ptr [ebp + 24]
    push ecx
    lea edx, [esp + 60]
    push edx
    faddp st(1)
    lea eax, [esi - 40]
    fld dword ptr [esp + 32]
    push eax
    fmul dword ptr [ebp + 12]
    mov eax, dword ptr [esp + 44]
    lea edx, [esp + 56]
    faddp st(1)
    fstp dword ptr [esp + 56]
    fld dword ptr [esp + 36]
    fmul dword ptr [ebp + 16]
    fld dword ptr [esp + 32]
    fmul dword ptr [ebp + 4]
    faddp st(1)
    fld dword ptr [esp + 40]
    fmul dword ptr [ebp + 28]
    faddp st(1)
    fstp dword ptr [esp + 60]
    fld dword ptr [esp + 36]
    fmul dword ptr [ebp + 20]
    fld dword ptr [esp + 32]
    fmul dword ptr [ebp + 8]
    faddp st(1)
    fld dword ptr [esp + 40]
    fmul dword ptr [ebp + 32]
    faddp st(1)
    fstp dword ptr [esp + 64]
    call sub_1002B241
    mov eax, dword ptr [esp + 48]
    add esp, 12
    add esi, 64
    add ebx, 24
    dec eax
    mov dword ptr [esp + 36], eax
    jne L2
    mov eax, dword ptr [esp + 000000388h]
L3:
    push 000001000h
    lea ecx, [esp + 44]
    push ecx
    mov ecx, dword ptr [esp + 00000038Ch]
    lea esi, [eax + eax*2]
    mov eax, dword ptr [g_101D49B4]
    mov edx, dword ptr [eax]
    lea ecx, [ecx + ecx*2]
    shl esi, 3
    push esi
    shl ecx, 3
    push ecx
    push eax
    call dword ptr [edx + 0x2c]
    mov edi, eax
    test edi, edi
    jge L4
    push 010194030h
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 8
    push edi
    call sub_100F0022
    push eax
    push 010194008h
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 12
    call dword ptr [fp_101D4A1C]
L4:
    mov edx, dword ptr [esp + 000000394h]
    mov eax, dword ptr [esp + 40]
    push esi
    push edx
    push eax
    call sub_1005ED00
    add esp, 12
L5:
    mov ecx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [ecx + 8]
    test eax, eax
    je L6
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L6
    push 0101974F0h
    push 010193358h
    push eax
    call sub_100F6F43
    mov edx, dword ptr [g_10764584]
    add esp, 12
    push edx
    call sub_100F6E8A
    add esp, 4
L6:
    mov eax, dword ptr [g_101D49B4]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 0x30]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L5
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 00000036Ch
    ret
FUN_1002b3c0 ENDP
END
