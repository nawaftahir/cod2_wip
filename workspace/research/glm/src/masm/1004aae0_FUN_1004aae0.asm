.686
.MODEL FLAT, C
.CODE
FUN_1004aae0 PROC
    sub esp, 52
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 64]
    mov ecx, dword ptr [ebp + 000000140h]
    mov eax, dword ptr [ebp + 000000124h]
    mov edx, dword ptr [ebp + 000000190h]
    dec ecx
    dec eax
    push esi
    mov esi, dword ptr [edx + 28]
    mov dword ptr [esp + 52], eax
    mov eax, dword ptr [edx + 24]
    cmp eax, esi
    push edi
    mov dword ptr [esp + 24], edx
    mov dword ptr [esp + 36], ecx
    mov dword ptr [esp + 16], eax
    jge L13
    lea ecx, [ecx]
L0:
    mov ebx, dword ptr [edx + 20]
    cmp ebx, ecx
    mov dword ptr [esp + 20], ebx
    ja L12
    nop
L1:
    mov ecx, dword ptr [ebp + 000000148h]
    mov edi, dword ptr [edx + 32]
    shl ecx, 7
    mov esi, ecx
    add edx, 32
    shr ecx, 2
    xor eax, eax
    rep stosd dword ptr es:[edi], eax
    mov ecx, esi
    and ecx, 3
    push edx
    rep stosb byte ptr es:[edi], al
    mov eax, dword ptr [ebp + 0000001A0h]
    push ebp
    call dword ptr [eax + 4]
    add esp, 8
    test al, al
    je L14
    mov eax, dword ptr [ebp + 00000012Ch]
    xor ecx, ecx
    cmp eax, ecx
    mov dword ptr [esp + 28], ecx
    mov dword ptr [esp + 52], ecx
    jle L11
    lea edx, [ebp + 000000130h]
    mov dword ptr [esp + 32], edx
L2:
    mov eax, dword ptr [esp + 32]
    mov esi, dword ptr [eax]
    mov al, byte ptr [esi + 48]
    test al, al
    jne L3
    add ecx, dword ptr [esi + 60]
    mov dword ptr [esp + 28], ecx
    jmp L10
L3:
    mov eax, dword ptr [esi + 4]
    mov edx, dword ptr [ebp + 0000001A4h]
    shl eax, 2
    mov edx, dword ptr [edx + eax + 4]
    mov dword ptr [esp + 60], edx
    cmp ebx, dword ptr [esp + 36]
    jae L4
    mov edx, dword ptr [esi + 52]
    jmp L5
L4:
    mov edx, dword ptr [esi + 68]
L5:
    mov edi, dword ptr [esp + 76]
    mov eax, dword ptr [eax + edi]
    mov edi, dword ptr [esi + 64]
    imul edi, dword ptr [esp + 20]
    mov dword ptr [esp + 40], edx
    mov edx, dword ptr [esi + 36]
    imul edx, dword ptr [esp + 16]
    lea ebx, [eax + edx*4]
    mov edx, dword ptr [esi + 56]
    xor eax, eax
    test edx, edx
    mov dword ptr [esp + 64], edi
    mov dword ptr [esp + 48], eax
    jle L10
    jmp L6
    lea esp, [esp]
    mov edi, edi
L6:
    mov edx, dword ptr [esp + 56]
    cmp dword ptr [ebp + 000000088h], edx
    jb L7
    mov edx, dword ptr [esp + 16]
    add edx, eax
    cmp edx, dword ptr [esi + 72]
    jge L9
L7:
    mov edx, dword ptr [esp + 40]
    test edx, edx
    jle L9
    mov eax, dword ptr [esp + 24]
    lea ebp, [eax + ecx*4 + 32]
    mov dword ptr [esp + 44], edx
    jmp L8
    lea ecx, [ecx]
L8:
    mov ecx, dword ptr [ebp]
    mov edx, dword ptr [esp + 72]
    push edi
    push ebx
    push ecx
    push esi
    push edx
    call dword ptr [esp + 0x50]
    mov edx, dword ptr [esi + 36]
    mov eax, dword ptr [esp + 64]
    add esp, 20
    add edi, edx
    add ebp, 4
    dec eax
    mov dword ptr [esp + 44], eax
    jne L8
    mov eax, dword ptr [esp + 48]
    mov edi, dword ptr [esp + 64]
    mov ecx, dword ptr [esp + 28]
    mov ebp, dword ptr [esp + 72]
L9:
    add ecx, dword ptr [esi + 52]
    mov edx, dword ptr [esi + 36]
    lea ebx, [ebx + edx*4]
    mov edx, dword ptr [esi + 56]
    inc eax
    cmp eax, edx
    mov dword ptr [esp + 28], ecx
    mov dword ptr [esp + 48], eax
    jl L6
L10:
    mov eax, dword ptr [esp + 52]
    mov esi, dword ptr [esp + 32]
    mov edx, dword ptr [ebp + 00000012Ch]
    mov ebx, dword ptr [esp + 20]
    inc eax
    add esi, 4
    cmp eax, edx
    mov dword ptr [esp + 52], eax
    mov dword ptr [esp + 32], esi
    jl L2
L11:
    mov eax, dword ptr [esp + 36]
    mov edx, dword ptr [esp + 24]
    inc ebx
    cmp ebx, eax
    mov dword ptr [esp + 20], ebx
    jbe L1
    mov eax, dword ptr [esp + 16]
    mov ecx, dword ptr [esp + 36]
L12:
    mov dword ptr [edx + 20], 0
    mov esi, dword ptr [edx + 28]
    inc eax
    cmp eax, esi
    mov dword ptr [esp + 16], eax
    jl L0
L13:
    mov edx, dword ptr [ebp + 000000090h]
    mov ecx, dword ptr [ebp + 000000088h]
    inc edx
    mov dword ptr [ebp + 000000090h], edx
    mov edx, dword ptr [ebp + 000000124h]
    inc ecx
    cmp ecx, edx
    mov dword ptr [ebp + 000000088h], ecx
    jae L18
    mov edi, dword ptr [ebp + 00000012Ch]
    mov eax, dword ptr [ebp + 000000190h]
    mov esi, 1
    cmp edi, esi
    jle L15
    pop edi
    mov dword ptr [eax + 28], esi
    pop esi
    xor ecx, ecx
    pop ebp
    mov dword ptr [eax + 20], ecx
    mov dword ptr [eax + 24], ecx
    mov eax, 3
    pop ebx
    add esp, 52
    ret
L14:
    mov eax, dword ptr [esp + 24]
    mov ecx, dword ptr [esp + 16]
    pop edi
    pop esi
    mov dword ptr [eax + 20], ebx
    pop ebp
    mov dword ptr [eax + 24], ecx
    xor eax, eax
    pop ebx
    add esp, 52
    ret
L15:
    dec edx
    cmp ecx, edx
    mov edx, dword ptr [ebp + 000000130h]
    jae L16
    mov ecx, dword ptr [edx + 12]
    jmp L17
L16:
    mov ecx, dword ptr [edx + 72]
L17:
    pop edi
    mov dword ptr [eax + 28], ecx
    pop esi
    xor ecx, ecx
    pop ebp
    mov dword ptr [eax + 20], ecx
    mov dword ptr [eax + 24], ecx
    mov eax, 3
    pop ebx
    add esp, 52
    ret
L18:
    mov edx, dword ptr [ebp + 000000198h]
    push ebp
    call dword ptr [edx + 0xc]
    add esp, 4
    pop edi
FUN_1004aae0 ENDP
END
