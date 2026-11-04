; FUN_1006a896 @ 0x1006a896 — auto-synthesized
    sub_1006a70c PROTO C
    sub_1006a714 PROTO C
    sub_1006a71c PROTO C
    sub_1006a724 PROTO C
    sub_1006a72c PROTO C
.CODE
FUN_1006a896 PROC
    mov edi, edi
    push esi
    mov esi, ecx
    lea ecx, [esi + 0x70]
    call sub_1006a70c
    lea ecx, [esi + 0x54]
    call sub_1006a714
    lea ecx, [esi + 0x38]
    call sub_1006a71c
    lea ecx, [esi + 0x1c]
    call sub_1006a724
    mov ecx, esi
    pop esi
    jmp sub_1006a72c
FUN_1006a896 ENDP
END