.686
.MODEL FLAT, C
.CODE
FUN_1004fc10 PROC
    push esi
    push edi
    push 000000580h
    mov esi, eax
    mov eax, dword ptr [esi + 4]
    push 1
    push esi
    call dword ptr [eax]
    mov edx, eax
    add edx, 000000100h
    add esp, 12
    mov ecx, 64
    xor eax, eax
    lea edi, [edx - 000000100h]
    mov dword ptr [esi + 000000128h], edx
    rep stosd dword ptr es:[edi], eax
L0:
    mov byte ptr [eax + edx], al
    inc eax
    cmp eax, 0000000FFh
    jle L0
    add edx, 000000080h
    or eax, 0FFFFFFFFh
    lea edi, [edx + 000000080h]
    mov ecx, 96
    rep stosd dword ptr es:[edi], eax
    mov ecx, 96
    xor eax, eax
    lea edi, [edx + 000000200h]
    rep stosd dword ptr es:[edi], eax
    mov esi, dword ptr [esi + 000000128h]
    lea edi, [edx + 000000380h]
    mov ecx, 32
    rep movsd dword ptr es:[edi], dword ptr [esi]
    pop edi
    pop esi
    ret
FUN_1004fc10 ENDP
END
