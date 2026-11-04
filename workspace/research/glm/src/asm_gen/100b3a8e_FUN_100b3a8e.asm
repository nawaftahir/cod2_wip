; FUN_100b3a8e @ 0x100b3a8e — auto-synthesized
    sub_1008b15e PROTO C
    sub_100c4d37 PROTO C
    sub_100c7b80 PROTO C
    sub_100c98d5 PROTO C
.CODE
FUN_100b3a8e PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, ecx
    cmp dword ptr [esi + 0x158], 0
    je L0
    xor eax, eax
    jmp L1
    push 0x200001f
    mov ecx, esi
    call sub_100c98d5
    test eax, eax
    jl L1
    push edi
    mov edi, dword ptr [ebp + 8]
    mov eax, dword ptr [edi + 0x3c]
    cmp eax, 0x200000
    jne L2
    push 0x90000000
    mov ecx, esi
    call sub_100c7b80
    test eax, eax
    jl L3
    mov ecx, dword ptr [edi + 0xc]
    mov eax, dword ptr [esi]
    push 0
    and ecx, 0x7ff
    or ecx, 0xa0000800
    push 0xf0000
    push ecx
    mov ecx, esi
    call dword ptr [eax + 0x64]
    test eax, eax
    jl L3
    mov ecx, esi
    call sub_100c4d37
    test eax, eax
    jl L3
    xor eax, eax
    jmp L3
    cmp eax, 0x400000
    jne L4
    push 0xa0000000
    jmp L5
    cmp eax, 0x800000
    jne L6
    push 0x98000000
    jmp L5
    push 0x10115c80
    push 0x12ce
    push 0
    push esi
    call sub_1008b15e
    add esp, 0x10
    mov eax, 0x80004005
    pop edi
    pop esi
    pop ebp
    ret 4
FUN_100b3a8e ENDP
END