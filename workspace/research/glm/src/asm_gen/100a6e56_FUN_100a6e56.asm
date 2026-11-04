; FUN_100a6e56 @ 0x100a6e56 — auto-synthesized
    sub_100c5131 PROTO C
.CODE
FUN_100a6e56 PROC
    mov edi, edi
    push esi
    push edi
    mov esi, ecx
    call sub_100c5131
    or dword ptr [esi + 0x43c], 0xffffffff
    xor edx, edx
    push 0x10
    pop ecx
    xor eax, eax
    lea edi, [esi + 0x2c4]
    mov dword ptr [esi], 0x10116ac0
    mov dword ptr [esi + 0x22c], edx
    mov dword ptr [esi + 0x230], edx
    mov dword ptr [esi + 0x448], edx
    mov dword ptr [esi + 0x2b4], edx
    mov dword ptr [esi + 0x2b8], edx
    mov dword ptr [esi + 0x2c0], edx
    mov dword ptr [esi + 0x2bc], edx
    rep stosd dword ptr es:[edi], eax
    pop edi
    mov dword ptr [esi + 0x404], edx
    mov eax, esi
    pop esi
    ret
FUN_100a6e56 ENDP
END