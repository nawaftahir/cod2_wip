; FUN_1006b268 @ 0x1006b268 — auto-synthesized
    sub_1006a6e8 PROTO C
    sub_100f7871 PROTO C
.CODE
FUN_1006b268 PROC
    mov edi, edi
    push esi
    mov esi, ecx
    push dword ptr [esi]
    call sub_100f7871
    pop ecx
    mov ecx, dword ptr [esi + 0x20]
    test ecx, ecx
    pop esi
    je L0
    push 1
    call sub_1006a6e8
    ret
FUN_1006b268 ENDP
END