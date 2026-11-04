; __cfltcvt @ 0x100fe7cc — auto-synthesized
    sub_100fe614 PROTO C
    sub_100fe6f3 PROTO C
    sub_100fe76b PROTO C
.CODE
__cfltcvt PROC
    push ebp
    mov ebp, esp
    cmp dword ptr [ebp + 0x10], 0x65
    je L0
    cmp dword ptr [ebp + 0x10], 0x45
    je L0
    cmp dword ptr [ebp + 0x10], 0x66
    jne L1
    push dword ptr [ebp + 0x14]
    push dword ptr [ebp + 0xc]
    push dword ptr [ebp + 8]
    call sub_100fe6f3
    add esp, 0xc
    pop ebp
    ret
    push dword ptr [ebp + 0x18]
    push dword ptr [ebp + 0x14]
    push dword ptr [ebp + 0xc]
    push dword ptr [ebp + 8]
    call sub_100fe76b
    jmp L2
    push dword ptr [ebp + 0x18]
    push dword ptr [ebp + 0x14]
    push dword ptr [ebp + 0xc]
    push dword ptr [ebp + 8]
    call sub_100fe614
    add esp, 0x10
    pop ebp
    ret
__cfltcvt ENDP
END