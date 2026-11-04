; FUN_10099a41 @ 0x10099a41 — auto-synthesized
    sub_100995de PROTO C
.CODE
FUN_10099a41 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, dword ptr [ebp + 8]
    push edi
    mov edi, ecx
    test esi, esi
    je L0
    mov eax, dword ptr [esi + 4]
    cmp eax, 1
    jne L1
    push dword ptr [esi + 8]
    mov ecx, edi
    call L2
    test eax, eax
    jne L3
    mov esi, dword ptr [esi + 0xc]
    jmp L4
    sub eax, 6
    je L5
    dec eax
    dec eax
    je L6
    dec eax
    je L7
    dec eax
    dec eax
    jne L8
    mov esi, dword ptr [esi + 0x20]
    jmp L4
    mov esi, dword ptr [esi + 0x10]
    jmp L4
    mov esi, dword ptr [esi + 0x18]
    jmp L4
    xor eax, eax
    inc eax
    jmp L9
    push 0x1010f7b0
    push 0
    push 0
    push edi
    call sub_100995de
    add esp, 0x10
    xor eax, eax
    jmp L9
    mov eax, dword ptr [esi + 0x20]
    and eax, 0x200
    pop edi
    pop esi
    pop ebp
    ret 4
FUN_10099a41 ENDP
END