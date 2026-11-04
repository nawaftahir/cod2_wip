; FUN_100183c0 @ 0x100183c0 — auto-synthesized
    sub_1005f39d PROTO C
    sub_1005fafa PROTO C
    sub_1005fb0f PROTO C
    sub_1005fb41 PROTO C
    sub_1005ff5d PROTO C
.CODE
FUN_100183c0 PROC
    push 1
    push eax
    mov ecx, esi
    call sub_1005fafa
    add esp, 8
    test eax, eax
    je L0
    push 1
    push 0x101958cc
    mov ecx, esi
    call sub_1005fb0f
    add esp, 8
    test eax, eax
    je L0
    mov ecx, esi
    call sub_1005ff5d
    cmp eax, edi
    je L1
    push eax
    push edi
    push 0x101958ac
    call sub_1005f39d
    add esp, 0xc
    xor al, al
    ret
    push 1
    push 0x101958a8
    mov ecx, esi
    call sub_1005fb41
    add esp, 8
    test eax, eax
    setne al
    ret
FUN_100183c0 ENDP
END