; FUN_10081cbd @ 0x10081cbd — auto-synthesized
.CODE
FUN_10081cbd PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 0x10]
    and dword ptr [eax], 0
    push esi
    mov esi, dword ptr [ebp + 0xc]
    push edi
    push 4
    pop ecx
    mov edi, 0x1017c3c4
    xor edx, edx
    repe cmpsd dword ptr [esi], dword ptr es:[edi]
    je L0
    mov esi, dword ptr [ebp + 0xc]
    push 4
    pop ecx
    mov edi, 0x10118308
    xor edx, edx
    repe cmpsd dword ptr [esi], dword ptr es:[edi]
    jne L1
    mov ecx, dword ptr [ebp + 8]
    mov dword ptr [eax], ecx
    mov eax, dword ptr [ecx]
    push ecx
    call dword ptr [eax + 4]
    xor eax, eax
    jmp L2
    mov eax, 0x80004002
    pop edi
    pop esi
    pop ebp
    ret 0xc
FUN_10081cbd ENDP
END