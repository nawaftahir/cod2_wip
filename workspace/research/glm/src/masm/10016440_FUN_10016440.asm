.686
.MODEL FLAT, C
EXTRN sub_1001396E:PROC
EXTRN fp_101D49D4:DWORD
EXTRN g_101DA45C:DWORD
.CODE
FUN_10016440 PROC
    push ebx
    push ebp
    push esi
    mov esi, eax
    mov cl, byte ptr [esi]
    xor edx, edx
    test cl, cl
    push edi
    mov eax, 119
    je L1
L0:
    movsx ecx, cl
    or ecx, 32
    imul ecx, eax
    add edx, ecx
    mov cl, byte ptr [esi + eax - 118]
    inc eax
    test cl, cl
    jne L0
L1:
    and edx, 63
    mov ebp, edx
    mov eax, dword ptr [ebp*4 + 0101DA460h]
    test eax, eax
    je L7
    jmp L2
    lea esp, [esp]
L2:
    mov eax, dword ptr [ebp*4 + 0101DA460h]
    mov edi, esi
    lea esp, [esp]
L3:
    mov dl, byte ptr [eax]
    mov bl, byte ptr [edi]
    mov cl, dl
    cmp dl, bl
    jne L5
    test cl, cl
    je L4
    mov dl, byte ptr [eax + 1]
    mov bl, byte ptr [edi + 1]
    mov cl, dl
    cmp dl, bl
    jne L5
    add eax, 2
    add edi, 2
    test cl, cl
    jne L3
L4:
    xor eax, eax
    jmp L6
L5:
    sbb eax, eax
    sbb eax, -1
L6:
    test eax, eax
    je L10
    inc ebp
    and ebp, 63
    mov eax, dword ptr [ebp*4 + 0101DA460h]
    test eax, eax
    jne L2
L7:
    mov eax, dword ptr [g_101DA45C]
    inc eax
    cmp eax, 64
    mov dword ptr [g_101DA45C], eax
    jne L8
    push 63
    push 010194508h
    push 1
    call sub_1001396E
    add esp, 12
L8:
    mov eax, esi
    lea edx, [eax + 1]
L9:
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L9
    sub eax, edx
    lea edi, [eax + 1]
    push edi
    call dword ptr [fp_101D49D4]
    mov ecx, edi
    mov edx, ecx
    shr ecx, 2
    mov edi, eax
    rep movsd dword ptr es:[edi], dword ptr [esi]
    add esp, 4
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    pop edi
    pop esi
    mov dword ptr [ebp*4 + 0101DA460h], eax
    pop ebp
    pop ebx
    ret
FUN_10016440 ENDP
END
