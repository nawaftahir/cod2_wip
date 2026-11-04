; FUN_100afe7d @ 0x100afe7d — auto-synthesized
.CODE
FUN_100afe7d PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov edx, dword ptr [ebp + 8]
    mov eax, dword ptr [edx + 0x6c]
    movzx edx, byte ptr [edx + 0x6d]
    and eax, 0xff
    cmp eax, 1
    jne L0
    cmp edx, dword ptr [ecx + 0x28]
    jae L1
    mov eax, dword ptr [ebp + 0xc]
    mov dword ptr [eax], edx
    jmp L2
    cmp eax, 3
    jne L3
    cmp edx, dword ptr [ecx + 0x3c]
    jae L1
    add edx, 2
    jmp L4
    cmp eax, 5
    jne L1
    mov eax, dword ptr [ebp + 0xc]
    mov dword ptr [eax], 0xc
    xor eax, eax
    jmp L5
    mov eax, 0x80004005
    pop ebp
    ret 8
FUN_100afe7d ENDP
END