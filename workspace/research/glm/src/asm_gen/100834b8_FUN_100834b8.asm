; FUN_100834b8 @ 0x100834b8 — auto-synthesized
    sub_100827eb PROTO C
    sub_1008283a PROTO C
.CODE
FUN_100834b8 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push edi
    mov edi, dword ptr [ebp + 8]
    push edi
    mov edx, ecx
    call sub_100827eb
    test eax, eax
    je L0
    push esi
    lea esi, [edx + 0x10]
    mov eax, dword ptr [esi]
    add edi, 0x10
    cmp eax, dword ptr [edi]
    jne L1
    push ebx
    push 4
    pop ecx
    xor ebx, ebx
    repe cmpsd dword ptr [esi], dword ptr es:[edi]
    pop ebx
    jne L2
    xor eax, eax
    inc eax
    jmp L3
    cmp eax, 4
    jne L1
    mov eax, dword ptr [ebp + 8]
    push dword ptr [eax + 0x18]
    push dword ptr [edx + 0x18]
    call sub_1008283a
    test eax, eax
    jne L4
    xor eax, eax
    pop esi
    pop edi
    pop ebp
    ret 4
FUN_100834b8 ENDP
END