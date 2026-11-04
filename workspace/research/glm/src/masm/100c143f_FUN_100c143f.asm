.686
.MODEL FLAT, C
.CODE
FUN_100c143f PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 36
    mov eax, dword ptr [ecx + 000000100h]
    mov eax, dword ptr [eax]
    and eax, 0000FFFFFh
    push ebx
    push esi
    push edi
    mov dword ptr [ebp - 28], ecx
    mov dword ptr [ebp - 8], 0
    jbe L3
    mov edx, dword ptr [ecx + 20]
    mov ecx, dword ptr [ecx + 000000100h]
    mov ebx, dword ptr [ecx + 8]
    mov ecx, eax
    shl ecx, 3
    mov dword ptr [ebp - 4], ecx
    lea ecx, [ebx + eax*4]
    mov dword ptr [ebp - 16], ecx
L0:
    mov ecx, dword ptr [ebp - 8]
    mov esi, dword ptr [ebx + ecx*4]
    mov ecx, dword ptr [edx + esi*4]
    mov dword ptr [ebp - 24], ecx
    mov ecx, dword ptr [ebp - 16]
    mov edi, dword ptr [ecx]
    cmp esi, edi
    mov ecx, dword ptr [edx + edi*4]
    mov dword ptr [ebp - 20], ecx
    mov ecx, dword ptr [ebp - 4]
    mov ecx, dword ptr [ecx + ebx]
    mov ecx, dword ptr [edx + ecx*4]
    mov dword ptr [ebp - 12], ecx
    jne L5
    mov ecx, dword ptr [ebp - 28]
    mov esi, dword ptr [ecx + 000000100h]
    mov esi, dword ptr [esi + 8]
    mov edi, dword ptr [ebp - 4]
    mov edi, dword ptr [edi + esi]
    mov esi, dword ptr [ebp - 20]
    mov esi, dword ptr [esi + 56]
    cmp esi, edi
    mov dword ptr [ebp - 32], edi
    je L1
    cmp esi, -1
    je L5
    mov edi, dword ptr [ebp - 12]
    cmp esi, dword ptr [edi + 56]
    jne L5
L1:
    mov edi, dword ptr [ebp - 20]
    mov esi, dword ptr [ebp - 12]
    mov edi, dword ptr [edi + 60]
    mov esi, dword ptr [esi + 60]
    xor edi, 000080000h
    cmp edi, esi
    mov dword ptr [ebp - 36], esi
    jne L5
    mov esi, dword ptr [ebp - 24]
    mov esi, dword ptr [esi + 56]
    cmp esi, dword ptr [ebp - 32]
    je L2
    cmp esi, -1
    je L5
    mov edi, dword ptr [ebp - 12]
    cmp esi, dword ptr [edi + 56]
    jne L5
L2:
    mov esi, dword ptr [ebp - 24]
    mov esi, dword ptr [esi + 60]
    xor esi, 000080000h
    cmp esi, dword ptr [ebp - 36]
    jne L5
    inc dword ptr [ebp - 8]
    add dword ptr [ebp - 16], 4
    add dword ptr [ebp - 4], 4
    cmp dword ptr [ebp - 8], eax
    jb L0
L3:
    mov esi, dword ptr [ecx + 000000100h]
    mov edx, eax
    and edx, 0000FFFFFh
    or edx, 070000000h
    mov dword ptr [esi], edx
    mov edx, dword ptr [ecx + 000000100h]
    mov dword ptr [edx + 4], eax
    mov ecx, dword ptr [ecx + 000000100h]
    mov edi, dword ptr [ecx + 8]
    mov ecx, eax
    lea esi, [edi + eax*8]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    xor eax, eax
L4:
    pop edi
    pop esi
    pop ebx
    leave
    ret
L5:
    xor eax, eax
    inc eax
    jmp L4
FUN_100c143f ENDP
END
