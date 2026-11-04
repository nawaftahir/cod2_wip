; FUN_1001f520 @ 0x1001f520 — auto-synthesized
    sub_1001d73b PROTO C
    sub_1001eecb PROTO C
    sub_1001f09c PROTO C
.CODE
FUN_1001f520 PROC
    sub esp, 0x50
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 0x5c]
    lea ebx, [esp + 0x17]
    and ebx, 0xfffffff0
    push edi
    lea ecx, [ebp + 0xc]
    mov eax, ebx
    call sub_1001d73b
    mov eax, dword ptr [ebp + 4]
    test eax, eax
    mov edi, dword ptr [ebp]
    mov dword ptr [esp + 0x60], 0
    jle L0
    push esi
    mov edi, edi
    mov ecx, dword ptr [edi]
    cmp ecx, 5
    mov eax, dword ptr [ebp + 8]
    je L1
    cmp ecx, 4
    jne L2
    mov edx, dword ptr [eax + 0x38]
    lea esi, [eax + 0x3c]
    push edx
    lea edx, [eax + 0x14]
    mov eax, dword ptr [edi + 4]
    movsx eax, word ptr [eax + 6]
    add eax, ebx
    lea ecx, [edi + 8]
    push eax
    call sub_1001eecb
    add esp, 8
    add edi, 0x38
    jmp L3
    mov eax, ebx
    mov edx, edi
    call sub_1001f09c
    add edi, 0x10
    mov eax, dword ptr [esp + 0x64]
    mov ecx, dword ptr [ebp + 4]
    inc eax
    cmp eax, ecx
    mov dword ptr [esp + 0x64], eax
    jl L4
    pop esi
    pop edi
    pop ebp
    pop ebx
    add esp, 0x50
    ret
FUN_1001f520 ENDP
END