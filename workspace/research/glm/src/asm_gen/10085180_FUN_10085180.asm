; FUN_10085180 @ 0x10085180 — auto-synthesized
    sub_100827cc PROTO C
.CODE
FUN_10085180 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi
    push 0x12
    mov ebx, ecx
    call sub_100827cc
    mov esi, dword ptr [ebp + 8]
    mov eax, dword ptr [ebp + 0xc]
    push 8
    mov dword ptr [ebx], 0x101103e0
    pop ecx
    lea edi, [ebx + 0x10]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov dword ptr [ebx + 0x30], eax
    mov eax, dword ptr [ebp + 0x10]
    mov dword ptr [ebx + 0x34], eax
    mov eax, dword ptr [ebp + 0x14]
    mov dword ptr [ebx + 0x38], eax
    xor eax, eax
    mov dword ptr [ebx + 0x3c], eax
    mov dword ptr [ebx + 0x40], eax
    mov dword ptr [ebx + 0x54], eax
    mov dword ptr [ebx + 0x58], eax
    lea edi, [ebx + 0x44]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    pop edi
    pop esi
    mov eax, ebx
    pop ebx
    pop ebp
    ret 0x10
FUN_10085180 ENDP
END