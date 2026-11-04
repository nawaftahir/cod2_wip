.686
.MODEL FLAT, C
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
    push 000000112h
    push 0
    push ebx
    call dword ptr [eax]
    mov byte ptr [eax + 000000111h], 0
    add esp, 12
    mov dword ptr [ebp], eax
L0:
    mov edx, dword ptr [ebp]
    mov ecx, edi
    mov eax, dword ptr [ecx]
    mov dword ptr [edx], eax
    mov eax, dword ptr [ecx + 4]
    mov dword ptr [edx + 4], eax
    mov eax, dword ptr [ecx + 8]
    mov dword ptr [edx + 8], eax
    mov eax, dword ptr [ecx + 12]
    mov dword ptr [edx + 12], eax
    mov cl, byte ptr [ecx + 16]
    mov byte ptr [edx + 16], cl
    xor esi, esi
    lea eax, [edi + 3]
    mov ecx, 4
L1:
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
    cmp esi, 000000100h
    jle L3
L2:
    mov eax, dword ptr [ebx]
    mov dword ptr [eax + 20], 8
    mov ecx, dword ptr [ebx]
    push ebx
    call dword ptr [ecx]
    add esp, 4
L3:
    mov edi, dword ptr [ebp]
    mov ecx, esi
    mov esi, dword ptr [esp + 20]
    mov edx, ecx
    shr ecx, 2
    add edi, 17
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov eax, dword ptr [ebp]
    pop edi
    pop esi
    mov byte ptr [eax + 000000111h], 0
    pop ebp
    ret
FUN_10046ce0 ENDP
END
