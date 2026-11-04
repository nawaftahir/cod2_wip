; FUN_10010680 @ 0x10010680 — auto-synthesized
    sub_10010184 PROTO C
    sub_100f883a PROTO C
.CODE
FUN_10010680 PROC
    mov eax, 0x6000
    call sub_100f883a
    mov eax, dword ptr [esp + 0x6004]
    push 0x100104a0
    push eax
    push 0x20
    lea ecx, [esp + 0xc]
    push ecx
    push edx
    call sub_10010184
    add esp, 0x6014
    ret
FUN_10010680 ENDP
END