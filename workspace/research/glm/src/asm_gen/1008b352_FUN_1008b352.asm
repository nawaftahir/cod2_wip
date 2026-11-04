; FUN_1008b352 @ 0x1008b352 — auto-synthesized
    sub_1008b1c8 PROTO C
.CODE
FUN_1008b352 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov ecx, dword ptr [ebp + 8]
    push esi
    push dword ptr [ebp + 0x10]
    mov esi, dword ptr [ebp + 0xc]
    push esi
    call sub_1008b1c8
    test eax, eax
    jne L0
    cmp esi, dword ptr [ebp + 8]
    jbe L1
    or eax, 0xffffffff
    jmp L0
    sbb eax, eax
    neg eax
    pop esi
    pop ebp
    ret 0xc
FUN_1008b352 ENDP
END