.686
.MODEL FLAT, C
.CODE
FUN_100b06a6 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 32
    push esi
    push edi
    mov edi, dword ptr [ebp + 20]
    test edi, edi
    mov dword ptr [ebp - 4], ecx
    je L0
    and dword ptr [edi], 0
L0:
    mov esi, dword ptr [ebp + 16]
    test esi, esi
    je L29
    test edi, edi
    mov edx, dword ptr [ebp + 12]
    jne L3
    cmp edx, esi
    mov ecx, edx
    jae L3
L1:
    mov eax, dword ptr [ebp + 8]
    mov eax, dword ptr [eax + ecx*4]
    test eax, eax
    je L2
    and dword ptr [eax + 36], 0
L2:
    inc ecx
    cmp ecx, esi
    jb L1
L3:
    lea eax, [esi - 1]
    cmp edx, eax
    push ebx
    mov ebx, edx
    jae L28
L4:
    mov ecx, dword ptr [ebp + 8]
    mov edi, dword ptr [ecx + ebx*4]
    test edi, edi
    je L27
    mov ecx, dword ptr [ebp + 20]
    xor esi, esi
    test ecx, ecx
    je L5
    inc dword ptr [ecx]
L5:
    cmp ebx, eax
    jae L6
    mov ecx, dword ptr [ebp + 8]
    inc ebx
    mov esi, dword ptr [ecx + ebx*4]
    test esi, esi
    je L5
L6:
    and dword ptr [ebp - 28], 0
    dec ebx
    test esi, esi
    mov dword ptr [ebp - 24], ebx
    je L26
    xor eax, eax
    cmp dword ptr [ebp + 20], eax
    mov dword ptr [ebp - 32], eax
    jne L7
    mov dword ptr [edi + 36], eax
    mov dword ptr [esi + 36], eax
L7:
    mov eax, dword ptr [edi]
    mov ecx, 0000FFFFFh
    and eax, ecx
    cmp eax, 1
    jne L8
    mov edx, dword ptr [esi]
    and edx, ecx
    cmp edx, 4
    jae L8
    mov eax, edi
    mov edi, esi
    mov esi, eax
    mov dword ptr [ebp - 32], 1
    jmp L9
L8:
    cmp eax, 4
    je L26
    mov eax, dword ptr [esi]
    and eax, ecx
    cmp eax, 1
    jne L26
L9:
    mov ecx, dword ptr [ebp - 4]
    mov eax, dword ptr [ecx + 0000000C8h]
    and eax, 00000FFFFh
    cmp eax, 000000104h
    je L10
    mov eax, dword ptr [ecx]
    push esi
    push edi
    call dword ptr [eax + 0xa4]
    test eax, eax
    jne L26
L10:
    mov eax, dword ptr [edi]
    and eax, 0FFF00000h
    cmp eax, 072100000h
    je L26
    cmp eax, 072000000h
    je L26
    cmp eax, 060500000h
    je L26
    cmp eax, 060A00000h
    je L26
    cmp eax, 060000000h
    je L26
    cmp eax, 060F00000h
    je L26
    cmp eax, 011000000h
    je L26
    test eax, eax
    je L26
    and dword ptr [ebp - 12], 0
    cmp dword ptr [edi + 12], 0
    jbe L17
    mov ecx, dword ptr [edi + 16]
    mov eax, dword ptr [ebp - 4]
    mov eax, dword ptr [eax + 20]
    mov dword ptr [ebp - 8], ecx
    mov ecx, dword ptr [edi + 12]
    mov dword ptr [ebp - 20], ecx
L11:
    mov ecx, dword ptr [ebp - 8]
    mov edx, dword ptr [ecx]
    mov ecx, dword ptr [eax + edx*4]
    cmp dword ptr [ecx + 16], 3
    jne L12
    mov dword ptr [ebp - 28], 1
L12:
    cmp dword ptr [esi + 4], 0
    jbe L16
    mov ecx, dword ptr [esi + 8]
    mov dword ptr [ebp + 12], ecx
    mov ecx, dword ptr [esi + 4]
    mov dword ptr [ebp - 16], ecx
L13:
    mov ecx, dword ptr [ebp + 12]
    mov ecx, dword ptr [ecx]
    mov ebx, dword ptr [eax + ecx*4]
    cmp dword ptr [ebx + 56], edx
    je L14
    cmp ecx, edx
    jne L15
L14:
    mov dword ptr [ebp - 12], 1
L15:
    add dword ptr [ebp + 12], 4
    dec dword ptr [ebp - 16]
    jne L13
    mov ebx, dword ptr [ebp - 24]
L16:
    add dword ptr [ebp - 8], 4
    dec dword ptr [ebp - 20]
    jne L11
L17:
    and dword ptr [ebp + 12], 0
    cmp dword ptr [esi + 12], 0
    jbe L23
L18:
    cmp dword ptr [edi + 4], 0
    jbe L22
    mov eax, dword ptr [ebp - 4]
    mov edx, dword ptr [eax + 20]
    mov eax, dword ptr [esi + 16]
    mov ecx, dword ptr [ebp + 12]
    mov ebx, dword ptr [edi + 4]
    mov ecx, dword ptr [eax + ecx*4]
    mov eax, dword ptr [edi + 8]
    mov dword ptr [ebp - 20], ebx
L19:
    mov ebx, dword ptr [eax]
    mov ebx, dword ptr [edx + ebx*4]
    cmp dword ptr [ebx + 56], ecx
    je L20
    cmp dword ptr [eax], ecx
    jne L21
L20:
    mov dword ptr [ebp - 12], 1
L21:
    add eax, 4
    dec dword ptr [ebp - 20]
    jne L19
    mov ebx, dword ptr [ebp - 24]
L22:
    inc dword ptr [ebp + 12]
    mov eax, dword ptr [ebp + 12]
    cmp eax, dword ptr [esi + 12]
    jb L18
L23:
    cmp dword ptr [ebp - 12], 0
    jne L26
    cmp dword ptr [ebp - 28], 0
    jne L26
    mov eax, dword ptr [esi + 16]
    mov ecx, dword ptr [ebp - 4]
    mov eax, dword ptr [eax]
    mov ecx, dword ptr [ecx + 20]
    mov eax, dword ptr [ecx + eax*4]
    cmp dword ptr [eax + 16], 3
    jne L26
    cmp dword ptr [ebp + 20], 0
    jne L25
    cmp dword ptr [ebp - 32], 0
    je L24
    mov dword ptr [edi + 36], 1
    jmp L25
L24:
    mov dword ptr [esi + 36], 1
L25:
    inc ebx
L26:
    mov esi, dword ptr [ebp + 16]
L27:
    inc ebx
    lea eax, [esi - 1]
    cmp ebx, eax
    jb L4
    mov edi, dword ptr [ebp + 20]
L28:
    cmp ebx, esi
    pop ebx
    je L29
    test edi, edi
    je L29
    inc dword ptr [edi]
L29:
    pop edi
    xor eax, eax
    pop esi
    leave
    ret 16
FUN_100b06a6 ENDP
END
