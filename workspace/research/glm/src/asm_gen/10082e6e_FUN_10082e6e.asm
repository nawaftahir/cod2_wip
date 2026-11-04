; FUN_10082e6e @ 0x10082e6e — auto-synthesized
    sub_100827e8 PROTO C
.CODE
FUN_10082e6e PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov edx, dword ptr [ebp + 8]
    push edx
    call sub_100827e8
    test eax, eax
    je L0
    mov eax, dword ptr [ecx + 0x10]
    cmp eax, dword ptr [edx + 0x10]
    jne L0
    mov eax, dword ptr [ecx + 0x14]
    cmp eax, dword ptr [edx + 0x14]
    jne L0
    mov eax, dword ptr [ecx + 0x18]
    cmp eax, dword ptr [edx + 0x18]
    jne L0
    mov eax, dword ptr [ecx + 0x1c]
    cmp eax, dword ptr [edx + 0x1c]
    jne L0
    mov eax, dword ptr [ecx + 0x20]
    cmp eax, dword ptr [edx + 0x20]
    jne L0
    xor eax, eax
    inc eax
    jmp L1
    xor eax, eax
    pop ebp
    ret 4
FUN_10082e6e ENDP
END