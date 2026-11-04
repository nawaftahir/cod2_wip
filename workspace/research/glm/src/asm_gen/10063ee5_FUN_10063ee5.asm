; FUN_10063ee5 @ 0x10063ee5 — auto-synthesized
    sub_10067c9d PROTO C
    sub_10067cf2 PROTO C
    sub_10067eda PROTO C
    sub_100f624b PROTO C
.CODE
FUN_10063ee5 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0x100
    push ebx
    mov ebx, dword ptr [ebp + 8]
    cmp dword ptr [ebx + 0x50], 0
    mov dword ptr [ebx + 0x44], 1
    je L0
    push esi
    mov esi, dword ptr [ebp + 0xc]
    push edi
    push 0xd
    pop ecx
    mov edi, 0x1010c5e8
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    pop edi
    pop esi
    jne L1
    cmp dword ptr [ebx + 0x4c], eax
    je L2
    lea eax, [ebx + 0x278]
    cmp dword ptr [eax], 9
    jne L2
    push dword ptr [ebx + 0x280]
    add ebx, 0x18
    push 0x1010c5c4
    push 0x5e0
    push eax
    push ebx
    call sub_10067c9d
    add esp, 0x14
    jmp L0
    lea eax, [ebx + 0x278]
    push eax
    push 0x5dc
    lea ecx, [ebx + 0x18]
    call sub_10067eda
    jmp L0
    lea eax, [ebp + 0x10]
    push eax
    push dword ptr [ebp + 0xc]
    lea eax, [ebp - 0x100]
    push 0x100
    push eax
    call sub_100f624b
    lea eax, [ebp - 0x100]
    push eax
    push 0x10193358
    lea eax, [ebx + 0x278]
    push 0
    push eax
    add ebx, 0x18
    push ebx
    mov byte ptr [ebp - 1], 0
    call sub_10067cf2
    add esp, 0x24
    pop ebx
    leave
    ret
FUN_10063ee5 ENDP
END