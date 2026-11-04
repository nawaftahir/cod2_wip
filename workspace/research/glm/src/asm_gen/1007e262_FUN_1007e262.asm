; FUN_1007e262 @ 0x1007e262 — auto-synthesized
.CODE
FUN_1007e262 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov ecx, dword ptr [ebp + 0x10]
    cmp ecx, 4
    ja L0
    mov eax, dword ptr [ebp + 0x14]
    cmp eax, 4
    ja L0
    mov edx, dword ptr [ebp + 8]
    lea eax, [ecx + eax*4]
    mov ecx, dword ptr [ebp + 0xc]
    mov ecx, dword ptr [edx + ecx*4]
    mov eax, dword ptr [ecx + eax*4]
    jmp L1
    xor eax, eax
    pop ebp
    ret 0x10
FUN_1007e262 ENDP
END