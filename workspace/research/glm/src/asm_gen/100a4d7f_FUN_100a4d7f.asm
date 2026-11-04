; FUN_100a4d7f @ 0x100a4d7f — auto-synthesized
.CODE
FUN_100a4d7f PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    push dword ptr [edi + 0x6c]
    mov esi, ecx
    mov eax, dword ptr [esi]
    call dword ptr [eax + 0x54]
    cmp eax, 0xffff
    jne L0
    mov eax, dword ptr [ebp + 0x10]
    and dword ptr [eax], 0
    push dword ptr [edi + 0x6c]
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x58]
    jmp L1
    push 0x11
    pop ecx
    cmp eax, ecx
    jne L2
    mov eax, dword ptr [ebp + 0x10]
    mov dword ptr [eax], ecx
    mov eax, dword ptr [ebp + 0xc]
    mov dword ptr [eax], 1
    jmp L3
    cmp eax, 0x12
    mov eax, dword ptr [ebp + 0x10]
    jne L4
    mov dword ptr [eax], ecx
    mov eax, dword ptr [ebp + 0xc]
    and dword ptr [eax], 0
    jmp L3
    mov dword ptr [eax], 1
    mov eax, dword ptr [edi + 0xc]
    mov ecx, dword ptr [ebp + 0xc]
    mov dword ptr [ecx], eax
    pop edi
    xor eax, eax
    pop esi
    pop ebp
    ret 0xc
FUN_100a4d7f ENDP
END