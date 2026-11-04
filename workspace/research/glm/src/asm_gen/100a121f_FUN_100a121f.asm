; FUN_100a121f @ 0x100a121f — auto-synthesized
    sub_1006508d PROTO C
    sub_10065105 PROTO C
    sub_1008291b PROTO C
    sub_10083183 PROTO C
    sub_1009953e PROTO C
    sub_100a0e93 PROTO C
.CODE
FUN_100a121f PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    push esi
    mov esi, ecx
    xor ebx, ebx
    cmp dword ptr [esi + 0x18], ebx
    jne L0
    xor eax, eax
    jmp L1
    push edi
    push 0x24
    call sub_1006508d
    cmp eax, ebx
    je L2
    mov ecx, eax
    call sub_10083183
    mov edi, eax
    jmp L3
    xor edi, edi
    cmp edi, ebx
    je L4
    xor ecx, ecx
    inc ecx
    cmp dword ptr [ebp + 8], ebx
    mov dword ptr [edi + 0x10], ecx
    mov eax, dword ptr [esi + 0x18]
    je L5
    cmp dword ptr [eax + 0x20], ebx
    jne L6
    mov eax, dword ptr [esi + 0x10]
    push dword ptr [eax + 0x14]
    push 0x10115390
    push 0xc07
    lea eax, [esi + 0x20]
    push eax
    push esi
    call sub_1009953e
    add esp, 0x14
    jmp L7
    cmp dword ptr [eax + 0x20], ebx
    je L7
    mov eax, dword ptr [esi + 0x10]
    push dword ptr [eax + 0x14]
    push 0x1010fb4c
    push 0xc08
    jmp L8
    push ecx
    push dword ptr [ebp + 8]
    mov ecx, esi
    push dword ptr [eax + 0x2c]
    push 0x15
    call sub_100a0e93
    mov dword ptr [edi + 0x14], eax
    push 0x14
    call sub_10065105
    cmp eax, ebx
    je L4
    push 0x10114734
    push ebx
    push edi
    mov ecx, eax
    call sub_1008291b
    jmp L9
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 4
FUN_100a121f ENDP
END