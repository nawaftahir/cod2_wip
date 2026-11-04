; __shift @ 0x100fe4fd — auto-synthesized
    sub_100f67b8 PROTO C
    sub_100fa20d PROTO C
.CODE
__shift PROC
    test edi, edi
    push esi
    mov esi, eax
    je L0
    push esi
    call sub_100fa20d
    inc eax
    push eax
    push esi
    add esi, edi
    push esi
    call sub_100f67b8
    add esp, 0x10
    pop esi
    ret
__shift ENDP
END