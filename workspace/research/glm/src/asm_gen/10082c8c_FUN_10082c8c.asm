; FUN_10082c8c @ 0x10082c8c — auto-synthesized
    sub_100827ec PROTO C
    sub_1008283e PROTO C
    sub_1008284d PROTO C
    sub_1008285c PROTO C
.CODE
FUN_10082c8c PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    push edi
    mov esi, ecx
    call sub_100827ec
    test eax, eax
    je L0
    mov eax, dword ptr [esi + 0x10]
    cmp eax, dword ptr [edi + 0x10]
    jne L0
    mov eax, dword ptr [esi + 0x20]
    cmp eax, dword ptr [edi + 0x20]
    jne L0
    mov eax, dword ptr [esi + 0x24]
    cmp eax, dword ptr [edi + 0x24]
    jne L0
    mov eax, dword ptr [esi + 0x28]
    cmp eax, dword ptr [edi + 0x28]
    jne L0
    mov eax, dword ptr [esi + 0x2c]
    cmp eax, dword ptr [edi + 0x2c]
    jne L0
    push dword ptr [edi + 0x14]
    push dword ptr [esi + 0x14]
    call sub_1008283e
    test eax, eax
    je L0
    push dword ptr [edi + 0x18]
    push dword ptr [esi + 0x18]
    call sub_1008284d
    test eax, eax
    je L0
    push dword ptr [edi + 0x1c]
    push dword ptr [esi + 0x1c]
    call sub_1008285c
    test eax, eax
    je L0
    xor eax, eax
    inc eax
    jmp L1
    xor eax, eax
    pop edi
    pop esi
    pop ebp
    ret 4
FUN_10082c8c ENDP
END