; FUN_100999b4 @ 0x100999b4 — auto-synthesized
    sub_1008288c PROTO C
    sub_10099405 PROTO C
    sub_1009950d PROTO C
.CODE
FUN_100999b4 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    mov ebx, dword ptr [ebp + 8]
    push esi
    mov esi, dword ptr [ebp + 0xc]
    mov eax, dword ptr [esi + 0x10]
    test dword ptr [ebx + 0x10], eax
    push edi
    mov edi, ecx
    mov dword ptr [ebp - 4], edi
    je L0
    push 0x1011473c
    push 0xbe8
    lea eax, [edi + 0x20]
    push eax
    push edi
    call sub_1009950d
    add esp, 0x10
    cmp dword ptr [ebx + 0x14], 0
    je L1
    mov eax, dword ptr [esi + 0x14]
    test eax, eax
    je L1
    push 8
    pop ecx
    push 0x1010c5e8
    push dword ptr [ebp - 4]
    lea esi, [eax + 0x10]
    add edi, 0x20
    rep movsd dword ptr es:[edi], dword ptr [esi]
    call sub_10099405
    mov esi, dword ptr [ebp + 0xc]
    pop ecx
    pop ecx
    mov eax, dword ptr [esi + 0x10]
    or dword ptr [ebx + 0x10], eax
    cmp dword ptr [ebx + 0x14], 0
    jne L2
    mov esi, dword ptr [esi + 0x14]
    test esi, esi
    je L2
    push esi
    call sub_1008288c
    test eax, eax
    mov dword ptr [ebx + 0x14], eax
    jne L2
    mov eax, 0x8007000e
    jmp L3
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    leave
    ret 8
FUN_100999b4 ENDP
END