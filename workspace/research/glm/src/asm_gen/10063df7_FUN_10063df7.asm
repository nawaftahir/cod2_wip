; FUN_10063df7 @ 0x10063df7 — auto-synthesized
    sub_100f787c PROTO C
.CODE
FUN_10063df7 PROC
    mov edi, edi
    push esi
    mov esi, dword ptr [ecx + 0x28]
    test esi, esi
    je L0
    mov ecx, esi
    call L1
    push esi
    call sub_100f787c
    pop ecx
    pop esi
    ret
FUN_10063df7 ENDP
END