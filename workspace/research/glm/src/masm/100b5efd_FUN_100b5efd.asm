.686
.MODEL FLAT, C
.CODE
FUN_100b5efd PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    push dword ptr [edi + 108]
    mov esi, ecx
    mov eax, dword ptr [esi]
    call dword ptr [eax + 0x54]
    push dword ptr [edi + 108]
    mov ebx, eax
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x58]
    mov ecx, dword ptr [ebp + 12]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [ebp + 20]
    xor edi, edi
    cmp eax, edi
    je L0
    mov dword ptr [eax], edi
L0:
    xor edx, edx
    inc edx
    cmp ebx, edx
    jne L1
    cmp dword ptr [ecx], edi
    jne L8
    mov eax, dword ptr [ebp + 16]
    mov dword ptr [eax], 4
    mov dword ptr [ecx], edi
    jmp L7
L1:
    push 5
    pop esi
    cmp ebx, esi
    jne L3
    cmp dword ptr [ecx], edi
    jne L8
    mov esi, dword ptr [ebp + 16]
    mov dword ptr [esi], 4
    mov dword ptr [ecx], 2
L2:
    cmp eax, edi
    je L7
    mov dword ptr [eax], edx
    jmp L7
L3:
    cmp ebx, 12
    jne L4
    cmp dword ptr [ecx], edi
    jne L8
    mov esi, dword ptr [ebp + 16]
    mov dword ptr [esi], 4
    mov dword ptr [ecx], edx
    jmp L2
L4:
    cmp ebx, 11
    jne L5
    cmp dword ptr [ecx], 2
    jae L8
    mov eax, dword ptr [ebp + 16]
    mov dword ptr [eax], esi
    jmp L7
L5:
    push 6
    pop eax
    cmp ebx, eax
    jne L6
    cmp dword ptr [ecx], 8
    jae L8
    mov ecx, dword ptr [ebp + 16]
    mov dword ptr [ecx], eax
    jmp L7
L6:
    cmp ebx, 00000FFFFh
    jne L8
    mov eax, dword ptr [ebp + 16]
    mov dword ptr [eax], edi
L7:
    xor eax, eax
    jmp L9
L8:
    mov eax, 080004005h
L9:
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 16
FUN_100b5efd ENDP
END
