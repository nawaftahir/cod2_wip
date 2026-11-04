.686
.MODEL FLAT, C
.CODE
FUN_10048ad0 PROC
    sub esp, 28
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 40]
    mov ebx, dword ptr [ebp + 0000000E4h]
    mov eax, dword ptr [ebp + 68]
    mov ecx, dword ptr [ebp + 4]
    imul eax, ebx
    push edi
    mov edi, dword ptr [ebp + 00000014Ch]
    lea edx, [eax + eax*4]
    shl edx, 2
    push edx
    push 1
    push ebp
    call dword ptr [ecx]
    mov ecx, dword ptr [ebp + 68]
    mov edx, dword ptr [ebp + 76]
    add esp, 12
    test ecx, ecx
    mov dword ptr [esp + 44], eax
    mov dword ptr [esp + 24], 0
    jle L4
    push esi
    lea ecx, [ebx + ebx*4]
    shl ecx, 2
    lea esi, [ebx + ebx*2]
    shl esi, 2
    mov dword ptr [esp + 40], ecx
    lea ecx, [edx + 8]
    lea eax, [eax + ebx*4]
    add edi, 8
    mov dword ptr [esp + 36], esi
    mov dword ptr [esp + 20], ecx
    mov dword ptr [esp + 16], eax
    mov dword ptr [esp + 32], edi
    jmp L1
L0:
    mov ecx, dword ptr [esp + 20]
    mov esi, dword ptr [esp + 36]
    lea esp, [esp]
L1:
    lea eax, [ebx + ebx*2]
    push eax
    mov eax, dword ptr [ecx + 20]
    imul eax, dword ptr [ebp + 0000000E0h]
    shl eax, 3
    cdq
    idiv dword ptr [ecx]
    mov edi, dword ptr [ebp + 4]
    push eax
    push 1
    push ebp
    call dword ptr [edi + 8]
    mov edi, dword ptr [esp + 32]
    mov ecx, esi
    mov edx, ecx
    shr ecx, 2
    mov esi, eax
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    add esp, 16
    test ebx, ebx
    rep movsb byte ptr es:[edi], byte ptr [esi]
    jle L3
    mov esi, dword ptr [esp + 48]
    mov ecx, ebx
    shl ecx, 4
    add ecx, esi
    lea edx, [eax + ebx*8]
    sub esi, eax
    mov dword ptr [esp + 24], ebx
    nop
L2:
    mov edi, dword ptr [edx]
    mov dword ptr [esi + eax], edi
    mov edi, dword ptr [eax]
    mov dword ptr [ecx], edi
    mov edi, dword ptr [esp + 24]
    add edx, 4
    add eax, 4
    add ecx, 4
    dec edi
    mov dword ptr [esp + 24], edi
    jne L2
L3:
    mov eax, dword ptr [esp + 16]
    mov ecx, dword ptr [esp + 32]
    mov edx, dword ptr [esp + 40]
    mov edi, dword ptr [esp + 48]
    mov dword ptr [ecx], eax
    add eax, edx
    add edi, edx
    mov edx, dword ptr [esp + 20]
    add ecx, 4
    mov dword ptr [esp + 16], eax
    mov eax, dword ptr [esp + 28]
    inc eax
    mov dword ptr [esp + 32], ecx
    mov ecx, dword ptr [ebp + 68]
    add edx, 84
    cmp eax, ecx
    mov dword ptr [esp + 48], edi
    mov dword ptr [esp + 28], eax
    mov dword ptr [esp + 20], edx
    jl L0
    pop esi
L4:
    pop edi
    pop ebp
    pop ebx
    add esp, 28
    ret
FUN_10048ad0 ENDP
END
