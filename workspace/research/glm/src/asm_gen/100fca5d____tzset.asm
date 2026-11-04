; ___tzset @ 0x100fca5d — auto-synthesized
    EXTRN g_101adfdc:DWORD
    sub_100fb61c PROTO C
    sub_100fb68d PROTO C
    sub_100fc09a PROTO C
    sub_100fc4a4 PROTO C
    sub_100fcadd PROTO C
.CODE
___tzset PROC
    push 8
    push 0x1017c930
    call sub_100fb61c
    xor esi, esi
    cmp dword ptr [g_101adfdc], esi
    jne L0
    push 6
    call sub_100fc09a
    pop ecx
    mov dword ptr [ebp - 4], esi
    cmp dword ptr [g_101adfdc], esi
    jne L1
    call sub_100fc4a4
    inc dword ptr [g_101adfdc]
    or dword ptr [ebp - 4], 0xffffffff
    call sub_100fcadd
    call sub_100fb68d
    ret
___tzset ENDP
END