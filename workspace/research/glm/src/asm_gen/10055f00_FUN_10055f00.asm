; FUN_10055f00 @ 0x10055f00 — auto-synthesized
.CODE
FUN_10055f00 PROC
    sub esp, 0x10
    mov ecx, dword ptr [esp + 0x14]
    mov eax, dword ptr [ecx + 0x1b0]
    mov eax, dword ptr [eax + 0x18]
    mov edx, dword ptr [eax + 4]
    push esi
    mov esi, dword ptr [ecx + 0x64]
    push edi
    mov edi, dword ptr [eax]
    mov eax, dword ptr [eax + 8]
    mov dword ptr [esp + 0xc], eax
    mov eax, dword ptr [esp + 0x28]
    test eax, eax
    mov dword ptr [esp + 8], edx
    mov dword ptr [esp + 0x10], esi
    jle L0
    mov ecx, dword ptr [esp + 0x24]
    push ebx
    mov ebx, dword ptr [esp + 0x24]
    sub ebx, ecx
    push ebp
    mov dword ptr [esp + 0x24], ecx
    mov dword ptr [esp + 0x1c], ebx
    mov dword ptr [esp + 0x30], eax
    lea esp, [esp]
    test esi, esi
    mov eax, dword ptr [ebx + ecx]
    mov edx, dword ptr [ecx]
    jbe L1
    lea esp, [esp]
    movzx ecx, byte ptr [eax]
    movzx ebx, byte ptr [eax + 1]
    mov ebp, dword ptr [esp + 0x10]
    movzx ebx, byte ptr [ebx + ebp]
    movzx ecx, byte ptr [ecx + edi]
    mov ebp, dword ptr [esp + 0x14]
    inc eax
    add ecx, ebx
    movzx ebx, byte ptr [eax + 1]
    movzx ebx, byte ptr [ebx + ebp]
    inc eax
    add ecx, ebx
    inc eax
    mov byte ptr [edx], cl
    inc edx
    dec esi
    jne L2
    mov esi, dword ptr [esp + 0x18]
    mov ecx, dword ptr [esp + 0x24]
    mov ebx, dword ptr [esp + 0x1c]
    mov eax, dword ptr [esp + 0x30]
    add ecx, 4
    dec eax
    mov dword ptr [esp + 0x24], ecx
    mov dword ptr [esp + 0x30], eax
    jne L3
    pop ebp
    pop ebx
    pop edi
    pop esi
    add esp, 0x10
    ret
FUN_10055f00 ENDP
END