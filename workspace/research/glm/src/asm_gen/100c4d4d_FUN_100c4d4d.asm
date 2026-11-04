; FUN_100c4d4d @ 0x100c4d4d — auto-synthesized
    sub_10067cb5 PROTO C
.CODE
FUN_100c4d4d PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0x20
    mov eax, dword ptr [ebp + 0xc]
    cmp eax, -1
    push esi
    mov esi, dword ptr [ebp + 0x1c]
    jne L0
    mov eax, dword ptr [esi + 0x100]
    test eax, eax
    je L1
    mov ecx, dword ptr [eax + 0x3c]
    test ecx, ecx
    je L1
    cmp dword ptr [ecx + 4], 0xd
    jne L1
    mov eax, ecx
    mov ecx, dword ptr [eax + 0x40]
    mov eax, dword ptr [eax + 0x44]
    cmp eax, -1
    mov dword ptr [ebp + 8], ecx
    jne L0
    xor eax, eax
    mov ecx, dword ptr [ebp + 8]
    mov dword ptr [ebp - 0xc], eax
    mov eax, dword ptr [ebp + 0x10]
    and eax, 0xffff
    dec eax
    dec eax
    mov dword ptr [ebp - 0x10], ecx
    je L2
    sub eax, 4
    jne L3
    push dword ptr [ebp + 0x18]
    mov eax, dword ptr [ebp + 0x14]
    push 0x10193358
    add eax, 0x1388
    push eax
    lea eax, [ebp - 0x20]
    push eax
    push dword ptr [esi + 0xc4]
    call sub_10067cb5
    add esp, 0x14
    mov dword ptr [esi + 0xd4], 1
    xor eax, eax
    pop esi
    leave
    ret 0x18
FUN_100c4d4d ENDP
END