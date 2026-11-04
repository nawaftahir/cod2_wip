; FUN_10067460 @ 0x10067460 — auto-synthesized
    sub_100f787a PROTO C
    sub_100f788a PROTO C
    sub_100f7892 PROTO C
.CODE
FUN_10067460 PROC
    mov edi, edi
    push esi
    mov esi, ecx
    cmp dword ptr [esi], 0
    je L0
    push edi
    mov eax, dword ptr [esi]
    mov edi, dword ptr [eax]
    push eax
    call sub_100f787a
    test edi, edi
    pop ecx
    mov dword ptr [esi], edi
    jne L1
    pop edi
    push dword ptr [esi + 0x18]
    call sub_100f788a
    push dword ptr [esi + 0x1c]
    call sub_100f7892
    pop ecx
    pop ecx
    pop esi
    ret
FUN_10067460 ENDP
END