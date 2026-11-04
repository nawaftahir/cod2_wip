; _GetPrimaryLen @ 0x1010064e — auto-synthesized
.CODE
_GetPrimaryLen PROC
    xor eax, eax
    mov cl, byte ptr [edx]
    inc edx
    cmp cl, 0x41
    jl L0
    cmp cl, 0x5a
    jle L1
    cmp cl, 0x61
    jl L2
    cmp cl, 0x7a
    jg L2
    inc eax
    jmp L3
    ret
_GetPrimaryLen ENDP
END