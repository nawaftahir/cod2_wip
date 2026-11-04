; FUN_10010ab0 @ 0x10010ab0 — auto-synthesized
    sub_1000cc29 PROTO C
    sub_1000fa63 PROTO C
    sub_100108ad PROTO C
.CODE
FUN_10010ab0 PROC
    push ebx
    mov ebx, ecx
    cmp byte ptr [eax], 0x24
    jne L0
    call sub_100108ad
    pop ebx
    ret
    push edx
    push ebx
    push 3
    push eax
    call sub_1000cc29
    add esp, 0x10
    mov ebx, eax
    call sub_1000fa63
    neg al
    sbb eax, eax
    and eax, ebx
    pop ebx
    ret
FUN_10010ab0 ENDP
END