.686
.MODEL FLAT, C
.CODE
FUN_10055fc0 PROC
    sub esp, 36
    mov eax, dword ptr [esp + 40]
    mov ecx, dword ptr [eax + 108]
    mov edx, dword ptr [eax + 100]
    push ebx
    mov ebx, dword ptr [eax + 0000001B0h]
    mov eax, dword ptr [esp + 56]
    test eax, eax
    mov dword ptr [esp + 32], ebx
    mov dword ptr [esp + 4], ecx
    mov dword ptr [esp + 44], edx
    jle L6
    mov edx, dword ptr [esp + 52]
    mov ecx, dword ptr [esp + 48]
    push ebp
    push esi
    sub ecx, edx
    push edi
    mov dword ptr [esp + 24], edx
    mov dword ptr [esp + 36], ecx
    mov dword ptr [esp + 28], eax
L0:
    mov ecx, dword ptr [esp + 56]
    mov edi, dword ptr [edx]
    mov esi, ecx
    shr ecx, 2
    xor eax, eax
    rep stosd dword ptr es:[edi], eax
    mov ecx, esi
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    mov eax, dword ptr [esp + 16]
    mov esi, dword ptr [ebx + 48]
    xor ebp, ebp
    test eax, eax
    mov dword ptr [esp + 48], esi
    jle L5
    shl esi, 6
    lea eax, [ebx + 52]
    mov dword ptr [esp + 32], esi
    mov dword ptr [esp + 68], eax
    jmp L2
L1:
    mov esi, dword ptr [esp + 32]
L2:
    mov edi, dword ptr [ebx + 24]
    mov edi, dword ptr [edi + ebp*4]
    mov ecx, dword ptr [esp + 36]
    mov eax, dword ptr [ecx + edx]
    mov ecx, dword ptr [edx]
    mov dword ptr [esp + 40], edi
    mov edi, dword ptr [esp + 68]
    mov edi, dword ptr [edi]
    add edi, esi
    xor esi, esi
    add eax, ebp
    cmp dword ptr [esp + 56], esi
    jbe L4
    mov edx, dword ptr [esp + 56]
    mov dword ptr [esp + 20], edx
L3:
    movzx edx, byte ptr [eax]
    mov ebx, dword ptr [edi + esi*4]
    add ebx, edx
    mov edx, dword ptr [esp + 40]
    mov dl, byte ptr [ebx + edx]
    mov bl, byte ptr [ecx]
    add bl, dl
    mov edx, dword ptr [esp + 20]
    mov byte ptr [ecx], bl
    add eax, dword ptr [esp + 16]
    inc ecx
    inc esi
    and esi, 15
    dec edx
    mov dword ptr [esp + 20], edx
    jne L3
    mov ebx, dword ptr [esp + 44]
    mov edx, dword ptr [esp + 24]
L4:
    mov ecx, dword ptr [esp + 68]
    mov eax, dword ptr [esp + 16]
    inc ebp
    add ecx, 4
    cmp ebp, eax
    mov dword ptr [esp + 68], ecx
    jl L1
    mov esi, dword ptr [esp + 48]
L5:
    mov eax, dword ptr [esp + 28]
    inc esi
    and esi, 15
    add edx, 4
    dec eax
    mov dword ptr [ebx + 48], esi
    mov dword ptr [esp + 24], edx
    mov dword ptr [esp + 28], eax
    jne L0
    pop edi
    pop esi
    pop ebp
L6:
    pop ebx
    add esp, 36
    ret
FUN_10055fc0 ENDP
END
