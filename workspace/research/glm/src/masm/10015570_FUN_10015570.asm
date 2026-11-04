.686
.MODEL FLAT, C
.CODE
FUN_10015570 PROC
    mov edx, dword ptr [ecx]
    xor eax, eax
    test edx, edx
    push ebx
    jle L1
    lea esp, [esp]
L0:
    cmp dword ptr [esi + eax*4], edi
    je L2
    mov ebx, dword ptr [ecx]
    inc eax
    cmp eax, ebx
    jl L0
L1:
    mov dword ptr [esi + edx*4], edi
    inc dword ptr [ecx]
L2:
    pop ebx
    ret
FUN_10015570 ENDP
END
