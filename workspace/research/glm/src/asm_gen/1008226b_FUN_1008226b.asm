; FUN_1008226b @ 0x1008226b — auto-synthesized
.CODE
FUN_1008226b PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, dword ptr [ebp + 0xc]
    push edi
    push 4
    pop ecx
    mov edi, 0x10118028
    xor eax, eax
    repe cmpsd dword ptr [esi], dword ptr es:[edi]
    je L0
    mov esi, dword ptr [ebp + 0xc]
    push 4
    pop ecx
    mov edi, 0x1017c3c4
    xor eax, eax
    repe cmpsd dword ptr [esi], dword ptr es:[edi]
    jne L1
    mov eax, dword ptr [ebp + 8]
    mov ecx, dword ptr [ebp + 0x10]
    mov dword ptr [ecx], eax
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 4]
    xor eax, eax
    jmp L2
    mov eax, 0x80004002
    pop edi
    pop esi
    pop ebp
    ret 0xc
FUN_1008226b ENDP
END