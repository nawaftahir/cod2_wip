; FUN_1006db35 @ 0x1006db35 — auto-synthesized
    sub_10085c01 PROTO C
    sub_10085dbc PROTO C
.CODE
FUN_1006db35 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, ecx
    call sub_10085c01
    test byte ptr [ebp + 8], 1
    je L0
    push esi
    call sub_10085dbc
    mov eax, esi
    pop esi
    pop ebp
    ret 4
FUN_1006db35 ENDP
END