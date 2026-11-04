.686
.MODEL FLAT, C
.CODE
FUN_10087159 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 28
    push ebx
    xor ebx, ebx
    cmp dword ptr [ecx + 12], ebx
    mov dword ptr [ebp - 24], ecx
    mov dword ptr [ebp - 28], ebx
    mov dword ptr [ebp - 16], ebx
    jbe L14
    push esi
    push edi
L0:
    mov eax, dword ptr [ecx + 24]
    mov edx, dword ptr [ebp - 16]
    mov esi, dword ptr [eax + edx*4]
    mov edi, dword ptr [esi]
    mov eax, edi
    and eax, 0FFF00000h
    je L13
    cmp eax, 010100000h
    je L13
    cmp dword ptr [esi + 12], ebx
    mov dword ptr [ebp - 4], ebx
    jbe L13
    mov ebx, dword ptr [esi + 12]
    mov edx, dword ptr [ecx + 20]
    mov eax, dword ptr [esi + 16]
    mov dword ptr [ebp - 20], ebx
L1:
    mov ebx, dword ptr [eax]
    mov ebx, dword ptr [edx + ebx*4]
    test byte ptr [ebx], 32
    jne L2
    inc dword ptr [ebp - 4]
L2:
    add eax, 4
    dec dword ptr [ebp - 20]
    jne L1
    xor ebx, ebx
    cmp dword ptr [ebp - 4], ebx
    je L13
    mov eax, dword ptr [esi + 12]
    cmp dword ptr [ebp - 4], eax
    mov dword ptr [ebp - 28], 1
    jne L3
    mov dword ptr [esi], ebx
    jmp L13
L3:
    jae L13
    mov eax, edi
    and eax, 0F0000000h
    cmp eax, 010000000h
    jb L13
    cmp eax, 040000000h
    ja L13
    mov eax, dword ptr [esi + 4]
    and edi, 0000FFFFFh
    xor edx, edx
    div edi
    xor edi, edi
    mov dword ptr [ebp - 4], eax
    xor eax, eax
    jmp L5
L4:
    mov ecx, dword ptr [ebp - 24]
L5:
    mov edx, dword ptr [esi + 16]
    mov ebx, dword ptr [edx + eax*4]
    mov ecx, dword ptr [ecx + 20]
    mov ecx, dword ptr [ecx + ebx*4]
    test byte ptr [ecx], 32
    je L8
    and dword ptr [ebp - 8], 0
    cmp dword ptr [ebp - 4], 0
    mov dword ptr [edx + edi*4], ebx
    jbe L7
L6:
    mov edx, dword ptr [esi + 12]
    imul edx, dword ptr [ebp - 8]
    mov ebx, dword ptr [esi + 8]
    lea ecx, [edx + eax]
    mov ecx, dword ptr [ebx + ecx*4]
    add edx, edi
    inc dword ptr [ebp - 8]
    mov dword ptr [ebx + edx*4], ecx
    mov ecx, dword ptr [ebp - 8]
    cmp ecx, dword ptr [ebp - 4]
    jb L6
L7:
    inc edi
L8:
    inc eax
    cmp eax, dword ptr [esi + 12]
    jb L4
    xor eax, eax
    inc eax
    cmp dword ptr [ebp - 4], eax
    mov dword ptr [ebp - 12], eax
    jbe L12
    mov eax, edi
    shl eax, 2
    mov dword ptr [ebp - 20], eax
L9:
    and dword ptr [ebp - 8], 0
    test edi, edi
    jbe L11
    mov eax, dword ptr [ebp - 20]
L10:
    mov ecx, dword ptr [esi + 12]
    imul ecx, dword ptr [ebp - 12]
    add ecx, dword ptr [ebp - 8]
    mov edx, dword ptr [esi + 8]
    mov ecx, dword ptr [edx + ecx*4]
    inc dword ptr [ebp - 8]
    mov dword ptr [eax + edx], ecx
    add eax, 4
    cmp dword ptr [ebp - 8], edi
    jb L10
L11:
    inc dword ptr [ebp - 12]
    mov eax, edi
    shl eax, 2
    add dword ptr [ebp - 20], eax
    mov eax, dword ptr [ebp - 12]
    cmp eax, dword ptr [ebp - 4]
    jb L9
L12:
    mov eax, dword ptr [esi]
    mov ecx, dword ptr [ebp - 24]
    xor eax, edi
    and eax, 0000FFFFFh
    xor dword ptr [esi], eax
    mov eax, edi
    imul eax, dword ptr [ebp - 4]
    mov dword ptr [esi + 4], eax
    mov dword ptr [esi + 12], edi
    xor ebx, ebx
L13:
    inc dword ptr [ebp - 16]
    mov eax, dword ptr [ebp - 16]
    cmp eax, dword ptr [ecx + 12]
    jb L0
    pop edi
    pop esi
L14:
    xor eax, eax
    cmp dword ptr [ebp - 28], ebx
    pop ebx
    sete al
    leave
    ret
FUN_10087159 ENDP
END
