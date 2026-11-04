; FUN_10064392 @ 0x10064392 — auto-synthesized
    sub_10067c7d PROTO C
.CODE
FUN_10064392 PROC
    mov edi, edi
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 0x268]
    mov eax, dword ptr [eax + 0x38]
    xor edx, edx
    cmp eax, edx
    jne L0
    push 0x1010c6c8
    push 0x5e5
    jmp L1
    cmp dword ptr [eax + 8], edx
    je L2
    push 0x1010c6a4
    push 0x5ea
    lea eax, [esi + 0x278]
    push eax
    lea eax, [esi + 0x18]
    push eax
    call sub_10067c7d
    add esp, 0x10
    mov dword ptr [esi + 0x44], 1
    mov eax, 0x80004005
    pop esi
    ret
    xor ecx, ecx
    inc ecx
    cmp dword ptr [eax], edx
    jne L3
    cmp dword ptr [eax + 4], edx
    je L3
    mov edx, ecx
    mov dword ptr [esi + 0x54], edx
    mov dword ptr [eax], ecx
    mov dword ptr [eax + 8], ecx
    xor eax, eax
    pop esi
    ret
FUN_10064392 ENDP
END