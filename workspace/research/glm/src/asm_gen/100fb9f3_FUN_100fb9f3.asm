; FUN_100fb9f3 @ 0x100fb9f3 — auto-synthesized
    sub_100fb61c PROTO C
.CODE
FUN_100fb9f3 PROC
    push 0xc
    push 0x1017c870
    call sub_100fb61c
    and dword ptr [ebp - 0x1c], 0
    and dword ptr [ebp - 4], 0
    movapd xmm0, xmm1
    mov dword ptr [ebp - 0x1c], 1
    jmp L0
    xor eax, eax
    inc eax
    ret
    mov esp, dword ptr [ebp - 0x18]
    or dword ptr [ebp - 4], 0xffffffff
FUN_100fb9f3 ENDP
END