.686
.MODEL FLAT, C
.CODE
FUN_1006c582 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 32
    mov eax, dword ptr [ebp + 12]
    push ebx
    mov ebx, dword ptr [ebp + 16]
    mov edx, eax
    imul edx, ebx
    test edx, edx
    push edi
    mov dword ptr [ebp - 16], ecx
    mov dword ptr [ebp - 32], edx
    je L15
    cmp dword ptr [ebp + 8], 2
    jne L1
    test byte ptr [ebp + 21], 4
    jne L1
    mov dword ptr [ebp + 12], ebx
    mov dword ptr [ebp - 12], 1
    mov dword ptr [ebp + 16], eax
    mov ebx, eax
L0:
    mov eax, dword ptr [ecx + 8]
    mov ecx, dword ptr [ebp + 28]
    add ebx, 3
    shr ebx, 2
    mov edi, ebx
    imul edi, dword ptr [ebp + 12]
    cmp ecx, dword ptr [eax + 4]
    mov dword ptr [ebp - 28], edi
    jae L2
    mov eax, dword ptr [eax + 16]
    mov eax, dword ptr [eax + ecx*4]
    jmp L3
L1:
    and dword ptr [ebp - 12], 0
    jmp L0
L2:
    xor eax, eax
L3:
    test eax, eax
    jne L4
    mov eax, 080004005h
    jmp L17
L4:
    test byte ptr [eax + 4], 64
    push esi
    mov esi, dword ptr [eax + 16]
    lea edx, [esi + edi]
    mov dword ptr [ebp - 20], esi
    mov dword ptr [eax + 16], edx
    je L5
    mov dword ptr [eax + 8], edx
L5:
    mov eax, dword ptr [ebp + 12]
    test eax, eax
    jbe L14
    mov edx, dword ptr [ebp + 24]
    and dword ptr [ebp - 8], 0
    and dword ptr [ebp - 4], 0
    mov dword ptr [ebp + 20], edx
    mov dword ptr [ebp - 24], eax
L6:
    xor edi, edi
    cmp dword ptr [ebp + 16], edi
    jbe L13
    mov eax, dword ptr [ebp + 20]
    mov dword ptr [ebp + 8], eax
L7:
    cmp dword ptr [ebp - 12], 0
    je L8
    mov eax, dword ptr [ebp + 8]
    mov eax, dword ptr [eax]
    jmp L9
L8:
    mov eax, dword ptr [ebp - 4]
    mov edx, dword ptr [ebp + 24]
    add eax, edi
    mov eax, dword ptr [edx + eax*4]
L9:
    mov edx, dword ptr [ebp - 16]
    mov edx, dword ptr [edx + 8]
    cmp eax, dword ptr [edx + 8]
    jae L10
    mov edx, dword ptr [edx + 20]
    mov eax, dword ptr [edx + eax*4]
    jmp L11
L10:
    xor eax, eax
L11:
    test eax, eax
    je L12
    mov dword ptr [eax + 4], ecx
    mov ecx, edi
    shr ecx, 2
    add ecx, dword ptr [ebp - 8]
    lea edx, [ecx + esi]
    mov ecx, dword ptr [ebp + 36]
    mov dword ptr [eax + 104], ecx
    mov ecx, dword ptr [ebp + 32]
    mov esi, edi
    and esi, 3
    mov dword ptr [eax + 12], edx
    sub edx, dword ptr [ebp - 20]
    mov dword ptr [eax + 16], esi
    mov ecx, dword ptr [ecx]
    lea ecx, [ecx + edx*4]
    add ecx, esi
    mov esi, dword ptr [ebp - 20]
    mov dword ptr [eax + 112], ecx
    mov ecx, dword ptr [ebp + 28]
L12:
    mov eax, dword ptr [ebp + 12]
    shl eax, 2
    add dword ptr [ebp + 8], eax
    inc edi
    cmp edi, dword ptr [ebp + 16]
    jb L7
L13:
    mov eax, dword ptr [ebp + 16]
    add dword ptr [ebp + 20], 4
    add dword ptr [ebp - 4], eax
    add dword ptr [ebp - 8], ebx
    dec dword ptr [ebp - 24]
    jne L6
    mov edi, dword ptr [ebp - 28]
L14:
    mov eax, dword ptr [ebp + 32]
    mov edx, dword ptr [ebp - 32]
    mov ecx, edi
    shl ecx, 2
    add dword ptr [eax], ecx
    pop esi
L15:
    mov eax, dword ptr [ebp + 40]
    test eax, eax
    je L16
    mov dword ptr [eax], edx
L16:
    xor eax, eax
L17:
    pop edi
    pop ebx
    leave
    ret 36
FUN_1006c582 ENDP
END
