.686
.MODEL FLAT, C
.CODE
FUN_100b97c4 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 64
    push ebx
    mov ebx, dword ptr [ebp + 8]
    xor eax, eax
    push esi
    mov esi, dword ptr [ebx]
    push edi
    lea edi, [ebp - 48]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    mov eax, esi
    and eax, 0FFF00000h
    cmp eax, 050000000h
    mov dword ptr [ebp - 32], esi
    je L15
    cmp eax, 070800000h
    je L15
    mov edx, dword ptr [ebp + 20]
    xor edi, edi
    xor eax, eax
    cmp dword ptr [ebp + 16], edi
    mov dword ptr [ebp - 16], eax
    jbe L8
    mov ecx, dword ptr [ecx + 20]
    mov dword ptr [ebp - 20], ecx
    mov ecx, dword ptr [ebp + 12]
    sub ecx, edx
    mov dword ptr [ebp - 4], edx
    mov dword ptr [ebp - 28], ecx
L0:
    mov edx, dword ptr [ebp - 4]
    mov edx, dword ptr [ecx + edx]
    mov dword ptr [ebp - 12], edi
    mov edi, dword ptr [ebp - 20]
    mov edx, dword ptr [edi + edx*4]
    xor edi, edi
    cmp dword ptr [ebp + 32], edi
    mov dword ptr [ebp - 8], edx
    je L1
    mov eax, dword ptr [ebp - 4]
    mov eax, dword ptr [eax]
    cmp eax, 4
    jae L7
L1:
    xor esi, esi
    cmp dword ptr [ebx + 12], edi
    jbe L12
    mov edi, dword ptr [ebx + 16]
    mov edx, eax
    lea eax, [ebp - 48]
    shl edx, 2
    sub edi, eax
    mov dword ptr [ebp - 24], edi
    jmp L3
L2:
    mov edi, dword ptr [ebp - 24]
L3:
    mov eax, dword ptr [ebp + 12]
    mov eax, dword ptr [edx + eax]
    lea ecx, [ebp + esi*4 - 48]
    cmp eax, dword ptr [edi + ecx]
    jne L4
    mov eax, dword ptr [ebp + 28]
    mov edi, dword ptr [ebp - 8]
    cmp dword ptr [edi + 60], eax
    je L5
L4:
    mov edi, dword ptr [ebp - 8]
    mov eax, dword ptr [ebx + 16]
    mov edi, dword ptr [edi + 56]
    cmp edi, dword ptr [eax + esi*4]
    mov ebx, dword ptr [ebp + 8]
    jne L6
    mov eax, dword ptr [ebp - 8]
    mov eax, dword ptr [eax + 60]
    cmp eax, dword ptr [ebp + 28]
    jne L6
L5:
    xor eax, eax
    inc eax
    mov dword ptr [ebp - 12], eax
    mov dword ptr [ebp + edx - 64], esi
    mov dword ptr [ecx], eax
L6:
    inc esi
    cmp esi, dword ptr [ebx + 12]
    jb L2
    xor edi, edi
    cmp dword ptr [ebp - 12], edi
    je L12
    mov ecx, dword ptr [ebp - 28]
    mov esi, dword ptr [ebp - 32]
L7:
    mov eax, dword ptr [ebp - 16]
    add dword ptr [ebp - 4], 4
    inc eax
    cmp eax, dword ptr [ebp + 16]
    mov dword ptr [ebp - 16], eax
    jb L0
L8:
    cmp dword ptr [ebp + 32], edi
    jne L10
    mov ecx, esi
    xor eax, eax
    and ecx, 0000FFFFFh
    jbe L10
L9:
    cmp dword ptr [ebp + eax*4 - 48], edi
    je L12
    inc eax
    cmp eax, ecx
    jb L9
L10:
    mov eax, dword ptr [ebp + 24]
    mov edx, dword ptr [ebp + 20]
    push 4
    sub edx, eax
    pop esi
L11:
    mov ecx, dword ptr [edx + eax]
    cmp ecx, 4
    jae L13
    mov ecx, dword ptr [ebp + ecx*4 - 64]
    mov dword ptr [eax], ecx
    jmp L14
L12:
    xor eax, eax
    inc eax
    jmp L23
L13:
    mov dword ptr [eax], 0000000FFh
L14:
    add eax, 4
    dec esi
    jne L11
    jmp L22
L15:
    mov edx, dword ptr [ebp + 24]
    and esi, 0000FFFFFh
    xor edi, edi
    xor eax, eax
L16:
    cmp eax, esi
    jae L17
    mov dword ptr [edx + eax*4], eax
    jmp L18
L17:
    mov dword ptr [edx + eax*4], 0000000FFh
L18:
    inc eax
    cmp eax, 4
    jb L16
    cmp dword ptr [ebp + 16], edi
    jbe L22
    mov eax, dword ptr [ebx + 16]
    mov edx, dword ptr [ecx + 20]
    mov esi, dword ptr [eax]
    mov ebx, dword ptr [ebp + 28]
L19:
    mov eax, dword ptr [ebp + 12]
    mov eax, dword ptr [eax + edi*4]
    cmp eax, esi
    mov ecx, dword ptr [edx + eax*4]
    jne L20
    cmp dword ptr [ecx + 60], ebx
    je L21
L20:
    cmp dword ptr [ecx + 56], esi
    jne L12
    cmp dword ptr [ecx + 60], ebx
    jne L12
L21:
    inc edi
    cmp edi, dword ptr [ebp + 16]
    jb L19
L22:
    xor eax, eax
L23:
    pop edi
    pop esi
    pop ebx
    leave
    ret 28
FUN_100b97c4 ENDP
END
