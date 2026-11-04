; FUN_10065377 @ 0x10065377 — auto-synthesized
    sub_10065006 PROTO C
    sub_10067c98 PROTO C
    sub_10067cd9 PROTO C
.CODE
FUN_10065377 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    mov ebx, ecx
    push 9
    mov esi, 0x1010c804
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L0
    mov eax, dword ptr [ebx + 0x28c]
    jmp L1
    lea eax, [ebp - 4]
    push eax
    lea eax, [ebp + 8]
    push eax
    push dword ptr [ebp + 8]
    mov ecx, ebx
    call sub_10065006
    test eax, eax
    je L2
    cmp dword ptr [ebp + 8], 0
    je L3
    push 0x1010c7c0
    lea eax, [ebx + 0x278]
    push 0x5ed
    push eax
    add ebx, 0x18
    push ebx
    call sub_10067c98
    xor eax, eax
    add esp, 0x10
    inc eax
    jmp L1
    mov eax, dword ptr [ebp - 4]
    test eax, eax
    je L4
    cmp dword ptr [eax + 0xc], 0
    jne L4
    mov ecx, dword ptr [eax + 0x10]
    cmp ecx, 2
    jl L4
    cmp ecx, 4
    jg L4
    mov eax, dword ptr [eax + 0x18]
    jmp L1
    push 0x1010c78c
    lea eax, [ebx + 0x278]
    push 0x5ee
    push eax
    add ebx, 0x18
    push ebx
    call sub_10067cd9
    add esp, 0x10
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    leave
    ret 4
FUN_10065377 ENDP
END