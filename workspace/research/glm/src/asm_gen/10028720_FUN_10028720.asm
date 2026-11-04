; FUN_10028720 @ 0x10028720 — auto-synthesized
.CODE
FUN_10028720 PROC
    push ebp
    mov ebp, dword ptr [esp + 8]
    push edi
    push esi
    call ebp
    add esp, 8
    test al, al
    je L0
    mov edx, dword ptr [edi]
    mov eax, dword ptr [esi]
    mov ecx, dword ptr [esi + 4]
    mov dword ptr [esi], edx
    mov edx, dword ptr [edi + 4]
    mov dword ptr [esi + 4], edx
    mov dword ptr [edi], eax
    mov dword ptr [edi + 4], ecx
    push esi
    push ebx
    call ebp
    add esp, 8
    test al, al
    je L1
    mov edx, dword ptr [esi]
    mov eax, dword ptr [ebx]
    mov ecx, dword ptr [ebx + 4]
    mov dword ptr [ebx], edx
    mov edx, dword ptr [esi + 4]
    mov dword ptr [ebx + 4], edx
    mov dword ptr [esi], eax
    mov dword ptr [esi + 4], ecx
    push edi
    push esi
    call ebp
    add esp, 8
    test al, al
    pop ebp
    je L2
    mov edx, dword ptr [edi]
    mov eax, dword ptr [esi]
    mov ecx, dword ptr [esi + 4]
    mov dword ptr [esi], edx
    mov edx, dword ptr [edi + 4]
    mov dword ptr [esi + 4], edx
    mov dword ptr [edi], eax
    mov dword ptr [edi + 4], ecx
    ret
FUN_10028720 ENDP
END