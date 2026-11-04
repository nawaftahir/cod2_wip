; FUN_1006968b @ 0x1006968b — auto-synthesized
    sub_10067cda PROTO C
.CODE
FUN_1006968b PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push esi
    push edi
    mov edi, ecx
    mov ecx, dword ptr [ebp + 8]
    mov edx, dword ptr [ecx + 8]
    xor eax, eax
    test edx, edx
    je L0
    mov cl, byte ptr [edx]
    test cl, cl
    je L0
    mov esi, edx
    movsx ecx, cl
    cmp ecx, 0x77
    jg L1
    je L2
    sub ecx, 0x61
    je L2
    dec ecx
    je L3
    sub ecx, 5
    je L4
    sub ecx, 0xb
    jne L5
    xor ecx, ecx
    or eax, 0x10000
    cmp esi, edx
    je L6
    cmp ecx, dword ptr [ebp - 4]
    jbe L5
    inc esi
    mov dword ptr [ebp - 4], ecx
    mov cl, byte ptr [esi]
    test cl, cl
    jne L7
    jmp L8
    push 3
    pop ecx
    or eax, 0x80000
    jmp L9
    sub ecx, 0x78
    je L10
    dec ecx
    je L4
    dec ecx
    jne L5
    push 2
    pop ecx
    or eax, 0x40000
    jmp L9
    xor ecx, ecx
    inc ecx
    or eax, 0x20000
    jmp L9
    push edx
    push 0x1010ecfc
    push 0x7d3
    push dword ptr [ebp + 8]
    push dword ptr [edi]
    call sub_10067cda
    add esp, 0x14
    mov dword ptr [edi + 0x4c], 1
    xor eax, eax
    jmp L8
    mov eax, 0xf0000
    pop edi
    pop esi
    leave
    ret 4
FUN_1006968b ENDP
END