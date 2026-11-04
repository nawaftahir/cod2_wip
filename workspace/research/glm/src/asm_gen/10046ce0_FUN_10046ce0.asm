; FUN_10046ce0 @ 0x10046ce0 — auto-synthesized
.CODE
FUN_10046ce0 PROC
    push ebp
    mov ebp, dword ptr [esp + 8]
    push esi
    push edi
    mov edi, eax
    cmp dword ptr [ebp], 0
    jne L0
    mov eax, dword ptr [ebx + 4]
    push 0x112
    push 0
    push ebx
    call dword ptr [eax]
    mov byte ptr [eax + 0x111], 0
    add esp, 0xc
    mov dword ptr [ebp], eax
    mov edx, dword ptr [ebp]
    mov ecx, edi
    mov eax, dword ptr [ecx]
    mov dword ptr [edx], eax
    mov eax, dword ptr [ecx + 4]
    mov dword ptr [edx + 4], eax
    mov eax, dword ptr [ecx + 8]
    mov dword ptr [edx + 8], eax
    mov eax, dword ptr [ecx + 0xc]
    mov dword ptr [edx + 0xc], eax
    mov cl, byte ptr [ecx + 0x10]
    mov byte ptr [edx + 0x10], cl
    xor esi, esi
    lea eax, [edi + 3]
    mov ecx, 4
    movzx edi, byte ptr [eax - 1]
    movzx edx, byte ptr [eax - 2]
    add edx, edi
    movzx edi, byte ptr [eax + 1]
    add edx, edi
    movzx edi, byte ptr [eax]
    add edi, esi
    add eax, 4
    dec ecx
    lea esi, [edi + edx]
    jne L1
    cmp esi, 1
    jl L2
    cmp esi, 0x100
    jle L3
    mov eax, dword ptr [ebx]
    mov dword ptr [eax + 0x14], 8
    mov ecx, dword ptr [ebx]
    push ebx
    call dword ptr [ecx]
    add esp, 4
    mov edi, dword ptr [ebp]
    mov ecx, esi
    mov esi, dword ptr [esp + 0x14]
    mov edx, ecx
    shr ecx, 2
    add edi, 0x11
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov eax, dword ptr [ebp]
    pop edi
    pop esi
    mov byte ptr [eax + 0x111], 0
    pop ebp
    ret
FUN_10046ce0 ENDP
END