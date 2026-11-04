.686
.MODEL FLAT, C
.CODE
FUN_10086f48 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 20
    push ebx
    push esi
    push edi
    xor ebx, ebx
    xor edi, edi
    cmp dword ptr [ecx + 8], ebx
    jbe L3
L0:
    mov eax, dword ptr [ecx + 20]
    mov eax, dword ptr [eax + edi*4]
    mov edx, dword ptr [eax + 4]
    mov esi, dword ptr [ecx + 16]
    mov esi, dword ptr [esi + edx*4]
    mov edx, dword ptr [esi + 4]
    test dl, 48
    je L1
    test dh, 2
    jne L1
    mov edx, dword ptr [ecx + 116]
    mov dword ptr [eax + 4], edx
L1:
    test byte ptr [esi + 4], 4
    je L2
    mov edx, dword ptr [ecx + 000000088h]
    mov dword ptr [eax + 4], edx
L2:
    inc edi
    cmp edi, dword ptr [ecx + 8]
    jb L0
L3:
    cmp dword ptr [ecx + 12], ebx
    mov dword ptr [ebp - 16], ebx
    jbe L25
    jmp L5
L4:
    xor ebx, ebx
L5:
    mov eax, dword ptr [ecx + 24]
    mov edx, dword ptr [ebp - 16]
    mov esi, dword ptr [eax + edx*4]
    mov edi, dword ptr [esi]
    test edi, 0FFF00000h
    je L24
    cmp dword ptr [esi + 12], ebx
    mov dword ptr [ebp - 8], ebx
    jbe L8
    mov ebx, dword ptr [esi + 12]
    mov edx, dword ptr [ecx + 20]
    mov eax, dword ptr [esi + 16]
    mov dword ptr [ebp - 20], ebx
L6:
    mov ebx, dword ptr [eax]
    mov ebx, dword ptr [edx + ebx*4]
    test byte ptr [ebx], 32
    je L7
    inc dword ptr [ebp - 8]
L7:
    add eax, 4
    dec dword ptr [ebp - 20]
    jne L6
L8:
    mov ebx, dword ptr [esi + 12]
    cmp dword ptr [ebp - 8], ebx
    jne L9
    and dword ptr [esi], 0
    jmp L24
L9:
    jae L19
    mov eax, edi
    and eax, 0F0000000h
    cmp eax, 010000000h
    jb L19
    cmp eax, 040000000h
    ja L19
    mov eax, dword ptr [esi + 4]
    and edi, 0000FFFFFh
    xor edx, edx
    div edi
    xor edi, edi
    cmp ebx, edi
    mov dword ptr [ebp - 4], edi
    mov dword ptr [ebp - 8], eax
    jbe L14
L10:
    mov eax, dword ptr [esi + 16]
    mov edx, dword ptr [ebp - 4]
    mov edx, dword ptr [eax + edx*4]
    mov ebx, dword ptr [ecx + 20]
    mov ebx, dword ptr [ebx + edx*4]
    test byte ptr [ebx], 32
    jne L13
    and dword ptr [ebp - 12], 0
    cmp dword ptr [ebp - 8], 0
    mov dword ptr [eax + edi*4], edx
    jbe L12
L11:
    mov edx, dword ptr [esi + 12]
    imul edx, dword ptr [ebp - 12]
    mov eax, dword ptr [esi + 8]
    mov ebx, dword ptr [ebp - 4]
    add ebx, edx
    mov ebx, dword ptr [eax + ebx*4]
    add edx, edi
    inc dword ptr [ebp - 12]
    mov dword ptr [eax + edx*4], ebx
    mov eax, dword ptr [ebp - 12]
    cmp eax, dword ptr [ebp - 8]
    jb L11
L12:
    inc edi
L13:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [esi + 12]
    jb L10
L14:
    xor eax, eax
    inc eax
    cmp dword ptr [ebp - 8], eax
    mov dword ptr [ebp - 4], eax
    jbe L18
    mov eax, edi
    shl eax, 2
    mov dword ptr [ebp - 20], eax
L15:
    and dword ptr [ebp - 12], 0
    test edi, edi
    jbe L17
    mov edx, dword ptr [ebp - 20]
L16:
    mov ebx, dword ptr [esi + 12]
    imul ebx, dword ptr [ebp - 4]
    add ebx, dword ptr [ebp - 12]
    mov eax, dword ptr [esi + 8]
    mov ebx, dword ptr [eax + ebx*4]
    inc dword ptr [ebp - 12]
    mov dword ptr [edx + eax], ebx
    add edx, 4
    cmp dword ptr [ebp - 12], edi
    jb L16
L17:
    inc dword ptr [ebp - 4]
    mov eax, edi
    shl eax, 2
    add dword ptr [ebp - 20], eax
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [ebp - 8]
    jb L15
L18:
    mov eax, dword ptr [esi]
    xor eax, edi
    and eax, 0000FFFFFh
    xor dword ptr [esi], eax
    mov eax, edi
    imul eax, dword ptr [ebp - 8]
    mov dword ptr [esi + 4], eax
    mov dword ptr [esi + 12], edi
L19:
    and dword ptr [ebp - 12], 0
    cmp dword ptr [esi + 12], 0
    jbe L24
L20:
    mov edx, dword ptr [ebp - 12]
    mov eax, dword ptr [esi + 16]
    mov eax, dword ptr [eax + edx*4]
    mov edi, dword ptr [ecx + 20]
    mov eax, dword ptr [edi + eax*4]
    mov edx, dword ptr [eax + 24]
    mov dword ptr [ebp - 20], edx
    mov edx, dword ptr [eax + 20]
    jmp L22
L21:
    mov ebx, edx
    shl ebx, 2
    mov dword ptr [ebp - 8], ebx
    mov ebx, dword ptr [ebx + edi]
    test byte ptr [ebx], 32
    je L23
    mov ebx, dword ptr [ebp - 8]
    mov edx, dword ptr [ecx + 20]
    mov edx, dword ptr [ebx + edx]
    mov ebx, dword ptr [edx + 24]
    mov edx, dword ptr [edx + 20]
    mov dword ptr [ebp - 20], ebx
L22:
    cmp edx, -1
    jne L21
L23:
    mov edi, dword ptr [ebp - 20]
    inc dword ptr [ebp - 12]
    mov dword ptr [eax + 24], edi
    mov dword ptr [eax + 20], edx
    mov eax, dword ptr [ebp - 12]
    cmp eax, dword ptr [esi + 12]
    jb L20
L24:
    inc dword ptr [ebp - 16]
    mov eax, dword ptr [ebp - 16]
    cmp eax, dword ptr [ecx + 12]
    jb L4
L25:
    pop edi
    pop esi
    xor eax, eax
    pop ebx
    leave
    ret
FUN_10086f48 ENDP
END
