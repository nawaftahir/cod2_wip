; FUN_100b2c55 @ 0x100b2c55 — auto-synthesized
    sub_100c8d16 PROTO C
.CODE
FUN_100b2c55 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push edi
    mov edx, ecx
    push 8
    pop ecx
    xor eax, eax
    lea edi, [edx + 0x1f8]
    rep stosd dword ptr es:[edi], eax
    lea edi, [edx + 0x218]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    pop edi
    mov ecx, edx
    pop ebp
    jmp sub_100c8d16
FUN_100b2c55 ENDP
END