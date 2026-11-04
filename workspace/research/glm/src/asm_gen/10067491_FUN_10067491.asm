; FUN_10067491 @ 0x10067491 — auto-synthesized
.CODE
FUN_10067491 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    cmp eax, 4
    jbe L0
    mov eax, 0x80004005
    jmp L1
    mov dword ptr [ecx + 0x10], eax
    xor eax, eax
    pop ebp
    ret 4
FUN_10067491 ENDP
END