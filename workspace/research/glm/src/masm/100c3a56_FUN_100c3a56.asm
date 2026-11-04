.686
.MODEL FLAT, C
.CODE
FUN_100c3a56 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 28
    push ebx
    mov ebx, dword ptr [ebp + 12]
    push esi
    mov esi, dword ptr [ebx]
    and esi, 0000FFFFFh
    mov dword ptr [ebp - 4], ecx
    mov dword ptr [ebp - 8], esi
    je L21
    mov eax, dword ptr [ebx + 4]
    xor edx, edx
    div esi
    mov edx, eax
    test edx, edx
    mov dword ptr [ebp - 28], edx
    jbe L19
    and dword ptr [ebp - 12], 0
    push edi
    mov edi, dword ptr [ebp + 16]
    mov dword ptr [ebp - 20], edx
    jmp L1
L0:
    mov ecx, dword ptr [ebp - 4]
    mov ebx, dword ptr [ebp + 12]
L1:
    mov edx, dword ptr [ebx + 8]
    mov eax, dword ptr [ebp - 12]
    mov edx, dword ptr [eax + edx]
    mov ebx, dword ptr [ecx + 20]
    mov edx, dword ptr [ebx + edx*4]
    mov ebx, dword ptr [edx + 84]
    mov edx, dword ptr [edx + 72]
    cmp edx, -1
    mov dword ptr [ebp - 24], ebx
    je L17
    test esi, esi
    mov ecx, dword ptr [ecx + 24]
    mov ebx, dword ptr [ecx + edx*4]
    mov dword ptr [edi], ebx
    jbe L7
    mov ecx, eax
    mov dword ptr [ebp - 16], esi
L2:
    mov eax, dword ptr [ebp + 12]
    mov eax, dword ptr [eax + 8]
    mov eax, dword ptr [ecx + eax]
    mov esi, dword ptr [ebp - 4]
    mov esi, dword ptr [esi + 20]
    mov esi, dword ptr [esi + eax*4]
    mov eax, dword ptr [ebp - 4]
    mov eax, dword ptr [eax + 000000088h]
    cmp eax, dword ptr [esi + 4]
    je L3
    and dword ptr [edi], 0
L3:
    cmp dword ptr [esi + 60], 0
    je L4
    and dword ptr [edi], 0
L4:
    mov eax, dword ptr [esi + 80]
    cmp eax, edx
    jbe L5
    cmp eax, dword ptr [ebp - 24]
    jae L5
    and dword ptr [edi], 0
L5:
    mov eax, dword ptr [esi + 84]
    cmp eax, dword ptr [esi + 88]
    je L6
    and dword ptr [edi], 0
L6:
    add ecx, 4
    dec dword ptr [ebp - 16]
    jne L2
L7:
    cmp dword ptr [edi], 0
    je L18
    mov eax, dword ptr [ebp + 8]
    cmp eax, dword ptr [ebx]
    jne L17
    mov ecx, dword ptr [ebp - 8]
    test ecx, ecx
    jbe L10
    mov eax, dword ptr [ebp - 12]
    mov dword ptr [ebp - 16], ecx
L8:
    mov ecx, dword ptr [ebp + 12]
    mov ecx, dword ptr [ecx + 8]
    mov esi, dword ptr [ebp - 4]
    mov ecx, dword ptr [eax + ecx]
    mov esi, dword ptr [esi + 20]
    mov ecx, dword ptr [esi + ecx*4]
    cmp dword ptr [ecx + 72], edx
    je L9
    and dword ptr [edi], 0
L9:
    add eax, 4
    dec dword ptr [ebp - 16]
    jne L8
L10:
    cmp dword ptr [edi], 0
    je L18
    mov edx, dword ptr [ebx]
    and edx, 0000FFFFFh
    cmp dword ptr [ebx + 12], edx
    jne L17
    imul edx, dword ptr [ebp + 20]
    cmp dword ptr [ebx + 4], edx
    ja L17
    mov eax, dword ptr [ebp + 12]
    mov eax, dword ptr [eax + 4]
    xor esi, esi
    test eax, eax
    jbe L12
    mov ecx, dword ptr [ebx + 16]
    mov edx, dword ptr [ebp + 12]
    mov ecx, dword ptr [ecx]
    mov edx, dword ptr [edx + 8]
L11:
    cmp dword ptr [edx], ecx
    je L12
    inc esi
    add edx, 4
    cmp esi, eax
    jb L11
L12:
    cmp esi, eax
    je L17
    mov edx, dword ptr [ebx + 12]
    cmp edx, 1
    jbe L18
    mov ecx, dword ptr [ebp - 8]
    cmp edx, ecx
    jne L13
    lea edx, [esi + ecx]
    cmp edx, eax
    jbe L14
L13:
    and dword ptr [edi], 0
L14:
    xor eax, eax
    test ecx, ecx
    jbe L18
    mov edx, esi
    shl edx, 2
L15:
    mov ecx, dword ptr [ebx + 16]
    mov esi, dword ptr [ebp + 12]
    mov esi, dword ptr [esi + 8]
    mov ecx, dword ptr [ecx + eax*4]
    cmp ecx, dword ptr [edx + esi]
    je L16
    and dword ptr [edi], 0
L16:
    inc eax
    add edx, 4
    cmp eax, dword ptr [ebp - 8]
    jb L15
    jmp L18
L17:
    and dword ptr [edi], 0
L18:
    mov esi, dword ptr [ebp - 8]
    mov eax, esi
    shl eax, 2
    add dword ptr [ebp - 12], eax
    add edi, 4
    dec dword ptr [ebp - 20]
    jne L0
    mov edx, dword ptr [ebp - 28]
    pop edi
L19:
    xor eax, eax
    test edx, edx
    jbe L21
L20:
    mov ecx, dword ptr [ebp + 16]
    cmp dword ptr [ecx + eax*4], 0
    jne L23
    inc eax
    cmp eax, edx
    jb L20
L21:
    xor eax, eax
    inc eax
L22:
    pop esi
    pop ebx
    leave
    ret 16
L23:
    xor eax, eax
    jmp L22
FUN_100c3a56 ENDP
END
