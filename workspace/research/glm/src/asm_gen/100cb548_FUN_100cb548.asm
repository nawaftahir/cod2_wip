; FUN_100cb548 @ 0x100cb548 — auto-synthesized
    sub_100c4d25 PROTO C
    sub_100c98c2 PROTO C
.CODE
FUN_100cb548 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    push esi
    push 0x26
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
    push dword ptr [ebp - 4]
    mov eax, dword ptr [esi]
    push 0xe40000
    push dword ptr [ebp - 8]
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
    call sub_100c4d25
    test eax, eax
    jl L0
    xor eax, eax
    pop esi
    leave
    ret
FUN_100cb548 ENDP
END