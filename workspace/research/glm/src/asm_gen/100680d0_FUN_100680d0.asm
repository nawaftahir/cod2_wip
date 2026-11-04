; FUN_100680d0 @ 0x100680d0 — auto-synthesized
    sub_10067cd3 PROTO C
    sub_100f865a PROTO C
    sub_100f866d PROTO C
.CODE
FUN_100680d0 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    push ebx
    push edi
    mov ebx, ecx
    lea edi, [eax + 2]
    cmp edi, dword ptr [ebx + 4]
    jae L0
    cmp byte ptr [eax], 0x30
    jne L0
    cmp byte ptr [eax + 1], 0x78
    jne L0
    movsx eax, byte ptr [edi]
    push eax
    call sub_100f865a
    test eax, eax
    pop ecx
    je L0
    push esi
    xor esi, esi
    jmp L1
    movsx eax, byte ptr [edi]
    push eax
    call sub_100f866d
    test eax, eax
    pop ecx
    je L2
    mov al, byte ptr [edi]
    shl esi, 4
    cmp al, 0x61
    jl L3
    movsx eax, al
    lea esi, [esi + eax - 0x57]
    jmp L4
    cmp al, 0x41
    movsx eax, al
    jl L5
    lea esi, [esi + eax - 0x37]
    jmp L4
    lea esi, [esi + eax - 0x30]
    inc edi
    cmp edi, dword ptr [ebx + 4]
    jb L6
    mov eax, dword ptr [ebp + 0xc]
    test eax, eax
    je L7
    mov dword ptr [eax], esi
    sub edi, dword ptr [ebp + 8]
    pop esi
    cmp edi, 0xa
    jle L8
    push 0x1010cb18
    push 0x3ea
    lea eax, [ebx + 8]
    push eax
    push dword ptr [ebx + 0x30]
    call sub_10067cd3
    add esp, 0x10
    mov eax, edi
    jmp L9
    xor eax, eax
    pop edi
    pop ebx
    pop ebp
    ret 8
FUN_100680d0 ENDP
END