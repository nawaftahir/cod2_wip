; FUN_10018370 @ 0x10018370 — auto-synthesized
    sub_1005f38c PROTO C
    sub_1005fafe PROTO C
    sub_1005fb30 PROTO C
    sub_1005ff4c PROTO C
.CODE
FUN_10018370 PROC
    push 1
    push 0x101958cc
    mov ecx, esi
    call sub_1005fafe
    add esp, 8
    test eax, eax
    je L0
    mov ecx, esi
    call sub_1005ff4c
    cmp eax, edi
    je L1
    push eax
    push edi
    push 0x101958ac
    call sub_1005f38c
    add esp, 0xc
    xor al, al
    ret
    push 1
    push 0x101958a8
    mov ecx, esi
    call sub_1005fb30
    add esp, 8
    test eax, eax
    setne al
    ret
FUN_10018370 ENDP
END