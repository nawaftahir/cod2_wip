; FUN_1007e079 @ 0x1007e079 — auto-synthesized
.CODE
FUN_1007e079 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov ecx, dword ptr [ebp + 0x10]
    cmp ecx, 1
    ja L0
    mov eax, dword ptr [ebp + 0x14]
    cmp eax, 4
    ja L0
    mov edx, dword ptr [ebp + 0xc]
    add edx, ecx
    mov ecx, dword ptr [ebp + 8]
    lea eax, [eax + edx*4]
    mov eax, dword ptr [ecx + eax*4]
    jmp L1
    xor eax, eax
    pop ebp
    ret 0x10
FUN_1007e079 ENDP
END