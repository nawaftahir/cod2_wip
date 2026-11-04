; FUN_1006c418 @ 0x1006c418 — auto-synthesized
    sub_100853bc PROTO C
    sub_1008585a PROTO C
.CODE
FUN_1006c418 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, ecx
    call sub_100853bc
    test byte ptr [ebp + 8], 1
    je L0
    push esi
    call sub_1008585a
    mov eax, esi
    pop esi
    pop ebp
    ret 4
FUN_1006c418 ENDP
END