; FUN_1007e18e @ 0x1007e18e — auto-synthesized
.CODE
FUN_1007e18e PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov ecx, dword ptr [ebp + 0x10]
    cmp ecx, 4
    jbe L0
    xor eax, eax
    jmp L1
    mov eax, dword ptr [ebp + 0xc]
    mov edx, eax
    shr edx, 2
    and eax, 3
    lea eax, [ecx + eax*4]
    mov ecx, dword ptr [ebp + 8]
    mov ecx, dword ptr [ecx + edx*4]
    mov eax, dword ptr [ecx + eax*4]
    pop ebp
    ret 0xc
FUN_1007e18e ENDP
END