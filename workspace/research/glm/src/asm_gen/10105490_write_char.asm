; write_char @ 0x10105490 — auto-synthesized
    sub_10108b14 PROTO C
.CODE
write_char PROC
    test byte ptr [eax + 0xc], 0x40
    je L0
    cmp dword ptr [eax + 8], 0
    je L1
    push eax
    push dword ptr [esp + 8]
    call sub_10108b14
    cmp ax, 0xffff
    pop ecx
    pop ecx
    jne L1
    or dword ptr [esi], 0xffffffff
    ret
    inc dword ptr [esi]
    ret
write_char ENDP
END