; R_NormalizedTextScale @ 0x1000bf60 — auto-synthesized
    EXTRN fp_101d4aec:DWORD
    sub_1000bce9 PROTO C
.CODE
R_NormalizedTextScale PROC
    push ecx
    mov eax, dword ptr [esp + 0xc]
    push ebp
    push esi
    xor ebp, ebp
    xor esi, esi
    cmp eax, ebp
    jg L0
    mov dword ptr [esp + 0x14], 0x7fffffff
    mov eax, dword ptr [esp + 0x10]
    cmp byte ptr [eax], 0
    mov dword ptr [esp + 8], ebp
    je L1
    push ebx
    push edi
    mov ecx, dword ptr [esp + 0x10]
    cmp ecx, dword ptr [esp + 0x1c]
    jge L2
    lea edx, [esp + 0x18]
    push 0
    push edx
    call dword ptr [fp_101d4aec]
    mov ebx, dword ptr [esp + 0x20]
    add esp, 8
    cmp eax, 0xa
    jne L3
    xor esi, esi
    jmp L4
    cmp eax, 0x5e
    jne L5
    test ebx, ebx
    je L5
    mov cl, byte ptr [ebx]
    cmp cl, al
    je L5
    cmp cl, 0x30
    jl L5
    cmp cl, 0x39
    jg L5
    inc ebx
    mov dword ptr [esp + 0x18], ebx
    jmp L4
    mov ecx, dword ptr [esp + 0x20]
    push ecx
    mov edi, eax
    call sub_1000bce9
    movzx edx, byte ptr [eax + 4]
    add esi, edx
    add esp, 4
    cmp ebp, esi
    jge L6
    mov ebp, esi
    inc dword ptr [esp + 0x10]
    cmp byte ptr [ebx], 0
    jne L7
    pop edi
    pop ebx
    pop esi
    mov eax, ebp
    pop ebp
    pop ecx
    ret
R_NormalizedTextScale ENDP
END