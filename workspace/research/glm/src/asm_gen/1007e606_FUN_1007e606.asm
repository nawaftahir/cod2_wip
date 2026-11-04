; FUN_1007e606 @ 0x1007e606 — auto-synthesized
.CODE
FUN_1007e606 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    cmp dword ptr [ebp + 0x18], 0
    jbe L0
    mov eax, dword ptr [ebp + 0x14]
    mov ecx, dword ptr [ebp + 0x10]
    push esi
    mov esi, dword ptr [ebp + 0x18]
    sub ecx, eax
    xor edx, edx
    cmp dword ptr [ecx + eax], edx
    setne dl
    mov dword ptr [eax], edx
    add eax, 4
    dec esi
    jne L1
    pop esi
    push dword ptr [ebp + 0x18]
    mov eax, dword ptr [ebp + 8]
    push dword ptr [ebp + 0x10]
    mov ecx, dword ptr [eax]
    push dword ptr [ebp + 0xc]
    push eax
    call dword ptr [ecx + 0x1c4]
    pop ebp
    ret 0x14
FUN_1007e606 ENDP
END