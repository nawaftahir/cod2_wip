; FUN_10015570 @ 0x10015570 — auto-synthesized
.CODE
FUN_10015570 PROC
    mov edx, dword ptr [ecx]
    xor eax, eax
    test edx, edx
    push ebx
    jle L0
    lea esp, [esp]
    cmp dword ptr [esi + eax*4], edi
    je L1
    mov ebx, dword ptr [ecx]
    inc eax
    cmp eax, ebx
    jl L2
    mov dword ptr [esi + edx*4], edi
    inc dword ptr [ecx]
    pop ebx
    ret
FUN_10015570 ENDP
END