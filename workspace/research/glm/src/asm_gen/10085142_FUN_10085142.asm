; FUN_10085142 @ 0x10085142 — auto-synthesized
    sub_100827c8 PROTO C
.CODE
FUN_10085142 PROC
    mov edi, edi
    push esi
    push edi
    push 0x12
    mov esi, ecx
    call sub_100827c8
    xor eax, eax
    mov dword ptr [esi + 0x30], eax
    mov dword ptr [esi + 0x34], eax
    mov dword ptr [esi + 0x38], eax
    mov dword ptr [esi + 0x3c], eax
    mov dword ptr [esi + 0x40], eax
    mov dword ptr [esi + 0x54], eax
    mov dword ptr [esi + 0x58], eax
    mov dword ptr [esi], 0x101103e0
    push 8
    pop ecx
    lea edi, [esi + 0x10]
    rep stosd dword ptr es:[edi], eax
    lea edi, [esi + 0x44]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    pop edi
    mov eax, esi
    pop esi
    ret
FUN_10085142 ENDP
END