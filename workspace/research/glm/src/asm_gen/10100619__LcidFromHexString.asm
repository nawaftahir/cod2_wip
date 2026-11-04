; _LcidFromHexString @ 0x10100619 — auto-synthesized
.CODE
_LcidFromHexString PROC
    xor eax, eax
    jmp L0
    inc edx
    cmp cl, 0x61
    jl L1
    cmp cl, 0x66
    jg L1
    add cl, 0xd9
    jmp L2
    cmp cl, 0x41
    jl L2
    cmp cl, 0x46
    jg L2
    add cl, 0xf9
    add eax, 0xffffffd
    movsx ecx, cl
    shl eax, 4
    add eax, ecx
    mov cl, byte ptr [edx]
    test cl, cl
    jne L3
    ret
_LcidFromHexString ENDP
END