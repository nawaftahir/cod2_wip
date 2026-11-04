; FUN_100182c0 @ 0x100182c0 — auto-synthesized
    sub_10018267 PROTO C
    sub_1001828c PROTO C
    sub_10060ca3 PROTO C
.CODE
FUN_100182c0 PROC
    push ebx
    mov ebx, dword ptr [esp + 0x10]
    push esi
    mov esi, dword ptr [esp + 0x20]
    push edi
    mov edi, dword ptr [esp + 0x20]
    push esi
    push edi
    push ebx
    call sub_10018267
    add esp, 0xc
    test al, al
    je L0
    pop edi
    pop esi
    xor eax, eax
    pop ebx
    ret 0x18
    push esi
    push edi
    push ebx
    push 0x101958d0
    call sub_10060ca3
    add esp, 8
    push eax
    call sub_1001828c
    add esp, 0xc
    neg al
    pop edi
    pop esi
    pop ebx
    sbb eax, eax
    inc eax
    ret 0x18
FUN_100182c0 ENDP
END