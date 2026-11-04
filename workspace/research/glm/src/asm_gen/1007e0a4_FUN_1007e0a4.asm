; FUN_1007e0a4 @ 0x1007e0a4 — auto-synthesized
.CODE
FUN_1007e0a4 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 0x10]
    cmp eax, 4
    jbe L0
    xor eax, eax
    jmp L1
    mov ecx, dword ptr [ebp + 0xc]
    lea eax, [eax + ecx*4]
    mov ecx, dword ptr [ebp + 8]
    mov eax, dword ptr [ecx + eax*4]
    pop ebp
    ret 0xc
FUN_1007e0a4 ENDP
END