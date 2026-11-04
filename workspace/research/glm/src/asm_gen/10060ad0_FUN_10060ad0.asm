; FUN_10060ad0 @ 0x10060ad0 — auto-synthesized
.CODE
FUN_10060ad0 PROC
    cmp byte ptr [eax], 0
    mov edx, eax
    je L0
    push esi
    mov cl, byte ptr [edx]
    movsx esi, cl
    cmp esi, 0x41
    jl L1
    cmp esi, 0x5a
    jg L1
    add cl, 0x20
    mov byte ptr [edx], cl
    mov cl, byte ptr [edx + 1]
    inc edx
    test cl, cl
    jne L2
    pop esi
    ret
FUN_10060ad0 ENDP
END