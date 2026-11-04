; FUN_1008b0b5 @ 0x1008b0b5 — auto-synthesized
    sub_10067cb1 PROTO C
    sub_100f61dc PROTO C
.CODE
FUN_1008b0b5 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0x100
    lea eax, [ebp + 0x18]
    push eax
    push dword ptr [ebp + 0x14]
    lea eax, [ebp - 0x100]
    push 0x100
    push eax
    call sub_100f61dc
    mov ecx, dword ptr [ebp + 0xc]
    xor eax, eax
    add esp, 0x10
    cmp ecx, eax
    mov byte ptr [ebp - 1], al
    je L0
    mov edx, dword ptr [ecx + 4]
    cmp edx, 3
    je L1
    cmp edx, 6
    je L2
    cmp edx, 0xd
    jne L0
    lea eax, [ecx + 0x30]
    jmp L0
    mov eax, dword ptr [ecx + 0x14]
    add eax, 0x10
    jmp L0
    lea eax, [ecx + 0x10]
    push esi
    mov esi, dword ptr [ebp + 8]
    lea ecx, [ebp - 0x100]
    push ecx
    push 0x10193358
    push dword ptr [ebp + 0x10]
    push eax
    push dword ptr [esi + 0xc4]
    call sub_10067cb1
    add esp, 0x14
    mov dword ptr [esi + 0xd4], 1
    xor eax, eax
    pop esi
    leave
    ret
FUN_1008b0b5 ENDP
END