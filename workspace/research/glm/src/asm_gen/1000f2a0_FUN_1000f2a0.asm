; FUN_1000f2a0 @ 0x1000f2a0 — auto-synthesized
    sub_10061ca9 PROTO C
    sub_10061cbd PROTO C
.CODE
FUN_1000f2a0 PROC
    cmp byte ptr [eax], 0x49
    jne L0
    cmp byte ptr [eax + 1], 0x57
    jne L0
    cmp byte ptr [eax + 2], 0x69
    jne L0
    mov al, byte ptr [eax + 3]
    cmp al, 5
    je L1
    movzx eax, al
    push 5
    push eax
    push ecx
    push 0x10193974
    call sub_10061ca9
    add esp, 0x10
    xor al, al
    ret
    mov al, 1
    ret
    push ecx
    push 0x101939b0
    call sub_10061cbd
    add esp, 8
    xor al, al
    ret
FUN_1000f2a0 ENDP
END