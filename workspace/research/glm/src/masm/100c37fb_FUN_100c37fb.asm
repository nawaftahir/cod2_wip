.686
.MODEL FLAT, C
.CODE
FUN_100c37fb PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 32
    mov edx, dword ptr [ecx + 20]
    push esi
    mov esi, dword ptr [ebp + 12]
    mov eax, dword ptr [esi + 16]
    mov eax, dword ptr [eax]
    mov eax, dword ptr [edx + eax*4]
    mov edx, dword ptr [eax + 72]
    mov eax, dword ptr [eax + 84]
    cmp eax, -1
    mov dword ptr [ebp - 16], edx
    mov dword ptr [ebp - 8], eax
    jne L0
    xor eax, eax
    jmp L25
L0:
    and dword ptr [ebp - 4], 0
    cmp dword ptr [esi + 4], 0
    push ebx
    push edi
    jbe L3
    mov edi, dword ptr [ecx + 20]
    mov edx, dword ptr [esi + 8]
L1:
    mov eax, dword ptr [edx]
    mov eax, dword ptr [edi + eax*4]
    mov ebx, dword ptr [ecx + 000000088h]
    cmp ebx, dword ptr [eax + 4]
    jne L2
    mov eax, dword ptr [eax + 80]
    cmp eax, dword ptr [ebp - 16]
    jbe L2
    cmp eax, dword ptr [ebp - 8]
    jb L23
L2:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    add edx, 4
    cmp eax, dword ptr [esi + 4]
    jb L1
    mov eax, dword ptr [ebp - 8]
L3:
    mov edx, dword ptr [ecx + 24]
    mov eax, dword ptr [edx + eax*4]
    mov edi, dword ptr [eax]
    cmp dword ptr [ebp + 8], edi
    jne L23
    mov edx, dword ptr [esi + 12]
    and dword ptr [ebp - 4], 0
    test edx, edx
    jbe L7
    mov edx, dword ptr [esi + 16]
    mov dword ptr [ebp - 12], edx
L4:
    mov edx, dword ptr [ebp - 12]
    mov ebx, dword ptr [edx]
    mov edx, dword ptr [ecx + 20]
    mov edx, dword ptr [edx + ebx*4]
    mov ebx, dword ptr [ebp - 8]
    cmp dword ptr [edx + 84], ebx
    jne L23
    cmp dword ptr [edx + 88], ebx
    jne L23
    cmp dword ptr [esi + 12], 1
    jne L5
    mov ebx, dword ptr [ebp + 8]
    and ebx, 0000FFFFFh
    imul ebx, dword ptr [ebp + 24]
    cmp dword ptr [edx + 92], ebx
    jmp L6
L5:
    mov edx, dword ptr [edx + 92]
    cmp edx, dword ptr [ebp + 24]
L6:
    jne L23
    inc dword ptr [ebp - 4]
    mov edx, dword ptr [ebp - 4]
    add dword ptr [ebp - 12], 4
    cmp edx, dword ptr [esi + 12]
    jb L4
L7:
    and edi, 0000FFFFFh
    mov edx, edi
    cmp dword ptr [eax + 12], edx
    mov dword ptr [ebp + 8], edx
    jne L23
    mov edi, dword ptr [eax + 4]
    mov ebx, edx
    imul ebx, dword ptr [ebp + 20]
    cmp edi, ebx
    ja L23
    and dword ptr [ebp - 4], 0
    test edi, edi
    jbe L10
    mov edi, dword ptr [ecx + 20]
    mov ecx, dword ptr [ecx + 000000088h]
    mov dword ptr [ebp + 20], ecx
    mov ecx, dword ptr [eax + 8]
    mov dword ptr [ebp + 24], edi
L8:
    mov edi, dword ptr [ecx]
    mov ebx, dword ptr [ebp + 24]
    mov ebx, dword ptr [ebx + edi*4]
    mov edi, dword ptr [ebp + 20]
    cmp edi, dword ptr [ebx + 4]
    jne L9
    mov edi, dword ptr [ebp - 16]
    cmp dword ptr [ebx + 72], edi
    ja L23
