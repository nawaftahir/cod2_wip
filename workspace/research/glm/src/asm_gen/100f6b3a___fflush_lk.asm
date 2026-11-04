; __fflush_lk @ 0x100f6b3a — auto-synthesized
    sub_100f6ae8 PROTO C
    sub_100fbe79 PROTO C
.CODE
__fflush_lk PROC
    push esi
    mov esi, dword ptr [esp + 8]
    push esi
    call sub_100f6ae8
    test eax, eax
    pop ecx
    je L0
    or eax, 0xffffffff
    pop esi
    ret
    test byte ptr [esi + 0xd], 0x40
    je L1
    push dword ptr [esi + 0x10]
    call sub_100fbe79
    pop ecx
    neg eax
    sbb eax, eax
    pop esi
    ret
    xor eax, eax
    pop esi
    ret
__fflush_lk ENDP
END