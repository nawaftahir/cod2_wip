.686
.MODEL FLAT, C
EXTRN sub_100425E3:PROC
.CODE
FUN_10042150 PROC
    sub esp, 48
    push ebx
    push ebp
    push esi
    mov esi, dword ptr [esp + 64]
    mov ebp, dword ptr [esi + 0000000E8h]
    mov eax, dword ptr [esi + 68]
    mov ebx, dword ptr [esi + 000000150h]
    push edi
    mov edi, dword ptr [esi + 76]
    dec ebp
    test eax, eax
    mov dword ptr [esp + 48], ebx
    mov dword ptr [esp + 44], ebp
    mov dword ptr [esp + 52], 0
    mov dword ptr [esp + 24], edi
    jle L18
    mov eax, dword ptr [esp + 72]
    lea ecx, [ebx + 64]
    mov dword ptr [esp + 40], eax
    mov dword ptr [esp + 36], ecx
    jmp L1
L0:
    mov ebx, dword ptr [esp + 48]
    mov ebp, dword ptr [esp + 44]
L1:
    mov eax, dword ptr [edi + 12]
    mov ecx, dword ptr [ebx + 8]
    mov edx, dword ptr [esi + 4]
    imul ecx, eax
    push 1
    push eax
    mov eax, dword ptr [esp + 44]
    push ecx
    mov ecx, dword ptr [eax]
    push ecx
    push esi
    call dword ptr [edx + 0x20]
    mov ecx, eax
    mov eax, dword ptr [ebx + 8]
    add esp, 20
    cmp eax, ebp
    mov dword ptr [esp + 28], ecx
    jae L2
    mov edx, dword ptr [edi + 12]
    mov dword ptr [esp + 20], edx
    jmp L3
L2:
    mov ebx, dword ptr [edi + 12]
    mov eax, dword ptr [edi + 32]
    xor edx, edx
    div ebx
    test edx, edx
    mov dword ptr [esp + 20], edx
    jne L3
    mov dword ptr [esp + 20], ebx
L3:
    mov ebp, dword ptr [edi + 28]
    mov ebx, dword ptr [edi + 8]
    xor edx, edx
    mov eax, ebp
    div ebx
    mov dword ptr [esp + 32], ebx
    mov ebx, edx
    test ebx, ebx
    jle L4
    mov eax, dword ptr [esp + 32]
    sub eax, ebx
    mov ebx, eax
L4:
    mov edx, dword ptr [esp + 20]
    xor eax, eax
    test edx, edx
    mov dword ptr [esp + 16], eax
    jle L10
    jmp L6
L5:
    mov eax, dword ptr [esp + 16]
L6:
    mov esi, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [esp + 68]
    mov edx, dword ptr [ecx + 000000160h]
    push ebp
    push 0
    shl eax, 3
    push eax
    mov eax, dword ptr [esp + 52]
    mov eax, dword ptr [eax]
    push esi
    push eax
    push edi
    push ecx
    call dword ptr [edx + 4]
    add esp, 28
    test ebx, ebx
    jle L9
    mov ecx, ebp
    shl ecx, 7
    add esi, ecx
    mov ecx, ebx
    shl ecx, 7
    mov edx, ecx
    shr ecx, 2
    xor eax, eax
    mov edi, esi
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    test ebx, ebx
    rep stosb byte ptr es:[edi], al
    mov cx, word ptr [esi - 000000080h]
    jle L8
    mov eax, ebx
L7:
    mov word ptr [esi], cx
    add esi, 000000080h
    dec eax
    jne L7
L8:
    mov edi, dword ptr [esp + 24]
L9:
    mov eax, dword ptr [esp + 16]
    mov ecx, dword ptr [esp + 20]
    inc eax
    cmp eax, ecx
    mov ecx, dword ptr [esp + 28]
    mov dword ptr [esp + 16], eax
    jl L5
    mov esi, dword ptr [esp + 68]
L10:
    mov eax, dword ptr [esp + 44]
    mov edx, dword ptr [esp + 48]
    cmp dword ptr [edx + 8], eax
    jne L17
    add ebp, ebx
    xor edx, edx
    mov eax, ebp
    div dword ptr [esp + 32]
    mov edx, dword ptr [esp + 20]
    mov dword ptr [esp + 16], edx
    mov dword ptr [esp + 60], eax
    cmp edx, dword ptr [edi + 12]
    jge L17
    shl ebp, 7
    mov dword ptr [esp + 56], ebp
    jmp L12
L11:
    mov ecx, dword ptr [esp + 28]
    lea esp, [esp]
L12:
    mov ebp, dword ptr [ecx + edx*4]
    mov ebx, dword ptr [ecx + edx*4 - 4]
    mov ecx, dword ptr [esp + 56]
    mov esi, ecx
    shr ecx, 2
    xor eax, eax
    mov edi, ebp
    rep stosd dword ptr es:[edi], eax
    mov ecx, esi
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    mov eax, dword ptr [esp + 60]
    test eax, eax
    jbe L16
    mov edi, dword ptr [esp + 32]
    mov ecx, edi
    shl ecx, 7
    mov dword ptr [esp + 20], eax
L13:
    test edi, edi
    mov si, word ptr [ecx + ebx - 000000080h]
    jle L15
    mov eax, ebp
    mov edx, edi
    nop
L14:
    mov word ptr [eax], si
    add eax, 000000080h
    dec edx
    jne L14
    mov edx, dword ptr [esp + 16]
L15:
    mov eax, dword ptr [esp + 20]
    add ebp, ecx
    add ebx, ecx
    dec eax
    mov dword ptr [esp + 20], eax
    jne L13
L16:
    mov eax, dword ptr [esp + 24]
    mov ecx, dword ptr [eax + 12]
    inc edx
    cmp edx, ecx
    mov dword ptr [esp + 16], edx
    jl L11
    mov esi, dword ptr [esp + 68]
    mov edi, eax
L17:
    mov ebp, dword ptr [esp + 36]
    mov ebx, dword ptr [esp + 40]
    mov eax, dword ptr [esp + 52]
    mov ecx, 4
    add ebp, ecx
    add ebx, ecx
    mov ecx, dword ptr [esi + 68]
    inc eax
    add edi, 84
    cmp eax, ecx
    mov dword ptr [esp + 52], eax
    mov dword ptr [esp + 36], ebp
    mov dword ptr [esp + 40], ebx
    mov dword ptr [esp + 24], edi
    jl L0
L18:
    mov ecx, dword ptr [esp + 72]
    push ecx
    push esi
    call sub_100425E3
    add esp, 8
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 48
    ret
FUN_10042150 ENDP
END
