.686
.MODEL FLAT, C
.CODE
FUN_1008a70d PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 32
    cmp dword ptr [ebp + 20], 0
    mov edx, dword ptr [ebp + 16]
    push esi
    mov dword ptr [ebp - 8], ecx
    mov ecx, dword ptr [ebp + 12]
    push edi
    je L7
    xor eax, eax
    test edx, edx
    jbe L1
L0:
    mov dword ptr [ecx + eax*4], eax
    inc eax
    cmp eax, edx
    jb L0
L1:
    xor eax, eax
    test edx, edx
    jbe L7
    push ebx
L2:
    mov edi, dword ptr [ebp - 8]
    mov ebx, dword ptr [edi + 20]
    mov edi, dword ptr [ebp + 8]
    lea edx, [ecx + eax*4]
    mov esi, dword ptr [edx]
    mov edi, dword ptr [edi + esi*4]
    mov edi, dword ptr [ebx + edi*4]
    mov edi, dword ptr [edi + 16]
    mov dword ptr [ebp - 4], eax
    inc eax
    cmp eax, dword ptr [ebp + 16]
    mov dword ptr [ebp + 12], edi
    mov dword ptr [ebp - 16], eax
    mov dword ptr [ebp + 20], eax
    jae L6
L3:
    mov eax, dword ptr [ebp + 20]
    mov eax, dword ptr [ecx + eax*4]
    mov edi, dword ptr [ebp + 8]
    mov eax, dword ptr [edi + eax*4]
    mov eax, dword ptr [ebx + eax*4]
    mov eax, dword ptr [eax + 16]
    cmp eax, dword ptr [ebp + 12]
    mov dword ptr [ebp - 12], eax
    jb L4
    jne L5
    mov eax, dword ptr [ebp + 20]
    cmp eax, dword ptr [ebp - 4]
    jae L5
    mov eax, dword ptr [ebp - 12]
L4:
    mov edi, dword ptr [ebp + 20]
    mov dword ptr [ebp - 4], edi
    mov dword ptr [ebp + 12], eax
L5:
    inc dword ptr [ebp + 20]
    mov eax, dword ptr [ebp + 20]
    cmp eax, dword ptr [ebp + 16]
    jb L3
    mov eax, dword ptr [ebp - 16]
L6:
    mov edi, dword ptr [ebp - 4]
    lea ebx, [ecx + edi*4]
    mov edi, dword ptr [ebx]
    mov dword ptr [edx], edi
    mov edx, dword ptr [ebp + 16]
    cmp eax, edx
    mov dword ptr [ebx], esi
    jb L2
    pop ebx
L7:
    xor eax, eax
    test edx, edx
    jbe L9
    lea esi, [ebp - 32]
    sub ecx, esi
L8:
    mov edi, dword ptr [ebp + 8]
    lea esi, [ecx + eax*4]
    mov esi, dword ptr [ebp + esi - 32]
    mov esi, dword ptr [edi + esi*4]
    mov dword ptr [ebp + eax*4 - 32], esi
    inc eax
    cmp eax, edx
    jb L8
    test edx, edx
    jbe L9
    mov ecx, edx
    lea esi, [ebp - 32]
    rep movsd dword ptr es:[edi], dword ptr [esi]
L9:
    pop edi
    xor eax, eax
    pop esi
    leave
    ret 16
FUN_1008a70d ENDP
END
