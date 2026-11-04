.686
.MODEL FLAT, C
EXTRN sub_1001396E:PROC
EXTRN sub_10016535:PROC
EXTRN sub_10016591:PROC
EXTRN sub_100165AB:PROC
EXTRN sub_100165B3:PROC
EXTRN EXTRN fp_101D49D4:DWORD:DWORD
EXTRN EXTRN g_101DA45C:DWORD:DWORD
.CODE
FUN_10016440 PROC
    push push ebx
    push push ebp
    push push esi
    mov mov esi, eax
    mov mov cl, byte ptr [esi]
    xor xor edx, edx
    test test cl, cl
    push push edi
    mov mov eax, 119
    je L0
    movsx movsx ecx, cl
    or or ecx, 32
    imul imul ecx, eax
    add add edx, ecx
    mov mov cl, byte ptr [esi + eax - 118]
    inc inc eax
    test test cl, cl
    jne L0
    and and edx, 63
    mov mov ebp, edx
    mov mov eax, dword ptr [ebp*4 + 0101DA460h]
    test test eax, eax
    je L3
    jmp L1
    lea lea esp, [esp]
    mov mov eax, dword ptr [ebp*4 + 0101DA460h]
    mov mov edi, esi
    lea lea esp, [esp]
    mov mov dl, byte ptr [eax]
    mov mov bl, byte ptr [edi]
    mov mov cl, dl
    cmp cmp dl, bl
    jne L5
    test test cl, cl
    je L5
    mov mov dl, byte ptr [eax + 1]
    mov mov bl, byte ptr [edi + 1]
    mov mov cl, dl
    cmp cmp dl, bl
    jne L6
    add add eax, 2
    add add edi, 2
    test test cl, cl
    jne L2
    xor xor eax, eax
    jmp sub_10016535
    sbb sbb eax, eax
    sbb sbb eax, -1
    test test eax, eax
    je sub_100165AB
    inc inc ebp
    and and ebp, 63
    mov mov eax, dword ptr [ebp*4 + 0101DA460h]
    test test eax, eax
    jne L4
    mov mov eax, dword ptr [g_101DA45C]
    inc inc eax
    cmp cmp eax, 64
    mov mov dword ptr [g_101DA45C], eax
    jne sub_10016591
    push push 63
    push push 010194508h
    push push 1
    call sub_1001396E
    add add esp, 12
    mov mov eax, esi
    lea lea edx, [eax + 1]
    mov mov cl, byte ptr [eax]
    inc inc eax
    test test cl, cl
    jne sub_100165B3
    sub sub eax, edx
    lea lea edi, [eax + 1]
    push push edi
    call dword ptr [fp_101D49D4]
    mov mov ecx, edi
    mov mov edx, ecx
    shr shr ecx, 2
L4:
    mov mov edi, eax
L5:
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    add add esp, 4
    mov mov ecx, edx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    pop pop edi
    pop pop esi
    mov mov dword ptr [ebp*4 + 0101DA460h], eax
    pop pop ebp
    pop pop ebx
    ret ret
FUN_10016440 ENDP
END
