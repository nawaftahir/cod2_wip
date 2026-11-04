; FUN_1007e1e2 @ 0x1007e1e2 — auto-synthesized
.CODE
FUN_1007e1e2 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov ecx, dword ptr [ebp + 0x10]
    cmp ecx, 4
    ja L0
    mov eax, dword ptr [ebp + 0x14]
    cmp eax, 4
    ja L0
    mov edx, dword ptr [ebp + 0xc]
    lea eax, [eax + edx*4]
    lea eax, [ecx + eax*4]
    mov ecx, dword ptr [ebp + 8]
    mov eax, dword ptr [ecx + eax*4]
    jmp L1
    xor eax, eax
    pop ebp
    ret 0x10
FUN_1007e1e2 ENDP
END