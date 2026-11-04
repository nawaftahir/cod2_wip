; FUN_100603e0 @ 0x100603e0 — auto-synthesized
    sub_10060c73 PROTO C
    sub_100f5e36 PROTO C
.CODE
FUN_100603e0 PROC
    sub esp, 0x40
    push edi
    mov edi, eax
    lea edx, [eax + 1]
    lea esp, [esp]
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L0
    sub eax, edx
    mov cl, byte ptr [eax + edi - 1]
    cmp cl, 0x2f
    lea eax, [eax + edi - 1]
    je L1
    cmp eax, edi
    je L1
    cmp cl, 0x2e
    je L2
    mov cl, byte ptr [eax - 1]
    dec eax
    cmp cl, 0x2f
    jne L3
    push esi
    push 0x3f
    lea eax, [esp + 0xc]
    push edi
    push eax
    call sub_100f5e36
    mov ecx, dword ptr [esp + 0x5c]
    mov esi, dword ptr [esp + 0x58]
    push ecx
    lea edx, [esp + 0x18]
    push edx
    push 0x10194930
    mov byte ptr [esp + 0x5f], 0
    call sub_10060c73
    add esp, 0x18
    pop esi
    pop edi
    add esp, 0x40
    ret
FUN_100603e0 ENDP
END