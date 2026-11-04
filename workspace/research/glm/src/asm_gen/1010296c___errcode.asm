; __errcode @ 0x1010296c — auto-synthesized
.CODE
__errcode PROC
    mov al, byte ptr [esp + 4]
    test al, 0x20
    je L0
    push 5
    jmp L1
    test al, 8
    je L2
    xor eax, eax
    inc eax
    ret
    test al, 4
    je L3
    push 2
    jmp L1
    test al, 1
    je L4
    push 3
    pop eax
    ret
    movzx eax, al
    and eax, 2
    shl eax, 1
    ret
__errcode ENDP
END