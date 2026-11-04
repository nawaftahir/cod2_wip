; FUN_10083324 @ 0x10083324 — auto-synthesized
    sub_100827c8 PROTO C
.CODE
FUN_10083324 PROC
    mov edi, edi
    push esi
    push edi
    push 0xe
    mov edx, ecx
    call sub_100827c8
    lea esi, [edx + 0x10]
    xor eax, eax
    mov dword ptr [edx], 0x10110068
    mov edi, esi
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    push 8
    pop ecx
    xor eax, eax
    lea edi, [edx + 0x20]
    rep stosd dword ptr es:[edi], eax
    pop edi
    mov dword ptr [esi], 3
    mov eax, edx
    pop esi
    ret
FUN_10083324 ENDP
END