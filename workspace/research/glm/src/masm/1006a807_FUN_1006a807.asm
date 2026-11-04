.686
.MODEL FLAT, C
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
    lea edi, [edx + 28]
    rep stosd dword ptr es:[edi], eax
    mov ecx, esi
    lea edi, [edx + 56]
    rep stosd dword ptr es:[edi], eax
    mov ecx, esi
    lea edi, [edx + 84]
    rep stosd dword ptr es:[edi], eax
    mov ecx, esi
    mov esi, dword ptr [ebp + 8]
    cmp esi, 4
    lea edi, [edx + 112]
    rep stosd dword ptr es:[edi], eax
    lea ecx, [edx + 0000000B0h]
    mov dword ptr [edx + 00000008Ch], eax
    mov dword ptr [edx + 000000090h], eax
    mov dword ptr [edx + 000000094h], eax
    mov dword ptr [edx + 000000098h], eax
    mov dword ptr [edx + 0000000ACh], eax
    mov dword ptr [edx + 00000009Ch], eax
    mov dword ptr [edx + 0000000A0h], eax
    mov dword ptr [edx + 0000000A4h], eax
    mov dword ptr [edx + 0000000A8h], eax
    mov dword ptr [edx + 0000000B4h], esi
    mov dword ptr [ecx], eax
    jl L0
    cmp esi, 5
    jg L0
    mov dword ptr [ecx], 1
L0:
    pop edi
    mov eax, edx
    pop esi
    pop ebp
    ret 4
FUN_1006a807 ENDP
END
