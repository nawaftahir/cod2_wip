; FUN_10063a5c @ 0x10063a5c — auto-synthesized
    sub_100f787c PROTO C
.CODE
FUN_10063a5c PROC
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
FUN_10063a5c ENDP
END