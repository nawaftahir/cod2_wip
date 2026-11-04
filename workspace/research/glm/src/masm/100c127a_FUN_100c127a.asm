.686
.MODEL FLAT, C
.CODE
FUN_100c127a PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 12
    mov eax, dword ptr [ecx + 000000100h]
    mov eax, dword ptr [eax]
    and eax, 0000FFFFFh
    push ebx
    push esi
    push edi
    mov dword ptr [ebp - 12], 0
    jbe L1
    mov edx, dword ptr [ecx + 000000100h]
    mov edx, dword ptr [edx + 8]
    mov edi, dword ptr [ecx + 20]
    mov dword ptr [ebp - 4], edx
    lea edx, [edx + eax*4]
    mov dword ptr [ebp - 8], edx
L0:
    mov edx, dword ptr [ebp - 4]
    mov edx, dword ptr [edx]
    mov esi, dword ptr [ebp - 8]
    mov edx, dword ptr [edi + edx*4]
    mov esi, dword ptr [esi]
    mov esi, dword ptr [edi + esi*4]
    mov ebx, dword ptr [edx + 4]
    cmp ebx, dword ptr [esi + 4]
    jne L4
    mov ebx, dword ptr [edx + 8]
    cmp ebx, dword ptr [esi + 8]
    jne L4
    mov ebx, dword ptr [edx + 12]
    cmp ebx, dword ptr [esi + 12]
    jne L4
    mov ebx, dword ptr [edx + 16]
    cmp ebx, dword ptr [esi + 16]
    jne L4
    mov esi, dword ptr [esi + 60]
    xor esi, dword ptr [edx + 60]
    cmp esi, 000080000h
    jne L4
    inc dword ptr [ebp - 12]
    add dword ptr [ebp - 4], 4
    add dword ptr [ebp - 8], 4
    cmp dword ptr [ebp - 12], eax
    jb L0
L1:
    mov esi, dword ptr [ecx + 000000100h]
    mov edx, eax
    and edx, 0000FFFFFh
    or edx, 070000000h
    test eax, eax
    mov dword ptr [esi], edx
    mov edx, dword ptr [ecx + 000000100h]
    mov dword ptr [edx + 4], eax
    je L2
    mov edx, dword ptr [ecx + 000000100h]
    mov edx, dword ptr [edx + 8]
    mov edx, dword ptr [edx]
    mov esi, dword ptr [ecx + 20]
    mov edx, dword ptr [esi + edx*4]
    test byte ptr [edx + 62], 8
    je L2
    mov ecx, dword ptr [ecx + 000000100h]
    mov edi, dword ptr [ecx + 8]
    shl eax, 2
    mov ecx, eax
    shr ecx, 2
    lea esi, [edi + eax]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
L2:
    xor eax, eax
L3:
    pop edi
    pop esi
    pop ebx
    leave
    ret
L4:
    xor eax, eax
    inc eax
    jmp L3
FUN_100c127a ENDP
END
