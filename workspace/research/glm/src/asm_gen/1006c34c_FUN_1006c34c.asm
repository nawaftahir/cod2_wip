; FUN_1006c34c @ 0x1006c34c — auto-synthesized
.CODE
FUN_1006c34c PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    cmp eax, dword ptr [ecx + 4]
    jae L0
    mov ecx, dword ptr [ecx + 0x10]
    mov eax, dword ptr [ecx + eax*4]
    jmp L1
    xor eax, eax
    pop ebp
    ret 4
FUN_1006c34c ENDP
END