; FUN_1006a807 @ 0x1006a807 — auto-synthesized
.CODE
FUN_1006a807 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov edx, ecx
    xor eax, eax
    push esi
    push edi
    push 7
    pop esi
    mov ecx, esi
    mov edi, edx
    rep stosd dword ptr es:[edi], eax
    mov ecx, esi
    lea edi, [edx + 0x1c]
    rep stosd dword ptr es:[edi], eax
    mov ecx, esi
    lea edi, [edx + 0x38]
    rep stosd dword ptr es:[edi], eax
    mov ecx, esi
    lea edi, [edx + 0x54]
    rep stosd dword ptr es:[edi], eax
    mov ecx, esi
    mov esi, dword ptr [ebp + 8]
    cmp esi, 4
    lea edi, [edx + 0x70]
    rep stosd dword ptr es:[edi], eax
    lea ecx, [edx + 0xb0]
    mov dword ptr [edx + 0x8c], eax
    mov dword ptr [edx + 0x90], eax
    mov dword ptr [edx + 0x94], eax
    mov dword ptr [edx + 0x98], eax
    mov dword ptr [edx + 0xac], eax
    mov dword ptr [edx + 0x9c], eax
    mov dword ptr [edx + 0xa0], eax
    mov dword ptr [edx + 0xa4], eax
    mov dword ptr [edx + 0xa8], eax
    mov dword ptr [edx + 0xb4], esi
    mov dword ptr [ecx], eax
    jl L0
    cmp esi, 5
    jg L0
    mov dword ptr [ecx], 1
    pop edi
    mov eax, edx
    pop esi
    pop ebp
    ret 4
FUN_1006a807 ENDP
END