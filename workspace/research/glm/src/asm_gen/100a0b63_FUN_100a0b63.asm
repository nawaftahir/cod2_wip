; FUN_100a0b63 @ 0x100a0b63 — auto-synthesized
    sub_100650a4 PROTO C
    sub_10082dfc PROTO C
    sub_10099507 PROTO C
    sub_100a07f7 PROTO C
.CODE
FUN_100a0b63 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    lea eax, [ebp + 0xc]
    push eax
    push dword ptr [ebp + 0xc]
    mov esi, ecx
    call sub_100a07f7
    test eax, eax
    jge L0
    push 0x101152b4
    push 0xbf2
    push 0
    push esi
    call sub_10099507
    add esp, 0x10
    jmp L1
    push 0x18
    call sub_100650a4
    xor esi, esi
    cmp eax, esi
    je L2
    push dword ptr [ebp + 0xc]
    mov ecx, eax
    push esi
    call sub_10082dfc
    jmp L3
    xor eax, eax
    cmp eax, esi
    jne L4
    xor eax, eax
    jmp L5
    cmp dword ptr [ebp + 8], esi
    lea ecx, [ebp + 8]
    je L6
    mov edx, dword ptr [ecx]
    cmp dword ptr [edx + 4], 8
    jne L6
    lea ecx, [edx + 0x10]
    cmp dword ptr [ecx], esi
    jne L7
    mov edx, dword ptr [ecx]
    mov dword ptr [eax + 0x10], edx
    mov dword ptr [ecx], eax
    mov eax, dword ptr [ebp + 8]
    pop esi
    pop ebp
    ret 8
FUN_100a0b63 ENDP
END