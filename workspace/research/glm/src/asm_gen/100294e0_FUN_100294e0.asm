; FUN_100294e0 @ 0x100294e0 — auto-synthesized
    sub_10020f4c PROTO C
    sub_10020f8a PROTO C
.CODE
FUN_100294e0 PROC
    push esi
    mov esi, eax
    imul eax, eax, 7
    add eax, edx
    mov eax, dword ptr [eax*4 + 0x10696c48]
    cmp eax, -1
    je L0
    push eax
    call sub_10020f8a
    add esp, 4
    imul esi, esi, 0x1c
    cmp dword ptr [esi + 0x10696c58], -1
    je L1
    mov eax, 1
    pop esi
    ret
    mov byte ptr [esi + 0x10696c40], 1
    call sub_10020f4c
    mov dword ptr [esi + 0x10696c58], eax
    xor eax, eax
    pop esi
    ret
FUN_100294e0 ENDP
END