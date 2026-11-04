; FUN_10086199 @ 0x10086199 — auto-synthesized
    sub_1006c45c PROTO C
    sub_10085394 PROTO C
    sub_10085824 PROTO C
    sub_10085896 PROTO C
    sub_10086077 PROTO C
.CODE
FUN_10086199 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push edi
    push 0x74
    mov edi, ecx
    call sub_10085824
    test eax, eax
    je L0
    mov ecx, eax
    call sub_10085394
    mov esi, eax
    jmp L1
    xor esi, esi
    test esi, esi
    je L2
    push 0
    push dword ptr [ebp + 0x10]
    mov ecx, esi
    push dword ptr [ebp + 0xc]
    push dword ptr [ebp + 8]
    call sub_10085896
    test eax, eax
    jge L3
    push 1
    mov ecx, esi
    call sub_1006c45c
    or eax, 0xffffffff
    jmp L4
    push esi
    mov ecx, edi
    call sub_10086077
    pop edi
    pop esi
    pop ebp
    ret 0xc
FUN_10086199 ENDP
END