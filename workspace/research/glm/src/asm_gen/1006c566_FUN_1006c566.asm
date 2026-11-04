; FUN_1006c566 @ 0x1006c566 — auto-synthesized
.CODE
FUN_1006c566 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov ecx, dword ptr [ebp + 0xc]
    test ecx, ecx
    jbe L0
    push edi
    mov edi, dword ptr [ebp + 8]
    or eax, 0xffffffff
    rep stosd dword ptr es:[edi], eax
    pop edi
    xor eax, eax
    pop ebp
    ret 8
FUN_1006c566 ENDP
END