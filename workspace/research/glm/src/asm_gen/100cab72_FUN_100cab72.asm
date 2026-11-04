; FUN_100cab72 @ 0x100cab72 — auto-synthesized
    sub_100c4d33 PROTO C
    sub_100c98c2 PROTO C
.CODE
FUN_100cab72 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    push esi
    push 0x28
    mov esi, ecx
    call sub_100c98c2
    test eax, eax
    jl L0
    mov edx, dword ptr [esi + 0x14]
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 4]
    push ecx
    lea ecx, [ebp - 8]
    push ecx
    mov ecx, dword ptr [esi + 0x100]
    mov ecx, dword ptr [ecx + 8]
    mov ecx, dword ptr [ecx]
    push dword ptr [edx + ecx*4]
    mov ecx, esi
    call dword ptr [eax + 0x74]
    test eax, eax
    jl L0
    mov ecx, dword ptr [ebp + 8]
    push dword ptr [ebp - 4]
    mov eax, dword ptr [esi]
    neg ecx
    sbb ecx, ecx
    and ecx, 0xd000000
    or ecx, dword ptr [ebp - 8]
    push 0xe40000
    push ecx
    mov ecx, esi
    call dword ptr [eax + 0x68]
    test eax, eax
    jl L0
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x60]
    test eax, eax
    jl L0
    mov ecx, esi
    call sub_100c4d33
    test eax, eax
    jl L0
    xor eax, eax
    pop esi
    leave
    ret 4
FUN_100cab72 ENDP
END