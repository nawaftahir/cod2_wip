; FUN_1006a6ff @ 0x1006a6ff — auto-synthesized
    sub_1006a6e2 PROTO C
.CODE
FUN_1006a6ff PROC
    mov edi, edi
    push esi
    push edi
    mov edi, ecx
    xor esi, esi
    mov ecx, dword ptr [edi + esi*4]
    test ecx, ecx
    je L0
    push 1
    call sub_1006a6e2
    inc esi
    cmp esi, 7
    jb L1
    pop edi
    pop esi
    ret
FUN_1006a6ff ENDP
END