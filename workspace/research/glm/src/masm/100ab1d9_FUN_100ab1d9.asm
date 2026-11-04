.686
.MODEL FLAT, C
.CODE
FUN_100ab1d9 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    and dword ptr [ebp - 4], 0
    mov eax, ecx
    cmp dword ptr [eax + 0000002C0h], 0
    push esi
    jbe L1
    push ebx
    push edi
L0:
    mov ecx, dword ptr [eax + 0000002B4h]
    mov edx, dword ptr [ebp - 4]
    mov edi, dword ptr [eax + 24]
    shl edx, 2
    mov esi, dword ptr [edx + ecx]
    mov ecx, dword ptr [esi + 4]
    mov edi, dword ptr [edi + edx]
    mov esi, dword ptr [esi + 8]
    mov edi, dword ptr [edi + 8]
    shl ecx, 2
    mov ebx, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, ebx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov ecx, dword ptr [eax + 0000002B4h]
    mov esi, dword ptr [edx + ecx]
    mov edi, dword ptr [eax + 24]
    mov ecx, dword ptr [esi + 12]
    mov edx, dword ptr [edi + edx]
    mov edi, dword ptr [edx + 16]
    mov esi, dword ptr [esi + 16]
    shl ecx, 2
    mov edx, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    inc dword ptr [ebp - 4]
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov ecx, dword ptr [ebp - 4]
    cmp ecx, dword ptr [eax + 0000002C0h]
    jb L0
    pop edi
    pop ebx
L1:
    xor ecx, ecx
    cmp dword ptr [eax + 0000002BCh], ecx
    jbe L3
L2:
    mov edx, dword ptr [eax + 0000002B8h]
    mov edx, dword ptr [edx + ecx*4]
    mov esi, dword ptr [eax + 20]
    mov esi, dword ptr [esi + ecx*4]
    mov edx, dword ptr [edx + 56]
    inc ecx
    mov dword ptr [esi + 56], edx
    cmp ecx, dword ptr [eax + 0000002BCh]
    jb L2
L3:
    xor eax, eax
    pop esi
    leave
    ret
FUN_100ab1d9 ENDP
END
