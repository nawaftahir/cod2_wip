; FUN_1008b13a @ 0x1008b13a — auto-synthesized
    sub_10067d77 PROTO C
    sub_100f61dc PROTO C
.CODE
FUN_1008b13a PROC
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
    lea ecx, [ebp - 0x100]
    push ecx
    push 0x10193358
    push dword ptr [ebp + 0x10]
    push eax
    mov eax, dword ptr [ebp + 8]
    push dword ptr [eax + 0xc4]
    call sub_10067d77
    add esp, 0x14
    xor eax, eax
    leave
    ret
FUN_1008b13a ENDP
END