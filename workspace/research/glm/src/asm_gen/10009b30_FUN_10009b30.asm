; FUN_10009b30 @ 0x10009b30 — auto-synthesized
    sub_10009957 PROTO C
    sub_10009a91 PROTO C
.CODE
FUN_10009b30 PROC
    sub esp, 0xc04
    push esi
    lea eax, [esp + 4]
    push eax
    mov eax, dword ptr [esp + 0xc10]
    push ecx
    push edx
    push eax
    lea esi, [esp + 0x18]
    mov eax, edi
    call sub_10009a91
    add esp, 0x10
    test eax, eax
    jne L0
    xor al, al
    pop esi
    add esp, 0xc04
    ret
    jle L1
    mov esi, dword ptr [esp + 4]
    push ebx
    mov ebx, eax
    jmp L2
    lea ecx, [ecx]
    push esi
    push edi
    call sub_10009957
    add esp, 8
    add esi, 0xc
    dec ebx
    jne L2
    pop ebx
    mov al, 1
    pop esi
FUN_10009b30 ENDP
END