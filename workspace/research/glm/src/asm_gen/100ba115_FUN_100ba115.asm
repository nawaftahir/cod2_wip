; FUN_100ba115 @ 0x100ba115 — auto-synthesized
    sub_1008b151 PROTO C
    sub_100f75dd PROTO C
    sub_100f8705 PROTO C
    sub_100f8753 PROTO C
.CODE
FUN_100ba115 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    push esi
    mov esi, dword ptr [ebp + 8]
    push edi
    mov edi, dword ptr [ebp + 0xc]
    and dword ptr [edi], 0
    mov ebx, ecx
    jmp L0
    movsx eax, al
    jmp L1
    inc esi
    movsx eax, byte ptr [esi]
    push eax
    call sub_100f8705
    test eax, eax
    pop ecx
    je L2
    movsx eax, byte ptr [esi]
    push eax
    call sub_100f75dd
    pop ecx
    movsx ecx, byte ptr [ebp + 0x10]
    cmp eax, ecx
    jne L3
    xor edx, edx
    cmp dword ptr [edi], edx
    je L4
    mov ecx, dword ptr [ebx + 8]
    cmp ecx, edx
    jbe L5
    mov eax, dword ptr [ebx + 0x14]
    mov esi, ecx
    mov ecx, dword ptr [eax]
    mov edi, dword ptr [ecx + 4]
    cmp edi, dword ptr [ebp + 0x14]
    jne L6
    mov edx, ecx
    add eax, 4
    dec esi
    jne L7
    test edx, edx
    je L5
    mov eax, dword ptr [edx + 0x60]
    jmp L8
    inc esi
    movsx eax, byte ptr [esi]
    push eax
    call sub_100f8753
    test eax, eax
    pop ecx
    jne L9
    mov al, byte ptr [esi]
    test al, al
    jne L10
    mov eax, 0x80004005
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 0x10
    xor eax, eax
    push 0x10119d48
    push 0x119d
    push eax
    push ebx
    call sub_1008b151
    add esp, 0x10
    jmp L11
    mov dword ptr [edi], esi
    xor eax, eax
    jmp L12
FUN_100ba115 ENDP
END