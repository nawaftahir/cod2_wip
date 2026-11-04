; FUN_1006512c @ 0x1006512c — auto-synthesized
    sub_100f787c PROTO C
.CODE
FUN_1006512c PROC
    mov edi, edi
    push esi
    mov esi, dword ptr [ecx + 0xc]
    test esi, esi
    je L0
    mov ecx, esi
    call L1
    push esi
    call sub_100f787c
    pop ecx
    pop esi
    ret
FUN_1006512c ENDP
END