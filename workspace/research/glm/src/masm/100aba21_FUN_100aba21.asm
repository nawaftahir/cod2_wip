.686
.MODEL FLAT, C
.CODE
FUN_100aba21 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    push esi
    push edi
    xor edi, edi
    cmp dword ptr [ebp + 24], edi
    mov esi, ecx
    mov dword ptr [ebp - 4], esi
    jne L7
    xor eax, eax
    cmp dword ptr [ebp + 20], edi
    mov dword ptr [ebp + 24], eax
    ja L3
L0:
    xor eax, eax
    inc eax
L1:
    pop edi
    pop esi
    pop ebx
    leave
    ret 20
L2:
    mov esi, dword ptr [ebp - 4]
L3:
    mov ecx, dword ptr [ebp + 16]
    lea edi, [ecx + eax*4]
    mov edx, dword ptr [edi]
    mov eax, dword ptr [edx]
    and eax, 0FFF00000h
    cmp eax, 011000000h
    je L6
    cmp eax, 072100000h
    je L6
    mov eax, dword ptr [edx + 8]
    mov ecx, dword ptr [eax]
    mov eax, dword ptr [esi + 20]
    mov eax, dword ptr [eax + ecx*4]
    mov ebx, dword ptr [eax + 4]
    mov esi, dword ptr [esi + 16]
    mov esi, dword ptr [esi + ebx*4]
    test word ptr [esi + 4], 000000840h
    je L6
    mov eax, dword ptr [eax + 12]
    cmp eax, 6
    jae L20
    mov esi, dword ptr [ebp + 8]
    shl eax, 2
    add esi, eax
    cmp dword ptr [esi], 0
    jne L20
    mov ebx, dword ptr [ebp + 12]
    add eax, ebx
    mov ebx, dword ptr [eax]
    cmp ebx, -1
    jne L4
    mov dword ptr [eax], ecx
    jmp L5
L4:
    cmp ebx, ecx
    jne L20
L5:
    mov dword ptr [esi], edx
    and dword ptr [edi], 0
    mov ecx, dword ptr [edx + 8]
    mov ecx, dword ptr [ecx]
    mov dword ptr [eax], ecx
L6:
    mov eax, dword ptr [ebp + 24]
    inc eax
    cmp eax, dword ptr [ebp + 20]
    mov dword ptr [ebp + 24], eax
    jb L2
    jmp L0
L7:
    cmp dword ptr [ebp + 24], 1
    jne L14
    xor eax, eax
    cmp dword ptr [ebp + 20], edi
    mov dword ptr [ebp + 24], eax
    jbe L0
    mov esi, dword ptr [ebp + 12]
L8:
    mov ecx, dword ptr [ebp + 16]
    lea edx, [ecx + eax*4]
    mov eax, dword ptr [edx]
    test eax, eax
    je L13
    mov ecx, dword ptr [eax]
    and ecx, 0FFF00000h
    cmp ecx, 011000000h
    je L13
    cmp ecx, 072100000h
    je L13
    mov edi, dword ptr [ebp + 8]
    xor ecx, ecx
    sub edi, esi
    mov dword ptr [ebp - 4], edi
    jmp L10
L9:
    mov edi, dword ptr [ebp - 4]
L10:
    cmp dword ptr [edi + esi], 0
    jne L11
    mov edi, dword ptr [esi]
    mov ebx, dword ptr [eax + 8]
    cmp edi, dword ptr [ebx]
    je L12
    cmp edi, -1
    je L12
L11:
    inc ecx
    add esi, 4
    cmp ecx, 6
    jb L9
L12:
    cmp ecx, 6
    je L20
    mov esi, dword ptr [eax + 8]
    mov edi, dword ptr [esi]
    mov esi, dword ptr [ebp + 12]
    shl ecx, 2
    mov dword ptr [ecx + esi], edi
    mov edi, dword ptr [ebp + 8]
    mov dword ptr [ecx + edi], eax
    and dword ptr [edx], 0
L13:
    mov eax, dword ptr [ebp + 24]
    inc eax
    cmp eax, dword ptr [ebp + 20]
    mov dword ptr [ebp + 24], eax
    jb L8
    jmp L0
L14:
    cmp dword ptr [ebp + 24], 2
    jne L0
    xor eax, eax
    cmp dword ptr [ebp + 20], edi
    mov dword ptr [ebp + 24], eax
    jbe L0
    mov esi, dword ptr [ebp + 8]
L15:
    mov ecx, dword ptr [ebp + 16]
    lea edx, [ecx + eax*4]
    mov ecx, dword ptr [edx]
    cmp ecx, edi
    je L19
    mov eax, dword ptr [ecx]
    and eax, 0FFF00000h
    cmp eax, 011000000h
    je L16
    cmp eax, 072100000h
    jne L19
L16:
    xor eax, eax
L17:
    cmp dword ptr [esi + eax*4], edi
    je L18
    inc eax
    cmp eax, 6
    jb L17
L18:
    cmp eax, 6
    je L20
    mov edi, dword ptr [ecx + 8]
    mov edi, dword ptr [edi]
    mov ebx, dword ptr [ebp + 12]
    shl eax, 2
    mov dword ptr [eax + ebx], edi
    xor edi, edi
    mov dword ptr [eax + esi], ecx
    mov dword ptr [edx], edi
L19:
    mov eax, dword ptr [ebp + 24]
    inc eax
    cmp eax, dword ptr [ebp + 20]
    mov dword ptr [ebp + 24], eax
    jb L15
    jmp L0
L20:
    xor eax, eax
    jmp L1
FUN_100aba21 ENDP
END
