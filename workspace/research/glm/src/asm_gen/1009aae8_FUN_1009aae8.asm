; FUN_1009aae8 @ 0x1009aae8 — auto-synthesized
    sub_10099599 PROTO C
    sub_10099707 PROTO C
.CODE
FUN_1009aae8 PROC
    mov edi, edi
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 0x10]
    test eax, eax
    jne L0
    push 0x101149b4
    push eax
    push eax
    push esi
    call sub_10099599
    add esp, 0x10
    mov eax, 0x80004005
    pop esi
    ret
    cmp dword ptr [eax + 0x10], 4
    push edi
    jne L1
    mov ecx, dword ptr [eax + 0x20]
    test ecx, ecx
    je L1
    cmp dword ptr [ecx + 0x10], 4
    je L1
    lea edi, [eax + 0x18]
    jmp L2
    mov eax, dword ptr [eax + 8]
    mov dword ptr [eax + 0x2c], 1
    mov eax, dword ptr [edi]
    push dword ptr [eax + 8]
    mov eax, dword ptr [esi + 0x10]
    push dword ptr [eax + 0x20]
    mov ecx, esi
    call sub_10099707
    test eax, eax
    jl L3
    mov edi, dword ptr [edi]
    add edi, 0xc
    mov eax, dword ptr [edi]
    test eax, eax
    jne L4
    mov eax, dword ptr [esi + 0x10]
    mov eax, dword ptr [eax + 0x20]
    mov eax, dword ptr [eax + 0x18]
    mov dword ptr [edi], eax
    mov eax, dword ptr [esi + 0x10]
    mov ecx, dword ptr [eax + 0x20]
    mov eax, dword ptr [eax + 0x18]
    mov dword ptr [ecx + 0x18], eax
    mov eax, dword ptr [esi + 0x10]
    and dword ptr [eax + 0x18], 0
    mov eax, dword ptr [esi + 0x10]
    mov ecx, dword ptr [eax + 0x20]
    mov dword ptr [esi + 0x10], ecx
    and dword ptr [eax + 0x20], 0
    xor eax, eax
    pop edi
    pop esi
    ret
FUN_1009aae8 ENDP
END