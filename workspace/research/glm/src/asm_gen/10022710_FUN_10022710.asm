; FUN_10022710 @ 0x10022710 — auto-synthesized
    sub_10060cbb PROTO C
.CODE
FUN_10022710 PROC
    lea eax, [ecx - 0x15]
    cmp eax, 0x3b
    ja L0
    movzx eax, byte ptr [eax + 0x10022780]
    jmp dword ptr [eax*4 + 0x10022760]
    mov eax, 0x10196c6c
    ret
    mov eax, 0x10196c5c
    ret
    mov eax, 0x10196c3c
    ret
    mov eax, 0x10196c1c
    ret
    mov eax, 0x10196bfc
    ret
    mov eax, 0x10196bdc
    ret
    mov eax, 0x10196bbc
    ret
    push ecx
    push 0x10196ba4
    call sub_10060cbb
    add esp, 8
    ret
FUN_10022710 ENDP
END