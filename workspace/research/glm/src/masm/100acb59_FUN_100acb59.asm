.686
.MODEL FLAT, C
.CODE
FUN_100acb59 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 44
    mov eax, dword ptr [ebp + 32]
    push ebx
    xor ebx, ebx
    mov dword ptr [eax], ebx
    mov eax, dword ptr [ebp + 36]
    mov dword ptr [eax], ebx
    mov eax, dword ptr [ebp + 12]
    cmp eax, dword ptr [ebp + 16]
    mov dword ptr [ebp - 20], ecx
    mov dword ptr [ebp - 12], ebx
    mov dword ptr [ebp - 36], eax
    jae L15
    push esi
    push edi
    xor edi, edi
    inc edi
L0:
    mov ecx, dword ptr [ebp + 8]
    mov esi, dword ptr [ecx + eax*4]
    cmp esi, ebx
    je L14
    mov eax, dword ptr [esi]
    cmp eax, ebx
    je L14
    and eax, 0000FFFFFh
    mov ecx, eax
    mov eax, dword ptr [esi + 4]
    xor edx, edx
    div ecx
    mov dword ptr [ebp - 44], ecx
    mov dword ptr [ebp - 16], ebx
    mov dword ptr [ebp - 40], eax
    mov eax, dword ptr [ebp + 24]
    cmp eax, ebx
    jbe L14
    mov edx, dword ptr [ebp + 20]
    mov dword ptr [ebp - 8], edx
    mov dword ptr [ebp - 32], eax
L1:
    mov eax, dword ptr [ebp - 40]
    cmp eax, ebx
    jbe L13
    mov dword ptr [ebp - 4], ebx
    mov dword ptr [ebp - 28], eax
L2:
    cmp ecx, ebx
    mov dword ptr [ebp + 12], ebx
    jbe L11
    mov eax, dword ptr [ebp - 4]
    mov dword ptr [ebp - 24], ecx
L3:
    mov ecx, dword ptr [esi + 8]
    mov edx, dword ptr [eax + ecx]
    mov ecx, dword ptr [ebp - 20]
    mov ebx, dword ptr [ecx + 20]
    mov ecx, dword ptr [ebp - 8]
    mov edi, dword ptr [ecx]
    mov ecx, dword ptr [ebx + edx*4]
    cmp dword ptr [ecx + 56], edi
    je L4
    cmp edx, edi
    jne L9
L4:
    mov ecx, dword ptr [ebp - 16]
    inc dword ptr [ebp + 12]
    inc ecx
    cmp ecx, dword ptr [ebp - 12]
    mov dword ptr [ebp - 16], ecx
    jbe L5
    mov dword ptr [ebp - 12], ecx
L5:
    xor edi, edi
    inc edi
    cmp dword ptr [esi + 12], edi
    jne L6
    mov ecx, dword ptr [esi + 16]
    mov ecx, dword ptr [ecx]
    mov ecx, dword ptr [ebx + ecx*4]
    cmp dword ptr [ecx + 16], 3
    jne L6
    mov ecx, dword ptr [ebp + 32]
    mov dword ptr [ecx], edi
L6:
    mov ecx, dword ptr [esi]
    and ecx, 0FFF00000h
    cmp ecx, 050000000h
    je L10
    xor edx, edx
    cmp dword ptr [esi + 12], edx
    jbe L10
L7:
    mov ecx, dword ptr [esi + 16]
    mov ebx, dword ptr [ebp - 20]
    mov ecx, dword ptr [ecx + edx*4]
    mov ebx, dword ptr [ebx + 20]
    mov ecx, dword ptr [ebx + ecx*4]
    cmp dword ptr [ecx + 16], 3
    jne L8
    mov ecx, dword ptr [ebp + 32]
    mov dword ptr [ecx], edi
L8:
    inc edx
    cmp edx, dword ptr [esi + 12]
    jb L7
    jmp L10
L9:
    xor edi, edi
    inc edi
L10:
    add eax, 4
    dec dword ptr [ebp - 24]
    jne L3
    mov ecx, dword ptr [ebp - 44]
    xor ebx, ebx
L11:
    cmp dword ptr [ebp + 12], ecx
    je L12
    cmp dword ptr [ebp + 12], ebx
    je L12
    mov eax, dword ptr [ebp + 36]
    mov dword ptr [eax], edi
L12:
    mov eax, ecx
    shl eax, 2
    add dword ptr [ebp - 4], eax
    dec dword ptr [ebp - 28]
    jne L2
L13:
    add dword ptr [ebp - 8], 4
    dec dword ptr [ebp - 32]
    jne L1
L14:
    mov eax, dword ptr [ebp - 36]
    inc eax
    cmp eax, dword ptr [ebp + 16]
    mov dword ptr [ebp - 36], eax
    jb L0
    pop edi
    pop esi
L15:
    mov eax, dword ptr [ebp + 28]
    mov ecx, dword ptr [ebp - 12]
    mov dword ptr [eax], ecx
    xor eax, eax
    pop ebx
    leave
    ret 32
FUN_100acb59 ENDP
END
