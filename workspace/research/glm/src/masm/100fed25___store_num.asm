.686
.MODEL FLAT, C
.CODE
__store_num PROC
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    push esi
    mov esi, edx
    xor edx, edx
    cmp dword ptr [ebp + 8], edx
    mov dword ptr [ebp - 4], edx
    je L3
    cmp dword ptr [ecx], 1
    mov esi, dword ptr [edi]
    jbe L1
L0:
    push 10
    cdq
    pop ebx
    idiv ebx
    add dl, 48
    mov byte ptr [esi], dl
    inc esi
    dec dword ptr [ecx]
    test eax, eax
    mov edx, dword ptr [ecx]
    jle L1
    cmp edx, 1
    ja L0
L1:
    mov eax, dword ptr [edi]
    mov dword ptr [edi], esi
    dec esi
L2:
    mov dl, byte ptr [eax]
    mov cl, byte ptr [esi]
    mov byte ptr [esi], dl
    dec esi
    mov byte ptr [eax], cl
    inc eax
    cmp eax, esi
    jb L2
    jmp L7
L3:
    cmp esi, dword ptr [ecx]
    jae L6
    dec esi
    lea edx, [esi + 1]
    test edx, edx
    je L5
L4:
    push 10
    cdq
    pop ebx
    idiv ebx
    mov ebx, dword ptr [edi]
    add dl, 48
    inc dword ptr [ebp - 4]
    mov byte ptr [esi + ebx], dl
    dec esi
    cmp esi, -1
    jne L4
L5:
    mov eax, dword ptr [ebp - 4]
    add dword ptr [edi], eax
    sub dword ptr [ecx], eax
    jmp L7
L6:
    mov dword ptr [ecx], edx
L7:
    pop esi
    pop ebx
    leave
    ret
__store_num ENDP
END
