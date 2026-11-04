; FUN_100cb5b2 @ 0x100cb5b2 — auto-synthesized
    sub_100c4d3e PROTO C
    sub_100c98c2 PROTO C
.CODE
FUN_100cb5b2 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    push esi
    push 0x1b
    mov esi, ecx
    call sub_100c98c2
    test eax, eax
    jl L0
    mov eax, dword ptr [esi]
    and dword ptr [ebp - 4], 0
    push edi
    push 0
    mov edi, 0xe40000
    push edi
    push 0xf0000800
    mov ecx, esi
    call dword ptr [eax + 0x68]
    test eax, eax
    jl L1
    mov edx, dword ptr [esi + 0x14]
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 8]
    push ecx
    lea ecx, [ebp - 4]
    push ecx
    mov ecx, dword ptr [esi + 0x100]
    mov ecx, dword ptr [ecx + 8]
    mov ecx, dword ptr [ecx]
    push dword ptr [edx + ecx*4]
    mov ecx, esi
    call dword ptr [eax + 0x74]
    test eax, eax
    jl L1
    push dword ptr [ebp - 8]
    mov eax, dword ptr [esi]
    push edi
    push dword ptr [ebp - 4]
    mov ecx, esi
    call dword ptr [eax + 0x68]
    test eax, eax
    jl L1
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x60]
    test eax, eax
    jl L1
    mov ecx, esi
    call sub_100c4d3e
    test eax, eax
    jl L1
    xor eax, eax
    pop edi
    pop esi
    leave
    ret
FUN_100cb5b2 ENDP
END