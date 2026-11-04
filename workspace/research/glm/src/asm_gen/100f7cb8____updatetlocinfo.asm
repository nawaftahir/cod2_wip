; ___updatetlocinfo @ 0x100f7cb8 — auto-synthesized
    sub_100f7ac3 PROTO C
    sub_100f7d13 PROTO C
    sub_100fb61c PROTO C
    sub_100fb67c PROTO C
    sub_100fc090 PROTO C
.CODE
___updatetlocinfo PROC
    push 0xc
    push 0x1017c680
    call sub_100fb61c
    push 0xc
    call sub_100fc090
    pop ecx
    and dword ptr [ebp - 4], 0
    call sub_100f7ac3
    mov dword ptr [ebp - 0x1c], eax
    or dword ptr [ebp - 4], 0xffffffff
    call sub_100f7d13
    mov eax, dword ptr [ebp - 0x1c]
    call sub_100fb67c
    ret
___updatetlocinfo ENDP
END