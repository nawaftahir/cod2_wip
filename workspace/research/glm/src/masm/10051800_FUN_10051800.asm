.686
.MODEL FLAT, C
.CODE
FUN_10051800 PROC
    sub esp, 20
    mov ecx, dword ptr [esp + 36]
    mov edx, dword ptr [esp + 28]
    push ebp
    mov ebp, dword ptr [ecx]
    mov ecx, dword ptr [edx + 4]
    push edi
    mov edi, dword ptr [esp + 32]
    mov eax, dword ptr [edi + 0000001A8h]
    movzx edx, byte ptr [eax + ecx + 000000096h]
    add eax, ecx
    movzx ecx, byte ptr [eax + 00000008Ch]
    mov eax, dword ptr [edi + 00000011Ch]
    test eax, eax
    mov dword ptr [esp + 44], ecx
    mov dword ptr [esp + 8], edx
    mov dword ptr [esp + 12], 0
    jle L6
    mov eax, dword ptr [esp + 40]
    push ebx
    mov dword ptr [esp + 24], ebp
    mov dword ptr [esp + 40], eax
    push esi
    lea esp, [esp]
L0:
    mov edx, dword ptr [esp + 44]
    mov ebx, dword ptr [edx]
    mov esi, dword ptr [ebp]
    mov edx, dword ptr [edi + 100]
    add edx, esi
    cmp esi, edx
    mov dword ptr [esp + 24], edx
    jae L3
L1:
    mov al, byte ptr [ebx]
    inc ebx
    test ecx, ecx
    mov dword ptr [esp + 32], ebx
    jle L2
    mov bl, al
    mov bh, bl
    mov edx, ecx
    shr ecx, 2
    mov edi, esi
    mov eax, ebx
    shl eax, 16
    mov ax, bx
    mov ebx, dword ptr [esp + 32]
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    mov edx, dword ptr [esp + 24]
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    mov eax, dword ptr [esp + 52]
    mov edi, dword ptr [esp + 40]
    add esi, eax
    mov ecx, eax
L2:
    cmp esi, edx
    jb L1
L3:
    cmp dword ptr [esp + 16], 1
    jle L5
    mov esi, dword ptr [esp + 16]
    mov ebx, dword ptr [edi + 100]
    dec esi
    test esi, esi
    mov eax, ebp
    lea edx, [ebp + 4]
    jle L5
    mov dword ptr [esp + 24], esi
L4:
    mov esi, dword ptr [eax]
    mov edi, dword ptr [edx]
    mov ecx, ebx
    mov ebp, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, ebp
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov ecx, dword ptr [esp + 24]
    add eax, 4
    add edx, 4
    dec ecx
    mov dword ptr [esp + 24], ecx
    jne L4
    mov ebp, dword ptr [esp + 28]
    mov ecx, dword ptr [esp + 52]
    mov edi, dword ptr [esp + 40]
L5:
    mov eax, dword ptr [esp + 44]
    mov ebx, dword ptr [esp + 20]
    mov edx, dword ptr [edi + 00000011Ch]
    add eax, 4
    mov dword ptr [esp + 44], eax
    mov eax, dword ptr [esp + 16]
    add ebx, eax
    shl eax, 2
    add ebp, eax
    mov eax, ebx
    cmp eax, edx
    mov dword ptr [esp + 20], ebx
    mov dword ptr [esp + 28], ebp
    jl L0
    pop esi
    pop ebx
L6:
    pop edi
    pop ebp
    add esp, 20
    ret
FUN_10051800 ENDP
END
