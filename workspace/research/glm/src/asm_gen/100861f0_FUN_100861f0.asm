; FUN_100861f0 @ 0x100861f0 — auto-synthesized
    sub_10085e24 PROTO C
    sub_10085e52 PROTO C
    sub_100cb942 PROTO C
    sub_100cb9a2 PROTO C
    sub_100f787a PROTO C
.CODE
FUN_100861f0 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push edi
    push 0x34
    mov edi, ecx
    call sub_100f787a
    test eax, eax
    pop ecx
    je L0
    mov ecx, eax
    call sub_100cb942
    mov esi, eax
    jmp L1
    xor esi, esi
    test esi, esi
    je L2
    push dword ptr [ebp + 8]
    mov ecx, esi
    call sub_100cb9a2
    test eax, eax
    jge L3
    push 1
    mov ecx, esi
    call sub_10085e24
    or eax, 0xffffffff
    jmp L4
    push esi
    mov ecx, edi
    call sub_10085e52
    pop edi
    pop esi
    pop ebp
    ret 4
FUN_100861f0 ENDP
END