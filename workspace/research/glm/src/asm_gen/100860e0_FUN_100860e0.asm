; FUN_100860e0 @ 0x100860e0 — auto-synthesized
    sub_10085e2d PROTO C
    sub_10085e5b PROTO C
    sub_100cb942 PROTO C
    sub_100cb963 PROTO C
    sub_100f787a PROTO C
.CODE
FUN_100860e0 PROC
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
    push dword ptr [ebp + 0x14]
    mov ecx, esi
    push dword ptr [ebp + 0x10]
    push dword ptr [ebp + 0xc]
    push dword ptr [ebp + 8]
    call sub_100cb963
    test eax, eax
    jge L3
    push 1
    mov ecx, esi
    call sub_10085e2d
    or eax, 0xffffffff
    jmp L4
    push esi
    mov ecx, edi
    call sub_10085e5b
    pop edi
    pop esi
    pop ebp
    ret 0x10
FUN_100860e0 ENDP
END