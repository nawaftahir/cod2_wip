; FUN_10064315 @ 0x10064315 — auto-synthesized
    sub_10067c80 PROTO C
.CODE
FUN_10064315 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 0x268]
    mov eax, dword ptr [eax + 0x38]
    xor edx, edx
    cmp eax, edx
    jne L0
    push 0x1010c690
    push 0x5e4
    jmp L1
    cmp dword ptr [eax + 8], edx
    je L2
    push 0x1010c66c
    push 0x5e9
    lea eax, [esi + 0x278]
    push eax
    lea eax, [esi + 0x18]
    push eax
    call sub_10067c80
    add esp, 0x10
    mov dword ptr [esi + 0x44], 1
    mov eax, 0x80004005
    jmp L3
    cmp dword ptr [ebp + 8], edx
    je L4
    cmp dword ptr [eax], edx
    jne L4
    cmp dword ptr [eax + 4], edx
    je L4
    xor ecx, ecx
    inc ecx
    jmp L5
    xor ecx, ecx
    cmp dword ptr [ebp + 8], edx
    mov dword ptr [esi + 0x54], ecx
    je L6
    mov dword ptr [eax], 1
    xor eax, eax
    pop esi
    pop ebp
    ret 4
FUN_10064315 ENDP
END