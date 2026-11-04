; FUN_100832a4 @ 0x100832a4 — auto-synthesized
    sub_100827ec PROTO C
    sub_10082845 PROTO C
    sub_10082854 PROTO C
    sub_10082863 PROTO C
    sub_100829da PROTO C
.CODE
FUN_100832a4 PROC
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
    mov eax, dword ptr [esi + 0x14]
    cmp eax, dword ptr [edi + 0x14]
    jne L0
    mov eax, dword ptr [esi + 0x18]
    cmp eax, dword ptr [edi + 0x18]
    jne L0
    mov eax, dword ptr [esi + 0x1c]
    cmp eax, dword ptr [edi + 0x1c]
    jne L0
    mov eax, dword ptr [esi + 0x28]
    cmp eax, dword ptr [edi + 0x28]
    jne L0
    lea eax, [edi + 0x30]
    lea ecx, [esi + 0x30]
    call sub_100829da
    test eax, eax
    je L0
    push dword ptr [edi + 0x10]
    push dword ptr [esi + 0x10]
    call sub_10082845
    test eax, eax
    je L0
    push dword ptr [edi + 0x20]
    push dword ptr [esi + 0x20]
    call sub_10082854
    test eax, eax
    je L0
    push dword ptr [edi + 0x24]
    push dword ptr [esi + 0x24]
    call sub_10082863
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
FUN_100832a4 ENDP
END