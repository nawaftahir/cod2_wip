; FUN_10064c94 @ 0x10064c94 — auto-synthesized
.CODE
FUN_10064c94 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov edx, dword ptr [ebp + 8]
    test edx, edx
    mov eax, 0x632d80f
    je L0
    mov cl, byte ptr [edx]
    test cl, cl
    je L0
    imul eax, eax, 0x13
    movsx ecx, cl
    add eax, ecx
    inc edx
    mov cl, byte ptr [edx]
    test cl, cl
    jne L1
    push 0x7f
    xor edx, edx
    pop ecx
    div ecx
    mov eax, edx
    jmp L2
    xor eax, eax
    pop ebp
    ret 4
FUN_10064c94 ENDP
END