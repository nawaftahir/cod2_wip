; FUN_100b5efd @ 0x100b5efd — auto-synthesized
.CODE
FUN_100b5efd PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    push dword ptr [edi + 0x6c]
    mov esi, ecx
    mov eax, dword ptr [esi]
    call dword ptr [eax + 0x54]
    push dword ptr [edi + 0x6c]
    mov ebx, eax
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x58]
    mov ecx, dword ptr [ebp + 0xc]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [ebp + 0x14]
    xor edi, edi
    cmp eax, edi
    je L0
    mov dword ptr [eax], edi
    xor edx, edx
    inc edx
    cmp ebx, edx
    jne L1
    cmp dword ptr [ecx], edi
    jne L2
    mov eax, dword ptr [ebp + 0x10]
    mov dword ptr [eax], 4
    mov dword ptr [ecx], edi
    jmp L3
    push 5
    pop esi
    cmp ebx, esi
    jne L4
    cmp dword ptr [ecx], edi
    jne L2
    mov esi, dword ptr [ebp + 0x10]
    mov dword ptr [esi], 4
    mov dword ptr [ecx], 2
    cmp eax, edi
    je L3
    mov dword ptr [eax], edx
    jmp L3
    cmp ebx, 0xc
    jne L5
    cmp dword ptr [ecx], edi
    jne L2
    mov esi, dword ptr [ebp + 0x10]
    mov dword ptr [esi], 4
    mov dword ptr [ecx], edx
    jmp L6
    cmp ebx, 0xb
    jne L7
    cmp dword ptr [ecx], 2
    jae L2
    mov eax, dword ptr [ebp + 0x10]
    mov dword ptr [eax], esi
    jmp L3
    push 6
    pop eax
    cmp ebx, eax
    jne L8
    cmp dword ptr [ecx], 8
    jae L2
    mov ecx, dword ptr [ebp + 0x10]
    mov dword ptr [ecx], eax
    jmp L3
    cmp ebx, 0xffff
    jne L2
    mov eax, dword ptr [ebp + 0x10]
    mov dword ptr [eax], edi
    xor eax, eax
    jmp L9
    mov eax, 0x80004005
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 0x10
FUN_100b5efd ENDP
END