L9:
    inc dword ptr [ebp - 4]
    mov edi, dword ptr [eax + 4]
    add ecx, 4
    cmp dword ptr [ebp - 4], edi
    jb L8
L10:
    and dword ptr [ebp - 4], 0
    test edi, edi
    jbe L12
    mov ecx, dword ptr [esi + 16]
    mov ecx, dword ptr [ecx]
    mov dword ptr [ebp + 24], ecx
    mov ecx, dword ptr [eax + 8]
L11:
    mov ebx, dword ptr [ebp + 24]
    cmp dword ptr [ecx], ebx
    je L12
    inc dword ptr [ebp - 4]
    add ecx, 4
    cmp dword ptr [ebp - 4], edi
    jb L11
L12:
    cmp dword ptr [ebp - 4], edi
    je L23
    cmp dword ptr [ebp - 4], edx
    jb L14
    xor ebx, ebx
    test edx, edx
    jbe L14
    mov esi, edx
    shl esi, 2
L13:
    mov ecx, dword ptr [eax + 8]
    lea edx, [ecx + ebx*4]
    mov ecx, dword ptr [esi + ecx]
    mov edi, dword ptr [edx]
    mov dword ptr [edx], ecx
    mov ecx, dword ptr [eax + 8]
    mov dword ptr [esi + ecx], edi
    inc ebx
    add esi, 4
    cmp ebx, dword ptr [ebp + 8]
    jb L13
    mov edx, dword ptr [ebp + 8]
    mov esi, dword ptr [ebp + 12]
L14:
    cmp dword ptr [esi + 12], 1
    jbe L22
    mov ebx, dword ptr [esi + 8]
    mov ecx, dword ptr [esi + 4]
    lea ecx, [ebx + ecx*4]
    cmp ebx, ecx
    mov dword ptr [ebp - 4], ecx
    jae L22
    jmp L16
L15:
    mov esi, dword ptr [ebp + 12]
L16:
    test edx, edx
    jbe L21
    mov ecx, dword ptr [esi + 16]
    mov dword ptr [ebp - 12], ecx
    mov ecx, dword ptr [eax + 8]
    mov edi, ebx
    sub ecx, ebx
    mov dword ptr [ebp - 16], edx
L17:
    mov edx, dword ptr [ebp - 12]
    and dword ptr [ebp + 24], 0
    mov dword ptr [ebp + 20], edx
L18:
    mov edx, dword ptr [ecx + edi]
    mov esi, dword ptr [ebp + 20]
    cmp dword ptr [esi], edx
    je L19
    inc dword ptr [ebp + 24]
    mov edx, dword ptr [ebp + 8]
    add dword ptr [ebp + 20], 4
    cmp dword ptr [ebp + 24], edx
    jb L18
    jmp L20
L19:
    mov edx, dword ptr [edi]
    mov esi, dword ptr [ebp + 24]
    mov dword ptr [ebp + esi*4 - 32], edx
    mov edx, dword ptr [ebp + 8]
L20:
    add edi, 4
    dec dword ptr [ebp - 16]
    jne L17
L21:
    mov ecx, edx
    shl ecx, 2
    mov edx, ecx
    shr ecx, 2
    mov edi, ebx
    lea esi, [ebp - 32]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    mov edx, dword ptr [ebp + 8]
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov ecx, edx
    shl ecx, 2
    add ebx, ecx
    cmp ebx, dword ptr [ebp - 4]
    jb L15
L22:
    mov ecx, dword ptr [ebp + 16]
    test ecx, ecx
    je L24
    mov edx, dword ptr [ebp - 8]
    mov dword ptr [ecx], edx
    jmp L24
L23:
    xor eax, eax
L24:
    pop edi
    pop ebx
L25:
    pop esi
    leave
    ret 20
FUN_100c37fb ENDP
END
