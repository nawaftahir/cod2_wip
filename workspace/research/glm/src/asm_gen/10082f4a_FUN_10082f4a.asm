; FUN_10082f4a @ 0x10082f4a — auto-synthesized
    sub_100827ec PROTO C
    sub_1008284a PROTO C
    sub_10082859 PROTO C
    sub_10082868 PROTO C
    sub_10082877 PROTO C
    sub_10082886 PROTO C
    sub_10082895 PROTO C
    sub_100828a4 PROTO C
.CODE
FUN_10082f4a PROC
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
    mov eax, dword ptr [esi + 0x14]
    cmp eax, dword ptr [edi + 0x14]
    jne L0
    mov eax, dword ptr [esi + 0x18]
    cmp eax, dword ptr [edi + 0x18]
    jne L0
    mov eax, dword ptr [esi + 0x38]
    cmp eax, dword ptr [edi + 0x38]
    jne L0
    mov eax, dword ptr [esi + 0x3c]
    cmp eax, dword ptr [edi + 0x3c]
    jne L0
    push dword ptr [edi + 0x1c]
    push dword ptr [esi + 0x1c]
    call sub_1008284a
    test eax, eax
    je L0
    push dword ptr [edi + 0x20]
    push dword ptr [esi + 0x20]
    call sub_10082859
    test eax, eax
    je L0
    push dword ptr [edi + 0x24]
    push dword ptr [esi + 0x24]
    call sub_10082868
    test eax, eax
    je L0
    push dword ptr [edi + 0x28]
    push dword ptr [esi + 0x28]
    call sub_10082877
    test eax, eax
    je L0
    push dword ptr [edi + 0x2c]
    push dword ptr [esi + 0x2c]
    call sub_10082886
    test eax, eax
    je L0
    push dword ptr [edi + 0x30]
    push dword ptr [esi + 0x30]
    call sub_10082895
    test eax, eax
    je L0
    push dword ptr [edi + 0x34]
    push dword ptr [esi + 0x34]
    call sub_100828a4
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
FUN_10082f4a ENDP
END