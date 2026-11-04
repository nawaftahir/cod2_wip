; FUN_10082948 @ 0x10082948 — auto-synthesized
    sub_100827ec PROTO C
    sub_1008282a PROTO C
    sub_10082839 PROTO C
.CODE
FUN_10082948 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    push edi
    mov esi, ecx
    call sub_100827ec
    test eax, eax
    jne L0
    xor eax, eax
    jmp L1
    mov eax, dword ptr [esi + 0x10]
    cmp eax, dword ptr [edi + 0x10]
    jne L2
    mov eax, dword ptr [esi + 0x14]
    cmp eax, dword ptr [edi + 0x14]
    jne L2
    push dword ptr [edi + 8]
    push dword ptr [esi + 8]
    call sub_1008282a
    test eax, eax
    je L2
    push dword ptr [edi + 0xc]
    push dword ptr [esi + 0xc]
    call sub_10082839
    neg eax
    sbb eax, eax
    neg eax
    pop edi
    pop esi
    pop ebp
    ret 4
FUN_10082948 ENDP
END