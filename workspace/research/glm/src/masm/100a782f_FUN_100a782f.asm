.686
.MODEL FLAT, C
.CODE
FUN_100a782f PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 36
    mov edx, dword ptr [ecx + 000000224h]
    mov eax, dword ptr [ecx + 000000230h]
    push ebx
    push esi
    mov esi, dword ptr [eax + edx*4 - 4]
    test esi, esi
    push edi
    mov dword ptr [ebp - 16], esi
    je L26
    cmp dword ptr [esi], 010000004h
    jne L26
    mov ebx, dword ptr [ecx + 000000084h]
    mov eax, dword ptr [ecx + 20]
    xor edi, edi
    jmp L1
L0:
    mov esi, dword ptr [ebp - 16]
L1:
    mov esi, dword ptr [esi + 16]
    mov esi, dword ptr [edi + esi]
    mov esi, dword ptr [eax + esi*4]
    cmp dword ptr [esi + 4], ebx
    jne L26
    cmp dword ptr [esi + 60], 0
    jne L26
    mov esi, dword ptr [ebp - 16]
    mov esi, dword ptr [esi + 8]
    mov esi, dword ptr [edi + esi]
    mov esi, dword ptr [eax + esi*4]
    test byte ptr [esi + 62], 31
    jne L26
    add edi, 4
    cmp edi, 16
    jb L0
    mov eax, dword ptr [ecx + 0000000C8h]
    and dword ptr [ebp - 8], 0
    and eax, 00000FFFFh
    mov dword ptr [ebp - 36], eax
    mov eax, dword ptr [ebp - 16]
    mov eax, dword ptr [eax + 8]
    dec edx
    mov dword ptr [ebp - 12], 1
    mov dword ptr [ebp - 4], edx
    mov dword ptr [ebp - 24], eax
L2:
    xor esi, esi
    xor ebx, ebx
    cmp dword ptr [ebp - 4], esi
    jbe L8
    mov eax, dword ptr [ecx + 000000230h]
    mov dword ptr [ebp - 20], eax
L3:
    mov eax, dword ptr [ebp - 20]
    mov eax, dword ptr [eax]
    test eax, eax
    je L7
    cmp dword ptr [eax], 0
    je L7
    mov edi, dword ptr [eax + 12]
    test edi, edi
    jbe L6
    mov edx, dword ptr [ebp - 24]
    mov edx, dword ptr [edx]
    mov eax, dword ptr [eax + 16]
L4:
    cmp dword ptr [eax], edx
    jne L5
    xor ebx, ebx
    inc ebx
L5:
    add eax, 4
    dec edi
    jne L4
L6:
    test ebx, ebx
    jne L8
L7:
    add dword ptr [ebp - 20], 4
    inc esi
    cmp esi, dword ptr [ebp - 4]
    jb L3
L8:
    cmp dword ptr [ebp - 36], 000000104h
    jne L9
    cmp esi, dword ptr [ecx + 76]
    jae L11
    test esi, esi
    je L11
    jmp L10
L9:
    cmp esi, dword ptr [ecx + 76]
    jae L11
L10:
    and dword ptr [ebp - 12], 0
L11:
    test ebx, ebx
    je L26
    inc esi
    cmp esi, dword ptr [ebp - 4]
    jae L19
    mov eax, dword ptr [ecx + 000000230h]
    lea eax, [eax + esi*4]
    mov dword ptr [ebp - 20], eax
    mov eax, dword ptr [ebp - 4]
    sub eax, esi
    mov dword ptr [ebp - 32], eax
L12:
    mov eax, dword ptr [ebp - 20]
    mov eax, dword ptr [eax]
    test eax, eax
    je L18
    cmp dword ptr [eax], 0
    je L18
    mov edx, dword ptr [eax + 12]
    test edx, edx
    jbe L15
    mov edi, dword ptr [ecx + 20]
    mov esi, dword ptr [eax + 16]
    mov dword ptr [ebp - 28], edx
L13:
    mov edx, dword ptr [esi]
    mov edx, dword ptr [edi + edx*4]
    mov ebx, dword ptr [ecx + 000000088h]
    cmp dword ptr [edx + 4], ebx
    jne L14
    mov ebx, dword ptr [ebp - 8]
    cmp dword ptr [edx + 16], ebx
    jne L14
    cmp dword ptr [edx + 12], 0
    jne L14
    and dword ptr [ebp - 12], 0
L14:
    add esi, 4
    dec dword ptr [ebp - 28]
    jne L13
L15:
    mov edx, dword ptr [eax + 4]
    test edx, edx
    jbe L18
    mov edi, dword ptr [ecx + 20]
    mov esi, dword ptr [ecx + 000000088h]
    mov eax, dword ptr [eax + 8]
    mov dword ptr [ebp - 28], edx
L16:
    mov edx, dword ptr [eax]
    mov edx, dword ptr [edi + edx*4]
    cmp dword ptr [edx + 4], esi
    jne L17
    mov ebx, dword ptr [ebp - 8]
    cmp dword ptr [edx + 16], ebx
    jne L17
    cmp dword ptr [edx + 12], 0
    jne L17
    and dword ptr [ebp - 12], 0
L17:
    add eax, 4
    dec dword ptr [ebp - 28]
    jne L16
L18:
    add dword ptr [ebp - 20], 4
    dec dword ptr [ebp - 32]
    jne L12
L19:
    inc dword ptr [ebp - 8]
    add dword ptr [ebp - 24], 4
    cmp dword ptr [ebp - 8], 4
    jb L2
    xor edi, edi
    cmp dword ptr [ebp - 12], edi
    je L26
L20:
    xor esi, esi
    cmp dword ptr [ebp - 4], esi
    mov dword ptr [ebp - 12], esi
    jbe L25
L21:
    mov eax, dword ptr [ecx + 000000230h]
    mov edx, dword ptr [ebp - 12]
    mov eax, dword ptr [eax + edx*4]
    cmp eax, esi
    je L24
    cmp dword ptr [eax], esi
    je L24
    cmp dword ptr [eax + 12], esi
    jbe L24
L22:
    mov edx, dword ptr [eax + 16]
    mov ebx, dword ptr [ebp - 16]
    mov edx, dword ptr [edx + esi*4]
    mov ebx, dword ptr [ebx + 8]
    cmp edx, dword ptr [edi + ebx]
    jne L23
    mov ebx, dword ptr [ecx + 20]
    mov edx, dword ptr [ebx + edx*4]
    and dword ptr [edx + 12], 0
L23:
    inc esi
    cmp esi, dword ptr [eax + 12]
    jb L22
    xor esi, esi
L24:
    inc dword ptr [ebp - 12]
    mov eax, dword ptr [ecx + 000000224h]
    dec eax
    cmp dword ptr [ebp - 12], eax
    mov dword ptr [ebp - 4], eax
    jb L21
L25:
    add edi, 4
    cmp edi, 16
    jb L20
    mov eax, dword ptr [ebp - 16]
    mov dword ptr [eax], esi
L26:
    pop edi
    pop esi
    xor eax, eax
    pop ebx
    leave
    ret
FUN_100a782f ENDP
END
