.686
.MODEL FLAT, C
.CODE
FUN_10047510 PROC
    push ebp
    mov ebp, dword ptr [esp + 8]
    push edi
    xor ecx, ecx
    xor edi, edi
    cmp edx, 4
    jg L2
    cmp edx, edi
    mov dword ptr [eax], edx
    jle L1
    push esi
    lea esi, [eax + 4]
    lea esp, [esp]
L0:
    mov dword ptr [esi], ecx
    inc ecx
    add esi, 4
    cmp ecx, edx
    jl L0
    pop esi
L1:
    mov dword ptr [eax + 24], edi
    mov dword ptr [eax + 20], edi
    mov dword ptr [eax + 28], ebp
    pop edi
    mov dword ptr [eax + 32], ebx
    add eax, 36
    pop ebp
    ret
L2:
    cmp edx, edi
    jle L4
L3:
    mov dword ptr [eax + 4], ecx
    mov dword ptr [eax], 1
    mov dword ptr [eax + 20], edi
    mov dword ptr [eax + 24], edi
    mov dword ptr [eax + 28], ebp
    mov dword ptr [eax + 32], ebx
    add eax, 36
    inc ecx
    cmp ecx, edx
    jl L3
L4:
    pop edi
    pop ebp
    ret
FUN_10047510 ENDP
END
