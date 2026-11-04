; _CPtoLCID @ 0x10106c9b — auto-synthesized
.CODE
_CPtoLCID PROC
    sub eax, 0x3a4
    je L0
    sub eax, 4
    je L1
    sub eax, 0xd
    je L2
    dec eax
    je L3
    xor eax, eax
    ret
    mov eax, 0x404
    ret
    mov eax, 0x412
    ret
    mov eax, 0x804
    ret
    mov eax, 0x411
    ret
_CPtoLCID ENDP
END