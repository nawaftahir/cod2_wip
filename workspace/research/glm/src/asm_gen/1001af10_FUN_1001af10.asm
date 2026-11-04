; FUN_1001af10 @ 0x1001af10 — auto-synthesized
    sub_1001adde PROTO C
    sub_1005fb07 PROTO C
    sub_1005fb38 PROTO C
    sub_1005fb7f PROTO C
.CODE
FUN_1001af10 PROC
    push ecx
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 0x18]
    mov ebx, eax
    push 1
    push 0x10195544
    mov ecx, ebx
    call sub_1005fb07
    add esp, 8
    test eax, eax
    jne L0
    pop ebp
    xor al, al
    pop ebx
    pop ecx
    ret
    mov eax, dword ptr [esp + 0x14]
    push esi
    push edi
    xor edi, edi
    test eax, eax
    jle L1
    mov esi, 0xa
    cmp esi, 0xa
    je L2
    push 1
    push 0x1019581c
    mov ecx, ebx
    call sub_1005fb38
    add esp, 8
    test eax, eax
    je L3
    mov ecx, dword ptr [esp + 0x18]
    lea eax, [esp + 0x10]
    push eax
    push ecx
    call sub_1001adde
    add esp, 8
    test al, al
    je L3
    mov edx, dword ptr [esp + 0x10]
    mov eax, dword ptr [ebp]
    mov ecx, esi
    shl edx, cl
    add esi, 5
    or eax, edx
    mov dword ptr [ebp], eax
    mov eax, dword ptr [esp + 0x1c]
    inc edi
    cmp edi, eax
    jl L4
    push 1
    push 0x10195540
    mov ecx, ebx
    call sub_1005fb7f
    add esp, 8
    pop edi
    pop esi
    test eax, eax
    pop ebp
    setne al
    pop ebx
    pop ecx
    ret
    pop edi
    pop esi
    pop ebp
    xor al, al
    pop ebx
    pop ecx
    ret
FUN_1001af10 ENDP
END