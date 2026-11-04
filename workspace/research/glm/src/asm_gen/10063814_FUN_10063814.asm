; FUN_10063814 @ 0x10063814 — auto-synthesized
.CODE
FUN_10063814 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push 0x2c
    pop ecx
    mov eax, 0x1010c438
    mov edx, dword ptr [eax - 0x10]
    sub eax, 0xc
    dec ecx
    cmp edx, dword ptr [ebp + 8]
    jne L0
    mov edx, dword ptr [eax]
    and edx, dword ptr [ebp + 0xc]
    cmp edx, dword ptr [ebp + 0xc]
    je L1
    cmp eax, 0x1010c228
    ja L2
    mov eax, 0x80004005
    pop ebp
    ret 0xc
    push edi
    mov edi, dword ptr [ebp + 0x10]
    test edi, edi
    je L3
    push esi
    lea esi, [ecx + ecx*2]
    lea esi, [esi*4 + 0x1010c220]
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    pop esi
    xor eax, eax
    pop edi
    jmp L4
FUN_10063814 ENDP
END