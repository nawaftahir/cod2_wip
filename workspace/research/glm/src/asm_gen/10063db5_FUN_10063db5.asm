; FUN_10063db5 @ 0x10063db5 — auto-synthesized
    sub_100f787c PROTO C
.CODE
FUN_10063db5 PROC
    mov edi, edi
    push esi
    mov esi, dword ptr [ecx + 4]
    test esi, esi
    je L0
    mov ecx, esi
    call L1
    push esi
    call sub_100f787c
    pop ecx
    pop esi
    ret
FUN_10063db5 ENDP
END