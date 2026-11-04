; FUN_1004bca0 @ 0x1004bca0 — auto-synthesized
.CODE
FUN_1004bca0 PROC
    push ecx
    mov eax, dword ptr [esp + 8]
    push ebp
    mov ebp, dword ptr [eax + 0x2c]
    push edi
    mov edi, dword ptr [eax + 0x64]
    mov eax, dword ptr [esp + 0x20]
    dec eax
    mov dword ptr [esp + 8], edi
    js L0
    mov edx, dword ptr [esp + 0x18]
    shl edx, 2
    inc eax
    push ebx
    mov dword ptr [esp + 0x14], eax
    push esi
    xor esi, esi
    test ebp, ebp
    jle L1
    lea esp, [esp]
    mov eax, dword ptr [esp + 0x1c]
    mov ecx, dword ptr [eax + esi*4]
    mov eax, dword ptr [esp + 0x24]
    mov eax, dword ptr [eax]
    mov ecx, dword ptr [edx + ecx]
    add eax, esi
    test edi, edi
    jbe L2
    mov bl, byte ptr [ecx]
    mov byte ptr [eax], bl
    inc ecx
    add eax, ebp
    dec edi
    jne L3
    mov edi, dword ptr [esp + 0x10]
    inc esi
    cmp esi, ebp
    jl L4
    mov ecx, dword ptr [esp + 0x24]
    mov eax, dword ptr [esp + 0x18]
    add ecx, 4
    add edx, 4
    dec eax
    mov dword ptr [esp + 0x24], ecx
    mov dword ptr [esp + 0x18], eax
    jne L5
    pop esi
    pop ebx
    pop edi
    pop ebp
    pop ecx
    ret
FUN_1004bca0 ENDP
END