; _free @ 0x100f84d0 — auto-synthesized
    EXTRN g_1076ac94:DWORD
    EXTRN g_1076ac98:DWORD
    sub_100f854e PROTO C
    sub_100f8589 PROTO C
    sub_100fb61c PROTO C
    sub_100fc00a PROTO C
    sub_100fc0a0 PROTO C
    sub_101011d9 PROTO C
    sub_10101213 PROTO C
.CODE
_free PROC
    push 0xc
    push 0x1017c6a0
    call sub_100fb61c
    mov esi, dword ptr [ebp + 8]
    test esi, esi
    je sub_100f854e
    cmp dword ptr [g_1076ac98], 3
    jne L0
    push 4
    call sub_100fc0a0
    pop ecx
    and dword ptr [ebp - 4], 0
    push esi
    call sub_101011d9
    pop ecx
    mov dword ptr [ebp - 0x1c], eax
    test eax, eax
    je L1
    push esi
    push eax
    call sub_10101213
    pop ecx
    pop ecx
    or dword ptr [ebp - 4], 0xffffffff
    call L2
    cmp dword ptr [ebp - 0x1c], 0
    jne sub_100f8589
    push dword ptr [ebp + 8]
    jmp L3
    push 4
    call sub_100fc00a
    pop ecx
    ret
    push esi
    push 0
    push dword ptr [g_1076ac94]
_free ENDP
END