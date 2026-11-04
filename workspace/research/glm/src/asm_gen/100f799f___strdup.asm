; __strdup @ 0x100f799f — auto-synthesized
    sub_100fa20f PROTO C
    sub_100fc47a PROTO C
    sub_100fe8b3 PROTO C
.CODE
__strdup PROC
    push esi
    mov esi, dword ptr [esp + 8]
    test esi, esi
    je L0
    push esi
    call sub_100fa20f
    inc eax
    push eax
    call sub_100fc47a
    test eax, eax
    pop ecx
    pop ecx
    je L0
    push esi
    push eax
    call sub_100fe8b3
    pop ecx
    pop ecx
    pop esi
    ret
    xor eax, eax
    pop esi
    ret
__strdup ENDP
END