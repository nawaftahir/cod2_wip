; FUN_1001c2f0 @ 0x1001c2f0 — auto-synthesized
    sub_10061cd9 PROTO C
    sub_10061d28 PROTO C
.CODE
FUN_1001c2f0 PROC
    mov eax, dword ptr [esp + 0xc]
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 0x18]
    push esi
    xor esi, esi
    test eax, eax
    jle L0
    mov ax, word ptr [ebp + esi*8]
    cmp ax, 2
    jne L1
    movzx edx, word ptr [edi + 0x36]
    xor ecx, ecx
    test edx, edx
    jle L2
    mov ebx, dword ptr [ebp + esi*8 + 4]
    mov eax, dword ptr [edi + 0x40]
    cmp dword ptr [eax], ebx
    je L3
    inc ecx
    add eax, 0x14
    cmp ecx, edx
    jl L4
    mov eax, dword ptr [ebp + esi*8 + 4]
    mov ecx, dword ptr [esp + 0x10]
    mov edx, dword ptr [esp + 0x14]
    push eax
    mov eax, dword ptr [edi]
    push ecx
    push edx
    push eax
    push 0x10194a00
    call sub_10061cd9
    add esp, 0x14
    pop esi
    pop ebp
    xor al, al
    pop ebx
    ret
    cmp ax, 4
    jne L3
    movzx edx, word ptr [edi + 0x34]
    xor ecx, ecx
    test edx, edx
    jle L5
    mov ebx, dword ptr [ebp + esi*8 + 4]
    mov eax, dword ptr [edi + 0x3c]
    lea esp, [esp]
    cmp dword ptr [eax], ebx
    je L3
    inc ecx
    add eax, 0xc
    cmp ecx, edx
    jl L6
    mov ecx, dword ptr [ebp + esi*8 + 4]
    mov edx, dword ptr [esp + 0x10]
    mov eax, dword ptr [esp + 0x14]
    push ecx
    mov ecx, dword ptr [edi]
    push edx
    push eax
    push ecx
    push 0x101949a0
    call sub_10061d28
    add esp, 0x14
    pop esi
    pop ebp
    xor al, al
    pop ebx
    ret
    mov eax, dword ptr [esp + 0x18]
    inc esi
    cmp esi, eax
    jl L7
    pop esi
    pop ebp
    mov al, 1
    pop ebx
    ret
FUN_1001c2f0 ENDP
END